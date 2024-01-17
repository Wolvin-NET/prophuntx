-- Kindly free to improve the language.

-- Originally written by: Ryo567

local L={}

L.code = "es-ES"

L.Name 		 	= "Español de España" -- example: "Bahasa Indonesia"
L.NameEnglish	= "Spanish (Spain)" -- Your Language but spoken in English, example: "Indonesian"
L.Author			= "Ryo567" -- Only accept STRINGS.
-- Can Accept: String, and Table.
L.AuthorURL		= {"http://steamcommunity.com/profiles/76561198009674175"}

-- Special Section that isn't String-based
L.SUICIDEMSG = { --> FRETTA
	"se ha suicidado.", -- i believe this was from 9gag joke.
	"ha muerto misteriosamente.",
	"ha muerto mágicamente.",
	"se ha disparado sin apuntar.",
	"se ha ido enfadado.",
	"está borracho.",
	"ha muerto. ¡suerte para la próxima!",
	"se ha abofeteado.",
	"ha tropezado.",
	"ha muerto por la fuerza.",
	"ha muerto. Pulsa F, por favor.",
    "se avergüenza por haber matado objetos inocentes.",
    "se ha enviado a la casilla de salida.",
    "está intentando extinguirse.",
    "está más que muerto.",
    "ha entrado en pánico, intentando matar objetos.",
    "déjalo, busca ayuda.",
	"se ha desplomado.",
}

L.RANDOM_SPECTATORS = { --> FRETTA
	"para ver y disfrutar.",
	"para verlos esconderse.",
	"para ver las cosas.",
	" ",
}

L["PHX_TEAM_CONNECTING"] = "Conectando"
L["PHX_TEAM_PROPS"]		= "Objetos"
L["PHX_TEAM_HUNTERS"] 	= "Cazadores"
L["PHX_TEAM_UNASSIGNED"]	= "Sin asignar" --Fix Me
L["PHX_TEAM_SPECTATOR"] 	= "Espectador"  --Fix Me

-- List of string-based translation

-- // FRETTA SECTION \\
--  FRETTA: Kill text (X killed Y)
L["HUD_KILLED"]				= "ha matado a"

-- FRETTA: HUDs
L["HUD_TIME"] 				= "TIEMPO"
L["HUD_ROUND"]				= "RONDA"
L["HUD_WAITPLY"]				= "Esperando jugadores..."
L["HUD_DEAD"]				= "(MUERTO) "

L["HUD_TEAMWIN"]				= "¡%s ha ganado!"
L["HUD_LOSE"]				= "¡Empate! ¡Todos pierden!"
L["MISC_TIMELEFT"]			= "Tiempo restante: %s"
L["MISC_GAMEEND"] 			= "La partida terminará después de esta ronda."

-- FRETTA: Team selection screen (F2)
L["DERMA_TEAMSELECT"]		= "Elegir equipo"

-- FRETTA: F1 screeen
L["DERMA_RTV"] 				= "Votar para cambiar (RTV)"
L["DERMA_PHMENU"] 			= "Menú de Prop Hunt"
L["DERMA_CHANGETEAM"]		= "Cambiar equipo"

-- FRETTA: Scoreboard
L["DERMA_PLAYER"]			= "(%d jugador)"	
L["DERMA_PLAYERS"]			= "(%d jugadores)"
L["DERMA_NAME"]				= "Nombre"
L["DERMA_KILLS"]				= "Víctimas"
L["DERMA_DEATHS"]			= "Muertes"
L["DERMA_PING"]				= "Ping"
L["DERMA_SERVER_TAG"]		= "SV" --Fix Me
L["DERMA_BOT_TAG"]			= "BOT" -- Fix Me
L["DERMA_GAMEMODE_CREDITS"]	= "%s | Version: %s - Rev. %s" -- Fix Me

L["CHAT_JOINED"]				= " se ha unido "
L["CHAT_JOINEDTHE"]			= " se ha unido a "

L["CHAT_SWAPBALANCE"]		= "%s se ha cambiado a %s para equilibrar."
L["CHAT_SWAPBALANCEYOU"]		= "Has sido cambiado para mantener el equilibrio." -- Smile... for even in death, you have become children of Thanos

-- FRETTA: Splash Starting Screen
L["SPASHSCREEN_BY_X"]		= "by %s"	--Fix Me
-- RichTextBox
L["HELP_DONATORS_AND_CONTRIBUTORS"]  = "\n\nDonators & Contributors:\n- %s" --Fix Me
-- // END OF FRETTA SECTION \\

L["HELP_F1"] 				= [[Un proyecto de Prop Hunt (Codename) X.

Un proyecto para hacer Prop Hunt X más moderno y personalizable.

Puedes encontrar más información en:
https://www.wolvindra.net/prophuntx

Para ver más información, obtener ayuda y guías, pulsa [F1] y haz clic en el botón [Menú de Prop Hunt].

Versión: ]].. PHX.VERSION ..[[ Revisión: ]].. PHX.REVISION ..[[

¡Diviértete!]]

-- Important!
L["LANGUAGE_CHANGED"]		= "Tu idioma preferido se ha cambiado a %s"

-- internal cl_menutypes section.
L["SUBTYPE_PREFERED_LANG"]	= "Idioma preferido"
--L["SUBTYPE_TEXTENTRY_?"]	= "¿¿??"

-- Events
L["EV_PLAYER_CONNECT"]		= "%s se ha conectado al servidor."
L["EV_PLAYER_JOINED"]		= "%s se ha unido al servidor."
L["EV_PLAYER_DISCONNECT"]	= "%s se ha desconectado del servidor (motivo: %s)"

-- HUD elements
L["HUD_HP"]					= "SALUD"
L["HUD_AMMO"] 				= "MUNICIÓN"	-- obsolete
L["HUD_MAGSEC"]				= "CARG.1 / CARG.2" --Magazine Counts (separator) Secondary Magazine Counts

-- !!WEAPON NAMES CANNOT BE TRANSLATED, THEY USE FROM language.GetPhrase THEREFORE IT'S IMPOSSIBLE TO DO.

L["TEAM_PROPS"]				= L["PHX_TEAM_PROPS"]
L["TEAM_HUNTERS"]			= L["PHX_TEAM_HUNTERS"]

