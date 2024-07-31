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
PHX.REVISION	= "31.07.24" --Format: dd/mm/yy.

--Include Languages
PHX.LANGUAGES = {}

-- ////////////////// Verbose Message ////////////////// --
local verbHelp="Enable more detailed and verbose messages when Prop Hunt: X2Z is running."
local MsgErrorLevel = {
	{ "[INFO]", 	color_white },
	{ "[WARN]", 	Color(246,246,2) },
	{ "[ALERT]", 	Color(248,151,25) },
	{ "[ERROR]", 	Color(235,43,36) },
	{ "[FATAL]", 	Color(208,24,24) }
}
local maxMsgErrorLevel = #MsgErrorLevel
local ErrorKeys = table.GetKeys( MsgErrorLevel )

CreateConVar( "phx_verbose", "0", FCVAR_ARCHIVE, verbHelp, 0, maxMsgErrorLevel )
function PHX:VerboseMsg( text, level )
	if !level then level = 1 end
	level = math.Clamp( level, 1, maxMsgErrorLevel )
	local VerboseLevel = GetConVar("phx_verbose"):GetInt()
	
	if VerboseLevel > 0 and text then
		if ErrorKeys[level] >= VerboseLevel then
			local lv = MsgErrorLevel[ level ]
			local realm = Color(231,219,116)
			if SERVER then realm = Color(137,222,255); end

			MsgC( color_white, "[PHX]", lv[2], lv[1] .. " ", realm, text .."\n" )
		end
	end
end

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

-- Can also internally used for CalcView but you can use anywhere in serverside realm.
function GM.ViewCam.CamColEnabled( self, origin, ang, trace, traceStart, traceEnd, distMin, distMax, distNorm, entHullz )
	
    -- don't allow 0.
    if (!entHullz or entHullz == nil) then entHullz = self.cHullz end
    if !trace or trace == nil then trace = {} end
    
	if entHullz < self.cHullzMins then
		trace[traceStart] 	= origin + Vector(0, 0, entHullz + (self.cHullzMins - entHullz))
		trace[traceEnd] 	= origin + Vector(0, 0, entHullz + (self.cHullzMins - entHullz)) + (ang:Forward() * distMin)
	elseif entHullz > self.cHullzMaxs then
		trace[traceStart] 	= origin + Vector(0, 0, entHullz - self.cHullzMaxs)
		trace[traceEnd] 	= origin + Vector(0, 0, entHullz - self.cHullzMaxs) + (ang:Forward() * distMax)
	else
		trace[traceStart] 	= origin + Vector(0, 0, self.cHullzLow)
		trace[traceEnd] 	= origin + Vector(0, 0, self.cHullzLow) + (ang:Forward() * distNorm)
	end
	
	return trace
end

-- Internally used for CalcView.
function GM.ViewCam.CamColDisabled( self, origin, ang, trace, traceStart, distMin, distMax, distNorm, entHullz )

    -- don't allow 0.
    if (!entHullz or entHullz == nil) then entHullz = self.cHullz end
    if !trace or trace == nil then trace = {} end
	
	if entHullz < self.cHullzMins then
		trace[traceStart] = origin + Vector(0, 0, entHullz + (self.cHullzMins - entHullz)) + (ang:Forward() * distMin)
	elseif entHullz > self.cHullzMaxs then
		trace[traceStart] = origin + Vector(0, 0, entHullz - self.cHullzMaxs) + (ang:Forward() * distMax)
	else
		trace[traceStart] = origin + Vector(0, 0, self.cHullzLow) + (ang:Forward() * distNorm)
	end

	return trace
    
end

-- Use this to get a common value instead of using CamColEnabled()
function GM.ViewCam.CommonCamCollEnabledView( self, origin, angles, entZ )
    if (!entZ and entZ == nil) then entZ = self.cHullz end

    local trace = {}
      trace = self:CamColEnabled( origin, angles, trace, "start", "endpos", 100, 300, 100, entZ )
      
    return trace
end

-- Used for Hunters.
function GM.ViewCam.Hunter3pCollEnabled( self, isduck, origin, angles, forward, right, up )
    local trace = {}
    
    if !forward or forward == nil then forward = 50 end
    if !right or right == nil then right = 0 end
    if !up or up == nil then up = 0 end
	if isduck == nil then isduck = false end
    
    trace.start = origin
    trace.endpos = origin - (angles:Forward()*forward) + (angles:Right()*right) + (angles:Up()*up)
    trace.filter = player.GetAll()
	trace.maxs = Vector(4,4,4)
	trace.mins = trace.maxs*-1
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

