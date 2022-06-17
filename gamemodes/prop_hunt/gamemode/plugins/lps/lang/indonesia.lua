local LANG = {}

-- English Section
LANG["id"]   = {
    -- setting menu
    ["LPS_GENERAL_SETTINGS"]    = "Peraturan Umum",
    ["LPS_APPEARANCES"]         = "Penampilan",
    ["LPS_WEAPON_SETTINGS"]     = "Peraturan Senjata",
    
    ["LPS_MENU_ENABLE"]         = "Aktifkan 'Last Prop Standing'",
	["LPS_ENABLE_MUSIC"]		= "Aktifkan Background Musik ketika LPS berlangsung. (Butuh Restart Round)",
    ["LPS_WEAPON_SELECT"]       = "Senjata yang akan diberi: 'random'/'<nama>'. Lihat dibawah.",
    ["LPS_BTN_WEPLIST"]         = "Lihat Daftar Senjata",
    ["LPS_MINIMUM_PROPS_TEAM"]  = "Minimum jumlah prop dalam Tim sebelum LPS akan dimulai. Min 2 yak.",
    
    ["LPS_WEPLIST"]             = "Daftar Senjata untuk Prop:\n%s\nKamu bisa menggunakan 'lps_weapon_list' di console untuk lebih lanjut.",
    
    ["LPS_HALO_ENABLE"]         = "Tampilkan efek Sinar pada Prop Terakhir?",
    ["LPS_HALO_SEETHROUGHWALL"] = "Tampilkan pula efek Sinar dibalik Tembok?",
    ["LPS_HALO_COLOUR"]         = "Warna efek Sinar untuk 'Last Prop Standing' ('rainbow'/kode hex)",
    ["LPS_TRAILS_ENABLE"]       = "Tampilkan Garis Jejak dibelakang Prop Terakhir?",
    ["LPS_TRAILS_COLOUR"]       = "Warna Garis Jejak (kode hex)",
    ["LPS_TRAIL_TEXTURE"]       = "File Tekstur untuk Garis Jejaknya",
    
    ["LPS_PLAY_MUSIC"]          = "Mainkan background musik ketika event LPS berlangsung. (Hanya berlaku di lagu selanjutnya)",
    ["LPS_CL_DRAW_HALO"]        = "(Sisi Client) Tampilkan/Sembunyikan efek Halo, meskipun server sudah atur.",
    
    -- Internal: Weapon Settings
    ["LPS_WEPSET_REV_AMMO"]     = "Amunisi Pistol. -1 = Tanpa Limit",
    ["LPS_WEPSET_SMG_AMMO"]     = "Amunisi SMG. -1 = Tanpa Limit.",
    
    ["LPS_WEPSET_DAMAGE_REV"]   = "Damage untuk Pistol",
    ["LPS_WEPSET_DAMAGE_SMG"]   = "Damage untuk SMG",
    ["LPS_WEPSET_DAMAGE_BLAST"] = "Damage untuk Blaster",
    
    -- More into stuff now.
    ["LASTPROP_ANNOUNCE"]       = "Kamu adalah PROP TERAKHIR!",
    ["LASTPROP_ANNOUNCE_ALL"]   = "Prop Terakhir telah memulai Perlawanan!",
    
    -- Weapon State
    ["WEAPON_STATE_READY"]      = "Siap",
    ["WEAPON_STATE_RELOAD"]     = "Reload...",
    ["WEAPON_STATE_OUTOFAMMO"]  = "Habis!",
    ["WEAPON_STATE_UNARMED"]    = "Ga ada Senjata",
    
    ["WEAPON_AMMO_UNLI"]        = "Tanpa Batas"
}

list.Set("PHX.LanguageInsertion", "[LastPropStanding] Indonesia", LANG)