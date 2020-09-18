-- Kindly free to improve the language.

-- Originally written by: Major Nick

local LANG = {}

LANG.code = "de"

LANG.Name 		 	= "Deutsch" -- example: "Bahasa Indonesia"
LANG.NameEnglish	= "German" -- Your Language but spoken in English, example: "Indonesian"
LANG.Author			= "Major Nick" -- Only accept STRINGS.
-- Can Accept: String, and Table.
LANG.AuthorURL		= {"http://steamcommunity.com/profiles/76561198208927047"}

-- Special Section that isn't String-based
LANG.SUICIDEMSG = { --> de.SuizidMSG
	"hat sich selbst umgebracht!", -- i believe this was from 9gag joke.
	"ist auf mysteriöser Weise Gestorben.",
	"ist an magie gestorben.",
	"hat sich selbst No scoped.", 
	"hate einen Wutanfall.",
	"ist Betrunken.",
	"ist gestorben... mehr glück beim nächsten mal!",
	"hat sich Selbst geschlagen.",
	"ist über einen stock gestolpert.",
	"ist an der macht gestorben.",
	"ragdolled.", 
}

LANG.RANDOM_SPECTATORS = { --> de.Zufällige_Zuschauer
	"um zuzuschauen und sich zu entspannen .",
	"um sie am herumhämgen zu sehen.",
	"um die dinge zu sehen.",
	" ",
}

-- List of string-based translation

-- // FRETTA SECTION \\
--  FRETTA: Kill text (X killed Y)
LANG["HUD_KILLED"]				= "getötet"

-- FRETTA: HUDs
LANG["HUD_TIME"] 				= "Zeit"
LANG["HUD_ROUND"]				= "Runde"
LANG["HUD_WAITPLY"]			= "Es Wird auf Spieler Gewartet..."
LANG["HUD_DEAD"]					= "(Tot) "

LANG["HUD-HUD_TEAMWIN"]		= "%s gewinnen!"
LANG["HUD_LOSE"]			= "UnendShieden, jeder Verliert!"
LANG["MISC_TIMELEFT"]			= "Übrige Zeit: %s"
LANG["MISC_GAMEEND"] 		= "Das Spiel wird nach diser runde enden"

-- FRETTA: Team selection screen (F2)
LANG["DERMA_TEAMSELECT"]		= "Wähle dein Team"

-- FRETTA: F1 screeen
LANG["DERMA_RTV"] 				= "Stimme Für Änderung (RTV)"
LANG["DERMA_PHMENU"] 			= "Prop Hunt Menu"
LANG["DERMA_CHANGETEAM"]		= "Wechsele Team"

-- FRETTA: Scoreboard
LANG["DERMA_PLAYER"]			= "(%d Spieler)"	
LANG["DERMA_PLAYERS"]			= "(%d Spieler)"
LANG["DERMA_NAME"]				= "Name"
LANG["DERMA_KILLS"]			= "Getötet"
LANG["DERMA_DEATHS"]			= "Gestorben"
LANG["DERMA_PING"]				= "Ping"

LANG["CHAT_JOINED"]		= " ist beigetreten "
LANG["CHAT_JOINEDTHE"]	= " Ist dem Beigetreten "

LANG["CHAT_SWAPBALANCE"]		= "%s ist zu %s gewechselt für Team Balance."
LANG["CHAT_SWAPBALANCEYOU"]		= "Du Wurdest Gewechselt um perfecte Balance zu ereichen ." -- Smile... for even in death, you have become children of Thanos
-- // END OF FRETTA SECTION \\

LANG["HELP_F1"] 				= [[Ein Prop Hunt (Codename) X Projekt.

Ein Projekt um Prophunt X modern Und Anpassbar zu machen.

Mehr Informationen können Unter diesem Link gefunden werden:
https://www.wolvindra.net/prophuntx

Um mehr Infos und Guides zu finden Drücken sie die [F1] Taste und Clicken dan den [Prop Hunt Menu] Knopf.

Version: ]].. PHX.VERSION ..[[ Revision: ]].. PHX.REVISION ..[[

Viel Spaß!]]

-- Important!
LANG["LANGUAGE_CHANGED"]		= "Beforzugte sprache geändert zu %s"

