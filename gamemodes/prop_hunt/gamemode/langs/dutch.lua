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
LANG.SUICIDEMSG = { --> FRETTA
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

LANG["CHAT_JOINED"]				= " toegetreden "
LANG["CHAT_JOINEDTHE"]			= " is toegetreden tot "

LANG["CHAT_SWAPBALANCE"]		= "%s is veranderd naar %s voor gebalabceerde teams."
LANG["CHAT_SWAPBALANCEYOU"]		= "Je bent van team gewisseld voor perfecte balans :)" -- Smile... for even in death, you have become children of Thanos
-- // END OF FRETTA SECTION \\

LANG["HELP_F1"] 				= [[A Prop Hunt (Codename) X Project.

Een project om Prop Hunt X moder en aanpasbaar te maken.

Meer informatie kan hier gevonden worden:
https://www.wolvindra.net/prophuntx

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

LANG["TEAM_PROPS"]				= "Props"
LANG["TEAM_Zoekers"]			= "Zoekers"

LANG["HUD_ROTLOCK"]				= "Prop Rotatie: Gesloten"
LANG["HUD_ROTFREE"]				= "Prop Rotatie: Vrij"
LANG["HUD_KILLEDBY"]			= "Je bent vermoord door %s"

LANG["HUD_AUTOTAUNT"]			= "Automatisch taunt vertonen in %d seconden"
LANG["HUD_AUTOTAUNT_ALT"]		= "Automatisch taunt vertonen in %d"

LANG["HUD_TargetID"]			= "Gebruiker: %s (%d%%)" -- Player: <NAME> (<HEALTH>%)

LANG["HUD_BLINDED"]				= "de Zoekers zullen gaan zoeken in %s"
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
LANG["TM_NOTICE_PLSWAIT"]		= "Wacht alsjeblieft %s seconden!"
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
LANG["PHXM_ADMIN_MODELLISTINGTYPE"] = "Gebruik Legacy Modelen Lijst: 0 = Alle Playermodels (AddValidModel), 1 = Gebruik Legacy: list.Get ('PlayerOptionsModel')"
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

LANG["PHXM_MV_EXPLANATION1"]		= "Om op te zetten welke map gebruikt zou moeten worden, gebruik (bijvoorbeeld) [ mv_mapprefix 'ph_,cs_,de_' ] in de console."
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

-- Text Entries
LANG["TEXTENTRY_FZ_SINGLE"] = "Freeze Cam Single Sound Path" -- this one is for ph_fc_cue_path command
LANG["TEXTENTRY_MV_PREFIX"] = "Map Stemming Prefix"			 -- the map previx for mv_mapprefix

-- Add to Language Table.
PHX.LANGUAGES[LANG.code] = LANG