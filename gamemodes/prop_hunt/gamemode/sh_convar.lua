local CVAR_SERVER_ONLY				= { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE, FCVAR_NOTIFY }
local CVAR_SERVER_ONLY_NO_NOTIFY 	= { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE }
local CVAR_SERVER_HIDDEN 			= { FCVAR_SERVER_CAN_EXECUTE, 0x10, FCVAR_DONTRECORD }

-- cons
CTYPE_STRING	= 1
CTYPE_NUMBER	= 2
CTYPE_BOOL		= 3
CTYPE_FLOAT		= 4

local ConVarTranslate = {
	[CTYPE_STRING] = {
		Set = function(name, value, fcvar, help, data)
			CreateConVar(name, tostring(value), fcvar, help) -- for string, they don't have min and max convar limit, so we'll use 'function' as our advantage.
			SetGlobalString(name, tostring(value))
			
			if (data and data ~= nil) then
				if type(data) == "function" then data( name, value ) end
			else
				cvars.AddChangeCallback(name, function(_,_,new) SetGlobalString(name, tostring(new)) end, "phx.cvstr_" .. name)
			end
		end,
		Get = function(name, value)
			return GetGlobalString(name, value) --default: 'error'.
		end
	},
	[CTYPE_BOOL] = {
		Set = function(name, value, fcvar, help, data)
			CreateConVar(name, value, fcvar, help, 0, 1) -- Forcing boolean's min max convar limit to "always 0 and 1".
			SetGlobalBool(name, tobool(value))
			
			if (data and data ~= nil) then
				if type(data) == "function" then data( name, value ) end
			else
				cvars.AddChangeCallback(name, function(_,_,new) SetGlobalBool(name, tobool(new)) end, "phx.cvbool_" .. name)
			end
		end,
		Get = function(name, value)
			return GetGlobalBool(name, tobool(value))
		end
	},
	[CTYPE_NUMBER] = {
		Set = function(name, value, fcvar, help, data, f)
			if (data and data ~= nil) then
				if type(data) == "table" then  CreateConVar(name, value, fcvar, help, data.min, data.max) end
			else
				CreateConVar(name, value, fcvar, help)
			end
			SetGlobalInt(name, tonumber(value))
			
			if (f and f ~= nil) then
				if type(f) == "function" then f( name, value ) end
			else
				cvars.AddChangeCallback(name, function(_,_,new) SetGlobalInt(name, tonumber(new)) end, "phx.cvnum_" .. name)
			end
		end,
		Get = function(name, value)
			return GetGlobalInt(name, tonumber(value))
		end
	},
	[CTYPE_FLOAT] = {
		Set = function(name, value, fcvar, help, data, f)
			if (data and data ~= nil) then
				if type(data) == "table" then  CreateConVar(name, value, fcvar, help, data.min, data.max) end
			else
				CreateConVar(name, value, fcvar, help)
			end
			SetGlobalFloat(name, value)
			
			if (f and f ~= nil) then
				if type(f) == "function" then f( name, value ) end
			else
				cvars.AddChangeCallback(name, function(_,_,new) SetGlobalFloat(name, tonumber(new)) end, "phx.cvflt_" .. name)
			end
		end,
		Get = function(name, value)
			return GetGlobalFloat(name, tonumber(value))
		end
	}
}

local CVAR = {}
CVAR["ph_use_lang"]						=	{ CTYPE_BOOL, 	"0", 	 CVAR_SERVER_ONLY, "Enable forced-language to display. THIS WILL BYPASS USER-PREFERED LANGUAGE!" }
CVAR["ph_force_lang"]					=	{ CTYPE_STRING, "en_us", CVAR_SERVER_ONLY, "Default language to force." }
CVAR["ph_default_lang"]					=	{ CTYPE_STRING, "en_us", CVAR_SERVER_ONLY, "This is their first time join to set which language should be set. You should always leave this as 'en_us'." }

CVAR["ph_use_custom_plmodel_for_prop"]	=	{ CTYPE_BOOL, 	"0", CVAR_SERVER_ONLY, "Should use a custom Player's Model for Props when the round begins?" }
CVAR["ph_use_custom_plmodel"]			=	{ CTYPE_BOOL, 	"0", CVAR_SERVER_ONLY, "Should use a custom player model available for Hunters?\nPlease note that you must have to activate \'ph_use_custom_plmodel_for_prop\' too!" }
CVAR["ph_use_playermodeltype"]			=	{ CTYPE_NUMBER, "0", CVAR_SERVER_ONLY, "Which model list that should deliver from? 0 = All Playermodels availale, 1 = Use Legacy method: list.Get('PlayerOptionsModel') (Recommended if you want to custom your model list)", { min = 0, max = 1 } }

