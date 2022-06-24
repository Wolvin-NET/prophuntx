PHX = PHX or {}

-- Utils
function util.IsHexColor( str )

    if str == nil then return false end

    if string.find( str,'^#?%x%x%x%x%x%x$') then
        return true
    end
    return false
    
end

TEAM_HUNTERS 	= 1
TEAM_PROPS 	 	= 2
IS_PHX		 	= true	-- an easy check if PHX is installed.

PHX.ConfigPath 	= "phx_data"
PHX.VERSION		= "X2Z"
PHX.REVISION	= "25.06.22" --Format: dd/mm/yy.

-- Fonts
AddCSLuaFile("cl_fonts.lua")

-- Global Trace ViewControl for Props
GM.ViewCam = {}

-- Vector: Crouch Hull Z (Height) limit
GM.ViewCam.cHullz      = 64    -- Fallback Value. Currently 64 for default value.
GM.ViewCam.cHullzMins  = 24    -- Used for duck: Limit Minimums Height in BBox
GM.ViewCam.cHullzMaxs  = 84    -- Limit Maximum Height in BBox
GM.ViewCam.cHullzLow   = 8     -- Limit everything below this height

-- Can also internally used for CalcView but you can use anywhere in serverside realm.
function GM.ViewCam.CamColEnabled( self, origin, Endpos, trace, traceStart, traceEnd, distMin, distMax, distNorm, entHullz )
	
    -- don't allow 0.
    if (!entHullz or entHullz == nil) then entHullz = self.cHullz end
    if !trace or trace == nil then trace = {} end
    
	if entHullz < self.cHullzMins then
		trace[traceStart] 	= origin + Vector(0, 0, entHullz + (self.cHullzMins - entHullz))
		trace[traceEnd] 	= origin + Vector(0, 0, entHullz + (self.cHullzMins - entHullz)) + (Endpos:Forward() * distMin)
	elseif entHullz > self.cHullzMaxs then
		trace[traceStart] 	= origin + Vector(0, 0, entHullz - self.cHullzMaxs)
		trace[traceEnd] 	= origin + Vector(0, 0, entHullz - self.cHullzMaxs) + (Endpos:Forward() * distMax)
	else
		trace[traceStart] 	= origin + Vector(0, 0, self.cHullzLow)
		trace[traceEnd] 	= origin + Vector(0, 0, self.cHullzLow) + (Endpos:Forward() * distNorm)
	end
	
	return trace
end

-- Internally used for CalcView.
function GM.ViewCam.CamColDisabled( self, origin, Endpos, trace, traceStart, distMin, distMax, distNorm, entHullz )

    -- don't allow 0.
    if (!entHullz or entHullz == nil) then entHullz = self.cHullz end
    if !trace or trace == nil then trace = {} end

	if entHullz < self.cHullzMins then
		trace[traceStart] = origin + Vector(0, 0, entHullz + (self.cHullzMins - entHullz)) + (Endpos:Forward() * distMin)
	elseif entHullz > self.cHullzMaxs then
		trace[traceStart] = origin + Vector(0, 0, entHullz - self.cHullzMaxs) + (Endpos:Forward() * distMax)
	else
		trace[traceStart] = origin + Vector(0, 0, self.cHullzLow) + (Endpos:Forward() * distNorm)
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

-- Inclusions. These exclude plugins!
-- Do not end with "/"
function PHX:Includes( path, name, isExternal )
    local root = engine.ActiveGamemode() .. "/gamemode/"
    local pathToSearch = root .. path .. "/*.lua"
    local ReqFiles = file.Find(pathToSearch, "LUA")    
    for _,File in SortedPairs( ReqFiles ) do
        PHX.VerboseMsg( string.format( "[PHX] [%s] Loading %s: %s", name:upper(), name, File ) )
        
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

-- Init Convars first!
AddCSLuaFile("sh_convar.lua")
include("sh_convar.lua")

