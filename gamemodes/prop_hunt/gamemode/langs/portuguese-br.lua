-- Kindly free to improve the language.

-- Originally written by: Clã | BR | The Fire Fuchs

local LANG = {}

LANG.code = "pt-BR"

LANG.Name 		 	= "Português Brasileiro" -- example: "Bahasa Indonesia"
LANG.NameEnglish	= "Portuguese Brazil" -- Your Language but spoken in English, example: "Indonesian"
LANG.Author			= "Clã | BR | The Fire Fuchs" -- Only accept STRINGS.
-- Can Accept: String, and Table.
LANG.AuthorURL		= "http://steamcommunity.com/profiles/76561198008932606"

-- Special Section that isn't String-based
LANG.SUICIDEMSG = {  -- Fix me: there was addition text here but feel free to add more.
	"se matou!", -- i believe this was from 9gag joke.
	"morreu misteriosamente.",
	"morreu magicamente.",
	"não aguentou a pressão e deu rage quit.",
	"está bebado.",
	"morreu... Mais sorte da próxima vez!",
	"se estapeou.",
	"morreu pela força.",
	"no céu tem pão? E morreu.",
}

LANG.RANDOM_SPECTATORS = { --> FRETTA
	"para assistir e relaxar.",
	"para vê-los andarem por aí.",
	"para ver as coisas.",
	" ",
}

LANG["PHX_TEAM_CONNECTING"] = "Conectando"
LANG["PHX_TEAM_PROPS"]		= "Objetos"
LANG["PHX_TEAM_HUNTERS"] 	= "Caçadores"
LANG["PHX_TEAM_UNASSIGNED"]	= "Não atribuído" --fix me
LANG["PHX_TEAM_SPECTATOR"] 	= "Espectador" --fix me

-- List of string-based translation

-- // FRETTA SECTION \\
--  FRETTA: Kill text (X killed Y)
LANG["HUD_KILLED"]				= "matou"

-- FRETTA: HUDs
LANG["HUD_TIME"] 				= "TEMPO"
LANG["HUD_ROUND"]				= "RODADA"
LANG["HUD_WAITPLY"]				= "Aguardando por jogadores..."
LANG["HUD_DEAD"]				= "(MORTO) "

LANG["HUD_TEAMWIN"]				= "%s ganharam!"
LANG["HUD_LOSE"]				= "Empate, todo mundo perdeu!"
LANG["MISC_TIMELEFT"]			= "Tempo Restante: %s"
LANG["MISC_GAMEEND"] 			= "Jogo irá terminar depois desssa rodada"

-- FRETTA: Team selection screen (F2)
LANG["DERMA_TEAMSELECT"]		= "Escolher time"

-- FRETTA: F1 screeen
LANG["DERMA_RTV"] 				= "Votar por mudança (RTV)"
LANG["DERMA_PHMENU"] 			= "Menu do Prop Hunt"
LANG["DERMA_CHANGETEAM"]		= "Trocar de time"

-- FRETTA: Scoreboard
LANG["DERMA_PLAYER"]			= "(%d jogador)"	
LANG["DERMA_PLAYERS"]			= "(%d jogadores)"
LANG["DERMA_NAME"]				= "Nome"
LANG["DERMA_KILLS"]				= "Kills"
LANG["DERMA_DEATHS"]			= "Mortes"
LANG["DERMA_PING"]				= "Latência"
LANG["DERMA_SERVER_TAG"]		= "SV" --Fix Me
LANG["DERMA_BOT_TAG"]			= "BOT" -- Fix Me
LANG["DERMA_GAMEMODE_CREDITS"]	= "%s | Version: %s - Rev. %s" -- Fix Me

LANG["CHAT_JOINED"]				= " se conectou "
LANG["CHAT_JOINEDTHE"]			= " filiou-se a "

LANG["CHAT_SWAPBALANCE"]		= "%s  foi movido para %s para balanceamento de time."
LANG["CHAT_SWAPBALANCEYOU"]		= "Você foi trocado para equilibrio perfeito." -- Smile... for even in death, you have become children of Thanos

-- FRETTA: Splash Starting Screen
LANG["SPASHSCREEN_BY_X"]		= "by %s"	--Fix Me
-- RichTextBox
LANG["HELP_DONATORS_AND_CONTRIBUTORS"]  = "\n\nDonators & Contributors:\n- %s" --Fix Me
-- // END OF FRETTA SECTION \\

LANG["HELP_F1"] 				= [[Um projeto Prop Hunt (codinome) X.

Um projeto para fazer o Prop Hunt X moderno e customizável

Mais informações podem ser encontradas em:
https://www.wolvindra.net/prophuntx

Para mais informações, ajuda ou guia. Pressione F1.

Versão: ]].. PHX.VERSION ..[[ Revisão: ]].. PHX.REVISION ..[[

Divirta-se!]]

-- Important!
LANG["LANGUAGE_CHANGED"]		= "Linguagem preferida foi mudada para %s"

-- internal cl_menutypes section.
LANG["SUBTYPE_PREFERED_LANG"]	= "Linguagem preferida"
--LANG["SUBTYPE_TEXTENTRY_?"]	= "???"

-- Events
LANG["EV_PLAYER_CONNECT"]		= "%s conectou-se ao servidor."
LANG["EV_PLAYER_JOINED"]		= "%s entrou no servidor."
LANG["EV_PLAYER_DISCONNECT"]	= "%s se desconectou do servidor (razão: %s)"

-- HUD elements
LANG["HUD_HP"]					= "VIDA"
LANG["HUD_AMMO"] 				= "MUNIÇÃO"	-- obsolete
LANG["HUD_MAGSEC"]				= "MAG. / SEG." --Magazine Counts (separator) Secondary Magazine Counts

-- !!WEAPON NAMES CANNOT BE TRANSLATED, THEY USE FROM language.GetPhrase THEREFORE IT'S IMPOSSIBLE TO DO.

