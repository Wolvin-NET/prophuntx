-- WARNING: THIS CODE IS UNFINISHED!!!!

-- The main core files aren't translated yet.
-- THERE ARE ALOT OF TEXT NEED TO RE-LANGUAGE.

-- Originally written by: Fafy
-- Improved by Wolvindra-Vinzuerio more simpler.

local LANG = {}

LANG.code = "fr"

LANG.Name 		 	= "Français" -- example: "Bahasa Indonesia"
LANG.NameEnglish	= "French" -- Your Language but spoken in English, example: "Indonesian"
LANG.Author			= "TR1NITY"
LANG.AuthorURL		= "http://steamcommunity.com/profiles/76561198260731850" -- Value must only contain Steam Profile with SteamID64 format: https://steamcommunity.com/profiles/761123456xxxxx.

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
	"est mort par la foce.",
	"ragdolled.",
}

LANG.RANDOM_SPECTATORS = {
	"pour regarder et se détendre.",
	"pour les voir traîner dans le coin.",
	"pour voir des choses.",
	"",
}

-- List of string-based translation

LANG["HELP_F1"] 			= PHX.F1DefaultHelp or [[Todo: please enter a nicely described Game Help text message here]];

LANG["EV_PLAYER_CONNECT"]	= "%s s'est connecté au serveur."
LANG["EV_PLAYER_DISCONNECT"] = "%s s'est déconnecté du serveur (Raison: %s)."

-- HUD elements
LANG["HUD_HP"]				= "SANTÉ"
LANG["HUD_AMMO"] 			= "MUNITIONS"
LANG["HUD_TIME"] 			= "TEMPS"
LANG["HUD_ROUND"]			= "MANCHE"

LANG["HUD_ROTLOCK"]			= "Rotation du Prop: Bloquée"
LANG["HUD_ROTFREE"]			= "Rotation du Prop: Libre"
LANG["HUD_KILLEDBY"]		= "Vous avez été tué par %s"

LANG["HUD_WAITPLY"]			= "En attente de joueurs..."
LANG["HUD_TEAMWIN"]			= "Les %s ont gagnés !"
LANG["HUD_LOSE"]			= "Egalité !"

LANG["HUD_BLINDED"]			= "Les Hunters seront libérez dans %s"
LANG["HUD_UNBLINDED"]		= "Prêt ou non, nous arrivons !"

LANG["BLIND_RESPAWN_TEAM"]	= "You were respawned only on %s team in %d seconds during blind time."
LANG["BLIND_RESPAWN"]		= "You were respawned in %d seconds during blind time."

--  Kill text (X killed Y)
LANG["HUD_KILLED"]			= "a tué"

LANG["MISC_ACCEPT"]			= "Accepter"
LANG["MISC_CLOSE"]			= "Fermer"
LANG["MISC_TIMELEFT"]		= "Temps Restant: %s"
LANG["MISC_GAMEEND"] 		= "La partie va se terminer après cette manche"

-- Team selection screen (F2)
LANG["DERMA_TEAMSELECT"]	= "Choisir une équipe"

-- F1 screeen
LANG["DERMA_RTV"] 			= "Voter pour changer la map (RTV)"
LANG["DERMA_PHMENU"] 		= "Menu Prop Hunt"
LANG["DERMA_CHANGETEAM"]	= "Changer d'équipe"

-- Scoreboard
LANG["DERMA_PLAYER"]		= "(%d joueur)"
LANG["DERMA_PLAYERS"]		= "(%d joueurs)"
LANG["DERMA_NAME"]			= "Pseudo"
LANG["DERMA_KILLS"]			= "Kills"
LANG["DERMA_DEATHS"]		= "Mort"
LANG["DERMA_PING"]			= "Ping"

-- Chat messages
LANG["CHAT_NOPLAYERS"]		= "Il n'y a pas assez de joueurs pour commencer une partie !"
LANG["CHAT_SWAP"]			= "Les équipes ont été échangées !"

LANG["CHAT_JOINED"]			= " a rejoint "
LANG["CHAT_JOINEDTHE"]		= " a rejoint les "

LANG["CHAT_SWAPBALANCE"]		= "%s a été remplacé par %s pour l'équilibre de l'équipe."
LANG["CHAT_SWAPBALANCEYOU"]		= "Vous avez été échangé pour atteindre un équilibre parfait." -- Smile... for even in death, you have become children of Thanos

-- PHE Menu 
LANG["PHXM_TAB_HELP"]		= "Aide et Guides"
LANG["PHXM_TAB_MUTE"]		= "Mute"
LANG["PHXM_PLAYER_TAB"]		= "Joueur"
LANG["PHXM_PLAYERMODEL_TAB"] = "Skins"
LANG["PHXM_ADMINS_TAB"]		= "Administration"
LANG["PHXM_ABOUT_TAB"]		= "A propos de Prop Hunt X"
LANG["PHXM_MAPVOTE_TAB"]		= "MapVote"

LANG["PHXM_MUTE_SELECT"]		= "Sélectionne un joueur que tu veux rendre muet."

LANG["PHXM_PLAYER_OPTIONS"]		= "Options du joueur:"

