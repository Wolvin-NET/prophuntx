local LANG = {}

LANG.code = "pl_pl"

LANG.Name 		 	= "Polski" -- example: "Bahasa Indonesia"
LANG.NameEnglish	= "Polish" -- Your Language but spoken in English, example: "Indonesian"
LANG.Author			= "Pawelxxdd" -- Only accept STRINGS.
-- Can Accept: String, and Table.
LANG.AuthorURL		= {"https://steamcommunity.com/profiles/76561198114876117"}

-- Special Section that isn't String-based
LANG.SUICIDEMSG = { --> FRETTA
	"popełnia samobójstwo!", -- i believe this was from 9gag joke.
	"ginie w niewyjaśnionych okolicznościach.",
	"magicznie umiera.",
	"zestrzela się z planszy.",
	"denerwuje się.",
	"jest pod wpływem.",
	"umiera... więcej szczęścia następnym razem!",
	"przewraca się.",
	"potyka się o patyk.",
	"umiera z przymusu.",
	"mdleje.",
}

LANG.RANDOM_SPECTATORS = { --> FRETTA
	"aby odpocząć.",
	"aby patrzeć jak się bawicie.",
	"w roli Wielkiego Brata.",
	" ",
}

-- List of string-based translation

-- // FRETTA SECTION \\
--  FRETTA: Kill text (X killed Y)
LANG["HUD_KILLED"]				= "zabija"

-- FRETTA: HUDs
LANG["HUD_TIME"] 				= "CZAS"
LANG["HUD_ROUND"]				= "RUNDA"
LANG["HUD_WAITPLY"]				= "Oczekiwanie na graczy..."
LANG["HUD_DEAD"]				= "(TRUP) "

LANG["HUD_TEAMWIN"]				= "%s wygrywają!"
LANG["HUD_LOSE"]				= "Remis, nikt nie zyskuje!"
LANG["MISC_TIMELEFT"]			= "Pozostały Czas: %s"
LANG["MISC_GAMEEND"] 			= "Gra zostanie zakończona po tej rundzie"

-- FRETTA: Team selection screen (F2)
LANG["DERMA_TEAMSELECT"]		= "Wybierz drużynę"

-- FRETTA: F1 screeen
LANG["DERMA_RTV"] 				= "Głosowanie Za Zmianą (RTV)"
LANG["DERMA_PHMENU"] 			= "Menu Prop Hunt"
LANG["DERMA_CHANGETEAM"]		= "Wybierz drużynę"

-- FRETTA: Scoreboard
LANG["DERMA_PLAYER"]			= "(%d gracz)"
LANG["DERMA_PLAYERS"]			= "(%d graczy)"
LANG["DERMA_NAME"]				= "Nazwa"
LANG["DERMA_KILLS"]				= "Zabójstwa"
LANG["DERMA_DEATHS"]			= "Śmierci"
LANG["DERMA_PING"]				= "Ping"

LANG["CHAT_JOINED"]				= " dołącza do "
LANG["CHAT_JOINEDTHE"]			= " dołącza do drużyny "

LANG["CHAT_SWAPBALANCE"]		= "Przeniesiono gracza %s do %s w ramach autobalansowania drużyn."
LANG["CHAT_SWAPBALANCEYOU"]		= "Przeniesiono Cię w ramach autobalansowania drużyn. Miłej służby!" -- Smile... for even in death, you have become children of Thanos
-- // END OF FRETTA SECTION \\

LANG["HELP_F1"] 				= [[Prop Hunt (Nazwa Kodowa) Projekt X.

Projekt, który uczyni Prop Hunt X nowoczesnym i konfigurowalnym.

Więcej informacji znajdziesz tutaj:
https://www.wolvindra.net/prophuntx

Informacje, pomoc oraz poradniki znajdziesz, klikając przycisk [F1], a następnie przechodząc do [Menu Prop Hunt].

Wersja: ]].. PHX.VERSION ..[[ Poprawka: ]].. PHX.REVISION ..[[

Miłej zabawy!]]

-- Important!
LANG["LANGUAGE_CHANGED"]		= "Preferowany język został zmieniony na %s"

-- internal cl_menutypes section.
LANG["SUBTYPE_PREFERED_LANG"]	= "Preferowany język"
--LANG["SUBTYPE_TEXTENTRY_?"]	= "???"