CVAR["ph_autotaunt_enabled"]			=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY_NO_NOTIFY, "(Only Apply on New Round has started) Should auto taunting be enabled" }
CVAR["ph_autotaunt_delay"]				=	{ CTYPE_NUMBER, "45", CVAR_SERVER_ONLY_NO_NOTIFY, "Delay in seconds for auto taunt feature" }
CVAR["ph_custom_taunt_mode"]			=	{ CTYPE_NUMBER, "0", CVAR_SERVER_ONLY, "Enable custom taunts for prop teams by pressing C? (Default 0)\n  You must have a list of custom taunts to enable this.", { min = 0, max = 2 } }
CVAR["ph_customtaunts_delay"]			=	{ CTYPE_NUMBER, "6", CVAR_SERVER_ONLY, "How many in seconds delay for props to play custom taunt again? (Default is 6)" }
CVAR["ph_normal_taunt_delay"]			=	{ CTYPE_NUMBER, "2", CVAR_SERVER_ONLY, "How many in seconds delay for props to play normal [F3] taunt again? (Default is 2)" }
CVAR["ph_enable_taunt_scanner"]			=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "(Require Map Restart) Enable Taunt Scanner?" }

CVAR["ph_prop_jumppower"]				=	{ CTYPE_FLOAT, 	"1.4", CVAR_SERVER_ONLY, "Multipliers for Prop Jump Power (Do not confused with Prop's Gravity!). Default is 1.4. Min. 1." }
CVAR["ph_notice_prop_rotation"]			=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Enable Prop Rotation notification on every time Prop Spawns." }

CVAR["ph_freezecam"]					=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Enable Freeze Camera Feature for Props." }
CVAR["ph_freezecam_hunter"]				=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Enable Freeze Camera Feature for Hunters." }
CVAR["ph_fc_use_single_sound"]			=	{ CTYPE_BOOL, 	"0", CVAR_SERVER_ONLY, "Use single Freezecam sound instead of sound list?" }
CVAR["ph_fc_cue_path"]					=	{ CTYPE_STRING, "misc/freeze_cam.wav", CVAR_SERVER_ONLY, "Path for single Freezecam sound.", 
	function(cvarname, val)
		-- override default callback because this is important part.
		cvars.AddChangeCallback( cvarname, function(_,_,new)
			if string.find(new, "\\") then
				print("[!] Warning: Detected Backslash (\\) character! Please use \"/\" instead!")
			end
			-- replace escaped backslash char, if any.
			local ReplaceIllegalPath = string.Replace(new, "\\", "/")
			
			RunConsoleCommand( cvarname, ReplaceIllegalPath )
			SetGlobalString( cvarname, ReplaceIllegalPath )
			PHX.LegalSoundPath = ReplaceIllegalPath
		end, "phx.cvstr_" .. cvarname)
	end
}
PHX.LegalSoundPath							= 	GetGlobalString("ph_fc_cue_path", "misc/freeze_cam.wav")

CVAR["ph_notify_player_join_leave"]			=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Notify Player Join and Leave in the Chat?" }

CVAR["ph_usable_prop_type"]					=	{ CTYPE_NUMBER, "1", CVAR_SERVER_ONLY, "Usable Prop Types. 1 = Physics only, 2 = Dynamics, Ragdolls & Physics, 3 = Almost Anything, 4 = Custom", { min = 1, max = 4 },
	function(cvarname, value)
		cvars.AddChangeCallback( cvarname, function(_,_,new)
			PHX:SetUsableEntity( tonumber(new) )
			SetGlobalInt( cvarname, tonumber(new) )
		end, "phx.cvnum_" .. cvarname )
	end
}
CVAR["ph_usable_prop_type_notice"]			= 	{ CTYPE_BOOL,	"1", CVAR_SERVER_ONLY, "Notify about certain entities cannot be replicated by pressing 'E'. This only works if 'ph_usable_prop_type' is set to '3' or '4'." }

