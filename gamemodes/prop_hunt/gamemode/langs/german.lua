-- Kindly free to improve the language.

-- Originally written by: Major Nick

local L={}

L.code = "de"

L.Name 		 	= "Deutsch" -- example: "Bahasa Indonesia"
L.NameEnglish	= "German" -- Your Language but spoken in English, example: "Indonesian"
L.Author			= "Major Nick" -- Only accept STRINGS.
-- Can Accept: String, and Table.
L.AuthorURL		= {"http://steamcommunity.com/profiles/76561198208927047"}

-- Special Section that isn't String-based
L.SUICIDEMSG = {  -- Fix me: there was addition text here but feel free to add more.
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

L.RANDOM_SPECTATORS = { --> de.Zufällige_Zuschauer
	"um zuzuschauen und sich zu entspannen .",
	"um sie am herumhämgen zu sehen.",
	"um die dinge zu sehen.",
	" ",
}

L["PHX_TEAM_CONNECTING"] = "Verbinden"
L["PHX_TEAM_PROPS"]		= "Requisiten"
L["PHX_TEAM_HUNTERS"] 	= "Jäger"
L["PHX_TEAM_UNASSIGNED"]	= "Nicht zugewiesen"	--Fix Me
L["PHX_TEAM_SPECTATOR"] 	= "Zuschauer"	--FIx Me

-- List of string-based translation

-- // FRETTA SECTION \\
--  FRETTA: Kill text (X killed Y)
L["HUD_KILLED"]				= "getötet"

-- FRETTA: HUDs
L["HUD_TIME"] 				= "Zeit"
L["HUD_ROUND"]				= "Runde"
L["HUD_WAITPLY"]			= "Es Wird auf Spieler Gewartet..."
L["HUD_DEAD"]					= "(Tot) "

L["HUD-HUD_TEAMWIN"]		= "%s gewinnen!"
L["HUD_LOSE"]			= "UnendShieden, jeder Verliert!"
L["MISC_TIMELEFT"]			= "Übrige Zeit: %s"
L["MISC_GAMEEND"] 		= "Das Spiel wird nach diser runde enden"

-- FRETTA: Team selection screen (F2)
L["DERMA_TEAMSELECT"]		= "Wähle dein Team"

-- FRETTA: F1 screeen
L["DERMA_RTV"] 				= "Stimme Für Änderung (RTV)"
L["DERMA_PHMENU"] 			= "Prop Hunt Menu"
L["DERMA_CHANGETEAM"]		= "Wechsele Team"

-- FRETTA: Scoreboard
L["DERMA_PLAYER"]			= "(%d Spieler)"	
L["DERMA_PLAYERS"]			= "(%d Spieler)"
L["DERMA_NAME"]				= "Name"
L["DERMA_KILLS"]				= "Getötet"
L["DERMA_DEATHS"]			= "Gestorben"
L["DERMA_PING"]				= "Ping"
L["DERMA_SERVER_TAG"]		= "SV" --Fix Me
L["DERMA_BOT_TAG"]			= "BOT" -- Fix Me
L["DERMA_GAMEMODE_CREDITS"]	= "%s | Version: %s - Rev. %s" -- Fix Me

L["CHAT_JOINED"]		= " ist beigetreten "
L["CHAT_JOINEDTHE"]	= " Ist dem Beigetreten "

L["CHAT_SWAPBALANCE"]		= "%s ist zu %s gewechselt für Team Balance."
L["CHAT_SWAPBALANCEYOU"]		= "Du Wurdest Gewechselt um perfecte Balance zu ereichen ." -- Smile... for even in death, you have become children of Thanos

-- FRETTA: Splash Starting Screen
L["SPASHSCREEN_BY_X"]		= "by %s"	--Fix Me
-- RichTextBox
L["HELP_DONATORS_AND_CONTRIBUTORS"]  = "\n\nDonators & Contributors:\n- %s" --Fix Me
-- // END OF FRETTA SECTION \\

L["HELP_F1"] 				= [[Ein Prop Hunt (Codename) X Projekt.

Ein Projekt um Prophunt X modern Und Anpassbar zu machen.

Mehr Informationen können Unter diesem Link gefunden werden:
https://www.wolvindra.net/prophuntx

Um mehr Infos und Guides zu finden Drücken sie die [F1] Taste und Clicken dan den [Prop Hunt Menu] Knopf.

Version: ]].. PHX.VERSION ..[[ Revision: ]].. PHX.REVISION ..[[

Viel Spaß!]]

-- Important!
L["LANGUAGE_CHANGED"]		= "Beforzugte sprache geändert zu %s"

-- internal cl_menutypes section.
L["SUBTYPE_PREFERED_LANG"]	= "Beforzugte sprache"
--L["SUBTYPE_TEXTENTRY_?"]	= "???"

-- Events
L["EV_PLAYER_CONNECT"]		= "%s hat sich mit dem Server verbunden."
L["EV_PLAYER_JOINED"]		= "%s ist dem Server Beigetreten."
L["EV_PLAYER_DISCONNECT"]			= "%s hat die Verbindung zum Server getrennt (Grund: %s)"

-- HUD elements
L["HUD_HP"]					= "Gesundheit"
L["HUD_AMMO"] 				= "AMMO"	-- obsolete
L["HUD_MAGSEC"]				= "MAG. / SEC." --Magazine Counts (separator) Secondary Magazine Counts

-- !!WEAPON NAMES CANNOT BE TRANSLATED, THEY USE FROM language.GetPhrase THEREFORE IT'S IMPOSSIBLE TO DO.

L["TEAM_PROPS"]				= L["PHX_TEAM_PROPS"]
L["TEAM_HUNTERS"]			= L["PHX_TEAM_HUNTERS"]

L["HUD_ROTLOCK"]			= "Requisiten Rotation: Gesperrt"
L["HUD_ROTFREE"]				= "Requisiten Rotation: Frei"
L["HUD_KILLEDBY"]			= "Du wurdest Getötet von %s"

L["HUD_AUTOTAUNT"]			= "Auto Verspottung in %d Sekunde (en)"
L["HUD_AUTOTAUNT_ALT"]		= "Auto Verspottung in %d"

L["HUD_TargetID"]				= "Spieler: %s (%d%%)" -- Player: <NAME> (<HEALTH>%)

L["HUD_BLINDED"]			= "%s werden In %s Freigelassen"
L["HUD_UNBLINDED"]			= "Bereit oder nicht, Wir kommen!"

L["BLIND_RESPAWN_TEAM"]		= "Du wurdest Respawnded Nur in %s team mit %d Sekunden Während Geblendeter zeit."
L["BLIND_RESPAWN"]			= "Du wurdest Respawnend inerhalb %d Sekunden Während Geblenderter zeit."

L["MISC_ACCEPT"]				= "Akzeptieren"
L["MISC_OK"]					= "OK"
L["MISC_CLOSE"]			= "Schließen"
L["MISC_PREV"]			= "< Vorheriges"
L["MISC_NEXT"]			= "Nächstes >"
L["MISC_ACCESSDENIED"]	= "Zugang Verweigert"

-- Chat messages
L["CHAT_NOPLAYERS"]		= "Es gibt nicht genügend Spieler um das Spiel zu starten!"
L["CHAT_SWAP"]			= "Teams Wurden Gewechselt!"

L["CHAT_SWAPTEAM_WARNING"] = "Du hast Teams gewechselt %dx (%dx MAX). Danach kannst du nicht mehr zum gegnerishem Team wechseln."
L["CHAT_SWAPTEAM_REVERT"]= "Konnte nicht zum %s Team wechseln weil du deinen nummer von Teamwechseln aufgebraucht hast."

L["CHAT_PROP_NO_ROOM"] = "Zu wenig Platz um zu diser Requisite zu wechseln!"

-- Notification
L["NOTIFY_IN_PROP_TEAM"]		= "Du bist in einem Requisiten Team Mit rotations unterstützung! Du kannst mit der Maus Deine Requisite Rotieren."
L["NOTIFY_ROTATE_NOTICE"]	= "Zusätzlich kannst du noch die rotation stoppen mit (ursprünglich) [R]!"

-- Custom Taunt Window
L["TM_WARNING_CT_DISABLE"]	= "[PHX - Verspottung] Warnung: Dieser Server Hat Cusotm Taunts Deaktiviert."
L["TM_NO_TAUNTS"]	= "Warnung: Keine Verspottung wurde in diser kategorie gefunden."
L["TM_PLAY_ONLY_ALIVE"] 	= "Du darfst nur Custom Taunts Aktiviren Wenn du am Leben bist."

L["TM_WINDOW_TITLE"]		= "Prop Hunt Custom Taunt Fenster"
L["TM_NOTICE_PLSWAIT"]		= "Bitte Warte %s Sekunde(en)!" -- fix me: Add " before Random Taunt ends!"
L["TM_NOTICE_PLAYPREVIEW"]	= "Verspottung Vorschau: %s"

L["TM_TOOLTIP_PLAYTAUNT"] 	= "Starte Verspottung"
L["TM_TOOLTIP_PREVIEW"]		= "Vorshau Verspottung"
L["TM_TOOLTIP_PLAYCLOSE"]	= "Starte Verspottung und Schließe"
L["TM_TOOLTIP_PLAYRANDOM"]	= "Starte Zufällige Verspottung"
L["TM_TOOLTIP_CLOSE"]		= "Schließen"
L["TM_MENU_CLOSE"]			= "Schließe Menu"

L["TM_DELAYTAUNT_NOT_EXIST"] = "Die ausgewählte verspottung gibt es nicht in diesem Server!"
L["TM_DELAYTAUNT_PLSWAIT"]	= "Bitte warten sie %s Sekunde(en)!"

--[[
	PHX Menu window
]]
L["PHXM_WINDOW_TITLE"]		= "Prop Hunt X - Erweiterte Einstellungen & Menu"
L["SERVER_INFO_MOTD"]		= "SERVER INFORMATIONEN & REGELN [MOTD]"

L["PHXM_TAB_HELP"]			= "Hilfe & Guides"
L["PHXM_TAB_MUTE"]			= "Spieler Stumm/Nicht Stumm Stimme"
L["PHXM_TAB_PLAYER"]			= "Spieler Einstellungen"
L["PHXM_TAB_MODEL"] 			= "Spieler Model Suchmachine"
L["PHXM_TAB_MODEL_DISABLED"]	= "Spieler Model Suchmachine (Deaktiviert)"
L["PHXM_TAB_ADMIN"]			= "Admin Einstellungen"
L["PHXM_TAB_ABOUT"]			= "Über Prop Hunt X"
L["PHXM_TAB_MAPVOTE"]		= "Karte Bestimmungs Einstellungen"

L["PHXM_CVAR_CHANGED"]		= "[Einstellungen] CVar %q Wurde geändert zu %q"

--[[
	Player Mute Settings
]]
L["PHXM_MUTE_SELECT"]		= "Whälen sie den Spieler aus den Sie Stummshalten wollen."

--[[ 
	Player Settings
]]
L["PHXM_PLAYER_OPTIONS"]		= "Spieler Optionen"
L["PHXM_PLAYER_LANG"]		= "Sprachen"
L["PHXM_PLAYER_BIND"]		= "Binds"
L["PHXM_PLAYER_HUDSETTINGS"]	= "HUD Einstellungen"

L["PHXM_PLAYER_TAUNT_KEY"]			= "Zufällige Verspottungs Taste"
L["PHXM_PLAYER_TAUNTWINDOW_KEY"]		= "Verspottungs Menu Taste"
L["PHXM_PLAYER_ROTATLOCK_KEY"]		= "Rotations Stop Taste"

L["PHXM_PLAYER_TOGGLE_HALOS"]		= "Umschalten von dem Heiligem Schein Effect beim auswählen einer requisite"
L["PHXM_PLAYER_IDNAMES"]				= "Zeige Team Spieler Namen Stadessen über ihrem Kopf an (Erscheint auch durch wände)"
L["PHXM_PLAYER_ENDROUND_CUE"]		= "Spiele Ende Der Rounde Sound cue"
L["PHXM_PLAYER_TAUNTMENU_AUTOCLOSE"]	= "Option dafür das wenn man das neue Verspottungs Fenster Doppelt clickt Es Sich Schließt"
L["PHXM_PLAYER_SEE_HUNTER_LINE"]		= "Zeichne eine linie auf Jägern sodass man ihr Zielen Als Beobachter Sehen kann."
L["PHXM_PLAYER_SEE_LBALL_ICONS"]		= "Aktiviere das 'Lucky ball' Icon Sobald er erschienen ist "
L["PHXM_PLAYER_SEE_CRYSTAL_ICONS"]	= "Aktiviere 'Devil ball' Icon Sobald er erschienen ist "

L["PHXM_PLAYER_USE_NEW_HUD"]			= "Benutze Neue PH: Verbessertes HUD"
L["PHXM_PLAYER_SHOW_TUTOR"]			= "Zeige Tutorial Pop ups? (Wird Nur 2x Auf jeder Requisitem Spawn Angezeigt)"
L["PHXM_PLAYER_USE_NEW_CROSSHAIR"]	= "Aktiviere Benutzerdefiniert Fadenkreuz"
L["PHXM_PLAYER_SHOW_TEAM_TOPBAR"]	= "Zeige Totale anzahl von lebenden Teammitgliedern (Mindestens 4 Spieler Werden Gezeigt)"

--[[
	Player model Browser Section
]]
L["QUERY_MODEL_SELECTED"]	= "Model %s Wurde ausgewhält und wird nach respawn angewendet!"
L["QUERY_MODEL_INFO"]		= "Model name: %s - Verfügbar für: Alle!"

L["MDL_MENU_REFRESH"] 		= "Lade Icon neu"
L["MDL_MENU_PREVIEW"] 		= "Vorschau von Model"
L["MDL_MENU_MODELINFO"] 		= "Model Informationen"


L["MISC_APPLYMDL"] 			= "Wende Model an"

L["PHXM_MODEL_DISABLED"] 	= "Entschuldigung, Benutzerdefinierte Models Sind auf diesem Server nicht Aktiviert!"
L["PHXM_PLAYERMODEL_SETFOV"]	= "Setze Model FOV"

--[[
	Server Settings
]]
L["PHXM_ADMIN_OPTIONS"]		= "Serverseitenwise Spielmodus Optionen (Nur für  Admins/Owner sehbar)"
L["PHXM_ADMIN_MUSTALIVE"]	= "Du Must in dem Lebendem team sein um dies zu machen."

--[[
	Language Override
]]
L["PHXM_ADMIN_LANGOVERRIDE"]	= "Sprachen Überschreibung"

L["PHXM_ADMIN_FORCELANG"] 				= "Benutze Gezwungene Sprache? Dies wird Den Client Ünerschreiben und die Server Sprache verwenden."
L["PHXM_ADMIN_LANGTOUSE"]				= "Gezwungene Sprache benutzen."
L["PHXM_ADMIN_PLAYERDEFAULTLANG"] 		= "Standard Sprache Wenn jemand dem server zum ersten mal betritt."

-- Gameplay settings
L["PHXM_ADMIN_CUSTOM_MODEL"]				= "Aktivire Benutzerdefinierte Modele für Jäger"
L["PHXM_ADMIN_CUSTOM_MODEL_PROP"]		= "Aktiviere Benutzerdefinierte Modele für requisiten - Stelle sicher das Sie auch für Jäger aktiviert sind."
L["PHXM_ADMIN_TAUNT_DELAY_CUSTOM"]		= "Benutzerindifiziertr Verspottungen Verzögerung (Sekunden)"
L["PHXM_ADMIN_TAUNT_DELAY_RANDOM"]		= "Normale Verspottungen Vezögerung (Sekunden)"
L["PHXM_ADMIN_TAUNT_DELAY_AUTO"]			= "Automatishe Verspottungen Verzögerung (Sekunden)"
L["PHXM_ADMIN_AUTOTAUNT_ENABLE"]			= "Aktiviere automatishe Verspottungs funktion"

L["PHXM_ADMIN_NOTICE_ROTATION"]			= "Zeige 'Requisiten rotation' notifactionen auf jedem Requisitem Spawn"
L["PHXM_ADMIN_CAMERA_COLLIDE"]			= "Enable Prop Camera collision to the wall"
L["PHXM_ADMIN_FREEZECAM"]				= "Schalte Gefrorene Camera für team Requisiten an"
L["PHXM_ADMIN_PROP_COLLIDE"]				= "Schalte Collision Unter Team requisiten an"
L["PHXM_ADMIN_SWAP_TEAM"] 				= "Jede Runde Teamwechsel -Dies zu Deaktivieren heißt das Die Teams immer Diselben bleiben."
L["PHXM_ADMIN_HUNTER_PENALTY"]			= "Jäger Lebens Bestrafung"
L["PHXM_ADMIN_HUNTER_KILL_BONUS"]		= "Jäger Tötungs Bonus"
L["PHXM_ADMIN_HUNTER_SMG_GRENADES"]		= "Jäger SMG Granaten"
L["PHXM_ADMIN_GAME_TIME"]				= "Spielzeit (Minuten)"
L["PHXM_ADMIN_BLINDLOCK_TIME"]			= "Jäger Blindenzeit (Sekunden)"
L["PHXM_ADMIN_ROUND_TIME"]				= "Rounden Zeit (Sekunden)"
L["PHXM_ADMIN_ROUNDS_PER_MAP"]			= "Rounden gespielt per Karte"
L["PHXM_ADMIN_ENABLE_LUCKYBALL"]			= "Erlaube Das 'lucky balls' auf Zerbrechbaren Requisiten Spawnen können (Chance ist 8%)"
L["PHXM_ADMIN_ENABLE_CRYSTAL"]			= "Erlabue das 'Devil Balls' Gespawnt werden können wenn ein Jäger stirbt (Chance is 70%)"
L["PHXM_ADMIN_WAIT_PLAYERS"]				= "Warte auf Spieler um das Spiel zu beginnen"
L["PHXM_ADMIN_WAIT_MIN_PLAYERS"]			= "Minimunvon Spielern befor das spiel startet (Standard: 1)"
L["PHXM_ENABLE_PLAYER_JOIN_LEAVE"] 		= "Aktivire Chat notifkationen für Spieler die Das Spiel Verlassen Und beitreten? Setze dies zu 0 Wenn du lieber dein eigenes Chat addon haben willst."

L["PHXM_ADMIN_FORCEJOINBALANCE"]			= "Zwingt Spieler Die Teams Auszugleichen Wenn sie dem Server beitreten"
L["PHXM_ADMIN_ENABLETEAMBALANCE"]		= "Gleicht die teams Automatisch am anfang der runde aus (Team Balance)"
L["PHXM_ADMIN_PICKUP_PROPS"] 			= "Aufheben von kleinen requisiten erlauben? 0: Nicht Erlauben, 1: Nur Jäger, 2: Nur requisiten, 3: Alle."

L["PHXM_ADMIN_TAUNTMODES"]			= "Verspottungs Moduse"
L["PHXM_ADMIN_TAUNTMODE_MODE"]		= "--[Derzeitiger Verspottungs Modus ist: %d ]--"
L["PHXM_ADMIN_TAUNTMODE0"]			= "Modus [0]: F3/zufällige Verspottung"
L["PHXM_ADMIN_TAUNTMODE1"]			= "Modus [1]: C/Benutzerdefinierte Verspottung"
L["PHXM_ADMIN_TAUNTMODE2"]			= "Modus [2]: Beide moduse"
L["PHXM_ADMIN_TAUNTSOPEN"]			= "Öffne Verspottungs Fenster"

L["PHXM_MODE_DEFAULT"] 				= "--[ Aufhebungs Modus ist so eingestellt: %d ]--"
L["PHXM_MODE0"]						= "Mode [0]: Nicht erlauben"
L["PHXM_MODE1"]						= "Mode [1]: Nur Jäger"
L["PHXM_MODE2"]						= "Mode [2]: Nur requisiten"
L["PHXM_MODE3"]						= "Mode [3]: Aufheben erlaubt"

--[[
	Admin Developer Sections
]]
L["PHXM_ADMIN_DEVSECTION"]		= "Entwickler Optionen/Experimentelle Features"
L["PHXM_ADMIN_ROOMCHECK"]		= "Grenzen Check Aktiviren? Dies verhindert das du in Objekten ider Wänden Steckenbleibst."
L["PHXM_ADMIN_USENEWMKBREN"]		= "Bentze das nue model für die Bren MK II bonus waffe? (Erfordert Neustart der Karte)"
L["PHXM_ADMIN_BEVERBOSE"]		= "Entwickler: Sei Ausführlich - Ak PH:X Alle informationen und events Ausfürhlich drucken?"
L["PHXM_ADMIN_SHOWPLNAMEHEAD"]	= "Aktivire das team namen auf dem bildschirm erscheinen."
L["PHXM_ADMIN_USESINGLE_FZCAM"]	= "Benutze einen einziges Freezecam geräusch Anstatt von der liste (Nutze 'ph_fc_cue_path' Um das Geräusch zu bestimmen)"
L["PHXM_ADMIN_MODELLISTINGTYPE"] = "Benutze Verebrte Model Liste: 0: Alle Spielermodele, 1: Benutze Erbe: list.Get('PlayerOptionsModel')"
L["PHXM_ADMIN_JUMPPOWER"]		= "Additional Jump Power multiplier for Props"
L["PHXM_ADMIN_ENABLE_OBB"]		= "Developer: Enable Customized Prop Entities Model Boundaries (OBB) Modifier from config data"
L["PHXM_ADMIN_RELOAD_OBB"]		= "Developer: Reload OBB Modifier data every round restarts"

--[[
	Experimental & PH:X Features
]]
L["PHXM_ADMIN_EXPERIMENTALPHX"]			= "Neue PHX Experimentale Eigenschaften"

L["PHXM_ADMIN_HLA_COMBINE"]				= "Füge HAL Combine Model Unterstützung hinzu"
L["PHXM_ADMIN_TEAMBALANCE"]				= "Aktivire Team Ausgleichungs Funktion"
L["PHXM_ADMIN_CHANGETEAM_LIMIT"]			= "Benutze Team Wechsel . Setze zu -1 Zum Deaktiviren. "
L["PHXM_ADMIN_USENEWCHAT"]				= "Benutze Neue Chat Box (eChat) -Dies ist eine Temprärer Placeholder. Wenn Du schon einen hast, Mach hier kein Kreuz."
L["PHXM_ADMIN_NEWCHATPOS"]				= "Neue Chat Box positzion: Substrahiere Höhe (Y) Posizion Um N pixel."
L["PHXM_ADMIN_RESPAWNONBLIND"]			= "Erlaube Respawn In Blinder Zeit"
L["PHXM_ADMIN_RESPAWNONBLIND_TEAM"]		= "Erlaube Respawn Nur für ein team in der Blinden Zeit: 0: Alle, 1: Jäger, 2: Props"
L["PHXM_ADMIN_REWSPANTIMEPERCENT"]		= "Prozentzahl von Bilnder Zeit die einem Erlaubt Zu Respawnen. Standard ist 0.75 (Heißt 75% * Max Blinden Zeit)"
L["PHXM_ADMIN_ALLOWRESPAWN_SPECTATOR"]	= "Erlaube Respawn in Blinder Zeit Wenn man Den zushaern beitritt"
L["PHXM_ADMIN_ALLOWRESPAWN_TEAMCHANGE"]	= "Erlaube Respawn Beim Teamwechsel (Dies zu Aktiviren ist nicht empfohlen)"

--[[
	MapVote Settings
]]
L["PHXM_MV_SETTINGS"]			= "KartenAbstimmung Einstellungen"

L["PHXM_MV_ALLOWCURMAP"]			= "Erlaube für Die Derzeitige Karte zu stimmen"
L["PHXM_MV_COOLDOWN"]			= "Aktiviere Karten Cooldown Fürs Abstimmen"
L["PHXM_MV_USE_ULX_VOTEMAPS"]	= "Benutze Karten Listung Von ULX? Wenn Nicht dann Standardmaps/*/*.bsp wird benutzt."
L["PHXM_MV_MAPLIMIT"]			= "Anzahl von Karten Die Beim Abstimmen Angezeigt werden."
L["PHXM_MV_TIMELIMIT"]			= "Zeit in Sekunden Während Der Karten Abstimmung."
L["PHXM_MV_MAPBEFOREREVOTE"]		= "Karten Änderung Muss Passieren befor eine Karte wider auftaucht"
L["PHXM_MV_RTVCOUNT"]			= "Wie Viele Spiler Müssen RTV stimmen um es zu aktivieren (Rock the Vote)"

L["PHXM_MV_EXPLANATION1"]		= "Um Einzustellen welche Karte Aufgelistet werden soll, benutze (Z.b.) [ mv_map_prefix 'phx_,ph_,cs_,de_' ] in der console."
L["PHXM_MV_EXPLANATION2"]		= "wenn du ULX Benutzt, Benutze Karten abstimmung. Wenn nicht, use mv_start."
L["PHXM_MV_EXPLANATION3"]		= "KartenAbstimmung Aktion (Um abzubrechen, Schreibe !unmap_vote (ULX) oder mv_stop In der Console.)"

L["PHXM_MV_START"]		= "Starte KartenAbstimmung"
L["PHXM_MV_STOP"]		= "Stoppe KartenAbstimmung"
--                  			  ^YOU VIOLATED THE LAW!


--[[ 
	Versioning, Credits or About section
]]
L["PHXM_ABOUT_VERSIONING"]		= "Version: %s - Revision: %s"
L["PHXM_ABOUT_AUTHOR"]			= "Von: %s"
L["PHXM_ABOUT_ENJOYING"]			= "Wenn Dir Das Spiel Gefällt, Denke Übers Spenden nach!"
L["PHXM_ABOUT_UPDATE"]			= "Prop Hunt X Updates"
-- [[ FIX ME ]] --
L["PHXM_VIEW_UPDATE_INFO"]		= "View update info"
L["PHXM_CHECK_FOR_UPDATES"]		= "Check for Updates"
L["PHXM_UPDATE_FOUND_TEXT"]		= "Update has been checked. Please check on the Console for more information.\n\nWould you like to view update what's new?"
L["PHXM_UPDATE_FOUND_TITLE"]   	= "Update Information"
L["PHXM_UPDATE_FOUND_BUTTON"]   	= "View Updates"
L["UPDATE_NOTIFY_MSG_NOTFOUND"]	= "No update was found. Please click on 'Check for Updates' button first!"
L["UPDATE_NOTIFY_MSG_TITLE"]		= "No updates found"
L["UPDATE_NOTIFY_WINDOW_TITLE"]	= "Update Notice"
L["UPDATE_RTBOX_APPEND"]			= "\n\nFor your information:\nCurrently you are using version: %s with Revision: %s"
L["UPDATE_BTN_SEEFULL"]			= "See Full Changes"
-- [[ FIX ME ]] --
L["PHXM_ABOUT_LINKS"]			= "Links und credits"
L["PHXM_ABOUT_THANKS"]			= "Spezielles Danke für Den Unterschtüzung, Vorschläge & Mitarbeit:\n %s"
L["PHXM_ABOUT_BTN_DONATE"]		= "Unterschtüze PH:X by donating"
L["PHXM_ABOUT_BTN_HOME"]			= "PHX Homepage"
L["PHXM_ABOUT_BTN_GITHUB"]		= "PHX GitHub Repository"
L["PHXM_ABOUT_BTN_PLUGINS"]		= "PHX Addons/Plugins"
L["PHXM_ABOUT_BTN_CHANGELOGS"]	= "PHX Changelogs"

--[[
	Late Additionals
]]
-- fretta
L["HUD_SPECTATING"]	= "SPECTATING"
L["HUD_YOUDIED"]		= "You Died!"

L["CHAT_STARTING_MAPVOTE"] = "Runde ist Zu Ende. Starte Karten Abstimmung..."

-- This used for HUD Taunt Timer
L["HUD_PROP_TAUNT_TIME"]	= "Zufälliger Taunt"
L["HUD_PROP_CTAUNT_TIME"] = "Cust. Taunt"

L["PHXM_TAB_PLUGINS"]				= "Addons & Plugins"

-- Plugins Section
L["PLUGINS_NO_PLUGINS"]				= "Keine Plugins Instaliert. Suche nach mehr Plugins Hier!"
L["PLUGINS_BROWSE_MORE"]				= "Suche nach mehr Plugins Hier"
L["PLUGINS_SERVER_HAS_NO_PLUGINS"]	= "Sorry, Dieser Server hat keine Addons/Plugins Instaliert."
L["PLUGINS_SERVER_SETTINGS"]			= "-- Server Settings --"
L["PLUGINS_CLIENT_SETTINGS"]			= "-- Client Settings --"

-- Text Entries
L["TEXTENTRY_FZ_SINGLE"] = "Gefrorene Camera Audio Pfad" -- this one is for ph_fc_cue_path command
L["TEXTENTRY_MV_PREFIX"] = "Karten Abstimmung Vorwahl"			 -- the map previx for mv_map_prefix

--============= LATE ADDITION OF 29.10.21/X2Z. Please Improve your Language Here! =============--

L["MISC_GAME_ENDED"]		= "Game has ended."

--============= LATE ADDITION OF 16.09.21/X2Z. =============--

--[[
	Credits: Late Addition: Revision: 16.09.21/X2Z
]]

L["PHXM_ABOUT_BTN_WIKI"]			= "PHX Wiki & Manuals"

--[[
	Auto Taunt: Late Addition: Revision: 16.09.21/X2Z
]]

L["HUD_AUTOTAUNT_DISABLED"]		= 	"Auto Taunting is disabled."
L["HUD_AUTOTAUNT_WAITFORUPDATE"]	=	"Auto Taunt is Synchronizing..."

--[[
	MapVote: Late Addition: Revision: 16.09.21/X2Z
]]
L["PHXM_MV_VOTEROCKED"]				= " The vote has been rocked, map vote will begin on round end"
L["PHXM_MV_VOTEROCKED_IMMINENT"]		= "The vote has been rocked, map vote imminent"
L["PHXM_MV_VOTEROCKED_PLY_TOTAL"]	= "%s has voted to Rock the Vote. ( %d / %d )"

L["PHXM_MV_MUST_WAIT"]				= "You must wait a bit before voting!"
L["PHXM_MV_VOTEINPROG"]				= "There is currently a vote in progress!"
L["PHXM_MV_HAS_VOTED"]				= "You have already voted to Rock the Vote!"
L["PHXM_MV_ALR_IN_VOTE"]				= "There has already been a vote, the map is going to change!"
L["PHXM_MV_NEED_MORE_PLY"]			= "You need more players before you can rock the vote!"

--[[
	Late Addition: Revision: 16.09.21/X2Z
]]
L["PROP_PLAYERMDL_BANNED"]	= "Your custom Prop Player Model was banned from the server."

--[[
	Prop Menu/Prop Chooser, Revision: 16.09.21/X2Z
]]

L["PCR_USAGE_UNLIMIT"]		= "[Prop Menu] You have **unlimitted** usage left!"
L["PCR_USAGE_COUNT"]			= "[Prop Menu] You have %d usage left!"
L["PCR_PLS_WAIT"]			= "[Prop Menu] Please wait in %d seconds."
L["PCR_NOROOM"]				= "[Prop Menu] There is no room to change the prop!"
L["PCR_PROPBANNED"]			= "[Prop Menu] This prop was banned by the server."
L["PCR_PROPBANNED_BYPCR"]	= "[Prop Menu] You cannot use this prop because it was banned by Prop Menu."
L["PCR_REACHED_LIMIT"]		= "[Prop Menu] You have reached the limit!"
L["PCR_STAY_ON_GROUND"]		= "[Prop Menu] You need to stay on the ground and not crouching!"
L["PCR_ONLY_GROUP"]			= "[Prop Menu] Only certain groups can open this menu!"
L["PCR_NOT_EXIST_COUNT"]		= "That prop you have selected does not exists in this map! ( %s / 4 )"
L["PCR_NOT_EXIST"]			= "That prop you have selected does not exists in this map!"

-- PCR Client section, reason why there is a space because of chat.AddText between args.
L["PCR_NOTIFY_1"]			= " This server use Prop Menu version %s! Type "
L["PCR_NOTIFY_2"]			= " in console or use F1 -> [PropChooser Help] menu."
L["PCR_CL_DISABLED"]			= " This feature is disabled."
L["PCR_CL_GROUP"]			= " Only certain groups can open this menu!"
L["PCR_CL_LIMIT"]			= " You have reached the limit!"
L["PCR_UNLIMIT_TEXT"]		= "Unlimited"
L["PCR_WINDOW_TITLE"]		= "PHX Prop Menu"
L["PCR_HEADER_TOP"]			= "Choose any prop you want. You have"
L["PCR_HEADER_MID"]			= "%s usage limit"
L["PCR_HEADER_BOTTOM"]		= "to use this prop chooser!"
L["PCR_CL_TOOLTIP_BANNED"]	= "You cannot use this model."
L["PCR_CL_TOOLTIP_MODEL"]	= "Model: %s"
L["PCR_CL_MENU_NOTREADY"]	= " This feature is not available at the moment."
L["PCR_WINDOW_GUIDE_TTL"]	= "Quick Guide: Prop Menu 101"
L["PCR_BTN_HELP_MENU"]		= "Prop Menu Help"

L["PCR_CL_CMDUSEULX"]		= " This command is disabled. Use 'ulx propmenu' instead!"
L["PCR_CMD_ULX_DISABLED"]	= "Command ulx propmenu is disabled. Press your [Prop Menu Bind] to open."	--input.GetKeyName is impossible to access.

L["PCR_EDT_IN_USE"]			= "An admin is still editing the prop data. Please Wait!"
L["PCR_EDT_ERROR_DISABLED"]	= "[Prop Menu] Error: Custom Prop Addition is Disabled!"
L["PCR_EDT_NO_RIGHTS"]		= "You have no rights to access this feature."

--[[
	Admin Section, Revision: 16.09.21/X2Z
]]
L["PHXM_PLAYER_PROP_CHOOSER_KEY"]	= "Default Key to open Prop Menu (Prop Chooser)."
L["PHXM_PROP_FREEZE_MIDAIR"]			= "Default Key to toogle Freeze movement during on midair as a Prop."
L["PHXM_ADMIN_PROP_RIGHT_CLICK"]		= "Should Props also able to Taunt by pressing Right Click?"
L["PHXM_ADMIN_TAUNT_SCANNER"]		= "(Require Map Restart) Enable Taunt Scanner?"
L["PHXM_ADMLBL_USABLE_ENTS"]			= "Usable Prop Entities Types"
L["PHXM_ADMLBL_USABLE_ENTS_REF"]		= "Types can be: 1: Physics Only, 2: Physics & Dynamics, 3: Almost Anything inc. Ragdolls, 4: Custom Entities."
L["PHXM_ADMIN_USABLE_ENT_TYPE"]		= "Type of Entities to use for Prop to Replicate"
L["PHXM_ADMIN_NOTIFY_ENT_TYPE"]		= "Notify Props about entities that cannot be replicated by pressing E. Only works if 'ph_usable_prop_type' is set to 3 or 4."
L["NOTIFY_PROP_ENTTYPE"]				= "Press [E] to interact, [Click] to replicate object."
L["NOTIFY_CUST_ENT_TYPE_IS_ON"]		= "[PHX] Notice: Press [E] to interact object, Press [Click] to Replicate the object."

--[[
	Custom Taunts, Revision: 16.09.21/X2Z
]]
L["TM_TAUNTS_SEARCH_NOTHING"]		= "Taunt containing '%s' was not found..."
L["TM_SEARCH_PLACEHOLDER"]			= "Search in this category: Enter word, lowercase & no wildcards. Empty=Show All."

--[[
	Freeze Cam, Revision: 23.09.21/X2Z
]]
L["PHXM_ADMIN_FREEZECAM_HUNTER"]			= "Enable Freeze Cam features for team hunters"

--============= LATE ADDITION OF 10.06.2022/X2Z. =============--

L["PHXM_MSG_INPUT_IS_EMPTY"]			= "Text is empty or you didn't pressed ENTER key."
L["MISC_SET"]						= "Set"
L["MISC_APPLY"]						= "Apply"
L["MISC_NO"]							= "No"
L["MISC_YES"]						= "Yes"
L["MISC_WARN"]						= "Warning"
L["MISC_ERROR"]						= "Error"
L["MISC_INFO"]						= "Information"
L["MISC_NOTICE"]						= "Notice"
L["MISC_IDK"]						= "Unknown"
L["MISC_NA"]							= "N/A"

-- HUD
L["HUD_DECOY_ACTIVE"]                = "Press [%s]"
L["HUD_FAKETAUNT_COUNT"]             = "%ix Left"
L["HUD_FAKETAUNT_UNLI"]              = "Unlimited"
L["NOTICE_GRENADE_SMG_GIVEN"]        = "You are now acquired some SMG Grenades."

--[[
	ADMIN PANEL, Revision 10.06/2022/X2Z
]]--
L["PHXM_TAUNT_SETTINGS"]				= "Taunt Settings"
L["PHXM_GENERAL_SETTINGS"]			= "General Settings"
L["PHXM_FAKE_TAUNT_SETTINGS"]		= "Fake Taunt Settings"
L["PHXM_FAKE_TAUNT_ENABLE"]			= "Allow fake taunts to be played on random props in the map. Can be accessed only through Custom Taunt menu."
L["PHXM_FAKE_TAUNT_MAXUSAGE"]		= "Maximum usage for fake taunts to be used; -1 is unlimited."
L["PHXM_TAUNT_RIGHT_CLICK"]		    = "Right click for taunt. This will disable Right-clicking on custom menu!"

L["PHXM_TAUNT_PITCH_SETTINGS"]		= "Taunt Pitch Settings"
L["PHXM_TAUNT_PITCH_ENABLE"]			= "Enable Taunt Pitch"
L["PHXM_TAUNT_PITCH_RANGE_MIN"]		= "Minimum threshold/acceptable pitch range for a taunt. 1 to 99."
L["PHXM_TAUNT_PITCH_RANGE_MAX"]		= "Maximum threshold/acceptable pitch range for a taunt. 100 to 255."

L["PHXM_DECOY_SETTINGS"]				= "Decoy Settings"
L["PHXM_DECOY_ENABLE"]				= "Enable Decoy reward? Reward will be given ONLY ONCE for alive props until the round ends. They don't add and only substract once they're placed."

L["PHXM_DISABLE_FOOTSTEP"]           = "Toggle silent prop team footsteps"

L["PHXM_ADMIN_CHATSETTING"]			= "Chat Window Settings"
L["PHXM_ADMIN_HUNTERBLIND"]			= "Hunter Blind Control"

L["PHXM_ADMIN_GIVEGRENADE_NEAREND"]  = "Should grenades will be given near round end? If Yes, see 'ph_give_grenade_roundend_before_time'"
L["PHXM_ADMIN_GIVEGRENADE_TIME"]     = "Time in seconds to give grenades before Round Ends. This is typically between 10 to 30 seconds"

--[[
	Plugins in sh_init.lua, Revision 10.06/2022/X2Z
]]--
L["PLUG_NAME_VER"]					= "Plugin: %s | v.%s"
L["PLUG_DESCRIPTION"]				= "Description: %s"

--[[
	Taunt Pitch, Revision 10.06/2022/X2Z
]]--
L["PHX_CTAUNT_USE_PITCH"]			= "Use pitch for custom taunts"
L["PHX_CTAUNT_RANDOM_PITCH"]			= "Randomize pitch when playing taunt"
L["PHX_RTAUNT_USE_PITCH"]			= "Use pitch for random taunts [%s]"
L["PHX_RTAUNT_RANDOMIZE"]			= "Randomize pitch for random taunts [%s]"
L["PHX_CTAUNT_PITCH_FOR_FAKE"]		= "Use pitch for fake taunts"
L["PHX_CTAUNT_RANDPITCH_FOR_FAKE"]	= "Randomize pitch for fake taunts"
L["PHX_CTAUNT_SLIDER_PITCH"]			= "Taunt pitch slider."
L["TM_TOOLTIP_FAKETAUNT"]			= "Play a Fake Taunt on random prop"
L["TM_PREFERRED_PITCH"]              = "Preferred Taunt Pitch Level"

--[[
	Fake Taunt, Revision 10.06/2022/X2Z
	Description: Play fake taunts on random props in the map (Not Players)
]]--
L["PHX_CTAUNT_ON_RAND_PROPS"]		= "Play on random props (%ix)"
L["PHX_CTAUNT_ON_RAND_PROPS_UNLI"]	= "Play on random props"
L["PHX_CTAUNT_PLAYED_ON_RANDPROP"]	= "You played a taunt on a random prop."
L["PHX_CTAUNT_RAND_PROPS_LIMIT"]		= "You have hit the limit!"
L["PHX_CTAUNT_RAND_PROPS_NOT_PROP"]  = "Not available at this moment."
L["PHX_CTAUNT_RANDPROP_DISABLED"]	= "Fake taunt is currently disabled."

--[[
	PH:Z Simple Decoy, Revision 10.06/2022/X2Z
]]--
L.DECOY_PROP	= {
	"killed the dummy!",
	"feel regret after killing a dummy.",
	"killed a decoy.",
	"killed an innocent dummy.",
	"feel embarrased after killing a dummy."
}

L["DECOY_PUT_SUCC"]					= "Decoy successfully placed."
L["DECOY_CANT_PUT_HERE"]				= "Cannot put decoy here."
L["DECOY_GET_REWARD"]				= "Congrats! You received ['Prop Decoy'] for suviving this round!"
L["DECOY_REMINDER_GET"]              = "You have a Decoy/Dummy prop! Place somewhere to confuse hunters!"
L["DECOY_FRAGS_RECEIVED"]			= "Decoy successfully baited: You stole 1 score from %s!"
L["DECOY_DISABLED"]					= "Currently, decoy is unavailable."
L["PHXM_CL_DECOY_KEYBIND"]			= "Default key to place a decoy prop. Default is 1 (not keypad 1)."

L["DECOY_INDICATOR_INVALID"]         = "Invalid Slope!"
L["DECOY_INDICATOR_TOOFAR"]          = "Range too far!"
L["DECOY_INDICATOR_OK"]              = "Place Decoy [Press %s]"

L["PHXM_DECOY_HEALTH"]				= "How much health does the decoy should have. Default is 10."
L["PHXM_PLAYER_SHOW_DECOY_HELPER"]   = "Show/Hide Decoy placement helper? This will show a white dot with a text near on your crosshair."
L["PHXM_PLAYER_SHOW_DECOY_MARKER"]   = "Show/Hide Decoy marker?"

--[[
	Revision 10.06/2022/X2Z
    Prop Menu Update: Menu, Editor, Browser
]]--
L["PCR_MODEL_DONT_EXISTS"]   = "Sorry, this model is not available at the moment!"

L["PCR_PLUG_WARN_MSG"]		= "Warning: Custom Prop Addition (pcr_allow_custom) is set to 0.\nYou Must Enable this feature in order to edit your custom prop!\nA Map change is required to change this setting."
L["PCR_PLUG_LBL_BINDKEY"]	= "To change bind key, switch to '[Player] tab."
L["PCR_PLUG_LBL_EDITOR"]		= "Custom Prop Menu Editor"
L["PCR_PLUG_BTN_OPEN_EDT"]	= "Open Editor"
L["PCR_PLUG_LBL_COMSET"]		= "Common Settings"
L["PCR_PLUG_LBL_TECHSET"]	= "Technical Settings"
L["PCR_PLUG_LBL_EXPSET"]		= "Experimentals"
L["PCR_PLUG_LBL_PLAYERSET"]	= "Player Settings"

L["PCR_PLUG_ENABLE"]			= "Enable 'Prop Menu' feature"
L["PCR_PLUG_ALLOW_CUSTOM"]	= "(Require Map Restart) Allow custom props to be added in to the Prop Menu list?"
L["PCR_PLUG_PROP_BAN"]		= "(Require Map Restart) Do not include banned props into Prop Menu list?"
L["PCR_PLUG_USAGE_LIMIT"]	= "Maximum usage limit for player to use. -1 means unlimited."
L["PCR_PLUG_PROP_LIMIT"]		= "(Require Map Restart) Limit amount of prop addition to Prop Menu list"
L["PCR_PLUG_PROP_LIMITMAX"]	= "Maximum amount of props that will be added to Prop Menu list. Note: This will be randomly added!"
L["PCR_PLUG_USE_ULXMENU"]	= "Should Prop Menu can be accessed by Console (0) or ULX (1)? Bound key will respect with this setting"
L["PCR_PLUG_USE_DELAY"]		= "Delay in seconds before player to use another Prop in Prop Menu"
L["PCR_PLUG_KICK_INVALID"]	= "Kick any user attempt to access Invalid Model (4x Max. threshold)"
L["PCR_PLUG_SPACE_CHECK"]	= "Check for space for a room before player use another prop to prevent Stuck"
L["PCR_PLUG_X_BBOX"]			= "(Require Map Restart) Check Entity BBox Limit before adding to Prop Menu list"
L["PCR_PLUG_X_BBOX_MAX"]		= "BBox CollisionBound Maximum Height limit. Mins will be auto-calculated."
L["PCR_PLUG_X_BBOX_MIN"]		= "BBox CollisionBound Maximum Width limit. ins will be auto-calculated."
L["PCR_PLUG_ONLY_GROUPS"]	= "Should Prop Menu can only be accessed by certain groups e.g. Donator?"
L["PCR_PLUG_NOTIFYMSG"]		= "Notify player on how to use Prop Menu on every round start"

L["PCR_EDITOR_MSG_ERROR"]	= "Your changes hasn't been saved due to Errors.\nPlease check on your server console!"
L["PCR_EDITOR_MSG_SUCC"]		= "Your changes and Custom Prop data has has been saved and updated successfully."

L["PHZ_generic_title"]		= "Custom Prop Inclusion Editor"
L["PHZ_generic_helptext"]	= [[[How To Use:
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
L["PHZ_generic_mdlinfo"] = [[Model Info:
%s
Has Physics: %s]]
L["PHZ_generic_mdlinfoStart"] = "(Select model first!)"

L["PHZ_generic_no_ragdoll"]	= "No: Ragdoll"
L["PHZ_generic_titlelabel"]	= "%s Preview :"

L["PHZ_mount_game_sel"]		= "Select mounted game (Default: Garry's Mod)"
L["PHZ_input_placeholder1"]	= "Folder to Search: <folder name> or '*', blank for all folders."
L["PHZ_input_placeholder2"]  = "Addon to Search: <name> or '*', blank for all folders."
L["PHZ_msg_warn_close"]		= "Are you sure you want to close this window? Any unsaved edits will be lost!"
L["PHZ_msg_commit"] 			= "Are you sure you want to commit changes?"
L["PHZ_msg_cant_empty"]		= "Prop List cannot be empty!"
L["PHZ_msg_removesel"] 		= [[Remove selected props in the list. Legends:
Red = Marked Selections
Yellow: Prop don't exists in server AND should be Removed.]]
L["PHZ_msg_warn_mdlinlist"]  = "WARNING: This Model is already in the list!"
L["PHZ_msg_invalid_mdl"] 	= "Reason: This is invalid model"
L["PHZ_apply_select"] 		= "Apply & Save Selections"
L["PHZ_menu_copy"] 		= "Copy Model"
L["PHZ_menu_refresh"] 	= "Refresh Model"
L["PHZ_tooltip_removesel"]	= "Remove Selected"
L["PHZ_tooltip_wasmarked"] = [[This prop was marked because it does't exist in the server.
If you close this editor, this will automatically removed.]]

L["PHZ_pcr_fb_allcontent"] = "All Contents (Not All Players/Server will have same contents as you)"
L["PHZ_pcr_fb_notmounted"] = "%s [Not Mounted]"

-- Revision 25-27/08/2022
L["PHX_ADMIN_ACCESS_ONLY"]		= "Access Denied: only Admins can do that, %s !"
L["PHX_PROP_TOO_THIN"]           = "Cannot Replicate: Prop is too thin!"
L["PHX_PROP_IS_BANNED"]			= "The prop you're trying to use is banned from server!"
L["PHX_SPECT_JOINGAME"]			= "To join the game, Press [F2] then select a team to join."
L["PHX_TEAM_IS_FULL"]			= "That team is full!"
L["FORCE_JOIN_TEAM_IS_DISABLED"]	= "Even-out Team Balance is disabled (Team Shuffle/Rotation is Enabled)"

L["PHX_TM_MNBAR_OPTIONS"]		= "Options"
L["PHX_TM_MNBAR_SAVEFAV"]		= "Save Favorites"
L["PHX_TM_MNBAR_LOADFAV"]		= "Reload Favorites"
L["PHX_TM_MNBAR_SETTINGS"]		= "Others"
L["PHX_TM_MNBAR_RESET"]			= "Reset Favorites"

L["PHX_TM_WARN_CLEARFAV"]		= "WARNING: This will CLEAR ALL your previously saved Favorite Taunts. Are you sure you want to continue?"

L["PHXM_BANNED_MODELS"]			= "Dis/Allow the use of Restricted Models (Banned Models). This does not include from Prohibitted Models (They're always deleted)."
L["PHXM_ADMIN_ALLOWARMOR"]       = "Allow Armor Addition for team Hunters and Props"
L["PHXM_ADMIN_ALLOW3P"]          = "Allow thirdperson mode for Hunters"
L["PHXM_ADMIN_ALLOW3P_SVDESIRED"]= "Allow thirdperson mode to use Server's Desired Camera position (Disallow player custom position)"
L["PHXM_ADMIN_ALLOW3P_DIST"]     = "Thirdperson: Desired Camera Distance"
L["PHXM_ADMIN_ALLOW3P_RIGHT"]    = "Thirdperson: Desired Camera Right Position"
L["PHXM_ADMIN_ALLOW3P_UP"]     	= "Thirdperson: Desired Camera Up Position"
L["PHXM_ADMIN_JUMPPOWER_H"]		= "Additional Jump Power multiplier for Hunters"
L["PHXM_ADMIN_MDLCOLOR_PROP"]	= "Enable Player Color for team Props (Require Hunter Custom Models to be enabled)"
L["PHXM_ADMIN_MDLCOLOR_HUNTER"]	= "Enable Player Color for team Hunters (Require Hunter Custom Models to be enabled)"
L["PHXM_ADMIN_PITCH_ROTATION"]	= "[Experimental] Allow to use pitch rotation for props. This may be buggy."
L["PHXM_ADMIN_FALLDMG"]			= "Enable Fall Damage (Applies on All Teams)"
L["PHXM_ADMIN_FALLDMG_REAL"]		= "Enable 'Realistic' Fall Damage"
L["PHXM_INFORM_TO_JOIN"]			= "Inform Unassigned/Spectators with static text advice to join the game."
L["PHXM_ADMIN_PROPOFFSET"]		= "Substract/Add Prop View Offset Height using multiplier. Min: 0.6, Max: 1.2. Default: 0.8."
L["PHXM_ADMIN_REPL_MUST_STAND"]	= "[Experimental] Restrict props replication only when they're standing. Disable this to allow replicating when ducking or jumping."

L["PHXM_DROP_VBS_DISABLE"]       = "Disable Verbose"
L["PHXM_DROP_VBS_ENABLE"]        = "Enable Verbose"
L["PHXM_DROP_MDL_INCLUDEALL"]    = "Include Everything ( %d )"
L["PHXM_DROP_MDL_CUSTOMLIST"]    = "Seperate/Custom List ( %d )"
L["PHXM_DROP_MDLTYPE_PROP"]      = "Physics Only ( %d )"
L["PHXM_DROP_MDLTYPE_PROPDYN"]   = "Physics & Dynamic Props ( %d )"
L["PHXM_DROP_MDLTYPE_ANYENTS"]   = "Any Compatible Entities ( %d )"
L["PHXM_DROP_MDLTYPE_CUSTOM"]    = "Custom Entities ( %d )"
L["PHXM_DROP_RESPAWNBLIND_BOTH"] = "Both Teams"

L["PHXM_TAB_ADMINGROUPS"]        = "Group & Access Option"
L["PHXM_TAB_PHEPLUS"]			= "Enhanced Plus Settings"

L["PHXM_ADMIN_ACCESS_GROUP"]     = "Select groups to allow access PH:X Admin Settings, Enhanced Plus & Plugin Settings page."
L["PHXM_ADMIN_ACCESS_GROUP_HINT"] = "Please note that \"superadmins\" cannot be revoked."
L["PHXM_ADMIN_ACCESS_GROUP_NOULX"] = "Error: ULib & ULX is not installed on your server."
L["PHXM_ADMIN_ACCESS_NOREVOKE"]  = " (Cannot be revoked)"
L["PHXM_ADMIN_GROUP_WHOCANACC"]	= "Select groups to allow access [Admin Settings]."
L["PHXM_ADMIN_GROUP_MUTEABLE"]	= "Select groups to disallow Voice Mute in [Player Muting]. (User is always mute-able)."

L["PHXM_ADMIN_ACCESS_CHATINFO"]  = "There was a configuration update for Prop Hunt Menu window. Reopening..."
L["PHXM_ADMIN_ACCMSG_BODY"]      = "Do you want to save selection and proceed the changes?\nPlease note that any previous groups you revoked will no longer have the access.\nThis will restart the Prop Hunt Menu if they're still opened."
L["PHXM_ADMIN_ACCMSG_TITLE"]     = "Apply Group Access"
L["PHXM_ADMIN_ACCCFG_SUCC"]      = "Group Access data successfully saved."
L["PHXM_ADMIN_ACCCFG_FAIL"]      = "There was an error saving Group Access data. Check your server console!"
L["PHXM_ADMIN_MUTCFG_SUCC"]      = "Mutedable Group Access data successfully saved."
L["PHXM_ADMIN_MUTCFG_FAIL"]      = "There was an error saving Muteable Group data. Check your server console!"

L["PHXM_ADMIN_ACCESS_APPLY"]     = "Apply Selected Groups"

-- PHE/Plus
L["PHXM_ADMIN_PLUSSETTING"]		= "Plus+ Settings"
L["PHXM_PLUSSETTING_HINT"]		= "Configure Team Balance or any other additional settings."
L["PHXM_HEADER_UNSTUCK"]			= "Unstuck Settings"
L["PHXM_HEADER_TEAMSETTING"]		= "More Team Options & Settings"

L["LIST_PLAYER"]					= "Players"
L["LIST_FORCEDASPROP"]			= "Forced As Prop?"
L["LIST_MARKEDASPROP"]			= "Marked to be forced as Prop"
L["LIST_NOHUNTERS"]				= "No Hunters are currently playing."

L["PHXM_PLUS_MSG_NO_HUNTERS"]	= "There are no hunters to reset."

L["PHXM_PLUS_BTNRESET"]			= "Clear Selections (and Reset All Forced)"
L["PHXM_PLUS_LISTTIPS"]			= "Tips: Double Click to toggle Force Player as Prop."

L["PHXM_ADMIN_ENABLEUNSTUCK"]		= "Toggle Enable/Disable Built-in unstuck feature. If you use an addon, disable this."
L["PHXM_ADMIN_NOTPUNSTUCKINROUND"]	= "Disable last-resort unstuck teleportations to spawnpoints outside of the hiding phase" --ph_disabletpunstuckinround
L["PHXM_ADMIN_UNSTUCK_WAITTIME"]		= "How much seconds must pass between each unstuck attempt" --ph_unstuck_waittime
L["PHXM_ADMIN_TEAMBAL_ORIG"] 		= "Use PH:X's original auto-balancing (disables all following team-related options below)" --ph_originalteambalance
L["PHXM_ADMIN_FORCESPECTOPLAY"]		= "Force spectators to play by including them when balancing teams" --ph_forcespectatorstoplay
L["PHXM_ADMIN_NO_H_CONSECUTIVE"]		= "Prevent players from being a Hunter twice in a row (only works in shuffle mode)" --ph_preventconsecutivehunting
L["PHXM_ADMIN_HUNTER_COUNT"] 		= "Hunter count (0 = automatic)" --ph_huntercount
L["PHXM_ADMIN_ROTATETEAM"] 			= "Disable shuffle mode and rotate players instead" --ph_rotateteams
L["PHXM_ADMIN_RESET_ROTTEAM"] 		= "Reset rotations" --ResetRotateTeams
L["PHXM_ADMIN_RESET_ROTTEAM_WARN"]	= "Restart rotations from the beginning (in case you've started them, stopped, then started again and the current rotation does not satisfy you):" --ResetRotateTeams_warning
L["PHXM_ADMIN_RESET_MSG"]			= "Rotation Team has been Reset!"
L["PHXM_ADMIN_FORCEH2P_WARN"]		= "Force a Hunter to be a Prop next time (only works in shuffle mode):" --ForceHunterAsProp_warning
L["PHXM_ADMIN_FORCEH2P_RANDONLY"]	= "This action is only available in shuffle mode." --ForceHunterAsProp_randomonly

L["FORCEH2P_WILL_BE"]				= "%s will be a Prop next round."
L["FORCEH2P_IS_CANCELED"]			= "%s won't be a Prop next round."
L["FORCEH2P_IS_RESET"]				= "All Hunters won't be Forced as a Prop next round."
L["FORCEH2P_PLAYER_NOT_FOUND"]		= "Selected player was not found, probably they were disconnected."
L["PHX_ROTATE_TEAM_RESET"]			= "Rotation Team Offset has been reset."

L["UNSTUCK_YOURE_UNSTUCK"]			= "You should be unstuck!"
L["UNSTUCK_BAD_SPAWNPOINT"]			= "Error: The closest spawnpoint might get you stuck again. If it does, try to unstuck again."
L["UNSTUCK_RESCUE_SPAWNPOINT"]		= "This spawnpoint is extremely close, so you might still be stuck. Try unstucking again if you are."
L["UNSTUCK_NO_SPAWNPOINTS"]			= "For unknown reasons, no spawnpoint could be found. As a backup strategy, you will be teleported to (0, 0, 0). There is a very high chance that you will be stuck, so if you are please try unstucking again."
L["UNSTUCK_PLEASE_WAIT"]				= "Please wait %d seconds between each unstuck attempt."
L["UNSTUCK_NOT_ON_GROUND"] 			= "Not on ground, checking..."
L["UNSTUCK_NOT_STUCK_JITTER"]		= "You're not stuck. If you really are, wait until your prop no longer moves/jitters (try pressing ALT) then try again."
L["UNSTUCK_NOT_STUCK_TOOBAD"]		= "You're not stuck. If you really are, sorry, you'll have to wait until the end of the round."
L["UNSTUCK_CANNOT_FIND_SPOT"]		= "Cannot find a place to move you to, teleporting to closest spawnpoint."
L["UNSTUCK_SPAWNPOINTS_DISABLED"]	= "You were going to be teleported to a close spawnpoint, but this server disallows it outside of the hiding/hunter blind period. Sorry!"
-- End of PHE/Plus

L["MISC_SEL_APPLY"]  = "Apply Selections"
L["MISC_RESET_SEL"]  = "Reset Selections"
L["MISC_RESET"]      = "Reset"
L["MISC_CANCEL"]     = "Cancel"
L["MISC_SEL_ALL"]    = "Select All"
L["MISC_SEL_NONE"]   = "Select None"

L["PHXM_CL_THIRDPERSON"]     = "Key for Toggling thirdperson mode"
L["PHXM_CL_UNSTUCK"]			= "Key for Unstuck"
L["CL_THIRDPERSON_ENABLED"]  = "Thirdperson Enabled"
L["CL_THIRDPERSON_DISABLED"] = "Thirdperson Disabled"

L["PHX_TP_ADJUSTVIEW_BTN"]	= "Adjust Thirdperson View" --Button, as well as window title.
L["PHX_TPS_ADJ_TITLE"]		= "Thirdperson Warning"
L["PHX_TPS_ADJ_SVDESIRED"]	= "Thirdperson Customization disabled: Using Server's desired position."
L["PHX_TPS_ADJ_3PDIS"]		= "Thirdperson mode is disabled."
L["PHX_TPS_ADJ_BLIND"]		= "You're blinded. Try again later."
L["PHX_TPS_ADJ_NEEDALIVE"]	= "You need to be on Alive Hunter Team to do this."

L["ANG_AXIS_DIST"]	= "Distance" -- or Forward
L["ANG_AXIS_RIGHT"]	= "Right"
L["ANG_AXIS_UP"]		= "Up"
L["VEC_POS_LEFT"]	= "Left" --X
L["VEC_POS_FRONT"]	= "Front" --Y?
L["VEC_POS_TOP"]		= "Top"  --Z

-- Key Hints
L["KEYHINT_HUNTER3P"] 	= "Hunter Thirdperson"
L["KEYHINT_SHOOT"]		= "Fire Weapon"
L["KEYHINT_SEC"]			= "Fire Secondary"
L["KEYHINT_PICKUP"]		= "Pickup Object/Interact"

L["KEYHINT_LMB"]			= "Replicate Prop"
L["KEYHINT_RMB"]			= "Prop Taunt/Special Ability"
L["KEYHINT_RANDTAUNT"] 	= "Random Taunt"
L["KEYHINT_TAUNTMENU"] 	= "Toggle Taunt Menu"
L["KEYHINT_ROTATION"] 	= "Toggle Rotation Lock"
L["KEYHINT_PROPMENU"] 	= "Toggle Prop Menu"
L["KEYHINT_FREEZEAIR"] 	= "Toggle Prop Freeze"
L["KEYHINT_SPAWNDECOY"] 	= "Spawn Decoy"
L["KEYHINT_UNSTUCK"]		= "Unstuck Key"

L["KEY_LMB"]				= "LMB" -- Left Mouse Button, Short version
L["KEY_RMB"]				= "RMB" -- Right Mouse Button, Short version

L["MISC_TEAM_NAME"]		= "TEAM: %s" -- TEAM PROPS, TEAM HUNTERS, but in 1 sentence.
L["NOTIFY_HEADER_TITLE"]	= "Game Controls"

-- Revision 14/09/2022
L["PHXM_MV_CHANGEMAP_NOPLAYER"]	= "Force change the map after there are no players in the server?"

L["KEY_MIDCLICK"]		= "MMB"

L["LD_MIDCLICK"]			= "MIDDLE CLICK"
L["LD_RIGHTCLICK"]		= "RIGHT CLICK"
L["LD_PRESS2SHOOT"]		= "Press [%s] to shoot %s!"

PHX.LANGUAGES[L.code] = L