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
LANG.SUICIDEMSG = {  -- Fix me: there was addition text here but feel free to add more.
	"suicided!",
	"died mysteriously.",
	"died from magic.",
	"no-scoped themself.",
	"ragequited.",
	"is drunk.",
	"died. Better luck next time!",
	"slapped themself.",
	"tripped on a stick.",
	"died by the force.",
	"died. pls press F.",
	"feeling regret after killing some innocent props.",
	"is noclipped to backroom.",
	"is trying to extinct.",
	"dieded.",
	"is panicked therefore trying to kill all props instead.",
	"stop it, get some help.",
	"ragdolled.",
}
LANG.RANDOM_SPECTATORS = {
	"to watch and chill.",
	"to see them hanging around.",
	"to see the things.",
	" ",
}

LANG["PHX_TEAM_CONNECTING"] = "Connecting"
LANG["PHX_TEAM_PROPS"]		= "Props"
LANG["PHX_TEAM_HUNTERS"] 	= "Hunters"
LANG["PHX_TEAM_UNASSIGNED"]	= "Unassigned"
LANG["PHX_TEAM_SPECTATOR"] 	= "Spectator"

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
LANG["DERMA_SERVER_TAG"]		= "SV"
LANG["DERMA_BOT_TAG"]			= "BOT"
LANG["DERMA_GAMEMODE_CREDITS"]	= "%s | Version: %s - Rev. %s"

LANG["CHAT_JOINED"]				= " joined "
LANG["CHAT_JOINEDTHE"]			= " joined the "

LANG["CHAT_SWAPBALANCE"]		= "%s has been changed to %s for team balance."
LANG["CHAT_SWAPBALANCEYOU"]		= "You were swapped to achieve perfect balance." -- Smile... for even in death, you have become children of Thanos

-- FRETTA: Splash Starting Screen
LANG["SPASHSCREEN_BY_X"]		= "by %s"
-- RichTextBox
LANG["HELP_DONATORS_AND_CONTRIBUTORS"]  = "\n\nDonators & Contributors:\n- %s"
-- // END OF FRETTA SECTION \\

LANG["HELP_F1"] 				= [[A Prop Hunt X Project.

A project to make Prop Hunt be more modern and customisable.

More info can be found at:
https://www.buymeacoffee.com/wolvindra

To See more info, help and guide, Press [F1] key and then click [Prop Hunt Menu] button.

Version: ]].. PHX.VERSION ..[[ Revision: ]].. PHX.REVISION ..[[

Have Fun!]]

LANG["LANGUAGE_CHANGED"]		= "Prefered Language has been changed to %s"

-- internal cl_menutypes section.
LANG["SUBTYPE_PREFERED_LANG"]	= "Prefered Language"

-- Events
LANG["EV_PLAYER_CONNECT"]		= "%s has connected to the server."
LANG["EV_PLAYER_JOINED"]		= "%s has joined to the server."
LANG["EV_PLAYER_DISCONNECT"]	= "%s has disconnected from the server (Reason: %s)"

-- HUD elements
LANG["HUD_HP"]					= "HEALTH"
LANG["HUD_AMMO"] 				= "AMMO"
LANG["HUD_MAGSEC"]				= "MAG. / SEC." --Magazine | Secondary Magazine

-- !!WEAPON NAMES CANNOT BE TRANSLATED, THEY USE FROM language.GetPhrase THEREFORE IT'S IMPOSSIBLE TO DO.

LANG["TEAM_PROPS"]				= LANG["PHX_TEAM_PROPS"] 
LANG["TEAM_HUNTERS"]			= LANG["PHX_TEAM_HUNTERS"]

LANG["HUD_ROTLOCK"]				= "Prop Rotation: Locked"
LANG["HUD_ROTFREE"]				= "Prop Rotation: Free"
LANG["HUD_KILLEDBY"]			= "You were killed by %s"

LANG["HUD_AUTOTAUNT"]			= "Auto Taunting in %d second(s)"
LANG["HUD_AUTOTAUNT_ALT"]		= "Auto Taunting in %d"

LANG["HUD_TargetID"]			= "Player: %s (%d%%)"

LANG["HUD_BLINDED"]				= "%s will be unblinded and released in %s"
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
LANG["TM_NOTICE_PLSWAIT"]		= "Please wait in %s sec(s) before random taunt ends!"
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
LANG["PHXM_TAB_MODEL_DISABLED"]	= "Model Browser (Disabled)"
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
LANG["PHXM_ADMIN_CUSTOM_MODEL"]				= "Enable custom models for Hunters. This will enable [Model Browser] tab."
LANG["PHXM_ADMIN_CUSTOM_MODEL_PROP"]		= "Enable custom models for Props (Require Hunter Custom Models to be enabled)"
LANG["PHXM_ADMIN_TAUNT_DELAY_CUSTOM"]		= "Custom Taunts Delay (Seconds)"
LANG["PHXM_ADMIN_TAUNT_DELAY_RANDOM"]		= "Normal Taunts Delay (Seconds)"
LANG["PHXM_ADMIN_TAUNT_DELAY_AUTO"]			= "Auto Taunts Delay (Seconds)"
LANG["PHXM_ADMIN_AUTOTAUNT_ENABLE"]			= "Enable Auto Taunt Features (Proper Timer will be fixed on next round)"

