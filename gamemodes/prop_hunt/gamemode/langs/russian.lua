-- Thank you for berry for contribution!

local LANG = {}

LANG.code = "ru"

LANG.Name 		 	= "Русский"
LANG.NameEnglish	= "Russian"
LANG.Author			= "berry" -- Only accept STRINGS.
-- Can Accept: String, and Table.
LANG.AuthorURL		= "http://steamcommunity.com/profiles/76561198158864042"

-- Special Section that isn't String-based
LANG.SUICIDEMSG = { --> FRETTA
	"суицид!", -- i believe this was from 9gag joke.
	"умер мистически.",
	"умер от магии.",
	"ноу-скоупнул себя.",
	"просто вышел в ярости.",
	"пьян.",
	"умер... удачи в следующий раз!",
	"шлёпнул себя.",
	"споткнулся об палку.",
	"умер от силы.",
	"стал рэгдоллом.",
}

LANG.RANDOM_SPECTATORS = { --> FRETTA
	"ушёл наблюдать и отдыхать.",
	"ушёл, чтобы увидеть как вы бегаете.",
	"ушёл, чтобы увидеть некоторые вещи.",
	" ",
}

-- List of string-based translation

-- // FRETTA SECTION \\
--  FRETTA: Kill text (X killed Y)
LANG["HUD_KILLED"]				= "убил"

-- FRETTA: HUDs
LANG["HUD_TIME"] 				= "ВРЕМЯ"
LANG["HUD_ROUND"]				= "РАУНД"
LANG["HUD_WAITPLY"]				= "Ожидаем других игроков..."
LANG["HUD_DEAD"]				= "(МЁРТВ) "

LANG["HUD_TEAMWIN"]				= "%s выиграли!"
LANG["HUD_LOSE"]				= "Ничья, все проиграли!"
LANG["MISC_TIMELEFT"]			= "Осталось: %s"
LANG["MISC_GAMEEND"] 			= "Игра закончится после этого раунда"

-- FRETTA: Team selection screen (F2)
LANG["DERMA_TEAMSELECT"]		= "Выберите команду"

-- FRETTA: F1 screeen
LANG["DERMA_RTV"] 				= "Голосование за смену карты (RTV)"
LANG["DERMA_PHMENU"] 			= "Меню Prop Hunt"
LANG["DERMA_CHANGETEAM"]		= "Сменить команду"

-- FRETTA: Scoreboard
LANG["DERMA_PLAYER"]			= "(Игроков: %d)"	
LANG["DERMA_PLAYERS"]			= "(Игроков: %d)"
LANG["DERMA_NAME"]				= "Имя"
LANG["DERMA_KILLS"]				= "Убийств"
LANG["DERMA_DEATHS"]			= "Смертей"
LANG["DERMA_PING"]				= "Пинг"

LANG["CHAT_JOINED"]				= " присоединяется к "
LANG["CHAT_JOINEDTHE"]			= " присоединяется к "

LANG["CHAT_SWAPBALANCE"]		= "%s переместили в команду %s для баланса."
LANG["CHAT_SWAPBALANCEYOU"]		= "Вы с другой командой поменялись местами, чтобы достичь идеального баланса." -- Smile... for even in death, you have become children of Thanos
-- // END OF FRETTA SECTION \\

LANG["HELP_F1"] 				= [[Prop Hunt (Кодовое имя) Проект X.

Проект X был создан для того, чтобы сделать Prop Hunt современным и настраиваемым.

Более подробную информацию можно найти на:
https://www.wolvindra.net/prophuntx

Чтобы увидеть больше информации, помощь и руководство, Нажмите клавишу [F1] а затем нажмите кнопку [Prop Hunt Menu].

Версия: ]].. PHX.VERSION ..[[ Ревизия: ]].. PHX.REVISION ..[[

Веселитесь!]]

-- Important!
LANG["LANGUAGE_CHANGED"]		= "Предпочитаемый язык был изменён на %s"

