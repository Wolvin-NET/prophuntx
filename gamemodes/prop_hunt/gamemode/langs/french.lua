-- Thank you from TR1NITY and Haeiven for the contribution!

local LANG = {}

LANG.code = "fr"

LANG.Name 		 	= "Français"
LANG.NameEnglish	= "French"
LANG.Author			= "TR1NITY, Haeiven" -- Only accept STRINGS.
-- Can Accept: String, and Table.
LANG.AuthorURL		= { "https://steamcommunity.com/profiles/76561198260731850", "https://steamcommunity.com/profiles/76561198047814125" }

-- Special Section that isn't String-based
LANG.SUICIDEMSG = {
	"s'est suicidé !",
	"est mort mystérieusement.",
	"est mort par la magie.",
	"s'est no-scop lui même.",
	"a simplement ragequit.",
	"a trop picolé.",
	"est mort... il aura plus de chance la prochaine fois !",
	"s'est giflé.",
	"a trébuché sur un bâton.",
	"est mort par la force.",
	"ragdolled.",
}

LANG.RANDOM_SPECTATORS = {
	"pour regarder et se détendre.",
	"pour les voir traîner dans le coin.",
	"pour voir des choses.",
	"",
}

-- List of string-based translation

LANG["HELP_F1"] 			= [[
Un projet de Prop Hunt (Nom de code) X.

Un projet pour rendre Prop Hunt X moderne et personnalisable.

Plus d'informations peuvent être trouvées sur:
https://www.wolvindra.net/prophuntx

Pour voir plus d'informations, d'aide et de guide, appuyez sur la touche [F1] puis cliquez sur le bouton [Prop Hunt Menu].

Version: ]].. PHX.VERSION ..[[ Revision: ]].. PHX.REVISION ..[[

Traduit par TR1NITY !

Amusez-vous bien !
]]

--// FRETTA SECTION \\--
LANG["HUD_KILLED"]			= "a tué"

-- FRETTA: HUDs
LANG["HUD_TIME"] 			= "TEMPS"
LANG["HUD_ROUND"]			= "MANCHE"
LANG["HUD_WAITPLY"]			= "En attente de joueurs..."
LANG["HUD_DEAD"]			= "(MORT) "

LANG["HUD_TEAMWIN"]			= "Les %s ont gagnés !"
LANG["HUD_LOSE"]			= "Egalité !"
LANG["MISC_TIMELEFT"]		= "Temps Restant: %s"
LANG["MISC_GAMEEND"] 		= "La partie va se terminer après cette manche"

-- FRETTA: Team selection screen (F2)
LANG["DERMA_TEAMSELECT"]	= "Choisir une équipe"

-- FRETTA: F1 screeen
LANG["DERMA_RTV"] 			= "Voter pour changer la map"
LANG["DERMA_PHMENU"] 		= "Menu Prop Hunt"
LANG["DERMA_CHANGETEAM"]	= "Changer d'équipe"

-- FRETTA: Scoreboard
LANG["DERMA_PLAYER"]		= "(%d joueur)"
LANG["DERMA_PLAYERS"]		= "(%d joueurs)"
LANG["DERMA_NAME"]			= "Pseudo"
LANG["DERMA_KILLS"]			= "Kills"
LANG["DERMA_DEATHS"]		= "Mort"
LANG["DERMA_PING"]			= "Ping"

LANG["CHAT_JOINED"]			= " a rejoint "
LANG["CHAT_JOINEDTHE"]		= " a rejoint les "

LANG["CHAT_SWAPBALANCE"]		= "%s a été remplacé par %s pour l'équilibre de l'équipe."
LANG["CHAT_SWAPBALANCEYOU"]		= "Vous avez été échangé pour atteindre un équilibre parfait."
--\\ END OF FRETTA SECTION //--

LANG["LANGUAGE_CHANGED"]		= "La langue préférée a été remplacée par %s"

-- internal cl_menutypes section.
LANG["SUBTYPE_PREFERED_LANG"]	= "Langue préférée"
--LANG["SUBTYPE_TEXTENTRY_?"]	= "???"