-- internal cl_menutypes section.
LANG["SUBTYPE_PREFERED_LANG"]	= "Beforzugte sprache"
--LANG["SUBTYPE_TEXTENTRY_?"]	= "???"

-- Events
LANG["EV_PLAYER_CONNECT"]		= "%s hat sich mit dem Server verbunden."
LANG["EV_PLAYER_JOINED"]		= "%s ist dem Server Beigetreten."
LANG["EV_PLAYER_DISCONNECT"]			= "%s hat die Verbindung zum Server getrennt (Grund: %s)"

-- HUD elements
LANG["HUD_HP"]					= "Gesundheit"
LANG["HUD_AMMO"] 				= "AMMO"	-- obsolete
LANG["HUD_MAGSEC"]				= "MAG. / SEC." --Magazine Counts (separator) Secondary Magazine Counts

-- !!WEAPON NAMES CANNOT BE TRANSLATED, THEY USE FROM language.GetPhrase THEREFORE IT'S IMPOSSIBLE TO DO.

LANG["TEAM_PROPS"]			= "Requisiten"
LANG["TEAM_HUNTERS"]				= "Jäger"

LANG["HUD_ROTLOCK"]			= "Requisiten Rotation: Gesperrt"
LANG["HUD_ROTFREE"]				= "Requisiten Rotation: Frei"
LANG["HUD_KILLEDBY"]			= "Du wurdest Getötet von %s"

LANG["HUD_AUTOTAUNT"]			= "Auto Verspottung in %d Sekunde (en)"
LANG["HUD_AUTOTAUNT_ALT"]		= "Auto Verspottung in %d"

LANG["HUD_TargetID"]				= "Spieler: %s (%d%%)" -- Player: <NAME> (<HEALTH>%)

LANG["HUD_BLINDED"]			= "Jäger werden In %s Freigelassen"
LANG["HUD_UNBLINDED"]			= "Bereit oder nicht, Wir kommen!"

LANG["BLIND_RESPAWN_TEAM"]		= "Du wurdest Respawnded Nur in %s team mit %d Sekunden Während Geblendeter zeit."
LANG["BLIND_RESPAWN"]			= "Du wurdest Respawnend inerhalb %d Sekunden Während Geblenderter zeit."

LANG["MISC_ACCEPT"]				= "Akzeptieren"
LANG["MISC_OK"]					= "OK"
LANG["MISC_CLOSE"]			= "Schließen"
LANG["MISC_PREV"]			= "< Vorheriges"
LANG["MISC_NEXT"]			= "Nächstes >"
LANG["MISC_ACCESSDENIED"]	= "Zugang Verweigert"

-- Chat messages
LANG["CHAT_NOPLAYERS"]		= "Es gibt nicht genügend Spieler um das Spiel zu starten!"
LANG["CHAT_SWAP"]			= "Teams Wurden Gewechselt!"

LANG["CHAT_SWAPTEAM_WARNING"] = "Du hast Teams gewechselt %dx (%dx MAX). Danach kannst du nicht mehr zum gegnerishem Team wechseln."
LANG["CHAT_SWAPTEAM_REVERT"]= "Konnte nicht zum %s Team wechseln weil du deinen nummer von Teamwechseln aufgebraucht hast."

LANG["CHAT_PROP_NO_ROOM"] = "Zu wenig Platz um zu diser Requisite zu wechseln!"

-- Notification
LANG["NOTIFY_IN_PROP_TEAM"]		= "Du bist in einem Requisiten Team Mit rotations unterstützung! Du kannst mit der Maus Deine Requisite Rotieren."
LANG["NOTIFY_ROTATE_NOTICE"]	= "Zusätzlich kannst du noch die rotation stoppen mit (ursprünglich) [R]!"

-- Custom Taunt Window
LANG["TM_WARNING_CT_DISABLE"]	= "[PHX - Verspottung] Warnung: Dieser Server Hat Cusotm Taunts Deaktiviert."
LANG["TM_NO_TAUNTS"]	= "Warnung: Keine Verspottung wurde in diser kategorie gefunden."
LANG["TM_PLAY_ONLY_ALIVE"] 	= "Du darfst nur Custom Taunts Aktiviren Wenn du am Leben bist."

