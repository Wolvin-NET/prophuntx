-- comment reduced to save space
local LANG = {}
LANG.code = "ru"
LANG.Name 		 	= "Русский"
LANG.NameEnglish	= "Russian"
LANG.Author			= "berry"
LANG.AuthorURL		= "https://steamcommunity.com/profiles/76561198158864042"
LANG.SUICIDEMSG = {  -- there was addition text here but feel free to add more.
	"убивает себя!",
	"погибает при необъяснимых обстоятельствах.",
	"умер от магии.",
	"ноу-скоупнул себя.",
	"покидает игру в ярости.",
	"пьян.",
	"погибает. Повезёт в другой раз!",
	"шлёпнул себя.",
	"спотыкается об палку.",
	"погибает от неизвестной силы.",
	"погибает. F.",
        "чувствует сожаление после убийства нескольких невинных объектов.",
        "попадает в бэкрум.",
        "пытался вымереть.",
        "дед.",
        "в панике, поэтому попытался стрелять по всем объектам.",
        "НЕ НАДО, ДЯДЯ.",
	"стал рэгдоллом.",
}
LANG.RANDOM_SPECTATORS = {
	"пошёл наблюдать и отдыхать.",
	"пошёл наблюдать как вы бегаете.",
	"пошёл наблюдать за бегающим чайником.",
	" ",
}
LANG["PHX_TEAM_CONNECTING"] 	= "Подключающиеся"
LANG["PHX_TEAM_PROPS"]			= "Объекты"
LANG["PHX_TEAM_HUNTERS"] 		= "Охотники"
LANG["PHX_TEAM_UNASSIGNED"]		= "Неназначенные"
LANG["PHX_TEAM_SPECTATOR"] 		= "Наблюдатели"
-- Fretta Components
LANG["HUD_KILLED"]				= "убит"
LANG["HUD_TIME"] 				= "ВРЕМЯ"
LANG["HUD_ROUND"]				= "РАУНД"
LANG["HUD_WAITPLY"]				= "Ожидаем других игроков..."
LANG["HUD_DEAD"]				= "(МЁРТВ) "
LANG["HUD_TEAMWIN"]				= "%s выиграли!"
LANG["HUD_LOSE"]				= "Ничья, все проиграли!"
LANG["MISC_TIMELEFT"]			= "Осталось: %s"
LANG["MISC_GAMEEND"] 			= "Игра закончится после этого раунда"
LANG["DERMA_TEAMSELECT"]		= "Выберите команду"
LANG["DERMA_RTV"] 				= "Сменить карту (RTV)"
LANG["DERMA_PHMENU"] 			= "Меню Prop Hunt"
LANG["DERMA_CHANGETEAM"]		= "Сменить команду"
LANG["DERMA_PLAYER"]			= "(Игроков: %d)"	
LANG["DERMA_PLAYERS"]			= "(Игроков: %d)"
LANG["DERMA_NAME"]				= "Имя"
LANG["DERMA_KILLS"]				= "Убийств"
LANG["DERMA_DEATHS"]			= "Смертей"
LANG["DERMA_PING"]				= "Пинг"
LANG["DERMA_SERVER_TAG"]			= "СВ"
LANG["DERMA_BOT_TAG"]				= "БОТ"
LANG["DERMA_GAMEMODE_CREDITS"]			= "%s | Версии: %s - Рев. %s"	
LANG["CHAT_JOINED"]				= " присоединяется к "
LANG["CHAT_JOINEDTHE"]			= " присоединяется к "
LANG["CHAT_SWAPBALANCE"]		= "%s переместили в команду %s для баланса."
LANG["CHAT_SWAPBALANCEYOU"]		= "Вы с другой командой поменялись местами, чтобы достичь идеального баланса."
LANG["SPASHSCREEN_BY_X"]		= "создано: %s"
LANG["HELP_DONATORS_AND_CONTRIBUTORS"]  = "\n\nСпонсоры и участники вклада в режим:\n- %s"
LANG["HELP_F1"] 				= [[Prop Hunt проекта X.

Проект, призванный сделать Prop Hunt более современным и настраиваемым.

Более подробную информацию можно найти на:
https://gmodgameservers.com/prophuntx

Чтобы увидеть больше информации, помощь и руководство, Нажмите клавишу [F1] а затем нажмите кнопку [Prop Hunt Menu].

Версия: ]].. PHX.VERSION ..[[ Ревизия: ]].. PHX.REVISION ..[[

Веселитесь!]]
-- General
LANG["LANGUAGE_CHANGED"]		            = "Язык был изменён на %s"
LANG["SUBTYPE_PREFERED_LANG"]	            = "Язык"
LANG["EV_PLAYER_CONNECT"]		            = "%s присоединяется к серверу."
LANG["EV_PLAYER_JOINED"]		            = "%s заходит на сервер."
LANG["EV_PLAYER_DISCONNECT"]	            = "%s отключается от сервера (Причина: %s)"
LANG["HUD_HP"]					            = "ЖИЗНЬ"
LANG["HUD_AMMO"] 				            = "ПАТР"
LANG["HUD_MAGSEC"]				            = "МАГ. / ВТО."
LANG["TEAM_PROPS"]				            = LANG["PHX_TEAM_PROPS"]
LANG["TEAM_HUNTERS"]			            = LANG["PHX_TEAM_HUNTERS"]
LANG["HUD_ROTLOCK"]				            = "Вращение объекта: Заблокировано"
LANG["HUD_ROTFREE"]				            = "Вращение объекта: Свободно"
LANG["HUD_KILLEDBY"]			            = "Вы были убиты игроком %s"
LANG["HUD_AUTOTAUNT"]			            = "Автонасмешка через %d сек."
LANG["HUD_AUTOTAUNT_ALT"]		            = "Автонасмешка через %d"
LANG["HUD_TargetID"]			            = "Игрок: %s (%d%%)"
LANG["HUD_BLINDED"]				            = "%s смогут видеть и будут выпущены через %s"
LANG["HUD_UNBLINDED"]			            = "Готовы или нет, мы уже идём!"
LANG["BLIND_RESPAWN_TEAM"]		            = "Вы возродитесь только в команде %s через %d сек. в слепое время."
LANG["BLIND_RESPAWN"]			            = "Вы возродитесь через %d сек. в слепое время."
LANG["MISC_ACCEPT"]				            = "Принять"
LANG["MISC_OK"]					            = "ОК"
LANG["MISC_CLOSE"]				            = "Закрыть"
LANG["MISC_PREV"]				            = "< ПРЕД."
LANG["MISC_NEXT"]				            = "СЛЕД. >"
LANG["MISC_ACCESSDENIED"]		            = "Доступ запрещён"
LANG["CHAT_NOPLAYERS"]			            = "Не хватает игроков для начала игры!"
LANG["CHAT_SWAP"]				            = "Команды поменялись местами!"
LANG["CHAT_SWAPTEAM_WARNING"]               = "Вы сменили команду %dx (%dx МАКС.). После этого, вы больше не можете переключиться на противоположную команду."
LANG["CHAT_SWAPTEAM_REVERT"]	            = "Невозможно переключиться на команду %s, потому что вы превысили количество смен команд."
LANG["CHAT_PROP_NO_ROOM"] 		            = "Нет места, чтобы сменить на этом объект!"
LANG["NOTIFY_IN_PROP_TEAM"]		            = "Вы находитесь в команде объектов с поддержкой поворота! вы можете вращать объект, за который играете, перемещая мышь."
LANG["NOTIFY_ROTATE_NOTICE"]	            = "Кроме того, вы можете переключить блокировку вращения, нажав (по умолчанию) клавишу [R]!"
-- Taunt Menu
LANG["TM_WARNING_CT_DISABLE"]	            = "[PHX - Taunts] Внимание: На этом сервере отключены пользовательские насмешки."
LANG["TM_NO_TAUNTS"]			            = "Внимание: В этой категории не было обнаружено насмешек."
LANG["TM_PLAY_ONLY_ALIVE"] 		            = "Вы можете проигрывать пользовательские насмешки только тогда, когда вы живы."
LANG["TM_WINDOW_TITLE"]			            = "Окно польз. насмешек Prop Hunt"
LANG["TM_NOTICE_PLSWAIT"]		            = "Пожалуйста, подождите %s сек. до окончания случайной насмешки!"
LANG["TM_NOTICE_PLAYPREVIEW"]	            = "Предпросмотр насмешки: %s"
LANG["TM_TOOLTIP_PLAYTAUNT"] 	            = "Проиграть насмешку"
LANG["TM_TOOLTIP_PREVIEW"]		            = "Предпросмотр"
LANG["TM_TOOLTIP_PLAYCLOSE"]	            = "Проиграть насмешку и закрыть"
LANG["TM_TOOLTIP_PLAYRANDOM"]	            = "Проиграть случайную насмешку"
LANG["TM_TOOLTIP_CLOSE"]		            = "Закрыть"
LANG["TM_MENU_CLOSE"]			            = "Закрыть меню"
LANG["TM_DELAYTAUNT_NOT_EXIST"]             = "Насмешка, которую вы выбрали, не была найдена на сервере!"
LANG["TM_DELAYTAUNT_PLSWAIT"]	            = "Пожалуйста, подождите %s сек.!"
-- Prop Hunt Help Menu
LANG["PHXM_WINDOW_TITLE"]		            = "Prop Hunt X - Расширенные настройки и меню"
LANG["SERVER_INFO_MOTD"]		            = "ИНФОРМАЦИЯ О СЕРВЕРЕ И ПРАВИЛА [MOTD]"
LANG["PHXM_TAB_HELP"]			            = "Помощь и руководство"
LANG["PHXM_TAB_MUTE"]			            = "Заглушить игроков"
LANG["PHXM_TAB_PLAYER"]			            = "Настройки игрока"
LANG["PHXM_TAB_MODEL"] 			            = "Браузер модели игрока"
LANG["PHXM_TAB_MODEL_DISABLED"]	            = "Браузер модели игрока (Отключено)"
LANG["PHXM_TAB_ADMIN"]			            = "Настройки администратора"
LANG["PHXM_TAB_ABOUT"]			            = "Об PH:X"
LANG["PHXM_TAB_MAPVOTE"]		            = "Голосование за карту"
LANG["PHXM_TAB_PLUGINS"]		            = "Дополнения/плагины"
LANG["PHXM_CVAR_CHANGED"]		            = "[Настройки] Переменная сервера %q изменена на %q"
LANG["PHXM_MUTE_SELECT"]		            = "Выберите любого игрока, которого хотите заглушить."
LANG["PHXM_PLAYER_OPTIONS"]		            = "Настройки игрока"
LANG["PHXM_PLAYER_LANG"]		            = "Языки"
LANG["PHXM_PLAYER_BIND"]		            = "Привязка клавиш"
LANG["PHXM_PLAYER_HUDSETTINGS"]	            = "Настройки интерфейса"
LANG["PHXM_PLAYER_TAUNT_KEY"]			    = "Клавиша случайной насмешки"
LANG["PHXM_PLAYER_TAUNTWINDOW_KEY"]		    = "Клавиша меню насмешек"
LANG["PHXM_PLAYER_ROTATLOCK_KEY"]		    = "Клавиша блокировки вращения объекта"
LANG["PHXM_PLAYER_TOGGLE_HALOS"]		    = "Переключить эффект подсвечивания при выборе объекта"
LANG["PHXM_PLAYER_IDNAMES"]				    = "Показывать имена командных игроков над их головами (и через стены тоже)"
LANG["PHXM_PLAYER_ENDROUND_CUE"]		    = "Проигрывать звук конца раунда"
LANG["PHXM_PLAYER_TAUNTMENU_AUTOCLOSE"]	    = "Опция автоматического закрытия окна с насмешками при двойном щелчке по ней"
LANG["PHXM_PLAYER_SEE_HUNTER_LINE"]		    = "Показывать линию куда смотрит охотник, чтобы мы могли видеть их цель в режиме наблюдателя."
LANG["PHXM_PLAYER_SEE_LBALL_ICONS"]		    = "Включить значок «Lucky ball» отображаемый после его появления"
LANG["PHXM_PLAYER_SEE_CRYSTAL_ICONS"]	    = "Включить значок «Devil ball» отображаемый после его появления"
LANG["PHXM_PLAYER_USE_NEW_HUD"]			    = "Использовать новый интерфейс PH: Enhanced"
LANG["PHXM_PLAYER_SHOW_TUTOR"]			    = "Показать всплывающее окно с советом (Показывает только два раза при каждом вашем возрождении)"
LANG["PHXM_PLAYER_USE_NEW_CROSSHAIR"]	    = "Включить сторонний прицел"
LANG["PHXM_PLAYER_SHOW_TEAM_TOPBAR"]	    = "Показывать общее количество живых игроков команды в левом верхнем углу (По крайней мере 4 игрока будут показаны)"
LANG["QUERY_MODEL_SELECTED"]	            = "Модель %s была выбрана и будет применена после возрождения!"
LANG["QUERY_MODEL_INFO"]		            = "Наименованная модель: %s - Доступна для всех"
LANG["MDL_MENU_REFRESH"] 		            = "Обновить иконку"
LANG["MDL_MENU_PREVIEW"] 		            = "Предпросмотр модели"
LANG["MDL_MENU_MODELINFO"] 		            = "Информация модели"
LANG["MISC_APPLYMDL"] 			            = "Применить модель"
LANG["PHXM_MODEL_DISABLED"] 	            = "Извините, пользовательские модели игрока отключены на этом сервере!"
LANG["PHXM_PLAYERMODEL_SETFOV"]	            = "  Поле зрения модели"
LANG["PHXM_ADMIN_OPTIONS"]		            = "Настройки режима игры на стороне сервера (Отображается только для администраторов / владельцев)"
LANG["PHXM_ADMIN_MUSTALIVE"]	            = "Вы должны быть живы, чтобы совершить эту операцию."
LANG["PHXM_ADMIN_LANGOVERRIDE"]	            = "Принудительный язык"
LANG["PHXM_ADMIN_FORCELANG"] 				= "Использовать принудительный язык? Это заменит язык клиента, чтобы использовать выбранный язык сервера."
LANG["PHXM_ADMIN_LANGTOUSE"]				= "Принудительный язык для использования."
LANG["PHXM_ADMIN_PLAYERDEFAULTLANG"] 		= "Язык игрока по умолчанию."
LANG["PHXM_ADMIN_CUSTOM_MODEL"]				= "Включить пользовательские модели для охотников"
LANG["PHXM_ADMIN_CUSTOM_MODEL_PROP"]		= "Включить пользовательские модели для объектов - Убедитесь включить охотникам тоже."
LANG["PHXM_ADMIN_TAUNT_DELAY_CUSTOM"]		= "Задержка пользовательской насмешки (секунд)"
LANG["PHXM_ADMIN_TAUNT_DELAY_RANDOM"]		= "Задержка обычной насмешки (секунд)"
LANG["PHXM_ADMIN_TAUNT_DELAY_AUTO"]			= "Задержка автонасмешки (секунд)"
LANG["PHXM_ADMIN_AUTOTAUNT_ENABLE"]			= "Включить автонасмешку (Изменения таймера будут применены в следующем раунде)"
LANG["PHXM_ADMIN_NOTICE_ROTATION"]			= "Показывать уведомление 'Вращение объекта' на экране при каждом появлении объекта"
LANG["PHXM_ADMIN_CAMERA_COLLIDE"]			= "Включить камеру объекта при столкновении со стеной"
LANG["PHXM_ADMIN_FREEZECAM"]				= "Включить функцию заморозки камеры для команды объектов"
LANG["PHXM_ADMIN_PROP_COLLIDE"]				= "Включить столкновение объектов с игроками"
LANG["PHXM_ADMIN_SWAP_TEAM"] 				= "Менять команды каждый раунд - Отключение означает, что команда не будет меняться навсегда."
LANG["PHXM_ADMIN_HUNTER_PENALTY"]			= "Штраф здоровья охотнику"
LANG["PHXM_ADMIN_HUNTER_KILL_BONUS"]		= "Бонус охотнику за убийство"
LANG["PHXM_ADMIN_HUNTER_SMG_GRENADES"]		= "Подствольных гранат охотнику"
LANG["PHXM_ADMIN_GAME_TIME"]				= "(Требуется перезапуск карты) Общее время игры (Минут)"
LANG["PHXM_ADMIN_BLINDLOCK_TIME"]			= "Время ослепления и освобождения охотников (Секунд)"
LANG["PHXM_ADMIN_ROUND_TIME"]				= "(Требуется перезапуск карты) Общее время раунда (Секунд)"
LANG["PHXM_ADMIN_ROUNDS_PER_MAP"]			= "(Требуется перезапуск карты) Всего раундов на карту"
LANG["PHXM_ADMIN_ENABLE_LUCKYBALL"]			= "Разрешить создание «Lucky ball» при разрушении объекта-игрока (Шанс 8%)"
LANG["PHXM_ADMIN_ENABLE_CRYSTAL"]			= "Разрешить создание «Devil ball», когда охотник умирает (Всегда)"
LANG["PHXM_ADMIN_WAIT_PLAYERS"]				= "Подождите, пока игроки начнут играть"
LANG["PHXM_ADMIN_WAIT_MIN_PLAYERS"]			= "Минимум игроков для ожидания начала игры (по умолчанию: 1)"
LANG["PHXM_ENABLE_PLAYER_JOIN_LEAVE"] 		= "Включить уведомление в чат игрока, который присоединился или вышел? Поставьте 0, если вы предпочитаете использовать собственное дополнение для чата."
LANG["PHXM_ADMIN_FORCEJOINBALANCE"]			= "Заставить игроков выравнивать команды при вступлении"
LANG["PHXM_ADMIN_ENABLETEAMBALANCE"]		= "Автоматически выравнивать команды в начале раунда (Баланс команд)"
LANG["PHXM_ADMIN_PICKUP_PROPS"] 			= "Разрешить становиться небольшим объектом? 0: Не разрешать, 1: Только охотники, 2: Только объекты, 3: Разрешить всем."
LANG["PHXM_ADMIN_TAUNTMODES"]			    = "Режимы насмешек"
LANG["PHXM_ADMIN_TAUNTMODE_MODE"]		    = "--[Текущий режим насмешки: %d ]--"
LANG["PHXM_ADMIN_TAUNTMODE0"]			    = "Режим [0]: F3/Случайная насмешка"
LANG["PHXM_ADMIN_TAUNTMODE1"]			    = "Режим [1]: C/Польз. насмешка"
LANG["PHXM_ADMIN_TAUNTMODE2"]			    = "Режим [2]: Оба режима"
LANG["PHXM_ADMIN_TAUNTSOPEN"]			    = "Открыть окно насмешек"
LANG["PHXM_MODE_DEFAULT"] 				    = "--[ Режим подбирания объектов установлен на %d ]--"
LANG["PHXM_MODE0"]						    = "Режим [0]: Не разрешено"
LANG["PHXM_MODE1"]						    = "Режим [1]: Только охотники"
LANG["PHXM_MODE2"]						    = "Режим [2]: Только объекты"
LANG["PHXM_MODE3"]						    = "Режим [3]: Разрешено подбирать"
LANG["PHXM_ADMIN_DEVSECTION"]		        = "Параметры разработчика/Экспериментальные функции"
LANG["PHXM_ADMIN_ROOMCHECK"]		        = "Включить проверку границ? Это предотвращает застревание в предметах/стенах."
LANG["PHXM_ADMIN_USENEWMKBREN"]		        = "Использовать новую модель для бонусного оружия Bren MK II (Требует перезагрузку карты)"
LANG["PHXM_ADMIN_BEVERBOSE"]		        = "Разработчик: Будьте многословны - Включить PH:X печатать всю информацию и события подробно?"
LANG["PHXM_ADMIN_SHOWPLNAMEHEAD"]	        = "Разрешить названия команд игроков отображаться на их экране."
LANG["PHXM_ADMIN_USESINGLE_FZCAM"]	        = "Использовать один звук заморозки камеры вместо списка звуков (Используйте 'ph_fc_cue_path', чтобы определить путь прохождения звука для заморозки камеры)"
LANG["PHXM_ADMIN_MODELLISTINGTYPE"]         = "Использовать устаревший список моделей : 0 = Все модели игрока (AddValidModel), 1 = Использовать Legacy: list.Get('PlayerOptionsModel')"
LANG["PHXM_ADMIN_JUMPPOWER"]		        = "Дополнительный множитель силы прыжка для Объектов"
LANG["PHXM_ADMIN_ENABLE_OBB"]		        = "Разработчик: Включить настраиваемые границы модели энтити для Объектов (OBB) Модификатор из данных конфигурации"
LANG["PHXM_ADMIN_RELOAD_OBB"]		        = "Разработчик: Перезагрузить модификатор данных OBB, при каждом перезапуске раунда"
LANG["PHXM_ADMIN_EXPERIMENTALPHX"]			= "Новые экспериментальные разделы PHX"
LANG["PHXM_ADMIN_HLA_COMBINE"]				= "Добавить поддержку модели солдата Комбайнов из HL: Alyx"
LANG["PHXM_ADMIN_TEAMBALANCE"]				= "Настройки баланса команд"
LANG["PHXM_ADMIN_CHANGETEAM_LIMIT"]			= "Использовать ограничитель смены команд. Установите -1 чтобы отключить. "
LANG["PHXM_ADMIN_USENEWCHAT"]				= "Использовать новую окна чата (eChat) - Это временная замена. Если у вас уже есть, оставьте этот флажок."
LANG["PHXM_ADMIN_NEWCHATPOS"]				= "Новая позиция окна чата: Вычитать высоту (Y) положения по N пикселям."
LANG["PHXM_ADMIN_RESPAWNONBLIND"]			= "Разрешить возрождение в слепое время"
LANG["PHXM_ADMIN_RESPAWNONBLIND_TEAM"]		= "Разрешить возрождение в слепое время только для определённой команды: 0: Все, 1: Охотники, 2: Объекты"
LANG["PHXM_ADMIN_REWSPANTIMEPERCENT"]		= "Процент слепого времени, который позволяет вам возродиться. По умолчанию 0.75 (означает 75% * Макс. слепого времени)"
LANG["PHXM_ADMIN_ALLOWRESPAWN_SPECTATOR"]	= "Разрешить возрождение в слепое время при смене на команду зрителей"
LANG["PHXM_ADMIN_ALLOWRESPAWN_TEAMCHANGE"]	= "Разрешить возрождение в слепое время при смене на другую команду (Включение этого не рекомендуется)"
-- MapVote Settings
LANG["PHXM_MV_SETTINGS"]			        = "Настройки голосования за карту"
LANG["PHXM_MV_ALLOWCURMAP"]			        = "Разрешить голосовать за текущую карту"
LANG["PHXM_MV_COOLDOWN"]			        = "Включить перезарядку карты для голосования"
LANG["PHXM_MV_USE_ULX_VOTEMAPS"]	        = "Использовать список карт из ULX Mapvote? Если нет, по умолчанию maps/*.bsp будут использованы."
LANG["PHXM_MV_MAPLIMIT"]			        = "Количество карт для отображения."
LANG["PHXM_MV_TIMELIMIT"]			        = "Время в секундах для голосования по умолчанию при голосовании."
LANG["PHXM_MV_MAPBEFOREREVOTE"]		        = "Смен карты, необходимые для повторного появления карты"
LANG["PHXM_MV_RTVCOUNT"]			        = "Сколько игроков необходимо использовать RTV (Rock the Vote)"
LANG["PHXM_MV_EXPLANATION1"]		        = "Чтобы установить, какая карта должна быть в списке, используйте (например) [ mv_map_prefix 'phx_,ph_,cs_,de_' ] в консоли."
LANG["PHXM_MV_EXPLANATION2"]		        = "Если вы используете ULX, используйте map_vote. Если нет, используйте mv_start."
LANG["PHXM_MV_EXPLANATION3"]		        = "Действие голосования за карту (Чтобы отменить, просто напишите !unmap_vote (ULX) или mv_stop в консоль.)"
LANG["PHXM_MV_START"]		                = "Начать голосование за карту"
LANG["PHXM_MV_STOP"]		                = "Остановить голосование за карту"
-- Versioning
LANG["PHXM_ABOUT_VERSIONING"]		        = "Версия: %s - Ревизия: %s"
LANG["PHXM_ABOUT_AUTHOR"]			        = "Создатель: %s"
LANG["PHXM_ABOUT_ENJOYING"]			        = "Если вам нравится игра, подумайте о пожертвовании!"
LANG["PHXM_ABOUT_UPDATE"]			        = "Обновления Prop Hunt X"
LANG["PHXM_VIEW_UPDATE_INFO"]			    = "Информация обновления"
LANG["PHXM_CHECK_FOR_UPDATES"]			    = "Проверка обновлений"
LANG["PHXM_UPDATE_FOUND_TEXT"]			    = "Обновление было проверено. Дополнительную информацию можно получить в консоли.\n\nВы хотите просмотреть новости и информацию об обновлении?"
LANG["PHXM_UPDATE_FOUND_TITLE"]             = "Информация"
LANG["PHXM_UPDATE_FOUND_BUTTON"]           	= "Просмотреть"
LANG["UPDATE_NOTIFY_MSG_NOTFOUND"]			= "Обновление не найдено. Пожалуйста, сначала нажмите на кнопку «Проверить наличие обновлений»!"
LANG["UPDATE_NOTIFY_MSG_TITLE"]				= "Обновления не найдены"
LANG["UPDATE_NOTIFY_WINDOW_TITLE"]			= "Уведомление"
LANG["UPDATE_RTBOX_APPEND"]					= "\n\nК вашему сведению:\nВ настоящее время вы используете версию: %s с ревизией: %s"
LANG["UPDATE_BTN_SEEFULL"]					= "Все изменения"
LANG["PHXM_ABOUT_LINKS"]			        = "Ссылки и авторство"
LANG["PHXM_ABOUT_THANKS"]			        = "Особая благодарность за поддержку, предложение и вклад:\n %s"
LANG["PHXM_ABOUT_BTN_DONATE"]		        = "Поддержите PH:X пожертвованием"
LANG["PHXM_ABOUT_BTN_HOME"]			        = "Основная страница PHX"
LANG["PHXM_ABOUT_BTN_GITHUB"]		        = "GitHub репозиторий PHX"
LANG["PHXM_ABOUT_BTN_PLUGINS"]		        = "Дополнения/плагины PHX"
LANG["PHXM_ABOUT_BTN_CHANGELOGS"]	        = "Список изменений PHX"
--== Late Addition #2 ==--
-- Fretta & MApVote
LANG["HUD_SPECTATING"]	                    = "НАБЛЮДЕНИЕ"
LANG["HUD_YOUDIED"]		                    = "Вы умерли!"
LANG["CHAT_STARTING_MAPVOTE"]               = "Раунд закончился. Начинаем голосование за следующую карту..."
LANG["MISC_GAME_ENDED"]		                = "Игра закончилась." -- pls fix
-- Taunt Timing for Auto & Custom
LANG["HUD_PROP_TAUNT_TIME"]	                = "Случ. насмешка"
LANG["HUD_PROP_CTAUNT_TIME"]                = "Польз. насмешка"
-- Plugins Section
LANG["PLUGINS_NO_PLUGINS"]				    = "Плагины не установлены. Найдите больше плагинов здесь!"
LANG["PLUGINS_BROWSE_MORE"]				    = "Просмотреть больше плагинов"
LANG["PLUGINS_SERVER_HAS_NO_PLUGINS"]	    = "Извините, на этом сервере не установлены пользовательские дополнения/плагины."
LANG["PLUGINS_SERVER_SETTINGS"]			    = "-- Настройки сервера --"
LANG["PLUGINS_CLIENT_SETTINGS"]			    = "-- Настройки клиента --"
-- Prop Hunt Help Menu: Text Entries
LANG["TEXTENTRY_FZ_SINGLE"]                 = "Путь файла для звука заморозки камеры"
LANG["TEXTENTRY_MV_PREFIX"]                 = "Приставка к названию карты для меню голосования"
--== Late Addition #3 ==--
-- Fretta, General & Menus
LANG["PHXM_ABOUT_BTN_WIKI"]			        = "Вики и руководства PHX"
LANG["HUD_AUTOTAUNT_DISABLED"]		        = "Автонасмешка отключена."
LANG["HUD_AUTOTAUNT_WAITFORUPDATE"]	        = "Автонасмешка синхронизируется..."
LANG["PROP_PLAYERMDL_BANNED"]	            = "Пользовательская модель игрока объекта была заблокирована на сервере."
LANG["NOTIFY_PROP_ENTTYPE"]				    = "Нажмите [E] для взаимодействия, [кл. мыши] для копирования объекта."
LANG["NOTIFY_CUST_ENT_TYPE_IS_ON"]		    = "[PHX] Примечание: Нажмите [E] для взаимодействия с объектом, нажмите [кл. мыши] для копирования объекта."
-- MapVote: Late #3
LANG["PHXM_MV_VOTEROCKED"]				    = " Голосование по смене карты начнётся в конце раунда"
LANG["PHXM_MV_VOTEROCKED_IMMINENT"]		    = "Голосование по смене карты неизбежно"
LANG["PHXM_MV_VOTEROCKED_PLY_TOTAL"]	    = "%s проголосовал. ( %d / %d )"
LANG["PHXM_MV_MUST_WAIT"]				    = "Вы должны немного подождать перед голосованием!"
LANG["PHXM_MV_VOTEINPROG"]				    = "Голосование уже идёт!"
LANG["PHXM_MV_HAS_VOTED"]				    = "Вы уже приняли участие в голосовании за смену карты!"
LANG["PHXM_MV_ALR_IN_VOTE"]				    = "Уже прошло голосование, карта будет изменена!"
LANG["PHXM_MV_NEED_MORE_PLY"]			    = "Вам нужно больше игроков, прежде чем вы сможете начать голосование!"
-- Prop Menu: Late #3
LANG["PCR_USAGE_UNLIMIT"]		            = "[Меню объекта] У вас осталось **бесконечно** использований!"
LANG["PCR_USAGE_COUNT"]			            = "[Меню объекта] У вас осталось %d использований!"
LANG["PCR_PLS_WAIT"]			            = "[Меню объекта] Подождите %d сек."
LANG["PCR_NOROOM"]				            = "[Меню объекта] Нет места для перевоплощения!"
LANG["PCR_PROPBANNED"]			            = "[Меню объекта] Этот объект был заблокирован сервером."
LANG["PCR_PROPBANNED_BYPCR"]	            = "[Меню объекта] Меню заблокировало этот объект."
LANG["PCR_REACHED_LIMIT"]		            = "[Меню объекта] Вы достигли лимита!"
LANG["PCR_STAY_ON_GROUND"]		            = "[Меню объекта] Вы должны оставаться на земле и не приседать!"
LANG["PCR_ONLY_GROUP"]			            = "[Меню объекта] Только определённые группы могут открыть это меню!"
LANG["PCR_NOT_EXIST_COUNT"]		            = "Выбранный вами объект не существует в этой карте! ( %s / 4 )"
LANG["PCR_NOT_EXIST"]			            = "Выбранный вами объект не существует в этой карте!"
-- Prop Menu: Late #3, spaces because 'chat.AddText'.
LANG["PCR_NOTIFY_1"]			            = " Этот сервер использует Меню объектов версии %s! Введите "
LANG["PCR_NOTIFY_2"]			            = " в консоли или используйте F1 -> меню [PropChooser Help]."
LANG["PCR_CL_DISABLED"]			            = " Эта функция отключена."
LANG["PCR_CL_GROUP"]			            = " Только определённые группы могут открыть это меню!"
LANG["PCR_CL_LIMIT"]			            = " Вы достигли лимита!"
LANG["PCR_UNLIMIT_TEXT"]		            = "Бесконечно"
LANG["PCR_WINDOW_TITLE"]		            = "Меню объектов PHX"
LANG["PCR_HEADER_TOP"]			            = "Выберите любой объект. У вас есть"
LANG["PCR_HEADER_MID"]			            = "%s использований"
LANG["PCR_HEADER_BOTTOM"]		            = "для использования выбора объекта!"
LANG["PCR_CL_TOOLTIP_BANNED"]	            = "Вы не можете использовать эту модель."
LANG["PCR_CL_TOOLTIP_MODEL"]	            = "Модель: %s"
LANG["PCR_CL_MENU_NOTREADY"]	            = " Сейчас эта функция недоступна."
LANG["PCR_WINDOW_GUIDE_TTL"]	            = "Краткое руководство: Меню объекта 101"
LANG["PCR_BTN_HELP_MENU"]		            = "Справка по меню объектов"
LANG["PCR_CL_CMDUSEULX"]		            = " Эта команда отключена. Вместо неё используйте 'ulx propmenu'!"
LANG["PCR_CMD_ULX_DISABLED"]	            = "Команда ulx propmenu отключена. Для открытия нажмите клавишу [Меню объекта]."
LANG["PCR_EDT_IN_USE"]			            = "Администратор всё ещё редактирует данные объектов. Пожалуйста, подождите!"
LANG["PCR_EDT_ERROR_DISABLED"]	            = "[Меню объекта] Ошибка: Добавление пользовательских объектов отключено!"
LANG["PCR_EDT_NO_RIGHTS"]		            = "У вас нет прав на доступ к этой функции."
-- Admin Section: Late #3
LANG["PHXM_PLAYER_PROP_CHOOSER_KEY"]	    = "Клавиша по умолчанию для открытия меню объектов (Выбор объектов)."
LANG["PHXM_PROP_FREEZE_MIDAIR"]			    = "Клавиша по умолчанию для переключения замораживание движения в воздухе в качестве объекта."
LANG["PHXM_ADMIN_PROP_RIGHT_CLICK"]		    = "Должны ли объекты также иметь возможность использовать насмешку при нажатии правой кнопки мыши?"
LANG["PHXM_ADMIN_TAUNT_SCANNER"]		    = "(Требуется перезапуск карты) Включить сканер насмешек?"
LANG["PHXM_ADMLBL_USABLE_ENTS"]			    = "Используемые типы объектов"
LANG["PHXM_ADMLBL_USABLE_ENTS_REF"]		    = "Типы могут быть: 1: Только физические, 2: Физические и динамические, 3: Почти все, включая. Рэгдоллы, 4: Пользовательские энтити."
LANG["PHXM_ADMIN_USABLE_ENT_TYPE"]		    = "Тип энтити для использования объектам для перевоплощения"
LANG["PHXM_ADMIN_NOTIFY_ENT_TYPE"]		    = "Уведомлять объекты об энтити, которые не могут быть использованы для перевоплощения, нажатием E. Работает, только если 'ph_usable_prop_type' установлен на 3 или 4."
LANG["PHXM_ADMIN_FREEZECAM_HUNTER"]		    = "Включить функцию заморозки камеры для команды объектов"
-- Custom Taunt: Late #3
LANG["TM_TAUNTS_SEARCH_NOTHING"]		    = "Насмешка, содержащая '%s', не найдена..."
LANG["TM_SEARCH_PLACEHOLDER"]			    = "Поиск в этой категории: Введите слово, в нижнем регистре и без подстановочных знаков. Пусто=Показать все."
--== Late Addition #4: 10.06.2022 ==--
LANG["PHXM_MSG_INPUT_IS_EMPTY"]			    = "Текст пуст или вы не нажали клавишу ENTER."
LANG["MISC_SET"]						    = "Задать"
LANG["MISC_APPLY"]						    = "Принять"
LANG["MISC_NO"]							    = "Нет"
LANG["MISC_YES"]						    = "Да"
LANG["MISC_WARN"]						    = "Внимание"
LANG["MISC_ERROR"]						    = "Ошибка"
LANG["MISC_INFO"]						    = "Информация"
LANG["MISC_NOTICE"]						    = "Уведомление"
LANG["MISC_IDK"]						    = "Неизвестно"
LANG["MISC_NA"]							    = "Н/Д"
-- HUD: Late #4
LANG["HUD_DECOY_ACTIVE"]                = "Нажмите [%s]"
LANG["HUD_FAKETAUNT_COUNT"]             = "%ix осталось"
LANG["HUD_FAKETAUNT_UNLI"]              = "Неограниченно"
LANG["NOTICE_GRENADE_SMG_GIVEN"]        = "Теперь у вас есть несколько подствольных гранат."
-- Help/Admin Panel: Late #4
LANG["PHXM_TAUNT_SETTINGS"]				    = "Настройки насмешек"
LANG["PHXM_GENERAL_SETTINGS"]			    = "Общие настройки"
LANG["PHXM_FAKE_TAUNT_SETTINGS"]		    = "Настройки ложных насмешек"
LANG["PHXM_FAKE_TAUNT_ENABLE"]			    = "Позволяет воспроизводить ложные насмешки на случайных объектах на карте. Доступ можно получить только через меню пользовательских насмешек."
LANG["PHXM_FAKE_TAUNT_MAXUSAGE"]		    = "Максимальное значение для использования ложных насмешек; -1 для неограниченного."
LANG["PHXM_TAUNT_RIGHT_CLICK"]		        = "Щёлкните правой кнопкой мыши для насмешки. Это отключит щелчок правой кнопкой мыши в меню пользовательских насмешек!"
LANG["PHXM_TAUNT_PITCH_SETTINGS"]		    = "Тональность звука насмешки"
LANG["PHXM_TAUNT_PITCH_ENABLE"]			    = "Включить тональность насмешки"
LANG["PHXM_TAUNT_PITCH_RANGE_MIN"]		    = "Минимальный порог/допустимый диапазон высоты тона для насмешки. От 1 до 99."
LANG["PHXM_TAUNT_PITCH_RANGE_MAX"]		    = "Максимальный порог/допустимый диапазон высоты тона для насмешки. От 100 до 255."
LANG["PHXM_DECOY_SETTINGS"]				    = "Настройки приманки"
LANG["PHXM_DECOY_ENABLE"]				    = "Включить награду за приманку? Награда будет даваться ТОЛЬКО ОДИН раз живым объектам до конца раунда. Они не добавляют, а только вычитают, как только будут размещены."
LANG["PHXM_DISABLE_FOOTSTEP"]               = "Бесшумные звуки шагов для объектов (только для команды объектов)"
LANG["PHXM_ADMIN_CHATSETTING"]			    = "Настройки окна чата"
LANG["PHXM_ADMIN_HUNTERBLIND"]			    = "Управление ослеплением охотников в начале"
LANG["PHXM_ADMIN_GIVEGRENADE_NEAREND"]      = "Должны ли гранаты выдаваться в конце раунда? Если да, то см. 'ph_give_grenade_roundend_before_time'."
LANG["PHXM_ADMIN_GIVEGRENADE_TIME"]         = "Время в секундах для раздачи гранат до окончания раунда. Обычно это время составляет от 10 до 30 секунд"
LANG["PHXM_DECOY_HEALTH"]					= "Сколько здоровья должно быть у приманки. По умолчанию - 10."
LANG["PHXM_PLAYER_SHOW_DECOY_HELPER"]       = "Показать/скрыть помощник размещения приманки? Это покажет белую точку с текстом рядом с вашим прицелом."
LANG["PHXM_PLAYER_SHOW_DECOY_MARKER"]       = "Показать/скрыть маркер приманки?"
-- Plugins sh_init.lua: Late #4
LANG["PLUG_NAME_VER"]					    = "Плагин: %s | вер.%s"
LANG["PLUG_DESCRIPTION"]				    = "Описание: %s"
-- Taunt Menu - Pitch: Late #4
LANG["PHX_CTAUNT_USE_PITCH"]			    = "Тональность звука для польз. насмешек"
LANG["PHX_CTAUNT_RANDOM_PITCH"]			    = "Случ. тональ. при воспроизв. насмешки"
LANG["PHX_RTAUNT_USE_PITCH"]			    = "Тональность звука для случ. насмешек [%s]"
LANG["PHX_RTAUNT_RANDOMIZE"]			    = "Случайная тональ. звука для случайных насмешек [%s]"
LANG["PHX_CTAUNT_PITCH_FOR_FAKE"]		    = "Тональность звука для ложн. насмешек"
LANG["PHX_CTAUNT_RANDPITCH_FOR_FAKE"]	    = "Случайная тональ. звука для ложной насмешки"
LANG["PHX_CTAUNT_SLIDER_PITCH"]			    = "Ползунок тональ. звука насмешки."
LANG["TM_TOOLTIP_FAKETAUNT"]			    = "Воспроизвести ложную насмешку над случайным объектом"
LANG["TM_PREFERRED_PITCH"]                  = "Задать уровень тональ. насмешки"
-- Fake Taunt: Late #4
LANG["PHX_CTAUNT_ON_RAND_PROPS"]		    = "Воспроизвести на случайном объекте (%ix)"
LANG["PHX_CTAUNT_ON_RAND_PROPS_UNLI"]	    = "Воспроизвести на случайном объекте"
LANG["PHX_CTAUNT_PLAYED_ON_RANDPROP"]	    = "Вы воспроизвели насмешку на случайном объекте."
LANG["PHX_CTAUNT_RAND_PROPS_LIMIT"]		    = "Вы достигли лимита!"
LANG["PHX_CTAUNT_RAND_PROPS_NOT_PROP"]      = "В данный момент недоступно."
LANG["PHX_CTAUNT_RANDPROP_DISABLED"]	    = "Ложная насмешка отключена."
-- PH:Z Simple Decoy: Late #4
LANG.DECOY_PROP	= {
	"убивает манекена!",
	"чувствует сожаление после убийства манекена.",
	"убивает приманку.",
	"убивает невинного манекена.",
	"чувствует себя неловко после убийства манекена."
}
LANG["DECOY_PUT_SUCC"]					= "Приманка успешно установлена."
LANG["DECOY_CANT_PUT_HERE"]				= "Невозможно разместить здесь приманку."
LANG["DECOY_GET_REWARD"]				= "Поздравляем! Вы получили ['Объект-приманку'] за выживание в этом раунде!"
LANG["DECOY_REMINDER_GET"]              = "У вас есть приманка/манекен! Разместите её где-нибудь, чтобы запутать охотников!"
LANG["DECOY_FRAGS_RECEIVED"]			= "Приманка сработала успешно: Вы украли 1 очк. у %s!"
LANG["DECOY_DISABLED"]					= "Приманка недоступна."
LANG["PHXM_CL_DECOY_KEYBIND"]			= "Клавиша по умолчанию для установки приманки. По умолчанию это цифра 1 (не keypad 1)."
LANG["DECOY_INDICATOR_INVALID"]         = "Неверный наклон!"
LANG["DECOY_INDICATOR_TOOFAR"]          = "Дальность слишком большая!"
LANG["DECOY_INDICATOR_OK"]              = "Разместить приманку [Нажмите %s]"
-- Prop Menu,Editor,Plugin section: Late #4
LANG["PCR_MODEL_DONT_EXISTS"]           = "Извините, эта модель недоступна!"
LANG["PCR_PLUG_WARN_MSG"]		        = "Внимание: Добавление своего объекта (pcr_allow_custom) имеет значение 0.\nВы должны включить эту функцию, чтобы редактировать пользовательские объекты!\nДля изменения этого параметра требуется смена карты."
LANG["PCR_PLUG_LBL_BINDKEY"]	        = "Чтобы изменить клавишу, перейдите на вкладку '[Игрок]."
LANG["PCR_PLUG_LBL_EDITOR"]		        = "Редактор меню польз. объектов"
LANG["PCR_PLUG_BTN_OPEN_EDT"]	        = "Открыть редактор"
LANG["PCR_PLUG_LBL_COMSET"]		        = "Общие настройки"
LANG["PCR_PLUG_LBL_TECHSET"]	        = "Технические настройки"
LANG["PCR_PLUG_LBL_EXPSET"]		        = "Экспериментальное"
LANG["PCR_PLUG_LBL_PLAYERSET"]	        = "Настройки игрока"
LANG["PCR_PLUG_ENABLE"]			        = "Включите 'Меню объектов'"
LANG["PCR_PLUG_ALLOW_CUSTOM"]	        = "(Требуется перезапуск карты) Разрешить добавление пользовательских объектов в список меню объектов?"
LANG["PCR_PLUG_PROP_BAN"]		        = "(Требуется перезапуск карты) Не включать ли запрещённые объекты в список список меню объектов?"
LANG["PCR_PLUG_USAGE_LIMIT"]	        = "Максимальный лимит использования для игрока. -1 означает неограниченный."
LANG["PCR_PLUG_PROP_LIMIT"]		        = "(Требуется перезапуск карты) Ограничение количества добавления объектов в список меню объектов"
LANG["PCR_PLUG_PROP_LIMITMAX"]	        = "Максимальное количество объектов, которые будут добавлены в список меню объектов. Примечание: Это количество будет добавлено случайным образом!"
LANG["PCR_PLUG_USE_ULXMENU"]	        = "Должно ли меню объектов быть доступно через консоль (0) или ULX (1)? Связанная клавиша будет работать с этой настройкой"
LANG["PCR_PLUG_USE_DELAY"]		        = "Задержка в секундах перед использованием игроком другого объекта в меню объектов"
LANG["PCR_PLUG_KICK_INVALID"]	        = "Пресечь любую попытку пользователя получить доступ к недействительной модели (4 макс. порог)"
LANG["PCR_PLUG_SPACE_CHECK"]	        = "Проверять наличие места в комнате перед тем, как игрок использует другой объект, чтобы предотвратить застревание"
LANG["PCR_PLUG_X_BBOX"]			        = "(Требуется перезапуск карты) Проверять лимит BBox энтити перед добавлением в список меню объектов"
LANG["PCR_PLUG_X_BBOX_MAX"]		        = "Максимальный предел высоты BBox CollisionBound. Mins будет автоматически рассчитан."
LANG["PCR_PLUG_X_BBOX_MIN"]		        = "Максимальный предел ширины BBox CollisionBound. ins будет автоматически рассчитан."
LANG["PCR_PLUG_ONLY_GROUPS"]	        = "Должно ли меню объектов быть доступно только определённым группам, например, спонсорам?"
LANG["PCR_PLUG_NOTIFYMSG"]		        = "Уведомить игрока о том, как использовать меню объектов при каждом начале раунда"
LANG["PCR_EDITOR_MSG_ERROR"]	        = "Ваши изменения не были сохранены из-за ошибки.\nПожалуйста, проверьте консоль вашего сервера!"
LANG["PCR_EDITOR_MSG_SUCC"]		        = "Ваши изменения и данные пользовательских объектов были успешно сохранены и обновлены."
LANG["PHZ_generic_title"]		        = "Редактор включения польз. объектов"
LANG["PHZ_generic_helptext"]	        = [[[Как пользоваться:
[ЛЕВАЯ ПАНЕЛЬ]
← Выберите игровой контент
← Нажмите на значки, чтобы добавить модели справа
← Щёлкните правой кнопкой мыши, чтобы открыть контекстное меню

[ПРАВАЯ ПАНЕЛЬ]
→ Нажмите, чтобы «пометить» любой объект перед удалением
→ Нажмите «Удалить выделенное», чтобы удалить модели
→ Нажмите «Применить выбор», чтобы внести изменения

[ИНФОРМАЦИЯ]
- You can only add models up to 2048 entries.
- Все объекты карт будут включены автоматически, так что вам не придётся этого делать.
- Нажатие кнопки [Закрыть] отменяет операцию.
- Не все модели будут иметь действующие VPhysics.
- Не все игроки (включая ваш сервер) будут иметь пользовательские модели. Если их нет, они будут удалены после применения выбора.
- Содержимое вашего сервера может отличаться от вашего. Если в выпадающем меню вы видите «<игра> [Не установлено]», это означает, что вы не смонтировали/установили игру.
- Просмотр папок дополнений ещё не реализован, поэтому вместо этого вам придётся использовать «Всё содержимое».
]]
LANG["PHZ_generic_mdlinfo"]             = [[Информация:
%s
Имеет физику: %s]]
LANG["PHZ_generic_mdlinfoStart"]        = "(Выберите модель!)"
LANG["PHZ_generic_no_ragdoll"]	        = "Нет: Рэгдолл"
LANG["PHZ_generic_titlelabel"]	        = "%s предпросмотр :"
LANG["PHZ_mount_game_sel"]		        = "Выберите установленную игру (По умолчанию: Garry's Mod)"
LANG["PHZ_input_placeholder1"]	        = "Папка к поиску: <имя папки> или '*', оставьте пустым для всех папок."
LANG["PHZ_input_placeholder2"]          = "Дополнение к поиску: <имя> или '*', оставьте пустым для всех папок."
LANG["PHZ_msg_warn_close"]		        = "Вы уверены, что хотите закрыть это окно? Все несохранённые изменения будут потеряны!"
LANG["PHZ_msg_commit"] 			        = "Вы уверены, что хотите внести изменения?"
LANG["PHZ_msg_cant_empty"]		        = "Список объектов не может быть пустым!"
LANG["PHZ_msg_removesel"] 		        = [[Удалить выбранные объекты в списке. Легенды:
Красный = Отмеченный выбор
Жёлтый: Объект не существует на сервере И должен быть удалён.]]
LANG["PHZ_msg_warn_mdlinlist"]          = "ВНИМАНИЕ: Эта модель уже есть в списке!"
LANG["PHZ_msg_invalid_mdl"] 	        = "Причина: Это недействительная модель"
LANG["PHZ_apply_select"] 		        = "Применить и сохранить выбранное"
LANG["PHZ_menu_copy"] 		            = "Скопировать модель"
LANG["PHZ_menu_refresh"] 	            = "Обновить модель"
LANG["PHZ_tooltip_removesel"]	        = "Удалить выбранное"
LANG["PHZ_tooltip_wasmarked"]           = [[Этот объект был помечен, потому что он не существует на сервере.
Если вы закроете этот редактор, он будет автоматически удален.]]
LANG["PHZ_pcr_fb_allcontent"]           = "Всё содержимое (не все игроки/сервер будут иметь то же содержимое, что и у вас)"
LANG["PHZ_pcr_fb_notmounted"]           = "%s [Не установлено]"

PHX.LANGUAGES[LANG.code] = LANG
