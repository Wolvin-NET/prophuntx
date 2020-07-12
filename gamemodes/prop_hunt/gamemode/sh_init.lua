-- Initialize shared variable
PHX = {}
PHX.__index = PHX

PHX.ConfigPath = "phx_data"

-- Convars. Moved to sh_init instead because of FCVAR_REPLICATION problem.
PHX.CVAR = PHX.CVAR or {}
local CVAR_SERVER_ONLY = { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE, FCVAR_NOTIFY }
local CVAR_SERVER_ONLY_NO_ARCHIVE = { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_NOTIFY }
local CVAR_SERVER_ONLY_NO_NOTIFY = { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE }
--[[
	local CVAR_SERVER_HIDDEN = { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE, 0x10 } -- hidden
	local CVAR_SERVER_DONT_RECORD = { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE, FCVAR_DONT_RECORD }
]]

PHX.CVAR.UseCustomMdlProp	= CreateConVar("ph_use_custom_plmodel_for_prop", "0", CVAR_SERVER_ONLY, "Should use a custom Player's Model for Props when the round begins?", 0, 1)
PHX.CVAR.UseCustomModel 	= CreateConVar("ph_use_custom_plmodel", "0", CVAR_SERVER_ONLY, "Should use a custom player model available for Hunters?\nPlease note that you must have to activate \'ph_use_custom_plmodel_for_prop\' too!", 0, 1)
PHX.CVAR.UseModelType		= CreateConVar("ph_use_playermodeltype", "0", CVAR_SERVER_ONLY, "Which model list that should deliver from? 0 = All Playermodels availale, 1 = Use Legacy method: list.Get('PlayerOptionsModel') (Recommended if you want to custom your model list)", 0, 1)

PHX.CVAR.AutoTauntEnable	= CreateConVar("ph_autotaunt_enabled", "1",CVAR_SERVER_ONLY_NO_NOTIFY, "Should auto taunting be enabled", 0, 1)
PHX.CVAR.AutoTauntDelay		= CreateConVar("ph_autotaunt_delay", "45", CVAR_SERVER_ONLY_NO_NOTIFY, "The delay for the auto taunt")
PHX.CVAR.CustomTauntMode	= CreateConVar("ph_custom_taunt_mode", "0", CVAR_SERVER_ONLY, "Enable custom taunts for prop teams by pressing C? (Default 0)\n  You must have a list of custom taunts to enable this.", 0, 2)
PHX.CVAR.CustomTauntDelay	= CreateConVar("ph_customtaunts_delay", "6", CVAR_SERVER_ONLY, "How many in seconds delay for props to play custom taunt again? (Default is 6)")
PHX.CVAR.NormalTauntDelay	= CreateConVar("ph_normal_taunt_delay", "2", CVAR_SERVER_ONLY, "How many in seconds delay for props to play normal [F3] taunt again? (Default is 2)")
PHX.CVAR.DefaultTauntKey	= CreateConVar("ph_default_taunt_key", KEY_F3, {FCVAR_USERINFO, FCVAR_ARCHIVE}, "Default random taunt key to be used. Default is F3.")
PHX.CVAR.DefaultCustomTauntKey = CreateConVar("ph_default_customtaunt_key", KEY_C, {FCVAR_USERINFO, FCVAR_ARCHIVE}, "Default custom taunt key to be used. Default is C.")

PHX.CVAR.PropJumpPower		= CreateConVar("ph_prop_jumppower", "1.4", CVAR_SERVER_ONLY, "Multipliers for Prop Jump Power (Do not confused with Prop's Gravity!). Default is 1.4. Min. 1.")
PHX.CVAR.PropNotifyRotation	= CreateConVar("ph_notice_prop_rotation", "1", CVAR_SERVER_ONLY, "Enable Prop Rotation notification on every time Prop Spawns.", 0, 1)

PHX.CVAR.FreezeCamera		= CreateConVar("ph_freezecam", "1", CVAR_SERVER_ONLY, "Freeze Camera.")
PHX.CVAR.FreezeCamUseSingle	= CreateConVar("ph_fc_use_single_sound", "0", CVAR_SERVER_ONLY, "Use single Freezecam sound instead of sound list?")
PHX.CVAR.FreezeCamCue		= CreateConVar("ph_fc_cue_path", "misc/freeze_cam.wav", CVAR_SERVER_ONLY, "Path for single Freezecam sound.")

PHX.LegalSoundPath			= PHX.CVAR.FreezeCamCue:GetString() or "misc/freeze_cam.wav"
if SERVER then
	cvars.AddChangeCallback("ph_fc_cue_path", function(cvar,old,new)
		local ReplaceIllegalPath = string.Replace(new, "\\", "/")
		print("Warning: Detected Backslash (\\) characters. Please use \"/\" instead.")
		RunConsoleCommand( "ph_fc_cue_path", ReplaceIllegalPath )
		PHX.LegalSoundPath = ReplaceIllegalPath
	end, "fc_path_modify")
