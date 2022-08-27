-- Language Improved by Galaxio.
-- Previously Translated by: TR1NITY & Haeiven

local LANG = {}

LANG.code = "fr"

LANG.Name 		 	= "Français"
LANG.NameEnglish	= "French"
LANG.Author			= "GaLaxio, TR1NITY, Haeiven"
-- Can Accept: String, and Table.
LANG.AuthorURL		= {	
	"https://steamcommunity.com/profiles/76561198107519666", --Galaxio
    "https://steamcommunity.com/profiles/76561198260731850", --TR1NITY
    "https://steamcommunity.com/profiles/76561198047814125"  -- Haeiven
}
LANG.SUICIDEMSG = { 
	"s'est suicidé.",
	"est mort mystérieusement.",
	"est mort par la magie.",
	"s'est littéralement suicidé d'un pont.",
	"a décidé de ragequit.",
	"est bourré.",
	"est mort, une autre chance une prochaine fois...",
	"s'est giflé.",
	"a trébûché sur un bâton.",
	"est mort par la force.",
	"est mort, la prochaine fois appuie sur ALT+F4.",
	"est mort après avoir offensé de pauvres objets.",
	"s'est envolé vers le ciel.",
	"a suivi son instinct.",
	"a attrapé le COVID.",
	"est tombé sous le charme de la mort.",
	"a été stoppé dans son élan.",
	"s'est pris un coup de pied au cul.",
}
LANG.RANDOM_SPECTATORS = {
	"pour regarder et se détendre.",
	"pour voir ce qu'il se passe autour.",
	"pour admirer la vie d'une chaise.",
	"",
}

LANG["PHX_TEAM_CONNECTING"] = "Connecté"
LANG["PHX_TEAM_PROPS"]		= "Props" 
LANG["PHX_TEAM_HUNTERS"] 	= "Hunters"
LANG["PHX_TEAM_UNASSIGNED"]	= "Non assigné"
LANG["PHX_TEAM_SPECTATOR"] 	= "Spectateur"

-- List of string-based translation
LANG["HUD_KILLED"]				= "a tué"

-- FRETTA: HUDs
LANG["HUD_TIME"] 				= "TEMPS"
LANG["HUD_ROUND"]				= "MANCHE"
LANG["HUD_WAITPLY"]				= "En attente de joueurs..."
LANG["HUD_DEAD"]				= "(MORT)"

LANG["HUD_TEAMWIN"]				= "%s a gagné!"
LANG["HUD_LOSE"]				= "Égalité"
LANG["MISC_TIMELEFT"]			= "Temps restant: %s"
LANG["MISC_GAMEEND"] 			= "La partie se terminera après ce round."

-- FRETTA: Team selection screen (F2)
LANG["DERMA_TEAMSELECT"]		= "Choisir une équipe"

-- FRETTA: F1 screeen
LANG["DERMA_RTV"] 				= "Voter pour changer de map (RTV)"
LANG["DERMA_PHMENU"] 			= "Menu Prop Hunt"
LANG["DERMA_CHANGETEAM"]		= "Changer d'équipe"

-- FRETTA: Scoreboard
LANG["DERMA_PLAYER"]			= "(%d joueur)"	
LANG["DERMA_PLAYERS"]			= "(%d joueurs)"
LANG["DERMA_NAME"]				= "Nom"
LANG["DERMA_KILLS"]				= "Tués"
LANG["DERMA_DEATHS"]			= "Morts"
LANG["DERMA_PING"]				= "Ping"
LANG["DERMA_SERVER_TAG"]		= "SV"
LANG["DERMA_BOT_TAG"]			= "BOT"
LANG["DERMA_GAMEMODE_CREDITS"]	= "%s | Version: %s - Rev. %s"

LANG["CHAT_JOINED"]				= " a rejoint "
LANG["CHAT_JOINEDTHE"]			= " a rejoint l'équipe "

LANG["CHAT_SWAPBALANCE"]		= "%s a été remplacé par %s pour l'équilibrage des équipes."
LANG["CHAT_SWAPBALANCEYOU"]		= "Vous avez été échangé pour atteindre un équilibre parfait." -- Smile... for even in death, you have become children of Thanos

-- FRETTA: Splash Starting Screen
LANG["SPASHSCREEN_BY_X"]		= "par %s"
-- RichTextBox
LANG["HELP_DONATORS_AND_CONTRIBUTORS"]  = "\n\nDonateurs & Contributeurs:\n- %s"
-- // END OF FRETTA SECTION \\

LANG["HELP_F1"] 				= [[Projet Prop Hunt X.
Un projet qui a pour objectif de rendre le Prop Hunt plus Moderne et plus Personnalisable.
Plus d'informations sur:
https://www.buymeacoffee.com/wolvindra
Pour voir plus d'infos, de guides et d'aides, Appuyez [F1] et cliquer sur le bouton [Menu Prop Hunt].
Version: ]].. PHX.VERSION ..[[ Revision: ]].. PHX.REVISION ..[[

Tout le contenu du Prop Hunt a été traduit par GaLaxio
https://steamcommunity.com/profiles/76561198107519666

Traduit à l'origine par: TR1NITY & Haeiven.

Amusez vous bien!]]

LANG["LANGUAGE_CHANGED"]		= "La langue préférée a été changée par %s"

-- internal cl_menutypes section.
LANG["SUBTYPE_PREFERED_LANG"]	= "Langue préférée"

-- Events
LANG["EV_PLAYER_CONNECT"]		= "%s s'est connecté sur le serveur."
LANG["EV_PLAYER_JOINED"]		= "%s a rejoint le serveur."
LANG["EV_PLAYER_DISCONNECT"]	= "%s s'est deconnecté du serveur (Raison: %s)"

-- HUD elements
LANG["HUD_HP"]					= "SANTÉ"
LANG["HUD_AMMO"] 				= "MUNITIONS"
LANG["HUD_MAGSEC"]				= "MAG. / SEC." --Magazine | Secondary Magazine

-- !!WEAPON NAMES CANNOT BE TRANSLATED, THEY USE FROM language.GetPhrase THEREFORE IT'S IMPOSSIBLE TO DO.

LANG["TEAM_PROPS"]				= LANG["PHX_TEAM_PROPS"] 
LANG["TEAM_HUNTERS"]			= LANG["PHX_TEAM_HUNTERS"]

LANG["HUD_ROTLOCK"]				= "Prop Rotation: Bloqué"
LANG["HUD_ROTFREE"]				= "Prop Rotation: Libre"
LANG["HUD_KILLEDBY"]			= "Vous avez été tué par %s"

LANG["HUD_AUTOTAUNT"]			= "Auto Taunt dans %d seconde(s)"
LANG["HUD_AUTOTAUNT_ALT"]		= "Auto Taunt dans %d"

LANG["HUD_TargetID"]			= "Joueur: %s (%d%%)"

LANG["HUD_BLINDED"]				= "Les %s vont être libéré dans %s"
LANG["HUD_UNBLINDED"]			= "Prêt ou non, on arrive!"

LANG["BLIND_RESPAWN_TEAM"]		= "Vous avez réapparu uniquement sur l'équipe %s en %d secondes pendant le temps aveugle."
LANG["BLIND_RESPAWN"]			= "Vous avez réapparu en %d secondes pendant le temps aveugle."

LANG["MISC_ACCEPT"]				= "Accepté"
LANG["MISC_OK"]					= "OK"
LANG["MISC_CLOSE"]				= "Fermer"
LANG["MISC_PREV"]				= "< PRÉCÉDENT"
LANG["MISC_NEXT"]				= "SUIVANT >"
LANG["MISC_ACCESSDENIED"]		= "Accès refusé"

-- Chat messages
LANG["CHAT_NOPLAYERS"]			= "Il y a pas assez de joueurs pour commencer la partie !"
LANG["CHAT_SWAP"]				= "Les équipes ont été switchés!"

LANG["CHAT_SWAPTEAM_WARNING"]   = "Vous avez changé d'équipe %dx fois(%dx MAX). Vous ne pouvez plus changer d'équipe."
LANG["CHAT_SWAPTEAM_REVERT"]	= "Vous ne pouvez pas aller dans l'équipe %s car vous avez dépassé le nombre de changement d'équipe."

LANG["CHAT_PROP_NO_ROOM"] 		= "Il n'y a pas assez d'espace pour se transformer en l'objet choisi!"

-- Notification
LANG["NOTIFY_IN_PROP_TEAM"]		= "Vous êtes dans l'équipe Props ! Vous pouvez faire pivoter la rotation du props en déplaçant votre souris."
LANG["NOTIFY_ROTATE_NOTICE"]	= "De plus, vous pouvez activer / désactiver la rotation de verrouillage en appuyant (par défaut) sur la touche [R] !"

