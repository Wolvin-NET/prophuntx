-- Kindly free to improve the language.

-- Originally written by: Fafy
-- Improved by Wolvindra-Vinzuerio & Godfather

local LANG = {}

LANG.code = "en_us"

LANG.Name 		 	= "English" -- example: "Bahasa Indonesia"
LANG.NameEnglish	= "English" -- Your Language but spoken in English, example: "Indonesian"
LANG.Author			= "Wolvindra-Vinzuerio, Godfather, Fafy" -- Only accept STRINGS.
-- Can Accept: String, and Table.
LANG.AuthorURL		= {	
	"https://steamcommunity.com/profiles/76561198086789110", 
	"https://steamcommunity.com/profiles/76561198283562416", 
	"https://steamcommunity.com/profiles/76561198016233242"
}

-- Special Section that isn't String-based
LANG.SUICIDEMSG = { --> FRETTA
	"suicided!", -- i believe this was from 9gag joke.
	"died mysteriously.",
	"died from magic.",
	"no-scoped themself.",
	"has just ragequit.",
	"is drunk.",
	"died... better luck next time!",
	"slapped themself.",
	"tripped on a stick.",
	"died by the force.",
	"ragdolled.",
}

LANG.RANDOM_SPECTATORS = { --> FRETTA
	"to watch and chill.",
	"to see them hanging around.",
	"to see the things.",
	" ",
}

-- List of string-based translation

-- // FRETTA SECTION \\
--  FRETTA: Kill text (X killed Y)
LANG["HUD_KILLED"]				= "killed"

-- FRETTA: HUDs
LANG["HUD_TIME"] 				= "TIME"
LANG["HUD_ROUND"]				= "ROUND"
LANG["HUD_WAITPLY"]				= "Waiting for players..."
LANG["HUD_DEAD"]				= "(DEAD) "

LANG["HUD_TEAMWIN"]				= "%s win!"
LANG["HUD_LOSE"]				= "Draw, everyone loses!"
LANG["MISC_TIMELEFT"]			= "Time Left: %s"
LANG["MISC_GAMEEND"] 			= "Game will end after this round"

-- FRETTA: Team selection screen (F2)
LANG["DERMA_TEAMSELECT"]		= "Choose Team"

-- FRETTA: F1 screeen
LANG["DERMA_RTV"] 				= "Vote For Change (RTV)"
LANG["DERMA_PHMENU"] 			= "Prop Hunt Menu"
LANG["DERMA_CHANGETEAM"]		= "Change Team"

-- FRETTA: Scoreboard
LANG["DERMA_PLAYER"]			= "(%d player)"	
LANG["DERMA_PLAYERS"]			= "(%d players)"
LANG["DERMA_NAME"]				= "Name"
LANG["DERMA_KILLS"]				= "Kills"
LANG["DERMA_DEATHS"]			= "Deaths"
LANG["DERMA_PING"]				= "Ping"

LANG["CHAT_JOINED"]				= " joined "
LANG["CHAT_JOINEDTHE"]			= " joined the "

LANG["CHAT_SWAPBALANCE"]		= "%s has been changed to %s for team balance."
LANG["CHAT_SWAPBALANCEYOU"]		= "You were swapped to achieve perfect balance." -- Smile... for even in death, you have become children of Thanos
-- // END OF FRETTA SECTION \\

LANG["HELP_F1"] 				= [[A Prop Hunt X Project.

A project to make Prop Hunt be more modern and customisable.

More info can be found at:
https://wolvindra.xyz/prophuntx

To See more info, help and guide, Press [F1] key and then click [Prop Hunt Menu] button.

Version: ]].. PHX.VERSION ..[[ Revision: ]].. PHX.REVISION ..[[

Have Fun!]]

-- Important!
LANG["LANGUAGE_CHANGED"]		= "Prefered Language has been changed to %s"

-- internal cl_menutypes section.
LANG["SUBTYPE_PREFERED_LANG"]	= "Prefered Language"
--LANG["SUBTYPE_TEXTENTRY_?"]	= "???"