LANG["TM_WINDOW_TITLE"]		= "Prop Hunt Custom Taunt Fenster"
LANG["TM_NOTICE_PLSWAIT"]		= "Bitte Warte %s Sekunde(en)!"
LANG["TM_NOTICE_PLAYPREVIEW"]	= "Verspottung Vorschau: %s"

LANG["TM_TOOLTIP_PLAYTAUNT"] 	= "Starte Verspottung"
LANG["TM_TOOLTIP_PREVIEW"]		= "Vorshau Verspottung"
LANG["TM_TOOLTIP_PLAYCLOSE"]	= "Starte Verspottung und Schließe"
LANG["TM_TOOLTIP_PLAYRANDOM"]	= "Starte Zufällige Verspottung"
LANG["TM_TOOLTIP_CLOSE"]		= "Schließen"
LANG["TM_MENU_CLOSE"]			= "Schließe Menu"

LANG["TM_DELAYTAUNT_NOT_EXIST"] = "Die ausgewählte verspottung gibt es nicht in diesem Server!"
LANG["TM_DELAYTAUNT_PLSWAIT"]	= "Bitte warten sie %s Sekunde(en)!"

--[[
	PHX Menu window
]]
LANG["PHXM_WINDOW_TITLE"]		= "Prop Hunt X - Erweiterte Einstellungen & Menu"
LANG["SERVER_INFO_MOTD"]		= "SERVER INFORMATIONEN & REGELN [MOTD]"

LANG["PHXM_TAB_HELP"]			= "Hilfe & Guides"
LANG["PHXM_TAB_MUTE"]			= "Spieler Stumm/Nicht Stumm Stimme"
LANG["PHXM_TAB_PLAYER"]			= "Spieler Einstellungen"
LANG["PHXM_TAB_MODEL"] 			= "Spieler Model Suchmachine"
LANG["PHXM_TAB_MODEL_DISABLED"]	= "Spieler Model Suchmachine (Deaktiviert)"
LANG["PHXM_TAB_ADMIN"]			= "Admin Einstellungen"
LANG["PHXM_TAB_ABOUT"]			= "Über Prop Hunt X"
LANG["PHXM_TAB_MAPVOTE"]		= "Karte Bestimmungs Einstellungen"

LANG["PHXM_CVAR_CHANGED"]		= "[Einstellungen] CVar %q Wurde geändert zu %q"

--[[
	Player Mute Settings
]]
LANG["PHXM_MUTE_SELECT"]		= "Whälen sie den Spieler aus den Sie Stummshalten wollen."

--[[ 
	Player Settings
]]
LANG["PHXM_PLAYER_OPTIONS"]		= "Spieler Optionen"
LANG["PHXM_PLAYER_LANG"]		= "Sprachen"
LANG["PHXM_PLAYER_BIND"]		= "Binds"
LANG["PHXM_PLAYER_HUDSETTINGS"]	= "HUD Einstellungen"

LANG["PHXM_PLAYER_TAUNT_KEY"]			= "Zufällige Verspottungs Taste"
LANG["PHXM_PLAYER_TAUNTWINDOW_KEY"]		= "Verspottungs Menu Taste"
LANG["PHXM_PLAYER_ROTATLOCK_KEY"]		= "Rotations Stop Taste"

LANG["PHXM_PLAYER_TOGGLE_HALOS"]		= "Umschalten von dem Heiligem Schein Effect beim auswählen einer requisite"
LANG["PHXM_PLAYER_IDNAMES"]				= "Zeige Team Spieler Namen Stadessen über ihrem Kopf an (Erscheint auch durch wände)"
LANG["PHXM_PLAYER_ENDROUND_CUE"]		= "Spiele Ende Der Rounde Sound cue"
LANG["PHXM_PLAYER_TAUNTMENU_AUTOCLOSE"]	= "Option dafür das wenn man das neue Verspottungs Fenster Doppelt clickt Es Sich Schließt"
LANG["PHXM_PLAYER_SEE_HUNTER_LINE"]		= "Zeichne eine linie auf Jägern sodass man ihr Zielen Als Beobachter Sehen kann."
LANG["PHXM_PLAYER_SEE_LBALL_ICONS"]		= "Aktiviere das 'Lucky ball' Icon Sobald er erschienen ist "
LANG["PHXM_PLAYER_SEE_CRYSTAL_ICONS"]	= "Aktiviere 'Devil ball' Icon Sobald er erschienen ist "

