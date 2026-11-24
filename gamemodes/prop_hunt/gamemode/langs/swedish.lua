-- Kindly free to improve the language.

-- Originally written by: Torktumlaren

local L = {}

L.code = "sv_se"

L.Name 		 	= "Svenska"
L.NameEnglish	= "Swedish"
L.Author			= "Torktumlaren" -- Only accept STRINGS.
-- Can Accept: String, and Table.
L.AuthorURL		= {	
	"https://steamcommunity.com/id/TRKTML"
}
-- Special Section that isn't String-based
L.SUICIDEMSG = {  -- Fix me: there was addition text here but feel free to add more.
	"självmordade!",
	"dog mystiskt.",
	"dog av magi.",
	"no-scopade sig själv.",
	"ragequittade.",
	"är full.",
	"dog. Lycka till nästa gång!",
	"slog sig själv.",
	"föll på en pinne.",
	"dog av kraften.",
	"dog. Tryck F tack.",
	"ångrar sig efter att ha dödat några oskyldiga föremål.",
	"föll genom till bakrummen.",
	"försöker dö ut.",
	"dogog.",
	"är panikslagen och försöker döda alla föremål istället.",
	"sluta, skaffa hjälp.",
	"ragdolled.",
}
L.RANDOM_SPECTATORS = {
	"för att titta och slappna av.",
	"för att se de hänga.",
	"för at se sakerna.",
	" ",
}

L["PHX_TEAM_CONNECTING"] = "Ansluter"
L["PHX_TEAM_PROPS"]		= "Föremålen"
L["PHX_TEAM_HUNTERS"] 	= "Jägarna"
L["PHX_TEAM_UNASSIGNED"]	= "Otilldelad"
L["PHX_TEAM_SPECTATOR"] 	= "Åskådare"

-- List of string-based translation

-- // FRETTA SECTION \\
--  FRETTA: Kill text (X killed Y)
L["HUD_KILLED"]				= "dödade"

-- FRETTA: HUDs
L["HUD_TIME"] 				= "TID"
L["HUD_ROUND"]				= "RUNDA"
L["HUD_WAITPLY"]				= "Väntar på spelare..."
L["HUD_DEAD"]				= "(DÖD) "

L["HUD_TEAMWIN"]				= "%s segrar!"
L["HUD_LOSE"]				= "Oavgjort, alla förlorar!"
L["MISC_TIMELEFT"]			= "Tid kvar: %s"
L["MISC_GAMEEND"] 			= "Spelet slutar efter denna runda"

-- FRETTA: Team selection screen (F2)
L["DERMA_TEAMSELECT"]		= "Välj lag"

-- FRETTA: F1 screeen
L["DERMA_RTV"] 				= "Rösta på ändring (RTV)"
L["DERMA_PHMENU"] 			= "Prop Hunt-meny"
L["DERMA_CHANGETEAM"]		= "Ändra lag"

-- FRETTA: Scoreboard
L["DERMA_PLAYER"]			= "(%d spelare)"	
L["DERMA_PLAYERS"]			= "(%d spelare)"
L["DERMA_NAME"]				= "Namn"
L["DERMA_KILLS"]				= "Mord"
L["DERMA_DEATHS"]			= "Dödsfall"
L["DERMA_PING"]				= "Ping"
L["DERMA_SERVER_TAG"]		= "SV"	-- Fix me
L["DERMA_BOT_TAG"]			= "BOT"	-- Fix me
L["DERMA_GAMEMODE_CREDITS"]	= "%s | Version: %s - Rev. %s"

L["CHAT_JOINED"]				= " gick med "
L["CHAT_JOINEDTHE"]			= " gick med i "

L["CHAT_SWAPBALANCE"]		= "%s har överförts till %s for lagbalans."
L["CHAT_SWAPBALANCEYOU"]		= "Du har bytt plats för att uppnå perfekt balans." -- Smile... for even in death, you have become children of Thanos

-- FRETTA: Splash Starting Screen
L["SPASHSCREEN_BY_X"]		= "av %s"
-- RichTextBox
L["HELP_DONATORS_AND_CONTRIBUTORS"]  = "\n\nDonatorer & Medverkare:\n- %s"
-- // END OF FRETTA SECTION \\

L["HELP_F1"] 				= [[Ett Prop Hunt X Projekt.

Ett projekt skapat för att göra Prop Hunt mer modernt och anpassningsbart.

Mer information kan hittas genom länken:
https://www.buymeacoffee.com/wolvindra

För att få mer information, hjälp, och vägvisning, tryck på [F1] och sedan på [Prop Hunt-meny] knappen.

Version: ]].. PHX.VERSION ..[[ Revision: ]].. PHX.REVISION ..[[

Ha det kul!]]

L["LANGUAGE_CHANGED"]		= "Föredraget språk har ändrats till %s"

-- internal cl_menutypes section.
L["SUBTYPE_PREFERED_LANG"]	= "Föredraget språk"

-- Events
L["EV_PLAYER_CONNECT"]		= "%s har kopplat sig till servern."
L["EV_PLAYER_JOINED"]		= "%s har gått med i servern."
L["EV_PLAYER_DISCONNECT"]	= "%s har kopplat sig från servern (Anledning: %s)"

-- HUD elements
L["HUD_HP"]					= "HÄLSA"
L["HUD_AMMO"] 				= "AMMUNTION"
L["HUD_MAGSEC"]				= "MAG. / SEK." --Magazine | Secondary Magazine

-- !!WEAPON NAMES CANNOT BE TRANSLATED, THEY USE FROM language.GetPhrase THEREFORE IT'S IMPOSSIBLE TO DO.

L["TEAM_PROPS"]				= L["PHX_TEAM_PROPS"] 
L["TEAM_HUNTERS"]			= L["PHX_TEAM_HUNTERS"]

L["HUD_ROTLOCK"]				= "Föremålsrotation: Låst"
L["HUD_ROTFREE"]				= "Föremålsrotation: Olåst"
L["HUD_KILLEDBY"]			= "Du dödades av %s"

L["HUD_AUTOTAUNT"]			= "Hånar automatiskt om %d sekund(er)"
L["HUD_AUTOTAUNT_ALT"]		= "Hånar automatiskt om %d"

L["HUD_TargetID"]			= "Spelare: %s (%d%%)"

L["HUD_BLINDED"]				= "%s kommer avblindas och släppas loss om %s"
L["HUD_UNBLINDED"]			= "Redo eller ej, här kommer vi!"

L["BLIND_RESPAWN_TEAM"]		= "Du återupplivades endast på lag %s, %d sekund(er) in i bindeltiden"
L["BLIND_RESPAWN"]			= "Du återupplivades %d sekund(er) in i bindeltiden"

L["MISC_ACCEPT"]				= "Acceptera"
L["MISC_OK"]					= "OK"
L["MISC_CLOSE"]				= "Stäng"
L["MISC_PREV"]				= "< FÖREGÅENDE"
L["MISC_NEXT"]				= "NÄSTA >"
L["MISC_ACCESSDENIED"]		= "Åtkomst nekad"

-- Chat messages
L["CHAT_NOPLAYERS"]			= "Det finns inte nog med spelare för att påbörja spelet!"
L["CHAT_SWAP"]				= "Lagen har bytt plats!"

L["CHAT_SWAPTEAM_WARNING"]   = "Du har bytt lag %dx (%dx MAX). Efter det kan du inte längre byta lag."
L["CHAT_SWAPTEAM_REVERT"]	= "Du kan inte längre byta till %s, då du har överskridit antalet lagbyten."

L["CHAT_PROP_NO_ROOM"] 		= "Det finns inget utrymme att ändra till det föremålet!"

-- Notification
L["NOTIFY_IN_PROP_TEAM"]		= "Du är i föremålslaget och kan rotera! Du roterar föremålet genom att röra på musen."
L["NOTIFY_ROTATE_NOTICE"]	= "Dessutom kan du växla rotationslås genom att trycka på [R] knappen (vanliga tangentbindningar)"

-- Custom Taunt Window
L["TM_WARNING_CT_DISABLE"]	= "[PHX - Hån] Varning: Denna server har stängt av anpassade hån."
L["TM_NO_TAUNTS"]			= "Varning: Inga hån hittades i denna kategori."
L["TM_PLAY_ONLY_ALIVE"] 		= "Du får endast spela anpassade hån medan du lever."

L["TM_WINDOW_TITLE"]			= "Prop Hunt-fönstret för anpassade hån"
L["TM_NOTICE_PLSWAIT"]		= "Var snäll vänta %s sekund(er) tills slumpmässigt hån har spelat klart!"
L["TM_NOTICE_PLAYPREVIEW"]	= "Förhandsvisar hån: %s"

