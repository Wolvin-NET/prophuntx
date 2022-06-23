local LANG = {}

-- Last updated: June 23, 2022

LANG.code 				= "pl_pl"

LANG.Name 		 		= "Polski"
LANG.NameEnglish	= "Polish"
LANG.Author				= "Pawelxxdd"
-- Can Accept: String, and Table.
LANG.AuthorURL		= {"https://steamcommunity.com/profiles/76561198114876117"}

-- Special Section that isn't String-based
LANG.SUICIDEMSG = {
	"popełnia samobójstwo!",
	"ginie w niewyjaśnionych okolicznościach.",
	"magicznie umiera.",
	"spada z planszy.",
	"denerwuje się.",
	"jest pod wpływem.",
	"umiera... więcej szczęścia następnym razem!",
	"przewraca się.",
	"potyka się o patyk.",
	"umiera z przymusu.",
	"umiera. [F]",
	"ma wyrzuty sumienia za niszczenie niewinnych przedmiotów.",
	"próbuje wyginąć.",
	"umiera.",
	"przestań, weź się w garść!",
	"mdleje.",
}

LANG.RANDOM_SPECTATORS = { --> FRETTA
	"aby odpocząć.",
	"aby patrzeć jak się bawicie.",
	"w roli Wielkiego Brata.",
	" ",
}

LANG["PHX_TEAM_CONNECTING"] 	= "Dołącza"
LANG["PHX_TEAM_PROPS"]				= "Przedmioty"
LANG["PHX_TEAM_HUNTERS"] 			= "Łowcy"
LANG["PHX_TEAM_UNASSIGNED"]		= "Nieprzypisany"
LANG["PHX_TEAM_SPECTATOR"] 		= "Widz"

-- List of string-based translation

-- ////////////////////////////
-- // FRETTA SECTION
-- ////////////////////////////

-- Kill text (X killed Y)
LANG["HUD_KILLED"]			= "zabija"

-- FRETTA: HUDs
LANG["HUD_TIME"] 				= "CZAS"
LANG["HUD_ROUND"]				= "RUNDA"
LANG["HUD_WAITPLY"]			= "Oczekiwanie na graczy..."
LANG["HUD_DEAD"]				= "(TRUP) "

LANG["HUD_TEAMWIN"]			= "%s wygrywają!"
LANG["HUD_LOSE"]				= "Remis, nikt nie zyskuje!"
LANG["MISC_TIMELEFT"]		= "Pozostały Czas: %s"
LANG["MISC_GAMEEND"] 		= "Gra zostanie zakończona po tej rundzie"

-- FRETTA: Team selection screen (F2)
LANG["DERMA_TEAMSELECT"]		= "Wybierz drużynę"

-- FRETTA: F1 screeen
LANG["DERMA_RTV"] 					= "Głosowanie Za Zmianą (RTV)"
LANG["DERMA_PHMENU"] 				= "Menu Prop Hunt"
LANG["DERMA_CHANGETEAM"]		= "Wybierz drużynę"

-- FRETTA: Scoreboard
LANG["DERMA_PLAYER"]						= "(%d gracz)"
LANG["DERMA_PLAYERS"]						= "(%d graczy)"
LANG["DERMA_NAME"]							= "Nazwa"
LANG["DERMA_KILLS"]							= "Zabójstwa"
LANG["DERMA_DEATHS"]						= "Śmierci"
LANG["DERMA_PING"]							= "Ping"
LANG["DERMA_SERVER_TAG"]				= "SV"
LANG["DERMA_BOT_TAG"]						= "BOT"
LANG["DERMA_GAMEMODE_CREDITS"]	= "%s | Wersja: %s - Poprawka %s"

LANG["CHAT_JOINED"]					= " dołącza do "
LANG["CHAT_JOINEDTHE"]			= " dołącza do drużyny "

LANG["CHAT_SWAPBALANCE"]		= "Przeniesiono gracza %s do %s w ramach autobalansowania drużyn."
LANG["CHAT_SWAPBALANCEYOU"]	= "Przeniesiono Cię w ramach autobalansowania drużyn. Miłej służby!"

-- FRETTA: Splash Starting Screen
LANG["SPASHSCREEN_BY_X"]		= "Od %s"
-- RichTextBox
LANG["HELP_DONATORS_AND_CONTRIBUTORS"]  = "\n\nWspornicy i współtwórcy:\n- %s"

-- ////////////////////////////
-- // END OF FRETTA SECTION
-- ////////////////////////////




LANG["HELP_F1"] 				= [[Prop Hunt (Nazwa Kodowa) Projekt X.

Projekt, który uczyni Prop Hunt X nowoczesnym i konfigurowalnym.

Więcej informacji znajdziesz tutaj:
https://gmodgameservers.com/prophuntx

Informacje, pomoc oraz poradniki znajdziesz, klikając przycisk [F1], a następnie przechodząc do [Menu Prop Hunt].

Wersja: ]].. PHX.VERSION ..[[ Poprawka: ]].. PHX.REVISION ..[[

Miłej zabawy!]]

-- Important!
LANG["LANGUAGE_CHANGED"]			= "Preferowany język został zmieniony na %s"

-- internal cl_menutypes section.
LANG["SUBTYPE_PREFERED_LANG"]	= "Preferowany język"
--LANG["SUBTYPE_TEXTENTRY_?"]	= "???"

-- Events
LANG["EV_PLAYER_CONNECT"]			= "%s rozpoczyna połączenie z serwerem."
LANG["EV_PLAYER_JOINED"]			= "%s pojawia się na serwerze."
LANG["EV_PLAYER_DISCONNECT"]	= "%s opuszcza grę (Powód: %s)"

-- HUD elements
LANG["HUD_HP"]							= "ZDROWIE"
LANG["HUD_AMMO"] 						= "AMMO"	-- obsolete
LANG["HUD_MAGSEC"]					= "MAG. / REZ." --Magazine Counts (separator) Secondary Magazine Counts

-- !!WEAPON NAMES CANNOT BE TRANSLATED, THEY USE FROM language.GetPhrase THEREFORE IT'S IMPOSSIBLE TO DO.

LANG["TEAM_PROPS"]					= LANG["PHX_TEAM_PROPS"]
LANG["TEAM_HUNTERS"]				= LANG["PHX_TEAM_HUNTERS"]

LANG["HUD_ROTLOCK"]					= "Obracanie Przedmiotu: Zablokowane"
LANG["HUD_ROTFREE"]					= "Obracanie Przedmiotu: Odblokowane"
LANG["HUD_KILLEDBY"]				= "%s likwiduje cię!"

LANG["HUD_AUTOTAUNT"]				= "Auto-podpowiedź za %d sek."
LANG["HUD_AUTOTAUNT_ALT"]		= "Auto-podpowiedź za %d"

LANG["HUD_TargetID"]				= "Gracz: %s (%d%%)" -- Player: <NAME> (<HEALTH>%)

LANG["HUD_BLINDED"]					= "%s zaczną poszukiwania za %s"
LANG["HUD_UNBLINDED"]				= "Gotowi czy nie, nadchodzimy!"

LANG["BLIND_RESPAWN_TEAM"]	= "Odradzasz się tylko w drużynie %s po %d sek. trwania czasu chowania."
LANG["BLIND_RESPAWN"]				= "Odradzasz się po %d sek. trwania czasu chowania."