-- Custom Taunt Window
LANG["TM_WARNING_CT_DISABLE"]	= "[PHX - Taunts] Attention: Taunts personnalisés désactivé sur ce serveur."
LANG["TM_NO_TAUNTS"]			= "Attention: Pas de Taunts détectés dans cette catégorie."
LANG["TM_PLAY_ONLY_ALIVE"] 		= "Vous êtes autorisés a jouer les Taunts personnalisés lorsque vous êtes en vie."

LANG["TM_WINDOW_TITLE"]			= "Prop Hunt Taunts personnalisés"
LANG["TM_NOTICE_PLSWAIT"]		= "Veuillez ptienter pendant %s sec(s) avant la fin du Taunt aléatoire!"
LANG["TM_NOTICE_PLAYPREVIEW"]	= "Prévisualisation du Taunt : %s"

LANG["TM_TOOLTIP_PLAYTAUNT"] 	= "Jouer le Taunt"
LANG["TM_TOOLTIP_PREVIEW"]		= "Prévisualiser le Taunt"
LANG["TM_TOOLTIP_PLAYCLOSE"]	= "Jouer le Taunt et fermer"
LANG["TM_TOOLTIP_PLAYRANDOM"]	= "Jouer un Taunt aléatoire"
LANG["TM_TOOLTIP_CLOSE"]		= "Fermer"
LANG["TM_MENU_CLOSE"]			= "Fermer le Menu"

LANG["TM_DELAYTAUNT_NOT_EXIST"] = "Le Taunt sélectionné n'a pas été trouvé sur le serveur!"
LANG["TM_DELAYTAUNT_PLSWAIT"]	= "Veuillez patienter pendant %s seconde(s)!"

--[[
	PHX Menu window
]]
LANG["PHXM_WINDOW_TITLE"]		= "Prop Hunt X - Menu & Paramètres avancés"
LANG["SERVER_INFO_MOTD"]		= "RÈGLES ET INFORMATIONS DU SERVEUR [MOTD]"

LANG["PHXM_TAB_HELP"]			= "Aide"
LANG["PHXM_TAB_MUTE"]			= "Muter un Joueur"
LANG["PHXM_TAB_PLAYER"]			= "Paramètres du Joueur"
LANG["PHXM_TAB_MODEL"] 			= "Explorateur de Models"
LANG["PHXM_TAB_MODEL_DISABLED"]	= "Explorateur de Models (Désactivé)"
LANG["PHXM_TAB_ADMIN"]			= "Paramètres Administrateurs"
LANG["PHXM_TAB_ABOUT"]			= "A propos de PH:X"
LANG["PHXM_TAB_MAPVOTE"]		= "Paramètres pour Voter une Map"
LANG["PHXM_TAB_PLUGINS"]		= "Addons et Plugins"

LANG["PHXM_CVAR_CHANGED"]		= "[Paramètres] CVar %q a été changé par %q"

--[[
	Player Mute Settings
]]
LANG["PHXM_MUTE_SELECT"]		= "Sélectionner un Joueur que vous voulez rendre muet."

--[[ 
	Player Settings
]]
LANG["PHXM_PLAYER_OPTIONS"]		= "Options du Joueur"
LANG["PHXM_PLAYER_LANG"]		= "Langues"
LANG["PHXM_PLAYER_BIND"]		= "Binds"
LANG["PHXM_PLAYER_HUDSETTINGS"]	= "Paramètres du HUD"

LANG["PHXM_PLAYER_TAUNT_KEY"]			= "Touche pour Taunt aléatoire"
LANG["PHXM_PLAYER_TAUNTWINDOW_KEY"]		= "Touche du Menu Taunt"
LANG["PHXM_PLAYER_ROTATLOCK_KEY"]		= "Touche pour rotation des Props"

LANG["PHXM_PLAYER_TOGGLE_HALOS"]		= "Activer l'effet Halo quand vous choissisez un Prop"
LANG["PHXM_PLAYER_IDNAMES"]				= "Voir l'équipe du joueur au dessus de la tête (se voit a travers les murs)"
LANG["PHXM_PLAYER_ENDROUND_CUE"]		= "Jouer une musique en fin de manche"
LANG["PHXM_PLAYER_TAUNTMENU_AUTOCLOSE"]	= "Fermer le menu des Taunts automatiquement avec un double-clic"
LANG["PHXM_PLAYER_SEE_HUNTER_LINE"]		= "Afficher la ligne sur les Hunters pour observer ce qu'il regarde en mode spectateur" -- maybe too long ? 
LANG["PHXM_PLAYER_SEE_LBALL_ICONS"]		= "Activer l'icône 'Lucky ball'"
LANG["PHXM_PLAYER_SEE_CRYSTAL_ICONS"]	= "Activer l'icône 'Devil ball'"

LANG["PHXM_PLAYER_USE_NEW_HUD"]			= "Utiliser le nouveau HUD PH: X "
LANG["PHXM_PLAYER_SHOW_TUTOR"]			= "Tutoriel montré en Pop-up (Seulement 2 fois sur chaque spawn en Prop)"
LANG["PHXM_PLAYER_USE_NEW_CROSSHAIR"]	= "Activer le Crosshair personnalisé"
LANG["PHXM_PLAYER_SHOW_TEAM_TOPBAR"]	= "Afficher le nombre de joueurs en vie en haut à gauche (Au moins 4 joueurs seront affichés)"

--[[
	Player model Browser Section
]]
LANG["QUERY_MODEL_SELECTED"]	= "Modèle %s a été sélectionné et sera appliqué au prochain respawn"
LANG["QUERY_MODEL_INFO"]		= "Nom du modèle: %s - Disponible pour: Tout le monde"

LANG["MDL_MENU_REFRESH"] 		= "Rafraîchir les icônes"
LANG["MDL_MENU_PREVIEW"] 		= "Prévisualisation du Model"
LANG["MDL_MENU_MODELINFO"] 		= "Information du Model"


LANG["MISC_APPLYMDL"] 			= "Appliquer le Model"

LANG["PHXM_MODEL_DISABLED"] 	= "Désolé, Modèles de joueurs personnalisés désactivés sur ce serveur!"
LANG["PHXM_PLAYERMODEL_SETFOV"]	= "  Définir le FOV du Model"

--[[
	Server Settings
]]
LANG["PHXM_ADMIN_OPTIONS"]		= "Options du Gamemode côté Serveur (Uniquement visible pour les Admins)"
LANG["PHXM_ADMIN_MUSTALIVE"]	= "Vous devez être en vie pour effectuer cette opération."

--[[
	Language Override
]]
LANG["PHXM_ADMIN_LANGOVERRIDE"]	= "Remplacement de la Langue"

LANG["PHXM_ADMIN_FORCELANG"] 				= "Forcer une langue? Cela remplacera la langue du client pour utiliser la langue choisie par le serveur."
LANG["PHXM_ADMIN_LANGTOUSE"]				= "Language forcé a utiliser."
LANG["PHXM_ADMIN_PLAYERDEFAULTLANG"] 		= "Langue par défaut quand un joueur rejoint le serveur la première fois."

-- Gameplay settings
LANG["PHXM_ADMIN_CUSTOM_MODEL"]				= "Activer Models personnalisés pour les Hunters"
LANG["PHXM_ADMIN_CUSTOM_MODEL_PROP"]		= "Activer Models personnalisés pour les Props - Doit être activé pour les Hunters"
LANG["PHXM_ADMIN_TAUNT_DELAY_CUSTOM"]		= "Délai des Taunts personnalisés (Secondes)"
LANG["PHXM_ADMIN_TAUNT_DELAY_RANDOM"]		= "Délai des Taunts normaux (Secondes)"
LANG["PHXM_ADMIN_TAUNT_DELAY_AUTO"]			= "Délai des Taunts Automatiques (Secondes)"
LANG["PHXM_ADMIN_AUTOTAUNT_ENABLE"]			= "Activer les fonctions Auto Taunt (Le temps approprié sera fixé a la prochaine manche)"