LANG["TEAM_PROPS"]				= LANG["PHX_TEAM_PROPS"]
LANG["TEAM_HUNTERS"]			= LANG["PHX_TEAM_HUNTERS"]

LANG["HUD_ROTLOCK"]				= "Rotação do objeto: Travada"
LANG["HUD_ROTFREE"]				= "Rotação do objeto: Livre"
LANG["HUD_KILLEDBY"]			= "Você foi morto por %s"

LANG["HUD_AUTOTAUNT"]			= "Provocação automática em %d segundo(s)"
LANG["HUD_AUTOTAUNT_ALT"]		= "Provocação automática em %d"

LANG["HUD_TargetID"]			= "Jogador: %s (%d%%)" -- Player: <NAME> (<HEALTH>%)

LANG["HUD_BLINDED"]				= "Os %s serão livres em %s"
LANG["HUD_UNBLINDED"]			= "Prontos ou não, lá vamos nós!"

LANG["BLIND_RESPAWN_TEAM"]		= "Te renasceram no time %s em %d segundos durante o período de cegueira."
LANG["BLIND_RESPAWN"]			= "Te renasceram em %d segundos durante o período de cegueira."

LANG["MISC_ACCEPT"]				= "Aceitar"
LANG["MISC_OK"]					= "OK"
LANG["MISC_CLOSE"]				= "Fechar"
LANG["MISC_PREV"]				= "< ANTERIOR"
LANG["MISC_NEXT"]				= "PRÓXIMO >"
LANG["MISC_ACCESSDENIED"]		= "Acesso negado"

-- Chat messages
LANG["CHAT_NOPLAYERS"]			= "Não há players o suficiente para começar o jogo!"
LANG["CHAT_SWAP"]				= "Os times foram trocados!"

LANG["CHAT_SWAPTEAM_WARNING"]   = "Você trocou de time %dx (%dx MAX). Depoist disso, você não pode mudar para o time oposto."
LANG["CHAT_SWAPTEAM_REVERT"]	= "Você não pode mudar para o time %s porque você atingiu o limite de troca de times."

LANG["CHAT_PROP_NO_ROOM"] 		= "Não há espaço para fazer a troca de objetos!!"

-- Notification
LANG["NOTIFY_IN_PROP_TEAM"]		= "Você está no time dos objetos com rotação habiitada! Você pode rotacionar seu objeto movendo seu mouse!"
LANG["NOTIFY_ROTATE_NOTICE"]	= "Você pode travar a rotação pressionando (por padrão) a tecla [R]!"

-- Custom Taunt Window
LANG["TM_WARNING_CT_DISABLE"]	= "[PHX - Provocações] Aviso: Esse server tem provocações customizadas desabilitadas."
LANG["TM_NO_TAUNTS"]			= "Aviso: Nenhuma provocação foi encontrada nessa categoria."
LANG["TM_PLAY_ONLY_ALIVE"] 		= "Você só pode provocar enquanto estiver vivo!"

LANG["TM_WINDOW_TITLE"]			= "Janela de provocações customizadas do Prop Hunt"
LANG["TM_NOTICE_PLSWAIT"]		= "Por favor aguarde %s segundo(s)!" -- fix me: Add " before Random Taunt ends!"
LANG["TM_NOTICE_PLAYPREVIEW"]	= "Pré-visualizando provocação: %s"

LANG["TM_TOOLTIP_PLAYTAUNT"] 	= "Tocar Provocação"
LANG["TM_TOOLTIP_PREVIEW"]		= "Pré-visualizar provocação"
LANG["TM_TOOLTIP_PLAYCLOSE"]	= "Tocar provocação e fechar"
LANG["TM_TOOLTIP_PLAYRANDOM"]	= "Tocar provocação aleatória"
LANG["TM_TOOLTIP_CLOSE"]		= "Fechar"
LANG["TM_MENU_CLOSE"]			= "Fechar Menu"

LANG["TM_DELAYTAUNT_NOT_EXIST"] = "A provocação que você escolheu não foi encontrada no servidor!"
LANG["TM_DELAYTAUNT_PLSWAIT"]	= "Por favor aguarde %s segundo(s)!"

--[[
	PHX Menu window
]]
LANG["PHXM_WINDOW_TITLE"]		= "Prop Hunt X - Opções avançadas e menu"
LANG["SERVER_INFO_MOTD"]		= "INFORMAÇÕES DO SERVER & REGRAS [MOTD]"

LANG["PHXM_TAB_HELP"]			= "Ajuda & guias"
LANG["PHXM_TAB_MUTE"]			= "De/silenciar jogador"
LANG["PHXM_TAB_PLAYER"]			= "Opções do jogador"
LANG["PHXM_TAB_MODEL"] 			= "Busca de modelo de jogador"
LANG["PHXM_TAB_MODEL_DISABLED"]	= "Busca de modelo de jogador (Desabilitado)"
LANG["PHXM_TAB_ADMIN"]			= "Opções de administrador"
LANG["PHXM_TAB_ABOUT"]			= "Sobre Prop Hunt X"
LANG["PHXM_TAB_MAPVOTE"]		= "Opções de votação de mapa"

LANG["PHXM_CVAR_CHANGED"]		= "[Opções] CVar %q foi mudado para %q"

--[[
	Player Mute Settings
]]
LANG["PHXM_MUTE_SELECT"]		= "Selecione qualquer player que você queira silenciar."

--[[ 
	Player Settings
]]
LANG["PHXM_PLAYER_OPTIONS"]		= "Opções do jogador"
LANG["PHXM_PLAYER_LANG"]		= "Linguagens"
LANG["PHXM_PLAYER_BIND"]		= "Binds"
LANG["PHXM_PLAYER_HUDSETTINGS"]	= "Opções de HUD"

LANG["PHXM_PLAYER_TAUNT_KEY"]			= "Tecla de provocação aleatória"
LANG["PHXM_PLAYER_TAUNTWINDOW_KEY"]		= "Tecla do menu de provocação"
LANG["PHXM_PLAYER_ROTATLOCK_KEY"]		= "Tecla de travamento da rotação"