function PHX.VerboseMsg( text )
	-- Very stupid checks: PHX:GetCVar() will only sets after 1st player is joined. This is intentional
	-- because Loading PHX:GetCVar() too early (outside initialization hook) will only load it's default value
	-- followed by GetGlobal* value. This problem was noticed on TTT here: 
	-- https://github.com/Facepunch/garrysmod/blob/be251723824643351cb88a969818425d1ddf42b3/garrysmod/gamemodes/terrortown/gamemode/init.lua#L235
	if SERVER then
		if GetConVar("ph_print_verbose"):GetBool() and text then
			print( text )
		end
	else
		-- BUGS: This somehow works on client *AFTER* map changes, but occasionally not working in some cases (e.g: Early Hook Calls)
		-- Can't do anything about this atm...
		if PHX:GetCVar( "ph_print_verbose" ) and text then
			print( text )
		end
	end
end

--Include Languages
PHX.LANGUAGES = {}

PHX:Includes( "langs", "Languages" )
PHX:Includes( "config/lib", "Libraries" )
PHX:Includes( "config/external", "External Lua" )

--Add Alias for NewSoundDuration()
function PHX:SoundDuration( snd )
    return NewSoundDuration( snd )
end

-- Standard Inclusion
AddCSLuaFile("cl_lang.lua")
AddCSLuaFile("config/sh_init.lua")
AddCSLuaFile("sh_drive_prop.lua")
AddCSLuaFile("ulx/modules/sh/sh_phx_mapvote.lua")
AddCSLuaFile("sh_config.lua")
AddCSLuaFile("sh_player.lua")
AddCSLuaFile("sh_chatbox.lua")
AddCSLuaFile("sh_tauntscanner.lua")
include("config/sh_init.lua")
include("sh_drive_prop.lua")
include("ulx/modules/sh/sh_phx_mapvote.lua")
include("sh_config.lua")
include("sh_player.lua")
include("sh_chatbox.lua")
include("sh_tauntscanner.lua")

-- MapVote
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
	PHX.VerboseMsg("[PHX] [PLUGINS] Loading plugin: ".. plugfolder)
	AddCSLuaFile("plugins/" .. plugfolder .. "/sh_load.lua")
	include("plugins/" .. plugfolder .. "/sh_load.lua")
end

local strteam = {}
strteam[TEAM_CONNECTING] 	= "PHX_TEAM_CONNECTING"
strteam[TEAM_HUNTERS]		= "PHX_TEAM_HUNTERS"
strteam[TEAM_PROPS]			= "PHX_TEAM_PROPS"
strteam[TEAM_UNASSIGNED]	= "PHX_TEAM_UNASSIGNED"
strteam[TEAM_SPECTATOR]		= "PHX_TEAM_SPECTATOR"

-- Team Translate Name. Might not optimized at the moment.
function PHX.TranslateName( self, teamID, ply )
	local strID = strteam[teamID]
	
	if SERVER then	-- self:F/Translate() DON'T EXIST on Serverside!
		-- Note: DO NOT use this on expensive operations such as Think Hook, PlayerTick Hook, etc.
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
end

-- Fretta!
DeriveGamemode("fretta")
IncludePlayerClasses()

-- Information about the gamemode
GM.Name		= "Prop Hunt X"
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

GM.ForceJoinBalancedTeams 	= GetGlobalInt( "ph_forcejoinbalancedteams", false )

local mark = utf8.char(9733)
GM.PHXContributors			= {
	"Galaxio "..mark.." (Support)",
	"Godfather "..mark.." (Support)",
    "Fryman (Web Hosting)",
	"Phyremaster (Last Prop Standing)",
	"Berry (Russian Translation)",
	"Ph.X (Chinese Translation)",
	"Trigstur (Dutch Translation)",
	"Haeiven, TR1NITY (French Translation)",
	"Major Nick (German Translation)",
	"KamFretoZ (Indonesian Translation)",
	"So-chiru (Korean Translation)", 
	"Pawelxxdd (Polish Translation)",
	"Clã | BR | The Fire Fuchs (Portuguese/Brazil Translation)",
	"Ryo567, Kurayashi (Spannish Translation)",
	"Dralga (Discord Helper)",
	"Yam",
	"adk",
	"Jonpopnycorn",
	"Thundernerd"
}