LANG["PHXM_ADMIN_NOTICE_ROTATION"]			= "Display 'Prop Rotation' notification on every Prop Spawns"
LANG["PHXM_ADMIN_CAMERA_COLLIDE"]			= "Enable Prop Camera collision to the wall"
LANG["PHXM_ADMIN_FREEZECAM"]				= "Enable Freeze Cam features for team props"
LANG["PHXM_ADMIN_FREEZECAM_HUNTER"]			= "Enable Freeze Cam features for team hunters"
LANG["PHXM_ADMIN_PROP_COLLIDE"]				= "Enable Prop collide on each other prop players"
LANG["PHXM_ADMIN_SWAP_TEAM"] 				= "Swap team every round - Disabling means team will stay forever."
LANG["PHXM_ADMIN_HUNTER_PENALTY"]			= "Hunter health penalty"
LANG["PHXM_ADMIN_HUNTER_KILL_BONUS"]		= "Hunter kill bonus"
LANG["PHXM_ADMIN_HUNTER_SMG_GRENADES"]		= "Hunter SMG grenades"
LANG["PHXM_ADMIN_GAME_TIME"]				= "(Require Map Restart) Total Game time (Minutes)"
LANG["PHXM_ADMIN_BLINDLOCK_TIME"]			= "Hunter blindlock time (Seconds)"
LANG["PHXM_ADMIN_ROUND_TIME"]				= "(Require Map Restart) Game round time (Seconds)"
LANG["PHXM_ADMIN_ROUNDS_PER_MAP"]			= "(Require Map Restart) Total game Rounds per Map"
LANG["PHXM_ADMIN_ENABLE_LUCKYBALL"]			= "Allow Lucky Balls Features to be spawned on breakable props (Chance is 8%)"
LANG["PHXM_ADMIN_ENABLE_CRYSTAL"]			= "Allow Devil Balls Features to be spawned when hunter dies (Always Spawn)"
LANG["PHXM_ADMIN_WAIT_PLAYERS"]				= "Wait for Players to begin the gameplay"
LANG["PHXM_ADMIN_WAIT_MIN_PLAYERS"]			= "Mininum Players to Wait before the game starts (default: 1)"
LANG["PHXM_ENABLE_PLAYER_JOIN_LEAVE"] 		= "Enable chat notification for player join and leave? Set this 0 if you prefer to use with your own Custom Chat addon."

LANG["PHXM_ADMIN_FORCEJOINBALANCE"]			= "Force players to even out teams upon joining (Disable This if Team Rotation is ON)"
LANG["PHXM_ADMIN_ENABLETEAMBALANCE"]		= "Enable Team Balance: Automatically even out teams at the start of a round."
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
LANG["PHXM_ADMIN_DEVSECTION"]		= "Developer Options"
LANG["PHXM_ADMIN_ROOMCHECK"]		= "Enable Boundaries Check? This prevents you getting stuck with objects/walls."
LANG["PHXM_ADMIN_USENEWMKBREN"]		= "Use new model for Bren MK II bonus weapon (Require Map Restart)"
LANG["PHXM_ADMIN_BEVERBOSE"]		= "Developer: Be Verbose - Enable PH:X to print all information and events verbosely?"
LANG["PHXM_ADMIN_SHOWPLNAMEHEAD"]	= "Enable Player team names to appear on their screen."
LANG["PHXM_ADMIN_USESINGLE_FZCAM"]	= "Use single Freezecam sound instead of sound list (Use 'ph_fc_cue_path' to determine Freezecam sound path)"
LANG["PHXM_ADMIN_MODELLISTINGTYPE"] = "Player Models Listing Method: 0: Include Everything, 1: Use list.Get('PlayerOptionsModel')"
LANG["PHXM_ADMIN_JUMPPOWER"]		= "Additional Jump Power multiplier for Props"
LANG["PHXM_ADMIN_ENABLE_OBB"]		= "Developer: Enable Customized Prop Entities Model Boundaries (OBB) Modifier from config data"
LANG["PHXM_ADMIN_RELOAD_OBB"]		= "Developer: Reload OBB Modifier data every round restarts"

--[[
	Experimental & PH:X Features
]]
LANG["PHXM_ADMIN_EXPERIMENTALPHX"]			= "Prop Hunt: X Experimental Stuff"

LANG["PHXM_ADMIN_HLA_COMBINE"]				= "Add HL: Alyx Combine model support"
LANG["PHXM_ADMIN_TEAMBALANCE"]				= "Basic Team Settings"
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
LANG["PHXM_MV_USE_ULX_VOTEMAPS"]	= "Use map listing from ULX Votemaps? If not, default maps/*.bsp will be used."
LANG["PHXM_MV_MAPLIMIT"]			= "Number of Maps to be shown in MapVote."
LANG["PHXM_MV_TIMELIMIT"]			= "Time in Seconds for default mapvote when voting."
LANG["PHXM_MV_MAPBEFOREREVOTE"]		= "Map changes needed for a map to reappear"
LANG["PHXM_MV_RTVCOUNT"]			= "How many players required to use RTV (Rock the Vote)"

LANG["PHXM_MV_EXPLANATION1"]		= "To Setup which map should be listed, use (for example) [ mv_map_prefix 'phx_,ph_,cs_,de_' ] in the console."
LANG["PHXM_MV_EXPLANATION2"]		= "if ULX installed, use 'ulx map_vote' instead. Otherwise use 'mv_start' for normal call."
LANG["PHXM_MV_EXPLANATION3"]		= "MapVote Action (To cancel, simply use 'ulx unmap_vote' or 'mv_stop' in the console.)"

LANG["PHXM_MV_START"]		= "Start the MapVote"
LANG["PHXM_MV_STOP"]		= "Stop the MapVote"
--                  			  ^YOU VIOLATED THE LAW!

