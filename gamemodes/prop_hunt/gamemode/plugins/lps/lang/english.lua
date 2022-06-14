local LANG = {}

-- English Section
LANG["en_us"]   = {
    -- setting menu
    ["LPS_GENERAL_SETTINGS"]    = "General Settings",
    ["LPS_APPEARANCES"]         = "Appearances",
    
    ["LPS_MENU_ENABLE"]         = "Enable Last Prop Standing",
    ["LPS_WEAPON_SELECT"]       = "Weapon to give ('random' or 'class name')",
    
    ["LPS_HALO_ENABLE"]         = "Draw a halo effect around the last prop?",
    ["LPS_HALO_SEETHROUGHWALL"] = "Draw the halo effect through walls?",
    ["LPS_HALO_COLOUR"]         = "Colour for Last Prop Standing's Halo effect ('rainbow' or hex code)",
    ["LPS_TRAILS_ENABLE"]       = "Draw a trail behind Last Prop player?",
    ["LPS_TRAILS_COLOUR"]       = "Colour for the Last Prop's trail (hex code)",
    ["LPS_TRAIL_TEXTURE"]       = "Trail colour texture for Last Prop's player",
    ["LPS_MODE"]                = "Weapon give mode: [Unchecked] Classic, [checked] New method",
    
    -- More into stuff now.
    
    ["LASTPROP_ANNOUNCE"]       = "The last prop has been given a gun!"
}

LANG["fr"] = {
    ["LASTPROP_ANNOUNCE"]       = "Le dernier prop a reçu une arme à feu!"
}

LANG["es-ES"]  = {
    ["LASTPROP_ANNOUNCE"]       = "¡Al último prop se le ha dado una pistola!"
}

list.Set("PHX.LanguageInsertion", "[LastPropStanding] English", LANG)