-- Events
LANG["EV_PLAYER_CONNECT"]		= "%s rozpoczyna połączenie z serwerem."
LANG["EV_PLAYER_JOINED"]		= "%s pojawia się na serwerze."
LANG["EV_PLAYER_DISCONNECT"]	= "%s opuszcza grę (Powód: %s)"

-- HUD elements
LANG["HUD_HP"]					= "ZDROWIE"
LANG["HUD_AMMO"] 				= "AMMO"	-- obsolete
LANG["HUD_MAGSEC"]				= "MAG. / REZ." --Magazine Counts (separator) Secondary Magazine Counts

-- !!WEAPON NAMES CANNOT BE TRANSLATED, THEY USE FROM language.GetPhrase THEREFORE IT'S IMPOSSIBLE TO DO.

LANG["TEAM_PROPS"]				= "Przedmioty"
LANG["TEAM_HUNTERS"]			= "Łowcy"

LANG["HUD_ROTLOCK"]				= "Obracanie Przedmiotu: Zablokowane"
LANG["HUD_ROTFREE"]				= "Obracanie Przedmiotu: Odblokowane"
LANG["HUD_KILLEDBY"]			= "%s likwiduje cię!"

LANG["HUD_AUTOTAUNT"]			= "Auto-podpowiedź za %d sek."
LANG["HUD_AUTOTAUNT_ALT"]		= "Auto-podpowiedź za %d"

LANG["HUD_TargetID"]			= "Gracz: %s (%d%%)" -- Player: <NAME> (<HEALTH>%)

LANG["HUD_BLINDED"]				= "Łowcy zaczną poszukiwania za %s"
LANG["HUD_UNBLINDED"]			= "Gotowi czy nie, nadchodzimy!"

LANG["BLIND_RESPAWN_TEAM"]		= "Odradzasz się tylko w drużynie %s po %d sek. trwania czasu chowania."
LANG["BLIND_RESPAWN"]			= "Odradzasz się po %d sek. trwania czasu chowania."

LANG["MISC_ACCEPT"]				= "Akceptuj"
LANG["MISC_OK"]					= "OK"
LANG["MISC_CLOSE"]				= "Zamknij"
LANG["MISC_PREV"]				= "< WSTECZ"
LANG["MISC_NEXT"]				= "DALEJ >"
LANG["MISC_ACCESSDENIED"]		= "Dostęp Zabroniony"

-- Chat messages
LANG["CHAT_NOPLAYERS"]			= "Zbyt mało graczy by rozpocząć grę!"
LANG["CHAT_SWAP"]				= "Drużyny zostały zamienione!"

LANG["CHAT_SWAPTEAM_WARNING"]   = "Zmieniono drużynę %d razy. Po przekroczeniu limitu (%d), nie będzie już można zmienić drużyny."
LANG["CHAT_SWAPTEAM_REVERT"]	= "Nie możesz dołączyć do drużyny %s, ponieważ osiągnięto już limit zmian drużyny."

LANG["CHAT_PROP_NO_ROOM"] 		= "Zbyt mało miejsca, aby się zamienić!"

-- Notification
LANG["NOTIFY_IN_PROP_TEAM"]		= "Jesteś w drużynie Przedmiotów z możliwością obracania przedmiotu! Możesz to robić poprzez ruszanie myszką."
LANG["NOTIFY_ROTATE_NOTICE"]	= "Dodatkowo, możesz zablokować obracanie się, klikając (domyślnie) przycisk [R]!"

-- Custom Taunt Window
LANG["TM_WARNING_CT_DISABLE"]	= "[PHX - Podpowiedzi] Ostrzeżenie: Serwer nie dopuszcza niestandardowych podpowiedzi."
LANG["TM_NO_TAUNTS"]			= "Ostrzeżenie: Nie znaleziono niestandardowych podpowiedzi we wskazanym katalogu."
LANG["TM_PLAY_ONLY_ALIVE"] 		= "Nie możesz odtwarzać podpowiedzi, kiedy jesteś trupem."

LANG["TM_WINDOW_TITLE"]			= "Prop Hunt - Niestandardowe podpowiedzi"
LANG["TM_NOTICE_PLSWAIT"]		= "Zaczekaj %s sek."
LANG["TM_NOTICE_PLAYPREVIEW"]	= "Podgląd podpowiedzi: %s"

