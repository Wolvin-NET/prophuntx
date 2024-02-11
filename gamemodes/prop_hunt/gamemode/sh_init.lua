--[[

( This License Applies to all files writen in "fretta" and "prop_hunt" gamemode directories )

You are free to use, copy, modify, contribute, distribute, or make profit (server or community) when using the Prop Hunt: X/X2Z Gamemode ("SOFTWARE") as long as it stated exclusively and made only available for Garry's Mod.
Any changes or modification you have made publicly on Steam Workshop must include this license OR a link back to this GitHub Repository Page/Official Website in your credits page.
You are, however, not permitted to:
- Selling the source codes.
- Using, copying, alter (porting) the source codes other than "Garry's Mod" game without permission.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

]]--

PHX = PHX or {}
PHX.TITLE = "Prop Hunt: X2Z"

TEAM_HUNTERS 	= 1
TEAM_PROPS 	 	= 2
IS_PHX		 	= true	-- an easy check if PHX is installed.

PHX.ConfigPath 	= "phx_data"
PHX.VERSION		= "X2Z"
--PHX.REVISION	= "19.01.24" --Format: dd/mm/yy.
PHX.REVISION	= "DEV_BUILD"
PHX.LANGUAGES	= {}
PHX.PLUGINS		= {}
PHX.MV			= {} -- MapVote

-- Local Variables
local VMax = Vector(4,4,4)
local strteam = {} -- for Serverside TeamName Translation
strteam[TEAM_CONNECTING] 	= "PHX_TEAM_CONNECTING"
strteam[TEAM_HUNTERS]		= "PHX_TEAM_HUNTERS"
strteam[TEAM_PROPS]			= "PHX_TEAM_PROPS"
strteam[TEAM_UNASSIGNED]	= "PHX_TEAM_UNASSIGNED"
strteam[TEAM_SPECTATOR]		= "PHX_TEAM_SPECTATOR"

-- ////////////////// Verbose Message ////////////////// --
local verbHelp="Enable more detailed and verbose messages when Prop Hunt: X2Z is running."
local MsgErrorLevel = {
	{ "[INFO]", 	color_white },
	{ "[WARN]", 	Color(246,246,2) },
	{ "[ALERT]", 	Color(248,151,25) },
	{ "[ERROR]", 	Color(235,43,36) },
	{ "[!FATAL]", 	Color(208,24,24) }
}
local maxMsgErrorLevel = #MsgErrorLevel
local ErrorKeys = table.GetKeys( MsgErrorLevel )

local cvVerbose = CreateConVar( "phx_verbose", "0", FCVAR_ARCHIVE, verbHelp, 0, maxMsgErrorLevel )
function PHX:VerboseMsg( text, level )
	if !level then level = 1 end
	level = math.Clamp( level, 1, maxMsgErrorLevel )
	local VerboseLevel = cvVerbose:GetInt()
	
	if VerboseLevel > 0 and text then
		if ErrorKeys[level] >= VerboseLevel then
			local lv = MsgErrorLevel[ level ]
			local realm = Color(231,219,116)
			if SERVER then realm = Color(137,222,255); end

			MsgC( color_white, "[PHX]", lv[2], lv[1] .. " ", realm, text .."\n" )
		end
	end
end
-- ////////////////// Verbose Message ////////////////// --

--[[ BEGIN OF SHARED INIT HEADERS ]]--

-- Add important stuffs
AddCSLuaFile("cl_fonts.lua")
AddCSLuaFile("sh_utils.lua")
AddCSLuaFile("sh_convar.lua")
include("sh_utils.lua")
include("sh_convar.lua")

-- Global Trace ViewControl for Props
GM.ViewCam = {}
-- Vector: Crouch Hull Z (Height) limit
GM.ViewCam.cHullz      = 64    -- Fallback/Default Value.
GM.ViewCam.cHullzMins  = 8     -- Limit Minimums Height in BBox
GM.ViewCam.cHullzMaxs  = 84    -- Limit Maximums Height in BBox
GM.ViewCam.cHullzLow   = 8     -- Clam view to this height.