LANG["MISC_ACCEPT"]					= "Akceptuj"
LANG["MISC_OK"]							= "OK"
LANG["MISC_CLOSE"]					= "Zamknij"
LANG["MISC_PREV"]						= "< WSTECZ"
LANG["MISC_NEXT"]						= "DALEJ >"
LANG["MISC_ACCESSDENIED"]		= "Dostęp Zabroniony"

-- Chat messages
LANG["CHAT_NOPLAYERS"]					= "Zbyt mało graczy by rozpocząć grę!"
LANG["CHAT_SWAP"]								= "Drużyny zostały zamienione!"

LANG["CHAT_SWAPTEAM_WARNING"] 	= "Zmieniono drużynę %d razy. Po przekroczeniu limitu (%d), nie będzie już można zmienić drużyny."
LANG["CHAT_SWAPTEAM_REVERT"]		= "Nie możesz dołączyć do drużyny %s, ponieważ osiągnięto już limit zmian drużyny."

LANG["CHAT_PROP_NO_ROOM"] 			= "Zbyt mało miejsca, aby się zamienić!"

-- Notification
LANG["NOTIFY_IN_PROP_TEAM"]			= "Jesteś w drużynie Przedmiotów z możliwością obracania przedmiotu! Możesz to robić poprzez ruszanie myszką."
LANG["NOTIFY_ROTATE_NOTICE"]		= "Dodatkowo, możesz zablokować obracanie się, klikając (domyślnie) przycisk [R]!"

-- Custom Taunt Window
LANG["TM_WARNING_CT_DISABLE"]		= "[PHX - Podpowiedzi] Ostrzeżenie: Serwer nie dopuszcza niestandardowych podpowiedzi."
LANG["TM_NO_TAUNTS"]						= "Ostrzeżenie: Nie znaleziono niestandardowych podpowiedzi we wskazanym katalogu."
LANG["TM_PLAY_ONLY_ALIVE"] 			= "Nie możesz odtwarzać podpowiedzi, kiedy jesteś trupem."

LANG["TM_WINDOW_TITLE"]					= "Prop Hunt - Niestandardowe podpowiedzi"
LANG["TM_NOTICE_PLSWAIT"]				= "Zaczekaj %s sek. zanim zakończy się losowa podpowiedź!"
LANG["TM_NOTICE_PLAYPREVIEW"]		= "Podgląd podpowiedzi: %s"

LANG["TM_TOOLTIP_PLAYTAUNT"] 		= "Odtwórz podpowiedź"
LANG["TM_TOOLTIP_PREVIEW"]			= "Przesłuchaj podpowiedź przed globalnym odtworzeniem"
LANG["TM_TOOLTIP_PLAYCLOSE"]		= "Odtwórz podpowiedź i zamknij okno"
LANG["TM_TOOLTIP_PLAYRANDOM"]		= "Odtwórz losową podpowiedź"
LANG["TM_TOOLTIP_CLOSE"]				= "Zamknij"
LANG["TM_MENU_CLOSE"]						= "Zamknij Menu"

LANG["TM_DELAYTAUNT_NOT_EXIST"] = "Wybrana podpowiedź, nie istnieje na serwerze!"
LANG["TM_DELAYTAUNT_PLSWAIT"]		= "Zaczekaj %s sek."

--[[
	PHX Menu window
]]
LANG["PHXM_WINDOW_TITLE"]				= "Prop Hunt X - Zaawansowane ustawienia"
LANG["SERVER_INFO_MOTD"]				= "INFORMACJE I ZASADY [MOTD]"

LANG["PHXM_TAB_HELP"]						= "Pomoc i poradniki"
LANG["PHXM_TAB_MUTE"]						= "Wycisz graczy"
LANG["PHXM_TAB_PLAYER"]					= "Ustawienia gracza"
LANG["PHXM_TAB_MODEL"] 					= "Modele gracza"
LANG["PHXM_TAB_MODEL_DISABLED"]	= "Modele gracza (Wyłączono)"
LANG["PHXM_TAB_ADMIN"]					= "Ustawienia Administratora"
LANG["PHXM_TAB_ABOUT"]					= "Informacje o Prop Hunt X"
LANG["PHXM_TAB_MAPVOTE"]				= "Ustawienia Głosowania"

LANG["PHXM_CVAR_CHANGED"]				= "[Ustawienia] Wartość CVAR %q została zmieniona na %q"

--[[
	Player Mute Settings
]]
LANG["PHXM_MUTE_SELECT"]				= "Wybierz gracza, którego chcesz wyciszyć."

--[[
	Player Settings
]]
LANG["PHXM_PLAYER_OPTIONS"]							= "Opcje Gracza"
LANG["PHXM_PLAYER_LANG"]								= "Język"
LANG["PHXM_PLAYER_BIND"]								= "Mapowanie klawiszy"
LANG["PHXM_PLAYER_HUDSETTINGS"]					= "Ustawienia Interfejsu"

LANG["PHXM_PLAYER_TAUNT_KEY"]						= "Klawisz losowej podpowiedzi"
LANG["PHXM_PLAYER_TAUNTWINDOW_KEY"]			= "Klawisz okna z listą podpowiedzi"
LANG["PHXM_PLAYER_ROTATLOCK_KEY"]				= "Klawisz blokady obracania przedmiotu"

LANG["PHXM_PLAYER_TOGGLE_HALOS"]				= "Przełącz efekt podświetlenia po spojrzeniu na przedmiot"
LANG["PHXM_PLAYER_IDNAMES"]							= "Pokaż nazwy graczy nad ich głowami (również przez ściany)"
LANG["PHXM_PLAYER_ENDROUND_CUE"]				= "Odtwarzaj dźwięk końca rundy"
LANG["PHXM_PLAYER_TAUNTMENU_AUTOCLOSE"]	= "Automatycznie zamykaj okno podpowiedzi po podwójnym kliknięciu na podpowiedź"
LANG["PHXM_PLAYER_SEE_HUNTER_LINE"]			= "Rysuj linię wzroku łowców podczas obserwowania rozgrywki."
LANG["PHXM_PLAYER_SEE_LBALL_ICONS"]			= "Pokazuj ikonę 'Kulek szczęścia' kiedy pojawią się one na mapie"
LANG["PHXM_PLAYER_SEE_CRYSTAL_ICONS"]		= "Pokazuj ikonę 'Diabelskich kulek' kiedy pojawią się one na mapie"

LANG["PHXM_PLAYER_USE_NEW_HUD"]					= "Użyj nowego interfejsu PH:E"
LANG["PHXM_PLAYER_SHOW_TUTOR"]					= "Pokaż okno poradnika (Tylko 2 razy za każdym odrodzeniem jako przedmiot)"
LANG["PHXM_PLAYER_USE_NEW_CROSSHAIR"]		= "Włącz niestandardowy celownik"
LANG["PHXM_PLAYER_SHOW_TEAM_TOPBAR"]		= "Pokazuj liczbę żywych graczy w lewym, górnym rogu (Wymaga przynajmniej 4 graczy na serwerze)"

--[[
	Player model Browser Section
]]
LANG["QUERY_MODEL_SELECTED"]		= "Model %s został wybrany i zostanie użyty przy następnym odrodzeniu!"
LANG["QUERY_MODEL_INFO"]				= "Nazwa modelu: %s - Dostępne dla wszystkich"