-- internal cl_menutypes section.
LANG["SUBTYPE_PREFERED_LANG"]	= "Предпочитаемый язык"
--LANG["SUBTYPE_TEXTENTRY_?"]	= "???"

-- Events
LANG["EV_PLAYER_CONNECT"]		= "%s присоединяется к серверу."
LANG["EV_PLAYER_JOINED"]		= "%s заходит на сервер."
LANG["EV_PLAYER_DISCONNECT"]	= "%s отключается от сервера (Причина: %s)"

-- HUD elements
LANG["HUD_HP"]					= "ЖИЗНЬ"
LANG["HUD_AMMO"] 				= "ПАТР"	-- obsolete
LANG["HUD_MAGSEC"]				= "МАГ. / ВТО." --Magazine Counts (separator) Secondary Magazine Counts

-- !!WEAPON NAMES CANNOT BE TRANSLATED, THEY USE FROM language.GetPhrase THEREFORE IT'S IMPOSSIBLE TO DO.

LANG["TEAM_PROPS"]				= "Объекты"
LANG["TEAM_HUNTERS"]			= "Охотники"

LANG["HUD_ROTLOCK"]				= "Вращение объекта: Заблокировано"
LANG["HUD_ROTFREE"]				= "Вращение объекта: Свободно"
LANG["HUD_KILLEDBY"]			= "Вы были убиты игроком %s"

LANG["HUD_AUTOTAUNT"]			= "Автонасмешка через %d сек."
LANG["HUD_AUTOTAUNT_ALT"]		= "Автонасмешка через %d"

LANG["HUD_TargetID"]			= "Игрок: %s (%d%%)" -- Player: <NAME> (<HEALTH>%)

LANG["HUD_BLINDED"]				= "Охотники смогут видеть и будут выпущены через %s"
LANG["HUD_UNBLINDED"]			= "Готовы или нет, мы уже идём!"

LANG["BLIND_RESPAWN_TEAM"]		= "Вы возродитесь только в команде %s через %d сек. в слепое время."
LANG["BLIND_RESPAWN"]			= "Вы возродитесь через %d сек. в слепое время."

LANG["MISC_ACCEPT"]				= "Принять"
LANG["MISC_OK"]					= "ОК"
LANG["MISC_CLOSE"]				= "Закрыть"
LANG["MISC_PREV"]				= "< ПРЕД."
LANG["MISC_NEXT"]				= "СЛЕД. >"
LANG["MISC_ACCESSDENIED"]		= "Доступ запрещён"

-- Chat messages
LANG["CHAT_NOPLAYERS"]			= "Не хватает игроков, чтобы начать игру!"
LANG["CHAT_SWAP"]				= "Команды поменялись местами!"

LANG["CHAT_SWAPTEAM_WARNING"]   = "Вы поменяли команды %dx (%dx МАКС.). После этого, Вы больше не можете переключиться на противоположную команду."
LANG["CHAT_SWAPTEAM_REVERT"]	= "Невозможно переключиться на команду %s, потому что вы превысили количество смен команд."

LANG["CHAT_PROP_NO_ROOM"] 		= "Нет места, чтобы смеить на этом объект!"

-- Notification
LANG["NOTIFY_IN_PROP_TEAM"]		= "Вы находитесь в команде Объектов с поддержкой поворота! Вы можете вращать объект, за который играете, перемещая мышь."
LANG["NOTIFY_ROTATE_NOTICE"]	= "Кроме того, вы можете переключить блокировку вращения, нажав (по умолчанию) клавишу [R]!"

-- Custom Taunt Window
LANG["TM_WARNING_CT_DISABLE"]	= "[PHX - Taunts] Внимание: На этом сервере отключены пользовательские насмешки."
LANG["TM_NO_TAUNTS"]			= "Внимание: В этой категории не было обнаружено насмешек."
LANG["TM_PLAY_ONLY_ALIVE"] 		= "Вы можете проигрывать пользовательские насмешки только тогда, когда вы живы."