LANG["PHXM_PLAYER_USE_NEW_HUD"]			= "Benutze Neue PH: Verbessertes HUD"
LANG["PHXM_PLAYER_SHOW_TUTOR"]			= "Zeige Tutorial Pop ups? (Wird Nur 2x Auf jeder Requisitem Spawn Angezeigt)"
LANG["PHXM_PLAYER_USE_NEW_CROSSHAIR"]	= "Aktiviere Benutzerdefiniert Fadenkreuz"
LANG["PHXM_PLAYER_SHOW_TEAM_TOPBAR"]	= "Zeige Totale anzahl von lebenden Teammitgliedern (Mindestens 4 Spieler Werden Gezeigt)"

--[[
	Player model Browser Section
]]
LANG["QUERY_MODEL_SELECTED"]	= "Model %s Wurde ausgewhält und wird nach respawn angewendet!"
LANG["QUERY_MODEL_INFO"]		= "Model name: %s - Verfügbar für: Alle!"

LANG["MDL_MENU_REFRESH"] 		= "Lade Icon neu"
LANG["MDL_MENU_PREVIEW"] 		= "Vorschau von Model"
LANG["MDL_MENU_MODELINFO"] 		= "Model Informationen"


LANG["MISC_APPLYMDL"] 			= "Wende Model an"

LANG["PHXM_MODEL_DISABLED"] 	= "Entschuldigung, Benutzerdefinierte Models Sind auf diesem Server nicht Aktiviert!"
LANG["PHXM_PLAYERMODEL_SETFOV"]	= "Setze Model FOV"

--[[
	Server Settings
]]
LANG["PHXM_ADMIN_OPTIONS"]		= "Serverseitenwise Spielmodus Optionen (Nur für  Admins/Owner sehbar)"
LANG["PHXM_ADMIN_MUSTALIVE"]	= "Du Must in dem Lebendem team sein um dies zu machen."

--[[
	Language Override
]]
LANG["PHXM_ADMIN_LANGOVERRIDE"]	= "Sprachen Überschreibung"

LANG["PHXM_ADMIN_FORCELANG"] 				= "Benutze Gezwungene Sprache? Dies wird Den Client Ünerschreiben und die Server Sprache verwenden."
LANG["PHXM_ADMIN_LANGTOUSE"]				= "Gezwungene Sprache benutzen."
LANG["PHXM_ADMIN_PLAYERDEFAULTLANG"] 		= "Standard Sprache Wenn jemand dem server zum ersten mal betritt."

-- Gameplay settings
LANG["PHXM_ADMIN_CUSTOM_MODEL"]				= "Aktivire Benutzerdefinierte Modele für Jäger"
LANG["PHXM_ADMIN_CUSTOM_MODEL_PROP"]		= "Aktiviere Benutzerdefinierte Modele für requisiten - Stelle sicher das Sie auch für Jäger aktiviert sind."
LANG["PHXM_ADMIN_TAUNT_DELAY_CUSTOM"]		= "Benutzerindifiziertr Verspottungen Verzögerung (Sekunden)"
LANG["PHXM_ADMIN_TAUNT_DELAY_RANDOM"]		= "Normale Verspottungen Vezögerung (Sekunden)"
LANG["PHXM_ADMIN_TAUNT_DELAY_AUTO"]			= "Automatishe Verspottungen Verzögerung (Sekunden)"
LANG["PHXM_ADMIN_AUTOTAUNT_ENABLE"]			= "Aktiviere automatishe Verspottungs funktion"

