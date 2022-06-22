-- Thank you from TR1NITY and Haeiven for the contribution!

local LANG = {}

LANG.code = "fr"

LANG.Name 		 	= "Français"
LANG.NameEnglish	= "French"
LANG.Author			= "TR1NITY, Haeiven" -- Only accept STRINGS.
-- Can Accept: String, and Table.
LANG.AuthorURL		= { "https://steamcommunity.com/profiles/76561198260731850", "https://steamcommunity.com/profiles/76561198047814125" }

-- Special Section that isn't String-based
LANG.SUICIDEMSG = {  -- Fix me: there was addition text here but feel free to add more.
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

LANG["PHX_TEAM_CONNECTING"] = "De Liaison" --Fix Me
LANG["PHX_TEAM_PROPS"]		= "Props"
LANG["PHX_TEAM_HUNTERS"] 	= "Chasseurs"
LANG["PHX_TEAM_UNASSIGNED"]	= "Non attribué" -- Fix me
LANG["PHX_TEAM_SPECTATOR"] 	= "Spectateur"	-- Fix me

-- List of string-based translation

LANG["HELP_F1"] 			= [[
Un projet de Prop Hunt (Nom de code) X.

Un projet pour rendre Prop Hunt X moderne et personnalisable.

Plus d'informations peuvent être trouvées sur:
https://gmodgameservers.com/prophuntx

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
LANG["DERMA_SERVER_TAG"]		= "SV" --Fix Me
LANG["DERMA_BOT_TAG"]			= "BOT" -- Fix Me
LANG["DERMA_GAMEMODE_CREDITS"]	= "%s | Version: %s - Rev. %s" -- Fix Me

LANG["CHAT_JOINED"]			= " a rejoint "
LANG["CHAT_JOINEDTHE"]		= " a rejoint les "

LANG["CHAT_SWAPBALANCE"]		= "%s a été remplacé par %s pour l'équilibre de l'équipe."
LANG["CHAT_SWAPBALANCEYOU"]		= "Vous avez été échangé pour atteindre un équilibre parfait."

-- FRETTA: Splash Starting Screen
LANG["SPASHSCREEN_BY_X"]		= "by %s"	--Fix Me
-- RichTextBox
LANG["HELP_DONATORS_AND_CONTRIBUTORS"]  = "\n\nDonators & Contributors:\n- %s" --Fix Me
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

LANG["TEAM_PROPS"]				= LANG["PHX_TEAM_PROPS"] --"Props"
LANG["TEAM_HUNTERS"]			= LANG["PHX_TEAM_HUNTERS"]

LANG["HUD_ROTLOCK"]			= "Rotation du Prop: Bloquée"
LANG["HUD_ROTFREE"]			= "Rotation du Prop: Libre"
LANG["HUD_KILLEDBY"]		= "Vous avez été tué par %s"

LANG["HUD_BLINDED"]			= "Les %s seront libérez dans %s"
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
LANG["TM_NOTICE_PLSWAIT"]		= "Veuillez patienter %s seconde(s) !" -- fix me: Add " before Random Taunt ends!"
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

LANG["PHXM_MV_EXPLANATION1"]		= "Pour définir les maps à utiliser, utilise (par exemple) [ mv_map_prefix 'phx_,ph_,cs_,de_' ] dans la console."
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
LANG["TEXTENTRY_MV_PREFIX"] = "Préfixe du MapVote"			 	 -- the map previx for mv_map_prefix

--============= LATE ADDITION OF 29.10.21/X2Z. =============--

LANG["MISC_GAME_ENDED"]		= "Game has ended."

--============= LATE ADDITION OF 16.09.21/X2Z. Please Improve your Language Here! =============--

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