LANG["TM_TOOLTIP_PLAYTAUNT"] 	= "Odtwórz podpowiedź"
LANG["TM_TOOLTIP_PREVIEW"]		= "Przesłuchaj podpowiedź przed globalnym odtworzeniem"
LANG["TM_TOOLTIP_PLAYCLOSE"]	= "Odtwórz podpowiedź i zamknij okno"
LANG["TM_TOOLTIP_PLAYRANDOM"]	= "Odtwórz losową podpowiedź"
LANG["TM_TOOLTIP_CLOSE"]		= "Zamknij"
LANG["TM_MENU_CLOSE"]			= "Zamknij Menu"

LANG["TM_DELAYTAUNT_NOT_EXIST"] = "Wybrana podpowiedź, nie istnieje na serwerze!"
LANG["TM_DELAYTAUNT_PLSWAIT"]	= "Zaczekaj %s sek."

--[[
	PHX Menu window
]]
LANG["PHXM_WINDOW_TITLE"]		= "Prop Hunt X - Zaawansowane ustawienia"
LANG["SERVER_INFO_MOTD"]		= "INFORMACJE I ZASADY [MOTD]"

LANG["PHXM_TAB_HELP"]			= "Pomoc i poradniki"
LANG["PHXM_TAB_MUTE"]			= "Wycisz graczy"
LANG["PHXM_TAB_PLAYER"]			= "Ustawienia gracza"
LANG["PHXM_TAB_MODEL"] 			= "Modele gracza"
LANG["PHXM_TAB_MODEL_DISABLED"]	= "Modele gracza (Wyłączono)"
LANG["PHXM_TAB_ADMIN"]			= "Ustawienia Administratora"
LANG["PHXM_TAB_ABOUT"]			= "Informacje o Prop Hunt X"
LANG["PHXM_TAB_MAPVOTE"]		= "Ustawienia Głosowania"

LANG["PHXM_CVAR_CHANGED"]		= "[Ustawienia] Wartość CVAR %q została zmieniona na %q"

--[[
	Player Mute Settings
]]
LANG["PHXM_MUTE_SELECT"]		= "Wybierz gracza, którego chcesz wyciszyć."

--[[
	Player Settings
]]
LANG["PHXM_PLAYER_OPTIONS"]		= "Opcje Gracza"
LANG["PHXM_PLAYER_LANG"]		= "Język"
LANG["PHXM_PLAYER_BIND"]		= "Mapowanie klawiszy"
LANG["PHXM_PLAYER_HUDSETTINGS"]	= "Ustawienia Interfejsu"

LANG["PHXM_PLAYER_TAUNT_KEY"]			= "Klawisz losowej podpowiedzi"
LANG["PHXM_PLAYER_TAUNTWINDOW_KEY"]		= "Klawisz okna z listą podpowiedzi"
LANG["PHXM_PLAYER_ROTATLOCK_KEY"]		= "Klawisz blokady obracania przedmiotu"

LANG["PHXM_PLAYER_TOGGLE_HALOS"]		= "Przełącz efekt podświetlenia po spojrzeniu na przedmiot"
LANG["PHXM_PLAYER_IDNAMES"]				= "Pokaż nazwy graczy nad ich głowami (również przez ściany)"
LANG["PHXM_PLAYER_ENDROUND_CUE"]		= "Odtwarzaj dźwięk końca rundy"
LANG["PHXM_PLAYER_TAUNTMENU_AUTOCLOSE"]	= "Automatycznie zamykaj okno podpowiedzi po podwójnym kliknięciu na podpowiedź"
LANG["PHXM_PLAYER_SEE_HUNTER_LINE"]		= "Rysuj linię wzroku łowców podczas obserwowania rozgrywki."
LANG["PHXM_PLAYER_SEE_LBALL_ICONS"]		= "Pokazuj ikonę 'Kulek szczęścia' kiedy pojawią się one na mapie"
LANG["PHXM_PLAYER_SEE_CRYSTAL_ICONS"]	= "Pokazuj ikonę 'Diabelskich kulek' kiedy pojawią się one na mapie"