LANG["TM_WINDOW_TITLE"]			= "Окно польз. насмешек Prop Hunt"
LANG["TM_NOTICE_PLSWAIT"]		= "Пожалуйста, подождите %s сек.!"
LANG["TM_NOTICE_PLAYPREVIEW"]	= "Предпросмотр насмешки: %s"

LANG["TM_TOOLTIP_PLAYTAUNT"] 	= "Проиграть насмешку"
LANG["TM_TOOLTIP_PREVIEW"]		= "Предпросмотр"
LANG["TM_TOOLTIP_PLAYCLOSE"]	= "Проиграть насмешку и закрыть"
LANG["TM_TOOLTIP_PLAYRANDOM"]	= "Проиграть случайную насмешку"
LANG["TM_TOOLTIP_CLOSE"]		= "Закрыть"
LANG["TM_MENU_CLOSE"]			= "Закрыть меню"

LANG["TM_DELAYTAUNT_NOT_EXIST"] = "Насмешка, которую вы выбрали, не была найдена на сервере!"
LANG["TM_DELAYTAUNT_PLSWAIT"]	= "Пожалуйста, подождите %s сек.!"

--[[
	PHX Menu window
]]
LANG["PHXM_WINDOW_TITLE"]		= "Prop Hunt X - Расширенные настройки и меню"
LANG["SERVER_INFO_MOTD"]		= "ИНФОРМАЦИЯ О СЕРВЕРЕ И ПРАВИЛА [MOTD]"

LANG["PHXM_TAB_HELP"]			= "Помощь и руководство"
LANG["PHXM_TAB_MUTE"]			= "Заглушить игроков"
LANG["PHXM_TAB_PLAYER"]			= "Настройки игрока"
LANG["PHXM_TAB_MODEL"] 			= "Браузер модели игрока"
LANG["PHXM_TAB_MODEL_DISABLED"]	= "Браузер модели игрока (Отключено)"
LANG["PHXM_TAB_ADMIN"]			= "Настройки администратора"
LANG["PHXM_TAB_ABOUT"]			= "Об Prop Hunt X"
LANG["PHXM_TAB_MAPVOTE"]		= "Настройки голосования за карту"

LANG["PHXM_CVAR_CHANGED"]		= "[Настройки] Переменная сервера %q изменена на %q"

--[[
	Player Mute Settings
]]
LANG["PHXM_MUTE_SELECT"]		= "Выберите любого игрока, которого хотите заглушить."

--[[ 
	Player Settings
]]
LANG["PHXM_PLAYER_OPTIONS"]		= "Настройки игрока"
LANG["PHXM_PLAYER_LANG"]		= "Языки"
LANG["PHXM_PLAYER_BIND"]		= "Привязка клавиш"
LANG["PHXM_PLAYER_HUDSETTINGS"]	= "Настройки интерфейса"

LANG["PHXM_PLAYER_TAUNT_KEY"]			= "Клавишка случайной насмешки"
LANG["PHXM_PLAYER_TAUNTWINDOW_KEY"]		= "Клавишка меню насмешек"
LANG["PHXM_PLAYER_ROTATLOCK_KEY"]		= "Клавишка блокировки вращения объекта"

LANG["PHXM_PLAYER_TOGGLE_HALOS"]		= "Переключить эффект подсвечивания при выборе пропа"
LANG["PHXM_PLAYER_IDNAMES"]				= "Показывать имена командных игроков над их головами (и через стены тоже)"
LANG["PHXM_PLAYER_ENDROUND_CUE"]		= "Проигрывать звук конца раунда"
LANG["PHXM_PLAYER_TAUNTMENU_AUTOCLOSE"]	= "Опция автоматического закрытия окна с насмешками при двойном щелчке по ней"
LANG["PHXM_PLAYER_SEE_HUNTER_LINE"]		= "Показывать линию куда смотрит Охотник, чтобы мы могли видеть их цель в режиме наблюдателя."
LANG["PHXM_PLAYER_SEE_LBALL_ICONS"]		= "Включить значок 'Lucky ball' отображаемый после их появления"
LANG["PHXM_PLAYER_SEE_CRYSTAL_ICONS"]	= "Включить значок 'Devil ball' отображаемый после их появления"