end

PHX.CVAR.UseLuckyBall		= CreateConVar("ph_enable_lucky_balls", "1", CVAR_SERVER_ONLY_NO_ARCHIVE, "Spawn Lucky balls on breakable props?", 0, 1)
PHX.CVAR.UseDevilCrystal	= CreateConVar("ph_enable_devil_balls", "1", CVAR_SERVER_ONLY_NO_ARCHIVE, "Spawn Devil balls when hunter dies?", 0, 1)

PHX.CVAR.HunterPenalty		= CreateConVar("ph_hunter_fire_penalty", "5", CVAR_SERVER_ONLY, "Health points removed from hunters when they shoot.", 1, 500)
PHX.CVAR.HunterKillBonus	= CreateConVar("ph_hunter_kill_bonus", "100", CVAR_SERVER_ONLY, "How much health to give back to the Hunter after killing a prop.", 0, 500)
PHX.CVAR.GameTime			= CreateConVar("ph_game_time", "30", CVAR_SERVER_ONLY, "Maximum Time Left (in minutes) - Default is 30 minutes.")
PHX.CVAR.BlindTime			= CreateConVar("ph_hunter_blindlock_time", "30", CVAR_SERVER_ONLY, "How long hunters are blinded (in seconds)")
PHX.CVAR.RoundTime			= CreateConVar("ph_round_time", "300", CVAR_SERVER_ONLY, "Time (in seconds) for each rounds.")
PHX.CVAR.TotalRounds		= CreateConVar("ph_rounds_per_map", "10", CVAR_SERVER_ONLY, "Numbers played on a map (Default: 10)")
PHX.CVAR.WaitForPlayers		= CreateConVar("ph_waitforplayers", "1", CVAR_SERVER_ONLY, "Should we wait for players for proper round?", 0, 1 )
PHX.CVAR.MinWaitForPlayers	= CreateConVar("ph_min_waitforplayers", "1", CVAR_SERVER_ONLY_NO_NOTIFY, "Numbers of mininum players that we should wait for round start. Value must not contain less than 1.", 1, game.MaxPlayers())

PHX.CVAR.BeVerbose			= CreateConVar("ph_print_verbose", "0", CVAR_SERVER_ONLY_NO_NOTIFY, "Developer Verbose. Some printed messages will only appear if this is enabled.", 0, 1)
function PHX.VerboseMsg(text)
	if ( PHX.CVAR.BeVerbose:GetBool() and text ) then
		print( tostring(text) )
	end
end

PHX.CVAR.EnableOBBMod		= CreateConVar("ph_sv_enable_obb_modifier", "1",CVAR_SERVER_ONLY_NO_NOTIFY, "Developer: Enable OBB Model Data Modifier", 0, 1)
PHX.CVAR.ApplyOBBonRound	= CreateConVar("ph_reload_obb_setting_everyround", "1",CVAR_SERVER_ONLY_NO_NOTIFY, "Developer: Reload OBB Model Data Modifier Every round Restarts", 0, 1)

PHX.CVAR.UseNewMKBren		= CreateConVar("ph_mkbren_use_new_mdl", "1", CVAR_SERVER_ONLY_NO_NOTIFY, "Use new model for Bren MK II Bonus Weapon (Require Map Restart!!)", 0, 1)
PHX.CVAR.CheckSpace			= CreateConVar("ph_check_props_boundaries", "0", CVAR_SERVER_ONLY, "Enable prop boundaries/room check? This will prevent you to get stuck with other objects (such as prop, wall, etc)", 0, 1)
PHX.CVAR.SeePlayerNames		= CreateConVar("ph_enable_plnames", "0", CVAR_SERVER_ONLY, "Serverside control for if a clients see client\'s team player names through walls.", 0, 1)
PHX.CVAR.CameraCollision	= CreateConVar("ph_prop_camera_collisions", "0", CVAR_SERVER_ONLY, "Attempts to stop props from viewing inside walls.", 0, 1)
PHX.CVAR.PropCollide		= CreateConVar("ph_prop_collision", "0", CVAR_SERVER_ONLY, "Should Team Props collide with each other?", 0, 1)
PHX.CVAR.HLACombine			= CreateConVar("ph_add_hla_combine", "1", CVAR_SERVER_ONLY, "Add HLA Combine to default combine models? [REQUIRE MAP RESTART!]", 0, 1)
PHX.CVAR.SwapTeam			= CreateConVar("ph_swap_teams_every_round", "1", CVAR_SERVER_ONLY, "Should teams swapped on every round?", 0, 1)
PHX.CVAR.ChangeTeamLimit	= CreateConVar("ph_max_teamchange_limit", "5", {FCVAR_REPLICATED, FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE}, "Define how many times player can assign to their team. Default is 5. -1 means disable it.")
PHX.CVAR.EnableTeamBalance	= CreateConVar("ph_enable_teambalance", "1", {FCVAR_REPLICATED, FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE}, "Enable Team Balance during round restart?")

