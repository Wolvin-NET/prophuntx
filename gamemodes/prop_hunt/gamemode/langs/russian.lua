-- comment reduced to save space
local LANG = {}
LANG.code = "ru"
LANG.Name 		 	= "Русский"
LANG.NameEnglish	= "Russian"
LANG.Author			= "berry"
LANG.AuthorURL		= "https://steamcommunity.com/profiles/76561198158864042"
LANG.SUICIDEMSG = {
	"суицид!",
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
LANG.RANDOM_SPECTATORS = {
	"ушёл наблюдать и отдыхать.",
	"ушёл, чтобы увидеть как вы бегаете.",
	"ушёл, чтобы увидеть некоторые вещи.",
	" ",
}
LANG["PHX_TEAM_CONNECTING"] 	= "подключение" --Fix Me
LANG["PHX_TEAM_PROPS"]			= "Объекты"
LANG["PHX_TEAM_HUNTERS"] 		= "Охотники"
LANG["PHX_TEAM_UNASSIGNED"]		= "Неназначенный" --Fix Me
LANG["PHX_TEAM_SPECTATOR"] 		= "Зритель" --Fix Me
-- Fretta Components
LANG["HUD_KILLED"]				= "убил"
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
LANG["CHAT_JOINED"]				= " присоединяется к "
LANG["CHAT_JOINEDTHE"]			= " присоединяется к "
LANG["CHAT_SWAPBALANCE"]		= "%s переместили в команду %s для баланса."
LANG["CHAT_SWAPBALANCEYOU"]		= "Вы с другой командой поменялись местами, чтобы достичь идеального баланса."
LANG["HELP_F1"] 				= [[Prop Hunt проекта X.

Проект, призванный сделать Prop Hunt более современным и настраиваемым.

Более подробную информацию можно найти на:
https://gmodgameservers.com/prophuntx

Чтобы увидеть больше информации, помощь и руководство, Нажмите клавишу [F1] а затем нажмите кнопку [Prop Hunt Menu].

Версия: ]].. PHX.VERSION ..[[ Ревизия: ]].. PHX.REVISION ..[[

Веселитесь!]]
-- General
LANG["LANGUAGE_CHANGED"]		            = "Предпочитаемый язык был изменён на %s"
LANG["SUBTYPE_PREFERED_LANG"]	            = "Предпочитаемый язык"
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
LANG["CHAT_NOPLAYERS"]			            = "Не хватает игроков, чтобы начать игру!"
LANG["CHAT_SWAP"]				            = "Команды поменялись местами!"
LANG["CHAT_SWAPTEAM_WARNING"]               = "Вы сменили команду %dx (%dx МАКС.). После этого, Вы больше не можете переключиться на противоположную команду."
LANG["CHAT_SWAPTEAM_REVERT"]	            = "Невозможно переключиться на команду %s, потому что вы превысили количество смен команд."
LANG["CHAT_PROP_NO_ROOM"] 		            = "Нет места, чтобы смеить на этом объект!"
LANG["NOTIFY_IN_PROP_TEAM"]		            = "Вы находитесь в команде Объектов с поддержкой поворота! Вы можете вращать объект, за который играете, перемещая мышь."
LANG["NOTIFY_ROTATE_NOTICE"]	            = "Кроме того, Вы можете переключить блокировку вращения, нажав (по умолчанию) клавишу [R]!"
-- Taunt Menu
LANG["TM_WARNING_CT_DISABLE"]	            = "[PHX - Taunts] Внимание: На этом сервере отключены пользовательские насмешки."
LANG["TM_NO_TAUNTS"]			            = "Внимание: В этой категории не было обнаружено насмешек."
LANG["TM_PLAY_ONLY_ALIVE"] 		            = "Вы можете проигрывать пользовательские насмешки только тогда, когда Вы живы."
LANG["TM_WINDOW_TITLE"]			            = "Окно польз. насмешек Prop Hunt"
LANG["TM_NOTICE_PLSWAIT"]		            = "Пожалуйста, подождите %s сек.!" -- fix me: Add " before Random Taunt ends!"
LANG["TM_NOTICE_PLAYPREVIEW"]	            = "Предпросмотр насмешки: %s"
LANG["TM_TOOLTIP_PLAYTAUNT"] 	            = "Проиграть насмешку"
LANG["TM_TOOLTIP_PREVIEW"]		            = "Предпросмотр"
LANG["TM_TOOLTIP_PLAYCLOSE"]	            = "Проиграть насмешку и закрыть"
LANG["TM_TOOLTIP_PLAYRANDOM"]	            = "Проиграть случайную насмешку"
LANG["TM_TOOLTIP_CLOSE"]		            = "Закрыть"
LANG["TM_MENU_CLOSE"]			            = "Закрыть меню"
LANG["TM_DELAYTAUNT_NOT_EXIST"]             = "Насмешка, которую Вы выбрали, не была найдена на сервере!"
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
LANG["PHXM_PLAYER_TAUNT_KEY"]			    = "Клавишка случайной насмешки"
LANG["PHXM_PLAYER_TAUNTWINDOW_KEY"]		    = "Клавишка меню насмешек"
LANG["PHXM_PLAYER_ROTATLOCK_KEY"]		    = "Клавишка блокировки вращения объекта"
LANG["PHXM_PLAYER_TOGGLE_HALOS"]		    = "Переключить эффект подсвечивания при выборе пропа"
LANG["PHXM_PLAYER_IDNAMES"]				    = "Показывать имена командных игроков над их головами (и через стены тоже)"
LANG["PHXM_PLAYER_ENDROUND_CUE"]		    = "Проигрывать звук конца раунда"
LANG["PHXM_PLAYER_TAUNTMENU_AUTOCLOSE"]	    = "Опция автоматического закрытия окна с насмешками при двойном щелчке по ней"
LANG["PHXM_PLAYER_SEE_HUNTER_LINE"]		    = "Показывать линию куда смотрит Охотник, чтобы мы могли видеть их цель в режиме наблюдателя."
LANG["PHXM_PLAYER_SEE_LBALL_ICONS"]		    = "Включить значок 'Lucky ball' отображаемый после их появления"
LANG["PHXM_PLAYER_SEE_CRYSTAL_ICONS"]	    = "Включить значок 'Devil ball' отображаемый после их появления"
LANG["PHXM_PLAYER_USE_NEW_HUD"]			    = "Использовать новый интерфейс PH: Enhanced"
LANG["PHXM_PLAYER_SHOW_TUTOR"]			    = "Показать всплывающее окно с советом (Показывает только 2x при каждом вашем возрождении)"
LANG["PHXM_PLAYER_USE_NEW_CROSSHAIR"]	    = "Включить сторонний прицел"
LANG["PHXM_PLAYER_SHOW_TEAM_TOPBAR"]	    = "Показывать общее количество живых игроков команды в левом верхнем углу (По крайней мере 4 игрока будут показаны)"
LANG["QUERY_MODEL_SELECTED"]	            = "Модель %s была выбрана и будет применена после возрождения!"
LANG["QUERY_MODEL_INFO"]		            = "Наименованная модель: %s - Доступна для: Всех"
LANG["MDL_MENU_REFRESH"] 		            = "Обновить иконку"
LANG["MDL_MENU_PREVIEW"] 		            = "Предпросмотр модели"
LANG["MDL_MENU_MODELINFO"] 		            = "Информация модели"
LANG["MISC_APPLYMDL"] 			            = "Применить модель"
LANG["PHXM_MODEL_DISABLED"] 	            = "Извините, пользовательские модели игрока отключены на этом сервере!"
LANG["PHXM_PLAYERMODEL_SETFOV"]	            = "  Поле зрения модели"
LANG["PHXM_ADMIN_OPTIONS"]		            = "Настройки режима игры на стороне сервера (Отображается только для администраторов / владельцев)"
LANG["PHXM_ADMIN_MUSTALIVE"]	            = "Вы должны быть живы, чтобы сделать эту операцию."
LANG["PHXM_ADMIN_LANGOVERRIDE"]	            = "Резервный язык"
LANG["PHXM_ADMIN_FORCELANG"] 				= "Использовать принудительный язык? Это заменит язык клиента, чтобы использовать выбранный язык сервера."
LANG["PHXM_ADMIN_LANGTOUSE"]				= "Принудительный язык для использования."
LANG["PHXM_ADMIN_PLAYERDEFAULTLANG"] 		= "Язык игрока по умолчанию."
LANG["PHXM_ADMIN_CUSTOM_MODEL"]				= "Включить пользовательские модели для Охотников"
LANG["PHXM_ADMIN_CUSTOM_MODEL_PROP"]		= "Включить пользовательские модели для Объектов - Убедитесь включить Охотникам тоже."
LANG["PHXM_ADMIN_TAUNT_DELAY_CUSTOM"]		= "Задержка пользовательской насмешки (Секунд)"
LANG["PHXM_ADMIN_TAUNT_DELAY_RANDOM"]		= "Задержка обычной насмешки (Секунд)"
LANG["PHXM_ADMIN_TAUNT_DELAY_AUTO"]			= "Задержка автонасмешки (Секунд)"
LANG["PHXM_ADMIN_AUTOTAUNT_ENABLE"]			= "Включить автонасмешку (Изменения таймера будут применены в следующем раунде)"
LANG["PHXM_ADMIN_NOTICE_ROTATION"]			= "Показывать уведомление 'Вращение объекта' на экране при каждом появлении объекта"
LANG["PHXM_ADMIN_CAMERA_COLLIDE"]			= "Включить камеру пропа при столкновении со стеной"
LANG["PHXM_ADMIN_FREEZECAM"]				= "Включить функцию заморозки камеры для команды объектов"
LANG["PHXM_ADMIN_PROP_COLLIDE"]				= "Включить столкновение объектов с игроками"
LANG["PHXM_ADMIN_SWAP_TEAM"] 				= "Менять команды каждый раунд - Отключение означает, что команда не будет меняться навсегда."
LANG["PHXM_ADMIN_HUNTER_PENALTY"]			= "Штраф здоровья Охотнику"
LANG["PHXM_ADMIN_HUNTER_KILL_BONUS"]		= "Бонус Охотнику за убийство"
LANG["PHXM_ADMIN_HUNTER_SMG_GRENADES"]		= "Подствольных гранат Охотнику"
LANG["PHXM_ADMIN_GAME_TIME"]				= "(Требуется перезапуск карты) Общее время игры (Минут)"
LANG["PHXM_ADMIN_BLINDLOCK_TIME"]			= "Время ослепления и освобождения Охотников (Секунд)"
LANG["PHXM_ADMIN_ROUND_TIME"]				= "(Требуется перезапуск карты) Общее время раунда (Секунд)"
LANG["PHXM_ADMIN_ROUNDS_PER_MAP"]			= "(Требуется перезапуск карты) Всего раундов на карту"
LANG["PHXM_ADMIN_ENABLE_LUCKYBALL"]			= "Разрешить создание 'Lucky ball' при разрушении объекта-игрока (Шанс 8%)"
LANG["PHXM_ADMIN_ENABLE_CRYSTAL"]			= "Разрешить создание 'Devil ball' когда Охотник умирает (Всегда)"
LANG["PHXM_ADMIN_WAIT_PLAYERS"]				= "Подождите, пока игроки начнут играть"
LANG["PHXM_ADMIN_WAIT_MIN_PLAYERS"]			= "Минимум игроков, чтобы ожидать начала игры (по умолчанию: 1)"
LANG["PHXM_ENABLE_PLAYER_JOIN_LEAVE"] 		= "Включить уведомление в чат игрока, который присоединился или вышел? Поставьте 0, если Вы предпочитаете использовать собственное дополнение для чата."
LANG["PHXM_ADMIN_FORCEJOINBALANCE"]			= "Заставить игроков выравнивать команды при вступлении"
LANG["PHXM_ADMIN_ENABLETEAMBALANCE"]		= "Автоматически выравнивать команды в начале раунда (Баланс команд)"
LANG["PHXM_ADMIN_PICKUP_PROPS"] 			= "Разрешить становиться небольшим объектом? 0: Не разрешать, 1: Только Охотники, 2: Только Объекты, 3: Разрешить всем."
LANG["PHXM_ADMIN_TAUNTMODES"]			    = "Режимы насмешек"
LANG["PHXM_ADMIN_TAUNTMODE_MODE"]		    = "--[Текущий режим насмешки: %d ]--"
LANG["PHXM_ADMIN_TAUNTMODE0"]			    = "Режим [0]: F3/Случайная насмешка"
LANG["PHXM_ADMIN_TAUNTMODE1"]			    = "Режим [1]: C/Польз. насмешка"
LANG["PHXM_ADMIN_TAUNTMODE2"]			    = "Режим [2]: Оба режима"
LANG["PHXM_ADMIN_TAUNTSOPEN"]			    = "Открыть окно насмешек"
LANG["PHXM_MODE_DEFAULT"] 				    = "--[ Режим подбирания объектов установлен на %d ]--"
LANG["PHXM_MODE0"]						    = "Режим [0]: Не разрешено"
LANG["PHXM_MODE1"]						    = "Режим [1]: Только Охотники"
LANG["PHXM_MODE2"]						    = "Режим [2]: Только Объекты"
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
LANG["PHXM_ADMIN_RELOAD_OBB"]		        = "Разработчик: Перезагрузить OBB Модификатор данных, при каждом перезапуске раунда"
LANG["PHXM_ADMIN_EXPERIMENTALPHX"]			= "Новые экспериментальные разделы PHX"
LANG["PHXM_ADMIN_HLA_COMBINE"]				= "Добавить поддержку модели солдата Комбайнов из HL: Alyx"
LANG["PHXM_ADMIN_TEAMBALANCE"]				= "Включить баланс команд"
LANG["PHXM_ADMIN_CHANGETEAM_LIMIT"]			= "Использовать ограничитель смены команд. Установите -1 чтобы отключить. "
LANG["PHXM_ADMIN_USENEWCHAT"]				= "Использовать новую окна чата (eChat) - Это временная замена. Если у вас уже есть, оставьте этот флажок."
LANG["PHXM_ADMIN_NEWCHATPOS"]				= "Новая позиция окна чата: Вычитать высоту (Y) Положение по N пикселям."
LANG["PHXM_ADMIN_RESPAWNONBLIND"]			= "Разрешить возрождение в слепое время"
LANG["PHXM_ADMIN_RESPAWNONBLIND_TEAM"]		= "Разрешить возрождение в слепое время только для определённой команды: 0: Все, 1: Охотники, 2: Объекты"
LANG["PHXM_ADMIN_REWSPANTIMEPERCENT"]		= "Процент слепово времени, который позволяет вам возродиться. По умолчанию 0.75 (означает 75% * Макс. слепово времени)"
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
LANG["PHXM_MV_EXPLANATION1"]		        = "Чтобы установить, какая карта должна быть в списке, используйте (например) [ mv_mapprefix 'ph_,cs_,de_' ] в консоли."
LANG["PHXM_MV_EXPLANATION2"]		        = "Если Вы используете ULX, используйте map_vote. Если нет, используйте mv_start."
LANG["PHXM_MV_EXPLANATION3"]		        = "Действие голосования за карту (Чтобы отменить, просто напишите !unmap_vote (ULX) или mv_stop в консоль.)"
LANG["PHXM_MV_START"]		                = "Начать голосование за карту"
LANG["PHXM_MV_STOP"]		                = "Остановить голосование за карту"
-- Versioning
LANG["PHXM_ABOUT_VERSIONING"]		        = "Версия: %s - Ревизия: %s"
LANG["PHXM_ABOUT_AUTHOR"]			        = "От: %s"
LANG["PHXM_ABOUT_ENJOYING"]			        = "Если вам нравится игра, подумайте о пожертвовании!"
LANG["PHXM_ABOUT_UPDATE"]			        = "Обновления Prop Hunt X"
LANG["PHXM_ABOUT_LINKS"]			        = "Ссылки и авторство"
LANG["PHXM_ABOUT_THANKS"]			        = "Особая благодарность за поддержку, предложение и вклад:\n %s"
LANG["PHXM_ABOUT_BTN_DONATE"]		        = "Поддержите PH:X пожертвованием"
LANG["PHXM_ABOUT_BTN_HOME"]			        = "Домашняя страница PHX"
LANG["PHXM_ABOUT_BTN_GITHUB"]		        = "GitHub репозиторий PHX"
LANG["PHXM_ABOUT_BTN_PLUGINS"]		        = "Дополнения/Плагины PHX"
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
LANG["NOTIFY_PROP_ENTTYPE"]				    = "Нажмите [E] для взаимодействия, [Клик] для копирования объекта."
LANG["NOTIFY_CUST_ENT_TYPE_IS_ON"]		    = "[PHX] Примечание: Нажмите [E] для взаимодействия с объектом, нажмите [Клик] для копирования объекта."
-- MapVote: Late #3
LANG["PHXM_MV_VOTEROCKED"]				    = " Голосование по смене карты начнётся в конце раунда"
LANG["PHXM_MV_VOTEROCKED_IMMINENT"]		    = "Голосование по смене карты неизбежно"
LANG["PHXM_MV_VOTEROCKED_PLY_TOTAL"]	    = "%s проголосовал. ( %d / %d )"
LANG["PHXM_MV_MUST_WAIT"]				    = "Вы должны немного подождать перед голосованием!"
LANG["PHXM_MV_VOTEINPROG"]				    = "В настоящее время идёт голосование!"
LANG["PHXM_MV_HAS_VOTED"]				    = "Вы уже приняли участие в голосовании за смену карты!"
LANG["PHXM_MV_ALR_IN_VOTE"]				    = "Уже прошло голосование, карта будет изменена!"
LANG["PHXM_MV_NEED_MORE_PLY"]			    = "Вам нужно больше игроков, прежде чем вы сможете начать голосование!"
-- Prop Menu: Late #3
LANG["PCR_USAGE_UNLIMIT"]		            = "[Меню объекта] У вас осталось **бесконечно** использований!"
LANG["PCR_USAGE_COUNT"]			            = "[Меню объекта] У вас осталось %d использований!"
LANG["PCR_PLS_WAIT"]			            = "[Меню объекта] Подождите %d сек."
LANG["PCR_NOROOM"]				            = "[Меню объекта] Нет места для перевоплащения!"
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
LANG["PCR_CL_MENU_NOTREADY"]	            = " В настоящее время эта функция недоступна."
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
LANG["PHXM_MSG_INPUT_IS_EMPTY"]			    = "Text is empty or you didn't pressed ENTER key."
LANG["MISC_SET"]						    = "Set"
LANG["MISC_APPLY"]						    = "Apply"
LANG["MISC_NO"]							    = "No"
LANG["MISC_YES"]						    = "Yes"
LANG["MISC_WARN"]						    = "Warning"
LANG["MISC_ERROR"]						    = "Error"
LANG["MISC_INFO"]						    = "Information"
LANG["MISC_NOTICE"]						    = "Notice"
LANG["MISC_IDK"]						    = "Unknown"
LANG["MISC_NA"]							    = "N/A"
-- HUD: Late #4
LANG["HUD_DECOY_ACTIVE"]                = "Press [%s]"
LANG["HUD_FAKETAUNT_COUNT"]             = "%ix Left"
LANG["HUD_FAKETAUNT_UNLI"]              = "Unlimited"
LANG["NOTICE_GRENADE_SMG_GIVEN"]        = "You are now acquired some SMG Grenades."
-- Help/Admin Panel: Late #4
LANG["PHXM_TAUNT_SETTINGS"]				    = "Taunt Settings"
LANG["PHXM_GENERAL_SETTINGS"]			    = "General Settings"
LANG["PHXM_FAKE_TAUNT_SETTINGS"]		    = "Fake Taunt Settings"
LANG["PHXM_FAKE_TAUNT_ENABLE"]			    = "Allow fake taunts to be played on random props in the map. Can be accessed only through Custom Taunt menu."
LANG["PHXM_FAKE_TAUNT_MAXUSAGE"]		    = "Maximum usage for fake taunts to be used; -1 is unlimited."
LANG["PHXM_TAUNT_RIGHT_CLICK"]		        = "Right click for taunt. This will disable Right-clicking on custom menu!"
LANG["PHXM_TAUNT_PITCH_SETTINGS"]		    = "Taunt Pitch Settings"
LANG["PHXM_TAUNT_PITCH_ENABLE"]			    = "Enable Taunt Pitch"
LANG["PHXM_TAUNT_PITCH_RANGE_MIN"]		    = "Minimum threshold/acceptable pitch range for a taunt. 1 to 99."
LANG["PHXM_TAUNT_PITCH_RANGE_MAX"]		    = "Maximum threshold/acceptable pitch range for a taunt. 100 to 255."
LANG["PHXM_DECOY_SETTINGS"]				    = "Decoy Settings"
LANG["PHXM_DECOY_ENABLE"]				    = "Enable Decoy reward? Reward will be given ONLY ONCE for alive props until the round ends. They don't add and only substract once they're placed."
LANG["PHXM_DISABLE_FOOTSTEP"]               = "Toggle silent prop team footsteps"
LANG["PHXM_ADMIN_CHATSETTING"]			    = "Chat Window Settings"
LANG["PHXM_ADMIN_HUNTERBLIND"]			    = "Hunter Blind Control"
LANG["PHXM_ADMIN_GIVEGRENADE_NEAREND"]      = "Should grenades will be given near round end? If Yes, see 'ph_give_grenade_roundend_before_time'"
LANG["PHXM_ADMIN_GIVEGRENADE_TIME"]         = "Time in seconds to give grenades before Round Ends. This is typically between 10 to 30 seconds"
LANG["PHXM_DECOY_HEALTH"]					= "How much health does the decoy should have. Default is 10."
LANG["PHXM_PLAYER_SHOW_DECOY_HELPER"]       = "Show/Hide Decoy placement helper? This will show a white dot with a text near on your crosshair."
LANG["PHXM_PLAYER_SHOW_DECOY_MARKER"]       = "Show/Hide Decoy marker?"
-- Plugins sh_init.lua: Late #4
LANG["PLUG_NAME_VER"]					    = "Plugin: %s | v.%s"
LANG["PLUG_DESCRIPTION"]				    = "Description: %s"
-- Taunt Menu - Pitch: Late #4
LANG["PHX_CTAUNT_USE_PITCH"]			    = "Use pitch for custom taunts"
LANG["PHX_CTAUNT_RANDOM_PITCH"]			    = "Randomize pitch when playing taunt"
LANG["PHX_RTAUNT_USE_PITCH"]			    = "Use pitch for random taunts [%s]"
LANG["PHX_RTAUNT_RANDOMIZE"]			    = "Randomize pitch for random taunts [%s]"
LANG["PHX_CTAUNT_PITCH_FOR_FAKE"]		    = "Use pitch for fake taunts"
LANG["PHX_CTAUNT_RANDPITCH_FOR_FAKE"]	    = "Randomize pitch for fake taunts"
LANG["PHX_CTAUNT_SLIDER_PITCH"]			    = "Taunt pitch slider."
LANG["TM_TOOLTIP_FAKETAUNT"]			    = "Play a Fake Taunt on random prop"
LANG["TM_PREFERRED_PITCH"]                  = "Preferred Taunt Pitch Level"
-- Fake Taunt: Late #4
LANG["PHX_CTAUNT_ON_RAND_PROPS"]		    = "Play on random props (%ix)"
LANG["PHX_CTAUNT_ON_RAND_PROPS_UNLI"]	    = "Play on random props"
LANG["PHX_CTAUNT_PLAYED_ON_RANDPROP"]	    = "You played a taunt on a random prop."
LANG["PHX_CTAUNT_RAND_PROPS_LIMIT"]		    = "You have hit the limit!"
LANG["PHX_CTAUNT_RAND_PROPS_NOT_PROP"]      = "Not available at this moment."
LANG["PHX_CTAUNT_RANDPROP_DISABLED"]	    = "Fake taunt is currently disabled."
-- PH:Z Simple Decoy: Late #4
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
-- Prop Menu,Editor,Plugin section: Late #4
LANG["PCR_MODEL_DONT_EXISTS"]           = "Sorry, this model is not available at the moment!"
LANG["PCR_PLUG_WARN_MSG"]		        = "Warning: Custom Prop Addition (pcr_allow_custom) is set to 0.\nYou Must Enable this feature in order to edit your custom prop!\nA Map change is required to change this setting."
LANG["PCR_PLUG_LBL_BINDKEY"]	        = "To change bind key, switch to '[Player] tab."
LANG["PCR_PLUG_LBL_EDITOR"]		        = "Custom Prop Menu Editor"
LANG["PCR_PLUG_BTN_OPEN_EDT"]	        = "Open Editor"
LANG["PCR_PLUG_LBL_COMSET"]		        = "Common Settings"
LANG["PCR_PLUG_LBL_TECHSET"]	        = "Technical Settings"
LANG["PCR_PLUG_LBL_EXPSET"]		        = "Experimentals"
LANG["PCR_PLUG_LBL_PLAYERSET"]	        = "Player Settings"
LANG["PCR_PLUG_ENABLE"]			        = "Enable 'Prop Menu' feature"
LANG["PCR_PLUG_ALLOW_CUSTOM"]	        = "(Require Map Restart) Allow custom props to be added in to the Prop Menu list?"
LANG["PCR_PLUG_PROP_BAN"]		        = "(Require Map Restart) Do not include banned props into Prop Menu list?"
LANG["PCR_PLUG_USAGE_LIMIT"]	        = "Maximum usage limit for player to use. -1 means unlimited."
LANG["PCR_PLUG_PROP_LIMIT"]		        = "(Require Map Restart) Limit amount of prop addition to Prop Menu list"
LANG["PCR_PLUG_PROP_LIMITMAX"]	        = "Maximum amount of props that will be added to Prop Menu list. Note: This will be randomly added!"
LANG["PCR_PLUG_USE_ULXMENU"]	        = "Should Prop Menu can be accessed by Console (0) or ULX (1)? Bound key will respect with this setting"
LANG["PCR_PLUG_USE_DELAY"]		        = "Delay in seconds before player to use another Prop in Prop Menu"
LANG["PCR_PLUG_KICK_INVALID"]	        = "Kick any user attempt to access Invalid Model (4x Max. threshold)"
LANG["PCR_PLUG_SPACE_CHECK"]	        = "Check for space for a room before player use another prop to prevent Stuck"
LANG["PCR_PLUG_X_BBOX"]			        = "(Require Map Restart) Check Entity BBox Limit before adding to Prop Menu list"
LANG["PCR_PLUG_X_BBOX_MAX"]		        = "BBox CollisionBound Maximum Height limit. Mins will be auto-calculated."
LANG["PCR_PLUG_X_BBOX_MIN"]		        = "BBox CollisionBound Maximum Width limit. ins will be auto-calculated."
LANG["PCR_PLUG_ONLY_GROUPS"]	        = "Should Prop Menu can only be accessed by certain groups e.g. Donator?"
LANG["PCR_PLUG_NOTIFYMSG"]		        = "Notify player on how to use Prop Menu on every round start"
LANG["PCR_EDITOR_MSG_ERROR"]	        = "Your changes hasn't been saved due to Errors.\nPlease check on your server console!"
LANG["PCR_EDITOR_MSG_SUCC"]		        = "Your changes and Custom Prop data has has been saved and updated successfully."
LANG["PHZ_generic_title"]		        = "Custom Prop Inclusion Editor"
LANG["PHZ_generic_helptext"]	        = [[[How To Use:
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
LANG["PHZ_generic_mdlinfo"]             = [[Model Info:
%s
Has Physics: %s]]
LANG["PHZ_generic_mdlinfoStart"]        = "(Select model first!)"
LANG["PHZ_generic_no_ragdoll"]	        = "No: Ragdoll"
LANG["PHZ_generic_titlelabel"]	        = "%s Preview :"
LANG["PHZ_mount_game_sel"]		        = "Select mounted game (Default: Garry's Mod)"
LANG["PHZ_input_placeholder1"]	        = "Folder to Search: <folder name> or '*', blank for all folders."
LANG["PHZ_input_placeholder2"]          = "Addon to Search: <name> or '*', blank for all folders."
LANG["PHZ_msg_warn_close"]		        = "Are you sure you want to close this window? Any unsaved edits will be lost!"
LANG["PHZ_msg_commit"] 			        = "Are you sure you want to commig changes?"
LANG["PHZ_msg_cant_empty"]		        = "Prop List cannot be empty!"
LANG["PHZ_msg_removesel"] 		        = [[Remove selected props in the list. Legends:
Red = Marked Selections
Yellow: Prop don't exists in server AND should be Removed.]]
LANG["PHZ_msg_warn_mdlinlist"]          = "WARNING: This Model is already in the list!"
LANG["PHZ_msg_invalid_mdl"] 	        = "Reason: This is invalid model"
LANG["PHZ_apply_select"] 		        = "Apply & Save Selections"
LANG["PHZ_menu_copy"] 		            = "Copy Model"
LANG["PHZ_menu_refresh"] 	            = "Refresh Model"
LANG["PHZ_tooltip_removesel"]	        = "Remove Selected"
LANG["PHZ_tooltip_wasmarked"]           = [[This prop was marked because it does't exist in the server.
If you close this editor, this will automatically removed.]]
LANG["PHZ_pcr_fb_allcontent"]           = "All Contents (Not All Players/Server will have same contents as you)"
LANG["PHZ_pcr_fb_notmounted"]           = "%s [Not Mounted]"

PHX.LANGUAGES[LANG.code] = LANG