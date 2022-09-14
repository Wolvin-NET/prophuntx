-- Kindly free to improve the language.

-- Originally written by: Trigstur


local LANG = {}

LANG.code = "nl"

LANG.Name 		 	= "Nederlands" -- example: "Bahasa Indonesia"
LANG.NameEnglish	= "Dutch" -- Your Language but spoken in English, example: "Indonesian"
LANG.Author			= "Trigstur" -- Only accept STRINGS.
-- Can Accept: String, and Table.
LANG.AuthorURL		= {"http://steamcommunity.com/profiles/76561198161415786"}

-- Special Section that isn't String-based
LANG.SUICIDEMSG = {  -- Fix me: there was addition text here but feel free to add more.
	"heeft zelfmoord gepleegd!", 
	"gind dood op misterieuze wijze.",
	"is door magie om het leven gekomen.",
	"heeft zichzelf beschoten.",
	"is uit woede omgekomen.",
	"is dronken.",
	"ging dood... doe volgende keer beter je best!",
	"sloeg zichzelf.",
	"is over een stok gevallen.",
	"is door de force om het leven gekomen.",
	"ragdolled.",
}

LANG.RANDOM_SPECTATORS = { --> FRETTA
	"om te kijken en te chillen",
	"zie ze hangen.",
	"om dingen te zien.",
	" ",
}

LANG["PHX_TEAM_CONNECTING"] = "Verbinden"
LANG["PHX_TEAM_PROPS"]		= "Props"
LANG["PHX_TEAM_HUNTERS"] 	= "Zoekers"
LANG["PHX_TEAM_UNASSIGNED"]	= "Niet toegewezen"
LANG["PHX_TEAM_SPECTATOR"] 	= "Toeschouwer"

-- List of string-based translation

-- // FRETTA SECTION \\
--  FRETTA: Kill text (X killed Y)
LANG["HUD_KILLED"]				= "doden"

-- FRETTA: HUDs
LANG["HUD_TIME"] 				= "TIJD"
LANG["HUD_ROUND"]				= "RONDE"
LANG["HUD_WAITPLY"]				= "Wachten op spelers..."
LANG["HUD_DEAD"]				= "(DOOD) "

LANG["HUD_TEAMWIN"]				= "%s wint!"
LANG["HUD_LOSE"]				= "Gelijkspel, iedereen verliest!"
LANG["MISC_TIMELEFT"]			= "Tijd over: %s"
LANG["MISC_GAMEEND"] 			= "Game is over na deze ronde"

-- FRETTA: Team selection screen (F2)
LANG["DERMA_TEAMSELECT"]		= "Kies een Team"

-- FRETTA: F1 screeen
LANG["DERMA_RTV"] 				= "Stem voor verandering (RTV)"
LANG["DERMA_PHMENU"] 			= "Prop Hunt Menu"
LANG["DERMA_CHANGETEAM"]		= "Verander Team"

-- FRETTA: Scoreboard
LANG["DERMA_PLAYER"]			= "(%d speler)"	
LANG["DERMA_PLAYERS"]			= "(%d spelers)"
LANG["DERMA_NAME"]				= "Naam"
LANG["DERMA_KILLS"]				= "Kills"
LANG["DERMA_DEATHS"]			= "Doden"
LANG["DERMA_PING"]				= "Ping"
LANG["DERMA_SERVER_TAG"]		= "SV" --Fix Me
LANG["DERMA_BOT_TAG"]			= "BOT" -- Fix Me
LANG["DERMA_GAMEMODE_CREDITS"]	= "%s | Version: %s - Rev. %s" -- Fix Me

LANG["CHAT_JOINED"]				= " toegetreden "
LANG["CHAT_JOINEDTHE"]			= " is toegetreden tot "

LANG["CHAT_SWAPBALANCE"]		= "%s is veranderd naar %s voor gebalabceerde teams."
LANG["CHAT_SWAPBALANCEYOU"]		= "Je bent van team gewisseld voor perfecte balans :)"