LANG["PHXM_PLAYER_USE_NEW_HUD"]			= "Использовать новый интерфейс PH: Enhanced"
LANG["PHXM_PLAYER_SHOW_TUTOR"]			= "Показать всплывающее окно с советом (Показывает только 2x при каждом вашем возрождении)"
LANG["PHXM_PLAYER_USE_NEW_CROSSHAIR"]	= "Включить сторонний прицел"
LANG["PHXM_PLAYER_SHOW_TEAM_TOPBAR"]	= "Показывать общее количество живых игроков команды в левом верхнем углу (По крайней мере 4 игрока будут показаны)"

--[[
	Player model Browser Section
]]
LANG["QUERY_MODEL_SELECTED"]	= "Модель %s была выбрана и будет применена после возрождения!"
LANG["QUERY_MODEL_INFO"]		= "Наименованная модель: %s - Доступна для: Всех"

LANG["MDL_MENU_REFRESH"] 		= "Обновить иконку"
LANG["MDL_MENU_PREVIEW"] 		= "Предпросмотр модели"
LANG["MDL_MENU_MODELINFO"] 		= "Информация модели"


LANG["MISC_APPLYMDL"] 			= "Применить модель"

LANG["PHXM_MODEL_DISABLED"] 	= "Извините, пользовательская модель игрока отключена на этом сервере!"
LANG["PHXM_PLAYERMODEL_SETFOV"]	= "  Поле зрения модели"

--[[
	Server Settings
]]
LANG["PHXM_ADMIN_OPTIONS"]		= "Настройки режима игры на стороне сервера (Отображается только для администраторов / владельцев)"
LANG["PHXM_ADMIN_MUSTALIVE"]	= "Вы должны быть в живой команде, чтобы сделать эту операцию."

--[[
	Language Override
]]
LANG["PHXM_ADMIN_LANGOVERRIDE"]	= "Резервный язык"

LANG["PHXM_ADMIN_FORCELANG"] 				= "Использовать принудительный язык? Это заменит язык клиента, чтобы использовать выбранный язык сервера."
LANG["PHXM_ADMIN_LANGTOUSE"]				= "Принудительный язык для использования."
LANG["PHXM_ADMIN_PLAYERDEFAULTLANG"] 		= "Язык игрока по умолчанию."

-- Gameplay settings
LANG["PHXM_ADMIN_CUSTOM_MODEL"]				= "Включить пользовательские модели для Охотников"
LANG["PHXM_ADMIN_CUSTOM_MODEL_PROP"]		= "Включить пользовательские модели для Объектов - Убедитесь включить Охотникам тоже."
LANG["PHXM_ADMIN_TAUNT_DELAY_CUSTOM"]		= "Задержка пользовательской насмешки (Секунд)"
LANG["PHXM_ADMIN_TAUNT_DELAY_RANDOM"]		= "Задержка обычной насмешки (Секунд)"
LANG["PHXM_ADMIN_TAUNT_DELAY_AUTO"]			= "Задержка автонасмешки (Секунд)"
LANG["PHXM_ADMIN_AUTOTAUNT_ENABLE"]			= "Включить автонасмешку"

