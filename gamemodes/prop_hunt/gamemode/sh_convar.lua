CVAR_SERVER_ONLY			= FCVAR_REPLICATED + FCVAR_ARCHIVE + FCVAR_NOTIFY	-- Apprently, this two may looks better.
CVAR_SERVER_ONLY_NO_NOTIFY 	= FCVAR_REPLICATED + FCVAR_ARCHIVE
CVAR_SERVER_HIDDEN 			= { 0x10, FCVAR_DONTRECORD } --,FCVAR_UNREGISTERED ?

-- global constant type
CTYPE_STRING	= 1
CTYPE_NUMBER	= 2
CTYPE_BOOL		= 3
CTYPE_FLOAT		= 4

PHX.CVAROBJ = {}
PHX.CVAROBJ.SHARED = {}
if SERVER then PHX.CVAROBJ.SERVER = {}; end
if CLIENT then PHX.CVAROBJ.CLIENT = {}; end

function PHX:GetEngineCVar( cvar, cvarType )

	cvarType = cvarType or 1 --will return to CTYPE_STRING

	local Exist = self.CVAROBJ.SHARED[cvar]
	if (Exist) then
		self:VerboseMsg( "[Convar:GetEngineCVar] Warning: Redirecting "..cvar.." to existing CVAROBJ.SHARED to use GetCVar instead",2 )
		return self:GetCVar( cvar )
	end

	if SERVER then
		local SVExist = self.CVAROBJ.SERVER[cvar]
		if (SVExist) then
			self:VerboseMsg( "[Convar:GetEngineCVar] Warning: Redirecting "..cvar.." to existing CVAROBJ.SERVER to use GetSVCVar instead",2 )
			return self:GetSVCVar( cvar )
		end
	end

	if CLIENT then
		local CLExist = self.CVAROBJ.CLIENT[cvar]
		if (CLExist) then
			self:VerboseMsg( "[Convar:GetEngineCVar] Warning: Redirecting "..cvar.." to existing CVAROBJ.CLIENT to use GetCLCVar instead",2 )
			return self:GetCLCVar( cvar )
		end
	end

	-- fallback to GetConVar
	local cInternal = GetConVar(cvar)
	if cvarType == CTYPE_NUMBER then return cInternal:GetInt(); end
	if cvarType == CTYPE_FLOAT then return cInternal:GetFloat(); end
	if cvarType == CTYPE_BOOL then return cInternal:GetBool(); end
	return cInternal:GetString()

end

local function cvRealm( isServer ) return (isServer) and "SERVER" or "SHARED"; end

local ConVarTranslate = {
	[CTYPE_STRING] = {
		Set = function(name, value, fcvar, help, data, bServer)
			local Realm = cvRealm(bServer)
			local cvObj = CreateConVar(name, tostring(value), fcvar, help)
			PHX.CVAROBJ[Realm][name] = cvObj

			if (data) and isfunction(data) then data( name, value, cvObj ) end
		end,
		Get = function(name, value, bServer)
			local Realm = cvRealm(bServer)
			local cvObj = PHX.CVAROBJ[Realm][name]
			return cvObj and cvObj:GetString() or "!error"
		end
	},
	[CTYPE_BOOL] = {
		Set = function(name, value, fcvar, help, data, bServer)
			local Realm = cvRealm(bServer)
			local cvObj = CreateConVar(name, value, fcvar, help, 0, 1)
			PHX.CVAROBJ[Realm][name] = cvObj
			
			if (data) and isfunction(data) then data( name, value, cvObj ) end
		end,
		Get = function(name, value, bServer)
			local Realm = cvRealm(bServer)
			local cvObj = PHX.CVAROBJ[Realm][name]
			return cvObj and cvObj:GetBool() or false
		end
	},
	[CTYPE_NUMBER] = {
		Set = function(name, value, fcvar, help, data, f, bServer)
			local Realm = cvRealm(bServer)
			local min,max

			if (data) and istable(data) then min = data.min; max = data.max; end

			local cvObj = CreateConVar(name, value, fcvar, help, min, max)
			PHX.CVAROBJ[Realm][name] = cvObj
			
			if (f) and isfunction(f) then f( name, value, cvObj ); end
		end,
		Get = function(name, value, bServer)
			local Realm = cvRealm(bServer)
			local cvObj = PHX.CVAROBJ[Realm][name]
			return cvObj and cvObj:GetInt() or 0
		end
	},
	[CTYPE_FLOAT] = {
		Set = function(name, value, fcvar, help, data, f, bServer)
			local Realm = cvRealm(bServer)
			local min,max

			if (data) and istable(data) then min = data.min; max = data.max; end

			local cvObj = CreateConVar(name, value, fcvar, help, min, max)
			PHX.CVAROBJ[Realm][name] = cvObj
			
			if (f) and isfunction(f) then f( name, value, cvObj ); end
		end,
		Get = function(name, value, bServer)
			local Realm = cvRealm(bServer)
			local cvObj = PHX.CVAROBJ[Realm][name]
			return cvObj and cvObj:GetFloat() or 0.0
		end
	}
}

-- Server only purpose.
local SVCVAR = {}
if SERVER then
	SVCVAR["ph_kick_non_admin_access"]	=	{ CTYPE_BOOL,	"0", {FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE}, "Should We Kick Non-Admins when trying to access Server ConVars? If Not, Print a message who violates instead." }
end
-- End of Server only purpose.

local CVAR = {}
CVAR["ph_show_splash_screen"]           =   { CTYPE_BOOL,   "1", CVAR_SERVER_ONLY, "Show Splash Screen upon joining." }

CVAR["ph_banned_models"]				=	{ CTYPE_BOOL,	"1", CVAR_SERVER_ONLY, "Ban/Unban the use of Restricted Models. This does not include from Prohibitted Models!"}