-- Called on gamemdoe initialization to create teams
function GM:CreateTeams()
	if !GAMEMODE.TeamBased then
		return
	end
	
	-- hunters
	team.SetUp(TEAM_HUNTERS, "Hunters", Color(150, 205, 255, 255))
	team.SetSpawnPoint(TEAM_HUNTERS, {"info_player_counterterrorist", "info_player_combine", "info_player_deathmatch", "info_player_axis", "info_player_hunter"})
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

	--[[
		-- Notes to Myself (Wolvin) - Please Finish & Improveon this section in Prop Hunt: Codename Zero
		local _Plugins = {}
	
		function _Plugins:AddToList( name, data )
			_Plugins[name] = data
		end
		
		hook.Call("PHX_AddPlugin", nil, _Plugins)
		
		-- try to get rid of using list.Set this time.
		
		table.sort(_Plugins)
		
		-- Todo:
		- loop
		- add & combine with legacy below
		- stuff.
	]]
	
	-- Add Legacy Plugins or Addons, if any.
	for name,plugin in pairs( list.Get("PHX.Plugins") ) do
		if (self.PLUGINS[name] ~= nil) then
			self.VerboseMsg("[PHX Plugin] Not adding "..name.." because it was exists in table. Use different name instead!")
		else
			self.VerboseMsg("[PHX Plugin] Adding Plugin: "..name)
			self.PLUGINS[name] = plugin
		end
	end
	
	if !table.IsEmpty(self.PLUGINS) then
		for pName,pData in pairs(self.PLUGINS) do
			self.VerboseMsg("[PHX Plugin] Loading Plugin "..pName)
			self.VerboseMsg("--> Loaded Plugins: "..pData.name.."\n--> Version: "..pData.version.."\n--> Info: "..pData.info)
		end
	else
		self.VerboseMsg("[PHX Plugin] No plugins detected, skipping...")
	end
end
-- Initialize?
hook.Add("Initialize", "PHX.LoadPlugins", function() -- Origin: PostGamemodeLoaded
	PHX:InitializePlugin()
end)

if CLIENT then	
	hook.Add("PH_CustomTabMenu", "PHX.NewPlugins", function(tab, pVgui, paintPanelFunc)
	
		local main = {}
	
		main.panel = vgui.Create("DPanel", tab)
		main.panel:Dock(FILL)
		main.panel:SetBackgroundColor(Color(40,40,40,120))
			
		main.scroll = vgui.Create( "DScrollPanel", main.panel )
		main.scroll:Dock(FILL)
		
		main.grid = vgui.Create("DGrid", main.scroll)
		main.grid:SetPos(10,10)
		main.grid:SetSize(tab:GetWide()*0.85,320)
		main.grid:SetCols(1)
		main.grid:SetColWide(tab:GetWide()*0.8)
		main.grid:SetRowHeight(340)
		
		if table.IsEmpty(PHX.PLUGINS) then
			if (LocalPlayer():IsSuperAdmin() or LocalPlayer():CheckUserGroup()) then
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
				section.main = vgui.Create("DPanel",main.grid)
				section.main:SetSize(main.grid:GetWide()*0.9,main.grid:GetTall())
				section.main:SetBackgroundColor(Color(20,20,20,150))
				
				section.roll = vgui.Create("DScrollPanel",section.main)
				section.roll:SetSize(section.main:GetWide(),section.main:GetTall())
				
				section.grid = vgui.Create("DGrid",section.roll)
				section.grid:SetPos(20,20)
				section.grid:SetSize(section.roll:GetWide()-20,section.roll:GetTall())
				section.grid:SetCols(1)
				section.grid:SetColWide(section.roll:GetWide()-32)
				section.grid:SetRowHeight(40)
				
				pVgui("","label","Trebuchet24",section.grid, { "PLUG_NAME_VER", Data.name, Data.version } )
				pVgui("","label",false,section.grid, { "PLUG_DESCRIPTION", Data.info } )
				if (LocalPlayer():IsSuperAdmin() or LocalPlayer():CheckUserGroup()) then
					if !table.IsEmpty(Data.settings) then
						pVgui("","label",false,section.grid, "PLUGINS_SERVER_SETTINGS" )
						for _,val in pairs(Data.settings) do
							pVgui(val[1],val[2],val[3],section.grid,val[4])
						end
					end
				end
				if !table.IsEmpty(Data.client) then
					pVgui("","label",false,section.grid, "PLUGINS_CLIENT_SETTINGS" )
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