-- Events
LANG["EV_PLAYER_CONNECT"]		= "%s has connected to the server."
LANG["EV_PLAYER_JOINED"]		= "%s has joined to the server."
LANG["EV_PLAYER_DISCONNECT"]	= "%s has disconnected from the server (Reason: %s)"

-- HUD elements
LANG["HUD_HP"]					= "HEALTH"
LANG["HUD_AMMO"] 				= "AMMO"	-- obsolete
LANG["HUD_MAGSEC"]				= "MAG. / SEC." --Magazine Counts (separator) Secondary Magazine Counts

-- !!WEAPON NAMES CANNOT BE TRANSLATED, THEY USE FROM language.GetPhrase THEREFORE IT'S IMPOSSIBLE TO DO.

LANG["TEAM_PROPS"]				= "Props"
LANG["TEAM_HUNTERS"]			= "Hunters"

LANG["HUD_ROTLOCK"]				= "Prop Rotation: Locked"
LANG["HUD_ROTFREE"]				= "Prop Rotation: Free"
LANG["HUD_KILLEDBY"]			= "You were killed by %s"

LANG["HUD_AUTOTAUNT"]			= "Auto Taunting in %d second(s)"
LANG["HUD_AUTOTAUNT_ALT"]		= "Auto Taunting in %d"

LANG["HUD_TargetID"]			= "Player: %s (%d%%)" -- Player: <NAME> (<HEALTH>%)

LANG["HUD_BLINDED"]				= "Hunters will be unblinded and released in %s"
LANG["HUD_UNBLINDED"]			= "Ready or not, here we come!"

LANG["BLIND_RESPAWN_TEAM"]		= "You were respawned only on %s team in %d seconds during blind time."
LANG["BLIND_RESPAWN"]			= "You were respawned in %d seconds during blind time."

LANG["MISC_ACCEPT"]				= "Accept"
LANG["MISC_OK"]					= "OK"
LANG["MISC_CLOSE"]				= "Close"
LANG["MISC_PREV"]				= "< PREVIOUS"
LANG["MISC_NEXT"]				= "NEXT >"
LANG["MISC_ACCESSDENIED"]		= "Access Denied"

-- Chat messages
LANG["CHAT_NOPLAYERS"]			= "There's not enough players to start the game!"
LANG["CHAT_SWAP"]				= "Teams have been swapped!"

LANG["CHAT_SWAPTEAM_WARNING"]   = "You have switched teams %dx (%dx MAX). After that, You can no longer switch to opposite team."
LANG["CHAT_SWAPTEAM_REVERT"]	= "Cannot switch to team %s because you have exceeded the number of team changes."

LANG["CHAT_PROP_NO_ROOM"] 		= "There is no room to change for that prop!"

-- Notification
LANG["NOTIFY_IN_PROP_TEAM"]		= "You are in Prop Team with Rotate support! You can rotate prop around by moving your mouse."
LANG["NOTIFY_ROTATE_NOTICE"]	= "Additionally you can toggle lock rotation by pressing (by default) [R] key!"

-- Custom Taunt Window
LANG["TM_WARNING_CT_DISABLE"]	= "[PHX - Taunts] Warning: This server has custom taunts disabled."
LANG["TM_NO_TAUNTS"]			= "Warning: No taunts were detected in this category."
LANG["TM_PLAY_ONLY_ALIVE"] 		= "You are only allowed to play Custom Taunts when you're alive."

LANG["TM_WINDOW_TITLE"]			= "Prop Hunt Custom Taunt Window"
LANG["TM_NOTICE_PLSWAIT"]		= "Please wait in %s second(s)!"
LANG["TM_NOTICE_PLAYPREVIEW"]	= "Previewing Taunt: %s"

LANG["TM_TOOLTIP_PLAYTAUNT"] 	= "Play Taunt"
LANG["TM_TOOLTIP_PREVIEW"]		= "Preview Taunt"
LANG["TM_TOOLTIP_PLAYCLOSE"]	= "Play Taunt and Close"
LANG["TM_TOOLTIP_PLAYRANDOM"]	= "Play Random Taunt"
LANG["TM_TOOLTIP_CLOSE"]		= "Close"
LANG["TM_MENU_CLOSE"]			= "Close Menu"