-- Function to control Props View Zoom.
function GM:StartCommand( ply, cmd )
	if ply:PHIsAlive( TEAM_PROPS ) and cmd:GetMouseWheel() ~= 0 then 
		local delta = cmd:GetMouseWheel()
		ply.DistanceMult = math.Clamp( DistanceMult + delta, 2, 10 )
		print( "scrolled ", delta, ply.DistanceMult )
	end
end

local function CalcCameraView( ply, origin, angles, trace, trStart, trEnd, bUseNegative, OverrideDistance, distNorm )
	if ply and IsValid( ply ) then
		local prop=ply:GetPlayerPropEntity()
		if IsValid(prop) then
			if !ply.distMult then ply.distMult = 2 end
			local Mins,Center,Maxs=prop:OBBMins(),prop:OBBCenter(),prop:OBBMaxs()
			local Hullz	= Center.z - Mins.z
			local Base	= origin + Vector( 0, 0, Hullz )
			trace[trStart]	= Base

			if (trEnd) then -- for Prop Camera Collision Enabled
				local Long	= math.Max( Maxs.x, Maxs.y ) * ply.distMult --ply.distMult * 0.75
				if (OverrideDistance) then Long = distNorm end -- for LPS Prop's POV Weapon Tracer and other meaning.
				if (bUseNegative) then Long = Long * -1 end --negative are for props camera view or any other meaning.
				local Dist		= Base + (angles:Forward() * Long)
				trace[trEnd]	= Dist
			end
			
			return true
		end
	end

	return false
end

-- Can also internally used for CalcView but you can use anywhere in serverside realm.
function GM.ViewCam.CamColEnabled( self, ply, origin, ang, trace, traceStart, traceEnd, bUseNegative, distNorm, entHullz, OverrideDistance )
	
	-- distNorm and entHullz are fallback values if !IsValid(ply)
    if not entHullz then entHullz = self.cHullz end
	entHullz = math.Clamp( entHullz, self.cHullzMins, self.cHullzMaxs )
    if not trace then trace = {} end
    
	--[[ if entHullz < self.cHullzMins then
		trace[traceStart] 	= origin + Vector(0, 0, entHullz + (self.cHullzMins - entHullz))
		trace[traceEnd] 	= origin + Vector(0, 0, entHullz + (self.cHullzMins - entHullz)) + (ang:Forward() * distMin)
	elseif entHullz > self.cHullzMaxs then
		trace[traceStart] 	= origin + Vector(0, 0, entHullz - self.cHullzMaxs)
		trace[traceEnd] 	= origin + Vector(0, 0, entHullz - self.cHullzMaxs) + (ang:Forward() * distMax)
	else
		trace[traceStart] 	= origin + Vector(0, 0, self.cHullzLow)
		trace[traceEnd] 	= origin + Vector(0, 0, self.cHullzLow) + (ang:Forward() * distNorm)
	end ]]
	
	local TraceValid = CalcCameraView( ply, origin, ang, trace, traceStart, traceEnd, bUseNegative, OverrideDistance, distNorm )
	if (TraceValid) then return trace end
	
	if bUseNegative then distNorm = distNorm * -1
	trace[traceStart]	= origin + Vector(0, 0, self.cHullzLow)
	trace[traceEnd]		= origin + Vector(0, 0, self.cHullzLow) + (ang:Forward() * distNorm)
	
	return trace
end

-- Internally used for CalcView.
function GM.ViewCam.CamColDisabled( self, ply, origin, ang, trace, traceStart, bUseNegative, distNorm, entHullz )

    if not entHullz then entHullz = self.cHullz end
	entHullz = math.Clamp( entHullz, self.cHullzMins, self.cHullzMaxs )
    if not trace then trace = {} end
	
	--[[ if entHullz < self.cHullzMins then
		trace[traceStart] = origin + Vector(0, 0, entHullz + (self.cHullzMins - entHullz)) + (ang:Forward() * distMin)
	elseif entHullz > self.cHullzMaxs then
		trace[traceStart] = origin + Vector(0, 0, entHullz - self.cHullzMaxs) + (ang:Forward() * distMax)
	else
		trace[traceStart] = origin + Vector(0, 0, self.cHullzLow) + (ang:Forward() * distNorm)
	end ]]

	local TraceValid = CalcCameraView( ply, origin, ang, trace, traceStart, nil, bUseNegative )
	if (TraceValid) then return trace end

	if bUseNegative then distNorm = distNorm * -1
	trace[traceStart]	= origin + Vector(0, 0, self.cHullzLow) + (ang:Forward() * distNorm)

	return trace
    