LANG["PHXM_PLAYER_USE_NEW_HUD"]			= "Użyj nowego interfejsu PH:E"
LANG["PHXM_PLAYER_SHOW_TUTOR"]			= "Pokaż okno poradnika (Tylko 2 razy za każdym odrodzeniem jako przedmiot)"
LANG["PHXM_PLAYER_USE_NEW_CROSSHAIR"]	= "Włącz niestandardowy celownik"
LANG["PHXM_PLAYER_SHOW_TEAM_TOPBAR"]	= "Pokazuj liczbę żywych graczy w lewym, górnym rogu (Wymaga przynajmniej 4 graczy na serwerze)"

--[[
	Player model Browser Section
]]
LANG["QUERY_MODEL_SELECTED"]	= "Model %s został wybrany i zostanie użyty przy następnym odrodzeniu!"
LANG["QUERY_MODEL_INFO"]		= "Nazwa modelu: %s - Dostępne dla wszystkich"

LANG["MDL_MENU_REFRESH"] 		= "Odśwież ikonę"
LANG["MDL_MENU_PREVIEW"] 		= "Podgląd modelu"
LANG["MDL_MENU_MODELINFO"] 		= "Informacje o modelu"


LANG["MISC_APPLYMDL"] 			= "Wybierz model"

LANG["PHXM_MODEL_DISABLED"] 	= "O nie! Niestandardowe modele gracza zostały wyłączone na tym serwerze!"
LANG["PHXM_PLAYERMODEL_SETFOV"]	= "  Ustaw FOV (pole widzenia)"

--[[
	Server Settings
]]
LANG["PHXM_ADMIN_OPTIONS"]		= "Opcje trybu po stronie serwera (Widoczne tylko dla administratorów i właścicieli)"
LANG["PHXM_ADMIN_MUSTALIVE"]	= "Musisz być po stronie żywych, aby móc dokonać tej czynności."

--[[
	Language Override
]]
LANG["PHXM_ADMIN_LANGOVERRIDE"]	= "Wymuszenie Języka"

LANG["PHXM_ADMIN_FORCELANG"] 				= "Wymusić język interfejsu? Spowoduje to zastosowanie okreslonego z góry języka u wszystkich graczy, mimo ich preferencji."
LANG["PHXM_ADMIN_LANGTOUSE"]				= "Wymuszony język."
LANG["PHXM_ADMIN_PLAYERDEFAULTLANG"] 		= "Domyślny język gracza podczas pierwszego połączenia."

-- Gameplay settings
LANG["PHXM_ADMIN_CUSTOM_MODEL"]				= "Zezwalaj na niestandardowe modele w drużynie Łowców"
LANG["PHXM_ADMIN_CUSTOM_MODEL_PROP"]		= "Zezwalaj na niestandardowe modele w drużynie Przedmiotów - Upenij się, że Łowcy też mają tą przyjemność!"
LANG["PHXM_ADMIN_TAUNT_DELAY_CUSTOM"]		= "Czas (w sekundach) między odtwarzanymi niestandardowymi podpowiedziami"
LANG["PHXM_ADMIN_TAUNT_DELAY_RANDOM"]		= "Czas (w sekundach) między odtwarzanymi zwykłymi podpowiedziami"
LANG["PHXM_ADMIN_TAUNT_DELAY_AUTO"]			= "Czas (w sekundach), po którym zostanie odtworzona Automatyczna Podpowiedź"
LANG["PHXM_ADMIN_AUTOTAUNT_ENABLE"]			= "Włącz Automatyczną Podpowiedź"