LANG["TM_DELAYTAUNT_NOT_EXIST"] = "The taunt you were selected wasn't found in server!"
LANG["TM_DELAYTAUNT_PLSWAIT"]	= "Please wait in %s second(s)!"

--[[
	PHX Menu window
]]
LANG["PHXM_WINDOW_TITLE"]		= "Prop Hunt X - Advanced Setting & Menu"
LANG["SERVER_INFO_MOTD"]		= "SERVER INFORMATION & RULES [MOTD]"

LANG["PHXM_TAB_HELP"]			= "Help & Guide"
LANG["PHXM_TAB_MUTE"]			= "Player Muting"
LANG["PHXM_TAB_PLAYER"]			= "Player Settings"
LANG["PHXM_TAB_MODEL"] 			= "Model Browser"
LANG["PHXM_TAB_MODEL_DISABLED"]	= "Model Browser (Disabled)" -- Obsolete -- Revision Edit: 16.09.21/X2Z
LANG["PHXM_TAB_ADMIN"]			= "Admin Settings"
LANG["PHXM_TAB_ABOUT"]			= "About PH:X"
LANG["PHXM_TAB_MAPVOTE"]		= "MapVote"
LANG["PHXM_TAB_PLUGINS"]		= "Addons/Plugins"

LANG["PHXM_CVAR_CHANGED"]		= "[Settings] CVar %q has been changed to %q"

--[[
	Player Mute Settings
]]
LANG["PHXM_MUTE_SELECT"]		= "Select any player that you want to mute."

--[[ 
	Player Settings
]]
LANG["PHXM_PLAYER_OPTIONS"]		= "Player Options"
LANG["PHXM_PLAYER_LANG"]		= "Languages"
LANG["PHXM_PLAYER_BIND"]		= "Binds"
LANG["PHXM_PLAYER_HUDSETTINGS"]	= "HUD Settings"

LANG["PHXM_PLAYER_TAUNT_KEY"]			= "Random Taunt Key"
LANG["PHXM_PLAYER_TAUNTWINDOW_KEY"]		= "Taunt Menu Key"
LANG["PHXM_PLAYER_ROTATLOCK_KEY"]		= "Rotation Lock Key"

LANG["PHXM_PLAYER_TOGGLE_HALOS"]		= "Toggle Halo effect when choosing a prop"
LANG["PHXM_PLAYER_IDNAMES"]				= "Show Team players names' above their heads instead (and appear through wall too)"
LANG["PHXM_PLAYER_ENDROUND_CUE"]		= "Play End round sound cue"
LANG["PHXM_PLAYER_TAUNTMENU_AUTOCLOSE"]	= "Option for Auto closing for Taunt window when double-clicking them"
LANG["PHXM_PLAYER_SEE_HUNTER_LINE"]		= "Draw a line on hunters so we can see their aim in spectator mode."
LANG["PHXM_PLAYER_SEE_LBALL_ICONS"]		= "Enable 'Lucky ball' icon to be displayed once they are spawned"
LANG["PHXM_PLAYER_SEE_CRYSTAL_ICONS"]	= "Enable 'Devil ball' icon to be displayed once they are spawned"

LANG["PHXM_PLAYER_USE_NEW_HUD"]			= "Use New PH: Enhanced HUD"
LANG["PHXM_PLAYER_SHOW_TUTOR"]			= "Show Tutorial Pop-up (Shown only 2x on each prop spawns)"
LANG["PHXM_PLAYER_USE_NEW_CROSSHAIR"]	= "Enable Custom Crosshair"
LANG["PHXM_PLAYER_SHOW_TEAM_TOPBAR"]	= "Show total alive team players bar on the top left (At least 4 Players will be shown)"

--[[
	Player model Browser Section
]]
LANG["QUERY_MODEL_SELECTED"]	= "Model %s has been selected and it will be applied after respawn!"
LANG["QUERY_MODEL_INFO"]		= "Model name: %s - Available for: Everyone"

LANG["MDL_MENU_REFRESH"] 		= "Refresh Icon"
LANG["MDL_MENU_PREVIEW"] 		= "Preview Model"
LANG["MDL_MENU_MODELINFO"] 		= "Model Information"


LANG["MISC_APPLYMDL"] 			= "Apply Model"