LANG["PHXM_ADMIN_NOTICE_ROTATION"]			= "Afficher la notification 'Rotation des Props' a chaque spawn"
LANG["PHXM_ADMIN_CAMERA_COLLIDE"]			= "Activer la collision de la caméra sur les murs pour les Props"
LANG["PHXM_ADMIN_FREEZECAM"]				= "Activer la fonctionnalité 'Bloquer la Caméra' pour les Props"
LANG["PHXM_ADMIN_FREEZECAM_HUNTER"]			= "Activer la fonctionnalité 'Bloquer la Caméra' pour les Hunters"
LANG["PHXM_ADMIN_PROP_COLLIDE"]				= "Activer la collision des props entre les joueurs"
LANG["PHXM_ADMIN_SWAP_TEAM"] 				= "Switcher d'équipe à chaque manche"
LANG["PHXM_ADMIN_HUNTER_PENALTY"]			= "Pénalité des Hunters"
LANG["PHXM_ADMIN_HUNTER_KILL_BONUS"]		= "Bonus des Hunters pour chaque props tués"
LANG["PHXM_ADMIN_HUNTER_SMG_GRENADES"]		= "Nombre de Grenades du SMG pour les Hunters"
LANG["PHXM_ADMIN_GAME_TIME"]				= "(Redémmarage de la Map requis) Temps de jeu par Map (Minutes)"
LANG["PHXM_ADMIN_BLINDLOCK_TIME"]			= "Temps des Hunters bloqués au spawn (Secondes)"
LANG["PHXM_ADMIN_ROUND_TIME"]				= "(Redémarrage de la Map requis) Temps de jeu par manches (Seconds)"
LANG["PHXM_ADMIN_ROUNDS_PER_MAP"]			= "(Redémarrage de la Map requis) Nombres de manches par Map"
LANG["PHXM_ADMIN_ENABLE_LUCKYBALL"]			= "Faire apparaitre les Lucky Balls lorsqu'un Prop est cassé (8% de chance)"
LANG["PHXM_ADMIN_ENABLE_CRYSTAL"]			= "Faire apparaitre les Devil Balls quand un Hunter est mort (Toujours au spawn)"
LANG["PHXM_ADMIN_WAIT_PLAYERS"]				= "Attendre les joueurs pour que le jeu commence"
LANG["PHXM_ADMIN_WAIT_MIN_PLAYERS"]			= "Nombre de joueur minimum pour commencer la partie (par défaut: 1)"
LANG["PHXM_ENABLE_PLAYER_JOIN_LEAVE"] 		= "Activer la notification des joueurs qui se connectent? Mettez 0 si vous préférez un autre Addon personnalisé ."

LANG["PHXM_ADMIN_FORCEJOINBALANCE"]			= "Forcer les joueurs a prendre une équipe pour équilibrer la partie"
LANG["PHXM_ADMIN_ENABLETEAMBALANCE"]		= "Équilibrer les équipes à chaque fin de manche (Équilibrer les équipes)"
LANG["PHXM_ADMIN_PICKUP_PROPS"] 			= "Autoriser les joueurs à prendre les Props? 0: Non autorisé, 1: Uniquement les Hunters, 2: Uniquement les Props, 3: Autorisé pour les deux équipes."

LANG["PHXM_ADMIN_TAUNTMODES"]			= "Taunt Modes"
LANG["PHXM_ADMIN_TAUNTMODE_MODE"]		= "--[Le Mode des Taunts est sur : %d ]--"
LANG["PHXM_ADMIN_TAUNTMODE0"]			= "Mode [0]: F3/Taunt aléatoire"
LANG["PHXM_ADMIN_TAUNTMODE1"]			= "Mode [1]: C/Taunt personnalisé"
LANG["PHXM_ADMIN_TAUNTMODE2"]			= "Mode [2]: Les deux"
LANG["PHXM_ADMIN_TAUNTSOPEN"]			= "Ouvrir la fenêtre des Taunts"

LANG["PHXM_MODE_DEFAULT"] 				= "--[ Le Mode pour prendre les props est sur : %d ]--"
LANG["PHXM_MODE0"]						= "Mode [0]: Non autorisé"
LANG["PHXM_MODE1"]						= "Mode [1]: Uniquement les Hunters"
LANG["PHXM_MODE2"]						= "Mode [2]: Uniquement les Props"
LANG["PHXM_MODE3"]						= "Mode [3]: Autorisé pour les deux équipes"

--[[
	Admin Developer Sections
]]
LANG["PHXM_ADMIN_DEVSECTION"]		= "Options développeurs/expérimentés "
LANG["PHXM_ADMIN_ROOMCHECK"]		= "Activer la vérification des limites? Prévient lorsque vous risquez de rester coincé dans les murs."
LANG["PHXM_ADMIN_USENEWMKBREN"]		= "Utiliser le nouveau modèle de l'arme bonus Bren MK II (Redémarrage de la Map requis)"
LANG["PHXM_ADMIN_BEVERBOSE"]		= "Développeur: Détails - Activer PH:X pour imprimer toutes les informations et tous les événements de manière détaillée?"
LANG["PHXM_ADMIN_SHOWPLNAMEHEAD"]	= "Activer l’affichage des noms d’équipe des joueurs sur leur écran."
LANG["PHXM_ADMIN_USESINGLE_FZCAM"]	= "Utilisez un seul son pour la Freeze Cam au lieu d’une liste de sons (utilisez 'ph_fc_cue_path' pour déterminer le chemin sonore Freezecam)"
LANG["PHXM_ADMIN_MODELLISTINGTYPE"] = "Utiliser la liste des Models hérités : 0: Tout les PlayerModels, 1: Hérité par: list.Get('PlayerOptionsModel')"
LANG["PHXM_ADMIN_JUMPPOWER"]		= "Puissance de saut additionnel pour les Props"
LANG["PHXM_ADMIN_ENABLE_OBB"]		= "Développeur: Activer le modificateur OBB (Prop Entities Model Boundaries) personnalisé à partir des données de configuration"
LANG["PHXM_ADMIN_RELOAD_OBB"]		= "Développeur: Recharger les données du modificateur OBB à chaque redémarrage de la manche"

--[[
	Experimental & PH:X Features
]]
LANG["PHXM_ADMIN_EXPERIMENTALPHX"]			= "Section PHX Expérimenté"

LANG["PHXM_ADMIN_HLA_COMBINE"]				= "Ajouter le support du Model HL: Alyx Combine"
LANG["PHXM_ADMIN_TEAMBALANCE"]				= "Paramètre des équilibrages d'équipes"
LANG["PHXM_ADMIN_CHANGETEAM_LIMIT"]			= "Limiteur de changement d'équipe. Mettre -1 pour désactiver. "
LANG["PHXM_ADMIN_USENEWCHAT"]				= "Utiliser le nouveau Chat Box (eChat) - Il s’agit d’un remplacement temporaire. Si vous en avez déjà un, laissez-le décoché."
LANG["PHXM_ADMIN_NEWCHATPOS"]				= "Position du nouveau Chat Box: Sous-Hauteur (Y) Position par N pixels."
LANG["PHXM_ADMIN_RESPAWNONBLIND"]			= "Autoriser à rejoindre pendant le blocage des Hunters"
LANG["PHXM_ADMIN_RESPAWNONBLIND_TEAM"]		= "Autoriser à rejoindre pendant le blocage sur une équipe spécifique: 0: Les deux, 1: Hunters, 2: Props"
LANG["PHXM_ADMIN_REWSPANTIMEPERCENT"]		= "Pourcentage du temps de blocage pour rejoindre. 0.75 par défaut (75% * signifie Temps de blocage maximum)"
LANG["PHXM_ADMIN_ALLOWRESPAWN_SPECTATOR"]	= "Autoriser à rejoindre pendant le blocage quand vous êtes assigné en spectateur"
LANG["PHXM_ADMIN_ALLOWRESPAWN_TEAMCHANGE"]	= "Autoriser à rejoindre pendant le blocage quand vous êtes assigné dans l'équipe opposée (L'activer n'est pas recommandé)"

--[[
	MapVote Settings
]]
LANG["PHXM_MV_SETTINGS"]			= "Paramètres pour Voter une Map"

LANG["PHXM_MV_ALLOWCURMAP"]			= "Autoriser la map actuelle a être voté."
LANG["PHXM_MV_COOLDOWN"]			= "Autoriser a voter pendant la map actuelle."
LANG["PHXM_MV_USE_ULX_VOTEMAPS"]	= "Utiliser la liste des maps depuis ULX Mapvote? Si Non, les maps/*.bsp seront utilisés par défaut."
LANG["PHXM_MV_MAPLIMIT"]			= "Nombre de maps affichés pendant le vote de la Map."
LANG["PHXM_MV_TIMELIMIT"]			= "Temps en secondes par défaut pour voter une Map."
LANG["PHXM_MV_MAPBEFOREREVOTE"]		= "Nombre de Maps passé pour revoter une ancienne Map"
LANG["PHXM_MV_RTVCOUNT"]			= "Nombre de joueurs requis pour la commande RTV (Rock the Vote)"