LANG["PHXM_PLAYER_TOGGLE_HALOS"]		= "Alternar efeito halo enquanto escolhe um objectoToggle Halo effect when choosing a prop"
LANG["PHXM_PLAYER_IDNAMES"]				= "Mostrar o nome dos companheiros de equipe acima de suas cabeças (E também mostrar pela parede)"
LANG["PHXM_PLAYER_ENDROUND_CUE"]		= "Tocar som no final do round"
LANG["PHXM_PLAYER_TAUNTMENU_AUTOCLOSE"]	= "Opção para auto fechamento na janela de provocações quando clicar duas vezes"
LANG["PHXM_PLAYER_SEE_HUNTER_LINE"]		= "Traçar uma linha nos caçadores para que seja possível ver suas miras enquanto espectador"
LANG["PHXM_PLAYER_SEE_LBALL_ICONS"]		= "Habilitar ícone da 'Bola sortuda' para ser mostrado quando nascer"
LANG["PHXM_PLAYER_SEE_CRYSTAL_ICONS"]	= "Habilitar ícone da 'Bola maldosa' para ser mostrado quando nascer"

LANG["PHXM_PLAYER_USE_NEW_HUD"]			= "Usa novo HUD do PH"
LANG["PHXM_PLAYER_SHOW_TUTOR"]			= "Mostrar pop-up de tutoriais"
LANG["PHXM_PLAYER_USE_NEW_CROSSHAIR"]	= "Habilitar mira customizada"
LANG["PHXM_PLAYER_SHOW_TEAM_TOPBAR"]	= "Mostrar total de players vivos numa barra na parte superior esquerda (Ao menos 4 jogadores serão mostrados)"

--[[
	Player model Browser Section
]]
LANG["QUERY_MODEL_SELECTED"]	= "Modelo %s foi selecionado e será aplicatado depois do renascimento!"
LANG["QUERY_MODEL_INFO"]		= "Nome do modelo: %s - Disponível para: Todos"

LANG["MDL_MENU_REFRESH"] 		= "Ícone de atualizar"
LANG["MDL_MENU_PREVIEW"] 		= "Pré-visualizar modelo"
LANG["MDL_MENU_MODELINFO"] 		= "Informação do modelo"


LANG["MISC_APPLYMDL"] 			= "Aplicar modelo"

LANG["PHXM_MODEL_DISABLED"] 	= "Desculpe, modelo customizável de jogador está desabilitado nesse server!"
LANG["PHXM_PLAYERMODEL_SETFOV"]	= "  Mudar FOV do modelo"

--[[
	Server Settings
]]
LANG["PHXM_ADMIN_OPTIONS"]		= "Opções do servidor (Visíveis apenas para os administradores/dono)"
LANG["PHXM_ADMIN_MUSTALIVE"]	= "Você tem que estar vivo para realizar essa operação."

--[[
	Language Override
]]
LANG["PHXM_ADMIN_LANGOVERRIDE"]	= "Sobrescrita de língua"

LANG["PHXM_ADMIN_FORCELANG"] 				= "Forçar língua? Isso irá sobrescrever a linguagem do cliente para a língua escolhida pelo server."
LANG["PHXM_ADMIN_LANGTOUSE"]				= "Lingua forçada a usar."
LANG["PHXM_ADMIN_PLAYERDEFAULTLANG"] 		= "Língua padrão do jogador ao se conectar pela primeira vez."

-- Gameplay settings
LANG["PHXM_ADMIN_CUSTOM_MODEL"]				= "Habilitar modelos customizáveis para Caçadores"
LANG["PHXM_ADMIN_CUSTOM_MODEL_PROP"]		= "Habilitar modelos customizáveis para Objetos - Tenha certeza que habilitou também para os caçadores."
LANG["PHXM_ADMIN_TAUNT_DELAY_CUSTOM"]		= "Atraso de provocação customizada (Segundos)"
LANG["PHXM_ADMIN_TAUNT_DELAY_RANDOM"]		= "Atraso de provocação normal (Segundos)"
LANG["PHXM_ADMIN_TAUNT_DELAY_AUTO"]			= "Atraso de provocação automática (Segundos)"
LANG["PHXM_ADMIN_AUTOTAUNT_ENABLE"]			= "Habilitar recursos de provocação automática"

LANG["PHXM_ADMIN_NOTICE_ROTATION"]			= "Mostrar: 'Rotação de objetos' em todo nascimento de Objeto"
LANG["PHXM_ADMIN_CAMERA_COLLIDE"]			= "Habilitar Colisão de câmera do Objeto com a parede"
LANG["PHXM_ADMIN_FREEZECAM"]				= "Habilitar câmera congelada para o time dos Objetos"
LANG["PHXM_ADMIN_PROP_COLLIDE"]				= "Habilitar colisão entre Objetos"
LANG["PHXM_ADMIN_SWAP_TEAM"] 				= "Habilitar troca de time todo round - Desabilitar isso significa mesmo time toda rodada"
LANG["PHXM_ADMIN_HUNTER_PENALTY"]			= "Penalidade de vida do Caçador"
LANG["PHXM_ADMIN_HUNTER_KILL_BONUS"]		= "Bonus de kill do Caçador"
LANG["PHXM_ADMIN_HUNTER_SMG_GRENADES"]		= "Granadas de SMG para o Caçador"
LANG["PHXM_ADMIN_GAME_TIME"]				= "Tempo total de jogo (Minutos)"
LANG["PHXM_ADMIN_BLINDLOCK_TIME"]			= "Tempo da cegueira do Caçador"
LANG["PHXM_ADMIN_ROUND_TIME"]				= "Tempo da rodada (Segundos)"
LANG["PHXM_ADMIN_ROUNDS_PER_MAP"]			= "Número de rodadas por mapa"
LANG["PHXM_ADMIN_ENABLE_LUCKYBALL"]			= "Habilitar funcionalidade das bolas da sorte para serem geradas em Objetos quebráveis (A chance é de 8%)"
LANG["PHXM_ADMIN_ENABLE_CRYSTAL"]			= "Habilitar funcionalidade das bolas maldosas para serem geradas quando o caçador morrer (A c hance é de 70%)"
LANG["PHXM_ADMIN_WAIT_PLAYERS"]				= "Wait for Players to begin the gameplay"
LANG["PHXM_ADMIN_WAIT_MIN_PLAYERS"]			= "Jogadores mínimos para o jogo começar (Padrão: 1)"
LANG["PHXM_ENABLE_PLAYER_JOIN_LEAVE"] 		= "Habilitar notificação quando o player juntar-se ou deixar a partida?"