-- FRETTA: Splash Starting Screen
LANG["SPASHSCREEN_BY_X"]		= "by %s"	--Fix Me
-- RichTextBox
LANG["HELP_DONATORS_AND_CONTRIBUTORS"]  = "\n\nDonators & Contributors:\n- %s" --Fix Me
-- // END OF FRETTA SECTION \\

LANG["HELP_F1"] 				= [[A Prop Hunt (Codename) X Project.

Een project om Prop Hunt X moder en aanpasbaar te maken.

Meer informatie kan hier gevonden worden:
https://gmodgameservers.com/prophuntx

Om meer informatie te zien, hulp en uitleg, Druk op de [F1] toets en klik dan op het [Prop Hunt Menu] knopje.

Versie: ]].. PHX.VERSION ..[[ Herzien: ]].. PHX.REVISION ..[[

Veel plezier!]]

-- Important!
LANG["LANGUAGE_CHANGED"]		= "Voorkeur taal is aangepast naar %s"

-- internal cl_menutypes section.
LANG["SUBTYPE_PREFERED_LANG"]	= "Voorkeur Taal"
--LANG["SUBTYPE_TEXTENTRY_?"]	= "???"

-- Events
LANG["EV_PLAYER_CONNECT"]		= "%s heeft connectie gemaakt met de server."
LANG["EV_PLAYER_JOINED"]		= "%s is gejoined."
LANG["EV_PLAYER_DISCONNECT"]	= "%s heeft de server verlaten (Reden: %s)"

-- HUD elements
LANG["HUD_HP"]					= "LEVENS"
LANG["HUD_AMMO"] 				= "KOGELS"	-- obsolete
LANG["HUD_MAGSEC"]				= "MAG. / SEC." --Magazine Counts (separator) Secondary Magazine Counts

-- !!WEAPON NAMES CANNOT BE TRANSLATED, THEY USE FROM language.GetPhrase THEREFORE IT'S IMPOSSIBLE TO DO.

LANG["TEAM_PROPS"]				= LANG["PHX_TEAM_PROPS"] --"Props"
LANG["TEAM_HUNTERS"]			= LANG["PHX_TEAM_HUNTERS"] --"Zoekers"

LANG["HUD_ROTLOCK"]				= "Prop Rotatie: Gesloten"
LANG["HUD_ROTFREE"]				= "Prop Rotatie: Vrij"
LANG["HUD_KILLEDBY"]			= "Je bent vermoord door %s"

LANG["HUD_AUTOTAUNT"]			= "Automatisch taunt vertonen in %d seconden"
LANG["HUD_AUTOTAUNT_ALT"]		= "Automatisch taunt vertonen in %d"

LANG["HUD_TargetID"]			= "Gebruiker: %s (%d%%)" -- Player: <NAME> (<HEALTH>%)

LANG["HUD_BLINDED"]				= "de %s zullen gaan zoeken in %s"
LANG["HUD_UNBLINDED"]			= "Klaar? Hier komen ze!"

LANG["BLIND_RESPAWN_TEAM"]		= "Je bent respawned in %s team in %d seconden tijdens blinde tijd." 
LANG["BLIND_RESPAWN"]			= "Je ben respawned %d seconden in de blinde tijd."

LANG["MISC_ACCEPT"]				= "Accepteren"
LANG["MISC_OK"]					= "OK"
LANG["MISC_CLOSE"]				= "Sluiten"
LANG["MISC_PREV"]				= "< TERUG"
LANG["MISC_NEXT"]				= "VOLGENDE >"
LANG["MISC_ACCESSDENIED"]		= "Toegang Geweigerd"

-- Chat messages
LANG["CHAT_NOPLAYERS"]			= "Er zijn niet genoeg spelers om een spel te starten!"
LANG["CHAT_SWAP"]				= "Teams zijn gewisselt!"

LANG["CHAT_SWAPTEAM_WARNING"]   = "Je bent gewiseld van team %dx (%dx MAX). Na dat, kan je niet langen verwisellen van team."
LANG["CHAT_SWAPTEAM_REVERT"]	= "Je kan niet naar team %s wisellen aangezien je het maximale verwisselingen hebt bereikt."