PHX.CVAR.AllowRespawnOnBlind			= CreateConVar("ph_allow_respawnonblind", "1", CVAR_SERVER_ONLY, "Allow fast respawn during blind time?")
PHX.CVAR.AllowRespawnOnBlindTeam		= CreateConVar("ph_allow_respawnonblind_team_only", "0", CVAR_SERVER_ONLY, "If specified, what team should be allowed to respawn? 0 = ALL TEAMS, 1 = HUNTERS, 2 = PROPS", 0, 2 )
PHX.CVAR.AllowSpectatorRespawnOnBlind	= CreateConVar("ph_allow_respawn_from_spectator", "1", CVAR_SERVER_ONLY, "Allow Spectators joining to any team and respawn during blind time?", 0, 1)
PHX.CVAR.BlindRespawnTimePercent		= CreateConVar("ph_blindtime_respawn_percent", "0.75", CVAR_SERVER_ONLY, "How much time percentage to allow player Respawn during Blind time? Default is 0.75 (75%)", 0.30, 1.00)
PHX.CVAR.AllowRespawnOnBlindBetweenTeams = CreateConVar("ph_allow_respawnonblind_teamchange", "0", CVAR_SERVER_ONLY, "Not recommended if allowed: Allow respawn during blind time FROM team changes (from props to hunters, vice versa).\nI don't recommend enabling this because players may able to use this to take advantage by sitting on Prop team everytime. Enable this ONLY if you know what you're doing.", 0, 1 )
PHX.CVAR.AllowPickupProp	= CreateConVar("ph_allow_pickup_object", "3", CVAR_SERVER_ONLY, "Allow pickup objects? 0=No, 1=Hunters Only, 2=Props Only, 3=Everyone", 0, 3)

-- Inclusions! yay...
AddCSLuaFile("config/sh_init.lua")
AddCSLuaFile("sh_drive_prop.lua")
AddCSLuaFile("ulx/modules/sh/sh_phe_mapvote.lua")
AddCSLuaFile("sh_config.lua")
AddCSLuaFile("sh_player.lua")

include("config/sh_init.lua")
include("sh_drive_prop.lua")
include("ulx/modules/sh/sh_phe_mapvote.lua")
include("sh_config.lua")
include("sh_player.lua")

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

-- Update //Disabled Temporary, need improve.
//AddCSLuaFile("sh_httpupdates.lua")
//include("sh_httpupdates.lua")

-- Fretta!
DeriveGamemode("fretta")
IncludePlayerClasses()

-- Information about the gamemode
GM.Name		= "Prop Hunt X"
GM.Author	= "Wolvindra-Vinzuerio & D4UNKN0WNM4N"

-- Versioning
GM._VERSION		= "X"
GM.REVISION		= "14.07.20" //dd.mm.yy.
GM.DONATEURL 	= "https://prophunt.wolvindra.net/donate"
GM.UPDATEURL 	= "https://www.wolvindra.net/ph_update_check.php" --return json only

-- Help info
GM.Help = [[A Prop Hunt (Codename) X Project.

This gamemode is aimed for public development test purposes, with
new exiting improvement and making it to stay classic but compatible, 
customisable, and modern.

https://www.wolvindra.net/prophuntx

To See more info & help, Press [F1] key and click [Prop Hunt Menu] button.

Version: ]].. GM._VERSION ..[[ Revision: ]].. GM.REVISION ..[[

What's New:
- Using version from fork base 15 rev I
- Updated HUD
- (TBA)

Have Fun!]]

-- Fretta configuration
GM.GameLength				= PHX.CVAR.GameTime:GetInt()
GM.AddFragsToTeamScore		= true
GM.CanOnlySpectateOwnTeam 	= true
GM.ValidSpectatorModes 		= { OBS_MODE_CHASE, OBS_MODE_IN_EYE, OBS_MODE_ROAMING }
GM.Data 					= {}
GM.EnableFreezeCam			= true
GM.NoAutomaticSpawning		= true
GM.NoNonPlayerPlayerDamage	= true
GM.NoPlayerPlayerDamage 	= true
GM.RoundBased				= true
GM.RoundLimit				= PHX.CVAR.TotalRounds:GetInt()
GM.RoundLength 				= PHX.CVAR.RoundTime:GetInt()
GM.RoundPreStartTime		= 0
GM.SuicideString			= "dead" -- obsolete
GM.TeamBased 				= true

