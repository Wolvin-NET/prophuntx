local LANG = {}

-- English Section
LANG["pt-BR"]   = {
    -- setting menu
    ["LPS_GENERAL_SETTINGS"]    = "General Settings",
    ["LPS_APPEARANCES"]         = "Appearances",
    ["LPS_WEAPON_SETTINGS"]     = "Last Stands Weapon Setting",
    
    ["LPS_MENU_ENABLE"]         = "Enable Last Prop Standing",
	["LPS_ENABLE_MUSIC"]		= "Enable Music when LPS occurs. Require Round Restart to take effect.",
    ["LPS_WEAPON_SELECT"]       = "Weapon to give ('random' or 'name'). See Weapon List below.",
    ["LPS_BTN_WEPLIST"]         = "Available Weapons List",
    ["LPS_MINIMUM_PROPS_TEAM"]  = "Minimum number of props on Team before LPS can be triggered. Minium: 2.",
    
    ["LPS_WEPLIST"]             = "Available Weapons list:\n%s\nYou can use 'lps_weapon_list' in the console.",
    
    ["LPS_HALO_ENABLE"]         = "Draw a halo effect around the last prop?",
    ["LPS_HALO_SEETHROUGHWALL"] = "Draw the halo effect through walls?",
    ["LPS_HALO_COLOUR"]         = "Colour for Last Prop Standing's Halo effect ('rainbow' or hex code)",
    ["LPS_TRAILS_ENABLE"]       = "Draw a trail behind Last Prop player?",
    ["LPS_TRAILS_COLOUR"]       = "Colour for the Last Prop's trail (hex code)",
    ["LPS_TRAIL_TEXTURE"]       = "Trail colour texture for Last Prop's player",
    
    ["LPS_PLAY_MUSIC"]          = "Play Background Music when LPS Event begin. (Only applies on next music)",
    ["LPS_CL_DRAW_HALO"]        = "(Client side) Show/Hide Halo, even server sets it.",
    
    -- Internal: Weapon Settings
    ["LPS_WEPSET_REV_AMMO"]     = "LPS Revolver Ammo. -1=Unlimited.",
    ["LPS_WEPSET_SMG_AMMO"]     = "LPS SMG Ammo. -1=Unlimited.",
    
    ["LPS_WEPSET_DAMAGE_REV"]   = "LPS Damage for Revolver",
    ["LPS_WEPSET_DAMAGE_SMG"]   = "LPS Damage for SMG",
    ["LPS_WEPSET_DAMAGE_BLAST"] = "LPS Damage for Blaster",
    
    -- More into stuff now.
    ["LASTPROP_ANNOUNCE"]       = "You are the Last Prop Standing!",
    ["LASTPROP_ANNOUNCE_ALL"]   = "The Last Prop Standing is Resisting!",
    
    -- Weapon State
    ["WEAPON_STATE_READY"]      = "Ready",
    ["WEAPON_STATE_RELOAD"]     = "Reloading...",
    ["WEAPON_STATE_OUTOFAMMO"]  = "Out of Ammo",
    ["WEAPON_STATE_UNARMED"]    = "No Weapon",
    
    ["WEAPON_AMMO_UNLI"]        = "Unlimited"
}

list.Set("PHX.LanguageInsertion", "[LastPropStanding] Portuguese Brazil", LANG)