LANG["PHXM_MV_EXPLANATION1"]		= "Pour paramétrer le préfixe des maps, faites (par exemple) [ mv_map_prefix 'phx_,ph_,cs_,de_' ] dans la console."
LANG["PHXM_MV_EXPLANATION2"]		= "Si vous utilisez ULX, faites map_vote. Si vous ne pouvez pas, faites mv_start."
LANG["PHXM_MV_EXPLANATION3"]		= "Action VoteMap (Pour annuler, faites simplement !unmap_vote (ULX) ou mv_stop dans la console.)"

LANG["PHXM_MV_START"]		= "Commencer le vote de la Map"
LANG["PHXM_MV_STOP"]		= "Stopper le vote de la Map"
--                  			  ^VOUS AVEZ VIOLÉ LA LOI!

--[[ 
	Versioning, Credits or About section
]]
LANG["PHXM_ABOUT_VERSIONING"]		= "Version: %s - Revision: %s"
LANG["PHXM_ABOUT_AUTHOR"]			= "Par: %s"
LANG["PHXM_ABOUT_ENJOYING"]			= "Si vous aimez ce mode de jeu, faites un don!"
LANG["PHXM_ABOUT_UPDATE"]			= "Prop Hunt X Mises à jour"

LANG["PHXM_VIEW_UPDATE_INFO"]		= "Voir les infos de la Mise à jour"
LANG["PHXM_CHECK_FOR_UPDATES"]		= "Vérifier les Mises à jour"
LANG["PHXM_UPDATE_FOUND_TEXT"]		= "Vérification des Mises à jour efféctuées. Regarder la console pour plus d'informations.\n\nSouhaitez-vous voir les nouvelles Mises à jour?"
LANG["PHXM_UPDATE_FOUND_TITLE"]   	= "Information de la Mise à jour"
LANG["PHXM_UPDATE_FOUND_BUTTON"]   	= "Voir les informations"

LANG["UPDATE_NOTIFY_MSG_NOTFOUND"]	= "Aucune Mise à jour a été trouvée. Cliquez sur le bouton 'Vérifier les Mises à jour'"
LANG["UPDATE_NOTIFY_MSG_TITLE"]		= "Aucune Mise à jour trouvée"
LANG["UPDATE_NOTIFY_WINDOW_TITLE"]	= "Avis de Mise à jour"
LANG["UPDATE_RTBOX_APPEND"]			= "\n\nPour votre information:\nVous utilisez la Version: %s et la Révision: %s"
LANG["UPDATE_BTN_SEEFULL"]			= "Voir tout les changements"

LANG["PHXM_ABOUT_LINKS"]			= "Liens et Crédits"
LANG["PHXM_ABOUT_THANKS"]			= "Un grand merci à eux pour les supports, les suggestions et les contributeurs:\n %s"
LANG["PHXM_ABOUT_BTN_DONATE"]		= "Support PH:X par donation"
LANG["PHXM_ABOUT_BTN_HOME"]			= "PHX Accueil"
LANG["PHXM_ABOUT_BTN_GITHUB"]		= "PHX Répertoire GitHub"
LANG["PHXM_ABOUT_BTN_PLUGINS"]		= "PHX Addons/Plugins"
LANG["PHXM_ABOUT_BTN_CHANGELOGS"]	= "PHX Changements"

-- fretta
LANG["HUD_SPECTATING"]	= "SPECTATEUR"
LANG["HUD_YOUDIED"]		= "VOUS ÊTES MORT!"

LANG["CHAT_STARTING_MAPVOTE"] = "Fin de la partie, changement de la Map..."

-- This used for HUD Taunt Timer
LANG["HUD_PROP_TAUNT_TIME"]	= "Taunt aléatoire"
LANG["HUD_PROP_CTAUNT_TIME"] = "Taunt Pers."

-- Plugins Section
LANG["PLUGINS_NO_PLUGINS"]				= "Aucun plugins installés! Trouvez vos plugins ICI"
LANG["PLUGINS_BROWSE_MORE"]				= "Trouvez PLUS de plugins"
LANG["PLUGINS_SERVER_HAS_NO_PLUGINS"]	= "Désolé, ce serveur n'a pas d'addons/plugins personnalisés d'installés."
LANG["PLUGINS_SERVER_SETTINGS"]			= "-- Paramètres Serveur --"
LANG["PLUGINS_CLIENT_SETTINGS"]			= "-- Paramètres Client --"

-- Text Entries
LANG["TEXTENTRY_FZ_SINGLE"] = "Chemin d'accès du son FreezeCam"
LANG["TEXTENTRY_MV_PREFIX"] = "Préfixe des maps pour le Vote de la Map"

LANG["MISC_GAME_ENDED"]		= "Le jeu est terminé."

--============= LATE ADDITION OF 16.09.21/X2Z. =============--

--[[
	Credits: Late Addition: Revision: 16.09.21/X2Z
]]

LANG["PHXM_ABOUT_BTN_WIKI"]			= "PHX Wiki & Instructions"

--[[
	Auto Taunt: Late Addition: Revision: 16.09.21/X2Z
]]

LANG["HUD_AUTOTAUNT_DISABLED"]		= 	"Auto Taunt est désactivé."
LANG["HUD_AUTOTAUNT_WAITFORUPDATE"]	=	"Auto Taunt est entrain de synchroniser..."

--[[
	MapVote: Late Addition: Revision: 16.09.21/X2Z
]]
LANG["PHXM_MV_VOTEROCKED"]				= "Le vote est terminé, le vote sera effectif à la fin de la manche"
LANG["PHXM_MV_VOTEROCKED_IMMINENT"]		= "Le vote est terminé, changement de Map imminent!"
LANG["PHXM_MV_VOTEROCKED_PLY_TOTAL"]	= "%s a utilisé la commande Rock the Vote. ( %d / %d )"

LANG["PHXM_MV_MUST_WAIT"]				= "Patienter un peu avant de voter!"
LANG["PHXM_MV_VOTEINPROG"]				= "Un vote est actuellement en cours!"
LANG["PHXM_MV_HAS_VOTED"]				= "Vous avez déja efféctué la commande Rock The Vote!"
LANG["PHXM_MV_ALR_IN_VOTE"]				= "Il y à eu déja un vote, la Map va changer!"
LANG["PHXM_MV_NEED_MORE_PLY"]			= "Il vous faut plus de joueurs pour utiliser la commande Rock The Vote!"

--[[
	Late Addition: Revision: 16.09.21/X2Z
]]
LANG["PROP_PLAYERMDL_BANNED"]	= "Votre Model personnalisé a été banni du serveur."

--[[
	Prop Menu/Prop Chooser, Revision: 16.09.21/X2Z
]]

LANG["PCR_USAGE_UNLIMIT"]		= "[Prop Menu] Il vous reste une utilisation **ILLIMITÉ**"
LANG["PCR_USAGE_COUNT"]			= "[Prop Menu] Il vous reste %d utilisation possible!"
LANG["PCR_PLS_WAIT"]			= "[Prop Menu] Veuillez patientez pendant %d secondes."
LANG["PCR_NOROOM"]				= "[Prop Menu] Il y a pas assez de place pour devenir ce Prop choisi!"
LANG["PCR_PROPBANNED"]			= "[Prop Menu] Ce prop a été banni du serveur."
LANG["PCR_PROPBANNED_BYPCR"]	= "[Prop Menu] Vous ne pouvez pas utiliser ce Prop car il a été banni du Prop Menu."
LANG["PCR_REACHED_LIMIT"]		= "[Prop Menu] Vous avez dépassé la limite du Prop Menu!"
LANG["PCR_STAY_ON_GROUND"]		= "[Prop Menu] Vous devez être debout au sol mais pas accroupi!"
LANG["PCR_ONLY_GROUP"]			= "[Prop Menu] Certains groupes uniquement peuvent ouvrir ce menu!"
LANG["PCR_NOT_EXIST_COUNT"]		= "Le prop que vous avez choisi n'existe pas sur la Map! ( %s / 4 )"
LANG["PCR_NOT_EXIST"]			= "Le prop que vous avez choisi n'existe pas sur la Map!"

-- PCR Client section, reason why there is a space because of chat.AddText between args.
LANG["PCR_NOTIFY_1"]			= " Ce serveur utilise le Prop Menu version %s! "
LANG["PCR_NOTIFY_2"]			= " Dans la console ou F1 -> [Aide PropChooser] menu."
LANG["PCR_CL_DISABLED"]			= " Cette fonction est désactivé."
LANG["PCR_CL_GROUP"]			= " Certains groupes uniquement peuvent ouvrir ce menu!"
LANG["PCR_CL_LIMIT"]			= " Vous avez dépassé la limite!"

