-- WARNING: THIS CODE IS UNFINISHED!!!!

-- Originally written by: Fafy
-- Improved by Wolvindra-Vinzuerio more simpler.

local LANG = {}

LANG.code = "en_us"

LANG.Name 		 	= "English" -- example: "Bahasa Indonesia"
LANG.NameEnglish	= "English" -- Your Language but spoken in English, example: "Indonesian"
LANG.Author			= "placeholder"
LANG.AuthorURL		= "" -- Value must only contain Steam Profile with SteamID64 format: https://steamcommunity.com/profiles/761123456xxxxx.

-- Special Section that isn't String-based
LANG.SUICIDEMSG = {
	"suicided!",
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

LANG.RANDOM_SPECTATORS = {
	"to watch and chill.",
	"to see them hanging around.",
	"to see the things.",
	"",
}

-- List of string-based translation

LANG["HELP_F1"] 			= PHX.F1DefaultHelp or [[Todo: please enter a nicely described Game Help text message here]];

-- HUD elements
LANG["HUD_HP"]				= "HEALTH"
LANG["HUD_AMMO"] 			= "AMMO"
LANG["HUD_TIME"] 			= "TIME"
LANG["HUD_ROUND"]			= "ROUND"

LANG["HUD_ROTLOCK"]			= "Prop Rotation: Locked"
LANG["HUD_ROTFREE"]			= "Prop Rotation: Free"
LANG["HUD_KILLEDBY"]		= "You were killed by %s"

LANG["HUD_WAITPLY"]			= "Waiting for players..."
LANG["HUD_TEAMWIN"]			= "%s win!"
LANG["HUD_LOSE"]			= "Draw, everyone loses!"

LANG["HUD_BLINDED"]			= "Hunters will be unblinded and released in %s"
LANG["HUD_UNBLINDED"]		= "Ready or not, here we come!"

--  Kill text (X killed Y)
LANG["HUD_KILLED"]			= "killed"

LANG["MISC_ACCEPT"]			= "Accept"
LANG["MISC_CLOSE"]			= "Close"
LANG["MISC_TIMELEFT"]		= "Time Left: %s"
LANG["MISC_GAMEEND"] 		= "Game will end after this round"

-- Team selection screen (F2)
LANG["DERMA_TEAMSELECT"]	= "Choose Team"

-- F1 screeen
LANG["DERMA_RTV"] 			= "Vote For Change (RTV)"
LANG["DERMA_PHMENU"] 		= "Prop Hunt Menu"
LANG["DERMA_CHANGETEAM"]	= "Change Team"

-- Scoreboard
LANG["DERMA_PLAYER"]		= "(%d player)"
LANG["DERMA_PLAYERS"]		= "(%d players)"
LANG["DERMA_NAME"]			= "Name"
LANG["DERMA_KILLS"]			= "Kills"
LANG["DERMA_DEATHS"]		= "Deaths"
LANG["DERMA_PING"]			= "Ping"

-- Chat messages
LANG["CHAT_NOPLAYERS"]		= "There's not enough players to start the game!"
LANG["CHAT_SWAP"]			= "Teams have been swapped!"

LANG["CHAT_JOINED"]			= " joined "
LANG["CHAT_JOINEDTHE"]		= " joined the "

LANG["CHAT_SWAPBALANCE"]		= "%s has been changed to %s for team balance."
LANG["CHAT_SWAPBALANCEYOU"]		= "You were swapped to achieve perfect balance." -- Smile... for even in death, you have become children of Thanos

-- PHE Menu 
LANG["PHXM_TAB_HELP"]		= "Help & Guides"
LANG["PHXM_TAB_MUTE"]		= "Mute Players"
LANG["PHXM_PLAYER_TAB"]		= "Player Settings"
LANG["PHXM_PLAYERMODEL_TAB"] = "Playermodel Options"
LANG["PHXM_ADMINS_TAB"]		= "Admins Settings"
LANG["PHXM_ABOUT_TAB"]		= "About Prop Hunt X"
LANG["PHXM_MAPVOTE_TAB"]		= "MapVote Settings"

LANG["PHXM_MUTE_SELECT"]		= "Select one player that you wish to mute."

LANG["PHXM_PLAYER_OPTIONS"]		= "Player Options:"

LANG["PHXM_PLAYER_ph_cl_halos"]		= "Toggle Halo effect when choosing a prop"
LANG["PHXM_PLAYER_ph_cl_pltext"]		= "Show Team player names above their heads instead (and appear through wall too)"
LANG["PHXM_PLAYER_ph_cl_endround_sound"]		= "Play End round sound cue"
LANG["PHXM_PLAYER_ph_cl_autoclose_taunt"]		= "Option for Auto closing for Taunt window when double-clicking them"
LANG["PHXM_PLAYER_ph_cl_spec_hunter_line"]		= "Draw a line on hunters so we can see their aim in spectator mode."
LANG["PHXM_PLAYER_cl_enable_luckyballs_icon"]		= "Enable 'Lucky ball' icon to be displayed once they are spawned"
LANG["PHXM_PLAYER_cl_enable_devilballs_icon"]		= "Enable 'Devil ball' icon to be displayed once they are spawned"
LANG["PHXM_PLAYER_ph_cl_taunt_key"]		= "Button to play a random taunt"

LANG["PHXM_PLAYER_ph_hud_use_new"]		= "Use New PH: Enhanced HUD"
LANG["PHXM_PLAYER_ph_show_tutor_control"]		= "Show Tutorial Pop-up (Shown only 2x on each prop spawns)"
LANG["PHXM_PLAYER_ph_show_custom_crosshair"]		= "Enable Custom Crosshair"
LANG["PHXM_PLAYER_ph_show_team_topbar"]		= "Show total alive team players bar on the top left (At least 4 Players will be shown)"


LANG["PHXM_PLAYERMODEL_OFF"]		= "Sorry, Custom Player Model is disabled on this server!"
LANG["PHXM_PLAYERMODEL_SETFOV"]		= "Set Model FOV"


LANG["PHXM_ADMINS_OPTIONS"]		= "Serverside gamemode Options (Only visible for Admins/Owner)"

LANG["PHXM_ADMINS_ph_language"]		= "Gamemode language (requires map change)"
LANG["PHXM_ADMINS_ph_use_custom_plmodel"]		= "Enable custom models for Hunters"
LANG["PHXM_ADMINS_ph_use_custom_plmodel_for_prop"]		= "Enable custom models for Props - Make sure to enable for Hunter too."
LANG["PHXM_ADMINS_ph_customtaunts_delay"]		= "Custom Taunts Delay (Seconds)"
LANG["PHXM_ADMINS_ph_normal_taunt_delay"]		= "Normal Taunts Delay (Seconds)"
LANG["PHXM_ADMINS_ph_autotaunt_enabled"]		= "Enable Auto Taunt Features"
LANG["PHXM_ADMINS_ph_autotaunt_delay"]		= "Auto Taunts Delay (Seconds)"
LANG["PHXM_ADMINS_ph_forcejoinbalancedteams"]		= "Force players to even out teams upon joining"
LANG["PHXM_ADMINS_ph_autoteambalance"]		= "Automatically even out teams at the start of a round"
LANG["PHXM_ADMINS_ph_allow_prop_pickup"] = "Allow pick up of small props (0 = No; 1 = Yes; 2 = Only Hunters)"

LANG["PHXM_ADMINS_ph_notice_prop_rotation"]		= "Display 'Prop Rotation' notification on every Prop Spawns"
LANG["PHXM_ADMINS_ph_prop_camera_collisions"]		= "Enable Prop Camera collision to the wall"
LANG["PHXM_ADMINS_ph_freezecam"]		= "Enable Freecam features for team props"
LANG["PHXM_ADMINS_ph_prop_collision"]		= "Enable Prop collide on each other prop players"
LANG["PHXM_ADMINS_ph_swap_teams_every_round"]		= "Swap team every round - Disabling means team will stay forever"
LANG["PHXM_ADMINS_ph_hunter_fire_penalty"]		= "Hunter health penalty"
LANG["PHXM_ADMINS_ph_hunter_kill_bonus"]		= "Hunter kill bonus"
LANG["PHXM_ADMINS_ph_hunter_smg_grenades"]		= "Hunter SMG grenades"
LANG["PHXM_ADMINS_ph_game_time"]		= "Total Game time (Minutes)"
LANG["PHXM_ADMINS_ph_hunter_blindlock_time"]		= "Hunter blindlock time (Seconds)"
LANG["PHXM_ADMINS_ph_round_time"]		= "Game round time (Seconds)"
LANG["PHXM_ADMINS_ph_rounds_per_map"]		= "Total game Rounds per Map"
LANG["PHXM_ADMINS_ph_enable_lucky_balls"]		= "Allow Lucky Balls Features to be spawned on breakable props (Chance is 8%)"
LANG["PHXM_ADMINS_ph_enable_devil_balls"]		= "Allow Devil Balls Features to be spawned when hunter dies (Chance is 70%)"
LANG["PHXM_ADMINS_ph_waitforplayers"]		= "Wait for Players to begin the gameplay"
LANG["PHXM_ADMINS_ph_min_waitforplayers"]		= "Mininum Players to Wait before the game starts (default: 1)"

LANG["PHXM_ADMINS_TAUNTMODES"]		= "Enable Custom Taunt."
LANG["PHXM_ADMINS_TAUNTMODE0"]		= "Mode [0/F3]: Random Taunt"
LANG["PHXM_ADMINS_TAUNTMODE1"]		= "Mode [1/C]: Custom Taunt"
LANG["PHXM_ADMINS_TAUNTMODE2"]		= "Mode [2]: Both Modes"
LANG["PHXM_ADMINS_TAUNTSOPEN"]		= "Open Taunt Window"

LANG["PHXM_MAPVOTE_SETTINGS"]		= "MapVote Settings"

LANG["PHXM_MAPVOTE_mv_allowcurmap"]		= "Allow Current map to be Voted"
LANG["PHXM_MAPVOTE_mv_cooldown"]		= "Enable map Cooldown for voting"
LANG["PHXM_MAPVOTE_mv_use_ulx_votemaps"]		= "Use map listing from ULX Mapvote? If not, default maps/*.bsp will be used."
LANG["PHXM_MAPVOTE_mv_maplimit"]		= "Number of Maps to be shown in MapVote."
LANG["PHXM_MAPVOTE_mv_timelimit"]		= "Time in Seconds for default mapvote when voting."
LANG["PHXM_MAPVOTE_mv_mapbeforerevote"]		= "Map changes needed for a map to reappear"
LANG["PHXM_MAPVOTE_mv_rtvcount"]		= "How many players required to use RTV (Rock the Vote)"

LANG["PHXM_MAPVOTE_EXPLANATION1"]		= "To Setup which map should be listed, use (for example) [ mv_mapprefix 'ph_,cs_,de_' ] in the console."
LANG["PHXM_MAPVOTE_EXPLANATION2"]		= "If you are unable to do a MapVote, you NEED to install ULX Admin Mod!"
LANG["PHXM_MAPVOTE_EXPLANATION3"]		= "MapVote Action (To cancel, simply type !unmap_vote in the chat or type 'unmap_vote' in console)"

LANG["PHXM_MAPVOTE_START"]		= "Start MapVote"
LANG["PHXM_MAPVOTE_STOP"]		= "Stop MapVote"
--                   YOU VIOLATED THE LAW!
LANG["PHXM_ABOUT_CURRENTVER"]		= "Current Version: "
LANG["PHXM_ABOUT_CURRENTREV"]		= "Current Revision: "
LANG["PHXM_ABOUT_ENJOYING"]		= "If you are enjoying the game, consider donating!"
LANG["PHXM_ABOUT_LINKS"]		= "Links and credits"
LANG["PHXM_ABOUT_THANKS"]		= "Special thanks: "

LANG["PHXM_ABOUT_DONATE"]		= "Donate to PH:E project"
LANG["PHXM_ABOUT_HOME"]		= "PH:E Official Homepage"
LANG["PHXM_ABOUT_GITHUB"]		= "GitHub Repository"

PHX.LANGUAGES[LANG.code] = LANG