--[[ 
	Versioning, Credits or About section
]]
LANG["PHXM_ABOUT_VERSIONING"]		= "Version: %s - Revision: %s"
LANG["PHXM_ABOUT_AUTHOR"]			= "By: %s"
LANG["PHXM_ABOUT_ENJOYING"]			= "If you are enjoying the game, consider donating!"
LANG["PHXM_ABOUT_UPDATE"]			= "Prop Hunt X Updates"

LANG["PHXM_VIEW_UPDATE_INFO"]		= "View update info"
LANG["PHXM_CHECK_FOR_UPDATES"]		= "Check for Updates"
LANG["PHXM_UPDATE_FOUND_TEXT"]		= "Update has been checked. Please check on the Console for more information.\n\nWould you like to view update what's new?"
LANG["PHXM_UPDATE_FOUND_TITLE"]   	= "Update Information"
LANG["PHXM_UPDATE_FOUND_BUTTON"]   	= "View Updates"

LANG["UPDATE_NOTIFY_MSG_NOTFOUND"]	= "No update was found. Please click on 'Check for Updates' button first!"
LANG["UPDATE_NOTIFY_MSG_TITLE"]		= "No updates found"
LANG["UPDATE_NOTIFY_WINDOW_TITLE"]	= "Update Notice"
LANG["UPDATE_RTBOX_APPEND"]			= "\n\nFor your information:\nCurrently you are using version: %s with Revision: %s"
LANG["UPDATE_BTN_SEEFULL"]			= "See Full Changes"

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
LANG["TEXTENTRY_FZ_SINGLE"] = "Freeze Cam Single Sound Path"
LANG["TEXTENTRY_MV_PREFIX"] = "MapVote Map Prefix"

LANG["MISC_GAME_ENDED"]		= "Game has ended."

--============= LATE ADDITION OF 16.09.21/X2Z. =============--

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

LANG["PCR_USAGE_UNLIMIT"]		= "[Prop Menu] You have **Unlimited** usage left!"
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
LANG["PCR_WINDOW_TITLE"]		= "PH:X Prop Menu"
LANG["PCR_HEADER_TOP"]			= "Choose any prop you want. You have"
LANG["PCR_HEADER_MID"]			= "%s usage limit"
LANG["PCR_HEADER_BOTTOM"]		= "to use this prop chooser!"
LANG["PCR_CL_TOOLTIP_BANNED"]	= "You cannot use this model."
LANG["PCR_CL_TOOLTIP_MODEL"]	= "Model: %s"
LANG["PCR_CL_MENU_NOTREADY"]	= " This feature is not available at the moment."
LANG["PCR_WINDOW_GUIDE_TTL"]	= "Quick Guide: Prop Menu 101"
LANG["PCR_BTN_HELP_MENU"]		= "Prop Menu Help"

LANG["PCR_CL_CMDUSEULX"]		= " This command is disabled. Use 'ulx propmenu' instead!"
LANG["PCR_CMD_ULX_DISABLED"]	= "Command ulx propmenu is disabled. Press your [Prop Menu Bind] to open."

LANG["PCR_EDT_IN_USE"]			= "An admin is still editing the prop data. Please Wait!"
LANG["PCR_EDT_ERROR_DISABLED"]	= "[Prop Menu] Error: Custom Prop Addition is Disabled!"
LANG["PCR_EDT_NO_RIGHTS"]		= "You have no rights to access this feature."

--[[
	Admin Section, Revision: 16.09.21/X2Z
]]
LANG["PHXM_PLAYER_PROP_CHOOSER_KEY"]	= "Default Key to open Prop Menu (Prop Chooser)."
LANG["PHXM_PROP_FREEZE_MIDAIR"]			= "Default Key to toogle Freeze movement during on midair as a Prop."
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
LANG["PHXM_MSG_INPUT_IS_EMPTY"]			= "Text is empty or you didn't pressed ENTER key."

--============= LATE ADDITION OF 10.06.2022/X2Z. =============--

--goto line: @132
LANG["MISC_SET"]						= "Set"
LANG["MISC_APPLY"]						= "Apply"
LANG["MISC_NO"]							= "No"
LANG["MISC_YES"]						= "Yes"
LANG["MISC_WARN"]						= "Warning"
LANG["MISC_ERROR"]						= "Error"
LANG["MISC_INFO"]						= "Information"
LANG["MISC_NOTICE"]						= "Notice"
LANG["MISC_IDK"]						= "Unknown"
LANG["MISC_NA"]							= "N/A"

-- HUD
LANG["HUD_DECOY_ACTIVE"]                = "Press [%s]"
LANG["HUD_FAKETAUNT_COUNT"]             = "%ix Left"
LANG["HUD_FAKETAUNT_UNLI"]              = "Unlimited"
LANG["NOTICE_GRENADE_SMG_GIVEN"]        = "You are now acquired some SMG Grenades."

--[[
	ADMIN PANEL, Revision 10.06/2022/X2Z
]]--
LANG["PHXM_TAUNT_SETTINGS"]				= "Taunt Settings"
LANG["PHXM_GENERAL_SETTINGS"]			= "General Settings"
LANG["PHXM_FAKE_TAUNT_SETTINGS"]		= "Fake Taunt Settings"
LANG["PHXM_FAKE_TAUNT_ENABLE"]			= "Allow fake taunts to be played on random props in the map. Can be accessed only through Custom Taunt menu."
LANG["PHXM_FAKE_TAUNT_MAXUSAGE"]		= "Maximum usage for fake taunts to be used; -1 is unlimited."
LANG["PHXM_TAUNT_RIGHT_CLICK"]		    = "Right click for taunt. This will disable Right-clicking on custom menu!"