LANG["CHAT_PROP_NO_ROOM"] 		= "Er is geen ruimt om naar die prop te veranderen!"

-- Notification
LANG["NOTIFY_IN_PROP_TEAM"]		= "Je zit in het Prop Team, met draai mogelijkheden! Je kan je prop draaien door je muis te bewegen."
LANG["NOTIFY_ROTATE_NOTICE"]	= "Je kan ook lock toggle gebruiken door (standaard) de [R] knop in te drukken!"

-- Custom Taunt Window
LANG["TM_WARNING_CT_DISABLE"]	= "[PHX - Taunts] Waarschuwing: Deze servers heeft gepersonaliseerde taunts uitstaan."
LANG["TM_NO_TAUNTS"]			= "Waarschuwing: Geen taunts gedetecteerd in deze categorie."
LANG["TM_PLAY_ONLY_ALIVE"] 		= "Je bent alleen toegestaan gepersonaliseerde taunts af te spelen als je levend bent."

LANG["TM_WINDOW_TITLE"]			= "Prop Hunt Gepersonaliseerde Taunt Menu"
LANG["TM_NOTICE_PLSWAIT"]		= "Wacht alsjeblieft %s seconden!" -- fix me: Add " before Random Taunt ends!"
LANG["TM_NOTICE_PLAYPREVIEW"]	= "Voorbeeld Taunt: %s"

LANG["TM_TOOLTIP_PLAYTAUNT"] 	= "Play Taunt"
LANG["TM_TOOLTIP_PREVIEW"]		= "Voorbeeld Taunt"
LANG["TM_TOOLTIP_PLAYCLOSE"]	= "Speel Taunt en Sluit"
LANG["TM_TOOLTIP_PLAYRANDOM"]	= "Speel Willekeurige Taunt"
LANG["TM_TOOLTIP_CLOSE"]		= "Sluiten"
LANG["TM_MENU_CLOSE"]			= "Sluit Menu"

LANG["TM_DELAYTAUNT_NOT_EXIST"] = "De geselecteerde taunt was niet in de server gevonden!"
LANG["TM_DELAYTAUNT_PLSWAIT"]	= "Wacht alsjeblieft %s seconden!"

--[[
	PHX Menu window
]]
LANG["PHXM_WINDOW_TITLE"]		= "Prop Hunt X - Geadvanceerde Instellingen & Menu"
LANG["SERVER_INFO_MOTD"]		= "SERVER INFORMATIE & REGELS [MOTD]"

LANG["PHXM_TAB_HELP"]			= "Help & Guides"
LANG["PHXM_TAB_MUTE"]			= "Speler Un/Mute Voice"
LANG["PHXM_TAB_PLAYER"]			= "Speler Instellingen"
LANG["PHXM_TAB_MODEL"] 			= "Speler Model Browsers"
LANG["PHXM_TAB_MODEL_DISABLED"]	= "Speler Model Browsers (Uitgeschakeld)"
LANG["PHXM_TAB_ADMIN"]			= "Administratie Instellingen"
LANG["PHXM_TAB_ABOUT"]			= "Over Prop Hunt X"
LANG["PHXM_TAB_MAPVOTE"]		= "Map Stemming Instellingen"

LANG["PHXM_CVAR_CHANGED"]		= "[Instellingen] CVar %q is veranderd naar %q"

--[[
	Player Mute Settings
]]
LANG["PHXM_MUTE_SELECT"]		= "Select any player that you want to mute."

--[[ 
	Player Settings
]]
LANG["PHXM_PLAYER_OPTIONS"]		= "Player Instellingen"
LANG["PHXM_PLAYER_LANG"]		= "Talen"
LANG["PHXM_PLAYER_BIND"]		= "Bindingen"
LANG["PHXM_PLAYER_HUDSETTINGS"]	= "HUD Instellingen"

LANG["PHXM_PLAYER_TAUNT_KEY"]			= "Willekeurige Taunt toets"
LANG["PHXM_PLAYER_TAUNTWINDOW_KEY"]		= "Taunt Menu toets"
LANG["PHXM_PLAYER_ROTATLOCK_KEY"]		= "Rotatie Lock toets"