LANG["PHXM_ADMIN_NOTICE_ROTATION"]			= "Показывать уведомление 'Вращение объекта' на экране при каждом появлении объекта"
LANG["PHXM_ADMIN_CAMERA_COLLIDE"]			= "Включить камеру пропа при столкновении со стеной"
LANG["PHXM_ADMIN_FREEZECAM"]				= "Включить функцию заморозки камеры для командных объектов"
LANG["PHXM_ADMIN_PROP_COLLIDE"]				= "Включить столкновение друг с другом объектами игроками"
LANG["PHXM_ADMIN_SWAP_TEAM"] 				= "Менять команды каждый раунд - Отключение означает, что команда не будет меняться навсегда."
LANG["PHXM_ADMIN_HUNTER_PENALTY"]			= "Штраф здоровья Охотнику"
LANG["PHXM_ADMIN_HUNTER_KILL_BONUS"]		= "Бонус Охотнику за убийство"
LANG["PHXM_ADMIN_HUNTER_SMG_GRENADES"]		= "SMG Гранат Охотнику"
LANG["PHXM_ADMIN_GAME_TIME"]				= "Общее время игры (Минут)"
LANG["PHXM_ADMIN_BLINDLOCK_TIME"]			= "Время ослепления и освобождения Охотников (Секунд)"
LANG["PHXM_ADMIN_ROUND_TIME"]				= "Общее время раунда (Секунд)"
LANG["PHXM_ADMIN_ROUNDS_PER_MAP"]			= "Всего раундов на карту"
LANG["PHXM_ADMIN_ENABLE_LUCKYBALL"]			= "Разрешить создание Lucky ball при разрушении объекта (Шанс 8%)"
LANG["PHXM_ADMIN_ENABLE_CRYSTAL"]			= "Разрешить создание Devil ball когда Охотник умирает (Шанс 70%)"
LANG["PHXM_ADMIN_WAIT_PLAYERS"]				= "Подождите, пока игроки начнут играть"
LANG["PHXM_ADMIN_WAIT_MIN_PLAYERS"]			= "Минимум игроков, чтобы ожидать начала игры (по умолчанию: 1)"
LANG["PHXM_ENABLE_PLAYER_JOIN_LEAVE"] 		= "Включить уведомление в чат игрока, который присоединился или вышел? Поставьте 0, если вы предпочитаете использовать собственное дополнение для чата."

LANG["PHXM_ADMIN_FORCEJOINBALANCE"]			= "Заставить игроков выравнивать команды при вступлении"
LANG["PHXM_ADMIN_ENABLETEAMBALANCE"]		= "Автоматически выравнивать команды в начале раунда (Баланс команд)"
LANG["PHXM_ADMIN_PICKUP_PROPS"] 			= "Разрешить становиться небольшим объектом? 0: Не разрешать, 1: Только Охотники, 2: Только Объекты, 3: Разрешить всем."

LANG["PHXM_ADMIN_TAUNTMODES"]			= "Режимы насмешек"
LANG["PHXM_ADMIN_TAUNTMODE_MODE"]		= "--[Текущий режим насмешки: %d ]--"
LANG["PHXM_ADMIN_TAUNTMODE0"]			= "Режим [0]: F3/Случайная насмешка"
LANG["PHXM_ADMIN_TAUNTMODE1"]			= "Режим [1]: C/Польз. насмешка"
LANG["PHXM_ADMIN_TAUNTMODE2"]			= "Режим [2]: Оба режима"
LANG["PHXM_ADMIN_TAUNTSOPEN"]			= "Открыть окно насмешек"

LANG["PHXM_MODE_DEFAULT"] 				= "--[ Режим подбирания объектов установлен на %d ]--"
LANG["PHXM_MODE0"]						= "Режим [0]: Не разрешено"
LANG["PHXM_MODE1"]						= "Режим [1]: Только Охотники"
LANG["PHXM_MODE2"]						= "Режим [2]: Только Объекты"
LANG["PHXM_MODE3"]						= "Режим [3]: Разрешено подбирать"