LANG["PCR_UNLIMIT_TEXT"]		= "Illimité"
LANG["PCR_WINDOW_TITLE"]		= "PH:X Prop Menu"
LANG["PCR_HEADER_TOP"]			= "Sélectionner le Prop que vous souhaitez."
LANG["PCR_HEADER_MID"]			= "Nombre d'utilisation maximum: %s"
LANG["PCR_HEADER_BOTTOM"]		= "pour utiliser le Prop Chooser!"
LANG["PCR_CL_TOOLTIP_BANNED"]	= "Ce Prop a été banni."
LANG["PCR_CL_TOOLTIP_MODEL"]	= "Modèle: %s"
LANG["PCR_CL_MENU_NOTREADY"]	= "Cette fonction n'est pas disponible pour le moment."
LANG["PCR_WINDOW_GUIDE_TTL"]	= "Guide Rapide: Prop Menu 101"
LANG["PCR_BTN_HELP_MENU"]		= "Aide Prop Menu"

LANG["PCR_CL_CMDUSEULX"]		= " Cette commande est désactivé. Utiliser plutôt 'ulx propmenu' !"
LANG["PCR_CMD_ULX_DISABLED"]	= "Commande ULX désactivé. Appuyez sur votre [Touche Prop Menu] pour ouvrir."

LANG["PCR_EDT_IN_USE"]			= "Un Admin est entrain d'éditer les données des props, Veuillez patienter..."
LANG["PCR_EDT_ERROR_DISABLED"]	= "[Prop Menu] Erreur: Custom Prop Addition est désactivé!"
LANG["PCR_EDT_NO_RIGHTS"]		= "Vous n'avez aucun droit pour accéder a cette fonctionnalité."

--[[
	Admin Section, Revision: 16.09.21/X2Z
]]
LANG["PHXM_PLAYER_PROP_CHOOSER_KEY"]	= "Touche par défaut pour ouvrir le Prop Menu (Prop Chooser)."
LANG["PHXM_PROP_FREEZE_MIDAIR"]			= "Touche par défaut pour activer le blocage de son prop dans les airs."
LANG["PHXM_ADMIN_TAUNT_SCANNER"]		= "(Redémarrage de la Map requis) Activer le scanner de Taunts?"
LANG["PHXM_ADMLBL_USABLE_ENTS"]			= "Type d'entités de Props"
LANG["PHXM_ADMLBL_USABLE_ENTS_REF"]		= "Les types différents sont: 1: Physics Only, 2: Physics & Dynamics, 3: Almost Anything inc. Ragdolls, 4: Custom Entities."
LANG["PHXM_ADMIN_USABLE_ENT_TYPE"]		= "Type d'entités utilisables que les Props peuvent répliquer"
LANG["PHXM_ADMIN_NOTIFY_ENT_TYPE"]		= "Afficher une notification des entités non réplicables [Touche E]. Fonctionne seulement si 'ph_usable_prop_type' est mis sur 3 ou 4."
LANG["NOTIFY_PROP_ENTTYPE"]				= "Appuyez sur [E] pour intéragir, [Click] pour répliquer le Prop choisi."
LANG["NOTIFY_CUST_ENT_TYPE_IS_ON"]		= "[PHX] Info: Appuyez sur [E] pour intéragir, [Click] pour répliquer le Prop choisi."

--[[
	Custom Taunts, Revision: 16.09.21/X2Z
]]
LANG["TM_TAUNTS_SEARCH_NOTHING"]		= "Le Taunt recherché : '%s' n'a pas été trouvé..."
LANG["TM_SEARCH_PLACEHOLDER"]			= "Chercher dans la catégorie: Entrer un mot, en minuscule sans caractères spéciaux. Vide=Tout afficher."
LANG["PHXM_MSG_INPUT_IS_EMPTY"]			= "Le texte est vide ou vous avez pas appuyé sur la touche ENTRÉE."

--============= LATE ADDITION OF 10.06.2022/X2Z. =============--

--goto line: @132
LANG["MISC_SET"]						= "Définir"
LANG["MISC_APPLY"]						= "Appliquer"
LANG["MISC_NO"]							= "Non"
LANG["MISC_YES"]						= "Oui"
LANG["MISC_WARN"]						= "Attention"
LANG["MISC_ERROR"]						= "Erreur"
LANG["MISC_INFO"]						= "Information"
LANG["MISC_NOTICE"]						= "Note"
LANG["MISC_IDK"]						= "Inconnu"
LANG["MISC_NA"]							= "N/A"

-- HUD
LANG["HUD_DECOY_ACTIVE"]                = "Appuyez [%s]"
LANG["HUD_FAKETAUNT_COUNT"]             = "%ix Restant"
LANG["HUD_FAKETAUNT_UNLI"]              = "Illimité"
LANG["NOTICE_GRENADE_SMG_GIVEN"]        = "Vous avez obtenu des Grenades SMG."

--[[
	ADMIN PANEL, Revision 10.06/2022/X2Z
]]--
LANG["PHXM_TAUNT_SETTINGS"]				= "Paramètres des Taunts"
LANG["PHXM_GENERAL_SETTINGS"]			= "Paramètres Généraux"
LANG["PHXM_FAKE_TAUNT_SETTINGS"]		= "Paramètres des Faux Taunts"
LANG["PHXM_FAKE_TAUNT_ENABLE"]			= "Autoriser à jouer de faux Taunts aléatoires sur la Map. Accesible uniquement dans le menu des Taunts personnalisés."
LANG["PHXM_FAKE_TAUNT_MAXUSAGE"]		= "Utilisation maximum des faux Taunts; -1 est illimité."
LANG["PHXM_TAUNT_RIGHT_CLICK"]		    = "Clic droit pour Taunt. Ceci désactive le menu quand vous faites un clic droit!"

LANG["PHXM_TAUNT_PITCH_SETTINGS"]		= "Paramètre du pitch des Taunts"
LANG["PHXM_TAUNT_PITCH_ENABLE"]			= "Activer le pitch des Taunts"
LANG["PHXM_TAUNT_PITCH_RANGE_MIN"]		= "Seuil minimum du pitch acceptable pour un Taunt. 1 to 99."
LANG["PHXM_TAUNT_PITCH_RANGE_MAX"]		= "Seuil maximum du pitch acceptable pour un Taunt. 100 to 255."

LANG["PHXM_DECOY_SETTINGS"]				= "Paramètres des Decoys"
LANG["PHXM_DECOY_ENABLE"]				= "Activer récompenses des Decoys? La récompense ne sera donnée QU’UNE SEULE FOIS pour les Props vivants jusqu’à la fin de la manche."

LANG["PHXM_DISABLE_FOOTSTEP"]           = "Activer les bruits de pas silencieux pour les Props"

LANG["PHXM_ADMIN_CHATSETTING"]			= "Paramètres de la fenêtre de Chat"
LANG["PHXM_ADMIN_HUNTERBLIND"]			= "Contrôle du blocage des Hunters"

LANG["PHXM_ADMIN_GIVEGRENADE_NEAREND"]  = "Combien de grenades donnés par manche? Si Oui, voir 'ph_give_grenade_roundend_before_time'"
LANG["PHXM_ADMIN_GIVEGRENADE_TIME"]     = "Temps en secondes pour donner les grenades avant la fin de la manche. Situé en général entre 10 et 30 secondes."

--[[
	Plugins in sh_init.lua, Revision 10.06/2022/X2Z
]]--
LANG["PLUG_NAME_VER"]					= "Plugin: %s | v.%s"
LANG["PLUG_DESCRIPTION"]				= "Description: %s"

--[[
	Taunt Pitch, Revision 10.06/2022/X2Z
]]--
LANG["PHX_CTAUNT_USE_PITCH"]			= "Utiliser le pitch pour les Taunts personnalisés"
LANG["PHX_CTAUNT_RANDOM_PITCH"]			= "Pitch aléatoire lorsqu'un Taunt est joué"
LANG["PHX_RTAUNT_USE_PITCH"]			= "Utiliser le pitch pour les Taunts personnalisés [%s]"
LANG["PHX_RTAUNT_RANDOMIZE"]			= "Pitch aléatoire lorsqu'un Taunt aléatoire est joué [%s]"
LANG["PHX_CTAUNT_PITCH_FOR_FAKE"]		= "Utiliser le pitch pour les faux Taunts"
LANG["PHX_CTAUNT_RANDPITCH_FOR_FAKE"]	= "Pitch aléatoire lorsqu'un faux Taunt est joué"
LANG["PHX_CTAUNT_SLIDER_PITCH"]			= "Slider du pitch des Taunts."
LANG["TM_TOOLTIP_FAKETAUNT"]			= "Jouer un faux Taunt sur un Prop aléatoire"
LANG["TM_PREFERRED_PITCH"]              = "Niveau de pitch des Taunts préférés"