LANG["MDL_MENU_REFRESH"] 				= "Odśwież ikonę"
LANG["MDL_MENU_PREVIEW"] 				= "Podgląd modelu"
LANG["MDL_MENU_MODELINFO"] 			= "Informacje o modelu"


LANG["MISC_APPLYMDL"] 					= "Wybierz model"

LANG["PHXM_MODEL_DISABLED"] 		= "O nie! Niestandardowe modele gracza zostały wyłączone na tym serwerze!"
LANG["PHXM_PLAYERMODEL_SETFOV"]	= "  Ustaw FOV (pole widzenia)"

--[[
	Server Settings
]]
LANG["PHXM_ADMIN_OPTIONS"]			= "Opcje trybu po stronie serwera (Widoczne tylko dla administratorów i właścicieli)"
LANG["PHXM_ADMIN_MUSTALIVE"]		= "Musisz być po stronie żywych, aby móc dokonać tej czynności."

--[[
	Language Override
]]
LANG["PHXM_ADMIN_LANGOVERRIDE"]					= "Wymuszenie Języka"

LANG["PHXM_ADMIN_FORCELANG"] 						= "Wymusić język interfejsu? Spowoduje to zastosowanie okreslonego z góry języka u wszystkich graczy, mimo ich preferencji."
LANG["PHXM_ADMIN_LANGTOUSE"]						= "Wymuszony język."
LANG["PHXM_ADMIN_PLAYERDEFAULTLANG"] 		= "Domyślny język gracza podczas pierwszego połączenia."

-- Gameplay settings
LANG["PHXM_ADMIN_CUSTOM_MODEL"]					= "Zezwalaj na niestandardowe modele w drużynie Łowców"
LANG["PHXM_ADMIN_CUSTOM_MODEL_PROP"]		= "Zezwalaj na niestandardowe modele w drużynie Przedmiotów - Upenij się, że Łowcy też mają tą przyjemność!"
LANG["PHXM_ADMIN_TAUNT_DELAY_CUSTOM"]		= "Czas (w sekundach) między odtwarzanymi niestandardowymi podpowiedziami"
LANG["PHXM_ADMIN_TAUNT_DELAY_RANDOM"]		= "Czas (w sekundach) między odtwarzanymi zwykłymi podpowiedziami"
LANG["PHXM_ADMIN_TAUNT_DELAY_AUTO"]			= "Czas (w sekundach), po którym zostanie odtworzona Automatyczna Podpowiedź"
LANG["PHXM_ADMIN_AUTOTAUNT_ENABLE"]			= "Włącz Automatyczną Podpowiedź"

LANG["PHXM_ADMIN_NOTICE_ROTATION"]			= "Pokazuj informację o możliwości zablokowania obracania za każdym odrodzeniem w drużynie Przedmiotów"
LANG["PHXM_ADMIN_CAMERA_COLLIDE"]				= "Włącz kolizję kamery na ścianach"
LANG["PHXM_ADMIN_FREEZECAM"]						= "Włącz wstrzymanie kamery w drużynie Przedmiotów"
LANG["PHXM_ADMIN_PROP_COLLIDE"]					= "Włącz kolizję graczy w drużynie Przedmiotów"
LANG["PHXM_ADMIN_SWAP_TEAM"] 						= "Zamieniaj drużyny po każdej rundzie - wyłączenie spowoduje, że drużyny pozostaną takie same na zawsze (no... może do zakończenia mapy)"
LANG["PHXM_ADMIN_HUNTER_PENALTY"]				= "Kara dla Łowców za strzał w nieprawidłowy cel"
LANG["PHXM_ADMIN_HUNTER_KILL_BONUS"]		= "Bonus dla Łowców za zabicie Przedmiotu"
LANG["PHXM_ADMIN_HUNTER_SMG_GRENADES"]	= "Ilość granatników SMG dla Łowców"
LANG["PHXM_ADMIN_GAME_TIME"]						= "Czas gry (w minutach)"
LANG["PHXM_ADMIN_BLINDLOCK_TIME"]				= "Czas na chowanie się (w sekundach)"
LANG["PHXM_ADMIN_ROUND_TIME"]						= "Czas rudny (w sekundach)"
LANG["PHXM_ADMIN_ROUNDS_PER_MAP"]				= "Ilość rund na mapę"
LANG["PHXM_ADMIN_ENABLE_LUCKYBALL"]			= "Zezwalaj na towrzenie się Kulek Szczęścia po zniszczeniu przedmiotu (Szansa na pojawienie się: 8%)"
LANG["PHXM_ADMIN_ENABLE_CRYSTAL"]				= "Zezwalaj na tworzenie się Diabelskich Kulek po śmierci Łowcy (Szansa na pojawienie się: 70%)"
LANG["PHXM_ADMIN_WAIT_PLAYERS"]					= "Czekaj na graczy zanim zacznie się rozgrywka"
LANG["PHXM_ADMIN_WAIT_MIN_PLAYERS"]			= "Minimalna ilość graczy, aby czekać za rozpoczęciem rozgrywki (domyślnie: 1)"
LANG["PHXM_ENABLE_PLAYER_JOIN_LEAVE"] 	= "Włączyć informacje o dołączaniu lub odłączaniu się graczy? Ustaw na 0 jeżeli chcesz użyć własnej modyfikacji czatu."

LANG["PHXM_ADMIN_FORCEJOINBALANCE"]			= "Wymuś wyrównanie drużyn podczas dołączania graczy."
LANG["PHXM_ADMIN_ENABLETEAMBALANCE"]		= "Automatycznie wyrównaj drużyny na początku rundy (Balansowanie Drużyn)"
LANG["PHXM_ADMIN_PICKUP_PROPS"] 				= "Zezwalaj na podnoszenie małych przedmiotów? 0: Nie zezwalaj, 1: Tylko Łowcy, 2: Tylko Przedmioty, 3: Zezwalaj wszystkim."

LANG["PHXM_ADMIN_TAUNTMODES"]			= "Tryby Podpowiedzi"
LANG["PHXM_ADMIN_TAUNTMODE_MODE"]	= "--[Aktualny tryb: %d ]--"
LANG["PHXM_ADMIN_TAUNTMODE0"]			= "Tryb [0]: F3/Losowa Podpowiedź"
LANG["PHXM_ADMIN_TAUNTMODE1"]			= "Tryb [1]: C/Niestand. Podpowiedź"
LANG["PHXM_ADMIN_TAUNTMODE2"]			= "Tryb [2]: Obydwa tryby"
LANG["PHXM_ADMIN_TAUNTSOPEN"]			= "Otwórz okno podpowiedzi"

LANG["PHXM_MODE_DEFAULT"] 				= "--[ Tryb Podnosz. Przedm. %d ]--"
LANG["PHXM_MODE0"]								= "Tryb [0]: Nie zezwalaj"
LANG["PHXM_MODE1"]								= "Tryb [1]: Tylko Łowcy"
LANG["PHXM_MODE2"]								= "Tryb [2]: Tylko Przedmioty"
LANG["PHXM_MODE3"]								= "Tryb [3]: Zezwalaj wszystkim"