L["TM_TOOLTIP_PLAYTAUNT"] 	= "Spela upp hån"
L["TM_TOOLTIP_PREVIEW"]		= "Förhandsvisa hån"
L["TM_TOOLTIP_PLAYCLOSE"]	= "Spela upp hån och stäng"
L["TM_TOOLTIP_PLAYRANDOM"]	= "Spela upp slumpmässigt hån"
L["TM_TOOLTIP_CLOSE"]		= "Stäng"
L["TM_MENU_CLOSE"]			= "Stäng meny"

L["TM_DELAYTAUNT_NOT_EXIST"] = "Hånet du valde hittades inte på servern!"
L["TM_DELAYTAUNT_PLSWAIT"]	= "Var snäll vänta %s sekund(er) till!"

--[[
	PHX Menu window
]]
L["PHXM_WINDOW_TITLE"]		= "Prop Hunt X - Avancerade Alternativ & Meny"
L["SERVER_INFO_MOTD"]		= "SERVERINFORMATION & REGLER [MOTD]"

L["PHXM_TAB_HELP"]			= "Hjälp & vägledning"
L["PHXM_TAB_MUTE"]			= "Tysta spelare"
L["PHXM_TAB_PLAYER"]			= "Spelarinställningar"
L["PHXM_TAB_MODEL"] 			= "Bläddra modeller"
L["PHXM_TAB_MODEL_DISABLED"]	= "Bläddra modeller (avstängd)"
L["PHXM_TAB_ADMIN"]			= "Administratörsinställningar"
L["PHXM_TAB_ABOUT"]			= "Om PH:X"
L["PHXM_TAB_MAPVOTE"]		= "Kartröstning"
L["PHXM_TAB_PLUGINS"]		= "Tillägg/Plugins"

L["PHXM_CVAR_CHANGED"]		= "[Inställningar] CVar %q har ändrats till %q"

--[[
	Player Mute Settings
]]
L["PHXM_MUTE_SELECT"]		= "Välj spelare som du vill tysta."

--[[ 
	Player Settings
]]
L["PHXM_PLAYER_OPTIONS"]		= "Alternativ för spelare"
L["PHXM_PLAYER_LANG"]		= "Språk"
L["PHXM_PLAYER_BIND"]		= "Tangenter"
L["PHXM_PLAYER_HUDSETTINGS"]	= "HUD-inställningar"

L["PHXM_PLAYER_TAUNT_KEY"]			= "Knapp för slumpmässigt hån"
L["PHXM_PLAYER_TAUNTWINDOW_KEY"]		= "Knapp för hånmeny"
L["PHXM_PLAYER_ROTATLOCK_KEY"]		= "Knapp för rotationslås"

L["PHXM_PLAYER_TOGGLE_HALOS"]		= "Växla ljusskenseffekt när du väljer föremål"
L["PHXM_PLAYER_IDNAMES"]				= "Visa lagspelares namn ovanför deras huvuden istället (och visa även genom väggar)"
L["PHXM_PLAYER_ENDROUND_CUE"]		= "Spela upp ljud för rundavslut"
L["PHXM_PLAYER_TAUNTMENU_AUTOCLOSE"]	= "Alternativ for att stänga hånmeny automatiskt när man dubbelklickar."
L["PHXM_PLAYER_SEE_HUNTER_LINE"]		= "Rita en linje på jägare så man kan se deras synriktning i åskådarläge."
L["PHXM_PLAYER_SEE_LBALL_ICONS"]		= "Aktivera 'Lyckoboll' ikon för visning när dem upplivas"
L["PHXM_PLAYER_SEE_CRYSTAL_ICONS"]	= "Aktivera 'Djävulsboll' ikon för visning när dem skapas"

L["PHXM_PLAYER_USE_NEW_HUD"]			= "Använd Nya PH: Enhanced HUD"
L["PHXM_PLAYER_SHOW_TUTOR"]			= "Visa handledningsruta (Visas endast 2x för varje föremål som skapas)"
L["PHXM_PLAYER_USE_NEW_CROSSHAIR"]	= "Aktivera anpassat hårkors"
L["PHXM_PLAYER_SHOW_TEAM_TOPBAR"]	= "Visa antal levande lagmedlemmar längst upp til vänster (minst 4 spelare kommer visas)"

--[[
	Player model Browser Section
]]
L["QUERY_MODEL_SELECTED"]	= "Modell %s har valts och den kommer tillämpas efter återupplivelsen!"
L["QUERY_MODEL_INFO"]		= "Modellnamn: %s - Tillgänglig för: Alla"

L["MDL_MENU_REFRESH"] 		= "Uppdatera ikon"
L["MDL_MENU_PREVIEW"] 		= "Förhandsvisa modell"
L["MDL_MENU_MODELINFO"] 		= "Modellinformation"


L["MISC_APPLYMDL"] 			= "Tillämpa modell"

L["PHXM_MODEL_DISABLED"] 	= "Förlåt, men anpassade modeller har stängts av på denna server!"
L["PHXM_PLAYERMODEL_SETFOV"]	= "  Anpassa Modellsynfält"

--[[
	Server Settings
]]
L["PHXM_ADMIN_OPTIONS"]		= "Inställningar för spelläge på serversidan (Endast synlig för administratörer/ägare)"
L["PHXM_ADMIN_MUSTALIVE"]	= "Du måsta vara vid liv för att utföra denna handling."

--[[
	Language Override
]]
L["PHXM_ADMIN_LANGOVERRIDE"]	= "Språköverstyrning"

L["PHXM_ADMIN_FORCELANG"] 				= "Använd specifikt språk? Detta tvingar klienten att använda serverns valda språk."
L["PHXM_ADMIN_LANGTOUSE"]				= "Tvingat språk som ska användas."
L["PHXM_ADMIN_PLAYERDEFAULTLANG"] 		= "Standardspråk för förstagångsspelare."

-- Gameplay settings
L["PHXM_ADMIN_CUSTOM_MODEL"]				= "Använd anpassade modeller för jägare. Detta tillämpar [Bläddra modeller]-fliken."
L["PHXM_ADMIN_CUSTOM_MODEL_PROP"]		= "Använd tillämpade modeller för föremål (anpassade jägarmodeller måste vara på)"
L["PHXM_ADMIN_TAUNT_DELAY_CUSTOM"]		= "Anpassad hånfördröjning (sekunder)"
L["PHXM_ADMIN_TAUNT_DELAY_RANDOM"]		= "Normal hånfördröjning (sekunder)"
L["PHXM_ADMIN_TAUNT_DELAY_AUTO"]			= "Automatisk hånfördröjning (sekunder)"
L["PHXM_ADMIN_AUTOTAUNT_ENABLE"]			= "Använd automatiska hånfunktioner (tidur fixas nästa runda)"

L["PHXM_ADMIN_NOTICE_ROTATION"]			= "Visa notis om 'föremålsrotation' vid varje föremålsskapande"
L["PHXM_ADMIN_CAMERA_COLLIDE"]			= "Låt föremålskamera kollidera med väggar"
L["PHXM_ADMIN_FREEZECAM"]				= "Slå på kamerafrysningsfunktioner för föremålslaget"
L["PHXM_ADMIN_FREEZECAM_HUNTER"]			= "Slå på kamerafrysningsfunktioner för jägarlaget"
L["PHXM_ADMIN_PROP_COLLIDE"]				= "Låt föremålspelare kollidera med varandra"
L["PHXM_ADMIN_SWAP_TEAM"] 				= "Byt lag varje runda - lagen förblir på varsin sida om denna är av."
L["PHXM_ADMIN_HUNTER_PENALTY"]			= "Hälsostraff för jägare"
L["PHXM_ADMIN_HUNTER_KILL_BONUS"]		= "Jägardråpsbonus"
L["PHXM_ADMIN_HUNTER_SMG_GRENADES"]		= "SMG granater till jägarna"
L["PHXM_ADMIN_GAME_TIME"]				= "(Kräver omstart av karta) Total speltid (minuter)"
L["PHXM_ADMIN_BLINDLOCK_TIME"]			= "Jägares blindtid (sekunder)"
L["PHXM_ADMIN_ROUND_TIME"]				= "(Kräver omstart av karta) Omgångstid (sekunder)"
L["PHXM_ADMIN_ROUNDS_PER_MAP"]			= "(Kräver omstart av karta) Totala antal rundor per karta"
L["PHXM_ADMIN_ENABLE_LUCKYBALL"]			= "Tillåt Lyckobollar att skapas på förstörbara objekt (Chans är 8%)"
L["PHXM_ADMIN_ENABLE_CRYSTAL"]			= "Tillåt Djävulsbollar att skapas när jägare dör (Alltid)"
L["PHXM_ADMIN_WAIT_PLAYERS"]				= "Vänta på spelare att påbörja spelet"
L["PHXM_ADMIN_WAIT_MIN_PLAYERS"]			= "Minsta antal spelare att vänta på innan spelet börjar (standard: 1)"
L["PHXM_ENABLE_PLAYER_JOIN_LEAVE"] 		= "Slå på chat notis för anslutning samt avgång av spelare? Sätt denna på 0 om du föredrar att använda ditt egna chattillägg."