LANG["PHXM_MODEL_DISABLED"] 	= "Sorry, Custom Player Models are disabled on this server!"
LANG["PHXM_PLAYERMODEL_SETFOV"]	= "  Set Model FOV"

--[[
	Server Settings
]]
LANG["PHXM_ADMIN_OPTIONS"]		= "Serverside gamemode Options (Only visible for Admins/Owner)"
LANG["PHXM_ADMIN_MUSTALIVE"]	= "You must be alive in order to do this operation."

--[[
	Language Override
]]
LANG["PHXM_ADMIN_LANGOVERRIDE"]	= "Language Override"

LANG["PHXM_ADMIN_FORCELANG"] 				= "Use forced language? This will override client language to use Server's choosen language."
LANG["PHXM_ADMIN_LANGTOUSE"]				= "Forced Language to use."
LANG["PHXM_ADMIN_PLAYERDEFAULTLANG"] 		= "Default player language when joining on first time play."

-- Gameplay settings
LANG["PHXM_ADMIN_CUSTOM_MODEL"]				= "Enable custom models for Hunters"
LANG["PHXM_ADMIN_CUSTOM_MODEL_PROP"]		= "Enable custom models for Props - Make sure to enable for Hunter too."
LANG["PHXM_ADMIN_TAUNT_DELAY_CUSTOM"]		= "Custom Taunts Delay (Seconds)"
LANG["PHXM_ADMIN_TAUNT_DELAY_RANDOM"]		= "Normal Taunts Delay (Seconds)"
LANG["PHXM_ADMIN_TAUNT_DELAY_AUTO"]			= "Auto Taunts Delay (Seconds)"
LANG["PHXM_ADMIN_AUTOTAUNT_ENABLE"]			= "Enable Auto Taunt Features (Proper Timer will be fixed on next round)"	-- Revision Edit: 16.09.21/X2Z

LANG["PHXM_ADMIN_NOTICE_ROTATION"]			= "Display 'Prop Rotation' notification on every Prop Spawns"
LANG["PHXM_ADMIN_CAMERA_COLLIDE"]			= "Enable Prop Camera collision to the wall"
LANG["PHXM_ADMIN_FREEZECAM"]				= "Enable Freeze Cam features for team props"
LANG["PHXM_ADMIN_FREEZECAM_HUNTER"]			= "Enable Freeze Cam features for team hunters"
LANG["PHXM_ADMIN_PROP_COLLIDE"]				= "Enable Prop collide on each other prop players"
LANG["PHXM_ADMIN_SWAP_TEAM"] 				= "Swap team every round - Disabling means team will stay forever."
LANG["PHXM_ADMIN_HUNTER_PENALTY"]			= "Hunter health penalty"
LANG["PHXM_ADMIN_HUNTER_KILL_BONUS"]		= "Hunter kill bonus"
LANG["PHXM_ADMIN_HUNTER_SMG_GRENADES"]		= "Hunter SMG grenades"
LANG["PHXM_ADMIN_GAME_TIME"]				= "(Require Map Restart) Total Game time (Minutes)"		-- Revision Edit: 16.09.21/X2Z
LANG["PHXM_ADMIN_BLINDLOCK_TIME"]			= "Hunter blindlock time (Seconds)"
LANG["PHXM_ADMIN_ROUND_TIME"]				= "(Require Map Restart) Game round time (Seconds)"		-- Revision Edit: 16.09.21/X2Z
LANG["PHXM_ADMIN_ROUNDS_PER_MAP"]			= "(Require Map Restart) Total game Rounds per Map"		-- Revision Edit: 16.09.21/X2Z
LANG["PHXM_ADMIN_ENABLE_LUCKYBALL"]			= "Allow Lucky Balls Features to be spawned on breakable props (Chance is 8%)"
LANG["PHXM_ADMIN_ENABLE_CRYSTAL"]			= "Allow Devil Balls Features to be spawned when hunter dies (Always Spawn)"	-- Revision Edit: 16.09.21/X2Z
LANG["PHXM_ADMIN_WAIT_PLAYERS"]				= "Wait for Players to begin the gameplay"
LANG["PHXM_ADMIN_WAIT_MIN_PLAYERS"]			= "Mininum Players to Wait before the game starts (default: 1)"
LANG["PHXM_ENABLE_PLAYER_JOIN_LEAVE"] 		= "Enable chat notification for player join and leave? Set this 0 if you prefer to use with your own Custom Chat addon."