L["HUD_ROTLOCK"]				= "Rotación de objeto: bloqueado"
L["HUD_ROTFREE"]				= "Rotación de objeto: libre"
L["HUD_KILLEDBY"]			= "%s te ha matado"

L["HUD_AUTOTAUNT"]			= "Llamada de atención en %d seguno(s)"
L["HUD_AUTOTAUNT_ALT"]		= "Llamada de atención en %d"

L["HUD_TargetID"]			= "Jugador: %s (%d%%)" -- Player: <NAME> (<HEALTH>%)

L["HUD_BLINDED"]				= "Las %s abrirán los ojos y saldrán en %s"
L["HUD_UNBLINDED"]			= "¡Quien no se haya escondido, tiempo ha tenido!"

L["BLIND_RESPAWN_TEAM"]		= "Reapareces solo en el equipo %s en %d segundos durante la cuenta atrás."
L["BLIND_RESPAWN"]			= "Reapareces en %d segundos durante la cuenta atrás."

L["MISC_ACCEPT"]				= "Aceptar"
L["MISC_OK"]					= "Aceptar"
L["MISC_CLOSE"]				= "Cerrar"
L["MISC_PREV"]				= "< ANTERIOR"
L["MISC_NEXT"]				= "SIGUIENTE >"
L["MISC_ACCESSDENIED"]		= "Acceso denegado"

-- Chat messages
L["CHAT_NOPLAYERS"]			= "¡Faltan jugadores para comenzar la partida!"
L["CHAT_SWAP"]				= "¡Los equipos han cambiado!"

L["CHAT_SWAPTEAM_WARNING"]   = "Has cambiado de equipos %d veces (MÁX %d). Ya no puedes volver a cambiarte al equipo opuesto."
L["CHAT_SWAPTEAM_REVERT"]	= "No puedes cambiarte al equipo %s porque has superado el límite de cambios de equipo."

L["CHAT_PROP_NO_ROOM"] 		= "¡No hay espacio para cambiar a ese objeto!"

-- Notification
L["NOTIFY_IN_PROP_TEAM"]		= "¡Estás en el equipo de los objetos (props) con capacidad de rotar! Puedes rotar el objeto moviendo el ratón."
L["NOTIFY_ROTATE_NOTICE"]	= "Además, puedes bloquear la rotación pulsando la tecla [R] (por defecto)!"

-- Custom Taunt Window
L["TM_WARNING_CT_DISABLE"]	= "[PHX - Burlas] Aviso: Este servidor tiene las burlas personalizadas desactivadas."
L["TM_NO_TAUNTS"]			= "Aviso: No se han detectado burlas en esta categoría."
L["TM_PLAY_ONLY_ALIVE"] 		= "Solo puedes llamar la atención con burlas personalizadas cuando estás vivo."

L["TM_WINDOW_TITLE"]			= "Ventana de burlas personalizadas en Prop Hunt"
L["TM_NOTICE_PLSWAIT"]		= "¡Espera %s segundo(s) hasta que acabe la burla!" -- fix me: Add " before Random Taunt ends!"
L["TM_NOTICE_PLAYPREVIEW"]	= "Previsualizando burla: %s"

L["TM_TOOLTIP_PLAYTAUNT"] 	= "Reproducir burla"
L["TM_TOOLTIP_PREVIEW"]		= "Previsualizar burla"
L["TM_TOOLTIP_PLAYCLOSE"]	= "Reproducir burla y cerrar"
L["TM_TOOLTIP_PLAYRANDOM"]	= "Reproducir burla personalizada"
L["TM_TOOLTIP_CLOSE"]		= "Cerrar"
L["TM_MENU_CLOSE"]			= "Cerrar menú"

L["TM_DELAYTAUNT_NOT_EXIST"] = "¡La burla que has seleccionado no está en el servidor!"
L["TM_DELAYTAUNT_PLSWAIT"]	= "¡Espera %s segundo(s)!"

--[[
	PHX Menu window
]]
L["PHXM_WINDOW_TITLE"]		= "Prop Hunt X: Menú y ajustes avanzados"
L["SERVER_INFO_MOTD"]		= "MENSAJE DEL DÍA DEL SERVIDOR Y NORMAS"

L["PHXM_TAB_HELP"]			= "Ayuda y guías"
L["PHXM_TAB_MUTE"]			= "Silenciar jugadores"
L["PHXM_TAB_PLAYER"]			= "Ajustes de jugador"
L["PHXM_TAB_MODEL"] 			= "Explorar modelos de jugador"
L["PHXM_TAB_MODEL_DISABLED"]	= "Explorar modelos de jugador (desactivado)"
L["PHXM_TAB_ADMIN"]			= "Ajustes de admin."
L["PHXM_TAB_ABOUT"]			= "Acerca de Prop Hunt X"
L["PHXM_TAB_MAPVOTE"]		= "Ajustes de votación de mapas"

L["PHXM_CVAR_CHANGED"]		= "[Ajustes] %q se ha cambiado a %q"

--[[
	Player Mute Settings
]]
L["PHXM_MUTE_SELECT"]		= "Selecciona a los jugadores que quieras silenciar."

--[[ 
	Player Settings
]]
L["PHXM_PLAYER_OPTIONS"]		= "Opciones del jugador"
L["PHXM_PLAYER_LANG"]		= "Idiomas"
L["PHXM_PLAYER_BIND"]		= "Asignaciones"
L["PHXM_PLAYER_HUDSETTINGS"]	= "Ajustes de interfaz"

L["PHXM_PLAYER_TAUNT_KEY"]			= "Tecla de burla aleat."
L["PHXM_PLAYER_TAUNTWINDOW_KEY"]		= "Tecla de menú de burlas"
L["PHXM_PLAYER_ROTATLOCK_KEY"]		= "Tecla de bloqueo de rotación"

L["PHXM_PLAYER_TOGGLE_HALOS"]		= "Activar/Desactivar resplandor al elegir un objeto."
L["PHXM_PLAYER_IDNAMES"]				= "Mostrar los nombres de los compañeros sobre sus cabezas (se verán a través de las paredes)."
L["PHXM_PLAYER_ENDROUND_CUE"]		= "Reproducir sonido de fin de ronda."
L["PHXM_PLAYER_TAUNTMENU_AUTOCLOSE"]	= "Opción de cerrar la ventana de burla al hacer doble clic."
L["PHXM_PLAYER_SEE_HUNTER_LINE"]		= "Trazar una línea hacia el punto al que miran los cazadores, así podemos ver a dónde apuntan desde espectador."
L["PHXM_PLAYER_SEE_LBALL_ICONS"]		= "Activar icono de «Bola de la suerte» para mostrarlo cuando aparezca."
L["PHXM_PLAYER_SEE_CRYSTAL_ICONS"]	= "Activar icono de «Bola de la muerte» para mostrarlo cuando aparezca."