LANG["PHXM_ADMIN_NOTICE_ROTATION"]			= "Pokazuj informację o możliwości zablokowania obracania za każdym odrodzeniem w drużynie Przedmiotów"
LANG["PHXM_ADMIN_CAMERA_COLLIDE"]			= "Włącz kolizję kamery na ścianach"
LANG["PHXM_ADMIN_FREEZECAM"]				= "Włącz wstrzymanie kamery w drużynie Przedmiotów"
LANG["PHXM_ADMIN_PROP_COLLIDE"]				= "Włącz kolizję graczy w drużynie Przedmiotów"
LANG["PHXM_ADMIN_SWAP_TEAM"] 				= "Zamieniaj drużyny po każdej rundzie - wyłączenie spowoduje, że drużyny pozostaną takie same na zawsze (no... może do zakończenia mapy)"
LANG["PHXM_ADMIN_HUNTER_PENALTY"]			= "Kara dla Łowców za strzał w nieprawidłowy cel"
LANG["PHXM_ADMIN_HUNTER_KILL_BONUS"]		= "Bonus dla Łowców za zabicie Przedmiotu"
LANG["PHXM_ADMIN_HUNTER_SMG_GRENADES"]		= "Ilość granatników SMG dla Łowców"
LANG["PHXM_ADMIN_GAME_TIME"]				= "Czas gry (w minutach)"
LANG["PHXM_ADMIN_BLINDLOCK_TIME"]			= "Czas na chowanie się (w sekundach)"
LANG["PHXM_ADMIN_ROUND_TIME"]				= "Czas rudny (w sekundach)"
LANG["PHXM_ADMIN_ROUNDS_PER_MAP"]			= "Ilość rund na mapę"
LANG["PHXM_ADMIN_ENABLE_LUCKYBALL"]			= "Zezwalaj na towrzenie się Kulek Szczęścia po zniszczeniu przedmiotu (Szansa na pojawienie się: 8%)"
LANG["PHXM_ADMIN_ENABLE_CRYSTAL"]			= "Zezwalaj na tworzenie się Diabelskich Kulek po śmierci Łowcy (Szansa na pojawienie się: 70%)"
LANG["PHXM_ADMIN_WAIT_PLAYERS"]				= "Czekaj na graczy zanim zacznie się rozgrywka"
LANG["PHXM_ADMIN_WAIT_MIN_PLAYERS"]			= "Minimalna ilość graczy, aby czekać za rozpoczęciem rozgrywki (domyślnie: 1)"
LANG["PHXM_ENABLE_PLAYER_JOIN_LEAVE"] 		= "Włączyć informacje o dołączaniu lub odłączaniu się graczy? Ustaw na 0 jeżeli chcesz użyć własnej modyfikacji czatu."

LANG["PHXM_ADMIN_FORCEJOINBALANCE"]			= "Wymuś wyrównanie drużyn podczas dołączania graczy."
LANG["PHXM_ADMIN_ENABLETEAMBALANCE"]		= "Automatycznie wyrównaj drużyny na początku rundy (Balansowanie Drużyn)"
LANG["PHXM_ADMIN_PICKUP_PROPS"] 			= "Zezwalaj na podnoszenie małych przedmiotów? 0: Nie zezwalaj, 1: Tylko Łowcy, 2: Tylko Przedmioty, 3: Zezwalaj wszystkim."

LANG["PHXM_ADMIN_TAUNTMODES"]			= "Tryby Podpowiedzi"
LANG["PHXM_ADMIN_TAUNTMODE_MODE"]		= "--[Aktualny tryb: %d ]--"
LANG["PHXM_ADMIN_TAUNTMODE0"]			= "Tryb [0]: F3/Losowa Podpowiedź"
LANG["PHXM_ADMIN_TAUNTMODE1"]			= "Tryb [1]: C/Niestand. Podpowiedź"
LANG["PHXM_ADMIN_TAUNTMODE2"]			= "Tryb [2]: Obydwa tryby"
LANG["PHXM_ADMIN_TAUNTSOPEN"]			= "Otwórz okno podpowiedzi"

LANG["PHXM_MODE_DEFAULT"] 				= "--[ Tryb Podnosz. Przedm. %d ]--"
LANG["PHXM_MODE0"]						= "Tryb [0]: Nie zezwalaj"
LANG["PHXM_MODE1"]						= "Tryb [1]: Tylko Łowcy"
LANG["PHXM_MODE2"]						= "Tryb [2]: Tylko Przedmioty"
LANG["PHXM_MODE3"]						= "Tryb [3]: Zezwalaj wszystkim"