--Add Alias for NewSoundDuration()
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
include("enhancedplus/sh_enhancedplus.lua")
include("config/sh_init.lua")
include("sh_config.lua")
include("sh_player.lua")
include("sh_chatbox.lua")
include("sh_tauntscanner.lua")

-- MapVote
PHX.MV = {}
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

-- Update
AddCSLuaFile("sh_httpupdates.lua")
include("sh_httpupdates.lua")

-- Plugins and other modules

local _,folder = file.Find(engine.ActiveGamemode() .. "/gamemode/plugins/*", "LUA")
for _,plugfolder in SortedPairs( folder ) do
	PHX:VerboseMsg("[Plugins Init] Loading plugin: "..plugfolder)
	AddCSLuaFile("plugins/" .. plugfolder .. "/sh_load.lua")
	include("plugins/" .. plugfolder .. "/sh_load.lua")
end

function PHX:SetBlindStatus( bool )
	bool = tobool(bool)
	SetGlobalBool("PHX.BlindStatus", bool)
end
function PHX:IsBlindStatus()
	return GetGlobalBool("PHX.BlindStatus", false)
end

if SERVER then
	
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
		for _,ply in pairs( player.GetAll() ) do
		
			local txt = self:SVTranslate( ply, strID, ... )
			f( ply, txt )

		end
	end
end

local strteam = {}
strteam[TEAM_CONNECTING] 	= "PHX_TEAM_CONNECTING"
strteam[TEAM_HUNTERS]		= "PHX_TEAM_HUNTERS"
strteam[TEAM_PROPS]			= "PHX_TEAM_PROPS"
strteam[TEAM_UNASSIGNED]	= "PHX_TEAM_UNASSIGNED"
strteam[TEAM_SPECTATOR]		= "PHX_TEAM_SPECTATOR"
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
--[[ function PHX.TranslateName( self, teamID, ply )
	local strID = strteam[teamID]
	
	if SERVER then	-- self:F/Translate() DON'T EXIST on Serverside!
		-- Note: DO NOT use this on expensive operations on Think, PlayerTick, and other hooks.
		-- You  have been warned!
		if self:GetCVar( "ph_use_lang" ) then
			local lang = self:GetCVar( "ph_force_lang" )			
			if self.LANGUAGES[lang] and self.LANGUAGES[lang] ~= nil and
				self.LANGUAGES[lang][ strID ] and 
				self.LANGUAGES[lang][ strID ] ~= nil then
				teamID = self.LANGUAGES[lang][ strID ]
			else
				teamID = self.LANGUAGES["en_us"][ strID ]
			end
		else
			if ply and IsValid(ply) then
				local clLang = ply:GetInfo("ph_cl_language")
				if self.LANGUAGES[clLang] and self.LANGUAGES[clLang] ~= nil and
					self.LANGUAGES[clLang][ strID ] and 
					self.LANGUAGES[clLang][ strID ] ~= nil then
					teamID = self.LANGUAGES[clLang][ strID ]
				end
			else
				teamID = self.LANGUAGES["en_us"][ strID ]
			end
		end
		
		return teamID
	else
		local txt = self:FTranslate( strID )
		if !txt or txt == nil then
			teamID = team.GetName( teamID )
		else
			teamID = txt
		end
		
		return teamID
	end
end ]]

--[[ END OF SHARED INIT HEADERS ]]--

local getloadedgamemodes = engine.GetGamemodes()
for _,data in ipairs(getloadedgamemodes) do
	if (data.name) and (string.find(data.name, "fretta")) then
		MsgN("------------!! WARNING: DEFAULT FRETTA: [".. data.name .."] HAS DETECTED - THIS MAY CAUSE PH:X TO STOP WORKING !!------------")
		MsgN("Unless if you use other gamemode that is still using fretta, ignore this message but this wont guarantee to make PH:X to work.")
		MsgN("------------!! Please uninstall any gamemodes/Other Prop Hunt Version that uses fretta otherwise use this gamemode at your own risk! !!------------")
		ErrorNoHalt("Prop Hunt X2Z Warning - Please check console for more info!")
	end
end

DeriveGamemode("base_phx")
IncludePlayerClasses()