L["PHXM_PLAYER_USE_NEW_HUD"]			= "Usar nuevo PH: interfaz mejorada"
L["PHXM_PLAYER_SHOW_TUTOR"]			= "Mostrar ventana del tutorial (solo 2 veces tras cada objeto)"
L["PHXM_PLAYER_USE_NEW_CROSSHAIR"]	= "Activar mirillas personalizados"
L["PHXM_PLAYER_SHOW_TEAM_TOPBAR"]	= "Mostrar una barra con todos los aliados con vida en la parte superior izquierda (se mostrarán al menos 4 jugadores)."

--[[
	Player model Browser Section
]]
L["QUERY_MODEL_SELECTED"]	= "¡Se ha seleccionado el modelo %s y se aplicará al reaparecer!"
L["QUERY_MODEL_INFO"]		= "Nombre del modelo: %s (disponible para: todos)"

L["MDL_MENU_REFRESH"] 		= "Actualizar icono"
L["MDL_MENU_PREVIEW"] 		= "Previsualizar modelo"
L["MDL_MENU_MODELINFO"] 		= "Información del modelo"


L["MISC_APPLYMDL"] 			= "Aplicar modelo"

L["PHXM_MODEL_DISABLED"] 	= "¡Qué pena, los modelos personalizados están desactivados en este servidor!"
L["PHXM_PLAYERMODEL_SETFOV"]	= "Seleccionar campo de visión"

--[[
	Server Settings
]]
L["PHXM_ADMIN_OPTIONS"]		= "Opciones del servidor (solo para admin. y propietarios)"
L["PHXM_ADMIN_MUSTALIVE"]	= "Tienes que estar vivo en algún equipo para realizar esta operación."

--[[
	Language Override
]]
L["PHXM_ADMIN_LANGOVERRIDE"]	= "Forzar idioma"

L["PHXM_ADMIN_FORCELANG"] 				= "¿Quieres forzar un idioma? Esto cambiará el idioma del cliente para que use el idioma elegido por el servidor."
L["PHXM_ADMIN_LANGTOUSE"]				= "Idioma forzado a utilizar."
L["PHXM_ADMIN_PLAYERDEFAULTLANG"] 		= "Idioma por defecto del jugador la primera vez que juega."

-- Gameplay settings
L["PHXM_ADMIN_CUSTOM_MODEL"]				= "Activar modelos personalizados para los cazadores"
L["PHXM_ADMIN_CUSTOM_MODEL_PROP"]		= "Activar modelos personalizados para los objetos (actívalos para los cazadores también)"
L["PHXM_ADMIN_TAUNT_DELAY_CUSTOM"]		= "Demora de burlas personalizadas (seg.)"
L["PHXM_ADMIN_TAUNT_DELAY_RANDOM"]		= "Demora de burlas normales (seg.)"
L["PHXM_ADMIN_TAUNT_DELAY_AUTO"]			= "Demora de burlas automáticas (seg.)"
L["PHXM_ADMIN_AUTOTAUNT_ENABLE"]			= "Activar función de autoburla"

L["PHXM_ADMIN_NOTICE_ROTATION"]			= "Mostrar notificación de rotación del objeto cada vez que se aparece."
L["PHXM_ADMIN_CAMERA_COLLIDE"]			= "Activar la colisión de la cámara del objeto con la pared."
L["PHXM_ADMIN_FREEZECAM"]				= "Activar la instantánea para el equipo de los objetos."
L["PHXM_ADMIN_PROP_COLLIDE"]				= "Activar la colisión de los jugadores objetos entre sí."
L["PHXM_ADMIN_SWAP_TEAM"] 				= "Cambiar equipos cada ronda (si no se activa, los equipos serán los mismos siempre)."
L["PHXM_ADMIN_HUNTER_PENALTY"]			= "Penalización de salud de los cazadores."
L["PHXM_ADMIN_HUNTER_KILL_BONUS"]		= "Bonificación de los cazadores por matar."
L["PHXM_ADMIN_HUNTER_SMG_GRENADES"]		= "Granadas de subfusil para los cazadores."
L["PHXM_ADMIN_GAME_TIME"]				= "Tiempo total de la partida (min.)"
L["PHXM_ADMIN_BLINDLOCK_TIME"]			= "Cuenta atrás de los cazadores (min.)"
L["PHXM_ADMIN_ROUND_TIME"]				= "Tiempo de ronda (min.)"
L["PHXM_ADMIN_ROUNDS_PER_MAP"]			= "Total de rondas por mapa"
L["PHXM_ADMIN_ENABLE_LUCKYBALL"]			= "Permitir que aparezcan bolas de la suerte en objetos destructibles (probabilidad del 8 %)"
L["PHXM_ADMIN_ENABLE_CRYSTAL"]			= "Permitir que aparezcan bolas de la muerte al morir un cazador (probabilidad del 70 %)"
L["PHXM_ADMIN_WAIT_PLAYERS"]				= "Esperar a los jugadores para comenzar la partida."
L["PHXM_ADMIN_WAIT_MIN_PLAYERS"]			= "Mínimo de jugadores para esperar a que empiece la partida (por defecto: 1)."
L["PHXM_ENABLE_PLAYER_JOIN_LEAVE"] 		= "¿Notificación en el chat de los jugadores que entran y salen? Ponlo en 0 si prefieres usar una extensión personalizada del chat."

L["PHXM_ADMIN_FORCEJOINBALANCE"]			= "Obligar a los jugadores a equilibrar los equipos al unirse"
L["PHXM_ADMIN_ENABLETEAMBALANCE"]		= "Equilibrio automático de equipos al comienzo de la ronda"
L["PHXM_ADMIN_PICKUP_PROPS"] 			= "¿Permitir recoger objetos? 0: No permitido, 1: Solo los cazadores, 2: Solo los objetos, 3: Permitido."