L["PHXM_ADMIN_FORCEJOINBALANCE"]			= "Tvinga spelare att jämna ut lagen när de ansluter (stäng av detta om lagrotation är PÅ)"
L["PHXM_ADMIN_ENABLETEAMBALANCE"]		= "Slå på lagutjämning: Jämna ut lagen automatiskt i början av varje runda."
L["PHXM_ADMIN_PICKUP_PROPS"] 			= "Tillåt upplockning av små objekt? 0: Tillåt inte, 1: Endast jägare, 2: Endast föremål, 3: Tillåt alla."

L["PHXM_ADMIN_TAUNTMODES"]			= "Hånlägen"
L["PHXM_ADMIN_TAUNTMODE_MODE"]		= "--[Nuvarande hånläge är: %d ]--"
L["PHXM_ADMIN_TAUNTMODE0"]			= "Läge [0]: F3/Slumpmässigt hån"
L["PHXM_ADMIN_TAUNTMODE1"]			= "Läge [1]: C/Anpassat hån"
L["PHXM_ADMIN_TAUNTMODE2"]			= "Läge [2]: Båda lägen"
L["PHXM_ADMIN_TAUNTSOPEN"]			= "Öppna hånfönster"

L["PHXM_MODE_DEFAULT"] 				= "--[ Nuvarande upplockningsläge är %d ]--"
L["PHXM_MODE0"]						= "Läge [0]: Tillåt inte"
L["PHXM_MODE1"]						= "Läge [1]: Endast jägare"
L["PHXM_MODE2"]						= "Läge [2]: Endast föremål"
L["PHXM_MODE3"]						= "Läge [3]: Tillåt alla"

--[[
	Admin Developer Sections
]]
L["PHXM_ADMIN_DEVSECTION"]		= "Inställningar för utvecklare"
L["PHXM_ADMIN_ROOMCHECK"]		= "Slå på gränskontroller? Detta förhindrar att du fastnar i väggar/objekt."
L["PHXM_ADMIN_USENEWMKBREN"]		= "Använd ny modell för bonusvapnet Bren MK II (Kräver omstart av karta)"
L["PHXM_ADMIN_BEVERBOSE"]		= "Utvecklare: Var ordrik - låt PH:X skriva ut all information och alla händelser utförligt?"
L["PHXM_ADMIN_SHOWPLNAMEHEAD"]	= "Låt spelarens lagnamn visas på deras skärm."
L["PHXM_ADMIN_USESINGLE_FZCAM"]	= "Använd ett fryskameraljud isället för ljudlista (Använd 'ph_fc_cue_path' för att ställa in sökvägen till fryskamerans ljud)"
L["PHXM_ADMIN_MODELLISTINGTYPE"] = "Metod för att lista modeller: 0: Inkludera allt, 1: Använd list.Get('PlayerOptionsModel')"
L["PHXM_ADMIN_JUMPPOWER"]		= "Ytterligare hoppkraft för föremål"
L["PHXM_ADMIN_ENABLE_OBB"]		= "Utvecklare: Slå på anpassad modifierare till föremålsentiteters modellgränser (OBB) från konfigurationsdata"
L["PHXM_ADMIN_RELOAD_OBB"]		= "Utvecklare: ladda om data för OBB modifierare varje runda"

--[[
	Experimental & PH:X Features
]]
L["PHXM_ADMIN_EXPERIMENTALPHX"]			= "Prop Hunt: X experimentella grejer"

L["PHXM_ADMIN_HLA_COMBINE"]				= "Lägg till stöd för HL: Alyx Combine modeller"
L["PHXM_ADMIN_TEAMBALANCE"]				= "Enkla laginställningar"
L["PHXM_ADMIN_CHANGETEAM_LIMIT"]			= "Sätt en gräns på lagändringar. Ange -1 för att stänga av. "
L["PHXM_ADMIN_USENEWCHAT"]				= "Använd nya chattboxen (eChat) - Detta är en tillfällig lösning. Om du redan har en, lämna denna omarkerad."
L["PHXM_ADMIN_NEWCHATPOS"]				= "Position för nya chattboxen: Subtrahera höjdposition (Y) med N pixlar."
L["PHXM_ADMIN_RESPAWNONBLIND"]			= "Tillåt återupplivning under blindtid"
L["PHXM_ADMIN_RESPAWNONBLIND_TEAM"]		= "Tillåt återupplivning under blindtid endast för specifierat lag: 0: Alla, 1: Jägare, 2: Föremål"
L["PHXM_ADMIN_REWSPANTIMEPERCENT"]		= "Procent av blindtid där du tillåts återupplivas. Standard är 0.75 (betyder 75% * Max blindtid)"
L["PHXM_ADMIN_ALLOWRESPAWN_SPECTATOR"]	= "Tillåt återupplivning under blindtid när man byter till åskådarlag"
L["PHXM_ADMIN_ALLOWRESPAWN_TEAMCHANGE"]	= "Tillåt återupplivning under blindtid när man byter till annat lag (Rekommenderas inte att slås på)"

--[[
	MapVote Settings
]]
L["PHXM_MV_SETTINGS"]			= "Kartomröstningsinställningar"

L["PHXM_MV_ALLOWCURMAP"]			= "Tillåt nuvarande karta att få röster"
L["PHXM_MV_COOLDOWN"]			= "Slå på återställningstid för röster på kartor"
L["PHXM_MV_USE_ULX_VOTEMAPS"]	= "Använd kartlistor från ULX-röstkartor? Om inte, kommer maps/*.bsp användas."
L["PHXM_MV_MAPLIMIT"]			= "Antal kartor att visa under kartomröstning."
L["PHXM_MV_TIMELIMIT"]			= "Tid i sekunder tills standardröstning."
L["PHXM_MV_MAPBEFOREREVOTE"]		= "Antal kartändringar innan samma karta kan dyka upp igen"
L["PHXM_MV_RTVCOUNT"]			= "Hur många spleare som behövs för att använda RTV (Rock the Vote)"

L["PHXM_MV_EXPLANATION1"]		= "För att ange vilken karta bör dyka upp i listan, skriv (t.ex.) [ mv_map_prefix 'phx_,ph_,cs_,de_' ] i konsolen."
L["PHXM_MV_EXPLANATION2"]		= "om ULX är installerat, använd 'ulx map_vote' istället. Använd annars 'mv_start' för vanligt anrop."
L["PHXM_MV_EXPLANATION3"]		= "Kartomröstningshandling (För att avbryta, skriv 'ulx unmap_vote' eller 'mv_stop' i konsolen.)"

L["PHXM_MV_START"]		= "Påbörja kartomröstningen"
L["PHXM_MV_STOP"]		= "Avsluta kartomröstningen"
--                  			  ^YOU VIOLATED THE LAW!

--[[ 
	Versioning, Credits or About section
]]
L["PHXM_ABOUT_VERSIONING"]		= "Version: %s - Revision: %s"
L["PHXM_ABOUT_AUTHOR"]			= "Av: %s"
L["PHXM_ABOUT_ENJOYING"]			= "Om du gillar spelet, överväg att donera!"
L["PHXM_ABOUT_UPDATE"]			= "Prop Hunt X-uppdateringar"

L["PHXM_VIEW_UPDATE_INFO"]		= "Visa uppdateringsinformation"
L["PHXM_CHECK_FOR_UPDATES"]		= "Kolla efter uppdateringar"
L["PHXM_UPDATE_FOUND_TEXT"]		= "Uppdatering har kontrollerats. Vänligen kolla in konsolen för mer information.\n\nVill du se vad som är nytt i uppdateringen?"
L["PHXM_UPDATE_FOUND_TITLE"]   	= "Uppdateringsinformation"
L["PHXM_UPDATE_FOUND_BUTTON"]   	= "Visa uppdateringar"