LANG["PHXM_TAUNT_PITCH_SETTINGS"]		= "Taunt Pitch Settings"
LANG["PHXM_TAUNT_PITCH_ENABLE"]			= "Enable Taunt Pitch"
LANG["PHXM_TAUNT_PITCH_RANGE_MIN"]		= "Minimum threshold/acceptable pitch range for a taunt. 1 to 99."
LANG["PHXM_TAUNT_PITCH_RANGE_MAX"]		= "Maximum threshold/acceptable pitch range for a taunt. 100 to 255."

LANG["PHXM_DECOY_SETTINGS"]				= "Decoy Settings"
LANG["PHXM_DECOY_ENABLE"]				= "Enable Decoy reward? Reward will be given ONLY ONCE for alive props until the round ends. They don't add and only substract once they're placed."

LANG["PHXM_DISABLE_FOOTSTEP"]           = "Toggle silent prop team footsteps"

LANG["PHXM_ADMIN_CHATSETTING"]			= "Chat Window Settings"
LANG["PHXM_ADMIN_HUNTERBLIND"]			= "Hunter Blind Control"

LANG["PHXM_ADMIN_GIVEGRENADE_NEAREND"]  = "Should grenades will be given near round end? If Yes, see 'ph_give_grenade_roundend_before_time'"
LANG["PHXM_ADMIN_GIVEGRENADE_TIME"]     = "Time in seconds to give grenades before Round Ends. This is typically between 10 to 30 seconds"

--[[
	Plugins in sh_init.lua, Revision 10.06/2022/X2Z
]]--
LANG["PLUG_NAME_VER"]					= "Plugin: %s | v.%s"
LANG["PLUG_DESCRIPTION"]				= "Description: %s"

--[[
	Taunt Pitch, Revision 10.06/2022/X2Z
]]--
LANG["PHX_CTAUNT_USE_PITCH"]			= "Use pitch for custom taunts"
LANG["PHX_CTAUNT_RANDOM_PITCH"]			= "Randomize pitch when playing taunt"
LANG["PHX_RTAUNT_USE_PITCH"]			= "Use pitch for random taunts [%s]"
LANG["PHX_RTAUNT_RANDOMIZE"]			= "Randomize pitch for random taunts [%s]"
LANG["PHX_CTAUNT_PITCH_FOR_FAKE"]		= "Use pitch for fake taunts"
LANG["PHX_CTAUNT_RANDPITCH_FOR_FAKE"]	= "Randomize pitch for fake taunts"
LANG["PHX_CTAUNT_SLIDER_PITCH"]			= "Taunt pitch slider."
LANG["TM_TOOLTIP_FAKETAUNT"]			= "Play a Fake Taunt on random prop"
LANG["TM_PREFERRED_PITCH"]              = "Preferred Taunt Pitch Level"

--[[
	Fake Taunt, Revision 10.06/2022/X2Z
	Description: Play fake taunts on random props in the map (Not Players)
]]--
LANG["PHX_CTAUNT_ON_RAND_PROPS"]		= "Play on random props (%ix)"
LANG["PHX_CTAUNT_ON_RAND_PROPS_UNLI"]	= "Play on random props"
LANG["PHX_CTAUNT_PLAYED_ON_RANDPROP"]	= "You played a taunt on a random prop."
LANG["PHX_CTAUNT_RAND_PROPS_LIMIT"]		= "You have hit the limit!"
LANG["PHX_CTAUNT_RAND_PROPS_NOT_PROP"]  = "Not available at this moment."
LANG["PHX_CTAUNT_RANDPROP_DISABLED"]	= "Fake taunt is currently disabled."

--[[
	PH:Z Simple Decoy, Revision 10.06/2022/X2Z
]]--
LANG.DECOY_PROP	= {
	"killed the dummy!",
	"feel regret after killing a dummy.",
	"killed a decoy.",
	"killed an innocent dummy.",
	"feel embarrased after killing a dummy."
}

LANG["DECOY_PUT_SUCC"]					= "Decoy successfully placed."
LANG["DECOY_CANT_PUT_HERE"]				= "Cannot put decoy here."
LANG["DECOY_GET_REWARD"]				= "Congrats! You received ['Prop Decoy'] for suviving this round!"
LANG["DECOY_REMINDER_GET"]              = "You have a Decoy/Dummy prop! Place somewhere to confuse hunters!"
LANG["DECOY_FRAGS_RECEIVED"]			= "Decoy successfully baited: You stole 1 score from %s!"
LANG["DECOY_DISABLED"]					= "Currently, decoy is unavailable."
LANG["PHXM_CL_DECOY_KEYBIND"]			= "Default key to place a decoy prop. Default is 1 (not keypad 1)."

LANG["DECOY_INDICATOR_INVALID"]         = "Invalid Slope!"
LANG["DECOY_INDICATOR_TOOFAR"]          = "Range too far!"
LANG["DECOY_INDICATOR_OK"]              = "Place Decoy [Press %s]"

LANG["PHXM_DECOY_HEALTH"]				= "How much health does the decoy should have. Default is 10."
LANG["PHXM_PLAYER_SHOW_DECOY_HELPER"]   = "Show/Hide Decoy placement helper? This will show a white dot with a text near on your crosshair."
LANG["PHXM_PLAYER_SHOW_DECOY_MARKER"]   = "Show/Hide Decoy marker?"

--[[
	Revision 10.06/2022/X2Z
    Prop Menu Update: Menu, Editor, Browser
]]--
LANG["PCR_MODEL_DONT_EXISTS"]   = "Sorry, this model is not available at the moment!"