LANG["PHXM_ADMIN_FORCEJOINBALANCE"]			= "Force players to even out teams upon joining"
LANG["PHXM_ADMIN_ENABLETEAMBALANCE"]		= "Automatically even out teams at the start of a round (Team Balance)"
LANG["PHXM_ADMIN_PICKUP_PROPS"] 			= "Allow pick up of small props? 0: Dont Allow, 1: Hunters Only, 2: Props Only, 3: Allow Everyone."

LANG["PHXM_ADMIN_TAUNTMODES"]			= "Taunt Modes"
LANG["PHXM_ADMIN_TAUNTMODE_MODE"]		= "--[Current Taunt Mode is: %d ]--"
LANG["PHXM_ADMIN_TAUNTMODE0"]			= "Mode [0]: F3/Random Taunt"
LANG["PHXM_ADMIN_TAUNTMODE1"]			= "Mode [1]: C/Custom Taunt"
LANG["PHXM_ADMIN_TAUNTMODE2"]			= "Mode [2]: Both Modes"
LANG["PHXM_ADMIN_TAUNTSOPEN"]			= "Open Taunt Window"

LANG["PHXM_MODE_DEFAULT"] 				= "--[ Pickup Mode is set to %d ]--"
LANG["PHXM_MODE0"]						= "Mode [0]: Don't Allow"
LANG["PHXM_MODE1"]						= "Mode [1]: Hunters Only"
LANG["PHXM_MODE2"]						= "Mode [2]: Props Only"
LANG["PHXM_MODE3"]						= "Mode [3]: Allow Pickup"

--[[
	Admin Developer Sections
]]
LANG["PHXM_ADMIN_DEVSECTION"]		= "Developer Options/Experimentals Features"
LANG["PHXM_ADMIN_ROOMCHECK"]		= "Enable Boundaries Check? This prevents you getting stuck with objects/walls."
LANG["PHXM_ADMIN_USENEWMKBREN"]		= "Use new model for Bren MK II bonus weapon (Require Map Restart)"
LANG["PHXM_ADMIN_BEVERBOSE"]		= "Developer: Be Verbose - Enable PH:X to print all information and events verbosely?"
LANG["PHXM_ADMIN_SHOWPLNAMEHEAD"]	= "Enable Player team names to appear on their screen."
LANG["PHXM_ADMIN_USESINGLE_FZCAM"]	= "Use single Freezecam sound instead of sound list (Use 'ph_fc_cue_path' to determine Freezecam sound path)"
LANG["PHXM_ADMIN_MODELLISTINGTYPE"] = "Use Legacy Model List : 0 = All Playermodels (AddValidModel), 1 = Use Legacy: list.Get('PlayerOptionsModel')"
LANG["PHXM_ADMIN_JUMPPOWER"]		= "Additional Jump Power multiplier for Props"
LANG["PHXM_ADMIN_ENABLE_OBB"]		= "Developer: Enable Customized Prop Entities Model Boundaries (OBB) Modifier from config data"
LANG["PHXM_ADMIN_RELOAD_OBB"]		= "Developer: Reload OBB Modifier data every round restarts"

--[[
	Experimental & PH:X Features
]]
LANG["PHXM_ADMIN_EXPERIMENTALPHX"]			= "New PHX Experimental Sections"