end

-- Use this to get a common value instead of using CamColEnabled()
function GM.ViewCam.CommonCamCollEnabledView( self, ply, origin, angles, bUseNegative, entHullz )
    if !entZ then entZ = self.cHullz end
	entHullz = math.Clamp( entHullz, self.cHullzMins, self.cHullzMaxs )

    local trace = {}
    trace = self:CamColEnabled( ply, origin, angles, trace, "start", "endpos", bUseNegative, 100, entHullz )
    return trace
end

-- Used for Hunters.
function GM.ViewCam.Hunter3pCollEnabled( self, pl, origin, angles, forward, right, up )
	if not IsValid(pl) then return end
	if !origin then origin = pl:EyePos() end
	if !angles then angles = pl:EyeAngles() end
	if !forward then forward = 50 end
    if !right then right = 0 end
    if !up then up = 0 end
	
    local trace = {}
	local isduck = pl:Crouching()
    
    trace.start = origin
    trace.endpos = origin - (angles:Forward()*forward) + (angles:Right()*right) + (angles:Up()*up)
    trace.filter = player.GetAll()
	trace.maxs = VMax
	trace.mins = trace.maxs * -1
	if isduck then
		trace.maxs = trace.maxs/2
		trace.mins = trace.mins/2
	end
    
    local tr = util.TraceHull( trace )
    return tr
end

-- Inclusions. Requires absolute path. These does not include plugins!
-- No trailing "/" please on "path" argument.
function PHX:Includes( path, name, isExternal )
    local root = engine.ActiveGamemode() .. "/gamemode/"
    local pathToSearch = root .. path .. "/*.lua"
    local ReqFiles = file.Find(pathToSearch, "LUA")    
    for _,File in SortedPairs( ReqFiles ) do
        PHX:VerboseMsg( string.format( "[Includes] Loading %s: %s", name, File ) )
        
        if (isExternal) then
            local nice = root .. path .. "/" .. File
            AddCSLuaFile(nice)
            include(nice)
        else
            local nice = path .. "/" .. File
            AddCSLuaFile(nice)
            include(nice)
        end
    end
end
PHX:Includes( "langs", "Languages" )
PHX:Includes( "config/lib", "Libraries" )
PHX:Includes( "config/external", "External Lua" )

function PHX:SoundDuration( snd )
	if (NewSoundDuration) then return NewSoundDuration(snd) end
	return -1
end

-- Standard Inclusion
AddCSLuaFile("enhancedplus/sh_enhancedplus.lua")
AddCSLuaFile("cl_lang.lua")
AddCSLuaFile("config/sh_init.lua")
AddCSLuaFile("sh_config.lua")
AddCSLuaFile("sh_player.lua")
AddCSLuaFile("sh_chatbox.lua")
AddCSLuaFile("sh_tauntscanner.lua")
AddCSLuaFile("sh_httpupdates.lua")
include("enhancedplus/sh_enhancedplus.lua")
include("config/sh_init.lua")
include("sh_config.lua")
include("sh_player.lua")
include("sh_chatbox.lua")
include("sh_tauntscanner.lua")
include("sh_httpupdates.lua")

if SERVER then
    AddCSLuaFile("sh_mapvote.lua")
    AddCSLuaFile("mapvote/cl_mapvote.lua")

	include("sh_mapvote.lua")
    include("mapvote/sv_mapvote.lua")
    include("mapvote/rtv.lua")
else
	include("sh_mapvote.lua")
    include("mapvote/cl_mapvote.lua")
end

