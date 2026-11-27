local L = {}

-- Swedish Section
L["sv_se"]   = {
    -- Header Text Group
    ["LPS_GENERAL_SETTINGS"]    = "Almänna inställningar",
    ["LPS_APPEARANCES"]         = "Utseenden",
    ["LPS_WEAPON_SETTINGS"]     = "Vapeninställningar för Sista Levande",
    ["LPS_WEAPON_DMG_SETTINGS"] = "Vapenskada för Sista Levande",
    ["LPS_HEALTH_ARMOR"]        = "Inställningar för hälsa & pansar",
    ["LPS_TRIGGER_CONDITION"]   = "Förutsättning för aktivering av SFL-händelse",
    
    -- Appearances & General Settings
    ["LPS_MENU_ENABLE"]         = "Slå på Sista Föremålet Levande",
	["LPS_ENABLE_MUSIC"]		= "Slå på musik när SFL är aktivt. Kräver omstart av runda för att ta effekt.",
    ["LPS_WEAPON_SELECT"]       = "Vapen som ges ('random' eller 'namn'). Se vapenlista nedan.",
    ["LPS_BTN_WEPLIST"]         = "Lista över tillgängliga vapen",
    ["LPS_MINIMUM_PROPS_TEAM"]  = "Minsta antal föremål som krävs för att SFL ska kunna aktiveras. Minium: 2.",
    
    ["LPS_START_RANDOM"]        = "Bör SFL aktiveras slumpmässigt? (Fördröjd start kommer ignoreras)",
    ["LPS_START_DELAYED"]       = "Bör aktiveringen av SFL fördröjas efter X antal rundor?",
    ["LPS_START_X_ROUNDS"]      = "Om SFL fördröjs, lägg till X rundor innan SFL aktiveras.",
    ["LPS_SET_USEHEALTH"]       = "Bör SFL spelare BÖRJA med 100 hälsa? Hälsan bevaras inte när man byter föremål!",
    ["LPS_SET_USEARMOR"]        = "Bör SFL spelare få pansar? Börjar med 100 pansar.",
	["LPS_ALLOW_HOLSTER"]		= "Tillåt spelare att sätta vapen i hölster. Detta döljer kontur- och spåreffekter.",
    
    ["LPS_WEPLIST"]             = "Lista över tillgängliga vapen:\n%s\nDu kan skriva 'lps_weapon_list' i konsolen.",
    
	["LPS_SHOW_WEAPON"]			= "Visa Sista Föremålet Levandes vapen?",
    ["LPS_HALO_ENABLE"]         = "Rita en kontur runt det sista föremålet?",
    ["LPS_HALO_SEETHROUGHWALL"] = "Rita konturen genom väggar?",
    ["LPS_HALO_COLOUR"]         = "Färg på konturen för Sista Föremålet Levande ('rainbow' eller hexkod)",
    ["LPS_TRAILS_ENABLE"]       = "Rita ett spår bakom det sista föremålet?",
    ["LPS_TRAILS_COLOUR"]       = "Färg på det sista föremålets spår (hexkod)",
    ["LPS_TRAIL_TEXTURE"]       = "Färgtextur på spåret för det sista föremålet",
    ["LPS_LASER_COLOUR"]        = "Färg på Sista Föremålet Levandes laserpistol ('rainbow' eller hexkod)",
    
    ["LPS_PLAY_MUSIC"]          = "Spela upp bakgrundsmusik när SFL aktiveras. (Appliceras först vid nästa tillfälle)",
    ["LPS_CL_DRAW_HALO"]        = "(Klient) Visa/Dölj konturer, oberoende av servern.",
    
    -- Weapon Settings
    ["LPS_WEPSET_REV_AMMO"]     = "SFL revolverammunition. -1=Oändligt.",
    ["LPS_WEPSET_SMG_AMMO"]     = "SFL kpistammunition. -1=Oändligt.",
    ["LPS_WEPSET_AIR_AMMO"]     = "SFL ammunition för luftbåtskanon. -1=Oändligt",
    ["LPS_WEPSET_SHOT_AMMO"]    = "SFL hagelgevärsammunition. -1=Oändligt",
    ["LPS_WEPSET_RPG_AMMO"]     = "SFL RPG-ammunition. -1=Oändligt",
    
    ["LPS_WEPSET_DAMAGE_REV"]   = "SFL skada för revolver",
    ["LPS_WEPSET_DAMAGE_SMG"]   = "SFL skada för kpist",
    ["LPS_WEPSET_DAMAGE_BLAST"] = "SFL skada för sprängare",
    ["LPS_WEPSET_DAMAGE_AIR"]   = "SFL skada för luftbåtskanon",
    ["LPS_WEPSET_DAMAGE_SHOT"]  = "SFL skada för hagelgevär per kula",
    ["LPS_WEPSET_DAMAGE_RPG"]   = "SFL skada för RPG",
    ["LPS_WEPSET_DAMAGE_LASER"] = "SFL skada för laser varje 0,1s",
    
    -- More into stuff now.
    ["LASTPROP_ANNOUNCE"]       = "Du är Sista Föremålet Levande!",
    ["LASTPROP_ANNOUNCE_ALL"]   = "Det sista föremålet kämpar emot!",
    
    -- Weapon State
    ["WEAPON_STATE_READY"]      = "Redo",
    ["WEAPON_STATE_RELOAD"]     = "Laddar om...",
    ["WEAPON_STATE_OUTOFAMMO"]  = "Ingen ammunition",
    ["WEAPON_STATE_UNARMED"]    = "Inget vapen",
	["WEAPON_STATE_HOLSTER"]	= "<I HÖLSTER>",
	
	["LPS_HOLSTER_HELPER_TEXT"] = "[KLICKA] för att skjuta - H.KLICKA] för att sätta vapen i hölster",
    
    ["WEAPON_AMMO_UNLI"]        = "Oändligt"
}

list.Set("PHX.LanguageInsertion", "[SistaFöremåletLevande] Svenska", L)