L["PHXM_ADMIN_TAUNTMODES"]			= "Modos de burla"
L["PHXM_ADMIN_TAUNTMODE_MODE"]		= "--[El modo de burla es: %d ]--"
L["PHXM_ADMIN_TAUNTMODE0"]			= "Modo [0]: F3/Burla aleatoria"
L["PHXM_ADMIN_TAUNTMODE1"]			= "Modo [1]: C/Burla personalizada"
L["PHXM_ADMIN_TAUNTMODE2"]			= "Modo [2]: Ambos modos"
L["PHXM_ADMIN_TAUNTSOPEN"]			= "Abrir ventana de burlas"

L["PHXM_MODE_DEFAULT"] 				= "--[ El modo de recogida es: %d ]--"
L["PHXM_MODE0"]						= "Modo [0]: No permitido"
L["PHXM_MODE1"]						= "Modo [1]: Solo los cazadores"
L["PHXM_MODE2"]						= "Modo [2]: Solo los objetos"
L["PHXM_MODE3"]						= "Modo [3]: Permitido"

--[[
	Admin Developer Sections
]]
L["PHXM_ADMIN_DEVSECTION"]		= "Opciones de desarrollo/Características experimentales"
L["PHXM_ADMIN_ROOMCHECK"]		= "¿Activar límites? Esto evita que los jugadores queden atascados con otros objetos o en paredes."
L["PHXM_ADMIN_USENEWMKBREN"]		= "Usar nuevo modelo del arma Bren MK II (es necesario reiniciar el mapa)."
L["PHXM_ADMIN_BEVERBOSE"]		= "Desarrollador: Detallista. ¿Activar PH:X para imprimir toda la información y eventos detalladamente?"
L["PHXM_ADMIN_SHOWPLNAMEHEAD"]	= "Activar para que aparezcan los nombres de los compañeros de equipo en pantalla."
L["PHXM_ADMIN_USESINGLE_FZCAM"]	= "Usar un único sonido de instantánea en vez de una lista de sonidos (usa «ph_fc_cue_path» para determinar la ruta del sonido)."
L["PHXM_ADMIN_MODELLISTINGTYPE"] = "Usar lista de modelos: 0: Todos los modelos, 1: Usar lista: list.Get('PlayerOptionsModel')"
L["PHXM_ADMIN_JUMPPOWER"]		= "Multiplicador de potencia de salto adicional para objetos"
L["PHXM_ADMIN_ENABLE_OBB"]		= "Desarrollador: Activar modificador de límites de entidades personalizadas de modelos de objetos de la configuración."
L["PHXM_ADMIN_RELOAD_OBB"]		= "Desarrollador: Recargar modificador de límites de la configuración al reiniciar cada ronda."

--[[
	Experimental & PH:X Features
]]
L["PHXM_ADMIN_EXPERIMENTALPHX"]			= "Nuevas secciones experimentales de PH:X"

L["PHXM_ADMIN_HLA_COMBINE"]				= "Añadir modelo de Combine de HL:A"
L["PHXM_ADMIN_TEAMBALANCE"]				= "Activar función de autoequilibrado"
L["PHXM_ADMIN_CHANGETEAM_LIMIT"]			= "Usar limitador de cambios de equipo. Establecer en -1 para desactivarlo. "
L["PHXM_ADMIN_USENEWCHAT"]				= "Usar nuevo chat (eChat): esto es temporal. Si ya tienes un chat, no lo marques."
L["PHXM_ADMIN_NEWCHATPOS"]				= "Nueva posición del chat: posición de altura (Y) en N píxeles."
L["PHXM_ADMIN_RESPAWNONBLIND"]			= "Permitir reaparecer en la cuenta atrás"
L["PHXM_ADMIN_RESPAWNONBLIND_TEAM"]		= "Permitir reaparecer en la cuenta atrás solo a un equipo: 0: Ambos, 1: Cazadores, 2: Objetos"
L["PHXM_ADMIN_REWSPANTIMEPERCENT"]		= "Porcentaje de la cuenta atrás en que se puede reaparecer. Por defecto: 0,75 (significa un 75 % del total de la cuenta atrás)."
L["PHXM_ADMIN_ALLOWRESPAWN_SPECTATOR"]	= "Permitir reaparecer en la cuenta atrás cuando estás en espectador."
L["PHXM_ADMIN_ALLOWRESPAWN_TEAMCHANGE"]	= "Permitir reaparecer en la cuenta atrás al cambiar de equipo (no es recomendable)."

--[[
	MapVote Settings
]]
L["PHXM_MV_SETTINGS"]			= "Ajustes de votación de mapa"

L["PHXM_MV_ALLOWCURMAP"]			= "Permitir votar el mapa actual"
L["PHXM_MV_COOLDOWN"]			= "Activar tiempo de espera para el mapa"
L["PHXM_MV_USE_ULX_VOTEMAPS"]	= "¿Usar lista de mapas de votación de ULX? Si no, se usará la ruta «maps/*.bsp» por defecto."
L["PHXM_MV_MAPLIMIT"]			= "Número de mapas a mostrar en la votación."
L["PHXM_MV_TIMELIMIT"]			= "Tiempo en segundos durante la votación."
L["PHXM_MV_MAPBEFOREREVOTE"]		= "Cambiar un mapa para que vuelva a aparecer."
L["PHXM_MV_RTVCOUNT"]			= "Jugadores necesarios para una votación RTV (rock the vote)."

L["PHXM_MV_EXPLANATION1"]		= "Para configurar qué mapas deben aparecer, usa (por ejemplo) [ mv_map_prefix 'phx_,ph_,cs_,de_' ] en la consola."
L["PHXM_MV_EXPLANATION2"]		= "Si estás usando ULX, usa map_vote. Si no, usa mv_start."
L["PHXM_MV_EXPLANATION3"]		= "Acción de votación de mapa (para cancelar, escribe !unmap_vote (ULX) o mv_stop en consola.)"

L["PHXM_MV_START"]		= "Comenzar votación de mapa"
L["PHXM_MV_STOP"]		= "Detener votación de mapa"
--                  			  ^YOU VIOLATED THE LAW!