LANG["PHXM_PLAYER_TOGGLE_HALOS"]		= "Schakel Halo effect bij het kiezen van een prop"
LANG["PHXM_PLAYER_IDNAMES"]				= "Show Team player names above their heads instead (and appear through wall too)"
LANG["PHXM_PLAYER_ENDROUND_CUE"]		= "Play End round sound cue"
LANG["PHXM_PLAYER_TAUNTMENU_AUTOCLOSE"]	= "Optie voor het automatisch sluiten van het taunt scherm bij het dubbelklikken"
LANG["PHXM_PLAYER_SEE_HUNTER_LINE"]		= "Teken een lijn voor Zoeker zodat toeschouwers hun richting kan zien"
LANG["PHXM_PLAYER_SEE_LBALL_ICONS"]		= "Schakel 'Lucky ball' icoon in om vertoond te worden bij het spawnen"
LANG["PHXM_PLAYER_SEE_CRYSTAL_ICONS"]	= "Schakel 'Devil ball' icoon in om vertoond te worden bij het spawnen"

LANG["PHXM_PLAYER_USE_NEW_HUD"]			= "Gebruik de nieuwe PH: Geadvenceerde HUD"
LANG["PHXM_PLAYER_SHOW_TUTOR"]			= "Laat Tutorial Pop-up (Zien alleen 2 keer bij prop spawn)"
LANG["PHXM_PLAYER_USE_NEW_CROSSHAIR"]	= "Zet Custom Crosshair aan"
LANG["PHXM_PLAYER_SHOW_TEAM_TOPBAR"]	= "Laat totaal levende team leden zien in de linker top van de balk (Minstens 4 personen zullen getoond worden)"

--[[
	Player model Browser Section
]]
LANG["QUERY_MODEL_SELECTED"]	= "Model %s is geselecteerd en zal worden toegepast bij het respawnen!"
LANG["QUERY_MODEL_INFO"]		= "Model naam: %s - Toegankelijk voor: Iedereen"

LANG["MDL_MENU_REFRESH"] 		= "Vernieuw Icoon"
LANG["MDL_MENU_PREVIEW"] 		= "Voorbeeld Model"
LANG["MDL_MENU_MODELINFO"] 		= "Model Informatie"


LANG["MISC_APPLYMDL"] 			= "Pas Model Toe"

LANG["PHXM_MODEL_DISABLED"] 	= "Sorry, Aangepaste Player Models zijn uitgeschakeld in deze server!"
LANG["PHXM_PLAYERMODEL_SETFOV"]	= "  Zet Model FOV"

--[[
	Server Settings
]]
LANG["PHXM_ADMIN_OPTIONS"]		= "Serverside gamemode optie (Aleen zichtbaar voor Administratie)"
LANG["PHXM_ADMIN_MUSTALIVE"]	= "Je moet in een levend team zijn om dit te doen."

--[[
	Language Override
]]
LANG["PHXM_ADMIN_LANGOVERRIDE"]	= "Taal Overschrijven"

LANG["PHXM_ADMIN_FORCELANG"] 				= "Gebruik taal overschrijving? Dit zal de client taal overschrijden en die van de server gebruiken"
LANG["PHXM_ADMIN_LANGTOUSE"]				= "Forceer taal om te gebruiken."
LANG["PHXM_ADMIN_PLAYERDEFAULTLANG"] 		= "Standaar taal wanneer de speler voor het eerst toetreed."

-- Gameplay settings
LANG["PHXM_ADMIN_CUSTOM_MODEL"]				= "Sta aangepaste models voor Zoekers toe"
LANG["PHXM_ADMIN_CUSTOM_MODEL_PROP"]		= "Sta aangepaste models voor Props toe - zorg dat die voor Zoekers ook aanstaat."
LANG["PHXM_ADMIN_TAUNT_DELAY_CUSTOM"]		= "Aangepaste Taunts Vertraging (Seconden)"
LANG["PHXM_ADMIN_TAUNT_DELAY_RANDOM"]		= "Normal Taunts Vertraging (Seconden)"
LANG["PHXM_ADMIN_TAUNT_DELAY_AUTO"]			= "Automatisch Taunts Delay (Seconden)"
LANG["PHXM_ADMIN_AUTOTAUNT_ENABLE"]			= "Aan Automatische Taunt Functie"