LANG["PHXM_ADMIN_NOTICE_ROTATION"]			= "Zeige 'Requisiten rotation' notifactionen auf jedem Requisitem Spawn"
LANG["PHXM_ADMIN_CAMERA_COLLIDE"]			= "Enable Prop Camera collision to the wall"
LANG["PHXM_ADMIN_FREEZECAM"]				= "Schalte Gefrorene Camera für team Requisiten an"
LANG["PHXM_ADMIN_PROP_COLLIDE"]				= "Schalte Collision Unter Team requisiten an"
LANG["PHXM_ADMIN_SWAP_TEAM"] 				= "Jede Runde Teamwechsel -Dies zu Deaktivieren heißt das Die Teams immer Diselben bleiben."
LANG["PHXM_ADMIN_HUNTER_PENALTY"]			= "Jäger Lebens Bestrafung"
LANG["PHXM_ADMIN_HUNTER_KILL_BONUS"]		= "Jäger Tötungs Bonus"
LANG["PHXM_ADMIN_HUNTER_SMG_GRENADES"]		= "Jäger SMG Granaten"
LANG["PHXM_ADMIN_GAME_TIME"]				= "Spielzeit (Minuten)"
LANG["PHXM_ADMIN_BLINDLOCK_TIME"]			= "Jäger Blindenzeit (Sekunden)"
LANG["PHXM_ADMIN_ROUND_TIME"]				= "Rounden Zeit (Sekunden)"
LANG["PHXM_ADMIN_ROUNDS_PER_MAP"]			= "Rounden gespielt per Karte"
LANG["PHXM_ADMIN_ENABLE_LUCKYBALL"]			= "Erlaube Das 'lucky balls' auf Zerbrechbaren Requisiten Spawnen können (Chance ist 8%)"
LANG["PHXM_ADMIN_ENABLE_CRYSTAL"]			= "Erlabue das 'Devil Balls' Gespawnt werden können wenn ein Jäger stirbt (Chance is 70%)"
LANG["PHXM_ADMIN_WAIT_PLAYERS"]				= "Warte auf Spieler um das Spiel zu beginnen"
LANG["PHXM_ADMIN_WAIT_MIN_PLAYERS"]			= "Minimunvon Spielern befor das spiel startet (Standard: 1)"
LANG["PHXM_ENABLE_PLAYER_JOIN_LEAVE"] 		= "Aktivire Chat notifkationen für Spieler die Das Spiel Verlassen Und beitreten? Setze dies zu 0 Wenn du lieber dein eigenes Chat addon haben willst."

LANG["PHXM_ADMIN_FORCEJOINBALANCE"]			= "Zwingt Spieler Die Teams Auszugleichen Wenn sie dem Server beitreten"
LANG["PHXM_ADMIN_ENABLETEAMBALANCE"]		= "Gleicht die teams Automatisch am anfang der runde aus (Team Balance)"
LANG["PHXM_ADMIN_PICKUP_PROPS"] 			= "Aufheben von kleinen requisiten erlauben? 0: Nicht Erlauben, 1: Nur Jäger, 2: Nur requisiten, 3: Alle."

LANG["PHXM_ADMIN_TAUNTMODES"]			= "Verspottungs Moduse"
LANG["PHXM_ADMIN_TAUNTMODE_MODE"]		= "--[Derzeitiger Verspottungs Modus ist: %d ]--"
LANG["PHXM_ADMIN_TAUNTMODE0"]			= "Modus [0]: F3/zufällige Verspottung"
LANG["PHXM_ADMIN_TAUNTMODE1"]			= "Modus [1]: C/Benutzerdefinierte Verspottung"
LANG["PHXM_ADMIN_TAUNTMODE2"]			= "Modus [2]: Beide moduse"
LANG["PHXM_ADMIN_TAUNTSOPEN"]			= "Öffne Verspottungs Fenster"

LANG["PHXM_MODE_DEFAULT"] 				= "--[ Aufhebungs Modus ist so eingestellt: %d ]--"
LANG["PHXM_MODE0"]						= "Mode [0]: Nicht erlauben"
LANG["PHXM_MODE1"]						= "Mode [1]: Nur Jäger"
LANG["PHXM_MODE2"]						= "Mode [2]: Nur requisiten"
LANG["PHXM_MODE3"]						= "Mode [3]: Aufheben erlaubt"