LANG["PHXM_ADMIN_HLA_COMBINE"]				= "Add HL: Alyx Combine model support"
LANG["PHXM_ADMIN_TEAMBALANCE"]				= "Enable Team Balance"
LANG["PHXM_ADMIN_CHANGETEAM_LIMIT"]			= "Use Team Switch limitter. Set -1 to disable. "
LANG["PHXM_ADMIN_USENEWCHAT"]				= "Use new Chat Box (eChat) - This is temporary replacement. If you have one already, leave this unchecked."
LANG["PHXM_ADMIN_NEWCHATPOS"]				= "New Chat Box Position: Substract Height (Y) Position by N pixels."
LANG["PHXM_ADMIN_RESPAWNONBLIND"]			= "Allow Respawn on Blind Time"
LANG["PHXM_ADMIN_RESPAWNONBLIND_TEAM"]		= "Allow Respawn on Blind Time with specific Team Only: 0: All, 1: Hunters, 2: Props"
LANG["PHXM_ADMIN_REWSPANTIMEPERCENT"]		= "Percentage of Blind Time which allows you to respawn. Default is 0.75 (means 75% * Max Blind Time)"
LANG["PHXM_ADMIN_ALLOWRESPAWN_SPECTATOR"]	= "Allow Respawn on Blind Time when Assigning to Spectator Team"
LANG["PHXM_ADMIN_ALLOWRESPAWN_TEAMCHANGE"]	= "Allow Respawn on Blind Time when Assigning to Different Team (Enabling this may not recommended)"

--[[
	MapVote Settings
]]
LANG["PHXM_MV_SETTINGS"]			= "MapVote Settings"

LANG["PHXM_MV_ALLOWCURMAP"]			= "Allow Current map to be Voted"
LANG["PHXM_MV_COOLDOWN"]			= "Enable map Cooldown for voting"
LANG["PHXM_MV_USE_ULX_VOTEMAPS"]	= "Use map listing from ULX Mapvote? If not, default maps/*.bsp will be used."
LANG["PHXM_MV_MAPLIMIT"]			= "Number of Maps to be shown in MapVote."
LANG["PHXM_MV_TIMELIMIT"]			= "Time in Seconds for default mapvote when voting."
LANG["PHXM_MV_MAPBEFOREREVOTE"]		= "Map changes needed for a map to reappear"
LANG["PHXM_MV_RTVCOUNT"]			= "How many players required to use RTV (Rock the Vote)"

LANG["PHXM_MV_EXPLANATION1"]		= "To Setup which map should be listed, use (for example) [ mv_mapprefix 'ph_,cs_,de_' ] in the console."
LANG["PHXM_MV_EXPLANATION2"]		= "If you're using ULX, use map_vote. If you don't, use mv_start."
LANG["PHXM_MV_EXPLANATION3"]		= "MapVote Action (To cancel, simply type !unmap_vote (ULX) or mv_stop in console.)"

LANG["PHXM_MV_START"]		= "Start MapVote"
LANG["PHXM_MV_STOP"]		= "Stop MapVote"
--                  			  ^YOU VIOLATED THE LAW!

--[[ 
	Versioning, Credits or About section
]]
LANG["PHXM_ABOUT_VERSIONING"]		= "Version: %s - Revision: %s"
LANG["PHXM_ABOUT_AUTHOR"]			= "By: %s"
LANG["PHXM_ABOUT_ENJOYING"]			= "If you are enjoying the game, consider donating!"
LANG["PHXM_ABOUT_UPDATE"]			= "Prop Hunt X Updates"
LANG["PHXM_ABOUT_LINKS"]			= "Links and credits"
LANG["PHXM_ABOUT_THANKS"]			= "Special Thanks for the Support, Suggestion & Contributions:\n %s"
LANG["PHXM_ABOUT_BTN_DONATE"]		= "Support PH:X by donating"
LANG["PHXM_ABOUT_BTN_HOME"]			= "PHX Homepage"
LANG["PHXM_ABOUT_BTN_GITHUB"]		= "PHX GitHub Repository"
LANG["PHXM_ABOUT_BTN_PLUGINS"]		= "PHX Addons/Plugins"
LANG["PHXM_ABOUT_BTN_CHANGELOGS"]	= "PHX Changelogs"

-- fretta
LANG["HUD_SPECTATING"]	= "SPECTATING"
LANG["HUD_YOUDIED"]		= "You Died!"

LANG["CHAT_STARTING_MAPVOTE"] = "Round has Ended. Starting map voting..."

-- This used for HUD Taunt Timer
LANG["HUD_PROP_TAUNT_TIME"]	= "Random Taunt"
LANG["HUD_PROP_CTAUNT_TIME"] = "Cust. Taunt"