CVAR["ph_enable_lucky_balls"]				=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Spawn Lucky balls on breakable props?" }
CVAR["ph_enable_devil_balls"]				=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Spawn Devil balls when hunter dies?" }

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

CVAR["ph_mkbren_use_new_mdl"]				=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY_NO_NOTIFY, "Use new model for Bren MK II Bonus Weapon (Require Map Restart!!)" }
CVAR["ph_check_props_boundaries"]			=	{ CTYPE_BOOL, 	"0", CVAR_SERVER_ONLY, "Enable prop boundaries/room check? This will prevent you to get stuck with other objects (such as prop, wall, etc)" }
CVAR["ph_enable_plnames"]					=	{ CTYPE_BOOL, 	"0", CVAR_SERVER_ONLY, "Serverside control for if a clients see client\'s team player names through walls." }
CVAR["ph_prop_camera_collisions"]			=	{ CTYPE_BOOL, 	"0", CVAR_SERVER_ONLY, "Attempts to stop props from viewing inside walls." }
CVAR["ph_prop_collision"]					=	{ CTYPE_BOOL, 	"0", CVAR_SERVER_ONLY, "Should Team Props collide with each other?" }
CVAR["ph_add_hla_combine"]					=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Add HLA Combine to default combine models? [REQUIRE MAP RESTART!]" }
CVAR["ph_swap_teams_every_round"]			=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Should teams swapped on every round?" }
CVAR["ph_max_teamchange_limit"]				=	{ CTYPE_NUMBER, "8", CVAR_SERVER_ONLY_NO_NOTIFY, "Define how many times player can change team to another. Default is 5. -1 means disabled." }
CVAR["ph_enable_teambalance"]				=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY_NO_NOTIFY, "Enable Team Balance during round restart?" }
CVAR["ph_use_new_chat"]						=	{ CTYPE_BOOL, 	"0", CVAR_SERVER_ONLY, "!!REQUIRE MAP RESTART!\nUse new (temporary) chat box? This will replace default chatbox and prevent new HUD overlap.", 
function(cvarname, value)	
	cvars.AddChangeCallback( cvarname, function(cv, _, new)
		print(cv .. " -> has changed. Please be sure to Restart the map to take effect!")
		for _,v in pairs(player.GetHumans()) do
			if v:CheckUserGroup() then
				v:ChatPrint("["..cv.."] has changed. Please be sure to Restart the map to take effect!")
			end
		end
		SetGlobalBool(cvarname, tobool(new))
	end, "phx.cvbool_" .. cvarname)
	
end }
CVAR["ph_new_chat_pos_sub"]					=	{ CTYPE_NUMBER, "50", CVAR_SERVER_ONLY_NO_NOTIFY, "Move (in pixels) by substracting chat position Y pixels high. Negative (-) means to move it lower." }

CVAR["ph_allow_respawnonblind"]				=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Allow fast respawn during blind time?" }
CVAR["ph_allow_respawnonblind_team_only"]	=	{ CTYPE_NUMBER, "0", CVAR_SERVER_ONLY, "If specified, what team should be allowed to respawn? 0 = ALL TEAMS, 1 = HUNTERS, 2 = PROPS", { min = 0, max = 2 } }
CVAR["ph_allow_respawn_from_spectator"]		=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Allow Spectators join to any team and respawns during blind time?" }
CVAR["ph_blindtime_respawn_percent"]		=	{ CTYPE_FLOAT, 	"0.75", CVAR_SERVER_ONLY, "How much time percentage to allow player Respawn during Blind time? Default is 0.75 (75%)", { min = 0.30, max = 1.00 } }
CVAR["ph_allow_respawnonblind_teamchange"]	=	{ CTYPE_BOOL, 	"0", CVAR_SERVER_ONLY, "Not recommended if allowed: Allow respawn during blind time FROM team changes (from props to hunters, vice versa).\nI don't recommend enabling this because players may able to use this to take advantage by sitting on Prop team everytime.\nEnable this ONLY if you know what you're doing!" }
CVAR["ph_allow_pickup_object"]				=	{ CTYPE_NUMBER, "3", CVAR_SERVER_ONLY, "Allow pickup objects? 0=No, 1=Hunters Only, 2=Props Only, 3=Everyone", { min = 0, max = 3 } }