LANG["PHXM_ADMIN_NOTICE_ROTATION"]			= "Laat 'Prop Rotation' notificaties zien voor elke Prop Spawn"
LANG["PHXM_ADMIN_CAMERA_COLLIDE"]			= "Schakel camera collise met de muur"
LANG["PHXM_ADMIN_FREEZECAM"]				= "Scakel camera bevriezing functie toe voor props in"
LANG["PHXM_ADMIN_PROP_COLLIDE"]				= "Scakel prop colissie in"
LANG["PHXM_ADMIN_SWAP_TEAM"] 				= "hussel team elke ronde - Uitzetten resulteert in vaste teams"
LANG["PHXM_ADMIN_HUNTER_PENALTY"]			= "Zoeker levens straf"
LANG["PHXM_ADMIN_HUNTER_KILL_BONUS"]		= "Zoeker kill bonus"
LANG["PHXM_ADMIN_HUNTER_SMG_GRENADES"]		= "Zoeker SMG granaten"
LANG["PHXM_ADMIN_GAME_TIME"]				= "Totalen Game tijd (Minuten)"
LANG["PHXM_ADMIN_BLINDLOCK_TIME"]			= "Zoeker blindlock time (Seconden)"
LANG["PHXM_ADMIN_ROUND_TIME"]				= "Game ronde tijd (Seconden)"
LANG["PHXM_ADMIN_ROUNDS_PER_MAP"]			= "Totaal aantal rondes per game"
LANG["PHXM_ADMIN_ENABLE_LUCKYBALL"]			= "Sta Lucky Balls functie toe, om gespawned te worden bij breekbare props (Kans is 8%)"
LANG["PHXM_ADMIN_ENABLE_CRYSTAL"]			= "Sta Devil Balls functie toe, bij het doodgaan van een huntZoekerr (Kans is 70%)"
LANG["PHXM_ADMIN_WAIT_PLAYERS"]				= "Wachten op spelers voor het starten van de gameplay"
LANG["PHXM_ADMIN_WAIT_MIN_PLAYERS"]			= "Mininum Spelers bij het wachten voordat de game begint (standaard: 1)"
LANG["PHXM_ENABLE_PLAYER_JOIN_LEAVE"] 		= "Schakel chat notificaties voor spelers binnekomst en verlaten in? Zet dit naar 0 als je voorkeur hebt naar je eigen custom chat plugin."

LANG["PHXM_ADMIN_FORCEJOINBALANCE"]			= "Forceer spelers naar het joinen van teams om het eerlijk te maken"
LANG["PHXM_ADMIN_ENABLETEAMBALANCE"]		= "Automatisch eerlijk maken van teams aan het begin van de ronde (Team Balancering)"
LANG["PHXM_ADMIN_PICKUP_PROPS"] 			= "Sta het opakken van smalle props toe? 0: Niet Toestaant, 1: Alleen Zoekers, 2: Alleen Props, 3: Sta toe."

LANG["PHXM_ADMIN_TAUNTMODES"]			= "Taunt Modes"
LANG["PHXM_ADMIN_TAUNTMODE_MODE"]		= "--[Huidige Taunt Modus is: %d ]--"
LANG["PHXM_ADMIN_TAUNTMODE0"]			= "Mode [0]: F3/Willekeurige Taunt"
LANG["PHXM_ADMIN_TAUNTMODE1"]			= "Mode [1]: C/Aangepaste Taunt"
LANG["PHXM_ADMIN_TAUNTMODE2"]			= "Mode [2]: Beide Modes"
LANG["PHXM_ADMIN_TAUNTSOPEN"]			= "Open Taunt Menu"