--[[ 
	Versioning, Credits or About section
]]
L["PHXM_ABOUT_VERSIONING"]		= "Versión: %s - Revisión: %s"
L["PHXM_ABOUT_AUTHOR"]			= "Por: %s"
L["PHXM_ABOUT_ENJOYING"]			= "¡Si estás disfrutando de la partida, puedes donarnos!"
L["PHXM_ABOUT_UPDATE"]			= "Actualización de Prop Hunt X"
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
L["PHXM_ABOUT_LINKS"]			= "Enlaces y créditos"
L["PHXM_ABOUT_THANKS"]			= "Agradecimientos especiales por el apoyo, sugerencias y contribuciones:\n %s"
L["PHXM_ABOUT_BTN_DONATE"]		= "Apoya a PH:X donando"
L["PHXM_ABOUT_BTN_HOME"]			= "Página de inicio de PH:X"
L["PHXM_ABOUT_BTN_GITHUB"]		= "Repositorio GitHub de PH:X"
L["PHXM_ABOUT_BTN_PLUGINS"]		= "Extensiones de PH:X"
L["PHXM_ABOUT_BTN_CHANGELOGS"]	= "Notas de actualización de PH:X"

--[[
	Late Additionals
]]
-- fretta
L["HUD_SPECTATING"]	= "ESPECTADOR"
L["HUD_YOUDIED"]		= "¡Has muerto!"

L["CHAT_STARTING_MAPVOTE"] = "La ronda ha acabado. Iniciando votación..."

-- This used for HUD Taunt Timer
L["HUD_PROP_TAUNT_TIME"]	= "Burla aleat."
L["HUD_PROP_CTAUNT_TIME"] = "Burla pers."

L["PHXM_TAB_PLUGINS"]				= "Extensiones"

-- Plugins Section
L["PLUGINS_NO_PLUGINS"]				= "No hay extensiones. ¡Puedes buscar más aquí!"
L["PLUGINS_BROWSE_MORE"]				= "Buscar extensiones"
L["PLUGINS_SERVER_HAS_NO_PLUGINS"]	= "Vaya, este servidor no tiene extensiones instaladas."
L["PLUGINS_SERVER_SETTINGS"]			= "-- Ajustes del servidor --"
L["PLUGINS_CLIENT_SETTINGS"]			= "-- Ajustes del cliente --"

-- Text Entries
L["TEXTENTRY_FZ_SINGLE"] = "Ruta de sonido de instantánea" -- this one is for ph_fc_cue_path command
L["TEXTENTRY_MV_PREFIX"] = "Prefijo de votación de mapas"			 -- the map previx for mv_map_prefix

--============= LATE ADDITION OF 29.10.21/X2Z. Please Improve your Language Here! =============--

L["MISC_GAME_ENDED"]		= "La partida ha acabado."

--============= LATE ADDITION OF 16.09.21/X2Z. =============--

--[[
	Credits: Late Addition: Revision: 16.09.21/X2Z
]]

L["PHXM_ABOUT_BTN_WIKI"]			= "PH:X Wiki y manuales"

--[[
	Auto Taunt: Late Addition: Revision: 16.09.21/X2Z
]]

L["HUD_AUTOTAUNT_DISABLED"]		= 	"Burla automática desactivada."
L["HUD_AUTOTAUNT_WAITFORUPDATE"]	=	"Sincronizando burla automática..."

--[[
	MapVote: Late Addition: Revision: 16.09.21/X2Z
]]
L["PHXM_MV_VOTEROCKED"]				= "Se ha aprobado la votación, comenzará cuando acabe la ronda"
L["PHXM_MV_VOTEROCKED_IMMINENT"]		= "Se ha aprobado la votación, cambio de mapa inminente"
L["PHXM_MV_VOTEROCKED_PLY_TOTAL"]	= "%s ha pedido realizar una votación. ( %d / %d )"

L["PHXM_MV_MUST_WAIT"]				= "¡Tienes que esperar antes de votar!"
L["PHXM_MV_VOTEINPROG"]				= "¡Ya hay una votación en progreso!"
L["PHXM_MV_HAS_VOTED"]				= "¡Ya has solicitado una votación!"
L["PHXM_MV_ALR_IN_VOTE"]				= "¡Ya se ha realizado una votación, el mapa cambiará pronto!"
L["PHXM_MV_NEED_MORE_PLY"]			= "¡Se necesitan más jugadores para pedir una votación!"

--[[
	Late Addition: Revision: 16.09.21/X2Z
]]
L["PROP_PLAYERMDL_BANNED"]	= "Tu modelo de jugador personalizado se ha bloqueado en este servidor."

--[[
	Prop Menu/Prop Chooser, Revision: 16.09.21/X2Z
]]

L["PCR_USAGE_UNLIMIT"]		= "[Menú de obj.] ¡Te quedan usos **ilimitados**!"
L["PCR_USAGE_COUNT"]			= "[Menú de obj.] ¡Te quedan %d usos!"
L["PCR_PLS_WAIT"]			= "[Menú de obj.] Por favor, espera %d segundo(s)."
L["PCR_NOROOM"]				= "[Menú de obj.] ¡No hay hueco para cambiar de objeto!"
L["PCR_PROPBANNED"]			= "[Menú de obj.] Este objeto está bloqueado en este servidor."
L["PCR_PROPBANNED_BYPCR"]	= "[Menú de obj.] No puedes usar este objeto, porque está baneado del menú de objetos."
L["PCR_REACHED_LIMIT"]		= "[Menú de obj.] ¡Se ha alcanzado el límite!"
L["PCR_STAY_ON_GROUND"]		= "[Menú de obj.] ¡Debes estar en el suelo y sin agacharte!"
L["PCR_ONLY_GROUP"]			= "[Menú de obj.] ¡Solo algunos grupos pueden abrir este menú!"
L["PCR_NOT_EXIST_COUNT"]		= "¡El objeto seleccionado no existe en este mapa! ( %s / 4 )"
L["PCR_NOT_EXIST"]			= "¡El objeto seleccionado no existe en este mapa!"