-- Plugins Section
LANG["PLUGINS_NO_PLUGINS"]				= "No plugins installed. Browse more plugins here!"
LANG["PLUGINS_BROWSE_MORE"]				= "Browse more plugins"
LANG["PLUGINS_SERVER_HAS_NO_PLUGINS"]	= "Sorry, This server has no custom addons/plugins installed."
LANG["PLUGINS_SERVER_SETTINGS"]			= "-- Server Settings --"
LANG["PLUGINS_CLIENT_SETTINGS"]			= "-- Client Settings --"

-- Text Entries
LANG["TEXTENTRY_FZ_SINGLE"] = "Freeze Cam Single Sound Path" -- this one is for ph_fc_cue_path command
LANG["TEXTENTRY_MV_PREFIX"] = "MapVote Map Prefix"			 -- the map previx for mv_mapprefix

--============= LATE ADDITION OF 16.09.21/X2Z. Please Improve your Language Here! =============--

--[[
	Credits: Late Addition: Revision: 16.09.21/X2Z
]]

LANG["PHXM_ABOUT_BTN_WIKI"]			= "PHX Wiki & Manuals"

--[[
	Auto Taunt: Late Addition: Revision: 16.09.21/X2Z
]]

LANG["HUD_AUTOTAUNT_DISABLED"]		= 	"Auto Taunting is disabled."
LANG["HUD_AUTOTAUNT_WAITFORUPDATE"]	=	"Auto Taunt is Synchronizing..."

--[[
	MapVote: Late Addition: Revision: 16.09.21/X2Z
]]
LANG["PHXM_MV_VOTEROCKED"]				= " The vote has been rocked, map vote will begin on round end"
LANG["PHXM_MV_VOTEROCKED_IMMINENT"]		= "The vote has been rocked, map vote imminent"
LANG["PHXM_MV_VOTEROCKED_PLY_TOTAL"]	= "%s has voted to Rock the Vote. ( %d / %d )"

LANG["PHXM_MV_MUST_WAIT"]				= "You must wait a bit before voting!"
LANG["PHXM_MV_VOTEINPROG"]				= "There is currently a vote in progress!"
LANG["PHXM_MV_HAS_VOTED"]				= "You have already voted to Rock the Vote!"
LANG["PHXM_MV_ALR_IN_VOTE"]				= "There has already been a vote, the map is going to change!"
LANG["PHXM_MV_NEED_MORE_PLY"]			= "You need more players before you can rock the vote!"

--[[
	Late Addition: Revision: 16.09.21/X2Z
]]
LANG["PROP_PLAYERMDL_BANNED"]	= "Your custom Prop Player Model was banned from the server."

--[[
	Prop Menu/Prop Chooser, Revision: 16.09.21/X2Z
]]

LANG["PCR_USAGE_UNLIMIT"]		= "[Prop Menu] You have **unlimitted** usage left!"
LANG["PCR_USAGE_COUNT"]			= "[Prop Menu] You have %d usage left!"
LANG["PCR_PLS_WAIT"]			= "[Prop Menu] Please wait in %d seconds."
LANG["PCR_NOROOM"]				= "[Prop Menu] There is no room to change the prop!"
LANG["PCR_PROPBANNED"]			= "[Prop Menu] This prop was banned by the server."
LANG["PCR_PROPBANNED_BYPCR"]	= "[Prop Menu] You cannot use this prop because it was banned by Prop Menu."
LANG["PCR_REACHED_LIMIT"]		= "[Prop Menu] You have reached the limit!"
LANG["PCR_STAY_ON_GROUND"]		= "[Prop Menu] You need to stay on the ground and not crouching!"
LANG["PCR_ONLY_GROUP"]			= "[Prop Menu] Only certain groups can open this menu!"
LANG["PCR_NOT_EXIST_COUNT"]		= "That prop you have selected does not exists in this map! ( %s / 4 )"
LANG["PCR_NOT_EXIST"]			= "That prop you have selected does not exists in this map!"