--[[
	Admin Developer Sections
]]
LANG["PHXM_ADMIN_DEVSECTION"]				= "Opcje Deweloperskie/Eksperymenty"
LANG["PHXM_ADMIN_ROOMCHECK"]				= "Włączyć sprawdzanie rozmiaru przedmiotu? Ochroni to przed niechcianym zablokowaniem się w ścianie/innym przedmiocie."
LANG["PHXM_ADMIN_USENEWMKBREN"]			= "Użyj nowego modelu broni Bren MK II (Wymaga Zmiany Mapy)"
LANG["PHXM_ADMIN_BEVERBOSE"]				= "Developer: Zezwalaj PH:X na wyświetlanie wszystkich informacji deweloperskich (dosłownie)?"
LANG["PHXM_ADMIN_SHOWPLNAMEHEAD"]		= "Zezwalaj na pokazywanie nazw graczy z drużyny przez ściany."
LANG["PHXM_ADMIN_USESINGLE_FZCAM"]	= "Użyj jednego dźwięku Zamrożenia Kamery zamiast całej listy (Zobacz 'ph_fc_cue_path', aby odkryć ścieżkę dźwięku)"
LANG["PHXM_ADMIN_MODELLISTINGTYPE"] = "Użyj starszej wersji listy modeli: 0 = Wszystkie modele gracza (AddValidModel), 1 = Użyj starszej wersji: list.Get('PlayerOptionsModel')"
LANG["PHXM_ADMIN_JUMPPOWER"]				= "Mnożnik wysokości skoku w drużynie Przedmiotów"
LANG["PHXM_ADMIN_ENABLE_OBB"]				= "Developer: Zezwalaj na modyfikowane granice przedmiotu zapisane w danych konfiguracyjnych (OBB)"
LANG["PHXM_ADMIN_RELOAD_OBB"]				= "Developer: Przeładuj dane pliku konfiguracyjnego za każdym razem, kiedy rozpoczyna się runda (OBB)"

--[[
	Experimental & PH:X Features
]]
LANG["PHXM_ADMIN_EXPERIMENTALPHX"]					= "Nowe, eksperymentalne możliwości PHX"

LANG["PHXM_ADMIN_HLA_COMBINE"]							= "Wsparcie dla nowego modelu Kombinatu z HLA"
LANG["PHXM_ADMIN_TEAMBALANCE"]							= "Włącz Balanoswanie Drużyn"
LANG["PHXM_ADMIN_CHANGETEAM_LIMIT"]					= "Ogranicz ilość zmian drużyn. Ustaw na -1 aby wyłączyć. "
LANG["PHXM_ADMIN_USENEWCHAT"]								= "Użyj nowego czatu (eChat) - Jest to tymczasowy zamiennik. Jeżeli już jakiś posiadasz, nie zmieniaj tej wartości."
LANG["PHXM_ADMIN_NEWCHATPOS"]								= "Pozycja nowego czatu: Przesuń w górę (względem osi Y) o wskazaną ilość pikseli."
LANG["PHXM_ADMIN_RESPAWNONBLIND"]						= "Zezwalaj na odradzanie się podczas czasu chowania się."
LANG["PHXM_ADMIN_RESPAWNONBLIND_TEAM"]			= "Zezwalaj na odradzanie się podczas czasu chowania się w konkretnej drużynie. 0: Wszyscy, 1: Łowcy, 2: Przedmioty"
LANG["PHXM_ADMIN_REWSPANTIMEPERCENT"]				= "Porcent czasu chowania się, przed którym można się odrodzić. Domyślnie: 0.75 (Po 75% Czasu Chowania Się, nie można się odrodzić)"
LANG["PHXM_ADMIN_ALLOWRESPAWN_SPECTATOR"]		= "Zezwól na odrodzenie się podczas czasu chowania się, kiedy gracz przychodzi z drużyny Obserwatorów."
LANG["PHXM_ADMIN_ALLOWRESPAWN_TEAMCHANGE"]	= "Zezwól na odrodzenie się podczas czasu chowania się, kiedy gracz przychodzi z przeciwnej drużyny."

--[[
	MapVote Settings
]]
LANG["PHXM_MV_SETTINGS"]					= "Ustawienia Głosowań"

LANG["PHXM_MV_ALLOWCURMAP"]				= "Zezwalaj, aby aktualna mapa była używana w głosowaniu"
LANG["PHXM_MV_COOLDOWN"]					= "Włącz ograniczenie przed rozpoczęciem głosowania"
LANG["PHXM_MV_USE_ULX_VOTEMAPS"]	= "Użyć map określonych na liście ULX? Jeżeli nie, wszystkie mapy w ścieżce maps/*.bsp zostaną użyte."
LANG["PHXM_MV_MAPLIMIT"]					= "Ilość map dostępnych w głosowaniu."
LANG["PHXM_MV_TIMELIMIT"]					= "Czas na głosowanie"
LANG["PHXM_MV_MAPBEFOREREVOTE"]		= "Ilość zmian map wymaganych, aby konkretna mapa ponownie pokazała się w głosowaniu."
LANG["PHXM_MV_RTVCOUNT"]					= "Mimalna ilość graczy wymagana do RTV (Głosowanie Za Zmianą)"

LANG["PHXM_MV_EXPLANATION1"]			= "Aby określić, które mapy powinny być użyte, ustaw zmienną (dla przykładu) [ mv_map_prefix 'phx_,ph_,cs_,de_' ] w konsoli."
LANG["PHXM_MV_EXPLANATION2"]			= "Jeżeli używasz ULX, użyj map_vote. Jeżeli nie, użyj mv_start."
LANG["PHXM_MV_EXPLANATION3"]			= "Akcja Głosowania (Aby anulować, po prostu wpisz !unmap_vote (dla ULX) lub w konsoli: mv_stop)"

LANG["PHXM_MV_START"]		= "Rozpocznij Głosowanie"
LANG["PHXM_MV_STOP"]		= "Zatrzymaj Głosowanie"
--                  				  ^ HEJ, TO ŁAMANIE PRAWA!


--[[
	Versioning, Credits or About section
]]
LANG["PHXM_ABOUT_VERSIONING"]				= "Wersja: %s - Poprawka: %s"
LANG["PHXM_ABOUT_AUTHOR"]						= "Autor: %s"
LANG["PHXM_ABOUT_ENJOYING"]					= "Jeżeli podoba ci się rozgrywka, pomyśl o dotacji!"
LANG["PHXM_ABOUT_UPDATE"]						= "Aktualizacje Prop Hunt X"

LANG["PHXM_VIEW_UPDATE_INFO"]				= "Zobacz informacje o aktualizacji"
LANG["PHXM_CHECK_FOR_UPDATES"]			= "Sprawdź dostępność aktualizacji"
LANG["PHXM_UPDATE_FOUND_TEXT"]			= "Dostępna jest aktualizacja. Zobacz konsolę po więcej informacji.\n\nCzy chcesz zobaczyć co się zmieniło?"
LANG["PHXM_UPDATE_FOUND_TITLE"]   	= "Informacje o aktualizacji"
LANG["PHXM_UPDATE_FOUND_BUTTON"]   	= "Zobacz aktualizację"
LANG["UPDATE_NOTIFY_MSG_NOTFOUND"]	= "Nic nie znaleziono. Najpierw kliknij przycisk \"Sprawdź dostępność aktualizacji\"!"
LANG["UPDATE_NOTIFY_MSG_TITLE"]			= "Nie znaleziono aktualizacji"
LANG["UPDATE_NOTIFY_WINDOW_TITLE"]	= "Powiadomienie o aktualizacji"
LANG["UPDATE_RTBOX_APPEND"]					= "\n\nDla twojej informacji:\nKorzystasz z wersji: %s z poprawką: %s"
LANG["UPDATE_BTN_SEEFULL"]					= "Zobacz pełną listę zmian"