-- PCR Client section, reason why there is a space because of chat.AddText between args.
L["PCR_NOTIFY_1"]			= "Este servidor usa la versión %s del menú de objetos! Escribe "
L["PCR_NOTIFY_2"]			= " en la consola o pulsa F1 -> para el menú [Ayuda con objetos]."
L["PCR_CL_DISABLED"]			= " Esta característica está desactivada."
L["PCR_CL_GROUP"]			= " ¡Solo algunos grupos pueden abrir este menú!"
L["PCR_CL_LIMIT"]			= " ¡Has alcanzado el límite!"
L["PCR_UNLIMIT_TEXT"]		= "Sin límite"
L["PCR_WINDOW_TITLE"]		= "Menú de obj. PH:X"
L["PCR_HEADER_TOP"]			= "Elige el objeto que quieras. ¡Tienes"
L["PCR_HEADER_MID"]			= "%s usos disponibles"
L["PCR_HEADER_BOTTOM"]		= "para elegir!"
L["PCR_CL_TOOLTIP_BANNED"]	= "No puedes usar este modelo."
L["PCR_CL_TOOLTIP_MODEL"]	= "Modelo: %s"
L["PCR_CL_MENU_NOTREADY"]	= " Esta característica no está disponible actualmente."
L["PCR_WINDOW_GUIDE_TTL"]	= "Guía rápida: Menú de objetos 101"
L["PCR_BTN_HELP_MENU"]		= "Ayuda con el menú de obj."

L["PCR_CL_CMDUSEULX"]		= " Este comando está desactivado. ¡Usa «ulx propmenu»!"
L["PCR_CMD_ULX_DISABLED"]	= "El comando «ulx propmenu» está desactivado. Pulsa tu [botón del menú de obj.] para abrirlo."	--input.GetKeyName is impossible to access.

L["PCR_EDT_IN_USE"]			= "Hay un admin. editando los datos de objetos. ¡Espera, por favor!"
L["PCR_EDT_ERROR_DISABLED"]	= "[Menú de obj.] Error: ¡Los obj. personalizados están desactivados!"
L["PCR_EDT_NO_RIGHTS"]		= "No tienes derechos para acceder a esta característica."

-- I'm actually exhausted and feel so burned out, but I'll update this in future, or in PH:Zero I guess.
-- Section: Custom Prop Editor File Browser and stuff...
-- L["PCR_EDT_XXX"] 	= "todo"
-- L["PCR_FB_XXX"] 	= "todo"

--[[
	Admin Section, Revision: 16.09.21/X2Z
]]
L["PHXM_PLAYER_PROP_CHOOSER_KEY"]	= "Tecla por defecto para abrir el menú de obj. (elegir objeto)."
L["PHXM_PROP_FREEZE_MIDAIR"]			= "Tecla por defecto para alternar movimiento del obj. en el aire."
L["PHXM_ADMIN_PROP_RIGHT_CLICK"]		= "¿Deberían los objetos hacer la burla con clic derecho?"
L["PHXM_ADMIN_TAUNT_SCANNER"]		= "(Es necesario reiniciar el mapa) ¿Activar escáner de burlas?"
L["PHXM_ADMLBL_USABLE_ENTS"]			= "Tipos de entidades utilizables"
L["PHXM_ADMLBL_USABLE_ENTS_REF"]		= "Los tipos son: 1: Solo físicas, 2: Físicas y dinámicas, 3: Casi todo, cuerpos incluidos, 4: Entidades personalizadas."
L["PHXM_ADMIN_USABLE_ENT_TYPE"]		= "Tipo de entidades a imitar por los objetos"
L["PHXM_ADMIN_NOTIFY_ENT_TYPE"]		= "Notificar los objetos que no se pueden imitar al pulsar la E. Solo funciona con «ph_usable_prop_type» en 3 o 4."
L["NOTIFY_PROP_ENTTYPE"]				= "Pulsa [E] para interactuar, o [Clic] para imitar un objeto."
L["NOTIFY_CUST_ENT_TYPE_IS_ON"]		= "[PH:X] Nota: Pulsa [E] para interactuar con el objeto, o [Clic] para imitarlo."

--[[
	Custom Taunts, Revision: 16.09.21/X2Z
]]
L["TM_TAUNTS_SEARCH_NOTHING"]		= "No se ha encontrado burla con «%s»..."
L["TM_SEARCH_PLACEHOLDER"]			= "Buscar en esta categoría: Introducir palabra, minúsculas y sin comodines. Si se deja en blanco, se muestra todo."

--[[
	Freeze Cam, Revision: 23.09.21/X2Z
]]
L["PHXM_ADMIN_FREEZECAM_HUNTER"]			= "Activar instantánea para el equipo de cazadores"


--============= LATE ADDITION OF 10.06.2022/X2Z. =============--

L["PHXM_MSG_INPUT_IS_EMPTY"]			= "El texto está en blanco o no has pulsado ENTRAR."

L["MISC_SET"]						= "Establecer"
L["MISC_APPLY"]						= "Aplicar"
L["MISC_NO"]							= "No"
L["MISC_YES"]						= "Sí"
L["MISC_WARN"]						= "Aviso"
L["MISC_ERROR"]						= "Error"
L["MISC_INFO"]						= "Información"
L["MISC_NOTICE"]						= "Aviso"
L["MISC_IDK"]						= "Desconocido"
L["MISC_NA"]							= "N/D"

-- HUD
L["HUD_DECOY_ACTIVE"]                = "Pulsa [%s]"
L["HUD_FAKETAUNT_COUNT"]             = "%ix restante"
L["HUD_FAKETAUNT_UNLI"]              = "Sin límite"
L["NOTICE_GRENADE_SMG_GIVEN"]        = "Has recibido algunas granadas para tu subfusil."

--[[
	ADMIN PANEL, Revision 10.06/2022/X2Z
]]--
L["PHXM_TAUNT_SETTINGS"]				= "Ajustes de burla"
L["PHXM_GENERAL_SETTINGS"]			= "Ajustes generales"
L["PHXM_FAKE_TAUNT_SETTINGS"]		= "Ajustes de burla falsa"
L["PHXM_FAKE_TAUNT_ENABLE"]			= "Permitir burlas falsas en objetos aleatorios del mapa. Solo se puede acceder desde el menú de burla personalizada."
L["PHXM_FAKE_TAUNT_MAXUSAGE"]		= "Máximo uso de burlas falsas limitado; establecido en -1 es ilimitado."
L["PHXM_TAUNT_RIGHT_CLICK"]		    = "Haz clic derecho para hacer la burla. ¡Esto desactivará el clic derecho en el menú personalizado!"