LANG["PCR_PLUG_WARN_MSG"]		= "Warning: Custom Prop Addition (pcr_allow_custom) is set to 0.\nYou Must Enable this feature in order to edit your custom prop!\nA Map change is required to change this setting."
LANG["PCR_PLUG_LBL_BINDKEY"]	= "To change bind key, switch to '[Player] tab."
LANG["PCR_PLUG_LBL_EDITOR"]		= "Custom Prop Menu Editor"
LANG["PCR_PLUG_BTN_OPEN_EDT"]	= "Open Editor"
LANG["PCR_PLUG_LBL_COMSET"]		= "Common Settings"
LANG["PCR_PLUG_LBL_TECHSET"]	= "Technical Settings"
LANG["PCR_PLUG_LBL_EXPSET"]		= "Experimentals"
LANG["PCR_PLUG_LBL_PLAYERSET"]	= "Player Settings"

LANG["PCR_PLUG_ENABLE"]			= "Enable 'Prop Menu' feature"
LANG["PCR_PLUG_ALLOW_CUSTOM"]	= "(Require Map Restart) Allow custom props to be added in to the Prop Menu list?"
LANG["PCR_PLUG_PROP_BAN"]		= "(Require Map Restart) Do not include banned props into Prop Menu list?"
LANG["PCR_PLUG_USAGE_LIMIT"]	= "Maximum usage limit for player to use. -1 means unlimited."
LANG["PCR_PLUG_PROP_LIMIT"]		= "(Require Map Restart) Limit amount of prop addition to Prop Menu list"
LANG["PCR_PLUG_PROP_LIMITMAX"]	= "Maximum amount of props that will be added to Prop Menu list. Note: This will be randomly added!"
LANG["PCR_PLUG_USE_ULXMENU"]	= "Should Prop Menu can be accessed by Console (0) or ULX (1)? Bound key will respect with this setting"
LANG["PCR_PLUG_USE_DELAY"]		= "Delay in seconds before player to use another Prop in Prop Menu"
LANG["PCR_PLUG_KICK_INVALID"]	= "Kick any user attempt to access Invalid Model (4x Max. threshold)"
LANG["PCR_PLUG_SPACE_CHECK"]	= "Check for space for a room before player use another prop to prevent Stuck"
LANG["PCR_PLUG_X_BBOX"]			= "(Require Map Restart) Check Entity BBox Limit before adding to Prop Menu list"
LANG["PCR_PLUG_X_BBOX_MAX"]		= "BBox CollisionBound Maximum Height limit. Mins will be auto-calculated."
LANG["PCR_PLUG_X_BBOX_MIN"]		= "BBox CollisionBound Maximum Width limit. Mins will be auto-calculated."
LANG["PCR_PLUG_ONLY_GROUPS"]	= "Should Prop Menu can only be accessed by certain groups e.g. Donator?"
LANG["PCR_PLUG_NOTIFYMSG"]		= "Notify player on how to use Prop Menu on every round start"

LANG["PCR_EDITOR_MSG_ERROR"]	= "Your changes hasn't been saved due to Errors.\nPlease check on your server console!"
LANG["PCR_EDITOR_MSG_SUCC"]		= "Your changes and Custom Prop data has been saved and updated successfully." --Thanks galaxio! x)