LANG["PHXM_ADMIN_FORCEJOINBALANCE"]			= "Forçar players a balanceamento"
LANG["PHXM_ADMIN_ENABLETEAMBALANCE"]		= "Automaticamente irá balancear os times no começo da partida"
LANG["PHXM_ADMIN_PICKUP_PROPS"] 			= "Permitir escolha de objetos pequenos?  0: Não permitir, 1: Apenas caçadores, 2: Apenas objetos, 3: Permitir à todos."

LANG["PHXM_ADMIN_TAUNTMODES"]			= "Modos de provocação"
LANG["PHXM_ADMIN_TAUNTMODE_MODE"]		= "--[O modo de provocação atual é: %d ]--"
LANG["PHXM_ADMIN_TAUNTMODE0"]			= "Modo [0]: F3/Provocação aleatória"
LANG["PHXM_ADMIN_TAUNTMODE1"]			= "Modo [1]: C/Provocação personalizada"
LANG["PHXM_ADMIN_TAUNTMODE2"]			= "Modo [2]: Ambos os modos"
LANG["PHXM_ADMIN_TAUNTSOPEN"]			= "Abrir janela de provocação"

LANG["PHXM_MODE_DEFAULT"] 				= "--[ Modo de pegar está selecionado em %d ]--"
LANG["PHXM_MODE0"]						= "Modo [0]: Não permitir"
LANG["PHXM_MODE1"]						= "Modo [1]: Apenas Caçadores"
LANG["PHXM_MODE2"]						= "Modo [2]: Apenas Objetos"
LANG["PHXM_MODE3"]						= "Modo [3]: Permitir pegar"

--[[
	Admin Developer Sections
]]
LANG["PHXM_ADMIN_DEVSECTION"]		= "Opções de desenvolvimento/Opções experimentais"
LANG["PHXM_ADMIN_ROOMCHECK"]		= "Habilitar checagem de borda? Isso previnirá que você fique preso nos objetos/paredes"
LANG["PHXM_ADMIN_USENEWMKBREN"]		= "Usar novo modelo para arma bônus Bren MK II (Necessário reiniciar o mapa)"
LANG["PHXM_ADMIN_BEVERBOSE"]		= "Desenvolvimento: Seja claro - Enable PH:X para mostrar toda informação e eventos claramente?"
LANG["PHXM_ADMIN_SHOWPLNAMEHEAD"]	= "Habilitar nomes dos times dos jogadores para aparecer em suas telas."
LANG["PHXM_ADMIN_USESINGLE_FZCAM"]	= "Usar câmera de congelamento ao invés da lista de sons (Use 'ph_fc_cue_path' para determinar o diretório do som)"
LANG["PHXM_ADMIN_MODELLISTINGTYPE"] = "Usar lista de modelos legada : 0 = Todos os modelos (AddValidModel), 1 = Usar legado: list.Get('PlayerOptionsModel')"
LANG["PHXM_ADMIN_JUMPPOWER"]		= "Poder de pulo adicional para Props"
LANG["PHXM_ADMIN_ENABLE_OBB"]		= "Desenvolvedor: Habilitar bordas de entidade de modelo customizadas"
LANG["PHXM_ADMIN_RELOAD_OBB"]		= "Desenvolvedor: Recarregar bordas de entidade de modelo customizadas todo reinicio de rodada"

--[[
	Experimental & PH:X Features
]]
LANG["PHXM_ADMIN_EXPERIMENTALPHX"]			= "Nova seção experimental PHX"

LANG["PHXM_ADMIN_HLA_COMBINE"]				= "Adicionar suporte ao modelo de combine HLA"
LANG["PHXM_ADMIN_TEAMBALANCE"]				= "Habilitar balanceamento de times"
LANG["PHXM_ADMIN_CHANGETEAM_LIMIT"]			= "Limitador de uso de troca de times. Mude para -1 para desabilitar. "
LANG["PHXM_ADMIN_USENEWCHAT"]				= "Usar nova caixa de chat (eChat) - Isso é uma substituição temporário, deixe desabilitado se você já tem."
LANG["PHXM_ADMIN_NEWCHATPOS"]				= "Posição da nova caixa de texto: Subtraia Altura (Y) por N pixels."
LANG["PHXM_ADMIN_RESPAWNONBLIND"]			= "Permitir renascimento no tempo de cegueira"
LANG["PHXM_ADMIN_RESPAWNONBLIND_TEAM"]		= "Permitir renascimento no tempo de cegueira para apenas o time específico: 0: Todos, 1: Caçadores, 2: Objetos"
LANG["PHXM_ADMIN_REWSPANTIMEPERCENT"]		= "Porcentagem do tempo de cegueira que deixará você renascer. O padrão é de 75%"
LANG["PHXM_ADMIN_ALLOWRESPAWN_SPECTATOR"]	= "Deixar renascer no tempo de cegueira quando mudar para o time de espectadores"
LANG["PHXM_ADMIN_ALLOWRESPAWN_TEAMCHANGE"]	= "Deixar renascer no tempo de cegueira quando mudar para um time diferente (Habilitar isso não é recomendável)"