--[[
	Fake Taunt, Revision 10.06/2022/X2Z
	Description: Play fake taunts on random props in the map (Not Players)
]]--
LANG["PHX_CTAUNT_ON_RAND_PROPS"]		= "Jouez des faux Taunts sur des Props aléatoires (%ix)"
LANG["PHX_CTAUNT_ON_RAND_PROPS_UNLI"]	= "Jouez des faux Taunts sur des Props aléatoires"
LANG["PHX_CTAUNT_PLAYED_ON_RANDPROP"]	= "Vous avez utilisé un Taunt sur un Prop aléatoire."
LANG["PHX_CTAUNT_RAND_PROPS_LIMIT"]		= "Vous avez dépassé la limite!"
LANG["PHX_CTAUNT_RAND_PROPS_NOT_PROP"]  = "Non disponible pour le moment."
LANG["PHX_CTAUNT_RANDPROP_DISABLED"]	= "Les Faux Taunts sont actuellement désactivé."

--[[
	PH:Z Simple Decoy, Revision 10.06/2022/X2Z
]]--
LANG.DECOY_PROP	= {
	"a tué un joli leurre!",
	"s'est senti en regret après avoir tué un leurre.",
	"a tué un leurre.",
	"a tué un leurre innocent.",
	"s'est senti triste après avoir tué un leurre."
}

LANG["DECOY_PUT_SUCC"]					= "Leurre posé avec succès"
LANG["DECOY_CANT_PUT_HERE"]				= "Impossible de poser un leurre ici."
LANG["DECOY_GET_REWARD"]				= "Bravo! Vous avez reçu un ['Leurre'] pour avoir survécu pendant cette manche!"
LANG["DECOY_REMINDER_GET"]              = "Vous avez un leurre! Placez le pour porter à confusion les Hunters"
LANG["DECOY_FRAGS_RECEIVED"]			= "Leurre appâté avec succès: Vous avez volé 1 score de %s!"
LANG["DECOY_DISABLED"]					= "Leurre non disponible pour le moment."
LANG["PHXM_CL_DECOY_KEYBIND"]			= "Touche par défaut pour déposer un leurre. 1 (&) par défaut (au dessus du A)."

LANG["DECOY_INDICATOR_INVALID"]         = "Position Invalide!"
LANG["DECOY_INDICATOR_TOOFAR"]          = "Portée trop loin!"
LANG["DECOY_INDICATOR_OK"]              = "Poser le leurre [Appuyez %s]"

LANG["PHXM_DECOY_HEALTH"]				= "Combien de points de vie pour un leurre. 10 par défaut."
LANG["PHXM_PLAYER_SHOW_DECOY_HELPER"]   = "Montrer/Cacher l'aide au placement des leurres? Cela vous montrera un point blanc dans votre crosshair avec un texte."
LANG["PHXM_PLAYER_SHOW_DECOY_MARKER"]   = "Montrer/Cacher le marqueur des leurres?"

--[[
	Revision 10.06/2022/X2Z
    Prop Menu Update: Menu, Editor, Browser
]]--
LANG["PCR_MODEL_DONT_EXISTS"]   = "Désolé,ce Model n'est pas disponible pour le moment."

LANG["PCR_PLUG_WARN_MSG"]		= "Attenetion: Custom Prop Addition (pcr_allow_custom) est mis sur 0.\nVous devez activer cette fonctionnalité en premier pour éditer vos propres Props!\nUn changement de map est requis pour appliquer la fonctionnalité."
LANG["PCR_PLUG_LBL_BINDKEY"]	= "Pour changer le bin de la touche, basculer sur l'onglet TAB."
LANG["PCR_PLUG_LBL_EDITOR"]		= "Éditeur de Props"
LANG["PCR_PLUG_BTN_OPEN_EDT"]	= "Ouvrir l'éditeur"
LANG["PCR_PLUG_LBL_COMSET"]		= "Parmètres courants"
LANG["PCR_PLUG_LBL_TECHSET"]	= "Paramètres techniques"
LANG["PCR_PLUG_LBL_EXPSET"]		= "Paramètres expérimentés"
LANG["PCR_PLUG_LBL_PLAYERSET"]	= "Paramètres du joueur"

LANG["PCR_PLUG_ENABLE"]			= "Activer la fonction 'Prop Menu'"
LANG["PCR_PLUG_ALLOW_CUSTOM"]	= "(Redémarrage de la Map requis) Autoriser les Props personnalisés dans la liste?"
LANG["PCR_PLUG_PROP_BAN"]		= "(Redémarrage de la Map requis) Ne pas inclure les Props bannis dans la liste?"
LANG["PCR_PLUG_USAGE_LIMIT"]	= "Utilisation maximum du Prop Menu par joueur. -1 signifie Illimité."
LANG["PCR_PLUG_PROP_LIMIT"]		= "(Redémarrage de la Map requis) Limite autorisé dans la liste Prop Menu"
LANG["PCR_PLUG_PROP_LIMITMAX"]	= "Maximum de Props possible a ajouter dans la liste. Note: Cela sera rajouté au hasard!"
LANG["PCR_PLUG_USE_ULXMENU"]	= "Le Prop Menu est-il accesible par la Console (0) ou ULX (1)?"
LANG["PCR_PLUG_USE_DELAY"]		= "Délai en secondes pour utiliser un autre Prop de la liste "
LANG["PCR_PLUG_KICK_INVALID"]	= "Kick un joueur qui tente de prendre un Prop invalide (Maximum 4 fois)"
LANG["PCR_PLUG_SPACE_CHECK"]	= "Vérifier l'espace possible d'un joueur avant de choisir un Prop avant de rester bloqué"
LANG["PCR_PLUG_X_BBOX"]			= "(Redémarrage de la Map requis) Vérifier la limite BBox  de l'entité avant de l'ajouter dans la liste"
LANG["PCR_PLUG_X_BBOX_MAX"]		= "BBox CollisionBound Taille limite maximale. Auto-calculé en général."
LANG["PCR_PLUG_X_BBOX_MIN"]		= "BBox CollisionBound Largeur limite maximale. Auto-calculé en général."
LANG["PCR_PLUG_ONLY_GROUPS"]	= "Le Prop Menu est-il accesible uniquement par certains groupes? Exemple : Donateur, Admin, VIP?"
LANG["PCR_PLUG_NOTIFYMSG"]		= "Notifier le joueur pour expliquer comment utiliser le Prop Menu à chaque début de manche"

LANG["PCR_EDITOR_MSG_ERROR"]	= "Vos changements n'ont pas été sauvegardés dû au erreurs.\nRegarder la console du serveur!"
LANG["PCR_EDITOR_MSG_SUCC"]		= "Vos changements et vos données des Props personnalisés ont été sauvegardés avec succès."