L["PHXM_TAUNT_PITCH_SETTINGS"]		= "Ajustes de tono de burla"
L["PHXM_TAUNT_PITCH_ENABLE"]			= "Activar tono de burla"
L["PHXM_TAUNT_PITCH_RANGE_MIN"]		= "Límite mínimo aceptable para una burla. 1 a 99."
L["PHXM_TAUNT_PITCH_RANGE_MAX"]		= "Límite máximo aceptable para una burla. 100 a 255."

L["PHXM_DECOY_SETTINGS"]				= "Ajustes de señuelo"
L["PHXM_DECOY_ENABLE"]				= "¿Activar señuelo recompensa? La recompensa SOLO se dará UNA VEZ a los objetos vivos hasta que acabe la ronda. No se acumulan y solo se consumen al colocarse."

L["PHXM_DISABLE_FOOTSTEP"]           = "Alternar silencio de pisadas de objetos"

L["PHXM_ADMIN_CHATSETTING"]			= "Ajustes de ventana de chat"
L["PHXM_ADMIN_HUNTERBLIND"]			= "Control de cuenta atrás del cazador"

L["PHXM_ADMIN_GIVEGRENADE_NEAREND"]  = "¿Las granadas deberían darse cerca del final de la ronda? En casi afirmativo, véase «ph_give_grenade_roundend_before_time»"
L["PHXM_ADMIN_GIVEGRENADE_TIME"]     = "Tiempo en segundo para dar granadas antes de que acabe la ronda. Esto suele estar entre 10 y 30 segundos"

--[[
	Plugins in sh_init.lua, Revision 10.06/2022/X2Z
]]--
L["PLUG_NAME_VER"]					= "Extensión: %s | v.%s"
L["PLUG_DESCRIPTION"]				= "Descripción: %s"

--[[
	Taunt Pitch, Revision 10.06/2022/X2Z
]]--
L["PHX_CTAUNT_USE_PITCH"]			= "Usar tono para burlas personalizadas"
L["PHX_CTAUNT_RANDOM_PITCH"]			= "Aleatorizar tono al usar burla"
L["PHX_RTAUNT_USE_PITCH"]			= "Usar tono para burlas aleat. [%s]"
L["PHX_RTAUNT_RANDOMIZE"]			= "Aleatorizar tono para burlas aleat. [%s]"
L["PHX_CTAUNT_PITCH_FOR_FAKE"]		= "Usar tono para burlas falsas"
L["PHX_CTAUNT_RANDPITCH_FOR_FAKE"]	= "Aleatorizar tono para burlas falsas"
L["PHX_CTAUNT_SLIDER_PITCH"]			= "Nivel de tono de burla."
L["TM_TOOLTIP_FAKETAUNT"]			= "Usar burla falsa en obj. aleatorio"
L["TM_PREFERRED_PITCH"]              = "Nivel de tono preferido"

--[[
	Fake Taunt, Revision 10.06/2022/X2Z
	Description: Play fake taunts on random props in the map (Not Players)
]]--
L["PHX_CTAUNT_ON_RAND_PROPS"]		= "Usar en obj. aleatorios (%ix)"
L["PHX_CTAUNT_ON_RAND_PROPS_UNLI"]	= "Usar en obj. aleatorios"
L["PHX_CTAUNT_PLAYED_ON_RANDPROP"]	= "Has usado una burla en un obj. aleatorio."
L["PHX_CTAUNT_RAND_PROPS_LIMIT"]		= "¡Has alcanzado el límite!"
L["PHX_CTAUNT_RAND_PROPS_NOT_PROP"]  = "No disponible en este momento."
L["PHX_CTAUNT_RANDPROP_DISABLED"]	= "La burla falsa está desactivada."

--[[
	PH:Z Simple Decoy, Revision 10.06/2022/X2Z
]]--
L.DECOY_PROP	= {
	"ha matado al señuelo.",
	"se siente mal por matar al señuelo.",
	"ha matado a un señuelo.",
	"ha matado a un inocente señuelo.",
	"se avergüenza de matar un señuelo."
}

L["DECOY_PUT_SUCC"]					= "Señuelo colocado con éxito."
L["DECOY_CANT_PUT_HERE"]				= "No se puede colocar un señuelo aquí."
L["DECOY_GET_REWARD"]				= "¡Enhorabuena! ¡Has recibido [«Objeto señuelo»] por sobrevivir!"
L["DECOY_REMINDER_GET"]              = "¡Tienes un objeto señuelo! ¡Colócalo para confundir a los cazadores!"
L["DECOY_FRAGS_RECEIVED"]			= "Señuelo destruido: ¡Has robado 1 punto de %s!"
L["DECOY_DISABLED"]					= "Los señuelos están desactivados."
L["PHXM_CL_DECOY_KEYBIND"]			= "Tecla por defecto para colocar un señuelo. Por defecot es 1 (no del Bloq. Num 1)."

L["DECOY_INDICATOR_INVALID"]         = "¡Terreno no válido!"
L["DECOY_INDICATOR_TOOFAR"]          = "¡Demasiado lejos!"
L["DECOY_INDICATOR_OK"]              = "Colocar señuelo [Pulsa %s]"

L["PHXM_DECOY_HEALTH"]				= "¿Cuánta salud debería tener el señuelo? Por defecto: 10."
L["PHXM_PLAYER_SHOW_DECOY_HELPER"]   = "¿Mostrar/Ocultar asistente de colocación del señuelo? Esto mostrará un punto blanco con un texto junto a tu punto de mira."
L["PHXM_PLAYER_SHOW_DECOY_MARKER"]   = "¿Mostrar/Ocultar marcador del señuelo?"

--[[
	Revision 10.06/2022/X2Z
    Prop Menu Update: Menu, Editor, Browser
]]--
L["PCR_MODEL_DONT_EXISTS"]   = "¡Lo sentimos, este modelo no está disponible actualmente!"

L["PCR_PLUG_WARN_MSG"]		= "Aviso: Los objetos personalizados (pcr_allow_custom) están en 0.\n¡Debes activar esta característica para editar tu objeto personalizado!\nEs necesario cambiar de mapa para cambiar este ajuste."
L["PCR_PLUG_LBL_BINDKEY"]	= "Para cambiar la tecla, cambia a la pestaña «[Jugador]»."
L["PCR_PLUG_LBL_EDITOR"]		= "Editor del menú de obj. personalizado"
L["PCR_PLUG_BTN_OPEN_EDT"]	= "Abrir editor"
L["PCR_PLUG_LBL_COMSET"]		= "Ajustes comunes"
L["PCR_PLUG_LBL_TECHSET"]	= "Ajustes técnicos"
L["PCR_PLUG_LBL_EXPSET"]		= "Experimentales"
L["PCR_PLUG_LBL_PLAYERSET"]	= "Ajustes de jugador"