--[[
	MapVote Settings
]]
LANG["PHXM_MV_SETTINGS"]			= "Opções de votação de mapa"

LANG["PHXM_MV_ALLOWCURMAP"]			= "Permitir votar pelo mapa atual"
LANG["PHXM_MV_COOLDOWN"]			= "Habilitar contagem regressiva para a votação"
LANG["PHXM_MV_USE_ULX_VOTEMAPS"]	= "Usa listagem de mapas do ULX MapVote? Se não, *.bsp serão usados no lugar"
LANG["PHXM_MV_MAPLIMIT"]			= "Número de mapas a serem mostrados na votação."
LANG["PHXM_MV_TIMELIMIT"]			= "Tempo em segundos padrão para votação."
LANG["PHXM_MV_MAPBEFOREREVOTE"]		= "Mudanças de mapa necessária para um mapa reaparecer"
LANG["PHXM_MV_RTVCOUNT"]			= "Quantos jogadores serão necessários para usar RTV (Rock the Vote)"

LANG["PHXM_MV_EXPLANATION1"]		= "Para selecionar quais mapas devem ser listados, use (por exemplo)[ mv_mapprefix 'ph_,cs_,de_' ] no console."
LANG["PHXM_MV_EXPLANATION2"]		= "Se você tiver usando ULX ULX, use map_vote. Use map_vote, senão use mv_start."
LANG["PHXM_MV_EXPLANATION3"]		= "Ação de votação de mapa (Para cancelar, digite !unmap_vote (ULX) ou mv_stop no console)"

LANG["PHXM_MV_START"]		= "Começar votação de mapa"
LANG["PHXM_MV_STOP"]		= "Parar votação de mapa"
--                  			  ^YOU VIOLATED THE LAW!


--[[ 
	Versioning, Credits or About section
]]
LANG["PHXM_ABOUT_VERSIONING"]		= "Versão: %s - Revisão: %s"
LANG["PHXM_ABOUT_AUTHOR"]			= "Por: %s"
LANG["PHXM_ABOUT_ENJOYING"]			= "Se você tiver gostando do jogo, considere doar!"
LANG["PHXM_ABOUT_UPDATE"]			= "Atualizações do Prop Hunt X"
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
LANG["PHXM_ABOUT_LINKS"]			= "Links e créditos"
LANG["PHXM_ABOUT_THANKS"]			= "Agradecimento especial pelo apoio, sugestão e contribuição:\n %s"
LANG["PHXM_ABOUT_BTN_DONATE"]		= "Apoie PH:X doando"
LANG["PHXM_ABOUT_BTN_HOME"]			= "PHX Homepage"
LANG["PHXM_ABOUT_BTN_GITHUB"]		= "PHX GitHub Repository"
LANG["PHXM_ABOUT_BTN_PLUGINS"]		= "PHX Addons/Plugins"
LANG["PHXM_ABOUT_BTN_CHANGELOGS"]	= "PHX Changelogs"

--[[
	Late Additionals
]]
-- fretta
LANG["HUD_SPECTATING"]	= "OBSERVANDO"
LANG["HUD_YOUDIED"]		= "Você morreu!"

LANG["CHAT_STARTING_MAPVOTE"] = "A rodada acabou, começando votação de mapa!"

-- This used for HUD Taunt Timer
LANG["HUD_PROP_TAUNT_TIME"]	= "Provocação aleatória"
LANG["HUD_PROP_CTAUNT_TIME"] = "Provocação Cust."

LANG["PHXM_TAB_PLUGINS"]				= "Addons & Plugins"

-- Plugins Section
LANG["PLUGINS_NO_PLUGINS"]				= "Nenhum plugin instalador. Procure por mais plugins aqui!!"
LANG["PLUGINS_BROWSE_MORE"]				= "Procurar mais plugins"
LANG["PLUGINS_SERVER_HAS_NO_PLUGINS"]	= "Desculpe, esse server não tem addons customizados/plugins instalados."
LANG["PLUGINS_SERVER_SETTINGS"]			= "-- Opções de servidor --"
LANG["PLUGINS_CLIENT_SETTINGS"]			= "-- Opções de cliente --"

-- Text Entries
LANG["TEXTENTRY_FZ_SINGLE"] = "Freeze Cam Single Sound Path" -- this one is for ph_fc_cue_path command
LANG["TEXTENTRY_MV_PREFIX"] = "Prefixo de mapa para votação"			 -- the map previx for mv_mapprefix

--============= LATE ADDITION OF 29.10.21/X2Z. Please Improve your Language Here! =============--

LANG["MISC_GAME_ENDED"]		= "Game has ended."

--============= LATE ADDITION OF 16.09.21/X2Z. =============--

--[[
	Credits: Late Addition: Revision: 16.09.21/X2Z
]]

LANG["PHXM_ABOUT_BTN_WIKI"]			= "PHX Wiki & Manuals"

--[[
	Auto Taunt: Late Addition: Revision: 16.09.21/X2Z
]]

LANG["HUD_AUTOTAUNT_DISABLED"]		= 	"Auto Taunting is disabled."
LANG["HUD_AUTOTAUNT_WAITFORUPDATE"]	=	"Auto Taunt is Synchronizing..."

--[[
	MapVote: Late Addition: Revision: 16.09.21/X2Z
]]
LANG["PHXM_MV_VOTEROCKED"]				= " The vote has been rocked, map vote will begin on round end"
LANG["PHXM_MV_VOTEROCKED_IMMINENT"]		= "The vote has been rocked, map vote imminent"
LANG["PHXM_MV_VOTEROCKED_PLY_TOTAL"]	= "%s has voted to Rock the Vote. ( %d / %d )"

LANG["PHXM_MV_MUST_WAIT"]				= "You must wait a bit before voting!"
LANG["PHXM_MV_VOTEINPROG"]				= "There is currently a vote in progress!"
LANG["PHXM_MV_HAS_VOTED"]				= "You have already voted to Rock the Vote!"
LANG["PHXM_MV_ALR_IN_VOTE"]				= "There has already been a vote, the map is going to change!"
LANG["PHXM_MV_NEED_MORE_PLY"]			= "You need more players before you can rock the vote!"

