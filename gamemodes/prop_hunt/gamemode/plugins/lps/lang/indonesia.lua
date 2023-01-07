local LANG = {}

-- English Section
LANG["id"]   = {
    -- Header Text Group
    ["LPS_GENERAL_SETTINGS"]    = "Peraturan Umum",
    ["LPS_APPEARANCES"]         = "Penampilan",
    ["LPS_WEAPON_SETTINGS"]     = "Peraturan Senjata",
    ["LPS_WEAPON_DMG_SETTINGS"] = "Peraturan Damage Senjata",
    ["LPS_HEALTH_ARMOR"]        = "Opsi Nyawa & Tameng",
    ["LPS_TRIGGER_CONDITION"]   = "Pengkondisian Event LPS",
    
    -- Appearance & General Settings
    ["LPS_MENU_ENABLE"]         = "Aktifkan 'Last Prop Standing'",
	["LPS_ENABLE_MUSIC"]		= "Aktifkan Musik ketika LPS berlangsung. (Butuh Restart Round)",
    ["LPS_WEAPON_SELECT"]       = "Senjata yang akan diberi: 'random'/'<nama>'. Lihat dibawah.",
    ["LPS_BTN_WEPLIST"]         = "Lihat Daftar Senjata",
    ["LPS_MINIMUM_PROPS_TEAM"]  = "Minimum jumlah prop dalam Tim sebelum LPS akan dimulai. Min 2 yak.",
    
    ["LPS_START_RANDOM"]        = "Haruskan LPS dimulai secara acak.",
    ["LPS_START_DELAYED"]       = "Haruskah LPS dijeda setelah ronde X berikutnya?",
    ["LPS_START_X_ROUNDS"]      = "Jika jeda diaktifkan, Berapa Jeda yang harus dilompati?",
    ["LPS_SET_USEHEALTH"]       = "Perbolehkan Player LPS DIBERI 100 HP secara AWAL? Tidak berlaku jika mereka ganti prop baru.",
    ["LPS_SET_USEARMOR"]        = "Perbolehkan Player LPS Diberi Tameng? Dimulai dari 100 AP.",
	["LPS_ALLOW_HOLSTER"]		= "Bolehkan untuk Simpan Senjata. Fitur ini juga menonaktifkan efek Halo dan Garis Jejak.",
    
    ["LPS_WEPLIST"]             = "Daftar Senjata untuk Prop:\n%s\nKamu bisa menggunakan 'lps_weapon_list' di console untuk lebih lanjut.",
    
	["LPS_SHOW_WEAPON"]			= "Tampilkan Senjata untuk 'Last Prop Standing'?",
    ["LPS_HALO_ENABLE"]         = "Tampilkan efek Sinar pada Prop Terakhir?",
    ["LPS_HALO_SEETHROUGHWALL"] = "Tampilkan pula efek Sinar dibalik Tembok?",
    ["LPS_HALO_COLOUR"]         = "Warna efek Sinar untuk 'Last Prop Standing' ('rainbow'/kode hex)",
    ["LPS_TRAILS_ENABLE"]       = "Tampilkan Garis Jejak dibelakang Prop Terakhir?",
    ["LPS_TRAILS_COLOUR"]       = "Warna Garis Jejak (kode hex)",
    ["LPS_TRAIL_TEXTURE"]       = "File Tekstur untuk Garis Jejaknya",
    ["LPS_LASER_COLOUR"]        = "Warna untuk senjata Laser ('rainbow'/kode hex)",
    
    ["LPS_PLAY_MUSIC"]          = "Mainkan Musik ketika LPS berlangsung. (Hanya berlaku di lagu selanjutnya)",
    ["LPS_CL_DRAW_HALO"]        = "(Sisi Client) Tampilkan/Sembunyikan efek Halo, meskipun server sudah atur.",
    
    -- Weapon Settings
    ["LPS_WEPSET_REV_AMMO"]     = "Amunisi Pistol. -1=Tanpa Limit",
    ["LPS_WEPSET_SMG_AMMO"]     = "Amunisi SMG. -1=Tanpa Limit.",
    ["LPS_WEPSET_AIR_AMMO"]     = "Amunisi Airboat Gun. -1=Tanpa Limit.",
    ["LPS_WEPSET_SHOT_AMMO"]    = "Amunisi Shotgun. -1=Tanpa Limit.",
    ["LPS_WEPSET_RPG_AMMO"]     = "Amunisi RPG. -1=Tanpa Limit.",
    
    ["LPS_WEPSET_DAMAGE_REV"]   = "Damage untuk Pistol",
    ["LPS_WEPSET_DAMAGE_SMG"]   = "Damage untuk SMG",
    ["LPS_WEPSET_DAMAGE_BLAST"] = "Damage untuk Blaster",
    ["LPS_WEPSET_DAMAGE_AIR"]   = "Damage untuk Airboat Gun",
    ["LPS_WEPSET_DAMAGE_SHOT"]  = "Damage untuk Shotgun per 1 peluru",
    ["LPS_WEPSET_DAMAGE_RPG"]   = "Damage untuk RPG",
    ["LPS_WEPSET_DAMAGE_LASER"] = "Damage untuk Laser per 0.1 detik",
    
    -- More into stuff now.
    ["LASTPROP_ANNOUNCE"]       = "Kamu adalah PROP TERAKHIR!",
    ["LASTPROP_ANNOUNCE_ALL"]   = "Prop Terakhir telah memulai Perlawanan!",
    
    -- Weapon State
    ["WEAPON_STATE_READY"]      = "Siap",
    ["WEAPON_STATE_RELOAD"]     = "Reload...",
    ["WEAPON_STATE_OUTOFAMMO"]  = "Habis!",
    ["WEAPON_STATE_UNARMED"]    = "Tanpa Senjata",
	["WEAPON_STATE_HOLSTER"]	= "<DISIMPAN>",
	
	["LPS_HOLSTER_HELPER_TEXT"] = "[KLIK] Tembak - [KLIK-KANAN] Simpan",
    
    ["WEAPON_AMMO_UNLI"]        = "Tanpa Batas"
}

list.Set("PHX.LanguageInsertion", "[LastPropStanding] Indonesia", LANG)