-- Plugins and other modules
local _,folder = file.Find(engine.ActiveGamemode() .. "/gamemode/plugins/*", "LUA")
for _,plugfolder in SortedPairs( folder ) do
	PHX:VerboseMsg("[Plugins Init] Loading plugin: "..plugfolder)
	AddCSLuaFile("plugins/" .. plugfolder .. "/sh_load.lua")
	include("plugins/" .. plugfolder .. "/sh_load.lua")
end

-- Shared Functions and Helpers
if SERVER then

	function PHX:SetBlindStatus( bool )
		bool = tobool(bool)
		SetGlobalBool("PHX.BlindStatus", bool)
	end

	function PHX:SetupBlindTime()
		local cvHunterTime = PHX:GetCVar( "ph_hunter_blindlock_time" )
		local RoundStartTime = GetGlobalFloat("RoundStartTime",0)
		local time = math.Clamp( cvHunterTime - (CurTime() - RoundStartTime), 0, cvHunterTime )

		SetGlobalInt( "unBlind_Time", time )
	end
	
	-- Server Sided Translation, require Player Entity
	local function GetTranslation(t, ply, strID)
		local str="!error"
		
		if t:GetCVar( "ph_use_lang" ) then
			local lang = t:GetCVar( "ph_force_lang" )
			if (t.LANGUAGES[lang]) and t.LANGUAGES[lang][ strID ] then
				str = t.LANGUAGES[lang][ strID ]
			else
				str = t.LANGUAGES["en_us"][ strID ]
			end
		else
			if ply and IsValid(ply) then
				local clLang = ply:GetInfo("ph_cl_language")
				if (t.LANGUAGES[clLang]) and t.LANGUAGES[clLang][ strID ] then
					str = t.LANGUAGES[clLang][ strID ]
				end
			else
				str = t.LANGUAGES["en_us"][ strID ]
			end
		end

		return str
	end

	function PHX:SVTranslate(ply, strID, ... )
		local str = GetTranslation( self, ply, strID )
		return string.format( str, ... )
	end

	--Get Random Translated
	function PHX:RTranslate( ply, strID )
		local rStr = GetTranslation (self, ply, strID )
		if (rStr) and istable(rStr) and !table.IsEmpty(rStr) then
			return rStr[math.random(1,#rStr)]
		end
		return "error or table=nil"
	end
	
	--Broadcast Translate to All Players
	function PHX:BTranslate(f, strID, ... )
		--Broadcast Translate
		util.AllPlayers( function( ply )
			local txt = self:SVTranslate( ply, strID, ... )
			f( ply, txt )
		end )
	end

end

function PHX:IsBlindStatus()
	return GetGlobalBool("PHX.BlindStatus", false)
end

function PHX:GetUnblindTime()
	return GetGlobalInt("unBlind_Time",0)
end

function PHX:GameInRound()
	if SERVER then
		return GAMEMODE:InRound()
	end
	return GetGlobalBool("InRound",false)
end

function PHX:GetRoundNumber()
	return GetGlobalInt("RoundNumber",0)
end

function PHX:TranslateName( teamID, ply )
	local strID = strteam[teamID]
	
	if SERVER then
		local Translation = self:SVTranslate( ply, strID )
		return Translation
	else
		local txt = self:FTranslate( strID )
		if !txt or txt == nil then
			teamID = team.GetName( teamID )
		else
			teamID = txt
		end
		
		return teamID
	end
end

--[[ END OF SHARED INIT HEADERS ]]--

-- Fretta!
DeriveGamemode("fretta")
IncludePlayerClasses()

-- Information about the gamemode
GM.Name		= PHX.TITLE
GM.Author	= "Wolvindra-Vinzuerio & D4UNKN0WNM4N"

-- Versioning
GM._VERSION		= PHX.VERSION
GM.REVISION		= PHX.REVISION --dd/mm/yy.
GM.DONATEURL 	= "https://ko-fi/wolvindra"

-- Update information - returns json only
GM.UPDATEURL 		= "https://gmodgameservers.com/ph_update_check.php"
GM.UPDATEURLBACKUP 	= "https://raw.githubusercontent.com/Wolvin-NET/prophuntx/master/updates/update.json"

-- unused
GM.Help			= ""

GM.IS_PROPER_PHX_INSTALLED 	= true

-- Fretta configuration
-- Note: NEVER USE PHX:GetCVar() on ANY EARLY VARIABLES or else Settings won't work!
GM.GameLength				= PHX:GetCVar( "ph_game_time" ) -- Same as GetConVar but it's a wrapper and quicker version.
GM.AddFragsToTeamScore		= true
GM.CanOnlySpectateOwnTeam 	= true
GM.ValidSpectatorModes 		= { OBS_MODE_CHASE, OBS_MODE_IN_EYE, OBS_MODE_ROAMING }
GM.Data 					= {}
GM.EnableFreezeCam			= true
GM.NoAutomaticSpawning		= true

GM.NoNonPlayerPlayerDamage	= true
GM.NoPlayerPlayerDamage 	= true
GM.NoPlayerTeamDamage		= true

GM.RoundBased				= true
GM.RoundLimit				= PHX:GetCVar( "ph_rounds_per_map" )
GM.RoundLength 				= PHX:GetCVar( "ph_round_time" )
GM.RoundPreStartTime		= 0
GM.SuicideString			= "dead" -- obsolete
GM.TeamBased 				= true

local mark = utf8.char(9733)
GM.PHXContributors			= {
	"Galaxio "..mark.." (Support+Translation)",
	"Godfather "..mark.." (Support)",
    "Darktooth "..mark.." (Support+Contributor)",
    "Antoine "..mark.." (PH:E+/Plus Contributor)",
    "Fryman (Web & Game Hosting)",
	"Phyremaster (Last Prop Standing)",
	"Berry (Russian Translation)",
	"Ph.X (Chinese Translation)",
	"Trigstur (Dutch Translation)",
	"Galaxio, Haeiven, TR1NITY (French Translation)",
	"Major Nick (German Translation)",
	"KamFretoZ (Indonesian Translation)",
	"So-chiru (Korean Translation)", 
	"Pawelxxdd (Polish Translation)",
	"Clã | BR | The Fire Fuchs (Portuguese/Brazil Translation)",
	"Talha Berkay Akbulut aka Matt (Turkish Translation)",
	"Ryo567, Kurayashi (Spannish Translation)",
	"Dralga (Discord Helper)","@yttoxictripz", "Pascual","Yam","adk","Jonpopnycorn","Thundernerd"
}

-- Called on gamemdoe initialization to create teams
function GM:CreateTeams()
	if not GAMEMODE.TeamBased then return; end
	
	-- hunters
	team.SetUp(TEAM_HUNTERS, "Hunters", Color(150, 205, 255, 255))
	team.SetSpawnPoint( TEAM_HUNTERS, {
		"info_player_hunters",
		"info_player_counterterrorist",
		"info_player_combine",
		"info_player_deathmatch",
		"info_player_axis"
	})
	team.SetClass(TEAM_HUNTERS, {"Hunter"})

	-- props
	team.SetUp(TEAM_PROPS, "Props", Color(255, 60, 60, 255))
	team.SetSpawnPoint( TEAM_PROPS, {
		"info_player_props",
		"info_player_terrorist",
		"info_player_rebel",
		"info_player_deathmatch",
		"info_player_allies"
	})
	team.SetClass(TEAM_PROPS, {"Prop"})

end

-- Check collisions
local PhPropEnt={ ["ph_prop"] = true }
function GM:ShouldCollide( entA, entB )
	-- Disable prop on prop collisions
	local cvPropColl = PHX:GetCVar( "ph_prop_collision" )

	if IsValid(entA) and IsValid(entB) then
		if !cvPropColl and 
			((entA:IsPlayer() and entA:Team() == TEAM_PROPS and PhPropEnt[entB:GetClass()]) or 
			(entB:IsPlayer() and entB:Team() == TEAM_PROPS and PhPropEnt[entA:GetClass()])) then
			return false
		end
		
		-- Disable hunter on hunter collisions so we can allow bullets through them
		if ( (entA:IsPlayer() and entA:Team() == TEAM_HUNTERS and entB:IsPlayer() and entB:Team() == TEAM_HUNTERS) ) then
			return false
		end
	end
	--[[ if !cvPropColl and 
		(entA and entB and 
		(
		(entA:IsPlayer() and entA:Team() == TEAM_PROPS and entB:IsValid() and entB:GetClass() == "ph_prop") or 
		(entB:IsPlayer() and entB:Team() == TEAM_PROPS and entA:IsValid() and entA:GetClass() == "ph_prop")
		)) then
		return false
	end
	
	-- Disable hunter on hunter collisions so we can allow bullets through them
	if (IsValid(entA) && IsValid(entB) && (entA:IsPlayer() && entA:Team() == TEAM_HUNTERS && entB:IsPlayer() && entB:Team() == TEAM_HUNTERS)) then
		return false
	end ]]

	return true
end

-- Footstep Control
function GM:PlayerFootstep( ply )
	if ( IsValid( ply ) and !ply:Alive() ) then return true end
	if PHX:GetCVar( "ph_props_disable_footstep" ) and ply:Team() == TEAM_PROPS then return true end
end

-- External / Internal Plugins
function PHX:InitializePlugin()
	
	local STATE = "SERVER"
	if CLIENT then STATE = "CLIENT"; end
	
	self:VerboseMsg( "[Plugin] Initializing Plugins..." )
	for name,plugin in pairs( list.Get("PHX.Plugins") ) do
		if (self.PLUGINS[name]) then
			self:VerboseMsg("[Plugin] Not adding "..name.." because it was exists in table. Use different name instead!", 3)
		else
			self:VerboseMsg("[Plugin] Adding & Loading Plugin: "..name)
			self.PLUGINS[name] = plugin
		end
	end
	
	timer.Simple(0, function()
		if !table.IsEmpty( self.PLUGINS ) then
			self:VerboseMsg( string.format("[Plugin] --------- Listing loaded %s SIDE plugins ---------", STATE ) )
			for pName,pData in SortedPairs(self.PLUGINS) do
				self:VerboseMsg("[Plugin] Loaded Plugin:"..pName)
				self:VerboseMsg("--> Name: "..pData.name.."\n--> Version: "..pData.version.."\n--> Info: "..pData.info)
			end
		else
			self:VerboseMsg( string.format("[Plugin] No %s Plugins Loaded...", STATE) )
		end
	end)
end
-- Initialize Plugins
hook.Add("Initialize", "PHXHook.LoadPlugins", function()
	PHX:InitializePlugin()
end)
hook.Add("OnReloaded", "PHXHook.ReLoadPlugins", function()
	PHX:InitializePlugin()
end)

if CLIENT then	
	hook.Add("PH_CustomTabMenu", "PHX.NewPlugins", function(tab, pVgui, paintPanelFunc)
		local tabW,tabH = tab.Content:GetWide(),tab.Content:GetTall()
		local main = {}
	
		main.panel = tab:Add("DPanel")
		main.panel:Dock(FILL)
		main.panel:SetBackgroundColor(Color(40,40,40,120))
			
		main.scroll = main.panel:Add("DScrollPanel")
		main.scroll:Dock(FILL)
		
		main.grid = main.scroll:Add("DGrid")
		main.grid:SetPos(10,10)
		main.grid:SetCols(1)
		main.grid:SetColWide( tabW - 16 )
		main.grid:SetRowHeight( tabH * 0.75 )
		
		if table.IsEmpty(PHX.PLUGINS) then
			if ( LocalPlayer():PHXIsStaff() ) then
				local lbl = vgui.Create("DLabel",main.panel)
				lbl:SetPos(40,60)
				lbl:SetText(PHX:FTranslate("PLUGINS_NO_PLUGINS"))
				lbl:SetFont("Trebuchet24")
				lbl:SetTextColor(color_white)
				lbl:SizeToContents()
				
				local but = vgui.Create("DButton",main.panel)
				but:SetPos(40,96)
				but:SetSize(256,40)
				but:SetText(PHX:FTranslate("PLUGINS_BROWSE_MORE"))
				but.DoClick = function() gui.OpenURL( "https://gmodgameservers.com/prophuntx/plugins" ) end
				but:SetIcon("icon16/bricks.png")
			else
				local lbl = vgui.Create("DLabel",main.panel)
				lbl:SetPos(40,60)
				lbl:SetText(PHX:FTranslate("PLUGINS_SERVER_HAS_NO_PLUGINS"))
				lbl:SetFont("Trebuchet24")
				lbl:SetTextColor(color_white)
				lbl:SizeToContents()
			end
		else
			for plName,Data in pairs(PHX.PLUGINS) do
				local section = {}
				local gW,gH = main.grid:GetColWide(),main.grid:GetRowHeight()
				
				section.main = main.grid:Add("DPanel")
				section.main:SetSize(gW-12,gH-24)
				section.main:SetBackgroundColor(Color(20,20,20,150))
				
				section.roll = section.main:Add("DScrollPanel")
				section.roll:SetSize(section.main:GetWide(),section.main:GetTall())
				
				section.grid = section.roll:Add("DGrid")
				section.grid:SetPos(20,20)
				section.grid:SetCols(1)
				section.grid:SetColWide(section.roll:GetWide() + 96)
				section.grid:SetRowHeight(40)
				
				pVgui("","label","PHX.TitleFont",section.grid, { "PLUG_NAME_VER", Data.name, Data.version } )
				pVgui("","label","PHX.MenuCategoryLabel",section.grid, { "PLUG_DESCRIPTION", Data.info } )
				
				if ( LocalPlayer():PHXIsStaff() ) then
					if !table.IsEmpty(Data.settings) then
						pVgui("","label","PHX.MenuCategoryLabel",section.grid, "PLUGINS_SERVER_SETTINGS" )
						for _,val in pairs(Data.settings) do
							pVgui(val[1],val[2],val[3],section.grid,val[4])
						end
					end
				end      
				if !table.IsEmpty(Data.client) then
					pVgui("","label","PHX.MenuCategoryLabel",section.grid, "PLUGINS_CLIENT_SETTINGS" )
					for _,val in pairs(Data.client) do
						pVgui(val[1],val[2],val[3],section.grid,val[4])
					end
				end				
				main.grid:AddItem(section.main)
			end
		end
	
	local PanelModify = tab:AddSheet("", main.panel, "vgui/ph_iconmenu/m_plugins.png")
	paintPanelFunc(PanelModify, PHX:FTranslate("PHXM_TAB_PLUGINS"))
	
	end)
end

-- We don't need some hooks that mostly used from sandbox.
hook.Remove("PlayerTick", "TickWidgets")

--todo: check if this break the clientside effects
if CLIENT then
    hook.Remove("RenderScreenspaceEffects", "RenderColorModify")
    hook.Remove("RenderScreenspaceEffects", "RenderBloom")
    hook.Remove("RenderScreenspaceEffects", "RenderToyTown")
    hook.Remove("RenderScreenspaceEffects", "RenderTexturize")
    hook.Remove("RenderScreenspaceEffects", "RenderSunbeams")
    hook.Remove("RenderScreenspaceEffects", "RenderSobel")
    hook.Remove("RenderScreenspaceEffects", "RenderSharpen")
    hook.Remove("RenderScreenspaceEffects", "RenderMaterialOverlay")
    hook.Remove("RenderScreenspaceEffects", "RenderMotionBlur")
    hook.Remove("RenderScene", "RenderStereoscopy")
    hook.Remove("RenderScene", "RenderSuperDoF")
    hook.Remove("GUIMousePressed", "SuperDOFMouseDown")
    hook.Remove("GUIMouseReleased", "SuperDOFMouseUp")
    hook.Remove("PreventScreenClicks", "SuperDOFPreventClicks")
    hook.Remove("PostRender", "RenderFrameBlend")
    hook.Remove("PreRender", "PreRenderFrameBlend")
    hook.Remove("Think", "DOFThink")
    hook.Remove("RenderScreenspaceEffects", "RenderBokeh")
    hook.Remove("NeedsDepthPass", "NeedsDepthPass_Bokeh")
    hook.Remove("PostDrawEffects", "RenderWidgets")
end