CVAR["ph_use_custom_mapvote"]				=	{ CTYPE_BOOL, 	"0", CVAR_SERVER_ONLY_NO_NOTIFY, "Use custom external Map votes system?" }
CVAR["ph_custom_mv_func"]					=	{ CTYPE_STRING, "MapVote.Start()", CVAR_SERVER_HIDDEN, "If 'ph_use_custom_mapvote' specified, what's the map vote function to call in LUA?\nNOTE: Case Sensitive! Local variable will not passed to the given code." }

-- Taken from PH:E v16. This addition was made by Fafy
CVAR["ph_forcejoinbalancedteams"]			=	{ CTYPE_BOOL, 	"0", CVAR_SERVER_ONLY, "Force players to even out teams upon joining? Setting 0 means do not force to join in balanced teams." }
CVAR["ph_smggrenadecounts"]					=	{ CTYPE_NUMBER, "1", CVAR_SERVER_ONLY, "How many grenades for SMG1 served on spawn?", { min = 1, max = 10 } }

CVAR["ph_prop_right_mouse_taunt"]			=	{ CTYPE_BOOL,	"1", CVAR_SERVER_ONLY_NO_NOTIFY, "Should Prop also able to Taunt by pressing Right Click?"}

CVAR["ph_print_verbose"]					=	{ CTYPE_BOOL,	"0", CVAR_SERVER_ONLY_NO_NOTIFY, "Developer Verbose. Some printed messages will only appear if this is enabled." }

CVAR["ph_randtaunt_map_prop_enable"]		=	{ CTYPE_BOOL,	"1", CVAR_SERVER_ONLY, "Allow fake taunts to be played on random props in the maps. Can be accessed only through Custom Taunt menu." }
CVAR["ph_randtaunt_map_prop_max"]			=	{ CTYPE_NUMBER, "6", CVAR_SERVER_ONLY, "Maximum usage for fake taunts to be used. -1 is unlimited (Be warned though,I don't recommend to set this as unlimited!)" }

-- todo: Pitch convar for server, and 1 client (to store their setting.)

-- Prop Chooser / Prop Menu
CVAR["pcr_enable"]							=	{ CTYPE_BOOL, "1", CVAR_SERVER_ONLY, "Enable Prop Chooser Feature?"}
CVAR["pcr_allow_custom"]					=	{ CTYPE_BOOL, "0", CVAR_SERVER_ONLY, "Allow custom prop to be added in the lists?"}
CVAR["pcr_enable_prop_ban"]					=	{ CTYPE_BOOL, "0", CVAR_SERVER_ONLY_NO_NOTIFY, "Allow prop banning before adding to the Prop Chooser Lists?"}
CVAR["pcr_limit_enable"]					=	{ CTYPE_BOOL, "0", CVAR_SERVER_ONLY,"Enable limit into Maximum Prop Entries (see pcr_max_prop_list for how many props model you'll need to limit."}
CVAR["pcr_max_use"]							=	{ CTYPE_NUMBER, "3", CVAR_SERVER_ONLY, "Maximum usage limit. -1 means unlimited."}
CVAR["pcr_delay_use"]						=	{ CTYPE_FLOAT, "2.00", CVAR_SERVER_ONLY_NO_NOTIFY, "Delay, in seconds before player able to use Prop Chooser in next N seconds. (default is 2) - This prevent spamming issues."}

CVAR["pcr_notify_messages"]					=	{ CTYPE_BOOL, "0", CVAR_SERVER_ONLY, "Notify client about how to use Prop Chooser?"}
CVAR["pcr_max_prop_list"]					=	{ CTYPE_NUMBER, "100", CVAR_SERVER_ONLY, "Maximum list that props will be listed."}
CVAR["pcr_kick_invalid"]					=	{ CTYPE_BOOL, "1", CVAR_SERVER_ONLY_NO_NOTIFY, "Kick any user attempt to access invalid model that does not exists in current map/custom list with threshold 4x max attempts."}
CVAR["pcr_use_room_check"]					=	{ CTYPE_BOOL, "0", CVAR_SERVER_ONLY, "Use Room check before a player use other (larger) object? Disable this if you're facing with 'there is no room to change' message."}
CVAR["pcr_enable_bbox_limit"]				=	{ CTYPE_BOOL, "0", CVAR_SERVER_ONLY_NO_NOTIFY, "[!] Add BBox Limit (Hull Size) before adding to the Prop Chooser Lists (if any/configured)?"}
CVAR["pcr_bbox_max_height"]					=	{ CTYPE_NUMBER, "96", CVAR_SERVER_ONLY_NO_NOTIFY, "[!] BBOX CollissionBound Maximum Height Limit. Default is 96 (normally 72 is a standard hull size Kleiner models."}
CVAR["pcr_bbox_max_width"]					=	{ CTYPE_NUMBER, "72", CVAR_SERVER_ONLY_NO_NOTIFY, "[!] BBOX CollissionBound Maximum Width Limit. Default is 72, 56 or 48."}