CVAR["ph_use_lang"]						=	{ CTYPE_BOOL, 	"0", 	 CVAR_SERVER_ONLY, "Enable forced-language to display. THIS WILL BYPASS USER-PREFERED LANGUAGE!" }
CVAR["ph_force_lang"]					=	{ CTYPE_STRING, "en_us", CVAR_SERVER_ONLY, "Default language to force." }
CVAR["ph_default_lang"]					=	{ CTYPE_STRING, "en_us", CVAR_SERVER_ONLY, "What language should be set for the first-time player joined to your server. You should always leave this as 'en_us'." }

CVAR["ph_use_custom_plmodel_for_prop"]	=	{ CTYPE_BOOL, 	"0", CVAR_SERVER_ONLY, "Should use a custom Player's Model for Props when the round begins?" }
CVAR["ph_use_custom_plmodel"]			=	{ CTYPE_BOOL, 	"0", CVAR_SERVER_ONLY, "Should use a custom player model available for Hunters?\nPlease note that you must have to activate \'ph_use_custom_plmodel_for_prop\' too!" }
CVAR["ph_use_playermodeltype"]			=	{ CTYPE_NUMBER, "0", CVAR_SERVER_ONLY, "Which model list that should deliver from? 0 = All Playermodels availale, 1 = Use Legacy method: list.Get('PlayerOptionsModel') (Recommended if you want to custom your model list)", { min = 0, max = 1 } }

CVAR["ph_enable_hunter_player_color"]   =   { CTYPE_BOOL,   "0", CVAR_SERVER_ONLY, "Enable Player Color for team Hunters" }
CVAR["ph_enable_prop_player_color"]     =   { CTYPE_BOOL,   "0", CVAR_SERVER_ONLY, "Enable Player Color for team Props" }

CVAR["ph_autotaunt_enabled"]			=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY_NO_NOTIFY, "(Only Apply on New Round has started) Should auto taunting be enabled" }
CVAR["ph_autotaunt_delay"]				=	{ CTYPE_NUMBER, "45", CVAR_SERVER_ONLY_NO_NOTIFY, "Delay in seconds for auto taunt feature" }
CVAR["ph_custom_taunt_mode"]			=	{ CTYPE_NUMBER, "2", CVAR_SERVER_ONLY, "Enable custom taunts for prop teams by pressing C? (Default 2)\n  You must have a list of custom taunts to enable this.", { min = 0, max = 2 } }
CVAR["ph_customtaunts_delay"]			=	{ CTYPE_NUMBER, "6", CVAR_SERVER_ONLY, "How many in seconds delay for props to play custom taunt again? (Default is 6)" }
CVAR["ph_normal_taunt_delay"]			=	{ CTYPE_NUMBER, "2", CVAR_SERVER_ONLY, "How many in seconds delay for props to play normal [F3] taunt again? (Default is 2)" }
-- fake taunt & pitch
CVAR["ph_randtaunt_map_prop_enable"]	=	{ CTYPE_BOOL,	"1", CVAR_SERVER_ONLY, "Allow fake taunts to be played on random props in the maps. Can be accessed only through Custom Taunt menu." }
CVAR["ph_randtaunt_map_prop_max"]		=	{ CTYPE_NUMBER, "6", CVAR_SERVER_ONLY, "Maximum usage for fake taunts to be used. -1 is unlimited (Be warned though,I don't recommend to set this as unlimited!)" }
CVAR["ph_taunt_pitch_enable"]			=	{ CTYPE_BOOL,   "1", CVAR_SERVER_ONLY, "Enable or Disable Taunt Pitch" }
CVAR["ph_taunt_pitch_range_min"]		=	{ CTYPE_FLOAT, "50.0", CVAR_SERVER_ONLY_NO_NOTIFY, "Minimum threshold/acceptable pitch range for taunt", {min = 1, max = 99} }
CVAR["ph_taunt_pitch_range_max"]		=	{ CTYPE_FLOAT, "200.0", CVAR_SERVER_ONLY_NO_NOTIFY, "Maximum threshold/acceptable pitch range for taunt", {min = 100, max = 255} }

CVAR["ph_enable_taunt_scanner"]			=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "(Require Map Restart) Enable Taunt Scanner?" }

-- Convars for Armor
CVAR["ph_allow_armor"]			        =	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Allow use of Armor? May require round restart." }

CVAR["ph_prop_jumppower"]				=	{ CTYPE_FLOAT, 	"1.5", CVAR_SERVER_ONLY_NO_NOTIFY, "Multipliers for Prop Jump Power (Do not confused with Gravity!). Default is 1.4. Min. 1.", {min=1, max=50}, -- in menu, it only limits to 5.
function(cvarname, val)
    cvars.AddChangeCallback( cvarname, function(_,_,new )    
        util.AllTeamPlayers( TEAM_PROPS, function(ply)
            if ply:Alive() then ply:SetJumpPower(160 * tonumber(new)) end
        end )
    end, "phx.cvflt_" .. cvarname)
end }
CVAR["ph_hunter_jumppower"]		=	{ CTYPE_FLOAT, 	"1", CVAR_SERVER_ONLY_NO_NOTIFY, "Multipliers for Hunter Jump Power (Do not confused with Gravity!). Default is 1. Min. 1.", {min=1, max=25}, -- in menu, it only limits to 2.5.
function(cvarname, val)
    cvars.AddChangeCallback( cvarname, function(_,_,new )    
        util.AllTeamPlayers( TEAM_HUNTERS, function(ply)
            if ply:Alive() then ply:SetJumpPower(160 * tonumber(new)) end
        end )
    end, "phx.cvflt_" .. cvarname)
end }
CVAR["ph_notice_prop_rotation"]			=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Enable Prop Rotation notification on every time Prop Spawns." }