L["UPDATE_NOTIFY_MSG_NOTFOUND"]	= "Ingen uppdatering hittades. Vänligen klicka på 'Kolla efter uppdateringar' knappen först!"
L["UPDATE_NOTIFY_MSG_TITLE"]		= "Inga uppdateringar hittades"
L["UPDATE_NOTIFY_WINDOW_TITLE"]	= "Uppdateringsnotis"
L["UPDATE_RTBOX_APPEND"]			= "\n\nOBS:\nDu är för närvarande på version: %s med revision: %s"
L["UPDATE_BTN_SEEFULL"]			= "Se alla ändringar"

L["PHXM_ABOUT_LINKS"]			= "Länkar och medverkande"
L["PHXM_ABOUT_THANKS"]			= "Stort tack för stödet, förslagen & bidragen:\n %s"
L["PHXM_ABOUT_BTN_DONATE"]		= "Stöd PH:X genom att donera"
L["PHXM_ABOUT_BTN_HOME"]			= "PHX Hemsida"
L["PHXM_ABOUT_BTN_GITHUB"]		= "PHX GitHub repo"
L["PHXM_ABOUT_BTN_PLUGINS"]		= "PHX Tillägg/Plugin"
L["PHXM_ABOUT_BTN_CHANGELOGS"]	= "PHX Ändringsloggar"

-- fretta
L["HUD_SPECTATING"]	= "ÅSKÅDAR"
L["HUD_YOUDIED"]		= "Du dog!"

L["CHAT_STARTING_MAPVOTE"] = "Rundan har slutat. Påbörjar kartomröstning..."

-- This used for HUD Taunt Timer
L["HUD_PROP_TAUNT_TIME"]	= "Slumpmässigt hån"
L["HUD_PROP_CTAUNT_TIME"] = "Anpassat hån"

-- Plugins Section
L["PLUGINS_NO_PLUGINS"]				= "Inga plugin installerade. Bläddra efter fler plugin här!"
L["PLUGINS_BROWSE_MORE"]				= "Bläddra efter fler plugin"
L["PLUGINS_SERVER_HAS_NO_PLUGINS"]	= "Förlåt, Denna server har inga anpassade tillägg/plugin installerade."
L["PLUGINS_SERVER_SETTINGS"]			= "-- Serverinställningar --"
L["PLUGINS_CLIENT_SETTINGS"]			= "-- Klientinställningar --"

-- Text Entries
L["TEXTENTRY_FZ_SINGLE"] = "frys kamera, filsökväg för enstaka ljud"
L["TEXTENTRY_MV_PREFIX"] = "kartprefix för kartomröstning"

L["MISC_GAME_ENDED"]		= "Spelet har avslutats."

--============= LATE ADDITION OF 16.09.21/X2Z. =============--

--[[
	Credits: Late Addition: Revision: 16.09.21/X2Z
]]

L["PHXM_ABOUT_BTN_WIKI"]			= "PHX Wiki & Manualer"

--[[
	Auto Taunt: Late Addition: Revision: 16.09.21/X2Z
]]

L["HUD_AUTOTAUNT_DISABLED"]		= 	"Automatiska hån är avstängda."
L["HUD_AUTOTAUNT_WAITFORUPDATE"]	=	"Automatiska hån synkroniserar..."

--[[
	MapVote: Late Addition: Revision: 16.09.21/X2Z
]]
L["PHXM_MV_VOTEROCKED"]				= " Omröstningen har tippats, omröstningen börjar vid rundans slut"
L["PHXM_MV_VOTEROCKED_IMMINENT"]		= "Omröstningen har tippats, omröstningen börjar snart"
L["PHXM_MV_VOTEROCKED_PLY_TOTAL"]	= "%s har röstat för Rock the Vote. ( %d / %d )"

L["PHXM_MV_MUST_WAIT"]				= "Du måste vänta en stund innan du röstar!"
L["PHXM_MV_VOTEINPROG"]				= "En omröstning är på gång!"
L["PHXM_MV_HAS_VOTED"]				= "Du har redan röstat för Rock the Vote!"
L["PHXM_MV_ALR_IN_VOTE"]				= "En omröstning har redan genomförts, kartan kommer ändras!"
L["PHXM_MV_NEED_MORE_PLY"]			= "Du behöver fler spelare innan du kan utföra Rock the Vote!"

--[[
	Late Addition: Revision: 16.09.21/X2Z
]]
L["PROP_PLAYERMDL_BANNED"]	= "Din anpassade modell för föremål blev bannlyst från servern."

--[[
	Prop Menu/Prop Chooser, Revision: 16.09.21/X2Z
]]

L["PCR_USAGE_UNLIMIT"]		= "[Föremålsmeny] Du har **Oändliga** användningar kvar!"
L["PCR_USAGE_COUNT"]			= "[Föremålsmeny] Du har %d användningar kvar!"
L["PCR_PLS_WAIT"]			= "[Föremålsmeny] Vänligen vänta %d sekunder."
L["PCR_NOROOM"]				= "[Föremålsmeny] Det finns ingen plats att byta föremål!"
L["PCR_PROPBANNED"]			= "[Föremålsmeny] Detta föremål blev bannlyst från servern."
L["PCR_PROPBANNED_BYPCR"]	= "[Föremålsmeny] Du kan inte använda detta föremål eftersom det blev bannlyst av föremålsmenyn."
L["PCR_REACHED_LIMIT"]		= "[Föremålsmeny] Du har nått gränsen!"
L["PCR_STAY_ON_GROUND"]		= "[Föremålsmeny] Du måste förbli på marken utan att huka!"
L["PCR_ONLY_GROUP"]			= "[Föremålsmeny] Endast vissa grupper kan öppna denna meny!"
L["PCR_NOT_EXIST_COUNT"]		= "Föremålet du har valt finns inte på denna karta! ( %s / 4 )"
L["PCR_NOT_EXIST"]			= "Föremålet du har valt finns inte på denna karta!"

-- PCR Client section, reason why there is a space because of chat.AddText between args.
L["PCR_NOTIFY_1"]			= " Denna server använder föremålsmeny version %s! Skriv "
L["PCR_NOTIFY_2"]			= " i konsolen eller använd menyn under F1 -> [PropChooser Help]."
L["PCR_CL_DISABLED"]			= " Denna funktion är avstängd."
L["PCR_CL_GROUP"]			= " Endast vissa grupper kan öppna denna meny!"
L["PCR_CL_LIMIT"]			= " Du har nått gränsen!"

L["PCR_UNLIMIT_TEXT"]		= "Obegränsad"
L["PCR_WINDOW_TITLE"]		= "PH:X Föremålsmeny"
L["PCR_HEADER_TOP"]			= "Välj det föremål du vill använda. Du har"
L["PCR_HEADER_MID"]			= "%s användningsgräns"
L["PCR_HEADER_BOTTOM"]		= "för att använda denna föremålsväljare!"
L["PCR_CL_TOOLTIP_BANNED"]	= "Du kan inte använda denna modell."
L["PCR_CL_TOOLTIP_MODEL"]	= "Modell: %s"
L["PCR_CL_MENU_NOTREADY"]	= " Denna funktion är inte tillgänglig just nu."
L["PCR_WINDOW_GUIDE_TTL"]	= "Snabbguide: Föremålsmeny A och O"
L["PCR_BTN_HELP_MENU"]		= "Föremålsmeny Hjälp"

L["PCR_CL_CMDUSEULX"]		= " Detta kommando är avstängt. Använd 'ulx propmenu' istället!"
L["PCR_CMD_ULX_DISABLED"]	= "Kommandot ulx propmenu är avstängt. Tryck [tangentg för föremålsmenyn] för att öppna."

L["PCR_EDT_IN_USE"]			= "En administrator redigerar fortfarande föremålsdatan. Vänligen vänta!"
L["PCR_EDT_ERROR_DISABLED"]	= "[Föremålsmeny] Fel: Tillägg av anpassade föremål är avstängt!"
L["PCR_EDT_NO_RIGHTS"]		= "Du har inte rättigheterna att komma åt denna funktion."

--[[
	Admin Section, Revision: 16.09.21/X2Z
]]
L["PHXM_PLAYER_PROP_CHOOSER_KEY"]	= "Standardtangent för att öppna föremålsmeny (föremålsväljare)."
L["PHXM_PROP_FREEZE_MIDAIR"]			= "Standardtangent för att frysa rörelser mitt i luften som ett föremål."
L["PHXM_ADMIN_TAUNT_SCANNER"]		= "(Kräver omstart av karta) Slå på hånskanner?"
L["PHXM_ADMLBL_USABLE_ENTS"]			= "Användbara föremålstyper"
L["PHXM_ADMLBL_USABLE_ENTS_REF"]		= "Typer kan vara: 1: Endast fysik, 2: Fysik & dynamik, 3: Nästan allt inkl. Ragdolls, 4: Anpassade enheter."
L["PHXM_ADMIN_USABLE_ENT_TYPE"]		= "Typ av enheter att använda för föremål"
L["PHXM_ADMIN_NOTIFY_ENT_TYPE"]		= "Meddela föremål om enheter som inte kan imiteras genom att trycka E. Fungerar endast om 'ph_usable_prop_type' är satt på 3 eller 4."
L["NOTIFY_PROP_ENTTYPE"]				= "Tryck [E] för att interagera, [Klicka] för att imitera."
L["NOTIFY_CUST_ENT_TYPE_IS_ON"]		= "[PHX] OBS: Tryck [E] för att interagera med objekt, [Klicka] för att imitera objektet."