L["PCR_PLUG_ENABLE"]			= "Activar «Menú de objetos»"
L["PCR_PLUG_ALLOW_CUSTOM"]	= "(Es necesario reiniciar el mapa) ¿Permitir añadir objetos personalizados a la lista del menú?"
L["PCR_PLUG_PROP_BAN"]		= "(Es necesario reiniciar el mapa) ¿No incluir los objetos eliminados en la lista del menú?"
L["PCR_PLUG_USAGE_LIMIT"]	= "Límite máximo de usos para el jugador. -1 para ilimitado."
L["PCR_PLUG_PROP_LIMIT"]		= "(Es necesario reiniciar el mapa) Límite de objetos añadidos a la lista del menú"
L["PCR_PLUG_PROP_LIMITMAX"]	= "Límite máximo de objetos a añadir a la lista del menú de objetos. Nota: ¡Esto se añadirá aleatoriamente!"
L["PCR_PLUG_USE_ULXMENU"]	= "¿Debería ser accesible el menú de objetos desde la consola (0) o ULX (1)? La tecla asignada respetará este ajuste"
L["PCR_PLUG_USE_DELAY"]		= "El retraso en segundos antes de que el jugador use otro objeto del menú"
L["PCR_PLUG_KICK_INVALID"]	= "Expulsar a todo usuario intentando acceder con un modelo no válido (límite máx.: 4)"
L["PCR_PLUG_SPACE_CHECK"]	= "Comprobar espacio antes de que el jugador use otro objeto para evitar colisiones"
L["PCR_PLUG_X_BBOX"]			= "(Es necesario reiniciar el mapa) Comprobar límite de la entidad BBox antes de añadir a la lista del menú de obj."
L["PCR_PLUG_X_BBOX_MAX"]		= "Límite de altura máx. de colisión BBox. El resto será autocalculado."
L["PCR_PLUG_X_BBOX_MIN"]		= "Límite de altura mín. de colisión BBox. El resto será autocalculado."
L["PCR_PLUG_ONLY_GROUPS"]	= "¿Debería accederse al menú de obj. solo por ciertos grupos? (por ejemplo, donantes)"
L["PCR_PLUG_NOTIFYMSG"]		= "Notificar a los jugadores cómo usar el menú de obj. al empezar cada ronda"

L["PCR_EDITOR_MSG_ERROR"]	= "Tus cambios no se han guardado por culpa de unos errores.\n¡Revisa la consola del servidor!"
L["PCR_EDITOR_MSG_SUCC"]		= "Tus cambios y datos de obj. personalizados se han guardado y actualizado con éxito."

L["PHZ_generic_title"]		= "Editor incl. de obj. personaliz."
L["PHZ_generic_helptext"]	= [[[Cómo utilizarlo:
[PANEL IZQUIERDO]
← Elige contenido del juego
← Haz clic en los iconos para añadir modelos a la derecha
← Haz clic derecho para abrir el menú contextual

[PANEL DERECHO]
→ Haz clic para «marcar» los objetos antes de eliminarlos
→ Pulsa «Eliminar selección» para eliminar modelos.
→ Pulsa «Aplicar selección» para realizar cambios.

[INFO.]
- Solo puedes añadir hasta 2048 modelos.
- Todos los objetos del mapa se incluirán automáticamente.
- Al pulsar [Cerrar] se cancelará la operación.
- No todos los modelos tendrán VPhysics válidas.
- No todos los jugadores tendrán modelos personalizados. Si no existen, serán eliminados tras aplicar la selección.
- El contenido de tu servidor puede ser distintos al tuyo. Si ves «<juego> [Sin montar/instalar]» en el menú desplegable, significa que no has montado/instalado el juego.
- La carpeta de la extensión no está implementada todavía, por lo que verás «Todos los contenidos» en su lugar.
]]
L["PHZ_generic_mdlinfo"] = [[Info. del modelo:
%s
Tiene físicas: %s]]
L["PHZ_generic_mdlinfoStart"] = "(¡Selecciona el modelo primero!)"

L["PHZ_generic_no_ragdoll"]	= "No: Cuerpo"
L["PHZ_generic_titlelabel"]	= "Vista previa de %s:"

L["PHZ_mount_game_sel"]		= "Seleccionar juego instalado (por defecto: Garry's Mod)"
L["PHZ_input_placeholder1"]	= "Carpeta a buscar: <nombre> o «*», dejar en blanco para mostrar todo."
L["PHZ_input_placeholder2"]  = "Extensión a buscar: <nombre> o «*», dejar en blanco para mostrar todo."
L["PHZ_msg_warn_close"]		= "¿Seguro que quieres cerrar esta ventana? ¡Las ediciones no guardadas se perderán!"
L["PHZ_msg_commit"] 			= "¿Seguro que quieres confirmar los cambios?"
L["PHZ_msg_cant_empty"]		= "¡La lista de obj. no puede estar en blanco!"
L["PHZ_msg_removesel"] 		= [[Elimina los objetos seleccionados. Leyendas:
Rojo = Selección marcada
Amarillo = Objetos que no existen en el servidor Y deben eliminarse.]]
L["PHZ_msg_warn_mdlinlist"]  = "AVISO: ¡Este modelo ya está en la lista!"
L["PHZ_msg_invalid_mdl"] 	= "Motivo: Este modelo no es válido"
L["PHZ_apply_select"] 		= "Aplicar y guardar selección"
L["PHZ_menu_copy"] 		= "Copiar modelo"
L["PHZ_menu_refresh"] 	= "Actualizar modelo"
L["PHZ_tooltip_removesel"]	= "Eliminar selección"
L["PHZ_tooltip_wasmarked"] = [[Este objeto se ha marcado, porque no existe en el servidor.
Si cierras este editor, se eliminará automáticamente.]]

L["PHZ_pcr_fb_allcontent"] = "Todos los contenidos (no todos los jugadores/servidores tendrán el mismo contenido que tú)"
L["PHZ_pcr_fb_notmounted"] = "%s [Sin montar/instalar]"

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