CVAR["ph_freezecam"]					=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Enable Freeze Camera Feature for Props." }
CVAR["ph_freezecam_hunter"]				=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Enable Freeze Camera Feature for Hunters." }
CVAR["ph_fc_use_single_sound"]			=	{ CTYPE_BOOL, 	"0", CVAR_SERVER_ONLY, "Use single Freezecam sound instead of sound list?" }
CVAR["ph_fc_cue_path"]					=	{ CTYPE_STRING, "misc/freeze_cam.wav", CVAR_SERVER_ONLY, "Path for single Freezecam sound.", 
function(cvarname, val)
	cvars.AddChangeCallback( cvarname, function(_,_,new)
		-- replace \ char to / instead.
		new = new:Replace("\\", "/")
		PHX.LegalSoundPath = new
	end, "phx.cvstr_" .. cvarname)
end }

CVAR["ph_notify_player_join_leave"]			=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Notify Player Join and Leave in the Chat?" }

CVAR["ph_usable_prop_type"]					=	{ CTYPE_NUMBER, "1", CVAR_SERVER_ONLY, "Usable Prop Types. 1 = Physics only, 2 = Dynamics, Ragdolls & Physics, 3 = Almost Anything, 4 = Custom", { min = 1, max = 4 },
function(cvarname, value)
	cvars.AddChangeCallback( cvarname, function(_,_,new) PHX:SetUsableEntity( tonumber(new) ); end, "phx.cvnum_" .. cvarname )
end }
CVAR["ph_usable_prop_type_notice"]			= 	{ CTYPE_BOOL,	"1", CVAR_SERVER_ONLY, "Notify about certain entities cannot be replicated by pressing 'E'. This only works if 'ph_usable_prop_type' is set to '3' or '4'." }

CVAR["ph_enable_lucky_balls"]				=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Spawn Lucky balls on breakable props?" }
CVAR["ph_enable_devil_balls"]				=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Spawn Devil balls when hunter dies?" }

CVAR["ph_prop_must_standing"]				=	{ CTYPE_BOOL,	"1", CVAR_SERVER_ONLY, "[Experimental] Restrict props replication only when they're standing. Disable this to allow replicating when ducking or jumping."}
CVAR["ph_hunter_fire_penalty"]				=	{ CTYPE_NUMBER, "5", CVAR_SERVER_ONLY, "Health points removed from hunters when they shoot.", { min = 1, max = 500 } }
CVAR["ph_hunter_kill_bonus"]				=	{ CTYPE_NUMBER, "100", CVAR_SERVER_ONLY, "How much health to give back to the Hunter after killing a prop.", { min = 0, max = 500 } }
CVAR["ph_game_time"]						=	{ CTYPE_NUMBER, "30", CVAR_SERVER_ONLY, "(Require Map Restart) Maximum Time Left (in minutes) - Default is 30 minutes." }
CVAR["ph_hunter_blindlock_time"]			=	{ CTYPE_NUMBER, "30", CVAR_SERVER_ONLY, "How long hunters are blinded (in seconds)" }
CVAR["ph_round_time"]						=	{ CTYPE_NUMBER, "300", CVAR_SERVER_ONLY, "(Require Map Restart) Time (in seconds) for each rounds." }
CVAR["ph_rounds_per_map"]					=	{ CTYPE_NUMBER, "10", CVAR_SERVER_ONLY, "(Require Map Restart) Numbers of rounds played on a single map (Default: 10)" }
CVAR["ph_waitforplayers"]					=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, 	"Should we wait for players for proper round?" }
CVAR["ph_min_waitforplayers"]				=	{ CTYPE_NUMBER, "1", CVAR_SERVER_ONLY, 	"Numbers of mininum players that we should wait for round start. Value must not contain less than 1.", { min = 1, max = game.MaxPlayers() } }

CVAR["ph_sv_enable_obb_modifier"]			=	{ CTYPE_BOOL, 	"1",CVAR_SERVER_ONLY_NO_NOTIFY, "Developer: Enable OBB Model Data Override/Modifier" }
CVAR["ph_reload_obb_setting_everyround"]	=	{ CTYPE_BOOL, 	"1",CVAR_SERVER_ONLY_NO_NOTIFY, "Developer: Reload OBB Model Data Override/Modifier Every round Restarts" }
CVAR["ph_prop_viewoffset_mult"]				=	{ CTYPE_FLOAT,	"0.8", CVAR_SERVER_ONLY_NO_NOTIFY, "Substract/Add Prop View Offset Height using multiplier. Min: 0.6, Max: 1.2. Default: 0.8.", { min=0.6,max=1.2 } }
CVAR["ph_mkbren_use_new_mdl"]				=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY_NO_NOTIFY, "Use new model for Bren MK II Bonus Weapon (Require Map Restart!!)" }
CVAR["ph_check_for_rooms"]					=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Check for rooms before replicating? This will prevent you to get stuck with other objects (such as prop, wall, etc)" }
CVAR["ph_enable_plnames"]					=	{ CTYPE_BOOL, 	"0", CVAR_SERVER_ONLY, "Serverside control for if a clients see client\'s team player names through walls." }
CVAR["ph_prop_camera_collisions"]			=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Attempts to stop props from viewing inside walls. (Camera Collision)" }
CVAR["ph_prop_collision"]					=	{ CTYPE_BOOL, 	"0", CVAR_SERVER_ONLY, "Should Team Props collide with each other?" }
CVAR["ph_add_hla_combine"]					=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Add HLA Combine to default combine models? [REQUIRE MAP RESTART!]" }
CVAR["ph_swap_teams_every_round"]			=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Should teams swapped on every round?" }
CVAR["ph_max_teamchange_limit"]				=	{ CTYPE_NUMBER, "8", CVAR_SERVER_ONLY_NO_NOTIFY, "Define how many times player can change team to another. Default is 5. -1 means disabled." }
CVAR["ph_enable_teambalance"]				=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY_NO_NOTIFY, "Enable Team Balance during round restart?" }
CVAR["ph_force_join_balanced_teams"]			=	{ CTYPE_BOOL, 	"0", CVAR_SERVER_ONLY, "Force players to even out teams upon joining? Setting 0 means do not force to join in balanced teams." } -- PH:E v16, by Fafy