LANG["PHXM_ADMIN_HLA_COMBINE"]				= "Add HLA Combine model support"
LANG["PHXM_ADMIN_TEAMBALANCE"]				= "Enable Team Balance feature"
LANG["PHXM_ADMIN_CHANGETEAM_LIMIT"]			= "Use Team Switch limitter. Set -1 to disable. "
LANG["PHXM_ADMIN_USENEWCHAT"]				= "Use new Chat Box"
LANG["PHXM_ADMIN_NEWCHATPOS"]				= "Chat Box Substract Height Position"
LANG["PHXM_ADMIN_RESPAWNONBLIND"]			= "Allow Respawn on Blind Time"
LANG["PHXM_ADMIN_RESPAWNONBLIND_TEAM"]		= "Allow Respawn on Blind Time specific Team Only"
LANG["PHXM_ADMIN_REWSPANTIMEPERCENT"]		= "Percentage of Blind Time which allows you to respawn. Default is 0.75 (means 75% * Max Blind Time)"
LANG["PHXM_ADMIN_ALLOWRESPAWN_SPECTATOR"]	= "Allow Respawn on Blind Time when Assigning to Spectator Team"
LANG["PHXM_ADMIN_ALLOWRESPAWN_TEAMCHANGE"]	= "Allow Respawn on Blind Time when Assigning to Different Team (Enabling this may not recommended)"

LANG["PHXM_PLAYER_ph_cl_halos"]		= "Activer l'effet Halo lors du choix d'un Prop"
LANG["PHXM_PLAYER_ph_cl_pltext"]		= "Voir l'équipe du joueur au dessus de la tête (apparaît à travers les murs)"
LANG["PHXM_PLAYER_ph_cl_endround_sound"]		= "Jouer la musique à la fin de la manche"
LANG["PHXM_PLAYER_ph_cl_autoclose_taunt"]		= "Fermer automatiquement le menu des taunts lors d'un double clic"
LANG["PHXM_PLAYER_ph_cl_spec_hunter_line"]		= "Afficher la ligne aim des hunters en spectateur"
LANG["PHXM_PLAYER_cl_enable_luckyballs_icon"]		= "Activer les icones 'Lucky ball'"
LANG["PHXM_PLAYER_cl_enable_devilballs_icon"]		= "Activer les icones 'Devil ball'"
LANG["PHXM_PLAYER_ph_cl_taunt_key"]		= "Bouton pour jouer un Taunt aléatoire"

LANG["PHXM_PLAYER_ph_hud_use_new"]		= "Utiliser le nouveau HUD PH: Enhanced"
LANG["PHXM_PLAYER_ph_show_tutor_control"]		= "Afficher le tutoriel (Apparaît 2x à chaque apparition en Prop)"
LANG["PHXM_PLAYER_ph_show_custom_crosshair"]		= "Activer le Crosshair customisé"
LANG["PHXM_PLAYER_ph_show_team_topbar"]		= "Afficher le nombre total de joueurs de l'équipe en vie (4 joueurs minimum)"


LANG["PHXM_PLAYERMODEL_OFF"]		= "Les skins customisés sont désactivés sur le serveur !"
LANG["PHXM_PLAYERMODEL_SETFOV"]		= "Définir le FOV des skins"


LANG["PHXM_ADMINS_OPTIONS"]		= "Options Serveur du mode de jeux (Visible uniquement pour les admins)"

LANG["PHXM_ADMINS_ph_language"]		= "Langue du mode de jeu (nécessite un changement de carte)"
LANG["PHXM_ADMINS_ph_use_custom_plmodel"]		= "Activer les modèles customisés pour les Hunters"
LANG["PHXM_ADMINS_ph_use_custom_plmodel_for_prop"]		= "Activer les modèles customisés pour les Props - Doit être activé pour les Hunters."
LANG["PHXM_ADMINS_ph_customtaunts_delay"]		= "Délai des taunts customisés (Secondes)"
LANG["PHXM_ADMINS_ph_normal_taunt_delay"]		= "Délai des taunts normaux (Secondes)"
LANG["PHXM_ADMINS_ph_autotaunt_enabled"]		= "Activer l'Autotaunt"
LANG["PHXM_ADMINS_ph_autotaunt_delay"]		= "Délai de l'Autotaunt (Secondes)"
LANG["PHXM_ADMINS_ph_forcejoinbalancedteams"]		= "Forcer les joueurs à équilibré les équipes"
LANG["PHXM_ADMINS_ph_autoteambalance"]		= "Équilibre automatiquement les équipes au début d'une manche"
LANG["PHXM_ADMINS_ph_allow_prop_pickup"] = "Autoriser le ramassage de props (0 = non; 1 = oui; 2 = uniquement les hunters)"