LANG["PHZ_generic_title"]		= "Custom Prop Inclusion Editor"
LANG["PHZ_generic_helptext"]	= [[[How To Use:
[LEFT PANEL]
← Choose a game content
← Click on icons to add models to the right
← Right Click to open context menu

[RIGHT PANEL]
→ Click to 'mark' any props before deleting
→ Hit 'Remove Selected' to Remove Models
→ Hit 'Apply Selection' to Make changes

[INFO]
- You can only add models up to 2048 entries.
- All maps props will be included automatically, so you don't have to.
- Pressing [Close] button will cancel the operation.
- Not all models will have a valid VPhysics.
- Not all Players (inc. Your Server) will have custom models. If they don't exists they will removed after Applying selections.
- Your Server content might be different from you. If you see "<game> [Not Mounted]" on dropdown menu, it means that you haven't mounted/installed the game.
- Addon folder browsing isn't implemented yet so You'll have to use 'All Contents' instead.
]]
LANG["PHZ_generic_mdlinfo"] = [[Model Info:
%s
Has Physics: %s]]
LANG["PHZ_generic_mdlinfoStart"] = "(Select model first!)"

LANG["PHZ_generic_no_ragdoll"]	= "No: Ragdoll"
LANG["PHZ_generic_titlelabel"]	= "%s Preview :"

LANG["PHZ_mount_game_sel"]		= "Select mounted game (Default: Garry's Mod)"
LANG["PHZ_input_placeholder1"]	= "Folder to Search: <folder name> or '*', blank for all folders."
LANG["PHZ_input_placeholder2"]  = "Addon to Search: <name> or '*', blank for all folders."
LANG["PHZ_msg_warn_close"]		= "Are you sure you want to close this window? Any unsaved edits will be lost!"
LANG["PHZ_msg_commit"] 			= "Are you sure you want to commit changes?"
LANG["PHZ_msg_cant_empty"]		= "Prop List cannot be empty!"
LANG["PHZ_msg_removesel"] 		= [[Remove selected props in the list. Legends:
Red = Marked Selections
Yellow: Prop don't exists in server AND should be Removed.]]
LANG["PHZ_msg_warn_mdlinlist"]  = "WARNING: This Model is already in the list!"
LANG["PHZ_msg_invalid_mdl"] 	= "Reason: This is invalid model"
LANG["PHZ_apply_select"] 		= "Apply & Save Selections"
LANG["PHZ_menu_copy"] 		= "Copy Model"
LANG["PHZ_menu_refresh"] 	= "Refresh Model"
LANG["PHZ_tooltip_removesel"]	= "Remove Selected"
LANG["PHZ_tooltip_wasmarked"] = [[This prop was marked because it does't exist in the server.
If you close this editor, this will automatically removed.]]

LANG["PHZ_pcr_fb_allcontent"] = "All Contents (Not All Players/Server will have same contents as you)"
LANG["PHZ_pcr_fb_notmounted"] = "%s [Not Mounted]"

-- Revision 25-27/08/2022
LANG["PHX_ADMIN_ACCESS_ONLY"]		= "Access Denied: only Admins can do that, %s !"
LANG["PHX_PROP_TOO_THIN"]           = "Cannot Replicate: Prop is too thin!"
LANG["PHX_PROP_IS_BANNED"]			= "The prop you're trying to use is banned from server!"
LANG["PHX_SPECT_JOINGAME"]			= "To join the game, Press [F2] then select a team to join."
LANG["PHX_TEAM_IS_FULL"]			= "That team is full!"
LANG["FORCE_JOIN_TEAM_IS_DISABLED"]	= "Even-out Team Balance is disabled (Team Shuffle/Rotation is Enabled)"

LANG["PHX_TM_MNBAR_OPTIONS"]		= "Options"
LANG["PHX_TM_MNBAR_SAVEFAV"]		= "Save Favorites"
LANG["PHX_TM_MNBAR_LOADFAV"]		= "Reload Favorites"
LANG["PHX_TM_MNBAR_SETTINGS"]		= "Others"
LANG["PHX_TM_MNBAR_RESET"]			= "Reset Favorites"

LANG["PHX_TM_WARN_CLEARFAV"]		= "WARNING: This will CLEAR ALL your previously saved Favorite Taunts. Are you sure you want to continue?"

LANG["PHXM_BANNED_MODELS"]			= "Dis/Allow the use of Restricted Models (Banned Models). This does not include from Prohibitted Models (They're always deleted)."
LANG["PHXM_ADMIN_ALLOWARMOR"]       = "Allow Armor Addition for team Hunters and Props"
LANG["PHXM_ADMIN_ALLOW3P"]          = "Allow thirdperson mode for Hunters"
LANG["PHXM_ADMIN_ALLOW3P_SVDESIRED"]= "Allow thirdperson mode to use Server's Desired Camera position (Disallow player custom position)"
LANG["PHXM_ADMIN_ALLOW3P_DIST"]     = "Thirdperson: Desired Camera Distance"
LANG["PHXM_ADMIN_ALLOW3P_RIGHT"]    = "Thirdperson: Desired Camera Right Position"
LANG["PHXM_ADMIN_ALLOW3P_UP"]     	= "Thirdperson: Desired Camera Up Position"
LANG["PHXM_ADMIN_JUMPPOWER_H"]		= "Additional Jump Power multiplier for Hunters"
LANG["PHXM_ADMIN_MDLCOLOR_PROP"]	= "Enable Player Color for team Props (Require Hunter Custom Models to be enabled)"
LANG["PHXM_ADMIN_MDLCOLOR_HUNTER"]	= "Enable Player Color for team Hunters (Require Hunter Custom Models to be enabled)"
LANG["PHXM_ADMIN_PITCH_ROTATION"]	= "[Experimental] Allow to use pitch rotation for props. This may be buggy."
LANG["PHXM_ADMIN_FALLDMG"]			= "Enable Fall Damage (Applies on All Teams)"
LANG["PHXM_ADMIN_FALLDMG_REAL"]		= "Enable 'Realistic' Fall Damage"
LANG["PHXM_INFORM_TO_JOIN"]			= "Inform Unassigned/Spectators with static text advice to join the game."
LANG["PHXM_ADMIN_PROPOFFSET"]		= "Substract/Add Prop View Offset Height using multiplier. Min: 0.6, Max: 1.2. Default: 0.8."
LANG["PHXM_ADMIN_REPL_MUST_STAND"]	= "[Experimental] Restrict props replication only when they're standing. Disable this to allow replicating when ducking or jumping."

LANG["PHXM_DROP_VBS_DISABLE"]       = "Disable Verbose"
LANG["PHXM_DROP_VBS_ENABLE"]        = "Enable Verbose"
LANG["PHXM_DROP_MDL_INCLUDEALL"]    = "Include Everything ( %d )"
LANG["PHXM_DROP_MDL_CUSTOMLIST"]    = "Seperate/Custom List ( %d )"
LANG["PHXM_DROP_MDLTYPE_PROP"]      = "Physics Only ( %d )"
LANG["PHXM_DROP_MDLTYPE_PROPDYN"]   = "Physics & Dynamic Props ( %d )"
LANG["PHXM_DROP_MDLTYPE_ANYENTS"]   = "Any Compatible Entities ( %d )"
LANG["PHXM_DROP_MDLTYPE_CUSTOM"]    = "Custom Entities ( %d )"
LANG["PHXM_DROP_RESPAWNBLIND_BOTH"] = "Both Teams"

LANG["PHXM_TAB_ADMINGROUPS"]        = "Group & Access Option"
LANG["PHXM_TAB_PHEPLUS"]			= "Enhanced Plus Settings"

LANG["PHXM_ADMIN_ACCESS_GROUP"]     = "Select groups to allow access PH:X Admin Settings, Enhanced Plus & Plugin Settings page."
LANG["PHXM_ADMIN_ACCESS_GROUP_HINT"] = "Please note that \"superadmins\" cannot be revoked."
LANG["PHXM_ADMIN_ACCESS_GROUP_NOULX"] = "Error: ULib & ULX is not installed on your server."
LANG["PHXM_ADMIN_ACCESS_NOREVOKE"]  = " (Cannot be revoked)"
LANG["PHXM_ADMIN_GROUP_WHOCANACC"]	= "Select groups to allow access [Admin Settings]."
LANG["PHXM_ADMIN_GROUP_MUTEABLE"]	= "Select groups to disallow Voice Mute in [Player Muting]. (User is always mute-able)."

LANG["PHXM_ADMIN_ACCESS_CHATINFO"]  = "There was a configuration update for Prop Hunt Menu window. Reopening..."
LANG["PHXM_ADMIN_ACCMSG_BODY"]      = "Do you want to save selection and proceed the changes?\nPlease note that any previous groups you revoked will no longer have the access.\nThis will restart the Prop Hunt Menu if they're still opened."
LANG["PHXM_ADMIN_ACCMSG_TITLE"]     = "Apply Group Access"
LANG["PHXM_ADMIN_ACCCFG_SUCC"]      = "Group Access data successfully saved."
LANG["PHXM_ADMIN_ACCCFG_FAIL"]      = "There was an error saving Group Access data. Check your server console!"
LANG["PHXM_ADMIN_MUTCFG_SUCC"]      = "Mutedable Group Access data successfully saved."
LANG["PHXM_ADMIN_MUTCFG_FAIL"]      = "There was an error saving Muteable Group data. Check your server console!"

LANG["PHXM_ADMIN_ACCESS_APPLY"]     = "Apply Selected Groups"

-- PHE/Plus
LANG["PHXM_ADMIN_PLUSSETTING"]		= "Plus+ Settings"
LANG["PHXM_PLUSSETTING_HINT"]		= "Configure Team Balance or any other additional settings."
LANG["PHXM_HEADER_UNSTUCK"]			= "Unstuck Settings"
LANG["PHXM_HEADER_TEAMSETTING"]		= "More Team Options & Settings"

LANG["LIST_PLAYER"]					= "Players"
LANG["LIST_FORCEDASPROP"]			= "Forced As Prop?"
LANG["LIST_MARKEDASPROP"]			= "Marked to be forced as Prop"
LANG["LIST_NOHUNTERS"]				= "No Hunters are currently playing."

LANG["PHXM_PLUS_MSG_NO_HUNTERS"]	= "There are no hunters to reset."

LANG["PHXM_PLUS_BTNRESET"]			= "Clear Selections (and Reset All Forced)"
LANG["PHXM_PLUS_LISTTIPS"]			= "Tips: Double Click to toggle Force Player as Prop."

LANG["PHXM_ADMIN_ENABLEUNSTUCK"]		= "Toggle Enable/Disable Built-in unstuck feature. If you use an addon, disable this."
LANG["PHXM_ADMIN_NOTPUNSTUCKINROUND"]	= "Disable last-resort unstuck teleportations to spawnpoints outside of the hiding phase" --ph_disabletpunstuckinround
LANG["PHXM_ADMIN_UNSTUCK_WAITTIME"]		= "How much seconds must pass between each unstuck attempt" --ph_unstuck_waittime
LANG["PHXM_ADMIN_TEAMBAL_ORIG"] 		= "Use PH:X's original auto-balancing (disables all following team-related options below)" --ph_originalteambalance
LANG["PHXM_ADMIN_TEAMBAL_UNCHECK"] 		= "Uncheck the previous checkbox to access the advanced team balance options." --ph_originalteambalance_uncheck [UNUSED]
LANG["PHXM_ADMIN_FORCESPECTOPLAY"]		= "Force spectators to play by including them when balancing teams" --ph_forcespectatorstoplay
LANG["PHXM_ADMIN_NO_H_CONSECUTIVE"]		= "Prevent players from being a Hunter twice in a row (only works in shuffle mode)" --ph_preventconsecutivehunting
LANG["PHXM_ADMIN_HUNTER_COUNT"] 		= "Hunter count (0 = automatic)" --ph_huntercount
LANG["PHXM_ADMIN_ROTATETEAM"] 			= "Disable shuffle mode and rotate players instead" --ph_rotateteams
LANG["PHXM_ADMIN_RESET_ROTTEAM"] 		= "Reset rotations" --ResetRotateTeams
LANG["PHXM_ADMIN_RESET_ROTTEAM_WARN"]	= "Restart rotations from the beginning (in case you've started them, stopped, then started again and the current rotation does not satisfy you):" --ResetRotateTeams_warning
LANG["PHXM_ADMIN_RESET_MSG"]			= "Rotation Team has been Reset!"
LANG["PHXM_ADMIN_FORCEH2P_WARN"]		= "Force a Hunter to be a Prop next time (only works in shuffle mode):" --ForceHunterAsProp_warning
LANG["PHXM_ADMIN_FORCEH2P_RANDONLY"]	= "This action is only available in shuffle mode." --ForceHunterAsProp_randomonly
LANG["PHXM_ADMIN_FORCEH2P_NOHUNT"]		= "[NO HUNTERS]" --ForceHunterAsProp_nohunters [UNUSED]
LANG["PHXM_ADMIN_FORCEH2P_NOHUNTMSG"] 	= "There are no hunters goddammit, it's written on the button!" --ForceHunterAsProp_nohuntersmsg [UNUSED]

LANG["FORCEH2P_WILL_BE"]				= "%s will be a Prop next round."
LANG["FORCEH2P_IS_CANCELED"]			= "%s won't be a Prop next round."
LANG["FORCEH2P_IS_RESET"]				= "All Hunters won't be Forced as a Prop next round."
LANG["FORCEH2P_PLAYER_NOT_FOUND"]		= "Selected player was not found, probably they were disconnected."
LANG["PHX_ROTATE_TEAM_RESET"]			= "Rotation Team Offset has been reset."
LANG["FORCEH2P_ALREADY"]				= "%s has already been defined as a Prop for next round." -- [UNUSED]

LANG["UNSTUCK_YOURE_UNSTUCK"]			= "You should be unstuck!"
LANG["UNSTUCK_BAD_SPAWNPOINT"]			= "Error: The closest spawnpoint might get you stuck again. If it does, try to unstuck again."
LANG["UNSTUCK_RESCUE_SPAWNPOINT"]		= "This spawnpoint is extremely close, so you might still be stuck. Try unstucking again if you are."
LANG["UNSTUCK_NO_SPAWNPOINTS"]			= "For unknown reasons, no spawnpoint could be found. As a backup strategy, you will be teleported to (0, 0, 0). There is a very high chance that you will be stuck, so if you are please try unstucking again."
LANG["UNSTUCK_PLEASE_WAIT"]				= "Please wait %d seconds between each unstuck attempt."
LANG["UNSTUCK_NOT_ON_GROUND"] 			= "Not on ground, checking..."
LANG["UNSTUCK_NOT_STUCK_JITTER"]		= "You're not stuck. If you really are, wait until your prop no longer moves/jitters (try pressing ALT) then try again."
LANG["UNSTUCK_NOT_STUCK_TOOBAD"]		= "You're not stuck. If you really are, sorry, you'll have to wait until the end of the round."
LANG["UNSTUCK_CANNOT_FIND_SPOT"]		= "Cannot find a place to move you to, teleporting to closest spawnpoint."
LANG["UNSTUCK_SPAWNPOINTS_DISABLED"]	= "You were going to be teleported to a close spawnpoint, but this server disallows it outside of the hiding/hunter blind period. Sorry!"
-- End of PHE/Plus

LANG["MISC_SEL_APPLY"]  = "Apply Selections"
LANG["MISC_RESET_SEL"]  = "Reset Selections"
LANG["MISC_RESET"]      = "Reset"
LANG["MISC_CANCEL"]     = "Cancel"
LANG["MISC_SEL_ALL"]    = "Select All"
LANG["MISC_SEL_NONE"]   = "Select None"

LANG["PHXM_CL_THIRDPERSON"]     = "Key for Toggling thirdperson mode"
LANG["PHXM_CL_UNSTUCK"]			= "Key for Unstuck"
LANG["CL_THIRDPERSON_ENABLED"]  = "Thirdperson Enabled"
LANG["CL_THIRDPERSON_DISABLED"] = "Thirdperson Disabled"

LANG["PHX_TP_ADJUSTVIEW_BTN"]	= "Adjust Thirdperson View" --Button, as well as window title.
LANG["PHX_TPS_ADJ_TITLE"]		= "Thirdperson Warning"
LANG["PHX_TPS_ADJ_SVDESIRED"]	= "Thirdperson Customization disabled: Using Server's desired position."
LANG["PHX_TPS_ADJ_3PDIS"]		= "Thirdperson mode is disabled."
LANG["PHX_TPS_ADJ_BLIND"]		= "You're blinded. Try again later."
LANG["PHX_TPS_ADJ_NEEDALIVE"]	= "You need to be on Alive Hunter Team to do this."

LANG["ANG_AXIS_DIST"]	= "Distance" -- or Forward
LANG["ANG_AXIS_RIGHT"]	= "Right"
LANG["ANG_AXIS_UP"]		= "Up"
LANG["VEC_POS_LEFT"]	= "Left" --X
LANG["VEC_POS_FRONT"]	= "Front" --Y?
LANG["VEC_POS_TOP"]		= "Top"  --Z

-- Key Hints
LANG["KEYHINT_HUNTER3P"] 	= "Hunter Thirdperson"
LANG["KEYHINT_SHOOT"]		= "Fire Weapon"
LANG["KEYHINT_SEC"]			= "Fire Secondary"
LANG["KEYHINT_PICKUP"]		= "Pickup Object/Interact"

LANG["KEYHINT_LMB"]			= "Replicate Prop"
LANG["KEYHINT_RMB"]			= "Prop Taunt/Special Ability"
LANG["KEYHINT_RANDTAUNT"] 	= "Random Taunt"
LANG["KEYHINT_TAUNTMENU"] 	= "Toggle Taunt Menu"
LANG["KEYHINT_ROTATION"] 	= "Toggle Rotation Lock"
LANG["KEYHINT_PROPMENU"] 	= "Toggle Prop Menu"
LANG["KEYHINT_FREEZEAIR"] 	= "Toggle Prop Freeze"
LANG["KEYHINT_SPAWNDECOY"] 	= "Spawn Decoy"
LANG["KEYHINT_UNSTUCK"]		= "Unstuck Key"

LANG["KEY_LMB"]				= "LMB" -- Left Mouse Button, Short version
LANG["KEY_RMB"]				= "RMB" -- Right Mouse Button, Short version

LANG["MISC_TEAM_NAME"]		= "TEAM: %s" -- TEAM PROPS, TEAM HUNTERS, but in 1 sentence.
LANG["NOTIFY_HEADER_TITLE"]	= "Game Controls"

PHX.LANGUAGES[LANG.code] = LANG