--[[
	Admin Developer Sections
]]
LANG["PHXM_ADMIN_DEVSECTION"]		= "Entwickler Optionen/Experimentelle Features"
LANG["PHXM_ADMIN_ROOMCHECK"]		= "Grenzen Check Aktiviren? Dies verhindert das du in Objekten ider Wänden Steckenbleibst."
LANG["PHXM_ADMIN_USENEWMKBREN"]		= "Bentze das nue model für die Bren MK II bonus waffe? (Erfordert Neustart der Karte)"
LANG["PHXM_ADMIN_BEVERBOSE"]		= "Entwickler: Sei Ausführlich - Ak PH:X Alle informationen und events Ausfürhlich drucken?"
LANG["PHXM_ADMIN_SHOWPLNAMEHEAD"]	= "Aktivire das team namen auf dem bildschirm erscheinen."
LANG["PHXM_ADMIN_USESINGLE_FZCAM"]	= "Benutze einen einziges Freezecam geräusch Anstatt von der liste (Nutze 'ph_fc_cue_path' Um das Geräusch zu bestimmen)"
LANG["PHXM_ADMIN_MODELLISTINGTYPE"] = "Benutze Verebrte Model Liste : 0 = Alle Spielermodele (FügeValidesModellhinzu), 1 = Benutze Erbe: Liste.hole('SpielerOptionsModel')"
LANG["PHXM_ADMIN_JUMPPOWER"]		= "Additional Jump Power multiplier for Props"
LANG["PHXM_ADMIN_ENABLE_OBB"]		= "Developer: Enable Customized Prop Entities Model Boundaries (OBB) Modifier from config data"
LANG["PHXM_ADMIN_RELOAD_OBB"]		= "Developer: Reload OBB Modifier data every round restarts"

--[[
	Experimental & PH:X Features
]]
LANG["PHXM_ADMIN_EXPERIMENTALPHX"]			= "Neue PHX Experimentale Eigenschaften"

LANG["PHXM_ADMIN_HLA_COMBINE"]				= "Füge HAL Combine Model Unterstützung hinzu"
LANG["PHXM_ADMIN_TEAMBALANCE"]				= "Aktivire Team Ausgleichungs Funktion"
LANG["PHXM_ADMIN_CHANGETEAM_LIMIT"]			= "Benutze Team Wechsel . Setze zu -1 Zum Deaktiviren. "
LANG["PHXM_ADMIN_USENEWCHAT"]				= "Benutze Neue Chat Box (eChat) -Dies ist eine Temprärer Placeholder. Wenn Du schon einen hast, Mach hier kein Kreuz."
LANG["PHXM_ADMIN_NEWCHATPOS"]				= "Neue Chat Box positzion: Substrahiere Höhe (Y) Posizion Um N pixel."
LANG["PHXM_ADMIN_RESPAWNONBLIND"]			= "Erlaube Respawn In Blinder Zeit"
LANG["PHXM_ADMIN_RESPAWNONBLIND_TEAM"]		= "Erlaube Respawn Nur für ein team in der Blinden Zeit: 0: Alle, 1: Jäger, 2: Props"
LANG["PHXM_ADMIN_REWSPANTIMEPERCENT"]		= "Prozentzahl von Bilnder Zeit die einem Erlaubt Zu Respawnen. Standard ist 0.75 (Heißt 75% * Max Blinden Zeit)"
LANG["PHXM_ADMIN_ALLOWRESPAWN_SPECTATOR"]	= "Erlaube Respawn in Blinder Zeit Wenn man Den zushaern beitritt"
LANG["PHXM_ADMIN_ALLOWRESPAWN_TEAMCHANGE"]	= "Erlaube Respawn Beim Teamwechsel (Dies zu Aktiviren ist nicht empfohlen)"

--[[
	MapVote Settings
]]
LANG["PHXM_MV_SETTINGS"]			= "KartenAbstimmung Einstellungen"

LANG["PHXM_MV_ALLOWCURMAP"]			= "Erlaube für Die Derzeitige Karte zu stimmen"
LANG["PHXM_MV_COOLDOWN"]			= "Aktiviere Karten Cooldown Fürs Abstimmen"
LANG["PHXM_MV_USE_ULX_VOTEMAPS"]	= "Benutze Karten Listung Von ULX? Wenn Nicht dann Standardmaps/*/*.bsp wird benutzt."
LANG["PHXM_MV_MAPLIMIT"]			= "Anzahl von Karten Die Beim Abstimmen Angezeigt werden."
LANG["PHXM_MV_TIMELIMIT"]			= "Zeit in Sekunden Während Der Karten Abstimmung."
LANG["PHXM_MV_MAPBEFOREREVOTE"]		= "Karten Änderung Muss Passieren befor eine Karte wider auftaucht"
LANG["PHXM_MV_RTVCOUNT"]			= "Wie Viele Spiler Müssen RTV stimmen um es zu aktivieren (Rock the Vote)"