--[[
	Custom Taunts, Revision: 16.09.21/X2Z
]]
L["TM_TAUNTS_SEARCH_NOTHING"]		= "Ett hån innehållandes '%s' hittades inte..."
L["TM_SEARCH_PLACEHOLDER"]			= "Sök i denna kategori: Skriv ett ord; gemener & inga jokertecken. Tomt=Visa allt."
L["PHXM_MSG_INPUT_IS_EMPTY"]			= "textfält är tomt eller har du inte tryckt RETUR tangenten."

--============= LATE ADDITION OF 10.06.2022/X2Z. =============--

--goto line: @132
L["MISC_SET"]						= "Ange"
L["MISC_APPLY"]						= "Tillämpa"
L["MISC_NO"]							= "Nej"
L["MISC_YES"]						= "Ja"
L["MISC_WARN"]						= "Varning"
L["MISC_ERROR"]						= "Fel"
L["MISC_INFO"]						= "Information"
L["MISC_NOTICE"]						= "Meddelande"
L["MISC_IDK"]						= "Okänt"
L["MISC_NA"]							= "N/A"

-- HUD
L["HUD_DECOY_ACTIVE"]                = "Tryck [%s]"
L["HUD_FAKETAUNT_COUNT"]             = "%ix Kvar"
L["HUD_FAKETAUNT_UNLI"]              = "Obegränsad"
L["NOTICE_GRENADE_SMG_GIVEN"]        = "Du har nu några SMG-granater."

--[[
	ADMIN PANEL, Revision 10.06/2022/X2Z
]]--
L["PHXM_TAUNT_SETTINGS"]				= "Håninställningar"
L["PHXM_GENERAL_SETTINGS"]			= "Allmänna inställningar"
L["PHXM_FAKE_TAUNT_SETTINGS"]		= "Inställningar för låtsashån"
L["PHXM_FAKE_TAUNT_ENABLE"]			= "Tillåt låtsashån att spelas på slumpmässiga föremål på kartan. Kan endast kommas åt genom menyn för anpassade hån."
L["PHXM_FAKE_TAUNT_MAXUSAGE"]		= "Max antal användningar för låtsashån; -1 är obegränsat."
L["PHXM_TAUNT_RIGHT_CLICK"]		    = "Högerklicka för att håna. Detta stänger av högerklick i den anpassade menyn!"

L["PHXM_TAUNT_PITCH_SETTINGS"]		= "Tonhöjdsinställningar för hån"
L["PHXM_TAUNT_PITCH_ENABLE"]		= "Slå på tönhäjd för hån"
L["PHXM_TAUNT_PITCH_RANGE_MIN"]		= "Minsta tillåtna tonhöjd hör hån. 1 till 99."
L["PHXM_TAUNT_PITCH_RANGE_MAX"]		= "Högsta tillåtna tonhöjd hör hån. 100 till 255."

L["PHXM_TAUNT_INCLUDE_DEF"]			= "Inkludera medföljande PH:X & hånskanner mapp?\nOm denna är avstängd, använder vi samtliga tillgängliga anpassade hån. Om inga sådana är installerade använder vi reservhån. (KRÄVER OMSTART AV KARTA)"
L["PHXM_TAUNT_DOOVERLAP"]			= "Bör uppspelade hån överlappa med nyligen uppspelade hån?\nOm denna är avstängd stoppas uppspelningen av det förra hånet och spelar upp det nya istället. Slå på för att behålla det klassiska beteendet."
L["PHXM_TAUNT_SNDLVL"]				= "Ljudnivå att använda för hån\n1=75dB 2=80dB 3=85dB 4=90dB 5=95dB 6=100dB (standard är 6)"

L["PHXM_DECOY_SETTINGS"]			= "Lockfågelsinställningar"
L["PHXM_DECOY_ENABLE"]				= "Slå på låckfågelsbelöningar? Alla levande föremål belönas ENDAST EN GÅNG tills rundan slutar. De är inte additiva och subtraherar endast när dem placeras."

L["PHXM_DISABLE_FOOTSTEP"]          = "Växla tysta fotsteg för föremålslaget"

L["PHXM_ADMIN_CHATSETTING"]			= "Chattfönsterinställningar"
L["PHXM_ADMIN_HUNTERBLIND"]			= "Jägarblindhetskontroller"

L["PHXM_ADMIN_GIVEGRENADE_NEAREND"]  = "Bör granater delas ut nära rundans slut? Om ja, se 'ph_give_grenade_roundend_before_time'"
L["PHXM_ADMIN_GIVEGRENADE_TIME"]     = "Tid i sekunder som granater ska delas ut innan rundans slut. Detta är vanligen mellan 10 till 30 sekunder"

--[[
	Plugins in sh_init.lua, Revision 10.06/2022/X2Z
]]--
L["PLUG_NAME_VER"]					= "Plugin: %s | v.%s"
L["PLUG_DESCRIPTION"]				= "Beskrivning: %s"

--[[
	Taunt Pitch, Revision 10.06/2022/X2Z
]]--
L["PHX_CTAUNT_USE_PITCH"]			= "Använd tonhöjd för anpassade hån"
L["PHX_CTAUNT_RANDOM_PITCH"]			= "Slumpa tonhöjd när hån uppspelas"
L["PHX_RTAUNT_USE_PITCH"]			= "Använd tonhöjd för slumpade hån [%s]"
L["PHX_RTAUNT_RANDOMIZE"]			= "Slumpa tonhöjd för slumpmässiga hån [%s]"
L["PHX_CTAUNT_PITCH_FOR_FAKE"]		= "Använd tonhöjd för låtsashån"
L["PHX_CTAUNT_RANDPITCH_FOR_FAKE"]	= "Slumpa tonhöjd för låtsashån"
L["PHX_CTAUNT_SLIDER_PITCH"]			= "Tonhöjdsreglage för hån."
L["TM_TOOLTIP_FAKETAUNT"]			= "Spela upp låtsashån på slumpmässigt föremål"
L["TM_PREFERRED_PITCH"]              = "Föredragen tonhöjd för hån"

--[[
	Fake Taunt, Revision 10.06/2022/X2Z
	Description: Play fake taunts on random props in the map (Not Players)
]]--
L["PHX_CTAUNT_ON_RAND_PROPS"]		= "Spela upp på slumpmässiga föremål (%ix)"
L["PHX_CTAUNT_ON_RAND_PROPS_UNLI"]	= "Spela upp på slumpmässiga föremål"
L["PHX_CTAUNT_PLAYED_ON_RANDPROP"]	= "Du spelade upp ett hån på ett slumpmässigt föremål."
L["PHX_CTAUNT_RAND_PROPS_LIMIT"]		= "Du har nått gränsen!"
L["PHX_CTAUNT_RAND_PROPS_NOT_PROP"]  = "Inte tillgängligt just nu."
L["PHX_CTAUNT_RANDPROP_DISABLED"]	= "Låtsashån är för närvarande avstängda."

--[[
	PH:Z Simple Decoy, Revision 10.06/2022/X2Z
]]--
L.DECOY_PROP	= {
	"dödade lockfågeln!",
	"ångrar sig efter att ha dödat en lockfågel.",
	"dödade en lockfågel.",
	"dödade en oskyldig lockfågel.",
	"känner sig generad efter att ha dödat en lockfågel."
}

L["DECOY_PUT_SUCC"]					= "Lockfågel placerad."
L["DECOY_CANT_PUT_HERE"]				= "Kan inte placera lockfågel här."
L["DECOY_GET_REWARD"]				= "Gratulerar! Du fick ett ['Lockfågelsföremål'] för att ha överlevt denna runda!"
L["DECOY_REMINDER_GET"]              = "Du har ett lockfågelsföremål! Placera det någonstans för att förvirra jägare!"
L["DECOY_FRAGS_RECEIVED"]			= "Lockfågel har fått fångst: du stal 1 poäng från %s!"
L["DECOY_DISABLED"]					= "Lockfågel är för nuvarande otillgänglig."
L["PHXM_CL_DECOY_KEYBIND"]			= "Standard tangent för att placera lockfågel. Standard är 1 (inte 1 på numpad)."