LANG["PHXM_ABOUT_LINKS"]						= "Linki i podziękowania"
LANG["PHXM_ABOUT_THANKS"]						= "Specjalne podziękowania za wsparcie, sugestie oraz pomoc dla:\n %s"
LANG["PHXM_ABOUT_BTN_DONATE"]				= "Wspomóż PH:X poprzez dotację"
LANG["PHXM_ABOUT_BTN_HOME"]					= "Strona domowa PHX"
LANG["PHXM_ABOUT_BTN_GITHUB"]				= "Repozytorium GitHub PHX"
LANG["PHXM_ABOUT_BTN_PLUGINS"]			= "Dodatki/Pluginy dla PHX"
LANG["PHXM_ABOUT_BTN_CHANGELOGS"]		= "Lista Zmian PHX"

--[[
	Late Additionals
]]
-- fretta
LANG["HUD_SPECTATING"]								= "OGLĄDASZ"
LANG["HUD_YOUDIED"]										= "Nie żyjesz!"

LANG["CHAT_STARTING_MAPVOTE"] 				= "Runda się zakończyła. Rozpoczynanie głosowania..."

-- This used for HUD Taunt Timer
LANG["HUD_PROP_TAUNT_TIME"]						= "Losowa podpowiedź"
LANG["HUD_PROP_CTAUNT_TIME"] 					= "Niest. podpowiedź"

LANG["PHXM_TAB_PLUGINS"]							= "Dodatki i pluginy"

-- Plugins Section
LANG["PLUGINS_NO_PLUGINS"]						= "Nie zainstalowano dodatków. Rozpocznij przeglądanie tutaj!"
LANG["PLUGINS_BROWSE_MORE"]						= "Przeglądaj dodatki"
LANG["PLUGINS_SERVER_HAS_NO_PLUGINS"]	= "A niech to! Ten serwer nie posiada żadnych dodatków ani pluginów"
LANG["PLUGINS_SERVER_SETTINGS"]				= "-- Ustawienia Serwera --"
LANG["PLUGINS_CLIENT_SETTINGS"]				= "-- Ustawienia Klienta --"

-- Text Entries
LANG["TEXTENTRY_FZ_SINGLE"] 					= "Ścieżka dźwięku zamrażania kamery" -- this one is for ph_fc_cue_path command
LANG["TEXTENTRY_MV_PREFIX"] 					= "Prefiks map dla Głosowania"			 -- the map previx for mv_map_prefix


--============= LATE ADDITION OF 29.10.21/X2Z. =============--
LANG["MISC_GAME_ENDED"]								= "Gra się zakończyła."

--============= LATE ADDITION OF 16.09.21/X2Z. =============--

--[[
	Credits: Late Addition: Revision: 16.09.21/X2Z
]]

LANG["PHXM_ABOUT_BTN_WIKI"]						= "Wiki i poradniki PHX"

--[[
	Auto Taunt: Late Addition: Revision: 16.09.21/X2Z
]]

LANG["HUD_AUTOTAUNT_DISABLED"]				= "Auto-podpowiedzi są wyłączone"
LANG["HUD_AUTOTAUNT_WAITFORUPDATE"]		=	"Synchronizowanie auto-podpowiedzi..."

--[[
	MapVote: Late Addition: Revision: 16.09.21/X2Z
]]
LANG["PHXM_MV_VOTEROCKED"]						= " Zwołano głosowanie za zmianą mapy, które rozpocznie się po zakończeniu rundy"
LANG["PHXM_MV_VOTEROCKED_IMMINENT"]		= "Nadchodzi głosowanie za zmianą mapy"
LANG["PHXM_MV_VOTEROCKED_PLY_TOTAL"]	= "%s chce rozpocząć głosowanie. ( %d / %d )"

LANG["PHXM_MV_MUST_WAIT"]							= "Musisz zaczekać przed głosowaniem!"
LANG["PHXM_MV_VOTEINPROG"]						= "Aktualnie trwa inne głosowanie!"
LANG["PHXM_MV_HAS_VOTED"]							= "Już zagłosowano za zmianą mapy!"
LANG["PHXM_MV_ALR_IN_VOTE"]						= "Głosowanie już było, mapa zostanie zmieniona!"
LANG["PHXM_MV_NEED_MORE_PLY"]					= "Potrzeba więcej graczy aby głosować za zmianą mapy!"

--[[
	Late Addition: Revision: 16.09.21/X2Z
]]
LANG["PROP_PLAYERMDL_BANNED"]					= "Twój niestandardowy model gracza dla drużyny Przedmiotów został zbanowany."

--[[
	Prop Menu/Prop Chooser, Revision: 16.09.21/X2Z
]]

LANG["PCR_USAGE_UNLIMIT"]				= "[Menu Przedmiotu] Masz **nielimitowaną** ilość użyć!"
LANG["PCR_USAGE_COUNT"]					= "[Menu Przedmiotu] Pozostałe użycia: %d"
LANG["PCR_PLS_WAIT"]						= "[Menu Przedmiotu] Zaczekaj %d sek."
LANG["PCR_NOROOM"]							= "[Menu Przedmiotu] Zby mało miejsca na zmianę w ten przedmiot!"
LANG["PCR_PROPBANNED"]					= "[Menu Przedmiotu] Ten przedmiot został zbanowany przez serwer."
LANG["PCR_PROPBANNED_BYPCR"]		= "[Menu Przedmiotu] Nie możesz się zamienić, ponieważ przedmiot nie jest dostępny dla Menu Przedmiotu."
LANG["PCR_REACHED_LIMIT"]				= "[Menu Przedmiotu] Osiągnięto limit!"
LANG["PCR_STAY_ON_GROUND"]			= "[Menu Przedmiotu] Musisz stać na ziemi i nie kucać!"
LANG["PCR_ONLY_GROUP"]					= "[Menu Przedmiotu] To menu jest dostępne tylko dla określonych grup!"
LANG["PCR_NOT_EXIST_COUNT"]			= "Wybrany przedmiot nie istnieje na tej mapie! ( %s / 4 )"
LANG["PCR_NOT_EXIST"]						= "Wybrany przedmiot nie istnieje na tej mapie!"

