local L={}

-- Last updated: June 23, 2022

L.code 				= "pl_pl"

L.Name 		 		= "Polski"
L.NameEnglish	= "Polish"
L.Author				= "Pawelxxdd"
-- Can Accept: String, and Table.
L.AuthorURL		= {"https://steamcommunity.com/profiles/76561198114876117"}

-- Special Section that isn't String-based
L.SUICIDEMSG = {
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

L.RANDOM_SPECTATORS = { --> FRETTA
	"aby odpocząć.",
	"aby patrzeć jak się bawicie.",
	"w roli Wielkiego Brata.",
	" ",
}

L["PHX_TEAM_CONNECTING"] 	= "Dołącza"
L["PHX_TEAM_PROPS"]				= "Przedmioty"
L["PHX_TEAM_HUNTERS"] 			= "Łowcy"
L["PHX_TEAM_UNASSIGNED"]		= "Nieprzypisany"
L["PHX_TEAM_SPECTATOR"] 		= "Widz"

-- List of string-based translation

-- ////////////////////////////
-- // FRETTA SECTION
-- ////////////////////////////

-- Kill text (X killed Y)
L["HUD_KILLED"]			= "zabija"

-- FRETTA: HUDs
L["HUD_TIME"] 				= "CZAS"
L["HUD_ROUND"]				= "RUNDA"
L["HUD_WAITPLY"]			= "Oczekiwanie na graczy..."
L["HUD_DEAD"]				= "(TRUP) "

L["HUD_TEAMWIN"]			= "%s wygrywają!"
L["HUD_LOSE"]				= "Remis, nikt nie zyskuje!"
L["MISC_TIMELEFT"]		= "Pozostały Czas: %s"
L["MISC_GAMEEND"] 		= "Gra zostanie zakończona po tej rundzie"

-- FRETTA: Team selection screen (F2)
L["DERMA_TEAMSELECT"]		= "Wybierz drużynę"

-- FRETTA: F1 screeen
L["DERMA_RTV"] 					= "Głosowanie Za Zmianą (RTV)"
L["DERMA_PHMENU"] 				= "Menu Prop Hunt"
L["DERMA_CHANGETEAM"]		= "Wybierz drużynę"

-- FRETTA: Scoreboard
L["DERMA_PLAYER"]						= "(%d gracz)"
L["DERMA_PLAYERS"]						= "(%d graczy)"
L["DERMA_NAME"]							= "Nazwa"
L["DERMA_KILLS"]							= "Zabójstwa"
L["DERMA_DEATHS"]						= "Śmierci"
L["DERMA_PING"]							= "Ping"
L["DERMA_SERVER_TAG"]				= "SV"
L["DERMA_BOT_TAG"]						= "BOT"
L["DERMA_GAMEMODE_CREDITS"]	= "%s | Wersja: %s - Poprawka %s"

L["CHAT_JOINED"]					= " dołącza do "
L["CHAT_JOINEDTHE"]			= " dołącza do drużyny "

L["CHAT_SWAPBALANCE"]		= "Przeniesiono gracza %s do %s w ramach autobalansowania drużyn."
L["CHAT_SWAPBALANCEYOU"]	= "Przeniesiono Cię w ramach autobalansowania drużyn. Miłej służby!"

-- FRETTA: Splash Starting Screen
L["SPASHSCREEN_BY_X"]		= "Od %s"
-- RichTextBox
L["HELP_DONATORS_AND_CONTRIBUTORS"]  = "\n\nWspornicy i współtwórcy:\n- %s"

-- ////////////////////////////
-- // END OF FRETTA SECTION
-- ////////////////////////////




L["HELP_F1"] 				= [[Prop Hunt (Nazwa Kodowa) Projekt X.

Projekt, który uczyni Prop Hunt X nowoczesnym i konfigurowalnym.

Więcej informacji znajdziesz tutaj:
https://gmodgameservers.com/prophuntx

Informacje, pomoc oraz poradniki znajdziesz, klikając przycisk [F1], a następnie przechodząc do [Menu Prop Hunt].

Wersja: ]].. PHX.VERSION ..[[ Poprawka: ]].. PHX.REVISION ..[[

Miłej zabawy!]]

-- Important!
L["LANGUAGE_CHANGED"]			= "Preferowany język został zmieniony na %s"

-- internal cl_menutypes section.
L["SUBTYPE_PREFERED_LANG"]	= "Preferowany język"
--L["SUBTYPE_TEXTENTRY_?"]	= "???"

-- Events
L["EV_PLAYER_CONNECT"]			= "%s rozpoczyna połączenie z serwerem."
L["EV_PLAYER_JOINED"]			= "%s pojawia się na serwerze."
L["EV_PLAYER_DISCONNECT"]	= "%s opuszcza grę (Powód: %s)"

-- HUD elements
L["HUD_HP"]							= "ZDROWIE"
L["HUD_AMMO"] 						= "AMMO"	-- obsolete
L["HUD_MAGSEC"]					= "MAG. / REZ." --Magazine Counts (separator) Secondary Magazine Counts

-- !!WEAPON NAMES CANNOT BE TRANSLATED, THEY USE FROM language.GetPhrase THEREFORE IT'S IMPOSSIBLE TO DO.

L["TEAM_PROPS"]					= L["PHX_TEAM_PROPS"]
L["TEAM_HUNTERS"]				= L["PHX_TEAM_HUNTERS"]

L["HUD_ROTLOCK"]					= "Obracanie Przedmiotu: Zablokowane"
L["HUD_ROTFREE"]					= "Obracanie Przedmiotu: Odblokowane"
L["HUD_KILLEDBY"]				= "%s likwiduje cię!"

L["HUD_AUTOTAUNT"]				= "Auto-podpowiedź za %d sek."
L["HUD_AUTOTAUNT_ALT"]		= "Auto-podpowiedź za %d"

L["HUD_TargetID"]				= "Gracz: %s (%d%%)" -- Player: <NAME> (<HEALTH>%)

L["HUD_BLINDED"]					= "%s zaczną poszukiwania za %s"
L["HUD_UNBLINDED"]				= "Gotowi czy nie, nadchodzimy!"

L["BLIND_RESPAWN_TEAM"]	= "Odradzasz się tylko w drużynie %s po %d sek. trwania czasu chowania."
L["BLIND_RESPAWN"]				= "Odradzasz się po %d sek. trwania czasu chowania."

L["MISC_ACCEPT"]					= "Akceptuj"
L["MISC_OK"]							= "OK"
L["MISC_CLOSE"]					= "Zamknij"
L["MISC_PREV"]						= "< WSTECZ"
L["MISC_NEXT"]						= "DALEJ >"
L["MISC_ACCESSDENIED"]		= "Dostęp Zabroniony"

-- Chat messages
L["CHAT_NOPLAYERS"]					= "Zbyt mało graczy by rozpocząć grę!"
L["CHAT_SWAP"]								= "Drużyny zostały zamienione!"

L["CHAT_SWAPTEAM_WARNING"] 	= "Zmieniono drużynę %d razy. Po przekroczeniu limitu (%d), nie będzie już można zmienić drużyny."
L["CHAT_SWAPTEAM_REVERT"]		= "Nie możesz dołączyć do drużyny %s, ponieważ osiągnięto już limit zmian drużyny."

L["CHAT_PROP_NO_ROOM"] 			= "Zbyt mało miejsca, aby się zamienić!"

-- Notification
L["NOTIFY_IN_PROP_TEAM"]			= "Jesteś w drużynie Przedmiotów z możliwością obracania przedmiotu! Możesz to robić poprzez ruszanie myszką."
L["NOTIFY_ROTATE_NOTICE"]		= "Dodatkowo, możesz zablokować obracanie się, klikając (domyślnie) przycisk [R]!"

-- Custom Taunt Window
L["TM_WARNING_CT_DISABLE"]		= "[PHX - Podpowiedzi] Ostrzeżenie: Serwer nie dopuszcza niestandardowych podpowiedzi."
L["TM_NO_TAUNTS"]						= "Ostrzeżenie: Nie znaleziono niestandardowych podpowiedzi we wskazanym katalogu."
L["TM_PLAY_ONLY_ALIVE"] 			= "Nie możesz odtwarzać podpowiedzi, kiedy jesteś trupem."

L["TM_WINDOW_TITLE"]					= "Prop Hunt - Niestandardowe podpowiedzi"
L["TM_NOTICE_PLSWAIT"]				= "Zaczekaj %s sek. zanim zakończy się losowa podpowiedź!"
L["TM_NOTICE_PLAYPREVIEW"]		= "Podgląd podpowiedzi: %s"

L["TM_TOOLTIP_PLAYTAUNT"] 		= "Odtwórz podpowiedź"
L["TM_TOOLTIP_PREVIEW"]			= "Przesłuchaj podpowiedź przed globalnym odtworzeniem"
L["TM_TOOLTIP_PLAYCLOSE"]		= "Odtwórz podpowiedź i zamknij okno"
L["TM_TOOLTIP_PLAYRANDOM"]		= "Odtwórz losową podpowiedź"
L["TM_TOOLTIP_CLOSE"]				= "Zamknij"
L["TM_MENU_CLOSE"]						= "Zamknij Menu"

L["TM_DELAYTAUNT_NOT_EXIST"] = "Wybrana podpowiedź, nie istnieje na serwerze!"
L["TM_DELAYTAUNT_PLSWAIT"]		= "Zaczekaj %s sek."

--[[
	PHX Menu window
]]
L["PHXM_WINDOW_TITLE"]				= "Prop Hunt X - Zaawansowane ustawienia"
L["SERVER_INFO_MOTD"]				= "INFORMACJE I ZASADY [MOTD]"

L["PHXM_TAB_HELP"]						= "Pomoc i poradniki"
L["PHXM_TAB_MUTE"]						= "Wycisz graczy"
L["PHXM_TAB_PLAYER"]					= "Ustawienia gracza"
L["PHXM_TAB_MODEL"] 					= "Modele gracza"
L["PHXM_TAB_MODEL_DISABLED"]	= "Modele gracza (Wyłączono)"
L["PHXM_TAB_ADMIN"]					= "Ustawienia Administratora"
L["PHXM_TAB_ABOUT"]					= "Informacje o Prop Hunt X"
L["PHXM_TAB_MAPVOTE"]				= "Ustawienia Głosowania"

L["PHXM_CVAR_CHANGED"]				= "[Ustawienia] Wartość CVAR %q została zmieniona na %q"

--[[
	Player Mute Settings
]]
L["PHXM_MUTE_SELECT"]				= "Wybierz gracza, którego chcesz wyciszyć."

--[[
	Player Settings
]]
L["PHXM_PLAYER_OPTIONS"]							= "Opcje Gracza"
L["PHXM_PLAYER_LANG"]								= "Język"
L["PHXM_PLAYER_BIND"]								= "Mapowanie klawiszy"
L["PHXM_PLAYER_HUDSETTINGS"]					= "Ustawienia Interfejsu"

L["PHXM_PLAYER_TAUNT_KEY"]						= "Klawisz losowej podpowiedzi"
L["PHXM_PLAYER_TAUNTWINDOW_KEY"]			= "Klawisz okna z listą podpowiedzi"
L["PHXM_PLAYER_ROTATLOCK_KEY"]				= "Klawisz blokady obracania przedmiotu"

L["PHXM_PLAYER_TOGGLE_HALOS"]				= "Przełącz efekt podświetlenia po spojrzeniu na przedmiot"
L["PHXM_PLAYER_IDNAMES"]							= "Pokaż nazwy graczy nad ich głowami (również przez ściany)"
L["PHXM_PLAYER_ENDROUND_CUE"]				= "Odtwarzaj dźwięk końca rundy"
L["PHXM_PLAYER_TAUNTMENU_AUTOCLOSE"]	= "Automatycznie zamykaj okno podpowiedzi po podwójnym kliknięciu na podpowiedź"
L["PHXM_PLAYER_SEE_HUNTER_LINE"]			= "Rysuj linię wzroku łowców podczas obserwowania rozgrywki."
L["PHXM_PLAYER_SEE_LBALL_ICONS"]			= "Pokazuj ikonę 'Kulek szczęścia' kiedy pojawią się one na mapie"
L["PHXM_PLAYER_SEE_CRYSTAL_ICONS"]		= "Pokazuj ikonę 'Diabelskich kulek' kiedy pojawią się one na mapie"

L["PHXM_PLAYER_USE_NEW_HUD"]					= "Użyj nowego interfejsu PH:E"
L["PHXM_PLAYER_SHOW_TUTOR"]					= "Pokaż okno poradnika (Tylko 2 razy za każdym odrodzeniem jako przedmiot)"
L["PHXM_PLAYER_USE_NEW_CROSSHAIR"]		= "Włącz niestandardowy celownik"
L["PHXM_PLAYER_SHOW_TEAM_TOPBAR"]		= "Pokazuj liczbę żywych graczy w lewym, górnym rogu (Wymaga przynajmniej 4 graczy na serwerze)"

--[[
	Player model Browser Section
]]
L["QUERY_MODEL_SELECTED"]		= "Model %s został wybrany i zostanie użyty przy następnym odrodzeniu!"
L["QUERY_MODEL_INFO"]				= "Nazwa modelu: %s - Dostępne dla wszystkich"

L["MDL_MENU_REFRESH"] 				= "Odśwież ikonę"
L["MDL_MENU_PREVIEW"] 				= "Podgląd modelu"
L["MDL_MENU_MODELINFO"] 			= "Informacje o modelu"


L["MISC_APPLYMDL"] 					= "Wybierz model"

L["PHXM_MODEL_DISABLED"] 		= "O nie! Niestandardowe modele gracza zostały wyłączone na tym serwerze!"
L["PHXM_PLAYERMODEL_SETFOV"]	= "  Ustaw FOV (pole widzenia)"

--[[
	Server Settings
]]
L["PHXM_ADMIN_OPTIONS"]			= "Opcje trybu po stronie serwera (Widoczne tylko dla administratorów i właścicieli)"
L["PHXM_ADMIN_MUSTALIVE"]		= "Musisz być po stronie żywych, aby móc dokonać tej czynności."

--[[
	Language Override
]]
L["PHXM_ADMIN_LANGOVERRIDE"]					= "Wymuszenie Języka"

L["PHXM_ADMIN_FORCELANG"] 						= "Wymusić język interfejsu? Spowoduje to zastosowanie okreslonego z góry języka u wszystkich graczy, mimo ich preferencji."
L["PHXM_ADMIN_LANGTOUSE"]						= "Wymuszony język."
L["PHXM_ADMIN_PLAYERDEFAULTLANG"] 		= "Domyślny język gracza podczas pierwszego połączenia."

-- Gameplay settings
L["PHXM_ADMIN_CUSTOM_MODEL"]					= "Zezwalaj na niestandardowe modele w drużynie Łowców"
L["PHXM_ADMIN_CUSTOM_MODEL_PROP"]		= "Zezwalaj na niestandardowe modele w drużynie Przedmiotów - Upenij się, że Łowcy też mają tą przyjemność!"
L["PHXM_ADMIN_TAUNT_DELAY_CUSTOM"]		= "Czas (w sekundach) między odtwarzanymi niestandardowymi podpowiedziami"
L["PHXM_ADMIN_TAUNT_DELAY_RANDOM"]		= "Czas (w sekundach) między odtwarzanymi zwykłymi podpowiedziami"
L["PHXM_ADMIN_TAUNT_DELAY_AUTO"]			= "Czas (w sekundach), po którym zostanie odtworzona Automatyczna Podpowiedź"
L["PHXM_ADMIN_AUTOTAUNT_ENABLE"]			= "Włącz Automatyczną Podpowiedź"

L["PHXM_ADMIN_NOTICE_ROTATION"]			= "Pokazuj informację o możliwości zablokowania obracania za każdym odrodzeniem w drużynie Przedmiotów"
L["PHXM_ADMIN_CAMERA_COLLIDE"]				= "Włącz kolizję kamery na ścianach"
L["PHXM_ADMIN_FREEZECAM"]						= "Włącz wstrzymanie kamery w drużynie Przedmiotów"
L["PHXM_ADMIN_PROP_COLLIDE"]					= "Włącz kolizję graczy w drużynie Przedmiotów"
L["PHXM_ADMIN_SWAP_TEAM"] 						= "Zamieniaj drużyny po każdej rundzie - wyłączenie spowoduje, że drużyny pozostaną takie same na zawsze (no... może do zakończenia mapy)"
L["PHXM_ADMIN_HUNTER_PENALTY"]				= "Kara dla Łowców za strzał w nieprawidłowy cel"
L["PHXM_ADMIN_HUNTER_KILL_BONUS"]		= "Bonus dla Łowców za zabicie Przedmiotu"
L["PHXM_ADMIN_HUNTER_SMG_GRENADES"]	= "Ilość granatników SMG dla Łowców"
L["PHXM_ADMIN_GAME_TIME"]						= "Czas gry (w minutach)"
L["PHXM_ADMIN_BLINDLOCK_TIME"]				= "Czas na chowanie się (w sekundach)"
L["PHXM_ADMIN_ROUND_TIME"]						= "Czas rudny (w sekundach)"
L["PHXM_ADMIN_ROUNDS_PER_MAP"]				= "Ilość rund na mapę"
L["PHXM_ADMIN_ENABLE_LUCKYBALL"]			= "Zezwalaj na towrzenie się Kulek Szczęścia po zniszczeniu przedmiotu (Szansa na pojawienie się: 8%)"
L["PHXM_ADMIN_ENABLE_CRYSTAL"]				= "Zezwalaj na tworzenie się Diabelskich Kulek po śmierci Łowcy (Szansa na pojawienie się: 70%)"
L["PHXM_ADMIN_WAIT_PLAYERS"]					= "Czekaj na graczy zanim zacznie się rozgrywka"
L["PHXM_ADMIN_WAIT_MIN_PLAYERS"]			= "Minimalna ilość graczy, aby czekać za rozpoczęciem rozgrywki (domyślnie: 1)"
L["PHXM_ENABLE_PLAYER_JOIN_LEAVE"] 	= "Włączyć informacje o dołączaniu lub odłączaniu się graczy? Ustaw na 0 jeżeli chcesz użyć własnej modyfikacji czatu."

L["PHXM_ADMIN_FORCEJOINBALANCE"]			= "Wymuś wyrównanie drużyn podczas dołączania graczy."
L["PHXM_ADMIN_ENABLETEAMBALANCE"]		= "Automatycznie wyrównaj drużyny na początku rundy (Balansowanie Drużyn)"
L["PHXM_ADMIN_PICKUP_PROPS"] 				= "Zezwalaj na podnoszenie małych przedmiotów? 0: Nie zezwalaj, 1: Tylko Łowcy, 2: Tylko Przedmioty, 3: Zezwalaj wszystkim."

L["PHXM_ADMIN_TAUNTMODES"]			= "Tryby Podpowiedzi"
L["PHXM_ADMIN_TAUNTMODE_MODE"]	= "--[Aktualny tryb: %d ]--"
L["PHXM_ADMIN_TAUNTMODE0"]			= "Tryb [0]: F3/Losowa Podpowiedź"
L["PHXM_ADMIN_TAUNTMODE1"]			= "Tryb [1]: C/Niestand. Podpowiedź"
L["PHXM_ADMIN_TAUNTMODE2"]			= "Tryb [2]: Obydwa tryby"
L["PHXM_ADMIN_TAUNTSOPEN"]			= "Otwórz okno podpowiedzi"

L["PHXM_MODE_DEFAULT"] 				= "--[ Tryb Podnosz. Przedm. %d ]--"
L["PHXM_MODE0"]								= "Tryb [0]: Nie zezwalaj"
L["PHXM_MODE1"]								= "Tryb [1]: Tylko Łowcy"
L["PHXM_MODE2"]								= "Tryb [2]: Tylko Przedmioty"
L["PHXM_MODE3"]								= "Tryb [3]: Zezwalaj wszystkim"

--[[
	Admin Developer Sections
]]
L["PHXM_ADMIN_DEVSECTION"]				= "Opcje Deweloperskie/Eksperymenty"
L["PHXM_ADMIN_ROOMCHECK"]				= "Włączyć sprawdzanie rozmiaru przedmiotu? Ochroni to przed niechcianym zablokowaniem się w ścianie/innym przedmiocie."
L["PHXM_ADMIN_USENEWMKBREN"]			= "Użyj nowego modelu broni Bren MK II (Wymaga Zmiany Mapy)"
L["PHXM_ADMIN_BEVERBOSE"]				= "Developer: Zezwalaj PH:X na wyświetlanie wszystkich informacji deweloperskich (dosłownie)?"
L["PHXM_ADMIN_SHOWPLNAMEHEAD"]		= "Zezwalaj na pokazywanie nazw graczy z drużyny przez ściany."
L["PHXM_ADMIN_USESINGLE_FZCAM"]	    = "Użyj jednego dźwięku Zamrożenia Kamery zamiast całej listy (Zobacz 'ph_fc_cue_path', aby odkryć ścieżkę dźwięku)"
L["PHXM_ADMIN_MODELLISTINGTYPE"]     = "Użyj starszej wersji listy modeli: 0: Wszystkie modele gracza, 1: Użyj starszej wersji: list.Get('PlayerOptionsModel')"
L["PHXM_ADMIN_JUMPPOWER"]				= "Mnożnik wysokości skoku w drużynie Przedmiotów"
L["PHXM_ADMIN_ENABLE_OBB"]				= "Developer: Zezwalaj na modyfikowane granice przedmiotu zapisane w danych konfiguracyjnych (OBB)"
L["PHXM_ADMIN_RELOAD_OBB"]				= "Developer: Przeładuj dane pliku konfiguracyjnego za każdym razem, kiedy rozpoczyna się runda (OBB)"

--[[
	Experimental & PH:X Features
]]
L["PHXM_ADMIN_EXPERIMENTALPHX"]					= "Nowe, eksperymentalne możliwości PHX"

L["PHXM_ADMIN_HLA_COMBINE"]							= "Wsparcie dla nowego modelu Kombinatu z HLA"
L["PHXM_ADMIN_TEAMBALANCE"]							= "Włącz Balanoswanie Drużyn"
L["PHXM_ADMIN_CHANGETEAM_LIMIT"]					= "Ogranicz ilość zmian drużyn. Ustaw na -1 aby wyłączyć. "
L["PHXM_ADMIN_USENEWCHAT"]								= "Użyj nowego czatu (eChat) - Jest to tymczasowy zamiennik. Jeżeli już jakiś posiadasz, nie zmieniaj tej wartości."
L["PHXM_ADMIN_NEWCHATPOS"]								= "Pozycja nowego czatu: Przesuń w górę (względem osi Y) o wskazaną ilość pikseli."
L["PHXM_ADMIN_RESPAWNONBLIND"]						= "Zezwalaj na odradzanie się podczas czasu chowania się."
L["PHXM_ADMIN_RESPAWNONBLIND_TEAM"]			= "Zezwalaj na odradzanie się podczas czasu chowania się w konkretnej drużynie. 0: Wszyscy, 1: Łowcy, 2: Przedmioty"
L["PHXM_ADMIN_REWSPANTIMEPERCENT"]				= "Porcent czasu chowania się, przed którym można się odrodzić. Domyślnie: 0.75 (Po 75% Czasu Chowania Się, nie można się odrodzić)"
L["PHXM_ADMIN_ALLOWRESPAWN_SPECTATOR"]		= "Zezwól na odrodzenie się podczas czasu chowania się, kiedy gracz przychodzi z drużyny Obserwatorów."
L["PHXM_ADMIN_ALLOWRESPAWN_TEAMCHANGE"]	= "Zezwól na odrodzenie się podczas czasu chowania się, kiedy gracz przychodzi z przeciwnej drużyny."

--[[
	MapVote Settings
]]
L["PHXM_MV_SETTINGS"]					= "Ustawienia Głosowań"

L["PHXM_MV_ALLOWCURMAP"]				= "Zezwalaj, aby aktualna mapa była używana w głosowaniu"
L["PHXM_MV_COOLDOWN"]					= "Włącz ograniczenie przed rozpoczęciem głosowania"
L["PHXM_MV_USE_ULX_VOTEMAPS"]	= "Użyć map określonych na liście ULX? Jeżeli nie, wszystkie mapy w ścieżce maps/*.bsp zostaną użyte."
L["PHXM_MV_MAPLIMIT"]					= "Ilość map dostępnych w głosowaniu."
L["PHXM_MV_TIMELIMIT"]					= "Czas na głosowanie"
L["PHXM_MV_MAPBEFOREREVOTE"]		= "Ilość zmian map wymaganych, aby konkretna mapa ponownie pokazała się w głosowaniu."
L["PHXM_MV_RTVCOUNT"]					= "Mimalna ilość graczy wymagana do RTV (Głosowanie Za Zmianą)"

L["PHXM_MV_EXPLANATION1"]			= "Aby określić, które mapy powinny być użyte, ustaw zmienną (dla przykładu) [ mv_map_prefix 'phx_,ph_,cs_,de_' ] w konsoli."
L["PHXM_MV_EXPLANATION2"]			= "Jeżeli używasz ULX, użyj map_vote. Jeżeli nie, użyj mv_start."
L["PHXM_MV_EXPLANATION3"]			= "Akcja Głosowania (Aby anulować, po prostu wpisz !unmap_vote (dla ULX) lub w konsoli: mv_stop)"

L["PHXM_MV_START"]		= "Rozpocznij Głosowanie"
L["PHXM_MV_STOP"]		= "Zatrzymaj Głosowanie"
--                  				  ^ HEJ, TO ŁAMANIE PRAWA!


--[[
	Versioning, Credits or About section
]]
L["PHXM_ABOUT_VERSIONING"]				= "Wersja: %s - Poprawka: %s"
L["PHXM_ABOUT_AUTHOR"]						= "Autor: %s"
L["PHXM_ABOUT_ENJOYING"]					= "Jeżeli podoba ci się rozgrywka, pomyśl o dotacji!"
L["PHXM_ABOUT_UPDATE"]						= "Aktualizacje Prop Hunt X"

L["PHXM_VIEW_UPDATE_INFO"]				= "Zobacz informacje o aktualizacji"
L["PHXM_CHECK_FOR_UPDATES"]			= "Sprawdź dostępność aktualizacji"
L["PHXM_UPDATE_FOUND_TEXT"]			= "Dostępna jest aktualizacja. Zobacz konsolę po więcej informacji.\n\nCzy chcesz zobaczyć co się zmieniło?"
L["PHXM_UPDATE_FOUND_TITLE"]   	= "Informacje o aktualizacji"
L["PHXM_UPDATE_FOUND_BUTTON"]   	= "Zobacz aktualizację"
L["UPDATE_NOTIFY_MSG_NOTFOUND"]	= "Nic nie znaleziono. Najpierw kliknij przycisk \"Sprawdź dostępność aktualizacji\"!"
L["UPDATE_NOTIFY_MSG_TITLE"]			= "Nie znaleziono aktualizacji"
L["UPDATE_NOTIFY_WINDOW_TITLE"]	= "Powiadomienie o aktualizacji"
L["UPDATE_RTBOX_APPEND"]					= "\n\nDla twojej informacji:\nKorzystasz z wersji: %s z poprawką: %s"
L["UPDATE_BTN_SEEFULL"]					= "Zobacz pełną listę zmian"

L["PHXM_ABOUT_LINKS"]						= "Linki i podziękowania"
L["PHXM_ABOUT_THANKS"]						= "Specjalne podziękowania za wsparcie, sugestie oraz pomoc dla:\n %s"
L["PHXM_ABOUT_BTN_DONATE"]				= "Wspomóż PH:X poprzez dotację"
L["PHXM_ABOUT_BTN_HOME"]					= "Strona domowa PHX"
L["PHXM_ABOUT_BTN_GITHUB"]				= "Repozytorium GitHub PHX"
L["PHXM_ABOUT_BTN_PLUGINS"]			= "Dodatki/Pluginy dla PHX"
L["PHXM_ABOUT_BTN_CHANGELOGS"]		= "Lista Zmian PHX"

--[[
	Late Additionals
]]
-- fretta
L["HUD_SPECTATING"]								= "OGLĄDASZ"
L["HUD_YOUDIED"]										= "Nie żyjesz!"

L["CHAT_STARTING_MAPVOTE"] 				= "Runda się zakończyła. Rozpoczynanie głosowania..."

-- This used for HUD Taunt Timer
L["HUD_PROP_TAUNT_TIME"]						= "Losowa podpowiedź"
L["HUD_PROP_CTAUNT_TIME"] 					= "Niest. podpowiedź"

L["PHXM_TAB_PLUGINS"]							= "Dodatki i pluginy"

-- Plugins Section
L["PLUGINS_NO_PLUGINS"]						= "Nie zainstalowano dodatków. Rozpocznij przeglądanie tutaj!"
L["PLUGINS_BROWSE_MORE"]						= "Przeglądaj dodatki"
L["PLUGINS_SERVER_HAS_NO_PLUGINS"]	= "A niech to! Ten serwer nie posiada żadnych dodatków ani pluginów"
L["PLUGINS_SERVER_SETTINGS"]				= "-- Ustawienia Serwera --"
L["PLUGINS_CLIENT_SETTINGS"]				= "-- Ustawienia Klienta --"

-- Text Entries
L["TEXTENTRY_FZ_SINGLE"] 					= "Ścieżka dźwięku zamrażania kamery" -- this one is for ph_fc_cue_path command
L["TEXTENTRY_MV_PREFIX"] 					= "Prefiks map dla Głosowania"			 -- the map previx for mv_map_prefix


--============= LATE ADDITION OF 29.10.21/X2Z. =============--
L["MISC_GAME_ENDED"]								= "Gra się zakończyła."

--============= LATE ADDITION OF 16.09.21/X2Z. =============--

--[[
	Credits: Late Addition: Revision: 16.09.21/X2Z
]]

L["PHXM_ABOUT_BTN_WIKI"]						= "Wiki i poradniki PHX"

--[[
	Auto Taunt: Late Addition: Revision: 16.09.21/X2Z
]]

L["HUD_AUTOTAUNT_DISABLED"]				= "Auto-podpowiedzi są wyłączone"
L["HUD_AUTOTAUNT_WAITFORUPDATE"]		=	"Synchronizowanie auto-podpowiedzi..."

--[[
	MapVote: Late Addition: Revision: 16.09.21/X2Z
]]
L["PHXM_MV_VOTEROCKED"]						= " Zwołano głosowanie za zmianą mapy, które rozpocznie się po zakończeniu rundy"
L["PHXM_MV_VOTEROCKED_IMMINENT"]		= "Nadchodzi głosowanie za zmianą mapy"
L["PHXM_MV_VOTEROCKED_PLY_TOTAL"]	= "%s chce rozpocząć głosowanie. ( %d / %d )"

L["PHXM_MV_MUST_WAIT"]							= "Musisz zaczekać przed głosowaniem!"
L["PHXM_MV_VOTEINPROG"]						= "Aktualnie trwa inne głosowanie!"
L["PHXM_MV_HAS_VOTED"]							= "Już zagłosowano za zmianą mapy!"
L["PHXM_MV_ALR_IN_VOTE"]						= "Głosowanie już było, mapa zostanie zmieniona!"
L["PHXM_MV_NEED_MORE_PLY"]					= "Potrzeba więcej graczy aby głosować za zmianą mapy!"

--[[
	Late Addition: Revision: 16.09.21/X2Z
]]
L["PROP_PLAYERMDL_BANNED"]					= "Twój niestandardowy model gracza dla drużyny Przedmiotów został zbanowany."

--[[
	Prop Menu/Prop Chooser, Revision: 16.09.21/X2Z
]]

L["PCR_USAGE_UNLIMIT"]				= "[Menu Przedmiotu] Masz **nielimitowaną** ilość użyć!"
L["PCR_USAGE_COUNT"]					= "[Menu Przedmiotu] Pozostałe użycia: %d"
L["PCR_PLS_WAIT"]						= "[Menu Przedmiotu] Zaczekaj %d sek."
L["PCR_NOROOM"]							= "[Menu Przedmiotu] Zby mało miejsca na zmianę w ten przedmiot!"
L["PCR_PROPBANNED"]					= "[Menu Przedmiotu] Ten przedmiot został zbanowany przez serwer."
L["PCR_PROPBANNED_BYPCR"]		= "[Menu Przedmiotu] Nie możesz się zamienić, ponieważ przedmiot nie jest dostępny dla Menu Przedmiotu."
L["PCR_REACHED_LIMIT"]				= "[Menu Przedmiotu] Osiągnięto limit!"
L["PCR_STAY_ON_GROUND"]			= "[Menu Przedmiotu] Musisz stać na ziemi i nie kucać!"
L["PCR_ONLY_GROUP"]					= "[Menu Przedmiotu] To menu jest dostępne tylko dla określonych grup!"
L["PCR_NOT_EXIST_COUNT"]			= "Wybrany przedmiot nie istnieje na tej mapie! ( %s / 4 )"
L["PCR_NOT_EXIST"]						= "Wybrany przedmiot nie istnieje na tej mapie!"

-- PCR Client section, reason why there is a space because of chat.AddText between args.
L["PCR_NOTIFY_1"]						= " Ten serwer używa Menu Przedmiotów w wersji %s! Wpisz "
L["PCR_NOTIFY_2"]						= " w konsoli, lub przejdź do menu pod F1 -> [Pomoc Wyboru Przedmiotów]"
L["PCR_CL_DISABLED"]					= " Ta opcja jest wyłączona."
L["PCR_CL_GROUP"]						= " To menu jest dostępne tylko dla określonych grup!"
L["PCR_CL_LIMIT"]						= " Osiągnięto limit!"
L["PCR_UNLIMIT_TEXT"]				= "Nielimitowane"
L["PCR_WINDOW_TITLE"]				= "Menu Przedmiotu PHX"
L["PCR_HEADER_TOP"]					= "Wybierz dowolny przedmiot. Posiadasz limit"
L["PCR_HEADER_MID"]					= "w wysokości %s"
L["PCR_HEADER_BOTTOM"]				= "w tej opcji wyboru przedmiotu"
L["PCR_CL_TOOLTIP_BANNED"]		= "Nie możesz użyć tego przedmiotu."
L["PCR_CL_TOOLTIP_MODEL"]		= "Model: %s"
L["PCR_CL_MENU_NOTREADY"]		= " Ta opcja nie jest dostępna w tym momencie."
L["PCR_WINDOW_GUIDE_TTL"]		= "Szybki poradnik: Jak używać Menu Przedmiotów"
L["PCR_BTN_HELP_MENU"]				= "Pomoc Menu Przedmiotów"

L["PCR_CL_CMDUSEULX"]				= " Ta komenda została wyłączona. Zamist tego, użyj \"ulx propmenu\"!"
L["PCR_CMD_ULX_DISABLED"]		= "Komenda \"ulx propmenu\" została wyłączona. Wciśnij [klawisz Menu Przedmiotu] w celu otwarcia." --input.GetKeyName is impossible to access.

L["PCR_EDT_IN_USE"]					= "Administrator wciąż modyfikuje dane przedmiotu. Zaczekaj!"
L["PCR_EDT_ERROR_DISABLED"]	= "[Menu Przedmiotu] Błąd: Opcja dodania własnego przedmiotu została wyłączona!"
L["PCR_EDT_NO_RIGHTS"]				= "Nie masz uprawnień by korzystać z tej opcji."

-- I'm actually exhausted and feel so burned out, but I'll update this in future, or in PH:Zero I guess.
-- Section: Custom Prop Editor File Browser and stuff...
-- L["PCR_EDT_XXX"] 	= "todo"
-- L["PCR_FB_XXX"] 	= "todo"

--[[
	Admin Section, Revision: 16.09.21/X2Z
]]
L["PHXM_PLAYER_PROP_CHOOSER_KEY"]	= "Domyślny klawisz dla Menu Przedmiotu (Wybór Przedmiotu)."
L["PHXM_PROP_FREEZE_MIDAIR"]				= "Domyślny klawisz do zawiśnięcia w powietrzu jako przedmiot."
L["PHXM_ADMIN_PROP_RIGHT_CLICK"]		= "Czy przedmioty również mogą odtwarzać podpowiedzi po wciśnięciu PPM?"
L["PHXM_ADMIN_TAUNT_SCANNER"]			= "(Wymaga przeładowania mapy) Włączyć skaner podpowiedzi?"
L["PHXM_ADMLBL_USABLE_ENTS"]				= "Rodzaje przedmiotów do wykorzystania"
L["PHXM_ADMLBL_USABLE_ENTS_REF"]		= "Dostępne opcje: 1: Tylko fizyczne, 2: Fizyczne i dynamiczne, 3: Prawie wszystko (nawet ciała), 4: Niestandardowe."
L["PHXM_ADMIN_USABLE_ENT_TYPE"]		= "Rodzaje przedmiotów do użycia w celu replikacji"
L["PHXM_ADMIN_NOTIFY_ENT_TYPE"]		= "Powiadamiaj Przedmioty o braku możliwości replikacji po wciśnięciu E. Działa tylko, gdy komenda 'ph_usable_prop_type' jest ustawiona na 3 lub 4."
L["NOTIFY_PROP_ENTTYPE"]						= "Interakcja [E], Replikacja [LPM]."
L["NOTIFY_CUST_ENT_TYPE_IS_ON"]		= "[PHX] Informacja: Wciśnij [E] w celu interakcji, wciśnij [LPM] w celu replikacji."

--[[
	Custom Taunts, Revision: 16.09.21/X2Z
]]
L["TM_TAUNTS_SEARCH_NOTHING"]			= "Nie znaleziono podpowiedzi zawierającej \"%s\"..."
L["TM_SEARCH_PLACEHOLDER"]					= "Szukaj w tej kategorii: Wpisz frazę, z małych liter bez maskowania. Puste pokazuje wszystko."

--[[
	Freeze Cam, Revision: 23.09.21/X2Z
]]
L["PHXM_ADMIN_FREEZECAM_HUNTER"]		= "Włącz opcję zamrażania kamery dla drużyny Łowców"

--============= LATE ADDITION OF 10.06.2022/X2Z. =============--
L["PHXM_MSG_INPUT_IS_EMPTY"]				= "Tekst jest pusty lub nie wciśnięto klawisza ENTER"
L["MISC_SET"]											= "Ustaw"
L["MISC_APPLY"]										= "Zastosuj"
L["MISC_NO"]												= "Nie"
L["MISC_YES"]											= "Tak"
L["MISC_WARN"]											= "Ostrzeżenie"
L["MISC_ERROR"]										= "Błąd"
L["MISC_INFO"]											= "Informacja"
L["MISC_NOTICE"]										= "Uwaga"
L["MISC_IDK"]											= "Nieznane"
L["MISC_NA"]												= "N/D"

-- HUD
L["HUD_DECOY_ACTIVE"]              = "Wciśnij [%s]"
L["HUD_FAKETAUNT_COUNT"]           = "Pozostało: %i"
L["HUD_FAKETAUNT_UNLI"]            = "Nielimitowane"
L["NOTICE_GRENADE_SMG_GIVEN"]      = "Otrzymano granat w SMG"

--[[
	ADMIN PANEL, Revision 10.06/2022/X2Z
]]--
L["PHXM_TAUNT_SETTINGS"]							= "Ustawienia Podpowiedzi"
L["PHXM_GENERAL_SETTINGS"]						= "Ogólne ustawienia"
L["PHXM_FAKE_TAUNT_SETTINGS"]				= "Ustawienia Sztucznej Podpowiedzi"
L["PHXM_FAKE_TAUNT_ENABLE"]					= "Zezwalaj, aby sztuczne podpowiedzi były odtwarzane na losowych przedmiotach na mapie. Dostępne tylko w Menu Podpowiedzi Niestandardowych."
L["PHXM_FAKE_TAUNT_MAXUSAGE"]				= "Maksymalna ilość użyć Sztucznych Podpowiedzi; -1 oznacza nielimitowane."
L["PHXM_TAUNT_RIGHT_CLICK"]		    	= "PPM do podpowiadania. Wyłączy to Menu Niestandardowych Podpowiedzi pod PPM."

L["PHXM_TAUNT_PITCH_SETTINGS"]				= "Ustawienia Tonacji Podpowiedzi"
L["PHXM_TAUNT_PITCH_ENABLE"]					= "Zezwól na zmianę tonacji podpowiedzi"
L["PHXM_TAUNT_PITCH_RANGE_MIN"]			= "Minimalne odcięcie/akceptowalny przedział tonacji dla podpowiedzi (1 - 99)."
L["PHXM_TAUNT_PITCH_RANGE_MAX"]			= "Maksymalne odcięcie/akceptowalny przedział tonacji dla podpowiedzi (100 - 255)."

L["PHXM_DECOY_SETTINGS"]							= "Ustawienia Wabienia"
L["PHXM_DECOY_ENABLE"]								= "Zezwolić na wabiki? Zostaną one przyznane TYLKO RAZ dla żyjących graczy do czasu zakończenia rundy. Po rozmieszczeniu, nie są dodawane nowe przedmioty, lecz przemieszczone."

L["PHXM_DISABLE_FOOTSTEP"]         	= "Przełącz ciche kroki w drużynie Przedmiotów"

L["PHXM_ADMIN_CHATSETTING"]					= "Ustawienia Okna Czatu"
L["PHXM_ADMIN_HUNTERBLIND"]					= "Ustawienia Oślepienia Łowców"

L["PHXM_ADMIN_GIVEGRENADE_NEAREND"]  = "Czy granaty SMG powinny być rozdawane pod koniec rundy? Jeżeli tak, zobacz komendę \"ph_give_grenade_roundend_before_time\""
L["PHXM_ADMIN_GIVEGRENADE_TIME"]     = "Czas w sekundach przed końcem rundy, w którym powinny zostać rozdane granaty SMG. Zazwyczaj 10 - 30 sek."

--[[
	Plugins in sh_init.lua, Revision 10.06/2022/X2Z
]]--
L["PLUG_NAME_VER"]										= "Dodatek: %s | v.%s"
L["PLUG_DESCRIPTION"]								= "Opis: %s"

--[[
	Taunt Pitch, Revision 10.06/2022/X2Z
]]--
L["PHX_CTAUNT_USE_PITCH"]						= "Używaj tonacji na niestandardowych podpowiedziach"
L["PHX_CTAUNT_RANDOM_PITCH"]					= "Używaj losowej tonacji na niestandardowych podpowiedziach"
L["PHX_RTAUNT_USE_PITCH"]						= "Używaj tonacji na losowych podpowiedziach [%s]"
L["PHX_RTAUNT_RANDOMIZE"]						= "Używaj losowej tonacji na losowych podpowiedziach [%s]"
L["PHX_CTAUNT_PITCH_FOR_FAKE"]				= "Używaj tonacji na sztucznych podpowiedziach"
L["PHX_CTAUNT_RANDPITCH_FOR_FAKE"]		= "Używaj losowej tonacji na sztucznych podpowiedziach"
L["PHX_CTAUNT_SLIDER_PITCH"]					= "Suwak tonacji podpowiedzi."
L["TM_TOOLTIP_FAKETAUNT"]						= "Odtwórz sztuczną podpowiedź na losowym przedmiocie"
L["TM_PREFERRED_PITCH"]              = "Preferowany poziom tonacji podpowiedzi"

--[[
	Fake Taunt, Revision 10.06/2022/X2Z
	Description: Play fake taunts on random props in the map (Not Players)
]]--
L["PHX_CTAUNT_ON_RAND_PROPS"]				= "Odtwórz na losowych przedmiotach (%ix)"
L["PHX_CTAUNT_ON_RAND_PROPS_UNLI"]		= "Odtwórz na losowych przedmiotach"
L["PHX_CTAUNT_PLAYED_ON_RANDPROP"]		= "Odtworzono podpowiedź na losowym przedmiocie."
L["PHX_CTAUNT_RAND_PROPS_LIMIT"]			= "Osiągnięto limit!"
L["PHX_CTAUNT_RAND_PROPS_NOT_PROP"]  = "Niedostępne w tym momencie."
L["PHX_CTAUNT_RANDPROP_DISABLED"]		= "Sztuczne Podpowiedzi są obecnie wyłączone."

--[[
	PH:Z Simple Decoy, Revision 10.06/2022/X2Z
]]--
L.DECOY_PROP	= {
	"zabija atrapę!",
	"ma wyrzuty za zabicie atrapy.",
	"zabija wabik.",
	"zabija niewinną atrapę.",
	"czuje zażenowanie po zabiciu atrapy."
}

L["DECOY_PUT_SUCC"]									= "Ustawiono wabik."
L["DECOY_CANT_PUT_HERE"]							= "Nie można ustawić tutaj wabika."
L["DECOY_GET_REWARD"]								= "Gratulacje! Otrzymujesz ['Wabik'] za przetrwanie rundy!"
L["DECOY_REMINDER_GET"]        			= "Posiadasz 'Wabik'! Rozstaw go gdzieś, aby zmylić przeciwnika!"
L["DECOY_FRAGS_RECEIVED"]						= "Twój wabik robi postępy: Zabrano 1 punkt od %s!"
L["DECOY_DISABLED"]									= "Aktualnie wabiki są niedostępne."
L["PHXM_CL_DECOY_KEYBIND"]						= "Domyślny klawisz do rozstawiania wabików. Domyślnie [1] (nie na klaw. num.)"

L["DECOY_INDICATOR_INVALID"]         = "Nieprawidłowe nachylenie!"
L["DECOY_INDICATOR_TOOFAR"]          = "Za daleko!"
L["DECOY_INDICATOR_OK"]              = "Rozstaw wabik [Wciśnij %s]"

L["PHXM_DECOY_HEALTH"]								= "Ile punktów zdrowia powinien posiadać wabik? Domyślnie: 10"
L["PHXM_PLAYER_SHOW_DECOY_HELPER"]   = "Pokaż/Ukryj pomoc podczas rozstawiania wabika. Będzie wyświetlana biała kropka oraz tekst w okolicy celownika."
L["PHXM_PLAYER_SHOW_DECOY_MARKER"]   = "Pokaż/Ukryj znacznik wabika."

--[[
	Revision 10.06/2022/X2Z
    Prop Menu Update: Menu, Editor, Browser
]]--
L["PCR_MODEL_DONT_EXISTS"]   				= "Przepraszamy, ale ten model nie jest aktualnie dostępny!"

L["PCR_PLUG_WARN_MSG"]								= "Ostrzeżenie: Opcja Niestandardowe Przedmioty (pcr_allow_custom) jest ustawiona na 0.\nAby edytować listę swoich przedmiotów należy włączyć tę opcję!\nAby zmienić to ustawienie wymagana jest zmiana mapy!"
L["PCR_PLUG_LBL_BINDKEY"]						= "Aby zmienić przypisany klawisz, przejdź do zakładki [GRACZ]."
L["PCR_PLUG_LBL_EDITOR"]							= "Edytor Niestandardowego Menu Przedmiotu"
L["PCR_PLUG_BTN_OPEN_EDT"]						= "Otwórz edytor"
L["PCR_PLUG_LBL_COMSET"]							= "Ustawienia wspólne"
L["PCR_PLUG_LBL_TECHSET"]						= "Ustawienia techniczne"
L["PCR_PLUG_LBL_EXPSET"]							= "Ustawienia eksperymentalne"
L["PCR_PLUG_LBL_PLAYERSET"]					= "Ustawienia gracza"

L["PCR_PLUG_ENABLE"]									= "Włącz opcję 'Menu Przedmiotu'"
L["PCR_PLUG_ALLOW_CUSTOM"]						= "(Wymaga zmiany mapy) Zezwalać na dodawanie własnych przedmiotów do Menu Przedmiotu?"
L["PCR_PLUG_PROP_BAN"]								= "(Wymaga zmiany mapy) Nie pokazywać zbanowanych przedmiotów w Menu Przedmiotu?"
L["PCR_PLUG_USAGE_LIMIT"]						= "Maksymalny limit użycia na gracza. -1 oznacza nielimitowane."
L["PCR_PLUG_PROP_LIMIT"]							= "(Wymaga zmiany mapy) Ogranicz ilość niestandardowych przedmiotów w Menu Przedmiotu"
L["PCR_PLUG_PROP_LIMITMAX"]					= "Maksymalna ilość przedmiotów, które zostaną losowo dodane na listę w Menu Przedmiotu."
L["PCR_PLUG_USE_ULXMENU"]						= "Czy menu przedmiotu powinno być dostępne z poziomu konsoli (0) czy ULX (1)? Przypisany klawisz będzie uwzględniał to ustawienie"
L["PCR_PLUG_USE_DELAY"]							= "Opóźnienie w sekundach, zanim gracz będzie mógł ponownie skorzystać z przedmiotu w Menu Przedmiotu"
L["PCR_PLUG_KICK_INVALID"]						= "Wyrzuć każdego gracza, który spróbuje skorzystać z nieprawidłowego przedmiotu (maks. 4 próby)"
L["PCR_PLUG_SPACE_CHECK"]						= "Sprawdź ilość dostępnego miejsca przed zmianą w przedmiot z Menu Przedmiotu, aby uniknąć utknięcia"
L["PCR_PLUG_X_BBOX"]									= "(Wymaga zmiany mapy) Sprawdź rozmiar granic przedmiotu (BBox) przed dodaniem na listę w Menu Przedmiotu"
L["PCR_PLUG_X_BBOX_MAX"]							= "Maksymalna wysokość granic przedmiotu (BBox)."
L["PCR_PLUG_X_BBOX_MIN"]							= "Maksymalna długość/szerokość granic przedmiotu (BBox)."
L["PCR_PLUG_ONLY_GROUPS"]						= "Czy Menu Przedmiotu powinno zostać ograniczone tylko do określonych grup (np. Wspornicy)?"
L["PCR_PLUG_NOTIFYMSG"]							= "Powiadamiaj graczu o sposobie korzystania z Menu Przedmiotu po rozpoczęciu każdej rundy"

L["PCR_EDITOR_MSG_ERROR"]						= "Twoje zmiany nie zostały zapisane z powodu błędu.\nSprawdź konsolę serwerową!"
L["PCR_EDITOR_MSG_SUCC"]							= "Twoje zmiany i dane niestandardowych przedmiotów zostały zapisane i zaktualizowane."

L["PHZ_generic_title"]								= "Edytor listy niestandardowych przedmiotów"
L["PHZ_generic_helptext"]						= [[[Jak korzystać:
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
L["PHZ_generic_mdlinfo"] 				= [[Informacje o modelu:
%s
Posiada fizykę: %s]]
L["PHZ_generic_mdlinfoStart"] 		= "(Najpierw wybierz model)"

L["PHZ_generic_no_ragdoll"]			= "Nie: Ragdoll"
L["PHZ_generic_titlelabel"]			= "%s podgląd :"

L["PHZ_mount_game_sel"]					= "Wybierz zamontowaną grę (Domyślnie: Garry's Mod)"
L["PHZ_input_placeholder1"]			= "Szukaj w folderze: <nazwa> lub '*', puste, aby zobaczyć wszystkie."
L["PHZ_input_placeholder2"]  		= "Szukaj dodatku: <nazwa> lub '*', puste, aby zobaczyć wszystkie."
L["PHZ_msg_warn_close"]					= "Czy na pewno chcesz zamknąć to okno? Wszystkie niezapisane zmiany zostaną utracone!"
L["PHZ_msg_commit"] 							= "Czy na pewno chcesz zastosować zmiany?"
L["PHZ_msg_cant_empty"]					= "Lista przedmiotów nie może być pusta!"
L["PHZ_msg_removesel"] 					= [[Usuń wybrane przedmioty na liście. Legenda:
Czerwony = Zaznaczone przedmioty
Żółty: Przedmioty nie istnieją na serwerze i powinny zostać usunięte.]]
L["PHZ_msg_warn_mdlinlist"]  		= "OSTRZEŻENIE: Ten model znajduje się już na liście!"
L["PHZ_msg_invalid_mdl"] 				= "Powód: Ten model jest nieprawidłowy"
L["PHZ_apply_select"] 						= "Zastosuj i zapisz wybrane przedmioty"
L["PHZ_menu_copy"] 							= "Kopiuj model"
L["PHZ_menu_refresh"] 						= "Odśwież Model"
L["PHZ_tooltip_removesel"]				= "Usuń zaznaczone"
L["PHZ_tooltip_wasmarked"] 			= [[Ten przedmiot został oznaczony, ponieważ nie istnieje on na serwerze.
Po zamknięciu tego edytora, zostanie on automatycznie usunięty.]]

L["PHZ_pcr_fb_allcontent"] 			= "Cała zawartość (Nie każdy gracz/serwer będzie posiadał taką samą zawartość co ty)"
L["PHZ_pcr_fb_notmounted"] 			= "%s [Nie zamontowano]"

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