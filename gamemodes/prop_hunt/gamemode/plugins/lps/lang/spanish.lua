local LANG = {}

-- English Section
LANG["es-ES"]   = {
    -- setting menu
    ["LPS_GENERAL_SETTINGS"]    = "Ajustes generales",
    ["LPS_APPEARANCES"]         = "Apariencias",
    ["LPS_WEAPON_SETTINGS"]     = "Ajustes de arma con último superviviente",
    
    ["LPS_MENU_ENABLE"]         = "Activar último objeto superviviente",
	["LPS_ENABLE_MUSIC"]		= "Acitvar la música cuando solo quede un objeto vivo. Hay que reiniciar la ronda para que surja efecto.",
    ["LPS_WEAPON_SELECT"]       = "Armas otorgadas («random» para que sea aleatoria o por su nombre). Véase la lista de armas.",
    ["LPS_BTN_WEPLIST"]         = "Lista de armas disponibles",
    ["LPS_MINIMUM_PROPS_TEAM"]  = "Número mínimo de objetos en el equipo antes de que quede un objeto con vida. Mínimo: 2.",
    
    ["LPS_WEPLIST"]             = "Lista de armas disp.:\n%s\nPuedes usar «lps_weapon_list» en la consola.",
    
    ["LPS_HALO_ENABLE"]         = "¿Resaltar al último objeto con vida?",
    ["LPS_HALO_SEETHROUGHWALL"] = "¿Resaltar al último objeto con vida a través de las paredes?",
    ["LPS_HALO_COLOUR"]         = "Color del resaltado del último objeto con vida («arcoíris» o código hex.)",
    ["LPS_TRAILS_ENABLE"]       = "¿Dejar un rastro tras el último objeto con vida?",
    ["LPS_TRAILS_COLOUR"]       = "Color del rastro del último objeto con vida (código hex.)",
    ["LPS_TRAIL_TEXTURE"]       = "Textura para el color del rastro del último objeto con vida",
    
    ["LPS_PLAY_MUSIC"]          = "Reproducir música de fondo cuando solo quede un objeto con vida.",
    ["LPS_CL_DRAW_HALO"]        = "(Para el cliente) Mostrar/Ocultar objeto resaltado, aunque el servidor lo tenga.",
    
    -- Internal: Weapon Settings
    ["LPS_WEPSET_REV_AMMO"]     = "Muni. del revolver en últ. superv. -1=Sin límite.",
    ["LPS_WEPSET_SMG_AMMO"]     = "Muni. de subfusil en últ. superv. -1=Sin límite.",
    
    ["LPS_WEPSET_DAMAGE_REV"]   = "Daño de últ. superv. para revólver",
    ["LPS_WEPSET_DAMAGE_SMG"]   = "Daño de últ. superv. para subfusil",
    ["LPS_WEPSET_DAMAGE_BLAST"] = "Daño de últ. superv. para bláster",
    
    -- More into stuff now.
    ["LASTPROP_ANNOUNCE"]       = "¡Eres el último objeto con vida!",
    ["LASTPROP_ANNOUNCE_ALL"]   = "¡El último objeto con vida se resiste!",
    
    -- Weapon State
    ["WEAPON_STATE_READY"]      = "Listo",
    ["WEAPON_STATE_RELOAD"]     = "Recargando...",
    ["WEAPON_STATE_OUTOFAMMO"]  = "Sin munición",
    ["WEAPON_STATE_UNARMED"]    = "Sin arma",
    
    ["WEAPON_AMMO_UNLI"]        = "Sin límite"
}

list.Set("PHX.LanguageInsertion", "[LastPropStanding] Spanish", LANG)