-- PCR Client section, reason why there is a space because of chat.AddText between args.
LANG["PCR_NOTIFY_1"]						= " Ten serwer używa Menu Przedmiotów w wersji %s! Wpisz "
LANG["PCR_NOTIFY_2"]						= " w konsoli, lub przejdź do menu pod F1 -> [Pomoc Wyboru Przedmiotów]"
LANG["PCR_CL_DISABLED"]					= " Ta opcja jest wyłączona."
LANG["PCR_CL_GROUP"]						= " To menu jest dostępne tylko dla określonych grup!"
LANG["PCR_CL_LIMIT"]						= " Osiągnięto limit!"
LANG["PCR_UNLIMIT_TEXT"]				= "Nielimitowane"
LANG["PCR_WINDOW_TITLE"]				= "Menu Przedmiotu PHX"
LANG["PCR_HEADER_TOP"]					= "Wybierz dowolny przedmiot. Posiadasz limit"
LANG["PCR_HEADER_MID"]					= "w wysokości %s"
LANG["PCR_HEADER_BOTTOM"]				= "w tej opcji wyboru przedmiotu"
LANG["PCR_CL_TOOLTIP_BANNED"]		= "Nie możesz użyć tego przedmiotu."
LANG["PCR_CL_TOOLTIP_MODEL"]		= "Model: %s"
LANG["PCR_CL_MENU_NOTREADY"]		= " Ta opcja nie jest dostępna w tym momencie."
LANG["PCR_WINDOW_GUIDE_TTL"]		= "Szybki poradnik: Jak używać Menu Przedmiotów"
LANG["PCR_BTN_HELP_MENU"]				= "Pomoc Menu Przedmiotów"

LANG["PCR_CL_CMDUSEULX"]				= " Ta komenda została wyłączona. Zamist tego, użyj \"ulx propmenu\"!"
LANG["PCR_CMD_ULX_DISABLED"]		= "Komenda \"ulx propmenu\" została wyłączona. Wciśnij [klawisz Menu Przedmiotu] w celu otwarcia." --input.GetKeyName is impossible to access.

LANG["PCR_EDT_IN_USE"]					= "Administrator wciąż modyfikuje dane przedmiotu. Zaczekaj!"
LANG["PCR_EDT_ERROR_DISABLED"]	= "[Menu Przedmiotu] Błąd: Opcja dodania własnego przedmiotu została wyłączona!"
LANG["PCR_EDT_NO_RIGHTS"]				= "Nie masz uprawnień by korzystać z tej opcji."

-- I'm actually exhausted and feel so burned out, but I'll update this in future, or in PH:Zero I guess.
-- Section: Custom Prop Editor File Browser and stuff...
-- LANG["PCR_EDT_XXX"] 	= "todo"
-- LANG["PCR_FB_XXX"] 	= "todo"

--[[
	Admin Section, Revision: 16.09.21/X2Z
]]
LANG["PHXM_PLAYER_PROP_CHOOSER_KEY"]	= "Domyślny klawisz dla Menu Przedmiotu (Wybór Przedmiotu)."
LANG["PHXM_PROP_FREEZE_MIDAIR"]				= "Domyślny klawisz do zawiśnięcia w powietrzu jako przedmiot."
LANG["PHXM_ADMIN_PROP_RIGHT_CLICK"]		= "Czy przedmioty również mogą odtwarzać podpowiedzi po wciśnięciu PPM?"
LANG["PHXM_ADMIN_TAUNT_SCANNER"]			= "(Wymaga przeładowania mapy) Włączyć skaner podpowiedzi?"
LANG["PHXM_ADMLBL_USABLE_ENTS"]				= "Rodzaje przedmiotów do wykorzystania"
LANG["PHXM_ADMLBL_USABLE_ENTS_REF"]		= "Dostępne opcje: 1: Tylko fizyczne, 2: Fizyczne i dynamiczne, 3: Prawie wszystko (nawet ciała), 4: Niestandardowe."
LANG["PHXM_ADMIN_USABLE_ENT_TYPE"]		= "Rodzaje przedmiotów do użycia w celu replikacji"
LANG["PHXM_ADMIN_NOTIFY_ENT_TYPE"]		= "Powiadamiaj Przedmioty o braku możliwości replikacji po wciśnięciu E. Działa tylko, gdy komenda 'ph_usable_prop_type' jest ustawiona na 3 lub 4."
LANG["NOTIFY_PROP_ENTTYPE"]						= "Interakcja [E], Replikacja [LPM]."
LANG["NOTIFY_CUST_ENT_TYPE_IS_ON"]		= "[PHX] Informacja: Wciśnij [E] w celu interakcji, wciśnij [LPM] w celu replikacji."

--[[
	Custom Taunts, Revision: 16.09.21/X2Z
]]
LANG["TM_TAUNTS_SEARCH_NOTHING"]			= "Nie znaleziono podpowiedzi zawierającej \"%s\"..."
LANG["TM_SEARCH_PLACEHOLDER"]					= "Szukaj w tej kategorii: Wpisz frazę, z małych liter bez maskowania. Puste pokazuje wszystko."

--[[
	Freeze Cam, Revision: 23.09.21/X2Z
]]
LANG["PHXM_ADMIN_FREEZECAM_HUNTER"]		= "Włącz opcję zamrażania kamery dla drużyny Łowców"

--============= LATE ADDITION OF 10.06.2022/X2Z. =============--
LANG["PHXM_MSG_INPUT_IS_EMPTY"]				= "Tekst jest pusty lub nie wciśnięto klawisza ENTER"
LANG["MISC_SET"]											= "Ustaw"
LANG["MISC_APPLY"]										= "Zastosuj"
LANG["MISC_NO"]												= "Nie"
LANG["MISC_YES"]											= "Tak"
LANG["MISC_WARN"]											= "Ostrzeżenie"
LANG["MISC_ERROR"]										= "Błąd"
LANG["MISC_INFO"]											= "Informacja"
LANG["MISC_NOTICE"]										= "Uwaga"
LANG["MISC_IDK"]											= "Nieznane"
LANG["MISC_NA"]												= "N/D"

-- HUD
LANG["HUD_DECOY_ACTIVE"]              = "Wciśnij [%s]"
LANG["HUD_FAKETAUNT_COUNT"]           = "Pozostało: %i"
LANG["HUD_FAKETAUNT_UNLI"]            = "Nielimitowane"
LANG["NOTICE_GRENADE_SMG_GIVEN"]      = "Otrzymano granat w SMG"

--[[
	ADMIN PANEL, Revision 10.06/2022/X2Z
]]--
LANG["PHXM_TAUNT_SETTINGS"]							= "Ustawienia Podpowiedzi"
LANG["PHXM_GENERAL_SETTINGS"]						= "Ogólne ustawienia"
LANG["PHXM_FAKE_TAUNT_SETTINGS"]				= "Ustawienia Sztucznej Podpowiedzi"
LANG["PHXM_FAKE_TAUNT_ENABLE"]					= "Zezwalaj, aby sztuczne podpowiedzi były odtwarzane na losowych przedmiotach na mapie. Dostępne tylko w Menu Podpowiedzi Niestandardowych."
LANG["PHXM_FAKE_TAUNT_MAXUSAGE"]				= "Maksymalna ilość użyć Sztucznych Podpowiedzi; -1 oznacza nielimitowane."
LANG["PHXM_TAUNT_RIGHT_CLICK"]		    	= "PPM do podpowiadania. Wyłączy to Menu Niestandardowych Podpowiedzi pod PPM."

LANG["PHXM_TAUNT_PITCH_SETTINGS"]				= "Ustawienia Tonacji Podpowiedzi"
LANG["PHXM_TAUNT_PITCH_ENABLE"]					= "Zezwól na zmianę tonacji podpowiedzi"
LANG["PHXM_TAUNT_PITCH_RANGE_MIN"]			= "Minimalne odcięcie/akceptowalny przedział tonacji dla podpowiedzi (1 - 99)."
LANG["PHXM_TAUNT_PITCH_RANGE_MAX"]			= "Maksymalne odcięcie/akceptowalny przedział tonacji dla podpowiedzi (100 - 255)."