--[[
	Late Addition: Revision: 16.09.21/X2Z
]]
LANG["PROP_PLAYERMDL_BANNED"]	= "Your custom Prop Player Model was banned from the server."

--[[
	Prop Menu/Prop Chooser, Revision: 16.09.21/X2Z
]]

LANG["PCR_USAGE_UNLIMIT"]		= "[Prop Menu] You have **unlimitted** usage left!"
LANG["PCR_USAGE_COUNT"]			= "[Prop Menu] You have %d usage left!"
LANG["PCR_PLS_WAIT"]			= "[Prop Menu] Please wait in %d seconds."
LANG["PCR_NOROOM"]				= "[Prop Menu] There is no room to change the prop!"
LANG["PCR_PROPBANNED"]			= "[Prop Menu] This prop was banned by the server."
LANG["PCR_PROPBANNED_BYPCR"]	= "[Prop Menu] You cannot use this prop because it was banned by Prop Menu."
LANG["PCR_REACHED_LIMIT"]		= "[Prop Menu] You have reached the limit!"
LANG["PCR_STAY_ON_GROUND"]		= "[Prop Menu] You need to stay on the ground and not crouching!"
LANG["PCR_ONLY_GROUP"]			= "[Prop Menu] Only certain groups can open this menu!"
LANG["PCR_NOT_EXIST_COUNT"]		= "That prop you have selected does not exists in this map! ( %s / 4 )"
LANG["PCR_NOT_EXIST"]			= "That prop you have selected does not exists in this map!"

-- PCR Client section, reason why there is a space because of chat.AddText between args.
LANG["PCR_NOTIFY_1"]			= " This server use Prop Menu version %s! Type "
LANG["PCR_NOTIFY_2"]			= " in console or use F1 -> [PropChooser Help] menu."
LANG["PCR_CL_DISABLED"]			= " This feature is disabled."
LANG["PCR_CL_GROUP"]			= " Only certain groups can open this menu!"
LANG["PCR_CL_LIMIT"]			= " You have reached the limit!"
LANG["PCR_UNLIMIT_TEXT"]		= "Unlimited"
LANG["PCR_WINDOW_TITLE"]		= "PHX Prop Menu"
LANG["PCR_HEADER_TOP"]			= "Choose any prop you want. You have"
LANG["PCR_HEADER_MID"]			= "%s usage limit"
LANG["PCR_HEADER_BOTTOM"]		= "to use this prop chooser!"
LANG["PCR_CL_TOOLTIP_BANNED"]	= "You cannot use this model."
LANG["PCR_CL_TOOLTIP_MODEL"]	= "Model: %s"
LANG["PCR_CL_MENU_NOTREADY"]	= " This feature is not available at the moment."
LANG["PCR_WINDOW_GUIDE_TTL"]	= "Quick Guide: Prop Menu 101"
LANG["PCR_BTN_HELP_MENU"]		= "Prop Menu Help"

LANG["PCR_CL_CMDUSEULX"]		= " This command is disabled. Use 'ulx propmenu' instead!"
LANG["PCR_CMD_ULX_DISABLED"]	= "Command ulx propmenu is disabled. Press your [Prop Menu Bind] to open."	--input.GetKeyName is impossible to access.

LANG["PCR_EDT_IN_USE"]			= "An admin is still editing the prop data. Please Wait!"
LANG["PCR_EDT_ERROR_DISABLED"]	= "[Prop Menu] Error: Custom Prop Addition is Disabled!"
LANG["PCR_EDT_NO_RIGHTS"]		= "You have no rights to access this feature."

-- I'm actually exhausted and feel so burned out, but I'll update this in future, or in PH:Zero I guess.
-- Section: Custom Prop Editor File Browser and stuff...
-- LANG["PCR_EDT_XXX"] 	= "todo"
-- LANG["PCR_FB_XXX"] 	= "todo"

--[[
	Admin Section, Revision: 16.09.21/X2Z
]]
LANG["PHXM_PLAYER_PROP_CHOOSER_KEY"]	= "Default Key to open Prop Menu (Prop Chooser)."
LANG["PHXM_PROP_FREEZE_MIDAIR"]			= "Default Key to toogle Freeze movement during on midair as a Prop."
LANG["PHXM_ADMIN_PROP_RIGHT_CLICK"]		= "Should Props also able to Taunt by pressing Right Click?"
LANG["PHXM_ADMIN_TAUNT_SCANNER"]		= "(Require Map Restart) Enable Taunt Scanner?"
LANG["PHXM_ADMLBL_USABLE_ENTS"]			= "Usable Prop Entities Types"
LANG["PHXM_ADMLBL_USABLE_ENTS_REF"]		= "Types can be: 1: Physics Only, 2: Physics & Dynamics, 3: Almost Anything inc. Ragdolls, 4: Custom Entities."
LANG["PHXM_ADMIN_USABLE_ENT_TYPE"]		= "Type of Entities to use for Prop to Replicate"
LANG["PHXM_ADMIN_NOTIFY_ENT_TYPE"]		= "Notify Props about entities that cannot be replicated by pressing E. Only works if 'ph_usable_prop_type' is set to 3 or 4."
LANG["NOTIFY_PROP_ENTTYPE"]				= "Press [E] to interact, [Click] to replicate object."
LANG["NOTIFY_CUST_ENT_TYPE_IS_ON"]		= "[PHX] Notice: Press [E] to interact object, Press [Click] to Replicate the object."

--[[
	Custom Taunts, Revision: 16.09.21/X2Z
]]
LANG["TM_TAUNTS_SEARCH_NOTHING"]		= "Taunt containing '%s' was not found..."
LANG["TM_SEARCH_PLACEHOLDER"]			= "Search in this category: Enter word, lowercase & no wildcards. Empty=Show All."