--[[
	Admin Developer Sections
]]
LANG["PHXM_ADMIN_DEVSECTION"]		= "Параметры разработчика/Экспериментальные функции"
LANG["PHXM_ADMIN_ROOMCHECK"]		= "Включить проверку границ? Это предотвращает застревание в предметах/стенах."
LANG["PHXM_ADMIN_USENEWMKBREN"]		= "Использовать новую модель для бонусного оружия Bren MK II (Требует перезагрузку карты)"
LANG["PHXM_ADMIN_BEVERBOSE"]		= "Разработчик: Будьте многословны - Включить PH:X печатать всю информацию и события подробно?"
LANG["PHXM_ADMIN_SHOWPLNAMEHEAD"]	= "Разрешить названия команд игроков отображаться на их экране."
LANG["PHXM_ADMIN_USESINGLE_FZCAM"]	= "Использовать один звук заморозки камеры вместо списка звуков (Используйте 'ph_fc_cue_path', чтобы определить путь прохождения звука для заморозки камеры)"
LANG["PHXM_ADMIN_MODELLISTINGTYPE"] = "Использовать устаревший список моделей : 0 = Все модели игрока (AddValidModel), 1 = Использовать Legacy: list.Get('PlayerOptionsModel')"
LANG["PHXM_ADMIN_JUMPPOWER"]		= "Дополнительный множитель силы прыжка для Объектов"
LANG["PHXM_ADMIN_ENABLE_OBB"]		= "Разработчик: Включить настраиваемые границы модели энтити для Объектов (OBB) Модификатор из данных конфигурации"
LANG["PHXM_ADMIN_RELOAD_OBB"]		= "Разработчик: Перезагрузить OBB Модификатор данных, при каждом перезапуске раунда"

--[[
	Experimental & PH:X Features
]]
LANG["PHXM_ADMIN_EXPERIMENTALPHX"]			= "Новые экспериментальные разделы PHX"

LANG["PHXM_ADMIN_HLA_COMBINE"]				= "Добавить поддержку модели солдата Комбайнов HLA"
LANG["PHXM_ADMIN_TEAMBALANCE"]				= "Включить функцию баланса команд"
LANG["PHXM_ADMIN_CHANGETEAM_LIMIT"]			= "Использовать ограничитель смены команд. Установите -1 чтобы отключить. "
LANG["PHXM_ADMIN_USENEWCHAT"]				= "Использовать новую окна чата (eChat) - Это временная замена. Если у вас уже есть, оставьте этот флажок."
LANG["PHXM_ADMIN_NEWCHATPOS"]				= "Новая позиция окна чата: Вычитать высоту (Y) Положение по N пикселям."
LANG["PHXM_ADMIN_RESPAWNONBLIND"]			= "Разрешить возрождение в слепое время"
LANG["PHXM_ADMIN_RESPAWNONBLIND_TEAM"]		= "Разрешить возрождение в слепое время только для определённой команды: 0: Все, 1: Охотники, 2: Объекты"
LANG["PHXM_ADMIN_REWSPANTIMEPERCENT"]		= "Процент слепово времени, который позволяет вам возродиться. По умолчанию 0.75 (означает 75% * Макс. слепово времени)"
LANG["PHXM_ADMIN_ALLOWRESPAWN_SPECTATOR"]	= "Разрешить возрождение в слепое время при смене на команду зрителей"
LANG["PHXM_ADMIN_ALLOWRESPAWN_TEAMCHANGE"]	= "Разрешить возрождение в слепое время при смене на другую команду (Включение этого не рекомендуется)"

--[[
	MapVote Settings
]]
LANG["PHXM_MV_SETTINGS"]			= "Настройки голосования за карту"

LANG["PHXM_MV_ALLOWCURMAP"]			= "Разрешить голосовать за текущую карту"
LANG["PHXM_MV_COOLDOWN"]			= "Включить перезарядку карты для голосования"
LANG["PHXM_MV_USE_ULX_VOTEMAPS"]	= "Использовать список карт из ULX Mapvote? Если нет, по умолчанию maps/*.bsp будут использованы."
LANG["PHXM_MV_MAPLIMIT"]			= "Количество карт для отображения."
LANG["PHXM_MV_TIMELIMIT"]			= "Время в секундах для голосования по умолчанию при голосовании."
LANG["PHXM_MV_MAPBEFOREREVOTE"]		= "Смен карты, необходимые для повторного появления карты"
LANG["PHXM_MV_RTVCOUNT"]			= "Сколько игроков необходимо использовать RTV (Rock the Vote)"