L["DECOY_INDICATOR_INVALID"]         = "Ogiltig sluttning!"
L["DECOY_INDICATOR_TOOFAR"]          = "För långt bort!"
L["DECOY_INDICATOR_OK"]              = "Placera lockfågel [Tryck %s]"

L["PHXM_DECOY_HEALTH"]				= "Hur mycket hälsa lockfågeln ska ha. Standard är 10."
L["PHXM_PLAYER_SHOW_DECOY_HELPER"]   = "Dölj/Visa hjälp vid placering av lockfågel? Detta visar en vit prick med en text nära ditt hårkors."
L["PHXM_PLAYER_SHOW_DECOY_MARKER"]   = "Dölj/Visa lockfågelsmarkör?"

--[[
	Revision 10.06/2022/X2Z
    Prop Menu Update: Menu, Editor, Browser
]]--
L["PCR_MODEL_DONT_EXISTS"]   = "Tyvärr, denna modell är för närvarande inte tillgänglig!"

L["PCR_PLUG_WARN_MSG"]		= "Varning: Tillägg av anpassade föremål (pcr_allow_custom) är satt till 0.\nDu måste slå på denna funktion för att redigera ditt anpassade föremål!\nEn kartändring behövs för att byta denna inställning."
L["PCR_PLUG_LBL_BINDKEY"]	= "För att ändra tangentg, byt till '[Spelare] fliken."
L["PCR_PLUG_LBL_EDITOR"]		= "Redigerare för anpassade-föremålsmenyn"
L["PCR_PLUG_BTN_OPEN_EDT"]	= "Öppna redigerare"
L["PCR_PLUG_LBL_COMSET"]		= "Vanliga inställningar"
L["PCR_PLUG_LBL_TECHSET"]	= "Tekniska inställningar"
L["PCR_PLUG_LBL_EXPSET"]		= "Experimentellt"
L["PCR_PLUG_LBL_PLAYERSET"]	= "Spelarinställningar"

L["PCR_PLUG_ENABLE"]			= "Slå på 'Föremålsmeny' funktion"
L["PCR_PLUG_ALLOW_CUSTOM"]	= "(Kräver omstart av karta) Tillåt tillägg av anpassade föremål in i föremålsmenyns lista?"
L["PCR_PLUG_PROP_BAN"]		= "(Kräver omstart av karta) Inkludera inte bannlysta föremål i föremålsmenyns lista?"
L["PCR_PLUG_USAGE_LIMIT"]	= "Max användingar för spelare. -1 är öbegränsat."
L["PCR_PLUG_PROP_LIMIT"]		= "(Kräver omstart av karta) Begränsa antal tillägg i föremålsmenyns lista"
L["PCR_PLUG_PROP_LIMITMAX"]	= "Max antal föremål som kommer läggas till i föremålsmenyns lista. OBS: Detta kommer läggas till slumpmässigt!!"
L["PCR_PLUG_USE_ULXMENU"]	= "Bör föremålsmenyn vara tillgägnlig genom konsolen (0) eller ULX (1)? Bunden tangent kommer respektera denna inställning"
L["PCR_PLUG_USE_DELAY"]		= "Fördröjning i sekunder innan spelaren kan ändra föremål i föremålsmenyn"
L["PCR_PLUG_KICK_INVALID"]	= "Sparka spelare som försöker komma åt ogiltiga modeller (4x högsta tröskeln)"
L["PCR_PLUG_SPACE_CHECK"]	= "Kontrollera utrymmet innan spelaren byter föremål för att förhindra att dem blir fast"
L["PCR_PLUG_X_BBOX"]			= "(Kräver omstart av karta) Kontrollera BBox-gränsen på enheter innan dem läggs till i föremålsmenyns lista"
L["PCR_PLUG_X_BBOX_MAX"]		= "Maximihöjd av BBox Kollisionsgränser. Minimivärden kalkyleras automatiskt."
L["PCR_PLUG_X_BBOX_MIN"]		= "Maximibredd av BBox Kollisionsgränser. Minimivärden kalkyleras automatiskt."
L["PCR_PLUG_ONLY_GROUPS"]	= "Bör föremålsmenyn endast vara tillgänglig för vissa grupper, exempelvis donatorer?"
L["PCR_PLUG_NOTIFYMSG"]		= "Påminn spelare hur man använder föremålsmenyn i början av varje runda"

L["PCR_EDITOR_MSG_ERROR"]	= "Dina ändringar har inte sparats på grund av fel.\nVänligen kolla in serverkonsolen!"
L["PCR_EDITOR_MSG_SUCC"]		= "Dina ändringar samt anpassade föremålsdata har sparats och updaterats." --Thanks galaxio! x)