CVAR["pcr_only_allow_certain_groups"]		=	{ CTYPE_BOOL, "0", CVAR_SERVER_ONLY_NO_NOTIFY, "Should Prop Menu can only accessed by certain groups? (e.g: Donator, etc...)"}
CVAR["pcr_use_ulx_menu"]					=	{ CTYPE_BOOL, "0", CVAR_SERVER_ONLY_NO_NOTIFY, "Should Prop Menu can be accessed by Console command (0) or ULX command (1)?"}

-- Load & init

for name, data in pairs(CVAR) do
	local isType = data[1]	   --cvar, value,   flag,    help,   data/f,   f callback
	ConVarTranslate[isType].Set( name, data[2], data[3], data[4], data[5], data[6] )
end

local function InitCVar()	
	if SERVER then PHX.cvarsynced = false end
end
hook.Add("Initialize", "PHX.InitCVARs", InitCVar)

-- here you can make a proper replicated convar.
-- however, they will be updated after new round (PostCleanupMap) event occured.
function PHX:AddCVar( cType, cName, cValue, cFlag, cHelp, cData, cFunc )
	if (!cType or cType == nil or !cName or cName == nil or cValue == nil) then
		ErrorNoHalt("[PHX CVAR] ConVar Type, ConVar Name and ConVar Value cannot be Empty!")
		return
	end
	
	if (cFlag and cFlag ~= nil) and istable(cFlag) and table.HasValue(cFlag, FCVAR_USERINFO) then
		ErrorNoHalt("[PHX CVAR] Error: Cannot add '".. cName .."' to Shared ConVar because it contains FCVAR_USERINFO flag set! Please use PHX:AddCLCVar() instead!")
		return
	end

	CVAR[cName]	= { cType, cValue, cFlag, cHelp, cData, cFunc }
	ConVarTranslate[cType].Set( cName, cValue, cFlag, cHelp, cData, cFunc )
end

-- Use this on Clients. Do Not use on Server Side unless you know what you're doing.
-- Either use GetConVar for global/engine convar, or use PHX:QCVar to retreive PHX convars only (Does not work for global / engines convars).
function PHX:GetCVar( cvar )

	if CVAR[cvar] and CVAR[cvar] ~= nil then
		local isType = CVAR[cvar][1]
		local value	 = CVAR[cvar][2]
		return ConVarTranslate[isType].Get( cvar, value ) -- value = default value for GetGlobal*'s failed value.
	end
	
	return nil -- should return nil instead of false.
end

-- /!\ DO NOT USE THIS IF YOUR REPLICATION IS WORKED.
-- /!\ THIS SHOULD **ONLY** BE USED IN FOLLOWING CONDITIONS OR HOOKS:
	-- > GM:Initialize
	-- > GM:Pre/On/PostGamemodeLoaded
	-- > Any Early Hooks before Config (*.cfg) Files are Loaded
	-- > PlayerInitSpawn or InitPostEntity ARE NOT NEEDED. Use PHX:GetCVar() instead!
-- See Example of how PHX:GetCVar() can get bugged on PHX.VerboseMsg()
function PHX:QCVar( cvar )
	if CVAR[cvar] and CVAR[cvar] ~= nil then
		local isType = CVAR[cvar][1]
		local value
		
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

function PHX:DebugCVar()
	for c,_ in pairs(CVAR) do
		print("['".. c .."'] | GetConVar/QCVar: " .. tostring(self:QCVar(c)) .. " -> GetGlobal*: " .. tostring(self:GetCVar(c)) )
	end
end