LANG["PHXM_MV_EXPLANATION1"]		= "Чтобы установить, какая карта должна быть в списке, используйте (например) [ mv_mapprefix 'ph_,cs_,de_' ] в консоли."
LANG["PHXM_MV_EXPLANATION2"]		= "Если вы используете ULX, используйте map_vote. Если нет, используйте mv_start."
LANG["PHXM_MV_EXPLANATION3"]		= "Действие голосования за карту (Чтобы отменить, просто напишите !unmap_vote (ULX) или mv_stop в консоль.)"

LANG["PHXM_MV_START"]		= "Начать голосование за карту"
LANG["PHXM_MV_STOP"]		= "Остановить голосование за карту"
--                  			  ^YOU VIOLATED THE LAW!


--[[ 
	Versioning, Credits or About section
]]
LANG["PHXM_ABOUT_VERSIONING"]		= "Версия: %s - Ревизия: %s"
LANG["PHXM_ABOUT_AUTHOR"]			= "От: %s"
LANG["PHXM_ABOUT_ENJOYING"]			= "Если вам нравится игра, подумайте о пожертвовании!"
LANG["PHXM_ABOUT_UPDATE"]			= "Обновления Prop Hunt X"
LANG["PHXM_ABOUT_LINKS"]			= "Ссылки и авторство"
LANG["PHXM_ABOUT_THANKS"]			= "Особая благодарность за поддержку, предложение и вклад:\n %s"
LANG["PHXM_ABOUT_BTN_DONATE"]		= "Поддержите PH:X пожертвованием"
LANG["PHXM_ABOUT_BTN_HOME"]			= "Домашняя страница PHX"
LANG["PHXM_ABOUT_BTN_GITHUB"]		= "GitHub репозиторий PHX"
LANG["PHXM_ABOUT_BTN_PLUGINS"]		= "Дополнения/Плагины PHX"
LANG["PHXM_ABOUT_BTN_CHANGELOGS"]	= "Список изменений PHX"

--[[
	Late Additionals
]]
-- fretta
LANG["HUD_SPECTATING"]	= "НАБЛЮДЕНИЕ"
LANG["HUD_YOUDIED"]		= "Вы умерли!"

LANG["CHAT_STARTING_MAPVOTE"] = "Раунд закончился. Начинаем голосование за следующую карту..."

-- This used for HUD Taunt Timer
LANG["HUD_PROP_TAUNT_TIME"]	= "Случ. насмешка"
LANG["HUD_PROP_CTAUNT_TIME"] = "Польз. насмешка"

LANG["PHXM_TAB_PLUGINS"]				= "Дополнения и плагины"

-- Plugins Section
LANG["PLUGINS_NO_PLUGINS"]				= "Плагины не установлены. Найдите больше плагинов здесь!"
LANG["PLUGINS_BROWSE_MORE"]				= "Просмотреть больше плагинов"
LANG["PLUGINS_SERVER_HAS_NO_PLUGINS"]	= "Извините, на этом сервере не установлены пользовательские дополнения/плагины."
LANG["PLUGINS_SERVER_SETTINGS"]			= "-- Настройки сервера --"
LANG["PLUGINS_CLIENT_SETTINGS"]			= "-- Настройки клиента --"

-- Text Entries
LANG["TEXTENTRY_FZ_SINGLE"] = "Путь файла для звука заморозки камеры" -- this one is for ph_fc_cue_path command
LANG["TEXTENTRY_MV_PREFIX"] = "Приставка к названию карты для меню голосования"			 -- the map previx for mv_mapprefix

-- Add to Language Table.
PHX.LANGUAGES[LANG.code] = LANG