--[[
	Freeze Cam, Revision: 23.09.21/X2Z
]]
LANG["PHXM_ADMIN_FREEZECAM_HUNTER"]			= "Enable Freeze Cam features for team hunters"

--============= LATE ADDITION OF 10.06.2022/X2Z. =============--

LANG["PHXM_MSG_INPUT_IS_EMPTY"]			= "Text is empty or you didn't pressed ENTER key."
LANG["MISC_SET"]						= "Set"
LANG["MISC_APPLY"]						= "Apply"
LANG["MISC_NO"]							= "No"
LANG["MISC_YES"]						= "Yes"
LANG["MISC_WARN"]						= "Warning"
LANG["MISC_ERROR"]						= "Error"
LANG["MISC_INFO"]						= "Information"
LANG["MISC_NOTICE"]						= "Notice"
LANG["MISC_IDK"]						= "Unknown"
LANG["MISC_NA"]							= "N/A"

-- HUD
LANG["HUD_DECOY_ACTIVE"]                = "Press [%s]"
LANG["HUD_FAKETAUNT_COUNT"]             = "%ix Left"
LANG["HUD_FAKETAUNT_UNLI"]              = "Unlimited"
LANG["NOTICE_GRENADE_SMG_GIVEN"]        = "You are now acquired some SMG Grenades."

--[[
	ADMIN PANEL, Revision 10.06/2022/X2Z
]]--
LANG["PHXM_TAUNT_SETTINGS"]				= "Taunt Settings"
LANG["PHXM_GENERAL_SETTINGS"]			= "General Settings"
LANG["PHXM_FAKE_TAUNT_SETTINGS"]		= "Fake Taunt Settings"
LANG["PHXM_FAKE_TAUNT_ENABLE"]			= "Allow fake taunts to be played on random props in the map. Can be accessed only through Custom Taunt menu."
LANG["PHXM_FAKE_TAUNT_MAXUSAGE"]		= "Maximum usage for fake taunts to be used; -1 is unlimited."
LANG["PHXM_TAUNT_RIGHT_CLICK"]		    = "Right click for taunt. This will disable Right-clicking on custom menu!"

LANG["PHXM_TAUNT_PITCH_SETTINGS"]		= "Taunt Pitch Settings"
LANG["PHXM_TAUNT_PITCH_ENABLE"]			= "Enable Taunt Pitch"
LANG["PHXM_TAUNT_PITCH_RANGE_MIN"]		= "Minimum threshold/acceptable pitch range for a taunt. 1 to 99."
LANG["PHXM_TAUNT_PITCH_RANGE_MAX"]		= "Maximum threshold/acceptable pitch range for a taunt. 100 to 255."

LANG["PHXM_DECOY_SETTINGS"]				= "Decoy Settings"
LANG["PHXM_DECOY_ENABLE"]				= "Enable Decoy reward? Reward will be given ONLY ONCE for alive props until the round ends. They don't add and only substract once they're placed."

LANG["PHXM_DISABLE_FOOTSTEP"]           = "Toggle silent prop team footsteps"

LANG["PHXM_ADMIN_CHATSETTING"]			= "Chat Window Settings"
LANG["PHXM_ADMIN_HUNTERBLIND"]			= "Hunter Blind Control"

LANG["PHXM_ADMIN_GIVEGRENADE_NEAREND"]  = "Should grenades will be given near round end? If Yes, see 'ph_give_grenade_roundend_before_time'"
LANG["PHXM_ADMIN_GIVEGRENADE_TIME"]     = "Time in seconds to give grenades before Round Ends. This is typically between 10 to 30 seconds"

--[[
	Plugins in sh_init.lua, Revision 10.06/2022/X2Z
]]--
LANG["PLUG_NAME_VER"]					= "Plugin: %s | v.%s"
LANG["PLUG_DESCRIPTION"]				= "Description: %s"

--[[
	Taunt Pitch, Revision 10.06/2022/X2Z
]]--
LANG["PHX_CTAUNT_USE_PITCH"]			= "Use pitch for custom taunts"
LANG["PHX_CTAUNT_RANDOM_PITCH"]			= "Randomize pitch when playing taunt"
LANG["PHX_RTAUNT_USE_PITCH"]			= "Use pitch for random taunts [%s]"
LANG["PHX_RTAUNT_RANDOMIZE"]			= "Randomize pitch for random taunts [%s]"
LANG["PHX_CTAUNT_PITCH_FOR_FAKE"]		= "Use pitch for fake taunts"
LANG["PHX_CTAUNT_RANDPITCH_FOR_FAKE"]	= "Randomize pitch for fake taunts"
LANG["PHX_CTAUNT_SLIDER_PITCH"]			= "Taunt pitch slider."
LANG["TM_TOOLTIP_FAKETAUNT"]			= "Play a Fake Taunt on random prop"
LANG["TM_PREFERRED_PITCH"]              = "Preferred Taunt Pitch Level"

--[[
	Fake Taunt, Revision 10.06/2022/X2Z
	Description: Play fake taunts on random props in the map (Not Players)
]]--
LANG["PHX_CTAUNT_ON_RAND_PROPS"]		= "Play on random props (%ix)"
LANG["PHX_CTAUNT_ON_RAND_PROPS_UNLI"]	= "Play on random props"
LANG["PHX_CTAUNT_PLAYED_ON_RANDPROP"]	= "You played a taunt on a random prop."
LANG["PHX_CTAUNT_RAND_PROPS_LIMIT"]		= "You have hit the limit!"
LANG["PHX_CTAUNT_RAND_PROPS_NOT_PROP"]  = "Not available at this moment."
LANG["PHX_CTAUNT_RANDPROP_DISABLED"]	= "Fake taunt is currently disabled."

--[[
	PH:Z Simple Decoy, Revision 10.06/2022/X2Z
]]--
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