-- Information about the gamemode
GM.Name		= PHX.TITLE
GM.Author	= "Wolvindra-Vinzuerio & D4UNKN0WNM4N"

-- Versioning
GM._VERSION		= PHX.VERSION
GM.REVISION		= PHX.REVISION --dd/mm/yy.
GM.DONATEURL 	= "https://ko-fi.com/wolvindra"

-- Update information - returns json only
GM.UPDATEURL 		= "https://gmodgameservers.com/ph_update_check.php"
GM.UPDATEURLBACKUP 	= "https://raw.githubusercontent.com/Wolvin-NET/prophuntx/master/updates/update.json"

-- unused
GM.Help			= ""

GM.IS_PROPER_PHX_INSTALLED 	= true

-- Fretta configuration
-- Note: NEVER USE PHX:GetCVar() on ANY EARLY VARIABLES or else Settings won't work!
GM.GameLength				= PHX:QCVar( "ph_game_time" ) -- Same as GetConVar but it's a wrapper and quicker version.
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
GM.RoundLimit				= PHX:QCVar( "ph_rounds_per_map" )  -- Tested: Using GetGlobalInt without restarting will mess up round system!
GM.RoundLength 				= PHX:QCVar( "ph_round_time" )      -- Tested: Using GetGlobalInt may serve severe problems including weird timer precision!
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
	if !GAMEMODE.TeamBased then
		return
	end
	
	-- hunters
	team.SetUp(TEAM_HUNTERS, "Hunters", Color(150, 205, 255, 255))
	team.SetSpawnPoint(TEAM_HUNTERS, {"info_player_counterterrorist", "info_player_combine", "info_player_deathmatch", "info_player_axis", "info_player_hunters"})
	team.SetClass(TEAM_HUNTERS, {"Hunter"})

	-- props
	team.SetUp(TEAM_PROPS, "Props", Color(255, 60, 60, 255))
	team.SetSpawnPoint(TEAM_PROPS, {"info_player_terrorist", "info_player_rebel", "info_player_deathmatch", "info_player_allies", "info_player_props"})
	team.SetClass(TEAM_PROPS, {"Prop"})
end

-- Check collisions
local function CheckPropCollision(entA, entB)
	-- Disable prop on prop collisions
	if !PHX:QCVar( "ph_prop_collision" ) && (entA && entB && ((entA:IsPlayer() && entA:Team() == TEAM_PROPS && entB:IsValid() && entB:GetClass() == "ph_prop") || (entB:IsPlayer() && entB:Team() == TEAM_PROPS && entA:IsValid() && entA:GetClass() == "ph_prop"))) then
		return false
	end
	
	-- Disable hunter on hunter collisions so we can allow bullets through them
	if (IsValid(entA) && IsValid(entB) && (entA:IsPlayer() && entA:Team() == TEAM_HUNTERS && entB:IsPlayer() && entB:Team() == TEAM_HUNTERS)) then
		return false
	end
end
hook.Add("ShouldCollide", "CheckPropCollision", CheckPropCollision)

-- Footstep Control
hook.Add( "PlayerFootstep", "PHX_FootstepControls", function( ply )
	if PHX:GetCVar( "ph_props_disable_footstep" ) and ply:Team() == TEAM_PROPS then
		return true
	end
end )

-- External / Internal Plugins
PHX.PLUGINS = {}

function PHX:InitializePlugin()
	
	-- Add Legacy Plugins or Addons, if any.
	local STATE = "SERVER"
	if CLIENT then
		STATE = "CLIENT"
	end
	
	self:VerboseMsg( "[Plugin] Initializing Plugins..." )
	for name,plugin in pairs( list.Get("PHX.Plugins") ) do
		if (self.PLUGINS[name] ~= nil) then
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
			self:VerboseMsg( string.format("[PHX Plugin] No %s Plugins Loaded...", STATE) )
		end
	end)
end
-- Initialize Plugins
hook.Add("Initialize", "PHX.LoadPlugins", function() -- Origin: PostGamemodeLoaded
	PHX:InitializePlugin()
end)
hook.Add("OnReloaded", "PHX.ReLoadPlugins", function()
	PHX:InitializePlugin()
end)

if CLIENT then	
	hook.Add("PH_CustomTabMenu", "PHX.NewPlugins", function(tab, pVgui, paintPanelFunc)
		--local tabW,tabH = tab:GetWide(),tab:GetTall()
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