CVAR["ph_enable_decoy_reward"]				=	{ CTYPE_BOOL,	"1", CVAR_SERVER_ONLY_NO_NOTIFY, "Enable a decoy reward? Reward will be given if any prop player is alive on every round ends." }
CVAR["ph_decoy_health"]						=	{ CTYPE_NUMBER,	"10", CVAR_SERVER_ONLY_NO_NOTIFY, "How much health points does the decoy has. Default is 10.", { min = 1, max = 200 } }
CVAR["ph_props_disable_footstep"]           =   { CTYPE_BOOL,  "1", CVAR_SERVER_ONLY, "Toggle Mute player footstep for Prop players." }

CVAR["ph_smggrenadecounts"]					=	{ CTYPE_NUMBER, "1", CVAR_SERVER_ONLY, "How many grenades for SMG1 served on spawn?", { min = 1, max = 10 } }
CVAR["ph_give_grenade_near_roundend"]       =   { CTYPE_BOOL, "0", CVAR_SERVER_ONLY_NO_NOTIFY, "Should grenades will be given near round end? If Yes, see 'ph_give_grenade_roundend_before_time' also."}
CVAR["ph_give_grenade_roundend_before_time"] =   { CTYPE_FLOAT, "15", CVAR_SERVER_ONLY_NO_NOTIFY, "Time in seconds to give grenades before Round Ends. This is typically between 10 to 30 seconds." }

CVAR["ph_use_new_chat"]						=	{ CTYPE_BOOL, 	"0", CVAR_SERVER_ONLY, "!!REQUIRE MAP RESTART!\nUse new (temporary) chat box? This will replace default chatbox and prevent new HUD overlap.", 
function(cvarname, value)	
	cvars.AddChangeCallback( cvarname, function(cv, _, new)
		print(cv .. " -> was changed. Please be sure to change/restart map to take effect!")
		print("WARNING: Deprecated: eChat will be replaced/removed in future update!")
		for _,v in pairs(player.GetHumans()) do
			if v:CheckUserGroup() then
				v:ChatPrint("NOTICE: Map restart required, a ConVar '"..cv.."' has been changed therefore a map change is needed.")
				v:ChatPrint("WARNING: Deprecated: eChat will be replaced/removed in future update!")
			end
		end
	end, "phx.cvbool_" .. cvarname)
end }
CVAR["ph_new_chat_pos_sub"]					=	{ CTYPE_NUMBER, "50", CVAR_SERVER_ONLY_NO_NOTIFY, "Move (in pixels) by substracting chat position Y pixels high. Negative (-) means to move it lower." }

CVAR["ph_allow_respawnonblind"]				=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Allow fast respawn during blind time?" }
CVAR["ph_allow_respawnonblind_team_only"]	=	{ CTYPE_NUMBER, "0", CVAR_SERVER_ONLY, "If specified, what team should be allowed to respawn? 0 = ALL TEAMS, 1 = HUNTERS, 2 = PROPS", { min = 0, max = 2 } }
CVAR["ph_allow_respawn_from_spectator"]		=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Allow Spectators join to any team and respawns during blind time?" }
CVAR["ph_blindtime_respawn_percent"]		=	{ CTYPE_FLOAT, 	"0.75", CVAR_SERVER_ONLY_NO_NOTIFY, "How much time percentage to allow player Respawn during Blind time? Default is 0.75 (75%)", { min = 0.30, max = 1.00 } }
CVAR["ph_allow_respawnonblind_teamchange"]	=	{ CTYPE_BOOL, 	"0", CVAR_SERVER_ONLY, "Not recommended if allowed: Allow respawn during blind time FROM team changes (from props to hunters, vice versa).\nI don't recommend enabling this because players may able to use this to take advantage by sitting on Prop team everytime.\nEnable this ONLY if you know what you're doing!" }
CVAR["ph_allow_pickup_object"]				=	{ CTYPE_NUMBER, "3", CVAR_SERVER_ONLY, "Allow pickup objects? 0=No, 1=Hunters Only, 2=Props Only, 3=Everyone", { min = 0, max = 3 } }

-- MapVotes, these aren't listed on F1 Prop Hunt Menu, this needs to be set manually through your server.cfg!!
CVAR["ph_enable_mapvote"]					=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Enable/Disable Built-in PH:X Map votes system? Set this 0 to disable this and use from map vote addon and will call 'PH_OverrideMapVote' Hooks.\nIf 'ph_use_custom_mapvote' and 'ph_use_custom_mapvote_cmd' set to 1 they are still called however." }
CVAR["ph_use_custom_mapvote"]				=	{ CTYPE_BOOL, 	"0", CVAR_SERVER_ONLY_NO_NOTIFY, "Use custom external Map votes system? This will override built-in mapvote. See help 'ph_custom_mv_func' for more info." }
CVAR["ph_use_custom_mapvote_cmd"]			=	{ CTYPE_BOOL, 	"0", CVAR_SERVER_ONLY_NO_NOTIFY, "Use custom external Map votes by calling from Console Command instead? This will override built-in mapvote AND 'ph_use_custom_mapvote'. See help 'ph_custom_mv_concmd' for more info." }
CVAR["ph_custom_mv_func"]					=	{ CTYPE_STRING, "PHX.StartMapVote()", CVAR_SERVER_ONLY_NO_NOTIFY, "If 'ph_use_custom_mapvote' is set, Use a function to call non-built-in Map Vote system (e.g: From Addons).\nNOTE: 'Case Sensitive' & Local variable will not passed to the given code!" }
CVAR["ph_custom_mv_concmd"]					=	{ CTYPE_STRING, "mv_start", CVAR_SERVER_ONLY_NO_NOTIFY, "If 'ph_use_custom_mapvote_cmd' is set, use this to call mapvote by using from their console command instead. Overrides 'ph_use_custom_mapvote'. If it has arguments, supply them as well. (e.g: start_mapvote 15 (15 by meaning in seconds))" }
-- End of MapVotes