LANG["PHXM_DECOY_HEALTH"]				= "How much health does the decoy should have. Default is 10."
LANG["PHXM_PLAYER_SHOW_DECOY_HELPER"]   = "Show/Hide Decoy placement helper? This will show a white dot with a text near on your crosshair."
LANG["PHXM_PLAYER_SHOW_DECOY_MARKER"]   = "Show/Hide Decoy marker?"

--[[
	Revision 10.06/2022/X2Z
    Prop Menu Update: Menu, Editor, Browser
]]--
LANG["PCR_MODEL_DONT_EXISTS"]   = "Sorry, this model is not available at the moment!"

LANG["PCR_PLUG_WARN_MSG"]		= "Warning: Custom Prop Addition (pcr_allow_custom) is set to 0.\nYou Must Enable this feature in order to edit your custom prop!\nA Map change is required to change this setting."
LANG["PCR_PLUG_LBL_BINDKEY"]	= "To change bind key, switch to '[Player] tab."
LANG["PCR_PLUG_LBL_EDITOR"]		= "Custom Prop Menu Editor"
LANG["PCR_PLUG_BTN_OPEN_EDT"]	= "Open Editor"
LANG["PCR_PLUG_LBL_COMSET"]		= "Common Settings"
LANG["PCR_PLUG_LBL_TECHSET"]	= "Technical Settings"
LANG["PCR_PLUG_LBL_EXPSET"]		= "Experimentals"
LANG["PCR_PLUG_LBL_PLAYERSET"]	= "Player Settings"

LANG["PCR_PLUG_ENABLE"]			= "Enable 'Prop Menu' feature"
LANG["PCR_PLUG_ALLOW_CUSTOM"]	= "(Require Map Restart) Allow custom props to be added in to the Prop Menu list?"
LANG["PCR_PLUG_PROP_BAN"]		= "(Require Map Restart) Do not include banned props into Prop Menu list?"
LANG["PCR_PLUG_USAGE_LIMIT"]	= "Maximum usage limit for player to use. -1 means unlimited."
LANG["PCR_PLUG_PROP_LIMIT"]		= "(Require Map Restart) Limit amount of prop addition to Prop Menu list"
LANG["PCR_PLUG_PROP_LIMITMAX"]	= "Maximum amount of props that will be added to Prop Menu list. Note: This will be randomly added!"
LANG["PCR_PLUG_USE_ULXMENU"]	= "Should Prop Menu can be accessed by Console (0) or ULX (1)? Bound key will respect with this setting"
LANG["PCR_PLUG_USE_DELAY"]		= "Delay in seconds before player to use another Prop in Prop Menu"
LANG["PCR_PLUG_KICK_INVALID"]	= "Kick any user attempt to access Invalid Model (4x Max. threshold)"
LANG["PCR_PLUG_SPACE_CHECK"]	= "Check for space for a room before player use another prop to prevent Stuck"
LANG["PCR_PLUG_X_BBOX"]			= "(Require Map Restart) Check Entity BBox Limit before adding to Prop Menu list"
LANG["PCR_PLUG_X_BBOX_MAX"]		= "BBox CollisionBound Maximum Height limit. Mins will be auto-calculated."
LANG["PCR_PLUG_X_BBOX_MIN"]		= "BBox CollisionBound Maximum Width limit. ins will be auto-calculated."
LANG["PCR_PLUG_ONLY_GROUPS"]	= "Should Prop Menu can only be accessed by certain groups e.g. Donator?"
LANG["PCR_PLUG_NOTIFYMSG"]		= "Notify player on how to use Prop Menu on every round start"

LANG["PCR_EDITOR_MSG_ERROR"]	= "Your changes hasn't been saved due to Errors.\nPlease check on your server console!"
LANG["PCR_EDITOR_MSG_SUCC"]		= "Your changes and Custom Prop data has has been saved and updated successfully."

LANG["PHZ_generic_title"]		= "Custom Prop Inclusion Editor"
LANG["PHZ_generic_helptext"]	= [[[How To Use:
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
LANG["PHZ_generic_mdlinfo"] = [[Model Info:
%s
Has Physics: %s]]
LANG["PHZ_generic_mdlinfoStart"] = "(Select model first!)"

LANG["PHZ_generic_no_ragdoll"]	= "No: Ragdoll"
LANG["PHZ_generic_titlelabel"]	= "%s Preview :"

LANG["PHZ_mount_game_sel"]		= "Select mounted game (Default: Garry's Mod)"
LANG["PHZ_input_placeholder1"]	= "Folder to Search: <folder name> or '*', blank for all folders."
LANG["PHZ_input_placeholder2"]  = "Addon to Search: <name> or '*', blank for all folders."
LANG["PHZ_msg_warn_close"]		= "Are you sure you want to close this window? Any unsaved edits will be lost!"
LANG["PHZ_msg_commit"] 			= "Are you sure you want to commit changes?"
LANG["PHZ_msg_cant_empty"]		= "Prop List cannot be empty!"
LANG["PHZ_msg_removesel"] 		= [[Remove selected props in the list. Legends:
Red = Marked Selections
Yellow: Prop don't exists in server AND should be Removed.]]
LANG["PHZ_msg_warn_mdlinlist"]  = "WARNING: This Model is already in the list!"
LANG["PHZ_msg_invalid_mdl"] 	= "Reason: This is invalid model"
LANG["PHZ_apply_select"] 		= "Apply & Save Selections"
LANG["PHZ_menu_copy"] 		= "Copy Model"
LANG["PHZ_menu_refresh"] 	= "Refresh Model"
LANG["PHZ_tooltip_removesel"]	= "Remove Selected"
LANG["PHZ_tooltip_wasmarked"] = [[This prop was marked because it does't exist in the server.
If you close this editor, this will automatically removed.]]

LANG["PHZ_pcr_fb_allcontent"] = "All Contents (Not All Players/Server will have same contents as you)"
LANG["PHZ_pcr_fb_notmounted"] = "%s [Not Mounted]"

PHX.LANGUAGES[LANG.code] = LANG