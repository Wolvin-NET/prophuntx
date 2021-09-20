if PHX then return end

-- Initialize shared variable
PHX = {}
PHX.__index = PHX

PHX.ConfigPath 	= "phx_data"
PHX.VERSION		= "X"
PHX.REVISION	= "16.09.21/X2Z" --Format: dd/mm/yy.

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

local f = file.Find(engine.ActiveGamemode() .. "/gamemode/langs/*.lua", "LUA")
for _,lgfile in SortedPairs(f) do
	PHX.VerboseMsg("[PHX] [LANGUAGE] Adding Language File -> ".. lgfile)
	AddCSLuaFile("langs/" .. lgfile)
	include("langs/" .. lgfile)
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
if CLIENT then
	include("cl_lang.lua")
end
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

-- Fretta!
DeriveGamemode("fretta")
IncludePlayerClasses()

-- Information about the gamemode
GM.Name		= "Prop Hunt X"
GM.Author	= "Wolvindra-Vinzuerio & D4UNKN0WNM4N"

-- Versioning
GM._VERSION		= PHX.VERSION
GM.REVISION		= PHX.REVISION --dd/mm/yy.
GM.DONATEURL 	= "https://wolvindra.xyz/donate"
GM.UPDATEURL 	= "https://wolvindra.xyz/ph_update_check.php" --return json only

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
GM.RoundLimit				= PHX:QCVar( "ph_rounds_per_map" )
GM.RoundLength 				= PHX:QCVar( "ph_round_time" )
GM.RoundPreStartTime		= 0
GM.SuicideString			= "dead" -- obsolete
GM.TeamBased 				= true

GM.ForceJoinBalancedTeams 	= PHX:QCVar( "ph_forcejoinbalancedteams" )

-- Called on gamemdoe initialization to create teams
function GM:CreateTeams()
	if !GAMEMODE.TeamBased then
		return
	end
	
	TEAM_HUNTERS = 1
	team.SetUp(TEAM_HUNTERS, "Hunters", Color(150, 205, 255, 255))
	team.SetSpawnPoint(TEAM_HUNTERS, {"info_player_counterterrorist", "info_player_combine", "info_player_deathmatch", "info_player_axis", "info_player_hunter"})
	team.SetClass(TEAM_HUNTERS, {"Hunter"})

	TEAM_PROPS = 2
	team.SetUp(TEAM_PROPS, "Props", Color(255, 60, 60, 255))
	team.SetSpawnPoint(TEAM_PROPS, {"info_player_terrorist", "info_player_rebel", "info_player_deathmatch", "info_player_allies", "info_player_props"})
	team.SetClass(TEAM_PROPS, {"Prop"})
end

-- Check collisions
function CheckPropCollision(entA, entB)
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
hook.Add("PostGamemodeLoaded", "PHX.LoadPlugins", function()
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
		main.grid:SetSize(tab:GetWide()*0.9,320)
		main.grid:SetCols(1)
		main.grid:SetColWide(tab:GetWide()*0.85)
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
				but.DoClick = function() gui.OpenURL("https://wolvindra.xyz/phxplugins") end
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
				
				pVgui("","label","Trebuchet24",section.grid, Data.name.."| v."..Data.version )
				pVgui("","label",false,section.grid, "INFO: "..Data.info )
				if (LocalPlayer():IsSuperAdmin() or LocalPlayer():CheckUserGroup()) then
					if !table.IsEmpty(Data.settings) then
						pVgui("","label",false,section.grid, PHX:FTranslate("PLUGINS_SERVER_SETTINGS") )
						for _,val in pairs(Data.settings) do
							pVgui(val[1],val[2],val[3],section.grid,val[4])
						end
					end
				end
				if !table.IsEmpty(Data.client) then
					pVgui("","label",false,section.grid, PHX:FTranslate("PLUGINS_CLIENT_SETTINGS") )
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