-- Events
LANG["EV_PLAYER_CONNECT"]	= "%s s'est connecté au serveur."
LANG["EV_PLAYER_JOINED"]	= "%s a rejoint le serveur."
LANG["EV_PLAYER_DISCONNECT"] = "%s s'est déconnecté du serveur (Raison: %s)."

-- HUD elements
LANG["HUD_HP"]					= "SANTÉ"
LANG["HUD_AMMO"] 				= "MUNITIONS" 	--Sorry, this no longer used :(
LANG["HUD_MAGSEC"]				= "MAG. / SEC."  --"Magazine Counts" (separator) "Secondary Magazine Counts"

-- !!WEAPON NAMES CANNOT BE TRANSLATED, THEY USE FROM language.GetPhrase THEREFORE IT'S IMPOSSIBLE TO DO.

LANG["TEAM_PROPS"]				= "Props"
LANG["TEAM_HUNTERS"]			= "Chasseurs"

LANG["HUD_ROTLOCK"]			= "Rotation du Prop: Bloquée"
LANG["HUD_ROTFREE"]			= "Rotation du Prop: Libre"
LANG["HUD_KILLEDBY"]		= "Vous avez été tué par %s"

LANG["HUD_BLINDED"]			= "Les chasseurs seront libérez dans %s"
LANG["HUD_UNBLINDED"]		= "Prêt ou non, nous arrivons !"

LANG["HUD_AUTOTAUNT"]			= "Auto Taunt dans %d seconde(s)"
LANG["HUD_AUTOTAUNT_ALT"]		= "Auto Taunt dans %d"

LANG["HUD_TargetID"]			= "Joueur: %s (%d%%)" -- Player: <NAME> (<HEALTH>%)

LANG["BLIND_RESPAWN_TEAM"]	= "Vous avez réapparu uniquement sur l'équipe %s en %d secondes pendant le temps aveugle." 
LANG["BLIND_RESPAWN"]		= "Vous avez réapparu en %d secondes pendant le temps aveugle." 

LANG["MISC_ACCEPT"]			= "Accepter"
LANG["MISC_OK"]				= "OK" 
LANG["MISC_CLOSE"]			= "Fermer"
LANG["MISC_PREV"]			= "< PRECEDENT"	  
LANG["MISC_NEXT"]			= "SUIVANT >"		  
LANG["MISC_ACCESSDENIED"]	= "Accès refusé"

-- Chat messages
LANG["CHAT_NOPLAYERS"]		= "Il n'y a pas assez de joueurs pour commencer une partie !"
LANG["CHAT_SWAP"]			= "Les équipes ont été échangées !"

LANG["CHAT_SWAPTEAM_WARNING"]   = "Vous avez changé d'équipe %dx (%dx MAX). Après cela, vous ne pouvez plus passer à l'équipe opposée."
LANG["CHAT_SWAPTEAM_REVERT"]	= "Impossible de basculer vers l'équipe %s car vous avez dépassé le nombre de changements d'équipe."

LANG["CHAT_PROP_NO_ROOM"] 		= "Il n'y a pas de place à changer pour ce props !"

-- Notification
LANG["NOTIFY_IN_PROP_TEAM"]		= "Vous êtes dans l'équipe Props ! Vous pouvez faire pivoter la rotation du props en déplaçant votre souris."
LANG["NOTIFY_ROTATE_NOTICE"]	= "De plus, vous pouvez activer / désactiver la rotation de verrouillage en appuyant (par défaut) sur la touche [R] !"

-- Custom Taunt Window
LANG["TM_WARNING_CT_DISABLE"]	= "[PHX - Taunts] Avertissement: Ce serveur a désactivé les taunts personnalisés !" 
LANG["TM_NO_TAUNTS"]			= "Attention: aucun taunts n'a été détectée dans cette catégorie." 
LANG["TM_PLAY_ONLY_ALIVE"] 		= "Vous n'êtes autorisé à jouer des taunts que lorsque vous êtes en vie." 

LANG["TM_WINDOW_TITLE"]			= "Prop Hunt Custom Taunt" 
LANG["TM_NOTICE_PLSWAIT"]		= "Veuillez patienter %s seconde(s) !" 
LANG["TM_NOTICE_PLAYPREVIEW"]	= "Aperçu du Taunt: %s" 

LANG["TM_TOOLTIP_PLAYTAUNT"] 	= "Jouer le Taunt" 
LANG["TM_TOOLTIP_PREVIEW"]		= "Ecouter le Taunt" 
LANG["TM_TOOLTIP_PLAYCLOSE"]	= "Jouer le Taunt et fermer" 
LANG["TM_TOOLTIP_PLAYRANDOM"]	= "Jouer un Taunt aléatoire" 
LANG["TM_TOOLTIP_CLOSE"]		= "Fermer" 
LANG["TM_MENU_CLOSE"]			= "Fermer le menu" 

LANG["TM_DELAYTAUNT_NOT_EXIST"] = "Le Taunt que vous avez sélectionnée n'a pas été trouvée sur le serveur!" 
LANG["TM_DELAYTAUNT_PLSWAIT"]	= "Veuillez patienter %s seconde(s) !" 

--[[
	PHX Menu window
]]
LANG["PHXM_WINDOW_TITLE"]		= "Prop Hunt X - Paramètres avancés et menu" 
LANG["SERVER_INFO_MOTD"]		= "INFORMATIONS ET RÈGLES SUR LE SERVEUR [MOTD]" 

LANG["PHXM_TAB_HELP"]			= "Aide et Guides"
LANG["PHXM_TAB_MUTE"]			= "Mute"
LANG["PHXM_TAB_PLAYER"]			= "Joueur"
LANG["PHXM_TAB_MODEL"] 			= "Modèles de joueurs"
LANG["PHXM_TAB_MODEL_DISABLED"]	= "Modèles de joueurs (désactivé)"
LANG["PHXM_TAB_ADMIN"]			= "Administration"
LANG["PHXM_TAB_ABOUT"]			= "A propos de Prop Hunt X"
LANG["PHXM_TAB_MAPVOTE"]		= "Paramètres de votes des maps"

LANG["PHXM_CVAR_CHANGED"]		= "[Paramètres] CVar %q a été changé en %q" 

--[[
	Player Mute Settings
]]
LANG["PHXM_MUTE_SELECT"]		= "Sélectionne un joueur que tu veux rendre muet."

LANG["PHXM_PLAYER_OPTIONS"]		= "Options du joueur"
LANG["PHXM_PLAYER_LANG"]		= "Langues"	
LANG["PHXM_PLAYER_BIND"]		= "Binds"		
LANG["PHXM_PLAYER_HUDSETTINGS"]	= "Paramètres HUD" 

LANG["PHXM_PLAYER_TAUNT_KEY"]			= "Bouton pour jouer un Taunt aléatoire"
LANG["PHXM_PLAYER_TAUNTWINDOW_KEY"]		= "Touche Taunt Menu"		
LANG["PHXM_PLAYER_ROTATLOCK_KEY"]		= "Touche Rotation"	

LANG["PHXM_PLAYER_TOGGLE_HALOS"]			= "Activer l'effet Halo lors du choix d'un Prop"
LANG["PHXM_PLAYER_IDNAMES"]					= "Voir l'équipe du joueur au dessus de la tête (apparaît à travers les murs)"
LANG["PHXM_PLAYER_ENDROUND_CUE"]			= "Jouer la musique à la fin de la manche"
LANG["PHXM_PLAYER_TAUNTMENU_AUTOCLOSE"]		= "Fermer automatiquement le menu des taunts lors d'un double clic"
LANG["PHXM_PLAYER_SEE_HUNTER_LINE"]			= "Afficher la ligne aim des chasseurs en spectateur"
LANG["PHXM_PLAYER_SEE_LBALL_ICONS"]			= "Activer les icones 'Lucky ball'"
LANG["PHXM_PLAYER_SEE_CRYSTAL_ICONS"]		= "Activer les icones 'Devil ball'"

LANG["PHXM_PLAYER_USE_NEW_HUD"]				= "Utiliser le nouveau HUD PH: Enhanced"
LANG["PHXM_PLAYER_SHOW_TUTOR"]				= "Afficher le tutoriel (Apparaît 2x à chaque apparition en Prop)"
LANG["PHXM_PLAYER_USE_NEW_CROSSHAIR"]		= "Activer le Crosshair customisé"
LANG["PHXM_PLAYER_SHOW_TEAM_TOPBAR"]		= "Afficher le nombre total de joueurs de l'équipe en vie (4 joueurs minimum)"

--[[
	Player model Browser Section:
]]
LANG["QUERY_MODEL_SELECTED"]		= "Le modèle %s a été sélectionné et il sera appliqué après la réapparition !" 
LANG["QUERY_MODEL_INFO"]			= "Nom du modèle: %s - Disponible pour : tout le monde" 

LANG["MDL_MENU_REFRESH"] 			= "Icône Actualiser" 
LANG["MDL_MENU_PREVIEW"] 			= "Aperçu du modèle" 
LANG["MDL_MENU_MODELINFO"] 			= "Informations sur le modèle" 


LANG["MISC_APPLYMDL"] 				= "Appliquer le modèle" 

LANG["PHXM_MODEL_DISABLED"] 		= "Les skins customisés sont désactivés sur le serveur !"
LANG["PHXM_PLAYERMODEL_SETFOV"]		= "Définir le FOV des skins"

--[[
	Server Settings
]]
LANG["PHXM_ADMIN_OPTIONS"]			= "Options Serveur du mode de jeux (Visible uniquement pour les admins)"
LANG["PHXM_ADMIN_MUSTALIVE"]		= "Vous devez être dans l'équipe vivante pour faire cette opération." 

--[[
	Language Override
]]
LANG["PHXM_ADMIN_LANGOVERRIDE"]		= "Remplacement de la langue" 

LANG["PHXM_ADMIN_FORCELANG"] 				= "Utilisez une langue forcé ? Cela remplacera la langue du client pour utiliser la langue choisie par le serveur." 
LANG["PHXM_ADMIN_LANGTOUSE"]				= "Langue forcée à utiliser." 
LANG["PHXM_ADMIN_PLAYERDEFAULTLANG"] 		= "Langue par défaut du joueur lors de la connexion pour la première fois." 

-- Gameplay settings
LANG["PHXM_ADMIN_CUSTOM_MODEL"]				= "Activer les modèles customisés pour les Chasseurs"
LANG["PHXM_ADMIN_CUSTOM_MODEL_PROP"]		= "Activer les modèles customisés pour les Props - Doit être activé pour les Chasseurs."
LANG["PHXM_ADMIN_TAUNT_DELAY_CUSTOM"]		= "Délai des taunts customisés (Secondes)"
LANG["PHXM_ADMIN_TAUNT_DELAY_RANDOM"]		= "Délai des taunts normaux (Secondes)"
LANG["PHXM_ADMIN_TAUNT_DELAY_AUTO"]			= "Délai de l'Autotaunt (Secondes)"
LANG["PHXM_ADMIN_AUTOTAUNT_ENABLE"]			= "Activer l'Autotaunt"

LANG["PHXM_ADMIN_NOTICE_ROTATION"]			= "Afficher la notification de «rotation de props» sur chaque apparition au spawns"
LANG["PHXM_ADMIN_CAMERA_COLLIDE"]			= "Activer la collision de la caméra Prop avec le mur"
LANG["PHXM_ADMIN_FREEZECAM"]				= "Activer les fonctionnalités Freecam pour l'équipe props"
LANG["PHXM_ADMIN_PROP_COLLIDE"]				= "Activer la collision des props avec les autres joueurs"
LANG["PHXM_ADMIN_SWAP_TEAM"] 				= "Changer d'équipe à chaque tour - La désactivation de l'option ne changera pas les équipes"
LANG["PHXM_ADMIN_HUNTER_PENALTY"]			= "Pénalité de santé du chasseur"
LANG["PHXM_ADMIN_HUNTER_KILL_BONUS"]		= "Bonus de mise à mort du chasseur"
LANG["PHXM_ADMIN_HUNTER_SMG_GRENADES"]		= "Grenades SMG Chasseurr"
LANG["PHXM_ADMIN_GAME_TIME"]				= "Durée totale du jeu (minutes)"
LANG["PHXM_ADMIN_BLINDLOCK_TIME"]			= "Temps de verrouillage du chasseur (secondes)"
LANG["PHXM_ADMIN_ROUND_TIME"]				= "Durée de la manche (secondes)"
LANG["PHXM_ADMIN_ROUNDS_PER_MAP"]			= "Total de parties de jeu par map"
LANG["PHXM_ADMIN_ENABLE_LUCKYBALL"]			= "Permettre aux Lucky Balls d'apparaître sur des props cassables (la chance est de 8%)"
LANG["PHXM_ADMIN_ENABLE_CRYSTAL"]			= "Permettre aux Devil Balls d'apparaître lorsque le chasseur meurt (la chance est de 70%)"
LANG["PHXM_ADMIN_WAIT_PLAYERS"]				= "Attendre que des joueurs soit présent pour commencé une manche"
LANG["PHXM_ADMIN_WAIT_MIN_PLAYERS"]			= "Joueurs Mininum à attendre avant le début de la manche (par défaut: 1)"
LANG["PHXM_ENABLE_PLAYER_JOIN_LEAVE"] 		= "Activer la notification pour rejoindre et quitter le joueur? Définissez 0 si vous souhaitez utiliser un module complémentaire de chat personnalisé." --Improve this.

LANG["PHXM_ADMIN_FORCEJOINBALANCE"]			= "Forcer les joueurs à équilibré les équipes"
LANG["PHXM_ADMIN_ENABLETEAMBALANCE"]		= "Équilibre automatiquement les équipes au début d'une manche"
LANG["PHXM_ADMIN_PICKUP_PROPS"] 			= "Autoriser le ramassage de props (0 = non; 1 = oui; 2 = uniquement les chasseurs)"

LANG["PHXM_ADMIN_TAUNTMODES"]		= "Activer les taunts customisés."
LANG["PHXM_ADMIN_TAUNTMODE_MODE"]	= "--[Le mode de Taunt actuel est : %d ]--" 
LANG["PHXM_ADMIN_TAUNTMODE0"]		= "Mode [0/F3]: Taunt Aléatoire"
LANG["PHXM_ADMIN_TAUNTMODE1"]		= "Mode [1/C]: Taunt Customisé"
LANG["PHXM_ADMIN_TAUNTMODE2"]		= "Mode [2]: Taunt Aléatoire et Customisé"
LANG["PHXM_ADMIN_TAUNTSOPEN"]		= "Ouvrir le menu des taunts"

LANG["PHXM_MODE_DEFAULT"] 			= "--[ Pickup Mode est réglé sur %d ]--" 
LANG["PHXM_MODE0"]					= "Mode [0]: Ne pas permettre" 
LANG["PHXM_MODE1"]					= "Mode [1]: Chasseurs seulement" 
LANG["PHXM_MODE2"]					= "Mode [2]: Props seulement" 
LANG["PHXM_MODE3"]					= "Mode [3]: Autoriser le ramassage" 

--[[
	Admin Developer Sections
]]
LANG["PHXM_ADMIN_DEVSECTION"]		= "Options pour les développeurs / Fonctionnalités expérimentales"  
LANG["PHXM_ADMIN_ROOMCHECK"]		= "Activer la vérification des limites ? Cela vous évite de rester coincé avec des objets / murs."  
LANG["PHXM_ADMIN_USENEWMKBREN"]		= "Utilisez un nouveau modèle pour l'arme bonus Bren MK II (nécessite un redémarrage de la carte)"  
LANG["PHXM_ADMIN_BEVERBOSE"]		= "Développeur: Soyez Verbose - Permettre à PH: X d'imprimer toutes les informations et événements de manière verbale?"  
LANG["PHXM_ADMIN_SHOWPLNAMEHEAD"]	= "Activez l'affichage des noms des équipes de joueurs sur leur écran." 
LANG["PHXM_ADMIN_USESINGLE_FZCAM"]	= "Utilisez un seul son Freezecam au lieu de la liste des sons (Utilisez 'ph_fc_cue_path' pour déterminer le chemin du son Freezecam" 
LANG["PHXM_ADMIN_MODELLISTINGTYPE"] = "Utiliser la liste des modèles hérités: 0 = Tous les modèles de jeu (AddValidModel), 1 = Utiliser l'ancien modèle: list.Get('PlayerOptionsModel')" 
LANG["PHXM_ADMIN_JUMPPOWER"]		= "Multiplicateur de puissance de saut supplémentaire pour les props" 
LANG["PHXM_ADMIN_ENABLE_OBB"]		= "Développeur : Activer le modificateur OBB (Customized Prop Entities Model Boundaries) à partir des données de configuration" 
LANG["PHXM_ADMIN_RELOAD_OBB"]		= "Développeur : Recharger les données du modificateur OBB à chaque redémarrage du tour" 

--[[
	Experimental & PH:X Features
]]
LANG["PHXM_ADMIN_EXPERIMENTALPHX"]			= "Nouvelles sections expérimentales PHX" 

LANG["PHXM_ADMIN_HLA_COMBINE"]				= "Ajout de la prise en charge du modèle HLA Combine" 
LANG["PHXM_ADMIN_TEAMBALANCE"]				= "Activer la fonction d'équilibre d'équipe" 
LANG["PHXM_ADMIN_CHANGETEAM_LIMIT"]			= "Utilisez le limiteur Team Switch. Réglez -1 pour désactiver." 
LANG["PHXM_ADMIN_USENEWCHAT"]				= "Utiliser une nouvelle boîte de discussion (eChat) - Il s'agit d'un remplacement temporaire. Si vous en avez déjà un, laissez cette case décochée." 
LANG["PHXM_ADMIN_NEWCHATPOS"]				= "Hauteur de soustraction (Y) Position par N pixels. La valeur par défaut est 45 pixels au dessus." 
LANG["PHXM_ADMIN_RESPAWNONBLIND"]			= "Autoriser Respawn pendant le temps aveuglement - Empêchez un Prop de ce suicide, ou autre chose." 
LANG["PHXM_ADMIN_RESPAWNONBLIND_TEAM"]		= "Autoriser la réapparition à l'aveugle avec une équipe spécifique uniquement: 0: tous, 1: chasseurs, 2: props" 
LANG["PHXM_ADMIN_REWSPANTIMEPERCENT"]		= "Pourcentage de temps aveugle qui vous permet de réapparaître. La valeur par défaut est 0,75 (signifie 75% * Temps mort maximal)" 
LANG["PHXM_ADMIN_ALLOWRESPAWN_SPECTATOR"]	= "Autoriser la réapparition à l’aveugle lors de l’affectation à l’équipe des spectateurs" 
LANG["PHXM_ADMIN_ALLOWRESPAWN_TEAMCHANGE"]	= "Autoriser la réapparition en temps mort lors de l'attribution à une autre équipe (l'activation de cette option peut ne pas être recommandée)" 

--[[
	MapVote Settings
]]
LANG["PHXM_MAPVOTE_SETTINGS"]		= "Paramètres MapVote"

LANG["PHXM_MV_ALLOWCURMAP"]			= "Autoriser la map actuelle à être votée"
LANG["PHXM_MV_COOLDOWN"]			= "Activer le cooldown pour les votes"
LANG["PHXM_MV_USE_ULX_VOTEMAPS"]	= "Utiliser le Mapvote ULX pour la liste ? Si non, les maps du dossier maps/*.bsp seront utilisées."
LANG["PHXM_MV_MAPLIMIT"]			= "Nombre de maps à afficher lors du vote."
LANG["PHXM_MV_TIMELIMIT"]			= "Temps en seconde pour le Mapvote."
LANG["PHXM_MV_MAPBEFOREREVOTE"]		= "Changement de map requis pour faire réapparaitre cette map"
LANG["PHXM_MV_RTVCOUNT"]			= "Nombre de joueurs nécessaires pour le RTV (Rock the Vote)"

LANG["PHXM_MV_EXPLANATION1"]		= "Pour définir les maps à utiliser, utilise (par exemple) [ mv_mapprefix 'ph_,cs_,de_' ] dans la console."
LANG["PHXM_MV_EXPLANATION2"]		= "Si vous n'arrivez pas à utiliser le Mapvote, il faut installer ULX Admin Mod !"
LANG["PHXM_MV_EXPLANATION3"]		= "Action MapVote (Pour annuler, utilise !unmap_vote dans le chat ou 'unmap_vote' dans la console)"

LANG["PHXM_MV_START"]				= "Démarrer un vote de map"
LANG["PHXM_MV_STOP"]				= "Arrêter un vote de map"

--[[ 
	Versioning, Credits or About section
]]
LANG["PHXM_ABOUT_VERSIONING"]		= "Version Actuelle: %s - Revision Actuelle: %s"
LANG["PHXM_ABOUT_AUTHOR"]			= "Par : %s" 
LANG["PHXM_ABOUT_ENJOYING"]			= "Si vous aimez le jeu, vous pouvez faire un don !"
LANG["PHXM_ABOUT_UPDATE"]			= "Mises à jour de Prop Hunt X" 
LANG["PHXM_ABOUT_LINKS"]			= "Liens et crédits"
LANG["PHXM_ABOUT_THANKS"]			= "Remerciements spéciaux pour le soutien, la suggestion et les contributions:\n %s"

LANG["PHXM_ABOUT_BTN_DONATE"]		= "Faire une donation au projet PH:X"
LANG["PHXM_ABOUT_BTN_HOME"]			= "Page Officielle PH:X"
LANG["PHXM_ABOUT_BTN_GITHUB"]		= "PHX GitHub Repository"
LANG["PHXM_ABOUT_BTN_PLUGINS"]		= "PHX Addons/Plugins" 
LANG["PHXM_ABOUT_BTN_CHANGELOGS"]	= "PHX Changelogs" 

--[[
	Late Additionals -- Improved by Haeiven
]]
-- fretta
LANG["HUD_SPECTATING"]	= "SPECTATEUR"
LANG["HUD_YOUDIED"]		= "Vous êtes mort!"

LANG["CHAT_STARTING_MAPVOTE"] = "La manche est terminée. Début du vote pour le changement de carte..."

-- This used for HUD Taunt Timer
LANG["HUD_PROP_TAUNT_TIME"]	= "Taunt aléatoire"
LANG["HUD_PROP_CTAUNT_TIME"] = "Taunt personnalisée"

LANG["PHXM_TAB_PLUGINS"]				= "Addons et Plugins"

-- Plugins Section
LANG["PLUGINS_NO_PLUGINS"]				= "Aucun plugin installé. Cherche des plugins ici!"
LANG["PLUGINS_BROWSE_MORE"]				= "Chercher plus de plugins"
LANG["PLUGINS_SERVER_HAS_NO_PLUGINS"]	= "Désolé, Ce serveur n'a aucun addons/plugins installés."
LANG["PLUGINS_SERVER_SETTINGS"]			= "-- Paramètres du serveur --"
LANG["PLUGINS_CLIENT_SETTINGS"]			= "-- Paramètres utilisateur --"

-- Text Entries
LANG["TEXTENTRY_FZ_SINGLE"] = "Chemin d'accès au son Freeze Cam" -- this one is for ph_fc_cue_path command
LANG["TEXTENTRY_MV_PREFIX"] = "Préfixe du MapVote"			 	 -- the map previx for mv_mapprefix

PHX.LANGUAGES[LANG.code] = LANG