LANG["PHXM_MODE_DEFAULT"] 				= "--[ Pickup Mode is set to %d ]--"
LANG["PHXM_MODE0"]						= "Mode [0]: Niet toestaan"
LANG["PHXM_MODE1"]						= "Mode [1]: Alleen Zoekers"
LANG["PHXM_MODE2"]						= "Mode [2]: Alleen Props"
LANG["PHXM_MODE3"]						= "Mode [3]: Opakken toestaan"

--[[
	Admin Developer Sections
]]
LANG["PHXM_ADMIN_DEVSECTION"]		= "Developer Opties/Experimentele Functies"
LANG["PHXM_ADMIN_ROOMCHECK"]		= "Grenscontrole inschakelen? Zo voorkom je dat je vast komt te zitten in voorwerpen / muren"
LANG["PHXM_ADMIN_USENEWMKBREN"]		= "Gebruik een nieuw model voor het bonuswapen Bren MK II (opnieuw opstarten van kaart vereist))"
LANG["PHXM_ADMIN_BEVERBOSE"]		= "Ontwikkelaar: Be Verbose - PH: X inschakelen om alle informatie en evenementen woordelijk af te drukken?"
LANG["PHXM_ADMIN_SHOWPLNAMEHEAD"]	= "Schakel spelers team namen in om op het scherm te laten zien."
LANG["PHXM_ADMIN_USESINGLE_FZCAM"]	= "Gebruik een Freezecam geluid in plaats van een geluids lijst (Gebruik 'ph_fc_cue_path' om het pad naar de freeze sound te bepalen)"
LANG["PHXM_ADMIN_MODELLISTINGTYPE"] = "Gebruik Legacy Modelen Lijst: 0: Alle Playermodels, 1: Gebruik Legacy: list.Get ('PlayerOptionsModel')"
LANG["PHXM_ADMIN_JUMPPOWER"]		= "Extra sprongkrachtvermenigvuldiger voor Props"
LANG["PHXM_ADMIN_ENABLE_OBB"]		= "Ontwikkelaar: Enable Customized Prop Entities Model Boundaries (OBB) Modifier from config data"
LANG["PHXM_ADMIN_RELOAD_OBB"]		= "Ontwikkelaar: herlaad de OBB-modificatiegegevens, elke ronde wordt opnieuw gestart"

--[[
	Experimental & PH:X Features
]]
LANG["PHXM_ADMIN_EXPERIMENTALPHX"]			= "Nieuwe PHX Experimientele Secties"

LANG["PHXM_ADMIN_HLA_COMBINE"]				= "Voeg HLA samenvoeging model support toe"
LANG["PHXM_ADMIN_TEAMBALANCE"]				= "Sta Team Balancering toe"
LANG["PHXM_ADMIN_CHANGETEAM_LIMIT"]			= "Gebruik team switscher limiet. Zet op -1 om uit te schakelen. "
LANG["PHXM_ADMIN_USENEWCHAT"]				= "Gebruike nieuwe chat box (eChat) - Dit is een tijdelijke vervanging. Als je er al een hebt. Laat deze optie ongeselecteerd."
LANG["PHXM_ADMIN_NEWCHATPOS"]				= "New Chat Box Position: Substract Height (Y) Position by N pixels."
LANG["PHXM_ADMIN_RESPAWNONBLIND"]			= "Sta respawnnen tijden blinden tijd toe"
LANG["PHXM_ADMIN_RESPAWNONBLIND_TEAM"]		= "Sta respawnen tijden blinde tijd toe voor een specifiek team: 0: Allemaal, 1: Zoekers, 2: Props"
LANG["PHXM_ADMIN_REWSPANTIMEPERCENT"]		= "Percentage van blinde tijd die men toestaat om te reapwnenen. Standaard is 0.75 (betejebt 75% * Maximale Blinden Tijd)"
LANG["PHXM_ADMIN_ALLOWRESPAWN_SPECTATOR"]	= "Sta respawnnen tijden blinden tijd toe bij het toewijzen aan toekijkers"
LANG["PHXM_ADMIN_ALLOWRESPAWN_TEAMCHANGE"]	= "Sta respawnnen tijden blinden tijd toe bij het toewijzen aan anderen teams (dit is miscchien niet aangeraden)"