LANG["PHXM_ADMINS_ph_notice_prop_rotation"]		= "Afficher la notification de «rotation de props» sur chaque apparition au spawns"
LANG["PHXM_ADMINS_ph_prop_camera_collisions"]		= "Activer la collision de la caméra Prop avec le mur"
LANG["PHXM_ADMINS_ph_freezecam"]		= "Activer les fonctionnalités Freecam pour l'équipe props"
LANG["PHXM_ADMINS_ph_prop_collision"]		= "Activer la collision des props avec les autres joueurs"
LANG["PHXM_ADMINS_ph_swap_teams_every_round"]		= "Changer d'équipe à chaque tour - La désactivation de l'option ne changera pas les équipes"
LANG["PHXM_ADMINS_ph_hunter_fire_penalty"]		= "Pénalité de santé du hunter"
LANG["PHXM_ADMINS_ph_hunter_kill_bonus"]		= "Bonus de mise à mort du hunter"
LANG["PHXM_ADMINS_ph_hunter_smg_grenades"]		= "Grenades SMG Hunter"
LANG["PHXM_ADMINS_ph_game_time"]		= "Durée totale du jeu (minutes)"
LANG["PHXM_ADMINS_ph_hunter_blindlock_time"]		= "Temps de verrouillage du hunter (secondes)"
LANG["PHXM_ADMINS_ph_round_time"]		= "Durée de la manche (secondes)"
LANG["PHXM_ADMINS_ph_rounds_per_map"]		= "Total de parties de jeu par map"
LANG["PHXM_ADMINS_ph_enable_lucky_balls"]		= "Permettre aux Lucky Balls d'apparaître sur des props cassables (la chance est de 8%)"
LANG["PHXM_ADMINS_ph_enable_devil_balls"]		= "Permettre aux Devil Balls d'apparaître lorsque le hunter meurt (la chance est de 70%)"
LANG["PHXM_ADMINS_ph_waitforplayers"]		= "Attendre que des joueurs soit présent pour commencé une manche"
LANG["PHXM_ADMINS_ph_min_waitforplayers"]		= "Joueurs Mininum à attendre avant le début de la manche (par défaut: 1)"

LANG["PHXM_ADMINS_TAUNTMODES"]		= "Activer les taunts customisés."
LANG["PHXM_ADMINS_TAUNTMODE0"]		= "Mode [0/F3]: Taunt Aléatoire"
LANG["PHXM_ADMINS_TAUNTMODE1"]		= "Mode [1/C]: Taunt Customisé"
LANG["PHXM_ADMINS_TAUNTMODE2"]		= "Mode [2]: Taunt Aléatoire et Customisé"
LANG["PHXM_ADMINS_TAUNTSOPEN"]		= "Ouvrir le menu des taunts"

LANG["PHXM_MAPVOTE_SETTINGS"]		= "Paramètres MapVote"

LANG["PHXM_MAPVOTE_mv_allowcurmap"]		= "Autoriser la map actuelle à être votée"
LANG["PHXM_MAPVOTE_mv_cooldown"]		= "Activer le cooldown pour les votes"
LANG["PHXM_MAPVOTE_mv_use_ulx_votemaps"]		= "Utiliser le Mapvote ULX pour la liste? Si non, les maps du dossier maps/*.bsp seront utilisées."
LANG["PHXM_MAPVOTE_mv_maplimit"]		= "Nombre de maps à afficher lors du vote."
LANG["PHXM_MAPVOTE_mv_timelimit"]		= "Temps en seconde pour le Mapvote."
LANG["PHXM_MAPVOTE_mv_mapbeforerevote"]		= "Changement de map requis pour faire réapparaitre cette map"
LANG["PHXM_MAPVOTE_mv_rtvcount"]		= "Nombre de joueurs nécessaires pour le RTV (Rock the Vote)"

LANG["PHXM_MAPVOTE_EXPLANATION1"]		= "Pour définir les maps à utiliser, utilise (par exemple) [ mv_mapprefix 'ph_,cs_,de_' ] dans la console."
LANG["PHXM_MAPVOTE_EXPLANATION2"]		= "Si vous n'arrivez pas à utiliser le Mapvote, il faut installer ULX Admin Mod !"
LANG["PHXM_MAPVOTE_EXPLANATION3"]		= "Action MapVote (Pour annuler, utilise !unmap_vote dans le chat ou 'unmap_vote' dans la console)"

LANG["PHXM_MAPVOTE_START"]		= "Démarrer un MapVote"
LANG["PHXM_MAPVOTE_STOP"]		= "Arrêter un MapVote"
--                   YOU VIOLATED THE LAW!
LANG["PHXM_ABOUT_CURRENTVER"]		= "Version Actuelle: "
LANG["PHXM_ABOUT_CURRENTREV"]		= "Revision Actuelle: "
LANG["PHXM_ABOUT_ENJOYING"]		= "Si vous aimez le jeu, vous pouvez faire un don !"
LANG["PHXM_ABOUT_LINKS"]		= "Liens et crédits"
LANG["PHXM_ABOUT_THANKS"]		= "Remerciements spéciaux: "

LANG["PHXM_ABOUT_DONATE"]		= "Faire une donation au projet PH:E"
LANG["PHXM_ABOUT_HOME"]		= "Page Officielle PH:E"
LANG["PHXM_ABOUT_GITHUB"]		= "GitHub"

PHX.LANGUAGES[LANG.code] = LANG