L["PHZ_generic_title"]		= "Redigerare för inkludering av anpassade föremål"
L["PHZ_generic_helptext"]	= [[[Användning:
[VÄNSTER PANEL]
← Välj spelinnehåll
← Klicka på ikonerna för att lägga till föremål till höger
← Högerklicka för att öppna kontextmenyn

[HÖGER PANEL]
→ Klicka för att 'markera' föremål för radering
→ Tryck 'Ta bort valda' för att ta bort modeller
→ Tryck 'Tillämpa markering' för att göra ändringar

[INFO]
- Du kan lägga till max 2048 modeller.
- Alla föremål som tillhör kartan läggs till automatiskt, så du inte behöver göra det själv.
- Avbryt handlingen genom att trycka [Stäng].
- Inte alla modeller kommer att ha en giltig 'VPhysics'.
- Inte alla spelare (inkl. servern) kommer att ha anpassade modeller. Om de inte finns, kommer de att tas bort efter markering har tillämpats.
- Serverns innhehåll kan skilja från ditt. Om du ser "<spel> [Inte fäst]" i rullgardinsmenyn, betyder det att du inte har fäst/installerat spelet.
- Bläddring av tilläggsmappen har inte implementerats än, så du behöver använda 'Allt innehåll' tills vidare.
]]
L["PHZ_generic_mdlinfo"] = [[Modellinfo:
%s
Har fysik: %s]]
L["PHZ_generic_mdlinfoStart"] = "(Välj modell först!)"

L["PHZ_generic_no_ragdoll"]	= "Nej: Ragdoll"
L["PHZ_generic_titlelabel"]	= "%s förhandsvisning :"

L["PHZ_mount_game_sel"]		= "Välj fäst spel (Standard: Garry's Mod)"
L["PHZ_input_placeholder1"]	= "Mapp att söka: <mappnamn> eller '*', lämna blankt för alla mappar."
L["PHZ_input_placeholder2"]  = "Tillägg att söka: <namn> eller '*', lämna blankt för alla mappar."
L["PHZ_msg_warn_close"]		= "Är du säker att du vill stänga detta fönster? Alla osparade ändringar kommer förloras!"
L["PHZ_msg_commit"] 			= "Är du säker att du vill tillämpa ändringarna?"
L["PHZ_msg_cant_empty"]		= "Föremålslistan kan inte vara tom!"
L["PHZ_msg_removesel"] 		= [[Ta bort valda föremål i listan. Teckenförklaring:
Röd = Markeringar
Gul: Föremål finns inte på servern OCH bör tas bort.]]
L["PHZ_msg_warn_mdlinlist"]  = "VARNING: Denna modell finns redan i listan!"
L["PHZ_msg_invalid_mdl"] 	= "Anledning: Detta är en ogiltig modell"
L["PHZ_apply_select"] 		= "Tillämpa & spara valda"
L["PHZ_menu_copy"] 		= "Kopiera modell"
L["PHZ_menu_refresh"] 	= "Uppdatera modell"
L["PHZ_tooltip_removesel"]	= "Ta bort valda"
L["PHZ_tooltip_wasmarked"] = [[Detta föremål markerades eftersom den inte finns på servern.
Om du stänger denna redigerare, kommer föremålet automatiskt tas bort.]]

L["PHZ_pcr_fb_allcontent"] = "Allt innehåll (Inte alla spelare/server kommer att ha samma innehåll som du)"
L["PHZ_pcr_fb_notmounted"] = "%s [Inte fäst]"

-- Revision 25-27/08/2022
L["PHX_ADMIN_ACCESS_ONLY"]		= "Åtkomst nekad: endast administratörer kan göra detta, %s !"
L["PHX_PROP_TOO_THIN"]           = "Kan inte imitera: föremålet är för tunn!"
L["PHX_PROP_IS_BANNED"]			= "Föremålet som du försöker använda är bannlyst från servern!"
L["PHX_SPECT_JOINGAME"]			= "För att gå med i spelet, tryck [F2] och välj ett lag."
L["PHX_TEAM_IS_FULL"]			= "Det laget är fullt!"
L["FORCE_JOIN_TEAM_IS_DISABLED"]	= "Lagutjämning är avstängt (lagrotation är på)"

L["PHX_TM_MNBAR_OPTIONS"]		= "Inställningar"
L["PHX_TM_MNBAR_SAVEFAV"]		= "Spara favoriter"
L["PHX_TM_MNBAR_LOADFAV"]		= "Ladda om favoriter"
L["PHX_TM_MNBAR_SETTINGS"]		= "Övrigt"
L["PHX_TM_MNBAR_RESET"]			= "Återställ favoriter"

L["PHX_TM_WARN_CLEARFAV"]		= "VARNING: Detta kommer RENSA ALLA dina sparade favorithån. Är du säker på att du vill fortsätta?"

L["PHXM_BANNED_MODELS"]			= "Tillåt användning av begränsade modeller (bannlysta modeller). Detta inkluderar inte förbjudna modeller (dem raderas alltid)."
L["PHXM_ADMIN_ALLOWARMOR"]       = "Tillåt tillägg av pansar för jägar- och föremålslag"
L["PHXM_ADMIN_ALLOW3P"]          = "Tillåt tredjepersonsvy för jägare"
L["PHXM_ADMIN_ALLOW3P_SVDESIRED"]= "Använd serverns önskade kameraposition för tredjepersonsvy (förbjud spelares anpassade kamerapositioner)"
L["PHXM_ADMIN_ALLOW3P_DIST"]     = "Tredjepersonsvy: Önskad kameraavstånd"
L["PHXM_ADMIN_ALLOW3P_RIGHT"]    = "Tredjepersonsvy: Önskad kameraförskjutning mot höger"
L["PHXM_ADMIN_ALLOW3P_UP"]     	= "Tredjepersonsvy: Önskad kamerahöjd"
L["PHXM_ADMIN_JUMPPOWER_H"]		= "Ytterligare hoppkraft för jägare"
L["PHXM_ADMIN_MDLCOLOR_PROP"]	= "Slå på färgade spelare för föremålslaget (Kräver att 'anpassade modeller för jägare' är på)"
L["PHXM_ADMIN_MDLCOLOR_HUNTER"]	= "Slå på färgade spelare för jägarlaget (Kräver att 'anpassade modeller för jägare' är på)"
L["PHXM_ADMIN_PITCH_ROTATION"]	= "[Experimentellt] Tillåt rotation runt tväraxeln för föremål. Detta kan vara ostabilt."
L["PHXM_ADMIN_FALLDMG"]			= "Slå på fallskada (gäller alla lag)"
L["PHXM_ADMIN_FALLDMG_REAL"]		= "Slå på 'verklighetstrogen' fallskada"
L["PHXM_INFORM_TO_JOIN"]			= "Informera med en statisk text att otilldelade/åskådare ska gå med i spelet."
L["PHXM_ADMIN_PROPOFFSET"]		= "Höjdförskjutningmultiplikator för föremåls sikt. Min: 0.6, Max: 1.2. Standard: 0.8."
L["PHXM_ADMIN_REPL_MUST_STAND"]	= "[Experimentellt] Begränsa imitation av föremål endast när dem står upp. Stäng av detta för att tillåta imitation medan man duckar eller hoppar."

L["PHXM_DROP_VBS_DISABLE"]       = "Stäng av detaljrikt"
L["PHXM_DROP_VBS_ENABLE"]        = "Slå på detaljrikt"
L["PHXM_DROP_MDL_INCLUDEALL"]    = "Inkludera allt ( %d )"
L["PHXM_DROP_MDL_CUSTOMLIST"]    = "Separat/Anpassad lista ( %d )"
L["PHXM_DROP_MDLTYPE_PROP"]      = "Endast fysik ( %d )"
L["PHXM_DROP_MDLTYPE_PROPDYN"]   = "Fysik & dynamiska föremål ( %d )"
L["PHXM_DROP_MDLTYPE_ANYENTS"]   = "Valfria kompatibla enheter ( %d )"
L["PHXM_DROP_MDLTYPE_CUSTOM"]    = "Anpassade enheter ( %d )"
L["PHXM_DROP_RESPAWNBLIND_BOTH"] = "Båda lag"

L["PHXM_TAB_ADMINGROUPS"]        = "Grupp- & åtkomstinställningar"
L["PHXM_TAB_PHEPLUS"]			= "Enhanced Plus-inställningnar"

L["PHXM_ADMIN_ACCESS_GROUP"]     = "Välj grupper som får åtkomst till administrativa PH:X inställningar, Enhanced Plus & Plugin-inställningssidan."
L["PHXM_ADMIN_ACCESS_GROUP_HINT"] = "Vänligen notera att rollen \"superadmins\" inte kan upphävas."
L["PHXM_ADMIN_ACCESS_GROUP_NOULX"] = "Fel: ULib & ULX är inte installerade på din server."
L["PHXM_ADMIN_ACCESS_NOREVOKE"]  = " (Kan inte upphävas)"
L["PHXM_ADMIN_GROUP_WHOCANACC"]	= "Välj grupper som får åtkomst till [Administratörsinställningar]."
L["PHXM_ADMIN_GROUP_MUTEABLE"]	= "Välj grupper imuna mot att tystas ner i [Tysta Spelare]. (Användare kan alltid tystas)."

L["PHXM_ADMIN_ACCESS_CHATINFO"]  = "Det var en konfigurationsuppdatering för Prop Hunt-menyn. Öppnar igen..."
L["PHXM_ADMIN_ACCMSG_BODY"]      = "Vill du spara markeringen och fortsätta med ändringarna?\nVänligen notera att tidigare grupper som du upphävde inte lägre kommer att ha åtkomst.\nDetta startar om Prop Hunt-menyn om den är öppen.."
L["PHXM_ADMIN_ACCMSG_TITLE"]     = "Tillämpa gruppåtkomst"
L["PHXM_ADMIN_ACCCFG_SUCC"]      = "Gruppåtkomstdata sparad."
L["PHXM_ADMIN_ACCCFG_FAIL"]      = "Det var ett fel vid sparande av gruppåtkomstdata. Kolla in serverkonsolen!"
L["PHXM_ADMIN_MUTCFG_SUCC"]      = "Data för tystbara grupper sparat."
L["PHXM_ADMIN_MUTCFG_FAIL"]      = "Det var ett fel vid sparande av data för tystbara grupper. Kolla in serverkonsolen!"

L["PHXM_ADMIN_ACCESS_APPLY"]     = "Tillämpa valda grupper"

-- PHE/Plus
L["PHXM_ADMIN_PLUSSETTING"]		= "Plus+ inställningar"
L["PHXM_PLUSSETTING_HINT"]		= "Konfigurera lagutjämning eller andra diverse inställingar."
L["PHXM_HEADER_UNSTUCK"]			= "Frigivningsinställningar"
L["PHXM_HEADER_TEAMSETTING"]		= "Fler laginställningar"

L["LIST_PLAYER"]					= "Spelare"
L["LIST_FORCEDASPROP"]			= "Betvinga till föremål?"
L["LIST_MARKEDASPROP"]			= "Markerad att bli betvingad till föremål"
L["LIST_NOHUNTERS"]				= "Inga jägare spelar för tillfället."

L["PHXM_PLUS_MSG_NO_HUNTERS"]	= "Det finns inga jägare att återställa."

L["PHXM_PLUS_BTNRESET"]			= "Rensa markeringar (och återställ alla betvingelser)"
L["PHXM_PLUS_LISTTIPS"]			= "Tips: Dubbelklicka för att växla betvingelse till föremål för spelare."

L["PHXM_ADMIN_ENABLEUNSTUCK"]		= "Växla inbyggd frigivningsfunktion. Om du använder ett tillägg, stäng av denna funktion."
L["PHXM_ADMIN_NOTPUNSTUCKINROUND"]	= "Stäng av frigivningsteleportering som sista utväg till skapningspunkter utanför gömningsfasen" --ph_disabletpunstuckinround
L["PHXM_ADMIN_UNSTUCK_WAITTIME"]		= "Hur många sekunder måste passera mellan varje frigivningsförsök" --ph_unstuck_waittime
L["PHXM_ADMIN_TEAMBAL_ORIG"] 		= "Använd PH:Xs urspungliga lagutjämning (stänger av alla lagrelaterade inställningar nedan)" --ph_originalteambalance
L["PHXM_ADMIN_TEAMBAL_UNCHECK"] 		= "Avmarkera den förra markeringsrutan för att komma åt avancerade lagutjämningsinställningar." --ph_originalteambalance_uncheck [UNUSED]
L["PHXM_ADMIN_FORCESPECTOPLAY"]		= "Tvinga åskådare att spela genom att inkludera dem i lagutjämningen (Detta delar också ut spelare till föremål/jägare direkt när dem går med i servern!)" --ph_forcespectatorstoplay
L["PHXM_ADMIN_NO_H_CONSECUTIVE"]		= "Förhindra spelare att bli jägare två gånger i rad (fungerar endast i blandingsläge)" --ph_preventconsecutivehunting
L["PHXM_ADMIN_HUNTER_COUNT"] 		= "Antal jägare (0 = automatisk)" --ph_huntercount
L["PHXM_ADMIN_ROTATETEAM"] 			= "Stäng av blandningsläge och rotera spelare istället" --ph_rotateteams
L["PHXM_ADMIN_RESET_ROTTEAM"] 		= "Återställ rotationer" --ResetRotateTeams
L["PHXM_ADMIN_RESET_ROTTEAM_WARN"]	= "Starta rotationer from början (i fall du har börjat dem, stannat, och börjat igen och den nuvarande rotationen inte är tillfredsställande):" --ResetRotateTeams_warning
L["PHXM_ADMIN_RESET_MSG"]			= "Lagrotationer har återställts!"
L["PHXM_ADMIN_FORCEH2P_WARN"]		= "Tvinga en jägare att vara ett föremål nästa gång (fungerar endast i blandingsläge):" --ForceHunterAsProp_warning
L["PHXM_ADMIN_FORCEH2P_RANDONLY"]	= "Denna handling är endast tillgänglig i blandningsläge." --ForceHunterAsProp_randomonly
L["PHXM_ADMIN_FORCEH2P_NOHUNT"]		= "[INGA JÄGARE]" --ForceHunterAsProp_nohunters [UNUSED]
L["PHXM_ADMIN_FORCEH2P_NOHUNTMSG"] 	= "Det finns inga jägare för fan, läs knappen!" --ForceHunterAsProp_nohuntersmsg [UNUSED]

L["FORCEH2P_WILL_BE"]				= "%s kommer vara ett föremål nästa runda."
L["FORCEH2P_IS_CANCELED"]			= "%s kommer inte vara ett föremål nästa runda."
L["FORCEH2P_IS_RESET"]				= "Inga jägare tvingas vara föremål nästa runda."
L["FORCEH2P_PLAYER_NOT_FOUND"]		= "Vald spelare hittades inte, dem har troligen kopplat från servern."
L["PHX_ROTATE_TEAM_RESET"]			= "Lagrotationsförsjkutning har återställts."
L["FORCEH2P_ALREADY"]				= "%s betvingas redan vara föremål nästa runda." -- [UNUSED]

L["UNSTUCK_YOURE_UNSTUCK"]			= "Du borde vara fri!"
L["UNSTUCK_BAD_SPAWNPOINT"]			= "Fel: Närmaste skapningspunkt kan göra fast dig igen. Om det händer, testa frigivningsfunktionen igen."
L["UNSTUCK_RESCUE_SPAWNPOINT"]		= "Denna skapningspunkt är extremt nära, så du kan fortfarande vara fast. Testa frigivningsfunktionen igen om du är det."
L["UNSTUCK_NO_SPAWNPOINTS"]			= "För okända anledningar kunde ingen skapningspunkt hittas. Som en reservstrategi teleporteras du ill (0, 0, 0). Det finns en mycket hög sannolikhet att du kommer fastna, testa frigivningsfunktionen igen om så är fallet."
L["UNSTUCK_PLEASE_WAIT"]				= "Vänligen vänta %d sekunder mellan varja frigivningsförsök."
L["UNSTUCK_NOT_ON_GROUND"] 			= "Inte på marken, kontrollerar..."
L["UNSTUCK_NOT_STUCK_JITTER"]		= "Du är inte fast. Om du verkligen är det, vänta tills ditt föremål slutar vricka/röra på sig (försök trycka ALT) sedan prova igen."
L["UNSTUCK_NOT_STUCK_TOOBAD"]		= "Du är inte fast. Om du verkligen är det, får du tyvärr vänta till rundans slut."
L["UNSTUCK_CANNOT_FIND_SPOT"]		= "Kan inte hitta ett ställe att flytta dig till, teleporterar till närmsta skapningspunkt."
L["UNSTUCK_SPAWNPOINTS_DISABLED"]	= "Du var på väg att teleporteras till en nära skapningspunkt, men denna server förbjuder det utanför gömningsfasen. Förlåt!"
-- End of PHE/Plus

L["MISC_SEL_APPLY"]  = "Tillämpa markeringar"
L["MISC_RESET_SEL"]  = "Återställ markeringar"
L["MISC_RESET"]      = "Återställ"
L["MISC_CANCEL"]     = "Avbryt"
L["MISC_SEL_ALL"]    = "Markera alla"
L["MISC_SEL_NONE"]   = "Avmarkera alla"

L["PHXM_CL_THIRDPERSON"]     = "Tangent för att växla mellan första- och tredjepersonsvy"
L["PHXM_CL_UNSTUCK"]			= "Tangent för frigivningsfunktion"
L["CL_THIRDPERSON_ENABLED"]  = "Tredjepersonsvy på"
L["CL_THIRDPERSON_DISABLED"] = "Tredjepersonsvy av"

L["PHX_TP_ADJUSTVIEW_BTN"]	= "Justera tredjepersonsvy" --Button, as well as window title.
L["PHX_TPS_ADJ_TITLE"]		= "Varning tredjepersonsvy"
L["PHX_TPS_ADJ_SVDESIRED"]	= "Anpassning av tredjepersonsvy avstängt: Använder serverns önskade positionering."
L["PHX_TPS_ADJ_3PDIS"]		= "Tredjepersonsvy avstängt."
L["PHX_TPS_ADJ_BLIND"]		= "Du är blind. Försök igen senare."
L["PHX_TPS_ADJ_NEEDALIVE"]	= "Du behöver vara levande på jägarlaget för att göra detta."

L["ANG_AXIS_DIST"]	= "Avstånd" -- or Forward
L["ANG_AXIS_RIGHT"]	= "Höger"
L["ANG_AXIS_UP"]		= "Upp"
L["VEC_POS_LEFT"]	= "Vänster" --X
L["VEC_POS_FRONT"]	= "Fram" --Y?
L["VEC_POS_TOP"]		= "Topp"  --Z

-- Key Hints
L["KEYHINT_HUNTER3P"] 	= "Tredjepersonsvy för jägare"
L["KEYHINT_SHOOT"]		= "Avfyra vapen"
L["KEYHINT_SEC"]			= "Avfyra sekundär"
L["KEYHINT_PICKUP"]		= "Plocka upp objekt/Interagera"

L["KEYHINT_LMB"]			= "Imitera föremål"
L["KEYHINT_RMB"]			= "Föremålshån/Särskild förmåga"
L["KEYHINT_RANDTAUNT"] 	= "Slumpmässigt hån"
L["KEYHINT_TAUNTMENU"] 	= "Växla hånmeny"
L["KEYHINT_ROTATION"] 	= "Växla rotationslås"
L["KEYHINT_PROPMENU"] 	= "Växla föremålsmeny"
L["KEYHINT_FREEZEAIR"] 	= "Växla föremålsfrysningsfunktion"
L["KEYHINT_SPAWNDECOY"] 	= "Skapa lockfågel"
L["KEYHINT_UNSTUCK"]		= "Tangent för frigivninsfunktion"

L["KEY_LMB"]				= "LMB" -- Left Mouse Button, Short version
L["KEY_RMB"]				= "RMB" -- Right Mouse Button, Short version

L["MISC_TEAM_NAME"]		= "LAG: %s" -- TEAM PROPS, TEAM HUNTERS, but in 1 sentence.
L["NOTIFY_HEADER_TITLE"]	= "Spelkontroller"

-- Revision 14/09/2022 + 14/01/2024
L["PHXM_MV_CHANGEMAP_NOPLAYER"]	= "Tvinga ändring av kartan efter alla har lämnat servern?"

L["KEY_MIDCLICK"]		= "MMB"

L["LD_MIDCLICK"]			= "MITTENKLICK"
L["LD_RIGHTCLICK"]		= "HÖGERKLICK"
L["LD_PRESS2SHOOT"]		= "Tryck [%s] för att skjuta %s!"

PHX.LANGUAGES[L.code] = L