LANG["PHXM_MV_EXPLANATION1"]		= "Um Einzustellen welche Karte Aufgelistet werden soll, benutze (Z.b.) [ mv_mapprefix 'ph_,cs_,de_' ] in der console."
LANG["PHXM_MV_EXPLANATION2"]		= "wenn du ULX Benutzt, Benutze Karten abstimmung. Wenn nicht, use mv_start."
LANG["PHXM_MV_EXPLANATION3"]		= "KartenAbstimmung Aktion (Um abzubrechen, Schreibe !unmap_vote (ULX) oder mv_stop In der Console.)"

LANG["PHXM_MV_START"]		= "Starte KartenAbstimmung"
LANG["PHXM_MV_STOP"]		= "Stoppe KartenAbstimmung"
--                  			  ^YOU VIOLATED THE LAW!


--[[ 
	Versioning, Credits or About section
]]
LANG["PHXM_ABOUT_VERSIONING"]		= "Version: %s - Revision: %s"
LANG["PHXM_ABOUT_AUTHOR"]			= "Von: %s"
LANG["PHXM_ABOUT_ENJOYING"]			= "Wenn Dir Das Spiel Gefällt, Denke Übers Spenden nach!"
LANG["PHXM_ABOUT_UPDATE"]			= "Prop Hunt X Updates"
LANG["PHXM_ABOUT_LINKS"]			= "Links und credits"
LANG["PHXM_ABOUT_THANKS"]			= "Spezielles Danke für Den Unterschtüzung, Vorschläge & Mitarbeit:\n %s"
LANG["PHXM_ABOUT_BTN_DONATE"]		= "Unterschtüze PH:X by donating"
LANG["PHXM_ABOUT_BTN_HOME"]			= "PHX Homepage"
LANG["PHXM_ABOUT_BTN_GITHUB"]		= "PHX GitHub Repository"
LANG["PHXM_ABOUT_BTN_PLUGINS"]		= "PHX Addons/Plugins"
LANG["PHXM_ABOUT_BTN_CHANGELOGS"]	= "PHX Changelogs"

--[[
	Late Additionals
]]
-- fretta
LANG["HUD_SPECTATING"]	= "SPECTATING"
LANG["HUD_YOUDIED"]		= "You Died!"

LANG["CHAT_STARTING_MAPVOTE"] = "Runde ist Zu Ende. Starte Karten Abstimmung..."

-- This used for HUD Taunt Timer
LANG["HUD_PROP_TAUNT_TIME"]	= "Zufälliger Taunt"
LANG["HUD_PROP_CTAUNT_TIME"] = "Cust. Taunt"

LANG["PHXM_TAB_PLUGINS"]				= "Addons & Plugins"

-- Plugins Section
LANG["PLUGINS_NO_PLUGINS"]				= "Keine Plugins Instaliert. Suche nach mehr Plugins Hier!"
LANG["PLUGINS_BROWSE_MORE"]				= "Suche nach mehr Plugins Hier"
LANG["PLUGINS_SERVER_HAS_NO_PLUGINS"]	= "Sorry, Dieser Server hat keine Addons/Plugins Instaliert."
LANG["PLUGINS_SERVER_SETTINGS"]			= "-- Server Settings --"
LANG["PLUGINS_CLIENT_SETTINGS"]			= "-- Client Settings --"

-- Text Entries
LANG["TEXTENTRY_FZ_SINGLE"] = "Gefrorene Camera Audio Pfad" -- this one is for ph_fc_cue_path command
LANG["TEXTENTRY_MV_PREFIX"] = "Karten Abstimmung Vorwahl"			 -- the map previx for mv_mapprefix

-- Add to Language Table.
PHX.LANGUAGES[LANG.code] = LANG