CVAR["ph_exp_rot_pitch"]					=	{ CTYPE_BOOL, 	"0", 	CVAR_SERVER_ONLY_NO_NOTIFY, "[Experimental!] Allow use of pitch rotation on props." }
CVAR["ph_enable_thirdperson"]               =   { CTYPE_BOOL,   "1", 	CVAR_SERVER_ONLY, "Enable thirdperson mode for hunters." }
CVAR["ph_sv_thirdperson_desired"]           =   { CTYPE_BOOL,   "0", 	CVAR_SERVER_ONLY, "Allow thirdperson mode to use Server's Desired Camera position (Disallow player custom position)" }
CVAR["ph_sv_thirdperson_ddist"]             =   { CTYPE_NUMBER, "64", 	CVAR_SERVER_ONLY_NO_NOTIFY, "Thirdperson: Desired Camera Distance.", { min=32, max = 128 } }
CVAR["ph_sv_thirdperson_dright"]            =   { CTYPE_NUMBER, "16", 	CVAR_SERVER_ONLY_NO_NOTIFY, "Thirdperson: Desired Camera Right Position.", { min=-128, max = 128 } }
CVAR["ph_sv_thirdperson_dup"]               =   { CTYPE_NUMBER, "4", 	CVAR_SERVER_ONLY_NO_NOTIFY, "Thirdperson: Desired Camera Up Position.", { min=-32, max = 32 } }

CVAR["ph_falldamage"]						=	{ CTYPE_BOOL,	"1",	CVAR_SERVER_ONLY, "Toggle Fall Damage. Applies for all teams." }
CVAR["ph_falldamage_real"]					=	{ CTYPE_BOOL,	"0",	CVAR_SERVER_ONLY_NO_NOTIFY, "Should Fall Damage dealt by subtracting 10 or realistically." }
CVAR["ph_spect_inform_join_team"]			=	{ CTYPE_BOOL,	"1",	CVAR_SERVER_ONLY, "Inform Unassigned/Spectators with a static text by giving advice to join the game."}

-- Prop Chooser / Prop Menu
CVAR["pcr_enable"]							=	{ CTYPE_BOOL, "1", CVAR_SERVER_ONLY, "Enable Prop Menu Feature?"}
CVAR["pcr_allow_custom"]					=	{ CTYPE_BOOL, "0", CVAR_SERVER_ONLY, "Allow custom prop to be added in the lists?"}
CVAR["pcr_enable_prop_ban"]					=	{ CTYPE_BOOL, "0", CVAR_SERVER_ONLY_NO_NOTIFY, "Allow prop banning before adding to the Prop Menu Lists?"}
CVAR["pcr_max_use"]							=	{ CTYPE_NUMBER, "3", CVAR_SERVER_ONLY, "Maximum usage limit. -1 means unlimited."}
CVAR["pcr_delay_use"]						=	{ CTYPE_FLOAT, "2.00", CVAR_SERVER_ONLY_NO_NOTIFY, "Delay, in seconds before player able to use Prop Menu in next N seconds. (default is 2) - This prevent spamming issues."}

CVAR["pcr_only_allow_certain_groups"]		=	{ CTYPE_BOOL,   "0", CVAR_SERVER_ONLY_NO_NOTIFY, "Should Prop Menu can only accessed by certain groups? (e.g: Donator, etc...)"}
CVAR["pcr_use_ulx_menu"]					=	{ CTYPE_BOOL,   "0", CVAR_SERVER_ONLY_NO_NOTIFY, "Should Prop Menu can be accessed by Console command (0) or ULX command (1)?"}

CVAR["pcr_notify_messages"]					=	{ CTYPE_BOOL, "0", CVAR_SERVER_ONLY, "Notify client about how to use Prop Menu?"}
CVAR["pcr_limit_enable"]					=	{ CTYPE_BOOL, "0", CVAR_SERVER_ONLY,"Enable limit of Maximum Prop addition count (see 'pcr_max_prop_list' for how many models you can limit."}
CVAR["pcr_max_prop_list"]					=	{ CTYPE_NUMBER, "100", CVAR_SERVER_ONLY, "Maximum list of added prop into Prop Menu. (Default is 100)"}
CVAR["pcr_kick_invalid"]					=	{ CTYPE_BOOL, "1", CVAR_SERVER_ONLY_NO_NOTIFY, "Kick any user attempt to access invalid model that does not exists in current map/custom list with threshold 4x max attempts."}
CVAR["pcr_use_room_check"]					=	{ CTYPE_BOOL, "1", CVAR_SERVER_ONLY, "Use Room check before a player use other (larger) object?"}
CVAR["pcr_enable_bbox_limit"]				=	{ CTYPE_BOOL, "0", CVAR_SERVER_ONLY_NO_NOTIFY, "Add BBox Limit (Hull Size) before adding to the Prop Menu Lists (if any/configured)?"}
CVAR["pcr_bbox_max_height"]					=	{ CTYPE_NUMBER, "96", CVAR_SERVER_ONLY_NO_NOTIFY, "BBOX CollissionBound Maximum Height Limit. Default is 96 (normally 72 is a standard hull size Kleiner models."}
CVAR["pcr_bbox_max_width"]					=	{ CTYPE_NUMBER, "72", CVAR_SERVER_ONLY_NO_NOTIFY, "BBOX CollissionBound Maximum Width Limit. Either: 72, 56, 48, 36, 32, ..."}