-- /!\  DO NOT USE /!\ -- Refresh the convar after config files are loaded.
if SERVER then
	local TranslateInit = {
		[CTYPE_BOOL] 	= function(name) SetGlobalBool(  name, GetConVar(name):GetBool()) 	end,
		[CTYPE_NUMBER]	= function(name) SetGlobalInt(   name, GetConVar(name):GetInt()) 	end,
		[CTYPE_STRING]	= function(name) SetGlobalString(name, GetConVar(name):GetString()) end,
		[CTYPE_FLOAT]	= function(name) SetGlobalFloat( name, GetConVar(name):GetFloat()) 	end,
	}
	
	function PHX:SyncCVar()
		for c,v in pairs(CVAR) do
			local isType = v[1]
			local trans = TranslateInit[isType]
			trans(c)
		end
	end
	
	function PHX:InitCVar()	-- called from: init.lua@631
		self:SyncCVar()
		self.cvarsynced = true
	end
	
	hook.Add("PostCleanupMap", "sync_CvarEveryRoundRestart", function()
		PHX:SyncCVar()
	end)
end

-- START OF CLIENT CONVAR

if CLIENT then
	
	local CLCVAR = {}

	CLCVAR["ph_cl_language"]				=	{ CTYPE_STRING, GetGlobalString("ph_default_lang", "en_us"), true, true, "Prefered language to use" }

	CLCVAR["ph_default_taunt_key"]			=	{ CTYPE_NUMBER,  KEY_F3, true, true, "Default random taunt key to be used. Default is F3 ("..tostring(KEY_F3)..")" }
	CLCVAR["ph_default_customtaunt_key"]	=	{ CTYPE_NUMBER,  KEY_C,  true, true, "Default custom taunt key to be used. Default is C ("..tostring(KEY_C)..")" }
	CLCVAR["ph_default_rotation_lock_key"]	=	{ CTYPE_NUMBER,  KEY_R,  true, true, "Default Rotation lock key to be used. Default is R ("..tostring(KEY_R)..")" }

	CLCVAR["ph_prop_menu_key"]				=	{ CTYPE_NUMBER,  KEY_F8, true, true, "Default key to open Prop Menu. Default is F8 ("..tostring(KEY_F8)..")" }
	CLCVAR["ph_prop_midair_freeze_key"]		=	{ CTYPE_NUMBER,  KEY_M,  true, true, "Default key to freeze your prop while in mid-air. Default is M ("..tostring(KEY_M)..")" }

	local cTranslate = {}

	cTranslate[CTYPE_STRING] 	= function(name) return GetConVar(name):GetString()	end
	cTranslate[CTYPE_BOOL] 		= function(name) return GetConVar(name):GetBool() 	end
	cTranslate[CTYPE_NUMBER] 	= function(name) return GetConVar(name):GetInt() 	end
	cTranslate[CTYPE_FLOAT] 	= function(name) return GetConVar(name):GetFloat() 	end
	
	local function SetClientConVar (name, value, shouldSave, isUserInfo, help, data, func)
		if (data and data ~= nil) then
			-- Note: String wouldn't work if data.min and data.max is present. You've been warned!
			if type(data) == "table" and (not table.IsEmpty(data)) then
				CreateClientConVar(name, value, shouldSave, isUserInfo, help, data.min, data.max)
			end
		else
			CreateClientConVar(name, value, shouldSave, isUserInfo, help)
		end
		
		-- do something within the function with associated cvar, if any.
		if (func and func ~= nil) then
			if type(func) == "function" then func(name, value) end
		end
	end
	
	-- immediately create convars
	for cvar,data in pairs(CLCVAR) do
		SetClientConVar(cvar, data[2], data[3], data[4], data[5], data[6], data[7])
	end
	
	function PHX:AddCLCVar(cType, cName, cValue, cSave, cUserInfo, cHelp, cData, cFunc)
		if (!cType or cType == nil or !cName or cName == nil or cValue == nil) then
			ErrorNoHalt("[PHX CVAR] ConVar Type, ConVar Name and ConVar Value cannot be Empty!")
			return
		end
		
		CLCVAR[cName]	= { cType, cValue, cSave, cUserInfo, cHelp, cData, cFunc }
		SetClientConVar( cName, cValue, cSave, cUserInfo, cHelp, cData, cFunc )
	end
	
	function PHX:GetCLCVar( name )
		if CLCVAR[name] and CLCVAR[name] ~= nil then
			local id = CLCVAR[name][1]
			local trans = cTranslate[id]( name )
			
			return trans
		end
		
		return nil
	end
end

-- END OF CLIENT