--[[
	Admin Developer Sections
]]
LANG["PHXM_ADMIN_DEVSECTION"]		= "Opcje Deweloperskie/Eksperymenty"
LANG["PHXM_ADMIN_ROOMCHECK"]		= "Włączyć sprawdzanie rozmiaru przedmiotu? Ochroni to przed niechcianym zablokowaniem się w ścianie/innym przedmiocie."
LANG["PHXM_ADMIN_USENEWMKBREN"]		= "Użyj nowego modelu broni Bren MK II (Wymaga Zmiany Mapy)"
LANG["PHXM_ADMIN_BEVERBOSE"]		= "Developer: Zezwalaj PH:X na wyświetlanie wszystkich informacji deweloperskich (dosłownie)?"
LANG["PHXM_ADMIN_SHOWPLNAMEHEAD"]	= "Zezwalaj na pokazywanie nazw graczy z drużyny przez ściany."
LANG["PHXM_ADMIN_USESINGLE_FZCAM"]	= "Użyj jednego dźwięku Zamrożenia Kamery zamiast całej listy (Zobacz 'ph_fc_cue_path', aby odkryć ścieżkę dźwięku)"
LANG["PHXM_ADMIN_MODELLISTINGTYPE"] = "Użyj starszej wersji listy modeli: 0 = Wszystkie modele gracza (AddValidModel), 1 = Użyj starszej wersji: list.Get('PlayerOptionsModel')"
LANG["PHXM_ADMIN_JUMPPOWER"]		= "Mnożnik wysokości skoku w drużynie Przedmiotów"
LANG["PHXM_ADMIN_ENABLE_OBB"]		= "Developer: Zezwalaj na modyfikowane granice przedmiotu zapisane w danych konfiguracyjnych (OBB)"
LANG["PHXM_ADMIN_RELOAD_OBB"]		= "Developer: Przeładuj dane pliku konfiguracyjnego za każdym razem, kiedy rozpoczyna się runda (OBB)"

--[[
	Experimental & PH:X Features
]]
LANG["PHXM_ADMIN_EXPERIMENTALPHX"]			= "Nowe, eksperymentalne możliwości PHX"

LANG["PHXM_ADMIN_HLA_COMBINE"]				= "Wsparcie dla nowego modelu Kombinatu z HLA"
LANG["PHXM_ADMIN_TEAMBALANCE"]				= "Włącz Balanoswanie Drużyn"
LANG["PHXM_ADMIN_CHANGETEAM_LIMIT"]			= "Ogranicz ilość zmian drużyn. Ustaw na -1 aby wyłączyć. "
LANG["PHXM_ADMIN_USENEWCHAT"]				= "Użyj nowego czatu (eChat) - Jest to tymczasowy zamiennik. Jeżeli już jakiś posiadasz, nie zmieniaj tej wartości."
LANG["PHXM_ADMIN_NEWCHATPOS"]				= "Pozycja nowego czatu: Przesuń w górę (względem osi Y) o wskazaną ilość pikseli."
LANG["PHXM_ADMIN_RESPAWNONBLIND"]			= "Zezwalaj na odradzanie się podczas czasu chowania się."
LANG["PHXM_ADMIN_RESPAWNONBLIND_TEAM"]		= "Zezwalaj na odradzanie się podczas czasu chowania się w konkretnej drużynie. 0: Wszyscy, 1: Łowcy, 2: Przedmioty"
LANG["PHXM_ADMIN_REWSPANTIMEPERCENT"]		= "Porcent czasu chowania się, przed którym można się odrodzić. Domyślnie: 0.75 (Po 75% Czasu Chowania Się, nie można się odrodzić)"
LANG["PHXM_ADMIN_ALLOWRESPAWN_SPECTATOR"]	= "Zezwól na odrodzenie się podczas czasu chowania się, kiedy gracz przychodzi z drużyny Obserwatorów."
LANG["PHXM_ADMIN_ALLOWRESPAWN_TEAMCHANGE"]	= "Zezwól na odrodzenie się podczas czasu chowania się, kiedy gracz przychodzi z przeciwnej drużyny."

--[[
	MapVote Settings
]]
LANG["PHXM_MV_SETTINGS"]			= "Ustawienia Głosowań"

LANG["PHXM_MV_ALLOWCURMAP"]			= "Zezwalaj, aby aktualna mapa była używana w głosowaniu"
LANG["PHXM_MV_COOLDOWN"]			= "Włącz ograniczenie przed rozpoczęciem głosowania"
LANG["PHXM_MV_USE_ULX_VOTEMAPS"]	= "Użyć map określonych na liście ULX? Jeżeli nie, wszystkie mapy w ścieżce maps/*.bsp zostaną użyte."
LANG["PHXM_MV_MAPLIMIT"]			= "Ilość map dostępnych w głosowaniu."
LANG["PHXM_MV_TIMELIMIT"]			= "Czas na głosowanie"
LANG["PHXM_MV_MAPBEFOREREVOTE"]		= "Ilość zmian map wymaganych, aby konkretna mapa ponownie pokazała się w głosowaniu."
LANG["PHXM_MV_RTVCOUNT"]			= "Mimalna ilość graczy wymagana do RTV (Głosowanie Za Zmianą)"

