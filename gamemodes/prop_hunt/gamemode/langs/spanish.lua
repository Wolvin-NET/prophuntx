-- Kindly free to improve the language.

-- Originally written by: Ryo567

local LANG = {}

LANG.code = "es-ES"

LANG.Name 		 	= "Español de España" -- example: "Bahasa Indonesia"
LANG.NameEnglish	= "Spanish (Spain)" -- Your Language but spoken in English, example: "Indonesian"
LANG.Author			= "Ryo567" -- Only accept STRINGS.
-- Can Accept: String, and Table.
LANG.AuthorURL		= {"http://steamcommunity.com/profiles/76561198009674175"}

-- Special Section that isn't String-based
LANG.SUICIDEMSG = { --> FRETTA
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

LANG.RANDOM_SPECTATORS = { --> FRETTA
	"para ver y disfrutar.",
	"para verlos esconderse.",
	"para ver las cosas.",
	" ",
}

LANG["PHX_TEAM_CONNECTING"] = "Conectando"
LANG["PHX_TEAM_PROPS"]		= "Objetos"
LANG["PHX_TEAM_HUNTERS"] 	= "Cazadores"
LANG["PHX_TEAM_UNASSIGNED"]	= "Sin asignar" --Fix Me
LANG["PHX_TEAM_SPECTATOR"] 	= "Espectador"  --Fix Me

-- List of string-based translation

-- // FRETTA SECTION \\
--  FRETTA: Kill text (X killed Y)
LANG["HUD_KILLED"]				= "ha matado a"

-- FRETTA: HUDs
LANG["HUD_TIME"] 				= "TIEMPO"
LANG["HUD_ROUND"]				= "RONDA"
LANG["HUD_WAITPLY"]				= "Esperando jugadores..."
LANG["HUD_DEAD"]				= "(MUERTO) "

LANG["HUD_TEAMWIN"]				= "¡%s ha ganado!"
LANG["HUD_LOSE"]				= "¡Empate! ¡Todos pierden!"
LANG["MISC_TIMELEFT"]			= "Tiempo restante: %s"
LANG["MISC_GAMEEND"] 			= "La partida terminará después de esta ronda."

-- FRETTA: Team selection screen (F2)
LANG["DERMA_TEAMSELECT"]		= "Elegir equipo"

-- FRETTA: F1 screeen
LANG["DERMA_RTV"] 				= "Votar para cambiar (RTV)"
LANG["DERMA_PHMENU"] 			= "Menú de Prop Hunt"
LANG["DERMA_CHANGETEAM"]		= "Cambiar equipo"

-- FRETTA: Scoreboard
LANG["DERMA_PLAYER"]			= "(%d jugador)"	
LANG["DERMA_PLAYERS"]			= "(%d jugadores)"
LANG["DERMA_NAME"]				= "Nombre"
LANG["DERMA_KILLS"]				= "Víctimas"
LANG["DERMA_DEATHS"]			= "Muertes"
LANG["DERMA_PING"]				= "Ping"
LANG["DERMA_SERVER_TAG"]		= "SV" --Fix Me
LANG["DERMA_BOT_TAG"]			= "BOT" -- Fix Me
LANG["DERMA_GAMEMODE_CREDITS"]	= "%s | Version: %s - Rev. %s" -- Fix Me

LANG["CHAT_JOINED"]				= " se ha unido "
LANG["CHAT_JOINEDTHE"]			= " se ha unido a "

LANG["CHAT_SWAPBALANCE"]		= "%s se ha cambiado a %s para equilibrar."
LANG["CHAT_SWAPBALANCEYOU"]		= "Has sido cambiado para mantener el equilibrio." -- Smile... for even in death, you have become children of Thanos

-- FRETTA: Splash Starting Screen
LANG["SPASHSCREEN_BY_X"]		= "by %s"	--Fix Me
-- RichTextBox
LANG["HELP_DONATORS_AND_CONTRIBUTORS"]  = "\n\nDonators & Contributors:\n- %s" --Fix Me
-- // END OF FRETTA SECTION \\

LANG["HELP_F1"] 				= [[Un proyecto de Prop Hunt (Codename) X.

Un proyecto para hacer Prop Hunt X más moderno y personalizable.

Puedes encontrar más información en:
https://www.wolvindra.net/prophuntx

Para ver más información, obtener ayuda y guías, pulsa [F1] y haz clic en el botón [Menú de Prop Hunt].

Versión: ]].. PHX.VERSION ..[[ Revisión: ]].. PHX.REVISION ..[[

¡Diviértete!]]

-- Important!
LANG["LANGUAGE_CHANGED"]		= "Tu idioma preferido se ha cambiado a %s"

-- internal cl_menutypes section.
LANG["SUBTYPE_PREFERED_LANG"]	= "Idioma preferido"
--LANG["SUBTYPE_TEXTENTRY_?"]	= "¿¿??"

-- Events
LANG["EV_PLAYER_CONNECT"]		= "%s se ha conectado al servidor."
LANG["EV_PLAYER_JOINED"]		= "%s se ha unido al servidor."
LANG["EV_PLAYER_DISCONNECT"]	= "%s se ha desconectado del servidor (motivo: %s)"

-- HUD elements
LANG["HUD_HP"]					= "SALUD"
LANG["HUD_AMMO"] 				= "MUNICIÓN"	-- obsolete
LANG["HUD_MAGSEC"]				= "CARG.1 / CARG.2" --Magazine Counts (separator) Secondary Magazine Counts

-- !!WEAPON NAMES CANNOT BE TRANSLATED, THEY USE FROM language.GetPhrase THEREFORE IT'S IMPOSSIBLE TO DO.

LANG["TEAM_PROPS"]				= LANG["PHX_TEAM_PROPS"]
LANG["TEAM_HUNTERS"]			= LANG["PHX_TEAM_HUNTERS"]

LANG["HUD_ROTLOCK"]				= "Rotación de objeto: bloqueado"
LANG["HUD_ROTFREE"]				= "Rotación de objeto: libre"
LANG["HUD_KILLEDBY"]			= "%s te ha matado"

LANG["HUD_AUTOTAUNT"]			= "Llamada de atención en %d seguno(s)"
LANG["HUD_AUTOTAUNT_ALT"]		= "Llamada de atención en %d"

LANG["HUD_TargetID"]			= "Jugador: %s (%d%%)" -- Player: <NAME> (<HEALTH>%)

LANG["HUD_BLINDED"]				= "Las %s abrirán los ojos y saldrán en %s"
LANG["HUD_UNBLINDED"]			= "¡Quien no se haya escondido, tiempo ha tenido!"

LANG["BLIND_RESPAWN_TEAM"]		= "Reapareces solo en el equipo %s en %d segundos durante la cuenta atrás."
LANG["BLIND_RESPAWN"]			= "Reapareces en %d segundos durante la cuenta atrás."

LANG["MISC_ACCEPT"]				= "Aceptar"
LANG["MISC_OK"]					= "Aceptar"
LANG["MISC_CLOSE"]				= "Cerrar"
LANG["MISC_PREV"]				= "< ANTERIOR"
LANG["MISC_NEXT"]				= "SIGUIENTE >"
LANG["MISC_ACCESSDENIED"]		= "Acceso denegado"

-- Chat messages
LANG["CHAT_NOPLAYERS"]			= "¡Faltan jugadores para comenzar la partida!"
LANG["CHAT_SWAP"]				= "¡Los equipos han cambiado!"

LANG["CHAT_SWAPTEAM_WARNING"]   = "Has cambiado de equipos %d veces (MÁX %d). Ya no puedes volver a cambiarte al equipo opuesto."
LANG["CHAT_SWAPTEAM_REVERT"]	= "No puedes cambiarte al equipo %s porque has superado el límite de cambios de equipo."

LANG["CHAT_PROP_NO_ROOM"] 		= "¡No hay espacio para cambiar a ese objeto!"

-- Notification
LANG["NOTIFY_IN_PROP_TEAM"]		= "¡Estás en el equipo de los objetos (props) con capacidad de rotar! Puedes rotar el objeto moviendo el ratón."
LANG["NOTIFY_ROTATE_NOTICE"]	= "Además, puedes bloquear la rotación pulsando la tecla [R] (por defecto)!"

-- Custom Taunt Window
LANG["TM_WARNING_CT_DISABLE"]	= "[PHX - Burlas] Aviso: Este servidor tiene las burlas personalizadas desactivadas."
LANG["TM_NO_TAUNTS"]			= "Aviso: No se han detectado burlas en esta categoría."
LANG["TM_PLAY_ONLY_ALIVE"] 		= "Solo puedes llamar la atención con burlas personalizadas cuando estás vivo."

LANG["TM_WINDOW_TITLE"]			= "Ventana de burlas personalizadas en Prop Hunt"
LANG["TM_NOTICE_PLSWAIT"]		= "¡Espera %s segundo(s) hasta que acabe la burla!" -- fix me: Add " before Random Taunt ends!"
LANG["TM_NOTICE_PLAYPREVIEW"]	= "Previsualizando burla: %s"

LANG["TM_TOOLTIP_PLAYTAUNT"] 	= "Reproducir burla"
LANG["TM_TOOLTIP_PREVIEW"]		= "Previsualizar burla"
LANG["TM_TOOLTIP_PLAYCLOSE"]	= "Reproducir burla y cerrar"
LANG["TM_TOOLTIP_PLAYRANDOM"]	= "Reproducir burla personalizada"
LANG["TM_TOOLTIP_CLOSE"]		= "Cerrar"
LANG["TM_MENU_CLOSE"]			= "Cerrar menú"

LANG["TM_DELAYTAUNT_NOT_EXIST"] = "¡La burla que has seleccionado no está en el servidor!"
LANG["TM_DELAYTAUNT_PLSWAIT"]	= "¡Espera %s segundo(s)!"

--[[
	PHX Menu window
]]
LANG["PHXM_WINDOW_TITLE"]		= "Prop Hunt X: Menú y ajustes avanzados"
LANG["SERVER_INFO_MOTD"]		= "MENSAJE DEL DÍA DEL SERVIDOR Y NORMAS"

LANG["PHXM_TAB_HELP"]			= "Ayuda y guías"
LANG["PHXM_TAB_MUTE"]			= "Silenciar jugadores"
LANG["PHXM_TAB_PLAYER"]			= "Ajustes de jugador"
LANG["PHXM_TAB_MODEL"] 			= "Explorar modelos de jugador"
LANG["PHXM_TAB_MODEL_DISABLED"]	= "Explorar modelos de jugador (desactivado)"
LANG["PHXM_TAB_ADMIN"]			= "Ajustes de admin."
LANG["PHXM_TAB_ABOUT"]			= "Acerca de Prop Hunt X"
LANG["PHXM_TAB_MAPVOTE"]		= "Ajustes de votación de mapas"

LANG["PHXM_CVAR_CHANGED"]		= "[Ajustes] %q se ha cambiado a %q"

--[[
	Player Mute Settings
]]
LANG["PHXM_MUTE_SELECT"]		= "Selecciona a los jugadores que quieras silenciar."

--[[ 
	Player Settings
]]
LANG["PHXM_PLAYER_OPTIONS"]		= "Opciones del jugador"
LANG["PHXM_PLAYER_LANG"]		= "Idiomas"
LANG["PHXM_PLAYER_BIND"]		= "Asignaciones"
LANG["PHXM_PLAYER_HUDSETTINGS"]	= "Ajustes de interfaz"

LANG["PHXM_PLAYER_TAUNT_KEY"]			= "Tecla de burla aleat."
LANG["PHXM_PLAYER_TAUNTWINDOW_KEY"]		= "Tecla de menú de burlas"
LANG["PHXM_PLAYER_ROTATLOCK_KEY"]		= "Tecla de bloqueo de rotación"

LANG["PHXM_PLAYER_TOGGLE_HALOS"]		= "Activar/Desactivar resplandor al elegir un objeto."
LANG["PHXM_PLAYER_IDNAMES"]				= "Mostrar los nombres de los compañeros sobre sus cabezas (se verán a través de las paredes)."
LANG["PHXM_PLAYER_ENDROUND_CUE"]		= "Reproducir sonido de fin de ronda."
LANG["PHXM_PLAYER_TAUNTMENU_AUTOCLOSE"]	= "Opción de cerrar la ventana de burla al hacer doble clic."
LANG["PHXM_PLAYER_SEE_HUNTER_LINE"]		= "Trazar una línea hacia el punto al que miran los cazadores, así podemos ver a dónde apuntan desde espectador."
LANG["PHXM_PLAYER_SEE_LBALL_ICONS"]		= "Activar icono de «Bola de la suerte» para mostrarlo cuando aparezca."
LANG["PHXM_PLAYER_SEE_CRYSTAL_ICONS"]	= "Activar icono de «Bola de la muerte» para mostrarlo cuando aparezca."

LANG["PHXM_PLAYER_USE_NEW_HUD"]			= "Usar nuevo PH: interfaz mejorada"
LANG["PHXM_PLAYER_SHOW_TUTOR"]			= "Mostrar ventana del tutorial (solo 2 veces tras cada objeto)"
LANG["PHXM_PLAYER_USE_NEW_CROSSHAIR"]	= "Activar mirillas personalizados"
LANG["PHXM_PLAYER_SHOW_TEAM_TOPBAR"]	= "Mostrar una barra con todos los aliados con vida en la parte superior izquierda (se mostrarán al menos 4 jugadores)."

--[[
	Player model Browser Section
]]
LANG["QUERY_MODEL_SELECTED"]	= "¡Se ha seleccionado el modelo %s y se aplicará al reaparecer!"
LANG["QUERY_MODEL_INFO"]		= "Nombre del modelo: %s (disponible para: todos)"

LANG["MDL_MENU_REFRESH"] 		= "Actualizar icono"
LANG["MDL_MENU_PREVIEW"] 		= "Previsualizar modelo"
LANG["MDL_MENU_MODELINFO"] 		= "Información del modelo"


LANG["MISC_APPLYMDL"] 			= "Aplicar modelo"

LANG["PHXM_MODEL_DISABLED"] 	= "¡Qué pena, los modelos personalizados están desactivados en este servidor!"
LANG["PHXM_PLAYERMODEL_SETFOV"]	= "Seleccionar campo de visión"

--[[
	Server Settings
]]
LANG["PHXM_ADMIN_OPTIONS"]		= "Opciones del servidor (solo para admin. y propietarios)"
LANG["PHXM_ADMIN_MUSTALIVE"]	= "Tienes que estar vivo en algún equipo para realizar esta operación."

--[[
	Language Override
]]
LANG["PHXM_ADMIN_LANGOVERRIDE"]	= "Forzar idioma"

LANG["PHXM_ADMIN_FORCELANG"] 				= "¿Quieres forzar un idioma? Esto cambiará el idioma del cliente para que use el idioma elegido por el servidor."
LANG["PHXM_ADMIN_LANGTOUSE"]				= "Idioma forzado a utilizar."
LANG["PHXM_ADMIN_PLAYERDEFAULTLANG"] 		= "Idioma por defecto del jugador la primera vez que juega."

-- Gameplay settings
LANG["PHXM_ADMIN_CUSTOM_MODEL"]				= "Activar modelos personalizados para los cazadores"
LANG["PHXM_ADMIN_CUSTOM_MODEL_PROP"]		= "Activar modelos personalizados para los objetos (actívalos para los cazadores también)"
LANG["PHXM_ADMIN_TAUNT_DELAY_CUSTOM"]		= "Demora de burlas personalizadas (seg.)"
LANG["PHXM_ADMIN_TAUNT_DELAY_RANDOM"]		= "Demora de burlas normales (seg.)"
LANG["PHXM_ADMIN_TAUNT_DELAY_AUTO"]			= "Demora de burlas automáticas (seg.)"
LANG["PHXM_ADMIN_AUTOTAUNT_ENABLE"]			= "Activar función de autoburla"

LANG["PHXM_ADMIN_NOTICE_ROTATION"]			= "Mostrar notificación de rotación del objeto cada vez que se aparece."
LANG["PHXM_ADMIN_CAMERA_COLLIDE"]			= "Activar la colisión de la cámara del objeto con la pared."
LANG["PHXM_ADMIN_FREEZECAM"]				= "Activar la instantánea para el equipo de los objetos."
LANG["PHXM_ADMIN_PROP_COLLIDE"]				= "Activar la colisión de los jugadores objetos entre sí."
LANG["PHXM_ADMIN_SWAP_TEAM"] 				= "Cambiar equipos cada ronda (si no se activa, los equipos serán los mismos siempre)."
LANG["PHXM_ADMIN_HUNTER_PENALTY"]			= "Penalización de salud de los cazadores."
LANG["PHXM_ADMIN_HUNTER_KILL_BONUS"]		= "Bonificación de los cazadores por matar."
LANG["PHXM_ADMIN_HUNTER_SMG_GRENADES"]		= "Granadas de subfusil para los cazadores."
LANG["PHXM_ADMIN_GAME_TIME"]				= "Tiempo total de la partida (min.)"
LANG["PHXM_ADMIN_BLINDLOCK_TIME"]			= "Cuenta atrás de los cazadores (min.)"
LANG["PHXM_ADMIN_ROUND_TIME"]				= "Tiempo de ronda (min.)"
LANG["PHXM_ADMIN_ROUNDS_PER_MAP"]			= "Total de rondas por mapa"
LANG["PHXM_ADMIN_ENABLE_LUCKYBALL"]			= "Permitir que aparezcan bolas de la suerte en objetos destructibles (probabilidad del 8 %)"
LANG["PHXM_ADMIN_ENABLE_CRYSTAL"]			= "Permitir que aparezcan bolas de la muerte al morir un cazador (probabilidad del 70 %)"
LANG["PHXM_ADMIN_WAIT_PLAYERS"]				= "Esperar a los jugadores para comenzar la partida."
LANG["PHXM_ADMIN_WAIT_MIN_PLAYERS"]			= "Mínimo de jugadores para esperar a que empiece la partida (por defecto: 1)."
LANG["PHXM_ENABLE_PLAYER_JOIN_LEAVE"] 		= "¿Notificación en el chat de los jugadores que entran y salen? Ponlo en 0 si prefieres usar una extensión personalizada del chat."

LANG["PHXM_ADMIN_FORCEJOINBALANCE"]			= "Obligar a los jugadores a equilibrar los equipos al unirse"
LANG["PHXM_ADMIN_ENABLETEAMBALANCE"]		= "Equilibrio automático de equipos al comienzo de la ronda"
LANG["PHXM_ADMIN_PICKUP_PROPS"] 			= "¿Permitir recoger objetos? 0: No permitido, 1: Solo los cazadores, 2: Solo los objetos, 3: Permitido."

LANG["PHXM_ADMIN_TAUNTMODES"]			= "Modos de burla"
LANG["PHXM_ADMIN_TAUNTMODE_MODE"]		= "--[El modo de burla es: %d ]--"
LANG["PHXM_ADMIN_TAUNTMODE0"]			= "Modo [0]: F3/Burla aleatoria"
LANG["PHXM_ADMIN_TAUNTMODE1"]			= "Modo [1]: C/Burla personalizada"
LANG["PHXM_ADMIN_TAUNTMODE2"]			= "Modo [2]: Ambos modos"
LANG["PHXM_ADMIN_TAUNTSOPEN"]			= "Abrir ventana de burlas"

LANG["PHXM_MODE_DEFAULT"] 				= "--[ El modo de recogida es: %d ]--"
LANG["PHXM_MODE0"]						= "Modo [0]: No permitido"
LANG["PHXM_MODE1"]						= "Modo [1]: Solo los cazadores"
LANG["PHXM_MODE2"]						= "Modo [2]: Solo los objetos"
LANG["PHXM_MODE3"]						= "Modo [3]: Permitido"

--[[
	Admin Developer Sections
]]
LANG["PHXM_ADMIN_DEVSECTION"]		= "Opciones de desarrollo/Características experimentales"
LANG["PHXM_ADMIN_ROOMCHECK"]		= "¿Activar límites? Esto evita que los jugadores queden atascados con otros objetos o en paredes."
LANG["PHXM_ADMIN_USENEWMKBREN"]		= "Usar nuevo modelo del arma Bren MK II (es necesario reiniciar el mapa)."
LANG["PHXM_ADMIN_BEVERBOSE"]		= "Desarrollador: Detallista. ¿Activar PH:X para imprimir toda la información y eventos detalladamente?"
LANG["PHXM_ADMIN_SHOWPLNAMEHEAD"]	= "Activar para que aparezcan los nombres de los compañeros de equipo en pantalla."
LANG["PHXM_ADMIN_USESINGLE_FZCAM"]	= "Usar un único sonido de instantánea en vez de una lista de sonidos (usa «ph_fc_cue_path» para determinar la ruta del sonido)."
LANG["PHXM_ADMIN_MODELLISTINGTYPE"] = "Usar lista de modelos: 0 = Todos los modelos (AddValidModel), 1 = Usar lista: list.Get('PlayerOptionsModel')"
LANG["PHXM_ADMIN_JUMPPOWER"]		= "Multiplicador de potencia de salto adicional para objetos"
LANG["PHXM_ADMIN_ENABLE_OBB"]		= "Desarrollador: Activar modificador de límites de entidades personalizadas de modelos de objetos de la configuración."
LANG["PHXM_ADMIN_RELOAD_OBB"]		= "Desarrollador: Recargar modificador de límites de la configuración al reiniciar cada ronda."

--[[
	Experimental & PH:X Features
]]
LANG["PHXM_ADMIN_EXPERIMENTALPHX"]			= "Nuevas secciones experimentales de PH:X"

LANG["PHXM_ADMIN_HLA_COMBINE"]				= "Añadir modelo de Combine de HL:A"
LANG["PHXM_ADMIN_TEAMBALANCE"]				= "Activar función de autoequilibrado"
LANG["PHXM_ADMIN_CHANGETEAM_LIMIT"]			= "Usar limitador de cambios de equipo. Establecer en -1 para desactivarlo. "
LANG["PHXM_ADMIN_USENEWCHAT"]				= "Usar nuevo chat (eChat): esto es temporal. Si ya tienes un chat, no lo marques."
LANG["PHXM_ADMIN_NEWCHATPOS"]				= "Nueva posición del chat: posición de altura (Y) en N píxeles."
LANG["PHXM_ADMIN_RESPAWNONBLIND"]			= "Permitir reaparecer en la cuenta atrás"
LANG["PHXM_ADMIN_RESPAWNONBLIND_TEAM"]		= "Permitir reaparecer en la cuenta atrás solo a un equipo: 0: Ambos, 1: Cazadores, 2: Objetos"
LANG["PHXM_ADMIN_REWSPANTIMEPERCENT"]		= "Porcentaje de la cuenta atrás en que se puede reaparecer. Por defecto: 0,75 (significa un 75 % del total de la cuenta atrás)."
LANG["PHXM_ADMIN_ALLOWRESPAWN_SPECTATOR"]	= "Permitir reaparecer en la cuenta atrás cuando estás en espectador."
LANG["PHXM_ADMIN_ALLOWRESPAWN_TEAMCHANGE"]	= "Permitir reaparecer en la cuenta atrás al cambiar de equipo (no es recomendable)."

--[[
	MapVote Settings
]]
LANG["PHXM_MV_SETTINGS"]			= "Ajustes de votación de mapa"

LANG["PHXM_MV_ALLOWCURMAP"]			= "Permitir votar el mapa actual"
LANG["PHXM_MV_COOLDOWN"]			= "Activar tiempo de espera para el mapa"
LANG["PHXM_MV_USE_ULX_VOTEMAPS"]	= "¿Usar lista de mapas de votación de ULX? Si no, se usará la ruta «maps/*.bsp» por defecto."
LANG["PHXM_MV_MAPLIMIT"]			= "Número de mapas a mostrar en la votación."
LANG["PHXM_MV_TIMELIMIT"]			= "Tiempo en segundos durante la votación."
LANG["PHXM_MV_MAPBEFOREREVOTE"]		= "Cambiar un mapa para que vuelva a aparecer."
LANG["PHXM_MV_RTVCOUNT"]			= "Jugadores necesarios para una votación RTV (rock the vote)."

LANG["PHXM_MV_EXPLANATION1"]		= "Para configurar qué mapas deben aparecer, usa (por ejemplo) [ mv_map_prefix 'phx_,ph_,cs_,de_' ] en la consola."
LANG["PHXM_MV_EXPLANATION2"]		= "Si estás usando ULX, usa map_vote. Si no, usa mv_start."
LANG["PHXM_MV_EXPLANATION3"]		= "Acción de votación de mapa (para cancelar, escribe !unmap_vote (ULX) o mv_stop en consola.)"

LANG["PHXM_MV_START"]		= "Comenzar votación de mapa"
LANG["PHXM_MV_STOP"]		= "Detener votación de mapa"
--                  			  ^YOU VIOLATED THE LAW!


--[[ 
	Versioning, Credits or About section
]]
LANG["PHXM_ABOUT_VERSIONING"]		= "Versión: %s - Revisión: %s"
LANG["PHXM_ABOUT_AUTHOR"]			= "Por: %s"
LANG["PHXM_ABOUT_ENJOYING"]			= "¡Si estás disfrutando de la partida, puedes donarnos!"
LANG["PHXM_ABOUT_UPDATE"]			= "Actualización de Prop Hunt X"
-- [[ FIX ME ]] --
LANG["PHXM_VIEW_UPDATE_INFO"]		= "View update info"
LANG["PHXM_CHECK_FOR_UPDATES"]		= "Check for Updates"
LANG["PHXM_UPDATE_FOUND_TEXT"]		= "Update has been checked. Please check on the Console for more information.\n\nWould you like to view update what's new?"
LANG["PHXM_UPDATE_FOUND_TITLE"]   	= "Update Information"
LANG["PHXM_UPDATE_FOUND_BUTTON"]   	= "View Updates"
LANG["UPDATE_NOTIFY_MSG_NOTFOUND"]	= "No update was found. Please click on 'Check for Updates' button first!"
LANG["UPDATE_NOTIFY_MSG_TITLE"]		= "No updates found"
LANG["UPDATE_NOTIFY_WINDOW_TITLE"]	= "Update Notice"
LANG["UPDATE_RTBOX_APPEND"]			= "\n\nFor your information:\nCurrently you are using version: %s with Revision: %s"
LANG["UPDATE_BTN_SEEFULL"]			= "See Full Changes"
-- [[ FIX ME ]] --
LANG["PHXM_ABOUT_LINKS"]			= "Enlaces y créditos"
LANG["PHXM_ABOUT_THANKS"]			= "Agradecimientos especiales por el apoyo, sugerencias y contribuciones:\n %s"
LANG["PHXM_ABOUT_BTN_DONATE"]		= "Apoya a PH:X donando"
LANG["PHXM_ABOUT_BTN_HOME"]			= "Página de inicio de PH:X"
LANG["PHXM_ABOUT_BTN_GITHUB"]		= "Repositorio GitHub de PH:X"
LANG["PHXM_ABOUT_BTN_PLUGINS"]		= "Extensiones de PH:X"
LANG["PHXM_ABOUT_BTN_CHANGELOGS"]	= "Notas de actualización de PH:X"

--[[
	Late Additionals
]]
-- fretta
LANG["HUD_SPECTATING"]	= "ESPECTADOR"
LANG["HUD_YOUDIED"]		= "¡Has muerto!"

LANG["CHAT_STARTING_MAPVOTE"] = "La ronda ha acabado. Iniciando votación..."

-- This used for HUD Taunt Timer
LANG["HUD_PROP_TAUNT_TIME"]	= "Burla aleat."
LANG["HUD_PROP_CTAUNT_TIME"] = "Burla pers."

LANG["PHXM_TAB_PLUGINS"]				= "Extensiones"

-- Plugins Section
LANG["PLUGINS_NO_PLUGINS"]				= "No hay extensiones. ¡Puedes buscar más aquí!"
LANG["PLUGINS_BROWSE_MORE"]				= "Buscar extensiones"
LANG["PLUGINS_SERVER_HAS_NO_PLUGINS"]	= "Vaya, este servidor no tiene extensiones instaladas."
LANG["PLUGINS_SERVER_SETTINGS"]			= "-- Ajustes del servidor --"
LANG["PLUGINS_CLIENT_SETTINGS"]			= "-- Ajustes del cliente --"

-- Text Entries
LANG["TEXTENTRY_FZ_SINGLE"] = "Ruta de sonido de instantánea" -- this one is for ph_fc_cue_path command
LANG["TEXTENTRY_MV_PREFIX"] = "Prefijo de votación de mapas"			 -- the map previx for mv_map_prefix

--============= LATE ADDITION OF 29.10.21/X2Z. Please Improve your Language Here! =============--

LANG["MISC_GAME_ENDED"]		= "La partida ha acabado."

--============= LATE ADDITION OF 16.09.21/X2Z. =============--

--[[
	Credits: Late Addition: Revision: 16.09.21/X2Z
]]

LANG["PHXM_ABOUT_BTN_WIKI"]			= "PH:X Wiki y manuales"

--[[
	Auto Taunt: Late Addition: Revision: 16.09.21/X2Z
]]

LANG["HUD_AUTOTAUNT_DISABLED"]		= 	"Burla automática desactivada."
LANG["HUD_AUTOTAUNT_WAITFORUPDATE"]	=	"Sincronizando burla automática..."

--[[
	MapVote: Late Addition: Revision: 16.09.21/X2Z
]]
LANG["PHXM_MV_VOTEROCKED"]				= "Se ha aprobado la votación, comenzará cuando acabe la ronda"
LANG["PHXM_MV_VOTEROCKED_IMMINENT"]		= "Se ha aprobado la votación, cambio de mapa inminente"
LANG["PHXM_MV_VOTEROCKED_PLY_TOTAL"]	= "%s ha pedido realizar una votación. ( %d / %d )"

LANG["PHXM_MV_MUST_WAIT"]				= "¡Tienes que esperar antes de votar!"
LANG["PHXM_MV_VOTEINPROG"]				= "¡Ya hay una votación en progreso!"
LANG["PHXM_MV_HAS_VOTED"]				= "¡Ya has solicitado una votación!"
LANG["PHXM_MV_ALR_IN_VOTE"]				= "¡Ya se ha realizado una votación, el mapa cambiará pronto!"
LANG["PHXM_MV_NEED_MORE_PLY"]			= "¡Se necesitan más jugadores para pedir una votación!"

--[[
	Late Addition: Revision: 16.09.21/X2Z
]]
LANG["PROP_PLAYERMDL_BANNED"]	= "Tu modelo de jugador personalizado se ha bloqueado en este servidor."

--[[
	Prop Menu/Prop Chooser, Revision: 16.09.21/X2Z
]]

LANG["PCR_USAGE_UNLIMIT"]		= "[Menú de obj.] ¡Te quedan usos **ilimitados**!"
LANG["PCR_USAGE_COUNT"]			= "[Menú de obj.] ¡Te quedan %d usos!"
LANG["PCR_PLS_WAIT"]			= "[Menú de obj.] Por favor, espera %d segundo(s)."
LANG["PCR_NOROOM"]				= "[Menú de obj.] ¡No hay hueco para cambiar de objeto!"
LANG["PCR_PROPBANNED"]			= "[Menú de obj.] Este objeto está bloqueado en este servidor."
LANG["PCR_PROPBANNED_BYPCR"]	= "[Menú de obj.] No puedes usar este objeto, porque está baneado del menú de objetos."
LANG["PCR_REACHED_LIMIT"]		= "[Menú de obj.] ¡Se ha alcanzado el límite!"
LANG["PCR_STAY_ON_GROUND"]		= "[Menú de obj.] ¡Debes estar en el suelo y sin agacharte!"
LANG["PCR_ONLY_GROUP"]			= "[Menú de obj.] ¡Solo algunos grupos pueden abrir este menú!"
LANG["PCR_NOT_EXIST_COUNT"]		= "¡El objeto seleccionado no existe en este mapa! ( %s / 4 )"
LANG["PCR_NOT_EXIST"]			= "¡El objeto seleccionado no existe en este mapa!"

-- PCR Client section, reason why there is a space because of chat.AddText between args.
LANG["PCR_NOTIFY_1"]			= "Este servidor usa la versión %s del menú de objetos! Escribe "
LANG["PCR_NOTIFY_2"]			= " en la consola o pulsa F1 -> para el menú [Ayuda con objetos]."
LANG["PCR_CL_DISABLED"]			= " Esta característica está desactivada."
LANG["PCR_CL_GROUP"]			= " ¡Solo algunos grupos pueden abrir este menú!"
LANG["PCR_CL_LIMIT"]			= " ¡Has alcanzado el límite!"
LANG["PCR_UNLIMIT_TEXT"]		= "Sin límite"
LANG["PCR_WINDOW_TITLE"]		= "Menú de obj. PH:X"
LANG["PCR_HEADER_TOP"]			= "Elige el objeto que quieras. ¡Tienes"
LANG["PCR_HEADER_MID"]			= "%s usos disponibles"
LANG["PCR_HEADER_BOTTOM"]		= "para elegir!"
LANG["PCR_CL_TOOLTIP_BANNED"]	= "No puedes usar este modelo."
LANG["PCR_CL_TOOLTIP_MODEL"]	= "Modelo: %s"
LANG["PCR_CL_MENU_NOTREADY"]	= " Esta característica no está disponible actualmente."
LANG["PCR_WINDOW_GUIDE_TTL"]	= "Guía rápida: Menú de objetos 101"
LANG["PCR_BTN_HELP_MENU"]		= "Ayuda con el menú de obj."

LANG["PCR_CL_CMDUSEULX"]		= " Este comando está desactivado. ¡Usa «ulx propmenu»!"
LANG["PCR_CMD_ULX_DISABLED"]	= "El comando «ulx propmenu» está desactivado. Pulsa tu [botón del menú de obj.] para abrirlo."	--input.GetKeyName is impossible to access.

LANG["PCR_EDT_IN_USE"]			= "Hay un admin. editando los datos de objetos. ¡Espera, por favor!"
LANG["PCR_EDT_ERROR_DISABLED"]	= "[Menú de obj.] Error: ¡Los obj. personalizados están desactivados!"
LANG["PCR_EDT_NO_RIGHTS"]		= "No tienes derechos para acceder a esta característica."

-- I'm actually exhausted and feel so burned out, but I'll update this in future, or in PH:Zero I guess.
-- Section: Custom Prop Editor File Browser and stuff...
-- LANG["PCR_EDT_XXX"] 	= "todo"
-- LANG["PCR_FB_XXX"] 	= "todo"

--[[
	Admin Section, Revision: 16.09.21/X2Z
]]
LANG["PHXM_PLAYER_PROP_CHOOSER_KEY"]	= "Tecla por defecto para abrir el menú de obj. (elegir objeto)."
LANG["PHXM_PROP_FREEZE_MIDAIR"]			= "Tecla por defecto para alternar movimiento del obj. en el aire."
LANG["PHXM_ADMIN_PROP_RIGHT_CLICK"]		= "¿Deberían los objetos hacer la burla con clic derecho?"
LANG["PHXM_ADMIN_TAUNT_SCANNER"]		= "(Es necesario reiniciar el mapa) ¿Activar escáner de burlas?"
LANG["PHXM_ADMLBL_USABLE_ENTS"]			= "Tipos de entidades utilizables"
LANG["PHXM_ADMLBL_USABLE_ENTS_REF"]		= "Los tipos son: 1: Solo físicas, 2: Físicas y dinámicas, 3: Casi todo, cuerpos incluidos, 4: Entidades personalizadas."
LANG["PHXM_ADMIN_USABLE_ENT_TYPE"]		= "Tipo de entidades a imitar por los objetos"
LANG["PHXM_ADMIN_NOTIFY_ENT_TYPE"]		= "Notificar los objetos que no se pueden imitar al pulsar la E. Solo funciona con «ph_usable_prop_type» en 3 o 4."
LANG["NOTIFY_PROP_ENTTYPE"]				= "Pulsa [E] para interactuar, o [Clic] para imitar un objeto."
LANG["NOTIFY_CUST_ENT_TYPE_IS_ON"]		= "[PH:X] Nota: Pulsa [E] para interactuar con el objeto, o [Clic] para imitarlo."

--[[
	Custom Taunts, Revision: 16.09.21/X2Z
]]
LANG["TM_TAUNTS_SEARCH_NOTHING"]		= "No se ha encontrado burla con «%s»..."
LANG["TM_SEARCH_PLACEHOLDER"]			= "Buscar en esta categoría: Introducir palabra, minúsculas y sin comodines. Si se deja en blanco, se muestra todo."

--[[
	Freeze Cam, Revision: 23.09.21/X2Z
]]
LANG["PHXM_ADMIN_FREEZECAM_HUNTER"]			= "Activar instantánea para el equipo de cazadores"


--============= LATE ADDITION OF 10.06.2022/X2Z. =============--

LANG["PHXM_MSG_INPUT_IS_EMPTY"]			= "El texto está en blanco o no has pulsado ENTRAR."

LANG["MISC_SET"]						= "Establecer"
LANG["MISC_APPLY"]						= "Aplicar"
LANG["MISC_NO"]							= "No"
LANG["MISC_YES"]						= "Sí"
LANG["MISC_WARN"]						= "Aviso"
LANG["MISC_ERROR"]						= "Error"
LANG["MISC_INFO"]						= "Información"
LANG["MISC_NOTICE"]						= "Aviso"
LANG["MISC_IDK"]						= "Desconocido"
LANG["MISC_NA"]							= "N/D"

-- HUD
LANG["HUD_DECOY_ACTIVE"]                = "Pulsa [%s]"
LANG["HUD_FAKETAUNT_COUNT"]             = "%ix restante"
LANG["HUD_FAKETAUNT_UNLI"]              = "Sin límite"
LANG["NOTICE_GRENADE_SMG_GIVEN"]        = "Has recibido algunas granadas para tu subfusil."

--[[
	ADMIN PANEL, Revision 10.06/2022/X2Z
]]--
LANG["PHXM_TAUNT_SETTINGS"]				= "Ajustes de burla"
LANG["PHXM_GENERAL_SETTINGS"]			= "Ajustes generales"
LANG["PHXM_FAKE_TAUNT_SETTINGS"]		= "Ajustes de burla falsa"
LANG["PHXM_FAKE_TAUNT_ENABLE"]			= "Permitir burlas falsas en objetos aleatorios del mapa. Solo se puede acceder desde el menú de burla personalizada."
LANG["PHXM_FAKE_TAUNT_MAXUSAGE"]		= "Máximo uso de burlas falsas limitado; establecido en -1 es ilimitado."
LANG["PHXM_TAUNT_RIGHT_CLICK"]		    = "Haz clic derecho para hacer la burla. ¡Esto desactivará el clic derecho en el menú personalizado!"

LANG["PHXM_TAUNT_PITCH_SETTINGS"]		= "Ajustes de tono de burla"
LANG["PHXM_TAUNT_PITCH_ENABLE"]			= "Activar tono de burla"
LANG["PHXM_TAUNT_PITCH_RANGE_MIN"]		= "Límite mínimo aceptable para una burla. 1 a 99."
LANG["PHXM_TAUNT_PITCH_RANGE_MAX"]		= "Límite máximo aceptable para una burla. 100 a 255."

LANG["PHXM_DECOY_SETTINGS"]				= "Ajustes de señuelo"
LANG["PHXM_DECOY_ENABLE"]				= "¿Activar señuelo recompensa? La recompensa SOLO se dará UNA VEZ a los objetos vivos hasta que acabe la ronda. No se acumulan y solo se consumen al colocarse."

LANG["PHXM_DISABLE_FOOTSTEP"]           = "Alternar silencio de pisadas de objetos"

LANG["PHXM_ADMIN_CHATSETTING"]			= "Ajustes de ventana de chat"
LANG["PHXM_ADMIN_HUNTERBLIND"]			= "Control de cuenta atrás del cazador"

LANG["PHXM_ADMIN_GIVEGRENADE_NEAREND"]  = "¿Las granadas deberían darse cerca del final de la ronda? En casi afirmativo, véase «ph_give_grenade_roundend_before_time»"
LANG["PHXM_ADMIN_GIVEGRENADE_TIME"]     = "Tiempo en segundo para dar granadas antes de que acabe la ronda. Esto suele estar entre 10 y 30 segundos"

--[[
	Plugins in sh_init.lua, Revision 10.06/2022/X2Z
]]--
LANG["PLUG_NAME_VER"]					= "Extensión: %s | v.%s"
LANG["PLUG_DESCRIPTION"]				= "Descripción: %s"

--[[
	Taunt Pitch, Revision 10.06/2022/X2Z
]]--
LANG["PHX_CTAUNT_USE_PITCH"]			= "Usar tono para burlas personalizadas"
LANG["PHX_CTAUNT_RANDOM_PITCH"]			= "Aleatorizar tono al usar burla"
LANG["PHX_RTAUNT_USE_PITCH"]			= "Usar tono para burlas aleat. [%s]"
LANG["PHX_RTAUNT_RANDOMIZE"]			= "Aleatorizar tono para burlas aleat. [%s]"
LANG["PHX_CTAUNT_PITCH_FOR_FAKE"]		= "Usar tono para burlas falsas"
LANG["PHX_CTAUNT_RANDPITCH_FOR_FAKE"]	= "Aleatorizar tono para burlas falsas"
LANG["PHX_CTAUNT_SLIDER_PITCH"]			= "Nivel de tono de burla."
LANG["TM_TOOLTIP_FAKETAUNT"]			= "Usar burla falsa en obj. aleatorio"
LANG["TM_PREFERRED_PITCH"]              = "Nivel de tono preferido"

--[[
	Fake Taunt, Revision 10.06/2022/X2Z
	Description: Play fake taunts on random props in the map (Not Players)
]]--
LANG["PHX_CTAUNT_ON_RAND_PROPS"]		= "Usar en obj. aleatorios (%ix)"
LANG["PHX_CTAUNT_ON_RAND_PROPS_UNLI"]	= "Usar en obj. aleatorios"
LANG["PHX_CTAUNT_PLAYED_ON_RANDPROP"]	= "Has usado una burla en un obj. aleatorio."
LANG["PHX_CTAUNT_RAND_PROPS_LIMIT"]		= "¡Has alcanzado el límite!"
LANG["PHX_CTAUNT_RAND_PROPS_NOT_PROP"]  = "No disponible en este momento."
LANG["PHX_CTAUNT_RANDPROP_DISABLED"]	= "La burla falsa está desactivada."

--[[
	PH:Z Simple Decoy, Revision 10.06/2022/X2Z
]]--
LANG.DECOY_PROP	= {
	"ha matado al señuelo.",
	"se siente mal por matar al señuelo.",
	"ha matado a un señuelo.",
	"ha matado a un inocente señuelo.",
	"se avergüenza de matar un señuelo."
}

LANG["DECOY_PUT_SUCC"]					= "Señuelo colocado con éxito."
LANG["DECOY_CANT_PUT_HERE"]				= "No se puede colocar un señuelo aquí."
LANG["DECOY_GET_REWARD"]				= "¡Enhorabuena! ¡Has recibido [«Objeto señuelo»] por sobrevivir!"
LANG["DECOY_REMINDER_GET"]              = "¡Tienes un objeto señuelo! ¡Colócalo para confundir a los cazadores!"
LANG["DECOY_FRAGS_RECEIVED"]			= "Señuelo destruido: ¡Has robado 1 punto de %s!"
LANG["DECOY_DISABLED"]					= "Los señuelos están desactivados."
LANG["PHXM_CL_DECOY_KEYBIND"]			= "Tecla por defecto para colocar un señuelo. Por defecot es 1 (no del Bloq. Num 1)."

LANG["DECOY_INDICATOR_INVALID"]         = "¡Terreno no válido!"
LANG["DECOY_INDICATOR_TOOFAR"]          = "¡Demasiado lejos!"
LANG["DECOY_INDICATOR_OK"]              = "Colocar señuelo [Pulsa %s]"

LANG["PHXM_DECOY_HEALTH"]				= "¿Cuánta salud debería tener el señuelo? Por defecto: 10."
LANG["PHXM_PLAYER_SHOW_DECOY_HELPER"]   = "¿Mostrar/Ocultar asistente de colocación del señuelo? Esto mostrará un punto blanco con un texto junto a tu punto de mira."
LANG["PHXM_PLAYER_SHOW_DECOY_MARKER"]   = "¿Mostrar/Ocultar marcador del señuelo?"

--[[
	Revision 10.06/2022/X2Z
    Prop Menu Update: Menu, Editor, Browser
]]--
LANG["PCR_MODEL_DONT_EXISTS"]   = "¡Lo sentimos, este modelo no está disponible actualmente!"

LANG["PCR_PLUG_WARN_MSG"]		= "Aviso: Los objetos personalizados (pcr_allow_custom) están en 0.\n¡Debes activar esta característica para editar tu objeto personalizado!\nEs necesario cambiar de mapa para cambiar este ajuste."
LANG["PCR_PLUG_LBL_BINDKEY"]	= "Para cambiar la tecla, cambia a la pestaña «[Jugador]»."
LANG["PCR_PLUG_LBL_EDITOR"]		= "Editor del menú de obj. personalizado"
LANG["PCR_PLUG_BTN_OPEN_EDT"]	= "Abrir editor"
LANG["PCR_PLUG_LBL_COMSET"]		= "Ajustes comunes"
LANG["PCR_PLUG_LBL_TECHSET"]	= "Ajustes técnicos"
LANG["PCR_PLUG_LBL_EXPSET"]		= "Experimentales"
LANG["PCR_PLUG_LBL_PLAYERSET"]	= "Ajustes de jugador"

LANG["PCR_PLUG_ENABLE"]			= "Activar «Menú de objetos»"
LANG["PCR_PLUG_ALLOW_CUSTOM"]	= "(Es necesario reiniciar el mapa) ¿Permitir añadir objetos personalizados a la lista del menú?"
LANG["PCR_PLUG_PROP_BAN"]		= "(Es necesario reiniciar el mapa) ¿No incluir los objetos eliminados en la lista del menú?"
LANG["PCR_PLUG_USAGE_LIMIT"]	= "Límite máximo de usos para el jugador. -1 para ilimitado."
LANG["PCR_PLUG_PROP_LIMIT"]		= "(Es necesario reiniciar el mapa) Límite de objetos añadidos a la lista del menú"
LANG["PCR_PLUG_PROP_LIMITMAX"]	= "Límite máximo de objetos a añadir a la lista del menú de objetos. Nota: ¡Esto se añadirá aleatoriamente!"
LANG["PCR_PLUG_USE_ULXMENU"]	= "¿Debería ser accesible el menú de objetos desde la consola (0) o ULX (1)? La tecla asignada respetará este ajuste"
LANG["PCR_PLUG_USE_DELAY"]		= "El retraso en segundos antes de que el jugador use otro objeto del menú"
LANG["PCR_PLUG_KICK_INVALID"]	= "Expulsar a todo usuario intentando acceder con un modelo no válido (límite máx.: 4)"
LANG["PCR_PLUG_SPACE_CHECK"]	= "Comprobar espacio antes de que el jugador use otro objeto para evitar colisiones"
LANG["PCR_PLUG_X_BBOX"]			= "(Es necesario reiniciar el mapa) Comprobar límite de la entidad BBox antes de añadir a la lista del menú de obj."
LANG["PCR_PLUG_X_BBOX_MAX"]		= "Límite de altura máx. de colisión BBox. El resto será autocalculado."
LANG["PCR_PLUG_X_BBOX_MIN"]		= "Límite de altura mín. de colisión BBox. El resto será autocalculado."
LANG["PCR_PLUG_ONLY_GROUPS"]	= "¿Debería accederse al menú de obj. solo por ciertos grupos? (por ejemplo, donantes)"
LANG["PCR_PLUG_NOTIFYMSG"]		= "Notificar a los jugadores cómo usar el menú de obj. al empezar cada ronda"

LANG["PCR_EDITOR_MSG_ERROR"]	= "Tus cambios no se han guardado por culpa de unos errores.\n¡Revisa la consola del servidor!"
LANG["PCR_EDITOR_MSG_SUCC"]		= "Tus cambios y datos de obj. personalizados se han guardado y actualizado con éxito."

LANG["PHZ_generic_title"]		= "Editor incl. de obj. personaliz."
LANG["PHZ_generic_helptext"]	= [[[Cómo utilizarlo:
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
LANG["PHZ_generic_mdlinfo"] = [[Info. del modelo:
%s
Tiene físicas: %s]]
LANG["PHZ_generic_mdlinfoStart"] = "(¡Selecciona el modelo primero!)"

LANG["PHZ_generic_no_ragdoll"]	= "No: Cuerpo"
LANG["PHZ_generic_titlelabel"]	= "Vista previa de %s:"

LANG["PHZ_mount_game_sel"]		= "Seleccionar juego instalado (por defecto: Garry's Mod)"
LANG["PHZ_input_placeholder1"]	= "Carpeta a buscar: <nombre> o «*», dejar en blanco para mostrar todo."
LANG["PHZ_input_placeholder2"]  = "Extensión a buscar: <nombre> o «*», dejar en blanco para mostrar todo."
LANG["PHZ_msg_warn_close"]		= "¿Seguro que quieres cerrar esta ventana? ¡Las ediciones no guardadas se perderán!"
LANG["PHZ_msg_commit"] 			= "¿Seguro que quieres confirmar los cambios?"
LANG["PHZ_msg_cant_empty"]		= "¡La lista de obj. no puede estar en blanco!"
LANG["PHZ_msg_removesel"] 		= [[Elimina los objetos seleccionados. Leyendas:
Rojo = Selección marcada
Amarillo = Objetos que no existen en el servidor Y deben eliminarse.]]
LANG["PHZ_msg_warn_mdlinlist"]  = "AVISO: ¡Este modelo ya está en la lista!"
LANG["PHZ_msg_invalid_mdl"] 	= "Motivo: Este modelo no es válido"
LANG["PHZ_apply_select"] 		= "Aplicar y guardar selección"
LANG["PHZ_menu_copy"] 		= "Copiar modelo"
LANG["PHZ_menu_refresh"] 	= "Actualizar modelo"
LANG["PHZ_tooltip_removesel"]	= "Eliminar selección"
LANG["PHZ_tooltip_wasmarked"] = [[Este objeto se ha marcado, porque no existe en el servidor.
Si cierras este editor, se eliminará automáticamente.]]

LANG["PHZ_pcr_fb_allcontent"] = "Todos los contenidos (no todos los jugadores/servidores tendrán el mismo contenido que tú)"
LANG["PHZ_pcr_fb_notmounted"] = "%s [Sin montar/instalar]"

PHX.LANGUAGES[LANG.code] = LANG