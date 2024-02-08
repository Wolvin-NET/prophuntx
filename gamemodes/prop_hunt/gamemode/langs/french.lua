-- Language Improved by Galaxio.
-- Previously Translated by: TR1NITY & Haeiven

local L={}

L.code = "fr"

L.Name 		 	= "Français"
L.NameEnglish	= "French"
L.Author			= "GaLaxio, TR1NITY, Haeiven"
-- Can Accept: String, and Table.
L.AuthorURL		= {	
	"https://steamcommunity.com/profiles/76561198107519666", --Galaxio
    "https://steamcommunity.com/profiles/76561198260731850", --TR1NITY
    "https://steamcommunity.com/profiles/76561198047814125"  -- Haeiven
}
L.SUICIDEMSG = { 
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
L.RANDOM_SPECTATORS = {
	"pour regarder et se détendre.",
	"pour voir ce qu'il se passe autour.",
	"pour admirer la vie d'une chaise.",
	"",
}

L["PHX_TEAM_CONNECTING"] = "Connecté"
L["PHX_TEAM_PROPS"]		= "Props" 
L["PHX_TEAM_HUNTERS"] 	= "Hunters"
L["PHX_TEAM_UNASSIGNED"]	= "Non assigné"
L["PHX_TEAM_SPECTATOR"] 	= "Spectateur"

-- List of string-based translation
L["HUD_KILLED"]				= "a tué"

-- FRETTA: HUDs
L["HUD_TIME"] 				= "TEMPS"
L["HUD_ROUND"]				= "MANCHE"
L["HUD_WAITPLY"]				= "En attente de joueurs..."
L["HUD_DEAD"]				= "(MORT)"

L["HUD_TEAMWIN"]				= "%s a gagné!"
L["HUD_LOSE"]				= "Égalité"
L["MISC_TIMELEFT"]			= "Temps restant: %s"
L["MISC_GAMEEND"] 			= "La partie se terminera après ce round."

-- FRETTA: Team selection screen (F2)
L["DERMA_TEAMSELECT"]		= "Choisir une équipe"

-- FRETTA: F1 screeen
L["DERMA_RTV"] 				= "Voter pour changer de map (RTV)"
L["DERMA_PHMENU"] 			= "Menu Prop Hunt"
L["DERMA_CHANGETEAM"]		= "Changer d'équipe"

-- FRETTA: Scoreboard
L["DERMA_PLAYER"]			= "(%d joueur)"	
L["DERMA_PLAYERS"]			= "(%d joueurs)"
L["DERMA_NAME"]				= "Nom"
L["DERMA_KILLS"]				= "Tués"
L["DERMA_DEATHS"]			= "Morts"
L["DERMA_PING"]				= "Ping"
L["DERMA_SERVER_TAG"]		= "SV"
L["DERMA_BOT_TAG"]			= "BOT"
L["DERMA_GAMEMODE_CREDITS"]	= "%s | Version: %s - Rev. %s"

L["CHAT_JOINED"]				= " a rejoint "
L["CHAT_JOINEDTHE"]			= " a rejoint l'équipe "

L["CHAT_SWAPBALANCE"]		= "%s a été remplacé par %s pour l'équilibrage des équipes."
L["CHAT_SWAPBALANCEYOU"]		= "Vous avez été échangé pour atteindre un équilibre parfait." -- Smile... for even in death, you have become children of Thanos

-- FRETTA: Splash Starting Screen
L["SPASHSCREEN_BY_X"]		= "par %s"
-- RichTextBox
L["HELP_DONATORS_AND_CONTRIBUTORS"]  = "\n\nDonateurs & Contributeurs:\n- %s"
-- // END OF FRETTA SECTION \\

L["HELP_F1"] 				= [[Projet Prop Hunt X.
Un projet qui a pour objectif de rendre le Prop Hunt plus Moderne et plus Personnalisable.
Plus d'informations sur:
https://www.buymeacoffee.com/wolvindra
Pour voir plus d'infos, de guides et d'aides, Appuyez [F1] et cliquer sur le bouton [Menu Prop Hunt].
Version: ]].. PHX.VERSION ..[[ Revision: ]].. PHX.REVISION ..[[

Tout le contenu du Prop Hunt a été traduit par GaLaxio
https://steamcommunity.com/profiles/76561198107519666

Traduit à l'origine par: TR1NITY & Haeiven.

Amusez vous bien!]]

L["LANGUAGE_CHANGED"]		= "La langue préférée a été changée par %s"

-- internal cl_menutypes section.
L["SUBTYPE_PREFERED_LANG"]	= "Langue préférée"

-- Events
L["EV_PLAYER_CONNECT"]		= "%s s'est connecté sur le serveur."
L["EV_PLAYER_JOINED"]		= "%s a rejoint le serveur."
L["EV_PLAYER_DISCONNECT"]	= "%s s'est deconnecté du serveur (Raison: %s)"

-- HUD elements
L["HUD_HP"]					= "SANTÉ"
L["HUD_AMMO"] 				= "MUNITIONS"
L["HUD_MAGSEC"]				= "MAG. / SEC." --Magazine | Secondary Magazine

-- !!WEAPON NAMES CANNOT BE TRANSLATED, THEY USE FROM language.GetPhrase THEREFORE IT'S IMPOSSIBLE TO DO.

L["TEAM_PROPS"]				= L["PHX_TEAM_PROPS"] 
L["TEAM_HUNTERS"]			= L["PHX_TEAM_HUNTERS"]

L["HUD_ROTLOCK"]				= "Prop Rotation: Bloqué"
L["HUD_ROTFREE"]				= "Prop Rotation: Libre"
L["HUD_KILLEDBY"]			= "Vous avez été tué par %s"

L["HUD_AUTOTAUNT"]			= "Auto Taunt dans %d seconde(s)"
L["HUD_AUTOTAUNT_ALT"]		= "Auto Taunt dans %d"

L["HUD_TargetID"]			= "Joueur: %s (%d%%)"

L["HUD_BLINDED"]				= "Les %s vont être libéré dans %s"
L["HUD_UNBLINDED"]			= "Prêt ou non, on arrive!"

L["BLIND_RESPAWN_TEAM"]		= "Vous avez réapparu uniquement sur l'équipe %s en %d secondes pendant le temps aveugle."
L["BLIND_RESPAWN"]			= "Vous avez réapparu en %d secondes pendant le temps aveugle."

L["MISC_ACCEPT"]				= "Accepté"
L["MISC_OK"]					= "OK"
L["MISC_CLOSE"]				= "Fermer"
L["MISC_PREV"]				= "< PRÉCÉDENT"
L["MISC_NEXT"]				= "SUIVANT >"
L["MISC_ACCESSDENIED"]		= "Accès refusé"

-- Chat messages
L["CHAT_NOPLAYERS"]			= "Il y a pas assez de joueurs pour commencer la partie !"
L["CHAT_SWAP"]				= "Les équipes ont été switchés!"

L["CHAT_SWAPTEAM_WARNING"]   = "Vous avez changé d'équipe %dx fois(%dx MAX). Vous ne pouvez plus changer d'équipe."
L["CHAT_SWAPTEAM_REVERT"]	= "Vous ne pouvez pas aller dans l'équipe %s car vous avez dépassé le nombre de changement d'équipe."

L["CHAT_PROP_NO_ROOM"] 		= "Il n'y a pas assez d'espace pour se transformer en l'objet choisi!"

-- Notification
L["NOTIFY_IN_PROP_TEAM"]		= "Vous êtes dans l'équipe Props ! Vous pouvez faire pivoter la rotation du props en déplaçant votre souris."
L["NOTIFY_ROTATE_NOTICE"]	= "De plus, vous pouvez activer / désactiver la rotation de verrouillage en appuyant (par défaut) sur la touche [R] !"

-- Custom Taunt Window
L["TM_WARNING_CT_DISABLE"]	= "[PHX - Taunts] Attention: Taunts personnalisés désactivé sur ce serveur."
L["TM_NO_TAUNTS"]			= "Attention: Pas de Taunts détectés dans cette catégorie."
L["TM_PLAY_ONLY_ALIVE"] 		= "Vous êtes autorisés a jouer les Taunts personnalisés lorsque vous êtes en vie."

L["TM_WINDOW_TITLE"]			= "Prop Hunt Taunts personnalisés"
L["TM_NOTICE_PLSWAIT"]		= "Veuillez ptienter pendant %s sec(s) avant la fin du Taunt aléatoire!"
L["TM_NOTICE_PLAYPREVIEW"]	= "Prévisualisation du Taunt : %s"

L["TM_TOOLTIP_PLAYTAUNT"] 	= "Jouer le Taunt"
L["TM_TOOLTIP_PREVIEW"]		= "Prévisualiser le Taunt"
L["TM_TOOLTIP_PLAYCLOSE"]	= "Jouer le Taunt et fermer"
L["TM_TOOLTIP_PLAYRANDOM"]	= "Jouer un Taunt aléatoire"
L["TM_TOOLTIP_CLOSE"]		= "Fermer"
L["TM_MENU_CLOSE"]			= "Fermer le Menu"

L["TM_DELAYTAUNT_NOT_EXIST"] = "Le Taunt sélectionné n'a pas été trouvé sur le serveur!"
L["TM_DELAYTAUNT_PLSWAIT"]	= "Veuillez patienter pendant %s seconde(s)!"

--[[
	PHX Menu window
]]
L["PHXM_WINDOW_TITLE"]		= "Prop Hunt X - Menu & Paramètres avancés"
L["SERVER_INFO_MOTD"]		= "RÈGLES ET INFORMATIONS DU SERVEUR [MOTD]"

L["PHXM_TAB_HELP"]			= "Aide"
L["PHXM_TAB_MUTE"]			= "Muter un Joueur"
L["PHXM_TAB_PLAYER"]			= "Paramètres du Joueur"
L["PHXM_TAB_MODEL"] 			= "Explorateur de Models"
L["PHXM_TAB_MODEL_DISABLED"]	= "Explorateur de Models (Désactivé)"
L["PHXM_TAB_ADMIN"]			= "Paramètres Administrateurs"
L["PHXM_TAB_ABOUT"]			= "A propos de PH:X"
L["PHXM_TAB_MAPVOTE"]		= "Paramètres pour Voter une Map"
L["PHXM_TAB_PLUGINS"]		= "Addons et Plugins"

L["PHXM_CVAR_CHANGED"]		= "[Paramètres] CVar %q a été changé par %q"

--[[
	Player Mute Settings
]]
L["PHXM_MUTE_SELECT"]		= "Sélectionner un Joueur que vous voulez rendre muet."

--[[ 
	Player Settings
]]
L["PHXM_PLAYER_OPTIONS"]		= "Options du Joueur"
L["PHXM_PLAYER_LANG"]		= "Langues"
L["PHXM_PLAYER_BIND"]		= "Binds"
L["PHXM_PLAYER_HUDSETTINGS"]	= "Paramètres du HUD"

L["PHXM_PLAYER_TAUNT_KEY"]			= "Touche pour Taunt aléatoire"
L["PHXM_PLAYER_TAUNTWINDOW_KEY"]		= "Touche du Menu Taunt"
L["PHXM_PLAYER_ROTATLOCK_KEY"]		= "Touche pour rotation des Props"

L["PHXM_PLAYER_TOGGLE_HALOS"]		= "Activer l'effet Halo quand vous choissisez un Prop"
L["PHXM_PLAYER_IDNAMES"]				= "Voir l'équipe du joueur au dessus de la tête (se voit a travers les murs)"
L["PHXM_PLAYER_ENDROUND_CUE"]		= "Jouer une musique en fin de manche"
L["PHXM_PLAYER_TAUNTMENU_AUTOCLOSE"]	= "Fermer le menu des Taunts automatiquement avec un double-clic"
L["PHXM_PLAYER_SEE_HUNTER_LINE"]		= "Afficher la ligne sur les Hunters pour observer ce qu'il regarde en mode spectateur" -- maybe too long ? 
L["PHXM_PLAYER_SEE_LBALL_ICONS"]		= "Activer l'icône 'Lucky ball'"
L["PHXM_PLAYER_SEE_CRYSTAL_ICONS"]	= "Activer l'icône 'Devil ball'"

L["PHXM_PLAYER_USE_NEW_HUD"]			= "Utiliser le nouveau HUD PH: X "
L["PHXM_PLAYER_SHOW_TUTOR"]			= "Tutoriel montré en Pop-up (Seulement 2 fois sur chaque spawn en Prop)"
L["PHXM_PLAYER_USE_NEW_CROSSHAIR"]	= "Activer le Crosshair personnalisé"
L["PHXM_PLAYER_SHOW_TEAM_TOPBAR"]	= "Afficher le nombre de joueurs en vie en haut à gauche (Au moins 4 joueurs seront affichés)"

--[[
	Player model Browser Section
]]
L["QUERY_MODEL_SELECTED"]	= "Modèle %s a été sélectionné et sera appliqué au prochain respawn"
L["QUERY_MODEL_INFO"]		= "Nom du modèle: %s - Disponible pour: Tout le monde"

L["MDL_MENU_REFRESH"] 		= "Rafraîchir les icônes"
L["MDL_MENU_PREVIEW"] 		= "Prévisualisation du Model"
L["MDL_MENU_MODELINFO"] 		= "Information du Model"


L["MISC_APPLYMDL"] 			= "Appliquer le Model"

L["PHXM_MODEL_DISABLED"] 	= "Désolé, Modèles de joueurs personnalisés désactivés sur ce serveur!"
L["PHXM_PLAYERMODEL_SETFOV"]	= "  Définir le FOV du Model"

--[[
	Server Settings
]]
L["PHXM_ADMIN_OPTIONS"]		= "Options du Gamemode côté Serveur (Uniquement visible pour les Admins)"
L["PHXM_ADMIN_MUSTALIVE"]	= "Vous devez être en vie pour effectuer cette opération."

--[[
	Language Override
]]
L["PHXM_ADMIN_LANGOVERRIDE"]	= "Remplacement de la Langue"

L["PHXM_ADMIN_FORCELANG"] 				= "Forcer une langue? Cela remplacera la langue du client pour utiliser la langue choisie par le serveur."
L["PHXM_ADMIN_LANGTOUSE"]				= "Language forcé a utiliser."
L["PHXM_ADMIN_PLAYERDEFAULTLANG"] 		= "Langue par défaut quand un joueur rejoint le serveur la première fois."

-- Gameplay settings
L["PHXM_ADMIN_CUSTOM_MODEL"]				= "Activer Models personnalisés pour les Hunters"
L["PHXM_ADMIN_CUSTOM_MODEL_PROP"]		= "Activer Models personnalisés pour les Props - Doit être activé pour les Hunters"
L["PHXM_ADMIN_TAUNT_DELAY_CUSTOM"]		= "Délai des Taunts personnalisés (Secondes)"
L["PHXM_ADMIN_TAUNT_DELAY_RANDOM"]		= "Délai des Taunts normaux (Secondes)"
L["PHXM_ADMIN_TAUNT_DELAY_AUTO"]			= "Délai des Taunts Automatiques (Secondes)"
L["PHXM_ADMIN_AUTOTAUNT_ENABLE"]			= "Activer les fonctions Auto Taunt (Le temps approprié sera fixé a la prochaine manche)"

L["PHXM_ADMIN_NOTICE_ROTATION"]			= "Afficher la notification 'Rotation des Props' a chaque spawn"
L["PHXM_ADMIN_CAMERA_COLLIDE"]			= "Activer la collision de la caméra sur les murs pour les Props"
L["PHXM_ADMIN_FREEZECAM"]				= "Activer la fonctionnalité 'Bloquer la Caméra' pour les Props"
L["PHXM_ADMIN_FREEZECAM_HUNTER"]			= "Activer la fonctionnalité 'Bloquer la Caméra' pour les Hunters"
L["PHXM_ADMIN_PROP_COLLIDE"]				= "Activer la collision des props entre les joueurs"
L["PHXM_ADMIN_SWAP_TEAM"] 				= "Switcher d'équipe à chaque manche"
L["PHXM_ADMIN_HUNTER_PENALTY"]			= "Pénalité des Hunters"
L["PHXM_ADMIN_HUNTER_KILL_BONUS"]		= "Bonus des Hunters pour chaque props tués"
L["PHXM_ADMIN_HUNTER_SMG_GRENADES"]		= "Nombre de Grenades du SMG pour les Hunters"
L["PHXM_ADMIN_GAME_TIME"]				= "(Redémmarage de la Map requis) Temps de jeu par Map (Minutes)"
L["PHXM_ADMIN_BLINDLOCK_TIME"]			= "Temps des Hunters bloqués au spawn (Secondes)"
L["PHXM_ADMIN_ROUND_TIME"]				= "(Redémarrage de la Map requis) Temps de jeu par manches (Seconds)"
L["PHXM_ADMIN_ROUNDS_PER_MAP"]			= "(Redémarrage de la Map requis) Nombres de manches par Map"
L["PHXM_ADMIN_ENABLE_LUCKYBALL"]			= "Faire apparaitre les Lucky Balls lorsqu'un Prop est cassé (8% de chance)"
L["PHXM_ADMIN_ENABLE_CRYSTAL"]			= "Faire apparaitre les Devil Balls quand un Hunter est mort (Toujours au spawn)"
L["PHXM_ADMIN_WAIT_PLAYERS"]				= "Attendre les joueurs pour que le jeu commence"
L["PHXM_ADMIN_WAIT_MIN_PLAYERS"]			= "Nombre de joueur minimum pour commencer la partie (par défaut: 1)"
L["PHXM_ENABLE_PLAYER_JOIN_LEAVE"] 		= "Activer la notification des joueurs qui se connectent? Mettez 0 si vous préférez un autre Addon personnalisé ."

L["PHXM_ADMIN_FORCEJOINBALANCE"]			= "Forcer les joueurs a prendre une équipe pour équilibrer la partie"
L["PHXM_ADMIN_ENABLETEAMBALANCE"]		= "Équilibrer les équipes à chaque fin de manche (Équilibrer les équipes)"
L["PHXM_ADMIN_PICKUP_PROPS"] 			= "Autoriser les joueurs à prendre les Props? 0: Non autorisé, 1: Uniquement les Hunters, 2: Uniquement les Props, 3: Autorisé pour les deux équipes."

L["PHXM_ADMIN_TAUNTMODES"]			= "Taunt Modes"
L["PHXM_ADMIN_TAUNTMODE_MODE"]		= "--[Le Mode des Taunts est sur : %d ]--"
L["PHXM_ADMIN_TAUNTMODE0"]			= "Mode [0]: F3/Taunt aléatoire"
L["PHXM_ADMIN_TAUNTMODE1"]			= "Mode [1]: C/Taunt personnalisé"
L["PHXM_ADMIN_TAUNTMODE2"]			= "Mode [2]: Les deux"
L["PHXM_ADMIN_TAUNTSOPEN"]			= "Ouvrir la fenêtre des Taunts"

L["PHXM_MODE_DEFAULT"] 				= "--[ Le Mode pour prendre les props est sur : %d ]--"
L["PHXM_MODE0"]						= "Mode [0]: Non autorisé"
L["PHXM_MODE1"]						= "Mode [1]: Uniquement les Hunters"
L["PHXM_MODE2"]						= "Mode [2]: Uniquement les Props"
L["PHXM_MODE3"]						= "Mode [3]: Autorisé pour les deux équipes"

--[[
	Admin Developer Sections
]]
L["PHXM_ADMIN_DEVSECTION"]		= "Options développeurs/expérimentés "
L["PHXM_ADMIN_ROOMCHECK"]		= "Activer la vérification des limites? Prévient lorsque vous risquez de rester coincé dans les murs."
L["PHXM_ADMIN_USENEWMKBREN"]		= "Utiliser le nouveau modèle de l'arme bonus Bren MK II (Redémarrage de la Map requis)"
L["PHXM_ADMIN_BEVERBOSE"]		= "Développeur: Détails - Activer PH:X pour imprimer toutes les informations et tous les événements de manière détaillée?"
L["PHXM_ADMIN_SHOWPLNAMEHEAD"]	= "Activer l’affichage des noms d’équipe des joueurs sur leur écran."
L["PHXM_ADMIN_USESINGLE_FZCAM"]	= "Utilisez un seul son pour la Freeze Cam au lieu d’une liste de sons (utilisez 'ph_fc_cue_path' pour déterminer le chemin sonore Freezecam)"
L["PHXM_ADMIN_MODELLISTINGTYPE"] = "Utiliser la liste des Models hérités : 0: Tout les PlayerModels, 1: Hérité par: list.Get('PlayerOptionsModel')"
L["PHXM_ADMIN_JUMPPOWER"]		= "Puissance de saut additionnel pour les Props"
L["PHXM_ADMIN_ENABLE_OBB"]		= "Développeur: Activer le modificateur OBB (Prop Entities Model Boundaries) personnalisé à partir des données de configuration"
L["PHXM_ADMIN_RELOAD_OBB"]		= "Développeur: Recharger les données du modificateur OBB à chaque redémarrage de la manche"

--[[
	Experimental & PH:X Features
]]
L["PHXM_ADMIN_EXPERIMENTALPHX"]			= "Section PHX Expérimenté"

L["PHXM_ADMIN_HLA_COMBINE"]				= "Ajouter le support du Model HL: Alyx Combine"
L["PHXM_ADMIN_TEAMBALANCE"]				= "Paramètre des équilibrages d'équipes"
L["PHXM_ADMIN_CHANGETEAM_LIMIT"]			= "Limiteur de changement d'équipe. Mettre -1 pour désactiver. "
L["PHXM_ADMIN_USENEWCHAT"]				= "Utiliser le nouveau Chat Box (eChat) - Il s’agit d’un remplacement temporaire. Si vous en avez déjà un, laissez-le décoché."
L["PHXM_ADMIN_NEWCHATPOS"]				= "Position du nouveau Chat Box: Sous-Hauteur (Y) Position par N pixels."
L["PHXM_ADMIN_RESPAWNONBLIND"]			= "Autoriser à rejoindre pendant le blocage des Hunters"
L["PHXM_ADMIN_RESPAWNONBLIND_TEAM"]		= "Autoriser à rejoindre pendant le blocage sur une équipe spécifique: 0: Les deux, 1: Hunters, 2: Props"
L["PHXM_ADMIN_REWSPANTIMEPERCENT"]		= "Pourcentage du temps de blocage pour rejoindre. 0.75 par défaut (75% * signifie Temps de blocage maximum)"
L["PHXM_ADMIN_ALLOWRESPAWN_SPECTATOR"]	= "Autoriser à rejoindre pendant le blocage quand vous êtes assigné en spectateur"
L["PHXM_ADMIN_ALLOWRESPAWN_TEAMCHANGE"]	= "Autoriser à rejoindre pendant le blocage quand vous êtes assigné dans l'équipe opposée (L'activer n'est pas recommandé)"

--[[
	MapVote Settings
]]
L["PHXM_MV_SETTINGS"]			= "Paramètres pour Voter une Map"

L["PHXM_MV_ALLOWCURMAP"]			= "Autoriser la map actuelle a être voté."
L["PHXM_MV_COOLDOWN"]			= "Autoriser a voter pendant la map actuelle."
L["PHXM_MV_USE_ULX_VOTEMAPS"]	= "Utiliser la liste des maps depuis ULX Mapvote? Si Non, les maps/*.bsp seront utilisés par défaut."
L["PHXM_MV_MAPLIMIT"]			= "Nombre de maps affichés pendant le vote de la Map."
L["PHXM_MV_TIMELIMIT"]			= "Temps en secondes par défaut pour voter une Map."
L["PHXM_MV_MAPBEFOREREVOTE"]		= "Nombre de Maps passé pour revoter une ancienne Map"
L["PHXM_MV_RTVCOUNT"]			= "Nombre de joueurs requis pour la commande RTV (Rock the Vote)"

L["PHXM_MV_EXPLANATION1"]		= "Pour paramétrer le préfixe des maps, faites (par exemple) [ mv_map_prefix 'phx_,ph_,cs_,de_' ] dans la console."
L["PHXM_MV_EXPLANATION2"]		= "Si vous utilisez ULX, faites map_vote. Si vous ne pouvez pas, faites mv_start."
L["PHXM_MV_EXPLANATION3"]		= "Action VoteMap (Pour annuler, faites simplement !unmap_vote (ULX) ou mv_stop dans la console.)"

L["PHXM_MV_START"]		= "Commencer le vote de la Map"
L["PHXM_MV_STOP"]		= "Stopper le vote de la Map"
--                  			  ^VOUS AVEZ VIOLÉ LA LOI!

--[[ 
	Versioning, Credits or About section
]]
L["PHXM_ABOUT_VERSIONING"]		= "Version: %s - Revision: %s"
L["PHXM_ABOUT_AUTHOR"]			= "Par: %s"
L["PHXM_ABOUT_ENJOYING"]			= "Si vous aimez ce mode de jeu, faites un don!"
L["PHXM_ABOUT_UPDATE"]			= "Prop Hunt X Mises à jour"

L["PHXM_VIEW_UPDATE_INFO"]		= "Voir les infos de la Mise à jour"
L["PHXM_CHECK_FOR_UPDATES"]		= "Vérifier les Mises à jour"
L["PHXM_UPDATE_FOUND_TEXT"]		= "Vérification des Mises à jour efféctuées. Regarder la console pour plus d'informations.\n\nSouhaitez-vous voir les nouvelles Mises à jour?"
L["PHXM_UPDATE_FOUND_TITLE"]   	= "Information de la Mise à jour"
L["PHXM_UPDATE_FOUND_BUTTON"]   	= "Voir les informations"

L["UPDATE_NOTIFY_MSG_NOTFOUND"]	= "Aucune Mise à jour a été trouvée. Cliquez sur le bouton 'Vérifier les Mises à jour'"
L["UPDATE_NOTIFY_MSG_TITLE"]		= "Aucune Mise à jour trouvée"
L["UPDATE_NOTIFY_WINDOW_TITLE"]	= "Avis de Mise à jour"
L["UPDATE_RTBOX_APPEND"]			= "\n\nPour votre information:\nVous utilisez la Version: %s et la Révision: %s"
L["UPDATE_BTN_SEEFULL"]			= "Voir tout les changements"

L["PHXM_ABOUT_LINKS"]			= "Liens et Crédits"
L["PHXM_ABOUT_THANKS"]			= "Un grand merci à eux pour les supports, les suggestions et les contributeurs:\n %s"
L["PHXM_ABOUT_BTN_DONATE"]		= "Support PH:X par donation"
L["PHXM_ABOUT_BTN_HOME"]			= "PHX Accueil"
L["PHXM_ABOUT_BTN_GITHUB"]		= "PHX Répertoire GitHub"
L["PHXM_ABOUT_BTN_PLUGINS"]		= "PHX Addons/Plugins"
L["PHXM_ABOUT_BTN_CHANGELOGS"]	= "PHX Changements"

-- fretta
L["HUD_SPECTATING"]	= "SPECTATEUR"
L["HUD_YOUDIED"]		= "VOUS ÊTES MORT!"

L["CHAT_STARTING_MAPVOTE"] = "Fin de la partie, changement de la Map..."

-- This used for HUD Taunt Timer
L["HUD_PROP_TAUNT_TIME"]	= "Taunt aléatoire"
L["HUD_PROP_CTAUNT_TIME"] = "Taunt Pers."

-- Plugins Section
L["PLUGINS_NO_PLUGINS"]				= "Aucun plugins installés! Trouvez vos plugins ICI"
L["PLUGINS_BROWSE_MORE"]				= "Trouvez PLUS de plugins"
L["PLUGINS_SERVER_HAS_NO_PLUGINS"]	= "Désolé, ce serveur n'a pas d'addons/plugins personnalisés d'installés."
L["PLUGINS_SERVER_SETTINGS"]			= "-- Paramètres Serveur --"
L["PLUGINS_CLIENT_SETTINGS"]			= "-- Paramètres Client --"

-- Text Entries
L["TEXTENTRY_FZ_SINGLE"] = "Chemin d'accès du son FreezeCam"
L["TEXTENTRY_MV_PREFIX"] = "Préfixe des maps pour le Vote de la Map"

L["MISC_GAME_ENDED"]		= "Le jeu est terminé."

--============= LATE ADDITION OF 16.09.21/X2Z. =============--

--[[
	Credits: Late Addition: Revision: 16.09.21/X2Z
]]

L["PHXM_ABOUT_BTN_WIKI"]			= "PHX Wiki & Instructions"

--[[
	Auto Taunt: Late Addition: Revision: 16.09.21/X2Z
]]

L["HUD_AUTOTAUNT_DISABLED"]		= 	"Auto Taunt est désactivé."
L["HUD_AUTOTAUNT_WAITFORUPDATE"]	=	"Auto Taunt est entrain de synchroniser..."

--[[
	MapVote: Late Addition: Revision: 16.09.21/X2Z
]]
L["PHXM_MV_VOTEROCKED"]				= "Le vote est terminé, le vote sera effectif à la fin de la manche"
L["PHXM_MV_VOTEROCKED_IMMINENT"]		= "Le vote est terminé, changement de Map imminent!"
L["PHXM_MV_VOTEROCKED_PLY_TOTAL"]	= "%s a utilisé la commande Rock the Vote. ( %d / %d )"

L["PHXM_MV_MUST_WAIT"]				= "Patienter un peu avant de voter!"
L["PHXM_MV_VOTEINPROG"]				= "Un vote est actuellement en cours!"
L["PHXM_MV_HAS_VOTED"]				= "Vous avez déja efféctué la commande Rock The Vote!"
L["PHXM_MV_ALR_IN_VOTE"]				= "Il y à eu déja un vote, la Map va changer!"
L["PHXM_MV_NEED_MORE_PLY"]			= "Il vous faut plus de joueurs pour utiliser la commande Rock The Vote!"

--[[
	Late Addition: Revision: 16.09.21/X2Z
]]
L["PROP_PLAYERMDL_BANNED"]	= "Votre Model personnalisé a été banni du serveur."

--[[
	Prop Menu/Prop Chooser, Revision: 16.09.21/X2Z
]]

L["PCR_USAGE_UNLIMIT"]		= "[Prop Menu] Il vous reste une utilisation **ILLIMITÉ**"
L["PCR_USAGE_COUNT"]			= "[Prop Menu] Il vous reste %d utilisation possible!"
L["PCR_PLS_WAIT"]			= "[Prop Menu] Veuillez patientez pendant %d secondes."
L["PCR_NOROOM"]				= "[Prop Menu] Il y a pas assez de place pour devenir ce Prop choisi!"
L["PCR_PROPBANNED"]			= "[Prop Menu] Ce prop a été banni du serveur."
L["PCR_PROPBANNED_BYPCR"]	= "[Prop Menu] Vous ne pouvez pas utiliser ce Prop car il a été banni du Prop Menu."
L["PCR_REACHED_LIMIT"]		= "[Prop Menu] Vous avez dépassé la limite du Prop Menu!"
L["PCR_STAY_ON_GROUND"]		= "[Prop Menu] Vous devez être debout au sol mais pas accroupi!"
L["PCR_ONLY_GROUP"]			= "[Prop Menu] Certains groupes uniquement peuvent ouvrir ce menu!"
L["PCR_NOT_EXIST_COUNT"]		= "Le prop que vous avez choisi n'existe pas sur la Map! ( %s / 4 )"
L["PCR_NOT_EXIST"]			= "Le prop que vous avez choisi n'existe pas sur la Map!"

-- PCR Client section, reason why there is a space because of chat.AddText between args.
L["PCR_NOTIFY_1"]			= " Ce serveur utilise le Prop Menu version %s! "
L["PCR_NOTIFY_2"]			= " Dans la console ou F1 -> [Aide PropChooser] menu."
L["PCR_CL_DISABLED"]			= " Cette fonction est désactivé."
L["PCR_CL_GROUP"]			= " Certains groupes uniquement peuvent ouvrir ce menu!"
L["PCR_CL_LIMIT"]			= " Vous avez dépassé la limite!"

L["PCR_UNLIMIT_TEXT"]		= "Illimité"
L["PCR_WINDOW_TITLE"]		= "PH:X Prop Menu"
L["PCR_HEADER_TOP"]			= "Sélectionner le Prop que vous souhaitez."
L["PCR_HEADER_MID"]			= "Nombre d'utilisation maximum: %s"
L["PCR_HEADER_BOTTOM"]		= "pour utiliser le Prop Chooser!"
L["PCR_CL_TOOLTIP_BANNED"]	= "Ce Prop a été banni."
L["PCR_CL_TOOLTIP_MODEL"]	= "Modèle: %s"
L["PCR_CL_MENU_NOTREADY"]	= "Cette fonction n'est pas disponible pour le moment."
L["PCR_WINDOW_GUIDE_TTL"]	= "Guide Rapide: Prop Menu 101"
L["PCR_BTN_HELP_MENU"]		= "Aide Prop Menu"

L["PCR_CL_CMDUSEULX"]		= " Cette commande est désactivé. Utiliser plutôt 'ulx propmenu' !"
L["PCR_CMD_ULX_DISABLED"]	= "Commande ULX désactivé. Appuyez sur votre [Touche Prop Menu] pour ouvrir."

L["PCR_EDT_IN_USE"]			= "Un Admin est entrain d'éditer les données des props, Veuillez patienter..."
L["PCR_EDT_ERROR_DISABLED"]	= "[Prop Menu] Erreur: Custom Prop Addition est désactivé!"
L["PCR_EDT_NO_RIGHTS"]		= "Vous n'avez aucun droit pour accéder a cette fonctionnalité."

--[[
	Admin Section, Revision: 16.09.21/X2Z
]]
L["PHXM_PLAYER_PROP_CHOOSER_KEY"]	= "Touche par défaut pour ouvrir le Prop Menu (Prop Chooser)."
L["PHXM_PROP_FREEZE_MIDAIR"]			= "Touche par défaut pour activer le blocage de son prop dans les airs."
L["PHXM_ADMIN_TAUNT_SCANNER"]		= "(Redémarrage de la Map requis) Activer le scanner de Taunts?"
L["PHXM_ADMLBL_USABLE_ENTS"]			= "Type d'entités de Props"
L["PHXM_ADMLBL_USABLE_ENTS_REF"]		= "Les types différents sont: 1: Physics Only, 2: Physics & Dynamics, 3: Almost Anything inc. Ragdolls, 4: Custom Entities."
L["PHXM_ADMIN_USABLE_ENT_TYPE"]		= "Type d'entités utilisables que les Props peuvent répliquer"
L["PHXM_ADMIN_NOTIFY_ENT_TYPE"]		= "Afficher une notification des entités non réplicables [Touche E]. Fonctionne seulement si 'ph_usable_prop_type' est mis sur 3 ou 4."
L["NOTIFY_PROP_ENTTYPE"]				= "Appuyez sur [E] pour intéragir, [Click] pour répliquer le Prop choisi."
L["NOTIFY_CUST_ENT_TYPE_IS_ON"]		= "[PHX] Info: Appuyez sur [E] pour intéragir, [Click] pour répliquer le Prop choisi."

--[[
	Custom Taunts, Revision: 16.09.21/X2Z
]]
L["TM_TAUNTS_SEARCH_NOTHING"]		= "Le Taunt recherché : '%s' n'a pas été trouvé..."
L["TM_SEARCH_PLACEHOLDER"]			= "Chercher dans la catégorie: Entrer un mot, en minuscule sans caractères spéciaux. Vide=Tout afficher."
L["PHXM_MSG_INPUT_IS_EMPTY"]			= "Le texte est vide ou vous avez pas appuyé sur la touche ENTRÉE."

--============= LATE ADDITION OF 10.06.2022/X2Z. =============--

--goto line: @132
L["MISC_SET"]						= "Définir"
L["MISC_APPLY"]						= "Appliquer"
L["MISC_NO"]							= "Non"
L["MISC_YES"]						= "Oui"
L["MISC_WARN"]						= "Attention"
L["MISC_ERROR"]						= "Erreur"
L["MISC_INFO"]						= "Information"
L["MISC_NOTICE"]						= "Note"
L["MISC_IDK"]						= "Inconnu"
L["MISC_NA"]							= "N/A"

-- HUD
L["HUD_DECOY_ACTIVE"]                = "Appuyez [%s]"
L["HUD_FAKETAUNT_COUNT"]             = "%ix Restant"
L["HUD_FAKETAUNT_UNLI"]              = "Illimité"
L["NOTICE_GRENADE_SMG_GIVEN"]        = "Vous avez obtenu des Grenades SMG."

--[[
	ADMIN PANEL, Revision 10.06/2022/X2Z
]]--
L["PHXM_TAUNT_SETTINGS"]				= "Paramètres des Taunts"
L["PHXM_GENERAL_SETTINGS"]			= "Paramètres Généraux"
L["PHXM_FAKE_TAUNT_SETTINGS"]		= "Paramètres des Faux Taunts"
L["PHXM_FAKE_TAUNT_ENABLE"]			= "Autoriser à jouer de faux Taunts aléatoires sur la Map. Accesible uniquement dans le menu des Taunts personnalisés."
L["PHXM_FAKE_TAUNT_MAXUSAGE"]		= "Utilisation maximum des faux Taunts; -1 est illimité."
L["PHXM_TAUNT_RIGHT_CLICK"]		    = "Clic droit pour Taunt. Ceci désactive le menu quand vous faites un clic droit!"

L["PHXM_TAUNT_PITCH_SETTINGS"]		= "Paramètre du pitch des Taunts"
L["PHXM_TAUNT_PITCH_ENABLE"]			= "Activer le pitch des Taunts"
L["PHXM_TAUNT_PITCH_RANGE_MIN"]		= "Seuil minimum du pitch acceptable pour un Taunt. 1 to 99."
L["PHXM_TAUNT_PITCH_RANGE_MAX"]		= "Seuil maximum du pitch acceptable pour un Taunt. 100 to 255."

L["PHXM_DECOY_SETTINGS"]				= "Paramètres des Decoys"
L["PHXM_DECOY_ENABLE"]				= "Activer récompenses des Decoys? La récompense ne sera donnée QU’UNE SEULE FOIS pour les Props vivants jusqu’à la fin de la manche."

L["PHXM_DISABLE_FOOTSTEP"]           = "Activer les bruits de pas silencieux pour les Props"

L["PHXM_ADMIN_CHATSETTING"]			= "Paramètres de la fenêtre de Chat"
L["PHXM_ADMIN_HUNTERBLIND"]			= "Contrôle du blocage des Hunters"

L["PHXM_ADMIN_GIVEGRENADE_NEAREND"]  = "Combien de grenades donnés par manche? Si Oui, voir 'ph_give_grenade_roundend_before_time'"
L["PHXM_ADMIN_GIVEGRENADE_TIME"]     = "Temps en secondes pour donner les grenades avant la fin de la manche. Situé en général entre 10 et 30 secondes."

--[[
	Plugins in sh_init.lua, Revision 10.06/2022/X2Z
]]--
L["PLUG_NAME_VER"]					= "Plugin: %s | v.%s"
L["PLUG_DESCRIPTION"]				= "Description: %s"

--[[
	Taunt Pitch, Revision 10.06/2022/X2Z
]]--
L["PHX_CTAUNT_USE_PITCH"]			= "Utiliser le pitch pour les Taunts personnalisés"
L["PHX_CTAUNT_RANDOM_PITCH"]			= "Pitch aléatoire lorsqu'un Taunt est joué"
L["PHX_RTAUNT_USE_PITCH"]			= "Utiliser le pitch pour les Taunts personnalisés [%s]"
L["PHX_RTAUNT_RANDOMIZE"]			= "Pitch aléatoire lorsqu'un Taunt aléatoire est joué [%s]"
L["PHX_CTAUNT_PITCH_FOR_FAKE"]		= "Utiliser le pitch pour les faux Taunts"
L["PHX_CTAUNT_RANDPITCH_FOR_FAKE"]	= "Pitch aléatoire lorsqu'un faux Taunt est joué"
L["PHX_CTAUNT_SLIDER_PITCH"]			= "Slider du pitch des Taunts."
L["TM_TOOLTIP_FAKETAUNT"]			= "Jouer un faux Taunt sur un Prop aléatoire"
L["TM_PREFERRED_PITCH"]              = "Niveau de pitch des Taunts préférés"

--[[
	Fake Taunt, Revision 10.06/2022/X2Z
	Description: Play fake taunts on random props in the map (Not Players)
]]--
L["PHX_CTAUNT_ON_RAND_PROPS"]		= "Jouez des faux Taunts sur des Props aléatoires (%ix)"
L["PHX_CTAUNT_ON_RAND_PROPS_UNLI"]	= "Jouez des faux Taunts sur des Props aléatoires"
L["PHX_CTAUNT_PLAYED_ON_RANDPROP"]	= "Vous avez utilisé un Taunt sur un Prop aléatoire."
L["PHX_CTAUNT_RAND_PROPS_LIMIT"]		= "Vous avez dépassé la limite!"
L["PHX_CTAUNT_RAND_PROPS_NOT_PROP"]  = "Non disponible pour le moment."
L["PHX_CTAUNT_RANDPROP_DISABLED"]	= "Les Faux Taunts sont actuellement désactivé."

--[[
	PH:Z Simple Decoy, Revision 10.06/2022/X2Z
]]--
L.DECOY_PROP	= {
	"a tué un joli leurre!",
	"s'est senti en regret après avoir tué un leurre.",
	"a tué un leurre.",
	"a tué un leurre innocent.",
	"s'est senti triste après avoir tué un leurre."
}

L["DECOY_PUT_SUCC"]					= "Leurre posé avec succès"
L["DECOY_CANT_PUT_HERE"]				= "Impossible de poser un leurre ici."
L["DECOY_GET_REWARD"]				= "Bravo! Vous avez reçu un ['Leurre'] pour avoir survécu pendant cette manche!"
L["DECOY_REMINDER_GET"]              = "Vous avez un leurre! Placez le pour porter à confusion les Hunters"
L["DECOY_FRAGS_RECEIVED"]			= "Leurre appâté avec succès: Vous avez volé 1 score de %s!"
L["DECOY_DISABLED"]					= "Leurre non disponible pour le moment."
L["PHXM_CL_DECOY_KEYBIND"]			= "Touche par défaut pour déposer un leurre. 1 (&) par défaut (au dessus du A)."

L["DECOY_INDICATOR_INVALID"]         = "Position Invalide!"
L["DECOY_INDICATOR_TOOFAR"]          = "Portée trop loin!"
L["DECOY_INDICATOR_OK"]              = "Poser le leurre [Appuyez %s]"

L["PHXM_DECOY_HEALTH"]				= "Combien de points de vie pour un leurre. 10 par défaut."
L["PHXM_PLAYER_SHOW_DECOY_HELPER"]   = "Montrer/Cacher l'aide au placement des leurres? Cela vous montrera un point blanc dans votre crosshair avec un texte."
L["PHXM_PLAYER_SHOW_DECOY_MARKER"]   = "Montrer/Cacher le marqueur des leurres?"

--[[
	Revision 10.06/2022/X2Z
    Prop Menu Update: Menu, Editor, Browser
]]--
L["PCR_MODEL_DONT_EXISTS"]   = "Désolé,ce Model n'est pas disponible pour le moment."

L["PCR_PLUG_WARN_MSG"]		= "Attenetion: Custom Prop Addition (pcr_allow_custom) est mis sur 0.\nVous devez activer cette fonctionnalité en premier pour éditer vos propres Props!\nUn changement de map est requis pour appliquer la fonctionnalité."
L["PCR_PLUG_LBL_BINDKEY"]	= "Pour changer le bin de la touche, basculer sur l'onglet TAB."
L["PCR_PLUG_LBL_EDITOR"]		= "Éditeur de Props"
L["PCR_PLUG_BTN_OPEN_EDT"]	= "Ouvrir l'éditeur"
L["PCR_PLUG_LBL_COMSET"]		= "Parmètres courants"
L["PCR_PLUG_LBL_TECHSET"]	= "Paramètres techniques"
L["PCR_PLUG_LBL_EXPSET"]		= "Paramètres expérimentés"
L["PCR_PLUG_LBL_PLAYERSET"]	= "Paramètres du joueur"

L["PCR_PLUG_ENABLE"]			= "Activer la fonction 'Prop Menu'"
L["PCR_PLUG_ALLOW_CUSTOM"]	= "(Redémarrage de la Map requis) Autoriser les Props personnalisés dans la liste?"
L["PCR_PLUG_PROP_BAN"]		= "(Redémarrage de la Map requis) Ne pas inclure les Props bannis dans la liste?"
L["PCR_PLUG_USAGE_LIMIT"]	= "Utilisation maximum du Prop Menu par joueur. -1 signifie Illimité."
L["PCR_PLUG_PROP_LIMIT"]		= "(Redémarrage de la Map requis) Limite autorisé dans la liste Prop Menu"
L["PCR_PLUG_PROP_LIMITMAX"]	= "Maximum de Props possible a ajouter dans la liste. Note: Cela sera rajouté au hasard!"
L["PCR_PLUG_USE_ULXMENU"]	= "Le Prop Menu est-il accesible par la Console (0) ou ULX (1)?"
L["PCR_PLUG_USE_DELAY"]		= "Délai en secondes pour utiliser un autre Prop de la liste "
L["PCR_PLUG_KICK_INVALID"]	= "Kick un joueur qui tente de prendre un Prop invalide (Maximum 4 fois)"
L["PCR_PLUG_SPACE_CHECK"]	= "Vérifier l'espace possible d'un joueur avant de choisir un Prop avant de rester bloqué"
L["PCR_PLUG_X_BBOX"]			= "(Redémarrage de la Map requis) Vérifier la limite BBox  de l'entité avant de l'ajouter dans la liste"
L["PCR_PLUG_X_BBOX_MAX"]		= "BBox CollisionBound Taille limite maximale. Auto-calculé en général."
L["PCR_PLUG_X_BBOX_MIN"]		= "BBox CollisionBound Largeur limite maximale. Auto-calculé en général."
L["PCR_PLUG_ONLY_GROUPS"]	= "Le Prop Menu est-il accesible uniquement par certains groupes? Exemple : Donateur, Admin, VIP?"
L["PCR_PLUG_NOTIFYMSG"]		= "Notifier le joueur pour expliquer comment utiliser le Prop Menu à chaque début de manche"

L["PCR_EDITOR_MSG_ERROR"]	= "Vos changements n'ont pas été sauvegardés dû au erreurs.\nRegarder la console du serveur!"
L["PCR_EDITOR_MSG_SUCC"]		= "Vos changements et vos données des Props personnalisés ont été sauvegardés avec succès."

L["PHZ_generic_title"]		= "Éditeur de Props"
L["PHZ_generic_helptext"]	= [[[Comment l'utiliser:
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
L["PHZ_generic_mdlinfo"] = [[Model Info:
%s
Has Physics: %s]]
L["PHZ_generic_mdlinfoStart"] = "(Sélectionner d'abord un modèle!)"

L["PHZ_generic_no_ragdoll"]	= "No: Ragdoll"
L["PHZ_generic_titlelabel"]	= "%s Prévisualisation :"

L["PHZ_mount_game_sel"]		= "Sélectionner le jeu monté (Par défaut: Garry's Mod)"
L["PHZ_input_placeholder1"]	= "Recherche de Dossiers: <folder name> ou '*', laisser vide pour tout voir."
L["PHZ_input_placeholder2"]  = "Recherche d'Addons: <name> ou '*', laisser vide pour tout voir."
L["PHZ_msg_warn_close"]		= "Voulez vous vraiment fermer cette fênetre? Any unsaved edits will be lost!"
L["PHZ_msg_commit"] 			= "Voulez vous vraiment appliquer ces changements?"
L["PHZ_msg_cant_empty"]		= "La liste des Props ne peux être vide!"
L["PHZ_msg_removesel"] 		= [[Retrait des Props sélectionnés de la liste. Légendes:
Rouge = Sélections marquées
Jaune: Props non existant sur le serveur ET seront retirés.]]
L["PHZ_msg_warn_mdlinlist"]  = "ATTENTION: Ce modèle est déja dans la liste!"
L["PHZ_msg_invalid_mdl"] 	= "Raison : Modèle invalide"
L["PHZ_apply_select"] 		= "Appliquer les sélections"
L["PHZ_menu_copy"] 		= "Copier le Modèle"
L["PHZ_menu_refresh"] 	= "Rafraichir le Modèle"
L["PHZ_tooltip_removesel"]	= "Supprimer la sélection"
L["PHZ_tooltip_wasmarked"] = [[Ce modèle a été marqué car il n'existe pas sur le serveur.
Si vous fermez l'éditeur, il sera retiré automatiquement.]]

L["PHZ_pcr_fb_allcontent"] = "Tout le contenu (Tout les Serveurs/Joueurs n'ont pas le même contenu que vous)"
L["PHZ_pcr_fb_notmounted"] = "%s [!N'est pas monté]"

-- Revision 25-27/08/2022
L["PHX_ADMIN_ACCESS_ONLY"]		= "Accès refusé: seul les Admins peuvent y accéder, %s !"
L["PHX_PROP_TOO_THIN"]           = "Impossible de répliquer: ce Prop est trop fin!"
L["PHX_PROP_IS_BANNED"]			= "Le Prop que vous essayez d'utiliser est banni du serveur"
L["PHX_SPECT_JOINGAME"]			= "Pour rejoindre la partie, appuyez sur [F2] puis sélectionnez une équipe à rejoindre."
L["PHX_TEAM_IS_FULL"]			= "Cette équipe est pleine!"
L["FORCE_JOIN_TEAM_IS_DISABLED"]	= "L'équilibrage de l'équipe est désactivé (le mélange/rotation de l'équipe est activé)"

L["PHX_TM_MNBAR_OPTIONS"]		= "Options"
L["PHX_TM_MNBAR_SAVEFAV"]		= "Sauvergarder les Favoris"
L["PHX_TM_MNBAR_LOADFAV"]		= "Recharger les Favoris"
L["PHX_TM_MNBAR_SETTINGS"]		= "Autres"
L["PHX_TM_MNBAR_RESET"]			= "Réinitialiser les Favoris"

L["PHX_TM_WARN_CLEARFAV"]		= "AVERTISSEMENT : cela EFFACERA TOUT vos taunts préférées précédemment enregistrées. Etes-vous sur de vouloir continuer?"

L["PHXM_BANNED_MODELS"]			= "Interdire/Autoriser l'utilisation des Props restreints (Props interdits). Cela n'inclut pas les Props interdits (ils sont toujours supprimés)."
L["PHXM_ADMIN_ALLOWARMOR"]       = "Autoriser l'ajout d'armure pour les Hunters et les Props"
L["PHXM_ADMIN_ALLOW3P"]          = "Autoriser le mode Troisième personne pour les Hunters"
L["PHXM_ADMIN_ALLOW3P_SVDESIRED"]= "Autoriser le mode Troisième personne à utiliser la position de caméra souhaitée du serveur (interdire la position personnalisée du joueur)"
L["PHXM_ADMIN_ALLOW3P_DIST"]     = "Troisième personne: Distance de la caméra souhaité"
L["PHXM_ADMIN_ALLOW3P_RIGHT"]    = "Troisième personne: Position droite de la caméra souhaité"
L["PHXM_ADMIN_ALLOW3P_UP"]     	= "Troisième personne: Position haute de la caméra souhaité"
L["PHXM_ADMIN_JUMPPOWER_H"]		= "Puissance de saut supplémentaire pour les Hunters"
L["PHXM_ADMIN_MDLCOLOR_PROP"]	= "Activer la couleur du joueur pour les Props (nécessite l'activation des playermodels pour Props)"
L["PHXM_ADMIN_MDLCOLOR_HUNTER"]	= "Activer la couleur du joueur pour les Hunters (nécessite l'activation des playermodels pour Hunters)"
L["PHXM_ADMIN_PITCH_ROTATION"]	= "[Experimental] Autoriser la rotation des Props. Cela peux causer des bugs."
L["PHXM_ADMIN_FALLDMG"]			= "Activer les dégats de chute (Pour les deux équipes)"
L["PHXM_ADMIN_FALLDMG_REAL"]		= "Activer les dégâts de chute 'Réaliste'"
L["PHXM_INFORM_TO_JOIN"]			= "Informez les non-assignés/spectateurs avec des conseils textuels statiques pour rejoindre la partie."
L["PHXM_ADMIN_PROPOFFSET"]		= "Soustraire/Ajouter la hauteur de décalage de la vue des Props. Min: 0.6, Max: 1.2. Par défaut: 0.8."
L["PHXM_ADMIN_REPL_MUST_STAND"]	= "[Experimental] Limiter la réplication des Props uniquement lorsqu'ils sont debout. Désactivez cette option pour permettre la réplication pendant un saut ou quand vous êtes accroupi."

L["PHXM_DROP_VBS_DISABLE"]       = "Désactiver Verbose"
L["PHXM_DROP_VBS_ENABLE"]        = "Activer Verbose"
L["PHXM_DROP_MDL_INCLUDEALL"]    = "Tout inclure ( %d )"
L["PHXM_DROP_MDL_CUSTOMLIST"]    = "Liste séparé/personnalisée ( %d )"
L["PHXM_DROP_MDLTYPE_PROP"]      = "Prop_physics uniquement ( %d )"
L["PHXM_DROP_MDLTYPE_PROPDYN"]   = "Prop_physics et prop_dynamic ( %d )"
L["PHXM_DROP_MDLTYPE_ANYENTS"]   = "Toute les entités compatibles ( %d )"
L["PHXM_DROP_MDLTYPE_CUSTOM"]    = "Entités personnalisées ( %d )"
L["PHXM_DROP_RESPAWNBLIND_BOTH"] = "Les deux équipes"

L["PHXM_TAB_ADMINGROUPS"]        = "Option d'accès aux groupes et admins"
L["PHXM_TAB_PHEPLUS"]			= "Paramètres Enhanced Plus"

L["PHXM_ADMIN_ACCESS_GROUP"]     = "Sélectionner les groupes qui peuvent avoir accès au PH:X Admin Settings, Enhanced Plus et la page Plugins."
L["PHXM_ADMIN_ACCESS_GROUP_HINT"] = "SVP, les \"superadmins\" ne peuvent pas être revoqué."
L["PHXM_ADMIN_ACCESS_GROUP_NOULX"] = "Error: ULib & ULX ne sont pas installés sur le serveur."
L["PHXM_ADMIN_ACCESS_NOREVOKE"]  = " (Ne peux pas être révoqué)"
L["PHXM_ADMIN_GROUP_WHOCANACC"]	= "Sélectionner les groupes qui peuvent avoir accès [Admin Settings]."
L["PHXM_ADMIN_GROUP_MUTEABLE"]	= "Sélectionner les groupes qui peuvent être refusé a être muté dans [Player Muting])."

L["PHXM_ADMIN_ACCESS_CHATINFO"]  = "Il y a eu une mise à jour de la configuration de la fenêtre Prop Hunt Menu. Réouverture..."
L["PHXM_ADMIN_ACCMSG_BODY"]      = "Voulez-vous enregistrer la sélection et procéder aux modifications ? Veuillez noter que tous les groupes précédents que vous avez révoqués n'auront plus l'accès. Cela redémarrera le menu Prop Hunt s'ils sont toujours ouverts."
L["PHXM_ADMIN_ACCMSG_TITLE"]     = "Appliquer les groupes d'accès"
L["PHXM_ADMIN_ACCCFG_SUCC"]      = "L'accès des groupes a bien été enregistré."
L["PHXM_ADMIN_ACCCFG_FAIL"]      = "Une erreur s'est produite lors de l'enregistrement des données d'accès de groupe. Vérifiez la console de votre serveur !"
L["PHXM_ADMIN_MUTCFG_SUCC"]      = "L'accès des groupes anti-mute a bien été enregistré."
L["PHXM_ADMIN_MUTCFG_FAIL"]      = "Une erreur s'est produite lors de l'enregistrement des données d'accès de groupe anti-mute. Vérifiez la console de votre serveur !"

L["PHXM_ADMIN_ACCESS_APPLY"]     = "Appliquer les groupes sélectionnés"

-- PHE/Plus
L["PHXM_ADMIN_PLUSSETTING"]		= "Paramètres Plus+"
L["PHXM_PLUSSETTING_HINT"]		= "Configurer l'équilibrage des équipes ou autres paramètres additionnels."
L["PHXM_HEADER_UNSTUCK"]			= "Paramètres Unstuck"
L["PHXM_HEADER_TEAMSETTING"]		= "Plus de paramètres d'équipe"

L["LIST_PLAYER"]					= "Joueurs"
L["LIST_FORCEDASPROP"]			= "Forcé a être un Prop"
L["LIST_MARKEDASPROP"]			= "MArqué comme forcé a être un Prop"
L["LIST_NOHUNTERS"]				= "Aucun Hunters est entrain de jouer."

L["PHXM_PLUS_MSG_NO_HUNTERS"]	= "Il y a aucun Hunters a reinitialiser."

L["PHXM_PLUS_BTNRESET"]			= "Effacer les sélections (et tout reinitialiser)"
L["PHXM_PLUS_LISTTIPS"]			= "Note: Double Clic pour forcer un joueur a être un Prop."

L["PHXM_ADMIN_ENABLEUNSTUCK"]		= "Activer/désactiver la fonction de déblocage intégrée. Si vous utilisez un addon, désactivez-le."
L["PHXM_ADMIN_NOTPUNSTUCKINROUND"]	= "Désactiver les téléportations débloquées de dernier recours vers les points d'apparition en dehors de la phase de dissimulation" --ph_disabletpunstuckinround
L["PHXM_ADMIN_UNSTUCK_WAITTIME"]		= "Combien de secondes doivent s'écouler entre chaque tentative de déblocage" --ph_unstuck_waittime
L["PHXM_ADMIN_TEAMBAL_ORIG"] 		= "Utiliser l'équilibrage automatique PH:X (désactive toutes les options suivantes liées à l'équipe ci-dessous)" --ph_originalteambalance
L["PHXM_ADMIN_FORCESPECTOPLAY"]		= "Forcer les spectateurs à jouer en les incluant lors de l'équilibrage des équipes" --ph_forcespectatorstoplay
L["PHXM_ADMIN_NO_H_CONSECUTIVE"]		= "Empêcher les joueurs d'être un Hunter deux fois de suite (ne fonctionne qu'en mode aléatoire)" --ph_preventconsecutivehunting
L["PHXM_ADMIN_HUNTER_COUNT"] 		= "Nombre de Hunters (0 = automatic)" --ph_huntercount
L["PHXM_ADMIN_ROTATETEAM"] 			= "Désactiver le mode aléatoire et faire pivoter les joueurs à la place" --ph_rotateteams
L["PHXM_ADMIN_RESET_ROTTEAM"] 		= "Réinitialiser les rotations" --ResetRotateTeams
L["PHXM_ADMIN_RESET_ROTTEAM_WARN"]	= "Recommencer les rotations depuis le début (au cas où vous les auriez commencées, arrêtées, puis recommencées et que la rotation en cours ne vous satisfait pas):" --ResetRotateTeams_warning
L["PHXM_ADMIN_RESET_MSG"]			= "La rotation des équipes a été reinitialisé"
L["PHXM_ADMIN_FORCEH2P_WARN"]		= "Forcer un Hunter a être un Prop au prochain round (n fonctionne qu'en mode aléatoire):" --ForceHunterAsProp_warning
L["PHXM_ADMIN_FORCEH2P_RANDONLY"]	= "Cette action est disponible seulement en mode aléatoire" --ForceHunterAsProp_randomonly

L["FORCEH2P_WILL_BE"]				= "%s sera un Prop au prochain round."
L["FORCEH2P_IS_CANCELED"]			= "%s ne sera pas un Prop au prochain round."
L["FORCEH2P_IS_RESET"]				= "Tout les Hunters ne seront pas forcé a être un Prop au prochin round."
L["FORCEH2P_PLAYER_NOT_FOUND"]		= "Le joueur sélectionné n'a pas été trouvé, probable qu'il soit déconnecté."
L["PHX_ROTATE_TEAM_RESET"]			= "Le décalage de la rotation du Prop a été réinitialisé."

L["UNSTUCK_YOURE_UNSTUCK"]			= "Vous êtes décoincé!"
L["UNSTUCK_BAD_SPAWNPOINT"]			= "Erreur: Le point d'apparition le plus proche pourrait vous coincer à nouveau. Si c'est le cas, essayez à nouveau."
L["UNSTUCK_RESCUE_SPAWNPOINT"]		= "Ce point d'apparition est extrêmement proche, possible d'être toujours bloqué. Essayez à nouveau unstuck si vous l'êtes."
L["UNSTUCK_NO_SPAWNPOINTS"]			= "Pour des raisons inconnues, aucun point d'apparition n'a pu être trouvé. En tant que stratégie de sauvegarde, vous serez téléporté à (0, 0, 0). Il y a de fortes chances que vous soyez bloqué, alors si c'est le cas, essayez à nouveau de vous débloquer."
L["UNSTUCK_PLEASE_WAIT"]				= "SVP veuillez attendre %d secondes entre chaque unstuck utilisé"
L["UNSTUCK_NOT_ON_GROUND"] 			= "Pas au sol, vérification..."
L["UNSTUCK_NOT_STUCK_JITTER"]		= "Vous n'êtes pas coincé. Si vous l'êtes vraiment, attendez que votre Prop ne bouge plus/scintille (essayez d'appuyer sur ALT) puis réessayez."
L["UNSTUCK_NOT_STUCK_TOOBAD"]		= "Vous n'êtes pas coincé. Si vous l'êtes vraiment, désolé, vous devrez attendre la fin du round."
L["UNSTUCK_CANNOT_FIND_SPOT"]		= "Impossible de trouver un endroit où vous déplacer, téléportation au point d'apparition le plus proche."
L["UNSTUCK_SPAWNPOINTS_DISABLED"]	= "Vous alliez être téléporté vers un point d'apparition proche, mais ce serveur l'interdit en dehors de la période des Hunters aveuglé. Pardon!"
-- End of PHE/Plus

L["MISC_SEL_APPLY"]  = "Aplliquer les sélections"
L["MISC_RESET_SEL"]  = "Réinitialiser les séléctions"
L["MISC_RESET"]      = "Réinitialiser"
L["MISC_CANCEL"]     = "Retour"
L["MISC_SEL_ALL"]    = "Tout séléctionner"
L["MISC_SEL_NONE"]   = "Désélectionner"

L["PHXM_CL_THIRDPERSON"]     = "Touche pour activer la Troisième personne"
L["PHXM_CL_UNSTUCK"]			= "Touche pour !unstuck"
L["CL_THIRDPERSON_ENABLED"]  = "Troisème personne Activé"
L["CL_THIRDPERSON_DISABLED"] = "Troisème personne Désactivé"

L["PHX_TP_ADJUSTVIEW_BTN"]	= "Ajuster la vue Mode Troisème personnne" --Button, as well as window title.
L["PHX_TPS_ADJ_TITLE"]		= "Alerte Mode Troisième personne"
L["PHX_TPS_ADJ_SVDESIRED"]	= "Mode Troisième personne personnalisé désactivé: Configuration du serveur utilisé."
L["PHX_TPS_ADJ_3PDIS"]		= "Mode Troisième personne est désactivé."
L["PHX_TPS_ADJ_BLIND"]		= "Tu es aveuglé. Une prochaine fois."
L["PHX_TPS_ADJ_NEEDALIVE"]	= "Il  faut être vivant dans l'équipe Hunters pour pouvoir faire cela."

L["ANG_AXIS_DIST"]	= "Distance" -- or Forward
L["ANG_AXIS_RIGHT"]	= "Droite (Right)"
L["ANG_AXIS_UP"]		= "Haut (Up)"
L["VEC_POS_LEFT"]	= "Gauche (Left)" --X
L["VEC_POS_FRONT"]	= "Face (Front)" --Y?
L["VEC_POS_TOP"]		= "Dessus (Top)"  --Z

-- Key Hints
L["KEYHINT_HUNTER3P"] 	= "Troisième personne"
L["KEYHINT_SHOOT"]		= "Tirer"
L["KEYHINT_SEC"]			= "Tir secondaire"
L["KEYHINT_PICKUP"]		= "Prendre un Prop/Intéragir"

L["KEYHINT_LMB"]			= "Répliquer le Prop"
L["KEYHINT_RMB"]			= "Taunt/Capacité Spéciale"
L["KEYHINT_RANDTAUNT"] 	= "Taunt aléatoire"
L["KEYHINT_TAUNTMENU"] 	= "Ouvrir le menu des Taunts"
L["KEYHINT_ROTATION"] 	= "Bloquer la rotation du Prop"
L["KEYHINT_PROPMENU"] 	= "Ouvrir le menu Propchooser"
L["KEYHINT_FREEZEAIR"] 	= "Freeze son prop dans les airs"
L["KEYHINT_SPAWNDECOY"] 	= "Poser un leurre"
L["KEYHINT_UNSTUCK"]		= "Touche Unstuck"

L["KEY_LMB"]				= "LMB" -- Clic gauche , version courte
L["KEY_RMB"]				= "RMB" -- Clic droit , version courte

L["MISC_TEAM_NAME"]		= "TEAM: %s" -- EQUIPE PROPS, EQUIPE HUNTERS.
L["NOTIFY_HEADER_TITLE"]	= "Configuration des touches"

-- Revision 14/09/2022
L["PHXM_MV_CHANGEMAP_NOPLAYER"]	= "Force change the map after there are no players in the server?"

L["KEY_MIDCLICK"]		= "MMB"

L["LD_MIDCLICK"]			= "MIDDLE CLICK"
L["LD_RIGHTCLICK"]		= "RIGHT CLICK"
L["LD_PRESS2SHOOT"]		= "Press [%s] to shoot %s!"

PHX.LANGUAGES[L.code] = L