LANG["PHXM_DECOY_SETTINGS"]							= "Ustawienia Wabienia"
LANG["PHXM_DECOY_ENABLE"]								= "Zezwolić na wabiki? Zostaną one przyznane TYLKO RAZ dla żyjących graczy do czasu zakończenia rundy. Po rozmieszczeniu, nie są dodawane nowe przedmioty, lecz przemieszczone."

LANG["PHXM_DISABLE_FOOTSTEP"]         	= "Przełącz ciche kroki w drużynie Przedmiotów"

LANG["PHXM_ADMIN_CHATSETTING"]					= "Ustawienia Okna Czatu"
LANG["PHXM_ADMIN_HUNTERBLIND"]					= "Ustawienia Oślepienia Łowców"

LANG["PHXM_ADMIN_GIVEGRENADE_NEAREND"]  = "Czy granaty SMG powinny być rozdawane pod koniec rundy? Jeżeli tak, zobacz komendę \"ph_give_grenade_roundend_before_time\""
LANG["PHXM_ADMIN_GIVEGRENADE_TIME"]     = "Czas w sekundach przed końcem rundy, w którym powinny zostać rozdane granaty SMG. Zazwyczaj 10 - 30 sek."

--[[
	Plugins in sh_init.lua, Revision 10.06/2022/X2Z
]]--
LANG["PLUG_NAME_VER"]										= "Dodatek: %s | v.%s"
LANG["PLUG_DESCRIPTION"]								= "Opis: %s"

--[[
	Taunt Pitch, Revision 10.06/2022/X2Z
]]--
LANG["PHX_CTAUNT_USE_PITCH"]						= "Używaj tonacji na niestandardowych podpowiedziach"
LANG["PHX_CTAUNT_RANDOM_PITCH"]					= "Używaj losowej tonacji na niestandardowych podpowiedziach"
LANG["PHX_RTAUNT_USE_PITCH"]						= "Używaj tonacji na losowych podpowiedziach [%s]"
LANG["PHX_RTAUNT_RANDOMIZE"]						= "Używaj losowej tonacji na losowych podpowiedziach [%s]"
LANG["PHX_CTAUNT_PITCH_FOR_FAKE"]				= "Używaj tonacji na sztucznych podpowiedziach"
LANG["PHX_CTAUNT_RANDPITCH_FOR_FAKE"]		= "Używaj losowej tonacji na sztucznych podpowiedziach"
LANG["PHX_CTAUNT_SLIDER_PITCH"]					= "Suwak tonacji podpowiedzi."
LANG["TM_TOOLTIP_FAKETAUNT"]						= "Odtwórz sztuczną podpowiedź na losowym przedmiocie"
LANG["TM_PREFERRED_PITCH"]              = "Preferowany poziom tonacji podpowiedzi"

--[[
	Fake Taunt, Revision 10.06/2022/X2Z
	Description: Play fake taunts on random props in the map (Not Players)
]]--
LANG["PHX_CTAUNT_ON_RAND_PROPS"]				= "Odtwórz na losowych przedmiotach (%ix)"
LANG["PHX_CTAUNT_ON_RAND_PROPS_UNLI"]		= "Odtwórz na losowych przedmiotach"
LANG["PHX_CTAUNT_PLAYED_ON_RANDPROP"]		= "Odtworzono podpowiedź na losowym przedmiocie."
LANG["PHX_CTAUNT_RAND_PROPS_LIMIT"]			= "Osiągnięto limit!"
LANG["PHX_CTAUNT_RAND_PROPS_NOT_PROP"]  = "Niedostępne w tym momencie."
LANG["PHX_CTAUNT_RANDPROP_DISABLED"]		= "Sztuczne Podpowiedzi są obecnie wyłączone."

--[[
	PH:Z Simple Decoy, Revision 10.06/2022/X2Z
]]--
LANG.DECOY_PROP	= {
	"zabija atrapę!",
	"ma wyrzuty za zabicie atrapy.",
	"zabija wabik.",
	"zabija niewinną atrapę.",
	"czuje zażenowanie po zabiciu atrapy."
}

LANG["DECOY_PUT_SUCC"]									= "Ustawiono wabik."
LANG["DECOY_CANT_PUT_HERE"]							= "Nie można ustawić tutaj wabika."
LANG["DECOY_GET_REWARD"]								= "Gratulacje! Otrzymujesz ['Wabik'] za przetrwanie rundy!"
LANG["DECOY_REMINDER_GET"]        			= "Posiadasz 'Wabik'! Rozstaw go gdzieś, aby zmylić przeciwnika!"
LANG["DECOY_FRAGS_RECEIVED"]						= "Twój wabik robi postępy: Zabrano 1 punkt od %s!"
LANG["DECOY_DISABLED"]									= "Aktualnie wabiki są niedostępne."
LANG["PHXM_CL_DECOY_KEYBIND"]						= "Domyślny klawisz do rozstawiania wabików. Domyślnie [1] (nie na klaw. num.)"

LANG["DECOY_INDICATOR_INVALID"]         = "Nieprawidłowe nachylenie!"
LANG["DECOY_INDICATOR_TOOFAR"]          = "Za daleko!"
LANG["DECOY_INDICATOR_OK"]              = "Rozstaw wabik [Wciśnij %s]"

LANG["PHXM_DECOY_HEALTH"]								= "Ile punktów zdrowia powinien posiadać wabik? Domyślnie: 10"
LANG["PHXM_PLAYER_SHOW_DECOY_HELPER"]   = "Pokaż/Ukryj pomoc podczas rozstawiania wabika. Będzie wyświetlana biała kropka oraz tekst w okolicy celownika."
LANG["PHXM_PLAYER_SHOW_DECOY_MARKER"]   = "Pokaż/Ukryj znacznik wabika."

--[[
	Revision 10.06/2022/X2Z
    Prop Menu Update: Menu, Editor, Browser
]]--
LANG["PCR_MODEL_DONT_EXISTS"]   				= "Przepraszamy, ale ten model nie jest aktualnie dostępny!"

LANG["PCR_PLUG_WARN_MSG"]								= "Ostrzeżenie: Opcja Niestandardowe Przedmioty (pcr_allow_custom) jest ustawiona na 0.\nAby edytować listę swoich przedmiotów należy włączyć tę opcję!\nAby zmienić to ustawienie wymagana jest zmiana mapy!"
LANG["PCR_PLUG_LBL_BINDKEY"]						= "Aby zmienić przypisany klawisz, przejdź do zakładki [GRACZ]."
LANG["PCR_PLUG_LBL_EDITOR"]							= "Edytor Niestandardowego Menu Przedmiotu"
LANG["PCR_PLUG_BTN_OPEN_EDT"]						= "Otwórz edytor"
LANG["PCR_PLUG_LBL_COMSET"]							= "Ustawienia wspólne"
LANG["PCR_PLUG_LBL_TECHSET"]						= "Ustawienia techniczne"
LANG["PCR_PLUG_LBL_EXPSET"]							= "Ustawienia eksperymentalne"
LANG["PCR_PLUG_LBL_PLAYERSET"]					= "Ustawienia gracza"