LANG["PHXM_MV_EXPLANATION1"]		= "Aby określić, które mapy powinny być użyte, ustaw zmienną (dla przykładu) [ mv_mapprefix 'ph_,cs_,de_' ] w konsoli."
LANG["PHXM_MV_EXPLANATION2"]		= "Jeżeli używasz ULX, użyj map_vote. Jeżeli nie, użyj mv_start."
LANG["PHXM_MV_EXPLANATION3"]		= "Akcja Głosowania (Aby anulować, po prostu wpisz !unmap_vote (dla ULX) lub w konsoli: mv_stop)"

LANG["PHXM_MV_START"]		= "Rozpocznij Głosowanie"
LANG["PHXM_MV_STOP"]		= "Zatrzymaj Głosowanie"
--                  			  ^YOU VIOLATED THE LAW!


--[[
	Versioning, Credits or About section
]]
LANG["PHXM_ABOUT_VERSIONING"]		= "Wersja: %s - Poprawka: %s"
LANG["PHXM_ABOUT_AUTHOR"]			= "Autor: %s"
LANG["PHXM_ABOUT_ENJOYING"]			= "Jeżeli podoba ci się rozgrywka, pomyśl o dotacji!"
LANG["PHXM_ABOUT_UPDATE"]			= "Aktualizacje Prop Hunt X"
LANG["PHXM_ABOUT_LINKS"]			= "Linki i podziękowania"
LANG["PHXM_ABOUT_THANKS"]			= "Specjalne podziękowania za wsparcie, sugestie oraz pomoc dla:\n %s"
LANG["PHXM_ABOUT_BTN_DONATE"]		= "Wspomóż PH:X poprzez dotację"
LANG["PHXM_ABOUT_BTN_HOME"]			= "Strona domowa PHX"
LANG["PHXM_ABOUT_BTN_GITHUB"]		= "Repozytorium GitHub PHX"
LANG["PHXM_ABOUT_BTN_PLUGINS"]		= "Dodatki/Pluginy dla PHX"
LANG["PHXM_ABOUT_BTN_CHANGELOGS"]	= "Lista Zmian PHX"

--[[
	Late Additionals
]]
-- fretta
LANG["HUD_SPECTATING"]	= "OGLĄDASZ"
LANG["HUD_YOUDIED"]		= "Nie żyjesz!"

LANG["CHAT_STARTING_MAPVOTE"] = "Runda się zakończyła. Rozpoczynanie głosowania..."

-- This used for HUD Taunt Timer
LANG["HUD_PROP_TAUNT_TIME"]	= "Losowa podpowiedź"
LANG["HUD_PROP_CTAUNT_TIME"] = "Niest. podpowiedź"

LANG["PHXM_TAB_PLUGINS"]				= "Dodatki i pluginy"

-- Plugins Section
LANG["PLUGINS_NO_PLUGINS"]				= "Nie zainstalowano dodatków. Rozpocznij przeglądanie tutaj!"
LANG["PLUGINS_BROWSE_MORE"]				= "Przeglądaj dodatki"
LANG["PLUGINS_SERVER_HAS_NO_PLUGINS"]	= "A niech to! Ten serwer nie posiada żadnych dodatków ani pluginów"
LANG["PLUGINS_SERVER_SETTINGS"]			= "-- Ustawienia Serwera --"
LANG["PLUGINS_CLIENT_SETTINGS"]			= "-- Ustawienia Klienta --"

-- Text Entries
LANG["TEXTENTRY_FZ_SINGLE"] = "Ścieżka dźwięku zamrażania kamery" -- this one is for ph_fc_cue_path command
LANG["TEXTENTRY_MV_PREFIX"] = "Prefiks map dla Głosowania"			 -- the map previx for mv_mapprefix

-- Add to Language Table.
PHX.LANGUAGES[LANG.code] = LANG