-- PCR Client section, reason why there is a space because of chat.AddText between args.
LANG["PCR_NOTIFY_1"]			= " This server use Prop Menu version %s! Type "
LANG["PCR_NOTIFY_2"]			= " in console or use F1 -> [PropChooser Help] menu."
LANG["PCR_CL_DISABLED"]			= " This feature is disabled."
LANG["PCR_CL_GROUP"]			= " Only certain groups can open this menu!"
LANG["PCR_CL_LIMIT"]			= " You have reached the limit!"
LANG["PCR_UNLIMIT_TEXT"]		= "Unlimited"
LANG["PCR_WINDOW_TITLE"]		= "PHX Prop Menu"
LANG["PCR_HEADER_TOP"]			= "Choose any prop you want. You have"
LANG["PCR_HEADER_MID"]			= "%s usage limit"
LANG["PCR_HEADER_BOTTOM"]		= "to use this prop chooser!"
LANG["PCR_CL_TOOLTIP_BANNED"]	= "You cannot use this model."
LANG["PCR_CL_TOOLTIP_MODEL"]	= "Model: %s"
LANG["PCR_CL_MENU_NOTREADY"]	= " This feature is not available at the moment."
LANG["PCR_WINDOW_GUIDE_TTL"]	= "Quick Guide: Prop Menu 101"
LANG["PCR_BTN_HELP_MENU"]		= "Prop Menu Help"

LANG["PCR_CL_CMDUSEULX"]		= " This command is disabled. Use 'ulx propmenu' instead!"
LANG["PCR_CMD_ULX_DISABLED"]	= "Command ulx propmenu is disabled. Press your [Prop Menu Bind] to open."	--input.GetKeyName is impossible to access.

LANG["PCR_EDT_IN_USE"]			= "An admin is still editing the prop data. Please Wait!"
LANG["PCR_EDT_ERROR_DISABLED"]	= "[Prop Menu] Error: Custom Prop Addition is Disabled!"
LANG["PCR_EDT_NO_RIGHTS"]		= "You have no rights to access this feature."

-- I'm actually exhausted and feel so burned out, but I'll update this in future, or in PH:Zero I guess.
-- Section: Custom Prop Editor File Browser and stuff...
-- LANG["PCR_EDT_XXX"] 	= "todo"
-- LANG["PCR_FB_XXX"] 	= "todo"

--[[
	Admin Section, Revision: 16.09.21/X2Z
]]
LANG["PHXM_PLAYER_PROP_CHOOSER_KEY"]	= "Default Key to open Prop Menu (Prop Chooser)."
LANG["PHXM_PROP_FREEZE_MIDAIR"]			= "Default Key to toogle Freeze movement during on midair as a Prop."
LANG["PHXM_ADMIN_PROP_RIGHT_CLICK"]		= "Should Props also able to Taunt by pressing Right Click?"
LANG["PHXM_ADMIN_TAUNT_SCANNER"]		= "(Require Map Restart) Enable Taunt Scanner?"
LANG["PHXM_ADMLBL_USABLE_ENTS"]			= "Usable Prop Entities Types"
LANG["PHXM_ADMLBL_USABLE_ENTS_REF"]		= "Types can be: 1: Physics Only, 2: Physics & Dynamics, 3: Almost Anything inc. Ragdolls, 4: Custom Entities."
LANG["PHXM_ADMIN_USABLE_ENT_TYPE"]		= "Type of Entities to use for Prop to Replicate"
LANG["PHXM_ADMIN_NOTIFY_ENT_TYPE"]		= "Notify Props about entities that cannot be replicated by pressing E. Only works if 'ph_usable_prop_type' is set to 3 or 4."
LANG["NOTIFY_PROP_ENTTYPE"]				= "Press [E] to interact, [Click] to replicate object."
LANG["NOTIFY_CUST_ENT_TYPE_IS_ON"]		= "[PHX] Notice: Press [E] to interact object, Press [Click] to Replicate the object."

--[[
	Custom Taunts, Revision: 16.09.21/X2Z
]]
LANG["TM_TAUNTS_SEARCH_NOTHING"]		= "Taunt containing '%s' was not found..."
LANG["TM_SEARCH_PLACEHOLDER"]			= "Search in this category: Enter word, lowercase & no wildcards. Empty=Show All."

-- Add to Language Table.
PHX.LANGUAGES[LANG.code] = LANG