-- Load & init
if SERVER then
	for name, data in pairs(SVCVAR) do
		local isType = data[1]	   --cvar, value,   flag,    help,   data/f,   f callback, ServerOnlyRealm
		ConVarTranslate[isType].Set( name, data[2], data[3], data[4], data[5], data[6], true )
	end
end

for name, data in pairs(CVAR) do
	local isType = data[1]	   --cvar, value,   flag,    help,   data/f,   f callback, ServerOnlyRealm
	ConVarTranslate[isType].Set( name, data[2], data[3], data[4], data[5], data[6], false )
end

-- Init Specific Global Defaults, if any.
PHX.LegalSoundPath = (PHX.CVAROBJ.SHARED["ph_fc_cue_path"]) and PHX.CVAROBJ.SHARED["ph_fc_cue_path"]:GetString() or "misc/freeze_cam.wav"

--[[ local function InitCVar()
	if SERVER then PHX.cvarsynced = false end
end
hook.Add("Initialize", "PHX.InitCVARs", InitCVar) ]]

local function CheckFlag( cName, flags, iFlagToCheck, sFlagName, sShouldUse )
	if !istable(flags)  or !isnumber(flags) then 
		ErrorNoHalt("[PHX CVAR] Error: Cannot add '".. cName .."', Flags must be either Table or Numbers!")
		return true
	end

	if istable(flags) and table.HasValue(flags, iFlagToCheck) then
		ErrorNoHalt("[PHX CVAR] Error: Cannot add '".. cName .."' to ConVar because it contains flag ["..sFlagName.."] set! Use "..sShouldUse.." instead!")
		return true
	end

	if isnumber(flags) then
		if (bit.band( flags, iFlagToCheck ) == iFlagToCheck) then
			ErrorNoHalt("[PHX CVAR] Error: Cannot add '".. cName .."' to ConVar because it contains flag ["..sFlagName.."] set! Use "..sShouldUse.." instead!")
			return true
		end
	end
	
	return false
end

function PHX:AddCVar( cType, cName, cValue, cFlag, cHelp, cData, cFunc )
	if (!cType or !cName or cValue == nil) then
		ErrorNoHalt("[PHX CVAR] ConVar Type, ConVar Name and ConVar Value cannot be Empty!")
		return
	end

	if (cFlag) and CheckFlag( cName, cFlag, FCVAR_USERINFO, "FCVAR_USERINFO", "PHX:AddCLCVar()") then
		return
	end

	CVAR[cName]	= { cType, cValue, cFlag, cHelp, cData, cFunc }
	ConVarTranslate[cType].Set( cName, cValue, cFlag, cHelp, cData, cFunc, false )
end

function PHX:GetCVar( cvar )
	if (CVAR[cvar]) then
		local isType = CVAR[cvar][1]
		local value	 = CVAR[cvar][2]
		return ConVarTranslate[isType].Get( cvar, value, false )
	end

	PHX:VerboseMsg("[CVar:Shared] CVar "..cvar.." seems do not exists in CVAROBJ.SHARED, try using PHX:GetCLCVar('"..cvar.."') or PHX:GetSVCVar('"..cvar.."')?", 2)
	return nil
end

if SERVER then
	function PHX:SVAddCVar( cType, cName, cValue, cFlag, cHelp, cData, cFunc )
		if (!cType or !cName or cValue == nil) then
			ErrorNoHalt("[PHX CVAR] ConVar Type, ConVar Name and ConVar Value cannot be Empty!")
			return
		end

		if (cFlag) and CheckFlag( cName, cFlag, FCVAR_USERINFO, "FCVAR_USERINFO", "PHX:AddCLCVar()") then
			return
		end

		local svonly=FCVAR_SERVER_CAN_EXECUTE
		if (istable( cFlag ) and !table.HasValue(svonly)) then
			table.insert(cFlag,svonly)
		elseif (isnumber(cFlag) and bit.band(cFlag,svonly) ~= svonly) then
			cFlag = cFlag+svonly
		end

		CVAR[cName]	= { cType, cValue, cFlag, cHelp, cData, cFunc }
		ConVarTranslate[cType].Set( cName, cValue, cFlag, cHelp, cData, cFunc, true )
	end

	function PHX:GetSVCVar( cvar )
		if (SVCVAR[cvar]) then
			local isType = SVCVAR[cvar][1]
			local value	 = SVCVAR[cvar][2]
			return ConVarTranslate[isType].Get( cvar, value, true )
		end

		PHX:VerboseMsg("[CVar:Server] CVar "..cvar.." seems do not exists in CVAROBJ.SERVER, try using PHX:GetCVar('"..cvar.."') instead?",2)
		return nil
	end
end

-- /!\ DEPRECATED /!\
local qcvar_warn=0
function PHX:QCVar( cvar )
	if qcvar_warn < 10 then
		print( "[PHX:QCVar] WARNING: USING THIS IS DEPRECATED! USE PHX:GetCVar/GetSVCVar/GetCLCVar instead!!" )
		qcvar_warn=qcvar_warn+1
	end

	if (CVAR[cvar]) then
		local isType = CVAR[cvar][1] or CTYPE_STRING
		local value = "!error"
		
		if isType == CTYPE_BOOL then
			value = GetConVar( cvar ):GetBool()
		elseif isType == CTYPE_FLOAT then
			value = GetConVar( cvar ):GetFloat()
		elseif isType == CTYPE_NUMBER then
			value = GetConVar( cvar ):GetInt()
		elseif isType == CTYPE_STRING then
			value = GetConVar( cvar ):GetString()
		end
		
		return value
	end
	
	return nil