LANG["PCR_PLUG_ENABLE"]									= "Włącz opcję 'Menu Przedmiotu'"
LANG["PCR_PLUG_ALLOW_CUSTOM"]						= "(Wymaga zmiany mapy) Zezwalać na dodawanie własnych przedmiotów do Menu Przedmiotu?"
LANG["PCR_PLUG_PROP_BAN"]								= "(Wymaga zmiany mapy) Nie pokazywać zbanowanych przedmiotów w Menu Przedmiotu?"
LANG["PCR_PLUG_USAGE_LIMIT"]						= "Maksymalny limit użycia na gracza. -1 oznacza nielimitowane."
LANG["PCR_PLUG_PROP_LIMIT"]							= "(Wymaga zmiany mapy) Ogranicz ilość niestandardowych przedmiotów w Menu Przedmiotu"
LANG["PCR_PLUG_PROP_LIMITMAX"]					= "Maksymalna ilość przedmiotów, które zostaną losowo dodane na listę w Menu Przedmiotu."
LANG["PCR_PLUG_USE_ULXMENU"]						= "Czy menu przedmiotu powinno być dostępne z poziomu konsoli (0) czy ULX (1)? Przypisany klawisz będzie uwzględniał to ustawienie"
LANG["PCR_PLUG_USE_DELAY"]							= "Opóźnienie w sekundach, zanim gracz będzie mógł ponownie skorzystać z przedmiotu w Menu Przedmiotu"
LANG["PCR_PLUG_KICK_INVALID"]						= "Wyrzuć każdego gracza, który spróbuje skorzystać z nieprawidłowego przedmiotu (maks. 4 próby)"
LANG["PCR_PLUG_SPACE_CHECK"]						= "Sprawdź ilość dostępnego miejsca przed zmianą w przedmiot z Menu Przedmiotu, aby uniknąć utknięcia"
LANG["PCR_PLUG_X_BBOX"]									= "(Wymaga zmiany mapy) Sprawdź rozmiar granic przedmiotu (BBox) przed dodaniem na listę w Menu Przedmiotu"
LANG["PCR_PLUG_X_BBOX_MAX"]							= "Maksymalna wysokość granic przedmiotu (BBox)."
LANG["PCR_PLUG_X_BBOX_MIN"]							= "Maksymalna długość/szerokość granic przedmiotu (BBox)."
LANG["PCR_PLUG_ONLY_GROUPS"]						= "Czy Menu Przedmiotu powinno zostać ograniczone tylko do określonych grup (np. Wspornicy)?"
LANG["PCR_PLUG_NOTIFYMSG"]							= "Powiadamiaj graczu o sposobie korzystania z Menu Przedmiotu po rozpoczęciu każdej rundy"

LANG["PCR_EDITOR_MSG_ERROR"]						= "Twoje zmiany nie zostały zapisane z powodu błędu.\nSprawdź konsolę serwerową!"
LANG["PCR_EDITOR_MSG_SUCC"]							= "Twoje zmiany i dane niestandardowych przedmiotów zostały zapisane i zaktualizowane."

LANG["PHZ_generic_title"]								= "Edytor listy niestandardowych przedmiotów"
LANG["PHZ_generic_helptext"]						= [[[Jak korzystać:
[LEWY PANEL]
← Wybierz zawartość gry
← Kilknij w ikony, aby dodać modele na prawą stronę
← Kliknij PPM, aby otworzyć menu kontekstowe

[PRAWY PANEL]
→ Kliknij, aby 'zaznaczyć' przedmioty przed usunięciem
→ Wybierz 'Usuń wybrane' aby usunąć wybrane modele
→ Wybierz 'Zatwierdź wybór' aby zastosować zmiany

[INFO]
- Możesz dodać maksymalnie 2048 modeli.
- Wszystkie przedmioty z mapy zostaną automatycznie dodane, więc nie musisz tego robić.
- Wciśnięcie przycisku [Zamknij] spowoduje anulowanie operacji.
- Nie wszystkie modele będą posiadały prawidłowe VPhysics (fizykę).
- Nie wszyscy gracze (w tym Twój serwer) będą posiadali niestandardowe modele. Jeżeli modele nie istnieją, zostaną automatycznie usunięte po zastosowaniu zmian.
- Zawartość serwera może się różnić od twojej. Jeżeli widzisz "<gra> [Nie zamontowano]" w menu wysuwanym, oznacza to, że gra nie została zainstalowana/zamontowana.
- Wsparcie dla folderu 'Addons' nie zostało jeszcze dodane, więc musisz korzystać z opcji 'Cała zawartość'.
]]
LANG["PHZ_generic_mdlinfo"] 				= [[Informacje o modelu:
%s
Posiada fizykę: %s]]
LANG["PHZ_generic_mdlinfoStart"] 		= "(Najpierw wybierz model)"

LANG["PHZ_generic_no_ragdoll"]			= "Nie: Ragdoll"
LANG["PHZ_generic_titlelabel"]			= "%s podgląd :"

LANG["PHZ_mount_game_sel"]					= "Wybierz zamontowaną grę (Domyślnie: Garry's Mod)"
LANG["PHZ_input_placeholder1"]			= "Szukaj w folderze: <nazwa> lub '*', puste, aby zobaczyć wszystkie."
LANG["PHZ_input_placeholder2"]  		= "Szukaj dodatku: <nazwa> lub '*', puste, aby zobaczyć wszystkie."
LANG["PHZ_msg_warn_close"]					= "Czy na pewno chcesz zamknąć to okno? Wszystkie niezapisane zmiany zostaną utracone!"
LANG["PHZ_msg_commit"] 							= "Czy na pewno chcesz zastosować zmiany?"
LANG["PHZ_msg_cant_empty"]					= "Lista przedmiotów nie może być pusta!"
LANG["PHZ_msg_removesel"] 					= [[Usuń wybrane przedmioty na liście. Legenda:
Czerwony = Zaznaczone przedmioty
Żółty: Przedmioty nie istnieją na serwerze i powinny zostać usunięte.]]
LANG["PHZ_msg_warn_mdlinlist"]  		= "OSTRZEŻENIE: Ten model znajduje się już na liście!"
LANG["PHZ_msg_invalid_mdl"] 				= "Powód: Ten model jest nieprawidłowy"
LANG["PHZ_apply_select"] 						= "Zastosuj i zapisz wybrane przedmioty"
LANG["PHZ_menu_copy"] 							= "Kopiuj model"
LANG["PHZ_menu_refresh"] 						= "Odśwież Model"
LANG["PHZ_tooltip_removesel"]				= "Usuń zaznaczone"
LANG["PHZ_tooltip_wasmarked"] 			= [[Ten przedmiot został oznaczony, ponieważ nie istnieje on na serwerze.
Po zamknięciu tego edytora, zostanie on automatycznie usunięty.]]

LANG["PHZ_pcr_fb_allcontent"] 			= "Cała zawartość (Nie każdy gracz/serwer będzie posiadał taką samą zawartość co ty)"
LANG["PHZ_pcr_fb_notmounted"] 			= "%s [Nie zamontowano]"

PHX.LANGUAGES[LANG.code] = LANG