GM.AutomaticTeamBalance 	= false -- Please leave this option always set to false
GM.ForceJoinBalancedTeams 	= true  -- Please leave this option always set to true

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
	if !PHX.CVAR.PropCollide:GetBool() && (entA && entB && ((entA:IsPlayer() && entA:Team() == TEAM_PROPS && entB:IsValid() && entB:GetClass() == "ph_prop") || (entB:IsPlayer() && entB:Team() == TEAM_PROPS && entA:IsValid() && entA:GetClass() == "ph_prop"))) then
		return false
	end
	
	-- Disable hunter on hunter collisions so we can allow bullets through them
	if (IsValid(entA) && IsValid(entB) && (entA:IsPlayer() && entA:Team() == TEAM_HUNTERS && entB:IsPlayer() && entB:Team() == TEAM_HUNTERS)) then
		return false
	end
end
hook.Add("ShouldCollide", "CheckPropCollision", CheckPropCollision)

-- Plugins Section
PHX.PLUGINS = {}

function PHX:InitializePlugin()

	for name,plugin in pairs(list.Get("PHX.Plugins")) do
		PHX.VerboseMsg("[PHX Plugin] Adding Plugin: "..name)
		PHX.PLUGINS[name] = plugin
	end
	
	if !table.IsEmpty(PHX.PLUGINS) then
		for pName,pData in pairs(PHX.PLUGINS) do
			PHX.VerboseMsg("[PHX Plugin] Loading Plugin "..pName)
			PHX.VerboseMsg("--> Loaded Plugins: "..pData.name.."\n--> Version: "..pData.version.."\n--> Info: "..pData.info)
		end
	else
		PHX.VerboseMsg("[PHX Plugin] No plugins detected, skipping...")
	end
end
hook.Add("Initialize", "PHX.InitPlugins", function()
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
		main.grid:SetSize(tab:GetWide()-20,280)
		main.grid:SetCols(1)
		main.grid:SetColWide(tab:GetWide()-100)
		main.grid:SetRowHeight(300)
		
		if table.Count(PHX.PLUGINS) < 1 then
			if LocalPlayer():IsSuperAdmin() then
				local lbl = vgui.Create("DLabel",main.panel)
				lbl:SetPos(40,60)
				lbl:SetText("No plugins installed. Browse more plugins here!")
				lbl:SetFont("Trebuchet24")
				lbl:SetTextColor(color_white)
				lbl:SizeToContents()
				
				local but = vgui.Create("DButton",main.panel)
				but:SetPos(40,96)
				but:SetSize(256,40)
				but:SetText("Browse more plugins")
				but.DoClick = function() gui.OpenURL("https://prophunt.wolvindra.net/plugins") end
				but:SetIcon("icon16/bricks.png")
			else
				local lbl = vgui.Create("DLabel",main.panel)
				lbl:SetPos(40,60)
				lbl:SetText("Sorry, This server has no custom addons/plugins installed.")
				lbl:SetFont("Trebuchet24")
				lbl:SetTextColor(color_white)
				lbl:SizeToContents()
			end
		else
			for plName,Data in pairs(PHX.PLUGINS) do
				local section = {}
				section.main = vgui.Create("DPanel",main.grid)
				section.main:SetSize(main.grid:GetWide()-200,main.grid:GetTall())
				section.main:SetBackgroundColor(Color(20,20,20,150))
				
				section.roll = vgui.Create("DScrollPanel",section.main)
				section.roll:SetSize(section.main:GetWide(),section.main:GetTall())
				
				section.grid = vgui.Create("DGrid",section.roll)
				section.grid:SetPos(20,20)
				section.grid:SetSize(section.roll:GetWide()-20,section.roll:GetTall())
				section.grid:SetCols(1)
				section.grid:SetColWide(800)
				section.grid:SetRowHeight(40)
				
				pVgui("","label","Trebuchet24",section.grid, Data.name.."| v."..Data.version )
				pVgui("","label",false,section.grid, "Description: "..Data.info )
				if (LocalPlayer():IsSuperAdmin() || table.HasValue(PHX.SVAdmins, LocalPlayer():GetUserGroup())) then
					if !table.IsEmpty(Data.settings) then
						pVgui("","label",false,section.grid, "-- Server Settings --" )
						for _,val in pairs(Data.settings) do
							pVgui(val[1],val[2],val[3],section.grid,val[4])
						end
					end
				end
				if !table.IsEmpty(Data.client) then
					pVgui("","label",false,section.grid, "-- Client Settings --" )
					for _,val in pairs(Data.client) do
						pVgui(val[1],val[2],val[3],section.grid,val[4])
					end
				end				
				main.grid:AddItem(section.main)
			end
		end
	
	local PanelModify = tab:AddSheet("", main.panel, "vgui/ph_iconmenu/m_plugins.png")
	paintPanelFunc(PanelModify, "Addons & Plugins")
	
	end)
end