LANG["PHZ_generic_title"]		= "Éditeur de Props"
LANG["PHZ_generic_helptext"]	= [[[Comment l'utiliser:
[LEFT PANEL]
← Choisir le répertoire du jeu
← Cliquer sur les icônes pour ajouter les modèles à votre droite
← Clic droit pour ouvrir le menu contexte
[RIGHT PANEL]
→ Cliquez pour 'marquer' tous les props avant de supprimer
→ Cliquez 'Remove Selected' pour retirer un prop
→ Cliquez 'Apply Selection' pour appliquer les changements
[INFO]
- Vous pouvez ajouter jusqu'a 2048 entrées.
- Tout les props d'une map sont ajoutés automatiquement, pas besoin de le faire.
- Appuyez sur le bouton [CLOSE] pour fermer le menu.
- Tout les props et modèles n'ont pas une VPhysics valide.
- Pas tous les joueurs (inc. Votre serveur) aura des modèles personnalisés. S’ils n’existent pas, ils seront supprimés après l’application des sélections.
- Le contenu de votre serveur peut être différent de vous. Si vous voyez '<game> [Not Mounted]' dans le menu déroulant, cela signifie que vous n’avez pas monté/installé le jeu.
- La navigation dans les dossiers addon n’est pas encore implémentée, vous devrez donc utiliser 'All Contents' à la place.
]]
LANG["PHZ_generic_mdlinfo"] = [[Model Info:
%s
Has Physics: %s]]
LANG["PHZ_generic_mdlinfoStart"] = "(Sélectionner d'abord un modèle!)"

LANG["PHZ_generic_no_ragdoll"]	= "No: Ragdoll"
LANG["PHZ_generic_titlelabel"]	= "%s Prévisualisation :"

LANG["PHZ_mount_game_sel"]		= "Sélectionner le jeu monté (Par défaut: Garry's Mod)"
LANG["PHZ_input_placeholder1"]	= "Recherche de Dossiers: <folder name> ou '*', laisser vide pour tout voir."
LANG["PHZ_input_placeholder2"]  = "Recherche d'Addons: <name> ou '*', laisser vide pour tout voir."
LANG["PHZ_msg_warn_close"]		= "Voulez vous vraiment fermer cette fênetre? Any unsaved edits will be lost!"
LANG["PHZ_msg_commit"] 			= "Voulez vous vraiment appliquer ces changements?"
LANG["PHZ_msg_cant_empty"]		= "La liste des Props ne peux être vide!"
LANG["PHZ_msg_removesel"] 		= [[Retrait des Props sélectionnés de la liste. Légendes:
Rouge = Sélections marquées
Jaune: Props non existant sur le serveur ET seront retirés.]]
LANG["PHZ_msg_warn_mdlinlist"]  = "ATTENTION: Ce modèle est déja dans la liste!"
LANG["PHZ_msg_invalid_mdl"] 	= "Raison : Modèle invalide"
LANG["PHZ_apply_select"] 		= "Appliquer les sélections"
LANG["PHZ_menu_copy"] 		= "Copier le Modèle"
LANG["PHZ_menu_refresh"] 	= "Rafraichir le Modèle"
LANG["PHZ_tooltip_removesel"]	= "Supprimer la sélection"
LANG["PHZ_tooltip_wasmarked"] = [[Ce modèle a été marqué car il n'existe pas sur le serveur.
Si vous fermez l'éditeur, il sera retiré automatiquement.]]

LANG["PHZ_pcr_fb_allcontent"] = "Tout le contenu (Tout les Serveurs/Joueurs n'ont pas le même contenu que vous)"
LANG["PHZ_pcr_fb_notmounted"] = "%s [!N'est pas monté]"

-- Revision 25-27/08/2022
LANG["PHX_ADMIN_ACCESS_ONLY"]		= "Access Denied: only Admins can do that, %s !"
LANG["PHX_PROP_TOO_THIN"]           = "Cannot Replicate: Prop is too thin!"
LANG["PHX_PROP_IS_BANNED"]			= "The prop you're trying to use is banned from server!"
LANG["PHX_SPECT_JOINGAME"]			= "To join the game, Press [F2] then select a team to join."
LANG["PHX_TEAM_IS_FULL"]			= "That team is full!"
LANG["FORCE_JOIN_TEAM_IS_DISABLED"]	= "Even-out Team Balance is disabled (Team Shuffle/Rotation is Enabled)"

LANG["PHX_TM_MNBAR_OPTIONS"]		= "Options"
LANG["PHX_TM_MNBAR_SAVEFAV"]		= "Save Favorites"
LANG["PHX_TM_MNBAR_LOADFAV"]		= "Reload Favorites"
LANG["PHX_TM_MNBAR_SETTINGS"]		= "Others"
LANG["PHX_TM_MNBAR_RESET"]			= "Reset Favorites"

LANG["PHX_TM_WARN_CLEARFAV"]		= "WARNING: This will CLEAR ALL your previously saved Favorite Taunts. Are you sure you want to continue?"

LANG["PHXM_BANNED_MODELS"]			= "Dis/Allow the use of Restricted Models (Banned Models). This does not include from Prohibitted Models (They're always deleted)."
LANG["PHXM_ADMIN_ALLOWARMOR"]       = "Allow Armor Addition for team Hunters and Props"
LANG["PHXM_ADMIN_ALLOW3P"]          = "Allow thirdperson mode for Hunters"
LANG["PHXM_ADMIN_ALLOW3P_SVDESIRED"]= "Allow thirdperson mode to use Server's Desired Camera position (Disallow player custom position)"
LANG["PHXM_ADMIN_ALLOW3P_DIST"]     = "Thirdperson: Desired Camera Distance"
LANG["PHXM_ADMIN_ALLOW3P_RIGHT"]    = "Thirdperson: Desired Camera Right Position"
LANG["PHXM_ADMIN_ALLOW3P_UP"]     	= "Thirdperson: Desired Camera Up Position"
LANG["PHXM_ADMIN_JUMPPOWER_H"]		= "Additional Jump Power multiplier for Hunters"
LANG["PHXM_ADMIN_MDLCOLOR_PROP"]	= "Enable Player Color for team Props (Require Hunter Custom Models to be enabled)"
LANG["PHXM_ADMIN_MDLCOLOR_HUNTER"]	= "Enable Player Color for team Hunters (Require Hunter Custom Models to be enabled)"
LANG["PHXM_ADMIN_PITCH_ROTATION"]	= "[Experimental] Allow to use pitch rotation for props. This may be buggy."
LANG["PHXM_ADMIN_FALLDMG"]			= "Enable Fall Damage (Applies on All Teams)"
LANG["PHXM_ADMIN_FALLDMG_REAL"]		= "Enable 'Realistic' Fall Damage"
LANG["PHXM_INFORM_TO_JOIN"]			= "Inform Unassigned/Spectators with static text advice to join the game."
LANG["PHXM_ADMIN_PROPOFFSET"]		= "Substract/Add Prop View Offset Height using multiplier. Min: 0.6, Max: 1.2. Default: 0.8."
LANG["PHXM_ADMIN_REPL_MUST_STAND"]	= "[Experimental] Restrict props replication only when they're standing. Disable this to allow replicating when ducking or jumping."

LANG["PHXM_DROP_VBS_DISABLE"]       = "Disable Verbose"
LANG["PHXM_DROP_VBS_ENABLE"]        = "Enable Verbose"
LANG["PHXM_DROP_MDL_INCLUDEALL"]    = "Include Everything ( %d )"
LANG["PHXM_DROP_MDL_CUSTOMLIST"]    = "Seperate/Custom List ( %d )"
LANG["PHXM_DROP_MDLTYPE_PROP"]      = "Physics Only ( %d )"
LANG["PHXM_DROP_MDLTYPE_PROPDYN"]   = "Physics & Dynamic Props ( %d )"
LANG["PHXM_DROP_MDLTYPE_ANYENTS"]   = "Any Compatible Entities ( %d )"
LANG["PHXM_DROP_MDLTYPE_CUSTOM"]    = "Custom Entities ( %d )"
LANG["PHXM_DROP_RESPAWNBLIND_BOTH"] = "Both Teams"

LANG["PHXM_TAB_ADMINGROUPS"]        = "Group & Access Option"
LANG["PHXM_TAB_PHEPLUS"]			= "Enhanced Plus Settings"

LANG["PHXM_ADMIN_ACCESS_GROUP"]     = "Select groups to allow access PH:X Admin Settings, Enhanced Plus & Plugin Settings page."
LANG["PHXM_ADMIN_ACCESS_GROUP_HINT"] = "Please note that \"superadmins\" cannot be revoked."
LANG["PHXM_ADMIN_ACCESS_GROUP_NOULX"] = "Error: ULib & ULX is not installed on your server."
LANG["PHXM_ADMIN_ACCESS_NOREVOKE"]  = " (Cannot be revoked)"
LANG["PHXM_ADMIN_GROUP_WHOCANACC"]	= "Select groups to allow access [Admin Settings]."
LANG["PHXM_ADMIN_GROUP_MUTEABLE"]	= "Select groups to disallow Voice Mute in [Player Muting]. (User is always mute-able)."

LANG["PHXM_ADMIN_ACCESS_CHATINFO"]  = "There was a configuration update for Prop Hunt Menu window. Reopening..."
LANG["PHXM_ADMIN_ACCMSG_BODY"]      = "Do you want to save selection and proceed the changes?\nPlease note that any previous groups you revoked will no longer have the access.\nThis will restart the Prop Hunt Menu if they're still opened."
LANG["PHXM_ADMIN_ACCMSG_TITLE"]     = "Apply Group Access"
LANG["PHXM_ADMIN_ACCCFG_SUCC"]      = "Group Access data successfully saved."
LANG["PHXM_ADMIN_ACCCFG_FAIL"]      = "There was an error saving Group Access data. Check your server console!"
LANG["PHXM_ADMIN_MUTCFG_SUCC"]      = "Mutedable Group Access data successfully saved."
LANG["PHXM_ADMIN_MUTCFG_FAIL"]      = "There was an error saving Muteable Group data. Check your server console!"

LANG["PHXM_ADMIN_ACCESS_APPLY"]     = "Apply Selected Groups"

-- PHE/Plus
LANG["PHXM_ADMIN_PLUSSETTING"]		= "Plus+ Settings"
LANG["PHXM_PLUSSETTING_HINT"]		= "Configure Team Balance or any other additional settings."
LANG["PHXM_HEADER_UNSTUCK"]			= "Unstuck Settings"
LANG["PHXM_HEADER_TEAMSETTING"]		= "More Team Options & Settings"

LANG["LIST_PLAYER"]					= "Players"
LANG["LIST_FORCEDASPROP"]			= "Forced As Prop?"
LANG["LIST_MARKEDASPROP"]			= "Marked to be forced as Prop"
LANG["LIST_NOHUNTERS"]				= "No Hunters are currently playing."

LANG["PHXM_PLUS_MSG_NO_HUNTERS"]	= "There are no hunters to reset."

LANG["PHXM_PLUS_BTNRESET"]			= "Clear Selections (and Reset All Forced)"
LANG["PHXM_PLUS_LISTTIPS"]			= "Tips: Double Click to toggle Force Player as Prop."

LANG["PHXM_ADMIN_ENABLEUNSTUCK"]		= "Toggle Enable/Disable Built-in unstuck feature. If you use an addon, disable this."
LANG["PHXM_ADMIN_NOTPUNSTUCKINROUND"]	= "Disable last-resort unstuck teleportations to spawnpoints outside of the hiding phase" --ph_disabletpunstuckinround
LANG["PHXM_ADMIN_UNSTUCK_WAITTIME"]		= "How much seconds must pass between each unstuck attempt" --ph_unstuck_waittime
LANG["PHXM_ADMIN_TEAMBAL_ORIG"] 		= "Use PH:X's original auto-balancing (disables all following team-related options below)" --ph_originalteambalance
LANG["PHXM_ADMIN_FORCESPECTOPLAY"]		= "Force spectators to play by including them when balancing teams" --ph_forcespectatorstoplay
LANG["PHXM_ADMIN_NO_H_CONSECUTIVE"]		= "Prevent players from being a Hunter twice in a row (only works in shuffle mode)" --ph_preventconsecutivehunting
LANG["PHXM_ADMIN_HUNTER_COUNT"] 		= "Hunter count (0 = automatic)" --ph_huntercount
LANG["PHXM_ADMIN_ROTATETEAM"] 			= "Disable shuffle mode and rotate players instead" --ph_rotateteams
LANG["PHXM_ADMIN_RESET_ROTTEAM"] 		= "Reset rotations" --ResetRotateTeams
LANG["PHXM_ADMIN_RESET_ROTTEAM_WARN"]	= "Restart rotations from the beginning (in case you've started them, stopped, then started again and the current rotation does not satisfy you):" --ResetRotateTeams_warning
LANG["PHXM_ADMIN_RESET_MSG"]			= "Rotation Team has been Reset!"
LANG["PHXM_ADMIN_FORCEH2P_WARN"]		= "Force a Hunter to be a Prop next time (only works in shuffle mode):" --ForceHunterAsProp_warning
LANG["PHXM_ADMIN_FORCEH2P_RANDONLY"]	= "This action is only available in shuffle mode." --ForceHunterAsProp_randomonly

LANG["FORCEH2P_WILL_BE"]				= "%s will be a Prop next round."
LANG["FORCEH2P_IS_CANCELED"]			= "%s won't be a Prop next round."
LANG["FORCEH2P_IS_RESET"]				= "All Hunters won't be Forced as a Prop next round."
LANG["FORCEH2P_PLAYER_NOT_FOUND"]		= "Selected player was not found, probably they were disconnected."
LANG["PHX_ROTATE_TEAM_RESET"]			= "Rotation Team Offset has been reset."

LANG["UNSTUCK_YOURE_UNSTUCK"]			= "You should be unstuck!"
LANG["UNSTUCK_BAD_SPAWNPOINT"]			= "Error: The closest spawnpoint might get you stuck again. If it does, try to unstuck again."
LANG["UNSTUCK_RESCUE_SPAWNPOINT"]		= "This spawnpoint is extremely close, so you might still be stuck. Try unstucking again if you are."
LANG["UNSTUCK_NO_SPAWNPOINTS"]			= "For unknown reasons, no spawnpoint could be found. As a backup strategy, you will be teleported to (0, 0, 0). There is a very high chance that you will be stuck, so if you are please try unstucking again."
LANG["UNSTUCK_PLEASE_WAIT"]				= "Please wait %d seconds between each unstuck attempt."
LANG["UNSTUCK_NOT_ON_GROUND"] 			= "Not on ground, checking..."
LANG["UNSTUCK_NOT_STUCK_JITTER"]		= "You're not stuck. If you really are, wait until your prop no longer moves/jitters (try pressing ALT) then try again."
LANG["UNSTUCK_NOT_STUCK_TOOBAD"]		= "You're not stuck. If you really are, sorry, you'll have to wait until the end of the round."
LANG["UNSTUCK_CANNOT_FIND_SPOT"]		= "Cannot find a place to move you to, teleporting to closest spawnpoint."
LANG["UNSTUCK_SPAWNPOINTS_DISABLED"]	= "You were going to be teleported to a close spawnpoint, but this server disallows it outside of the hiding/hunter blind period. Sorry!"
-- End of PHE/Plus

LANG["MISC_SEL_APPLY"]  = "Apply Selections"
LANG["MISC_RESET_SEL"]  = "Reset Selections"
LANG["MISC_RESET"]      = "Reset"
LANG["MISC_CANCEL"]     = "Cancel"
LANG["MISC_SEL_ALL"]    = "Select All"
LANG["MISC_SEL_NONE"]   = "Select None"

LANG["PHXM_CL_THIRDPERSON"]     = "Key for Toggling thirdperson mode"
LANG["PHXM_CL_UNSTUCK"]			= "Key for Unstuck"
LANG["CL_THIRDPERSON_ENABLED"]  = "Thirdperson Enabled"
LANG["CL_THIRDPERSON_DISABLED"] = "Thirdperson Disabled"

LANG["PHX_TP_ADJUSTVIEW_BTN"]	= "Adjust Thirdperson View" --Button, as well as window title.
LANG["PHX_TPS_ADJ_TITLE"]		= "Thirdperson Warning"
LANG["PHX_TPS_ADJ_SVDESIRED"]	= "Thirdperson Customization disabled: Using Server's desired position."
LANG["PHX_TPS_ADJ_3PDIS"]		= "Thirdperson mode is disabled."
LANG["PHX_TPS_ADJ_BLIND"]		= "You're blinded. Try again later."
LANG["PHX_TPS_ADJ_NEEDALIVE"]	= "You need to be on Alive Hunter Team to do this."

LANG["ANG_AXIS_DIST"]	= "Distance" -- or Forward
LANG["ANG_AXIS_RIGHT"]	= "Right"
LANG["ANG_AXIS_UP"]		= "Up"
LANG["VEC_POS_LEFT"]	= "Left" --X
LANG["VEC_POS_FRONT"]	= "Front" --Y?
LANG["VEC_POS_TOP"]		= "Top"  --Z

-- Key Hints
LANG["KEYHINT_HUNTER3P"] 	= "Hunter Thirdperson"
LANG["KEYHINT_SHOOT"]		= "Fire Weapon"
LANG["KEYHINT_SEC"]			= "Fire Secondary"
LANG["KEYHINT_PICKUP"]		= "Pickup Object/Interact"

LANG["KEYHINT_LMB"]			= "Replicate Prop"
LANG["KEYHINT_RMB"]			= "Prop Taunt/Special Ability"
LANG["KEYHINT_RANDTAUNT"] 	= "Random Taunt"
LANG["KEYHINT_TAUNTMENU"] 	= "Toggle Taunt Menu"
LANG["KEYHINT_ROTATION"] 	= "Toggle Rotation Lock"
LANG["KEYHINT_PROPMENU"] 	= "Toggle Prop Menu"
LANG["KEYHINT_FREEZEAIR"] 	= "Toggle Prop Freeze"
LANG["KEYHINT_SPAWNDECOY"] 	= "Spawn Decoy"
LANG["KEYHINT_UNSTUCK"]		= "Unstuck Key"

LANG["KEY_LMB"]				= "LMB" -- Left Mouse Button, Short version
LANG["KEY_RMB"]				= "RMB" -- Right Mouse Button, Short version

LANG["MISC_TEAM_NAME"]		= "TEAM: %s" -- TEAM PROPS, TEAM HUNTERS, but in 1 sentence.
LANG["NOTIFY_HEADER_TITLE"]	= "Game Controls"

PHX.LANGUAGES[LANG.code] = LANG