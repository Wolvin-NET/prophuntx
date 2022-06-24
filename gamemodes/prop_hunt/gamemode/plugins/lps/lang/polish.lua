local LANG = {}

-- Last updated: June 24, 2022

-- Polish Section
LANG["pl_pl"]   = {
    -- setting menu
    ["LPS_GENERAL_SETTINGS"]    = "Ustawienia Ogólne",
    ["LPS_APPEARANCES"]         = "Wyświetlanie",
    ["LPS_WEAPON_SETTINGS"]     = "Ustawienia Broni OŻP",
    
    ["LPS_MENU_ENABLE"]         = "Włącz opcję Ostatni Żywy Przedmiot (OŻP)",
	["LPS_ENABLE_MUSIC"]		= "Włącz muzykę kiedy wystąpi OŻP. Wymaga restartu rundy.",
    ["LPS_WEAPON_SELECT"]       = "Broń do rozdania ('random' lub 'nazwa'). Zobacz listę broni poniżej.",
    ["LPS_BTN_WEPLIST"]         = "Lista dostępnych broni",
    ["LPS_MINIMUM_PROPS_TEAM"]  = "Minimalna ilość graczy w drużynie przedmiotów, aby OŻP mógł wystąpić. Minimalnie: 2",
    
    ["LPS_WEPLIST"]             = "Lista dostępnych broni:\n%s\nMożesz użyć komendy 'lps_weapon_list' w konsoli.",
    
	["LPS_SHOW_WEAPON"]			= "Spraw, aby broń Ostatni Żywy Przedmiot była widoczna", --Todo: Fix me!
    ["LPS_HALO_ENABLE"]         = "Zastosować efekt poświaty wokół ostatniego przedmiotu?",
    ["LPS_HALO_SEETHROUGHWALL"] = "Wyświetlać efekt poświaty przez ściany?",
    ["LPS_HALO_COLOUR"]         = "Kolor poświaty Ostatniego Żywego Przedmiotu ('rainbow' lub kod HEX)",
    ["LPS_TRAILS_ENABLE"]       = "Rysować ścieżkę za Ostatnim Żywym Przedmiotem?",
    ["LPS_TRAILS_COLOUR"]       = "Kolor ścieżki ruchu Ostatniego Żywego Przedmiotu (kod HEX)",
    ["LPS_TRAIL_TEXTURE"]       = "Tekstura ścieżki ruchu Ostatniego Żywego Przedmiotu",
    
    ["LPS_PLAY_MUSIC"]          = "Odtwórz muzykę w tle, kiedy rozpocznie się wydarzenie OŻP. (Działa tylko na następnej muzyce)",
    ["LPS_CL_DRAW_HALO"]        = "(Klient) Pokaż/Ukryj poświatę jeżeli serwer na nią pozwala.",
    
    -- Internal: Weapon Settings
    ["LPS_WEPSET_REV_AMMO"]     = "Amunicja Rewolweru OŻP. -1 = nielimitowana.",
    ["LPS_WEPSET_SMG_AMMO"]     = "Amunicja SMG OŹP. -1 = nielimitowana.",
    
    ["LPS_WEPSET_DAMAGE_REV"]   = "Obrażenia z Rewolweru OŻP",
    ["LPS_WEPSET_DAMAGE_SMG"]   = "Obrażenia z SMG OŻP",
    ["LPS_WEPSET_DAMAGE_BLAST"] = "Obrażenia z Blaster'a",
    
    -- More into stuff now.
    ["LASTPROP_ANNOUNCE"]       = "Jesteś Ostatnim Żywym Przedmiotem!",
    ["LASTPROP_ANNOUNCE_ALL"]   = "Ostatni Żywy Przedmiot rozpoczyna walkę!",
    
    -- Weapon State
    ["WEAPON_STATE_READY"]      = "Gotowa",
    ["WEAPON_STATE_RELOAD"]     = "Przeładowywanie...",
    ["WEAPON_STATE_OUTOFAMMO"]  = "Brak amunicji",
    ["WEAPON_STATE_UNARMED"]    = "Brak broni",
    
    ["WEAPON_AMMO_UNLI"]        = "Nielimitowana"
}

list.Set("PHX.LanguageInsertion", "[LastPropStanding] Polish", LANG)