--[[
	MapVote Settings
]]
LANG["PHXM_MV_SETTINGS"]			= "Map Stemming Settings"

LANG["PHXM_MV_ALLOWCURMAP"]			= "Sta stemmen op de huidige map toe"
LANG["PHXM_MV_COOLDOWN"]			= "Schakel map stem cooldown in"
LANG["PHXM_MV_USE_ULX_VOTEMAPS"]	= "Gebruik map listing van ULX Map Stemming? Zo niet, standaard maps/*.bsp zullen worden gebruikt."
LANG["PHXM_MV_MAPLIMIT"]			= "Nummer maps om te laten zien in de stemming."
LANG["PHXM_MV_TIMELIMIT"]			= "Tijd in seconden voor standaard Map Stemming."
LANG["PHXM_MV_MAPBEFOREREVOTE"]		= "Map verandering nodig voor een map om terug te keren in de stemming"
LANG["PHXM_MV_RTVCOUNT"]			= "Hoeveel spelers RTV moeten gebruiken (Rock the Vote)"

LANG["PHXM_MV_EXPLANATION1"]		= "Om op te zetten welke map gebruikt zou moeten worden, gebruik (bijvoorbeeld) [ mv_map_prefix 'phx_,ph_,cs_,de_' ] in de console."
LANG["PHXM_MV_EXPLANATION2"]		= "Als je ULX gebruikt, gebruik map_vote. Zo niet, gebruik mv_start."
LANG["PHXM_MV_EXPLANATION3"]		= "Map Stemming actie (Annuleren, simpel type !unmap_vote (ULX) of mv_stop in de console.)"

LANG["PHXM_MV_START"]		= "Start Map Stemming"
LANG["PHXM_MV_STOP"]		= "Stop Map Stemming"
--                  			  ^YOU VIOLATED THE LAW!


--[[ 
	Versioning, Credits or About section
]]
LANG["PHXM_ABOUT_VERSIONING"]		= "Versie: %s - Hervisie: %s"
LANG["PHXM_ABOUT_AUTHOR"]			= "Door: %s"
LANG["PHXM_ABOUT_ENJOYING"]			= "Als je de game leuk vind, overweeg te doneren!"
LANG["PHXM_ABOUT_UPDATE"]			= "Prop Hunt X Updates"
-- [[ FIX ME ]] --
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
-- [[ FIX ME ]] --
LANG["PHXM_ABOUT_LINKS"]			= "Links en credits"
LANG["PHXM_ABOUT_THANKS"]			= "Speciaal dank voor de Support, Suggesties & Bijdragen:\n %s"
LANG["PHXM_ABOUT_BTN_DONATE"]		= "Steun PH:X door te doneren"
LANG["PHXM_ABOUT_BTN_HOME"]			= "PHX Homepagina"
LANG["PHXM_ABOUT_BTN_GITHUB"]		= "PHX GitHub Repository"
LANG["PHXM_ABOUT_BTN_PLUGINS"]		= "PHX Toevoegingen & Aanpassingen"
LANG["PHXM_ABOUT_BTN_CHANGELOGS"]	= "PHX Veranderingslogboek"

--[[
	Late Additionals
]]
-- fretta
LANG["HUD_SPECTATING"]	= "TOESCHOUWER"
LANG["HUD_YOUDIED"]		= "Je bent doodgegaan!"

LANG["CHAT_STARTING_MAPVOTE"] = "Ronde is geëindigd. Start stemming voor volgende map..."

-- This used for HUD Taunt Timer
LANG["HUD_PROP_TAUNT_TIME"]	= "Willekeurige Taunt"
LANG["HUD_PROP_CTAUNT_TIME"] = "Cust. Taunt"

LANG["PHXM_TAB_PLUGINS"]				= "Toevoegingen & Aanpassingen"

-- Plugins Section
LANG["PLUGINS_NO_PLUGINS"]				= "Geen toevoegingen geinstaleerd. Zoek naar meer toevoegingen hier!"
LANG["PLUGINS_BROWSE_MORE"]				= "Zoek naar meer aanpassingen"
LANG["PLUGINS_SERVER_HAS_NO_PLUGINS"]	= "Sorry, de server heeft geen toevoegingen geinstaleerd."
LANG["PLUGINS_SERVER_SETTINGS"]			= "-- Server Settings --"
LANG["PLUGINS_CLIENT_SETTINGS"]			= "-- Client Settings --"