end

-- /!\  DO NOT USE /!\
if SERVER then
	--[[ local TranslateInit = {
		[CTYPE_BOOL] 	= function(name) BruhGlobalBool(  name, GetConVar(name):GetBool()) 	end,
		[CTYPE_NUMBER]	= function(name) BruhGlobalInt(   name, GetConVar(name):GetInt()) 	end,
		[CTYPE_STRING]	= function(name) BruhGlobalString(name, GetConVar(name):GetString()) end,
		[CTYPE_FLOAT]	= function(name) BruhGlobalFloat( name, GetConVar(name):GetFloat()) 	end,
	}
	
	local SyncCVar()
		for c,v in pairs(CVAR) do
			local isType = v[1]
			local trans = TranslateInit[isType]
			trans(c)
		end
	end ]]
	
	--[[ function PHX:InitCVar()	-- called from init.lua->PlayerInitialSpawn - code is disabled
		SyncCVar()
		self.cvarsynced = true
	end ]]
	
	--[[ hook.Add("PostCleanupMap", "sync_CvarEveryRoundRestart", function()
		PHX:SyncCVar()
	end) ]]
end

-- START OF CLIENT CONVAR

if CLIENT then

	local CLCVAR = {} -- Move outside "Client" Realm for convar dump. Once you're done, get back in.

	CLCVAR["ph_cl_language"]				=	{ CTYPE_STRING, ConVarExists( "ph_default_lang") and PHX:GetCVar( "ph_default_lang" ) or "en_us", true, true, "Prefered language to use" }
	
	-- Old convars that previously placed in cl_init.lua is moved HERE.
	CLCVAR["ph_cl_halos"]					=	{ CTYPE_BOOL, 	"1",	 true, true,  "Toggle Enable/Disable Halo effects when choosing a prop.", {min=0,max=1} }
	CLCVAR["ph_cl_pltext"] 					=	{ CTYPE_BOOL, 	"1",	 true, false, "Options for Text above players. 0 = Disable. 1 = Enable.", {min=0,max=1} }
	CLCVAR["ph_cl_endround_sound"] 			=	{ CTYPE_BOOL, 	"1",	 true, false, "Play a sound when round ends? 0 to disable.", {min=0,max=1} }
	CLCVAR["ph_cl_autoclose_taunt"] 		=	{ CTYPE_BOOL, 	"1",	 true, false, "Auto close the taunt window (When Double Clicking on them)?", {min=0,max=1} }
	CLCVAR["ph_cl_spec_hunter_line"] 		=	{ CTYPE_BOOL, 	"1",	 true, false, "Draw a line on hunters so we can see their aim in spectator mode.", {min=0,max=1} }
	CLCVAR["cl_enable_luckyballs_icon"] 	=	{ CTYPE_BOOL, 	"1",	 true, false, "Enable 'Lucky ball' icon to be displayed once they spawned", {min=0,max=1} }
	CLCVAR["cl_enable_devilballs_icon"] 	=	{ CTYPE_BOOL, 	"1",	 true, false, "Enable 'Devil ball' icon to be displayed once they spawned", {min=0,max=1} }
	CLCVAR["ph_hud_use_new"]				=	{ CTYPE_BOOL, 	"1",	 true, false, "Use new PHX HUD", {min=0,max=1} }
	CLCVAR["ph_show_team_topbar"] 			=	{ CTYPE_BOOL, 	"1",	 true, false, "Show total alive team players bar on the top left", {min=0,max=1} }
	CLCVAR["ph_show_custom_crosshair"]		=	{ CTYPE_BOOL, 	"1",	 true, false, "Show custom crosshair for props", {min=0,max=1} }
	CLCVAR["ph_show_tutor_control"]			=	{ CTYPE_BOOL, 	"1",	 true, false, "Show 'Prop Gameplay Control' hud on each prop spawns. This only show twice and reset until map changes/user disconnect.", {min=0,max=1} }
    -- Mouse right clicking is now client-sided.
    CLCVAR["ph_prop_right_mouse_taunt"]		=	{ CTYPE_BOOL,	"0",     true, true,  "Should Prop also able to Taunt by pressing Right Click?" }

	CLCVAR["ph_default_taunt_key"]			=	{ CTYPE_NUMBER,  KEY_F3, true, true,  "Default random taunt key to be used. Default is F3 ("..tostring(KEY_F3)..")" }
	CLCVAR["ph_default_customtaunt_key"]	=	{ CTYPE_NUMBER,  KEY_C,  true, true,  "Default custom taunt key to be used. Default is C ("..tostring(KEY_C)..")" }
	CLCVAR["ph_default_rotation_lock_key"]	=	{ CTYPE_NUMBER,  KEY_R,  true, true,  "Default Rotation lock key to be used. Default is R ("..tostring(KEY_R)..")" }

	CLCVAR["ph_prop_menu_key"]				=	{ CTYPE_NUMBER,  KEY_F8, true, true,  "Default key to open Prop Menu. Default is F8 ("..tostring(KEY_F8)..")" }
	CLCVAR["ph_prop_midair_freeze_key"]		=	{ CTYPE_NUMBER,  KEY_M,  true, true,  "Default key to freeze your prop while in mid-air. Default is M ("..tostring(KEY_M)..")" }
	
	-- New ClientConvar
	CLCVAR["ph_cl_pitch_taunt_enable"]		=	{ CTYPE_BOOL,	"1",	 true, true,  "Enable pitch level for custom taunts?"}
	CLCVAR["ph_cl_pitch_level"]				=	{ CTYPE_FLOAT,	"100.0", true, true,  "Current pitch level used for.", { min = 1, max = 255 } }
	CLCVAR["ph_cl_pitch_apply_random"]		=	{ CTYPE_BOOL,	"0",	 true, true,  "Apply for random taunts as well."}
	CLCVAR["ph_cl_pitch_randomized"]		=	{ CTYPE_BOOL,	"0",	 true, true,  "Randomize taunt pitch for CUSTOM taunt regardless from the preferred pitch level."}
	CLCVAR["ph_cl_pitch_randomized_random"]	=	{ CTYPE_BOOL,	"0", 	 true, true,  "Randomize taunt pitch for RANDOM taunt regardless from the preferred pitch level." }
	
	CLCVAR["ph_cl_pitch_apply_fake_prop"]	=	{ CTYPE_BOOL,	"0", 	 true, true,  "Apply pitch for fake taunts." }
    CLCVAR["ph_cl_pitch_fake_prop_random"]  =   { CTYPE_BOOL,   "0",     true, true,  "Randomize taunt pitch for FAKE taunt regardless from the preferred pitch level."}
	
	CLCVAR["ph_cl_decoy_spawn_key"]			=	{ CTYPE_NUMBER, KEY_1,	 true, true,  "What key should we use to spawn 'Decoy' prop? Default is Key number 1 ("..tostring(KEY_1)..")" }
    CLCVAR["ph_cl_decoy_spawn_helper"]      =   { CTYPE_BOOL,   "1",     true, false, "Show/Hide a Decoy placement helper? This will show a white dot with a text near on your crosshair." }
    CLCVAR["ph_cl_decoy_spawn_marker"]      =   { CTYPE_BOOL,   "1",     true, false, "Show/Hide Decoy marker?" }
    
    CLCVAR["ph_thirdperson_key"]            =   { CTYPE_NUMBER, KEY_N,   true, true, "Key for Third Person Mode. Only works for Hunters." }
    CLCVAR["ph_tpcam_dist"]                 =   { CTYPE_NUMBER, "64",      true, true, "Forward distance for thirdperson camera.", { min=32, max = 128 } }
    CLCVAR["ph_tpcam_right"]                =   { CTYPE_NUMBER, "16",      true, true, "Right/Left position for thirdperson camera.", { min=-128, max = 128 } }
    CLCVAR["ph_tpcam_up"]                   =   { CTYPE_NUMBER, "5",       true, true, "Up position for thirdperson camera.", { min=-32, max = 32 } }
	
	CLCVAR["ph_cl_unstuck_key"]             =   { CTYPE_NUMBER, KEY_F6,    true, true, "Key to try to unstuck." }

	local cTranslate = {}
	cTranslate[CTYPE_STRING] 	= function(name) return PHX.CVAROBJ.CLIENT[name] and PHX.CVAROBJ.CLIENT[name]:GetString()	or "!error" end
	cTranslate[CTYPE_BOOL] 		= function(name) return PHX.CVAROBJ.CLIENT[name] and PHX.CVAROBJ.CLIENT[name]:GetBool()		or false 	end
	cTranslate[CTYPE_NUMBER] 	= function(name) return PHX.CVAROBJ.CLIENT[name] and PHX.CVAROBJ.CLIENT[name]:GetInt()		or 0		end
	cTranslate[CTYPE_FLOAT] 	= function(name) return PHX.CVAROBJ.CLIENT[name] and PHX.CVAROBJ.CLIENT[name]:GetFloat()	or 0.0		end
	
	local function SetClientConVar (name, value, shouldSave, isUserInfo, help, data, func)
		local min,max

		-- min/max don't work if they're a string value!
		if (data) and istable(data) and !table.IsEmpty(data) then
			min = data.min
			max = data.max
		end

		local cvObj = CreateClientConVar(name, value, shouldSave, isUserInfo, help, min, max)
		PHX.CVAROBJ.CLIENT[name] = cvObj
		
		if (func) and isfunction(func) then func(name, value, cvObj) end
	end
	
	-- immediately create convars
	for cvar,data in pairs(CLCVAR) do
		SetClientConVar(cvar, data[2], data[3], data[4], data[5], data[6], data[7])
	end
	
	function PHX:AddCLCVar(cType, cName, cValue, cSave, cUserInfo, cHelp, cData, cFunc)
		if (!cType or !cName or cValue == nil) then
			ErrorNoHalt("[PHX CVAR] ConVar Type, ConVar Name and ConVar Value cannot be Empty!")
			return
		end
		
		CLCVAR[cName]	= { cType, cValue, cSave, cUserInfo, cHelp, cData, cFunc }
		SetClientConVar( cName, cValue, cSave, cUserInfo, cHelp, cData, cFunc )
	end
	
	function PHX:GetCLCVar( name )
		if (CLCVAR[name]) then
			local id = CLCVAR[name][1]
			local trans = cTranslate[id]( name )
			
			return trans
		end
		
		PHX:VerboseMsg("[CVar:CLIENT] CVar "..cvar.." seems do not exists in CVAROBJ.CLIENT, try using PHX:GetCVar('"..cvar.."') instead?", 2)
		return nil
	end
end

-- END OF CLIENT


-- ConVar Dump for Config File Generator.
-- Do not use this or uncomment, unless if you're know what you're doing.
--[[ function convardumpforcfg()
	local f = PHX.ConfigPath .. "/convardump.txt"
	if CLIENT then
		f = PHX.ConfigPath .. "/convardump_cl.txt"
	end
	
	local t = {}
	local CVX = {}
	if SERVER then
		CVX = CVAR
	else
		CVX = CLCVAR
	end
	
	for cvar,data in SortedPairs(CVX) do
		local value = tostring(data[2])
		local c = data[4] 
		if CLIENT then c = data[5] end
		local strhelp = string.Replace( c, "\n", " " )
		local help  = "// " .. strhelp
		
		table.insert(t, help.."\n"..cvar.."\t"..value)
	end
	
	local concat = table.concat(t,"\n\n")
	
	file.Write(f, concat)
end ]]