--============= LATE ADDITION OF 29.10.21/X2Z. =============--

LANG["MISC_GAME_ENDED"]		= "Game has ended."

--============= LATE ADDITION OF 16.09.21/X2Z. Please Improve your Language Here! =============--

-- Text Entries
LANG["TEXTENTRY_FZ_SINGLE"] = "Freeze Cam Single Sound Path" -- this one is for ph_fc_cue_path command
LANG["TEXTENTRY_MV_PREFIX"] = "Map Stemming Prefix"			 -- the map previx for mv_map_prefix

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

--[[
	Freeze Cam, Revision: 23.09.21/X2Z
]]
LANG["PHXM_ADMIN_FREEZECAM_HUNTER"]			= "Enable Freeze Cam features for team hunters"

--============= LATE ADDITION OF 10.06.2022/X2Z. =============--

LANG["PHXM_MSG_INPUT_IS_EMPTY"]			= "Text is empty or you didn't pressed ENTER key."
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
LANG["PCR_PLUG_X_BBOX_MIN"]		= "BBox CollisionBound Maximum Width limit. ins will be auto-calculated."
LANG["PCR_PLUG_ONLY_GROUPS"]	= "Should Prop Menu can only be accessed by certain groups e.g. Donator?"
LANG["PCR_PLUG_NOTIFYMSG"]		= "Notify player on how to use Prop Menu on every round start"

LANG["PCR_EDITOR_MSG_ERROR"]	= "Your changes hasn't been saved due to Errors.\nPlease check on your server console!"
LANG["PCR_EDITOR_MSG_SUCC"]		= "Your changes and Custom Prop data has has been saved and updated successfully."

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
LANG["PHXM_ADMIN_FORCESPECTOPLAY"]		= "Force spectators to play by including them when balancing teams" --ph_forcespectatorstoplay
LANG["PHXM_ADMIN_NO_H_CONSECUTIVE"]		= "Prevent players from being a Hunter twice in a row (only works in shuffle mode)" --ph_preventconsecutivehunting
LANG["PHXM_ADMIN_HUNTER_COUNT"] 		= "Hunter count (0 = automatic)" --ph_huntercount
LANG["PHXM_ADMIN_ROTATETEAM"] 			= "Disable shuffle mode and rotate players instead" --ph_rotateteams
LANG["PHXM_ADMIN_RESET_ROTTEAM"] 		= "Reset rotations" --ResetRotateTeams
LANG["PHXM_ADMIN_RESET_ROTTEAM_WARN"]	= "Restart rotations from the beginning (in case you've started them, stopped, then started again and the current rotation does not satisfy you):" --ResetRotateTeams_warning
LANG["PHXM_ADMIN_RESET_MSG"]			= "Rotation Team has been Reset!"
LANG["PHXM_ADMIN_FORCEH2P_WARN"]		= "Force a Hunter to be a Prop next time (only works in shuffle mode):" --ForceHunterAsProp_warning
LANG["PHXM_ADMIN_FORCEH2P_RANDONLY"]	= "This action is only available in shuffle mode." --ForceHunterAsProp_randomonly

LANG["FORCEH2P_WILL_BE"]				= "%s will be a Prop next round."
LANG["FORCEH2P_IS_CANCELED"]			= "%s won't be a Prop next round."
LANG["FORCEH2P_IS_RESET"]				= "All Hunters won't be Forced as a Prop next round."
LANG["FORCEH2P_PLAYER_NOT_FOUND"]		= "Selected player was not found, probably they were disconnected."
LANG["PHX_ROTATE_TEAM_RESET"]			= "Rotation Team Offset has been reset."

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

-- Revision 14/09/2022
LANG["PHXM_MV_CHANGEMAP_NOPLAYER"]	= "Force change the map after there are no players in the server?"

PHX.LANGUAGES[LANG.code] = LANG