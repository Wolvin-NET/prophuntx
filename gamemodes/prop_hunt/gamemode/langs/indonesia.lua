local L={}

L.code = "id"

L.Name 		 	= "Bahasa Indonesia"
L.NameEnglish	= "Indonesian Language" --Note: to prevent controversy, this should written "Indonesian Language" because Malay can often use "Bahasa Malay" too!
L.Author			= "Wolvindra-Vinzuerio, KamFretoZ" -- Only accept STRINGS.
-- Can Accept: String, and Table.
L.AuthorURL		= "https://steamcommunity.com/profiles/76561198210777189"

-- Special Section that isn't String-based
L.SUICIDEMSG = {  -- Fix me: there was addition text here but feel free to add more.
	"kesandung semut.",
	"ditampol emak-emak kos.",
	"kesantet.",
	"kekurangan gizi.",
	"diterkam sumanto.",
	"ketemu kang bakso.",
	"ditampol sama emak.",
	"mabok minum aqua.",
	"dihajar bang jaog.",
	"kebanyakan micin.",
	"kebanyakan nyemil baygon.",
	"kesurupan.",
	"ditampol setan.",
	"ketampol sendiri.",
	"abis nonton film Dora.",
	"kejedot tiang.",
	"kekurangan extrak manggis.",
	"kena trap lengkuas di rendangnya nasi padang.",
	"kaget ketemu astolfo.",
	"diculik om om",
	"diculik om igor orlov",
	"kaget ketemu igor orlov",
	"dicoret dari KK.",
	"ketimpa Gaben.",
	"lupa belom mandi.",
	"menyadari besok senin.",
	"lupa bernafas.",
	"mau nyoba bernafas manual tapi malah dapet matic.",
	"mau nyoba bernafas manual tapi ga jago.",
	"kurang jaog.",
	"terjatuh dalam luka dalam.",
	"tertima kemiskinan.",
	"ketahuan emak ke warnet.",
	"di jewer emak.",
	"udah ga kuat.",
	"udah ga kuat merasakan penderitaan ini :(", -- sedih amat njir
}

L.RANDOM_SPECTATORS = { --> FRETTA
	"pengen nonton hiburan :)",
	"cuman buat gabut.",
	"cuman buat nonton.",
	"pengen lihat-lihat.",
	" ",
}

L["PHX_TEAM_CONNECTING"] = "Menyambung"
L["PHX_TEAM_PROPS"]		= "Prop"
L["PHX_TEAM_HUNTERS"] 	= "Pemburu"
L["PHX_TEAM_UNASSIGNED"]	= "Belum Join"
L["PHX_TEAM_SPECTATOR"] 	= "Penonton"

-- List of string-based translation

-- // FRETTA SECTION \\
--  FRETTA: Kill text (X killed Y)
L["HUD_KILLED"]				= "membunuh"

-- FRETTA: HUDs
L["HUD_TIME"] 				= "WAKTU"
L["HUD_ROUND"]				= "RONDE"
L["HUD_WAITPLY"]				= "Menunggu pemain lainnya..."
L["HUD_DEAD"]				= "(MATI) "

L["HUD_TEAMWIN"]				= "%s menang!"
L["HUD_LOSE"]				= "Seri, semuanya kalah!"
L["MISC_TIMELEFT"]			= "Waktu Tersisa: %s detik"
L["MISC_GAMEEND"] 			= "Permainan akan berakhir setelah ronde ini."

-- FRETTA: Team selection screen (F2)
L["DERMA_TEAMSELECT"]		= "Pilih Tim"

-- FRETTA: F1 screeen
L["DERMA_RTV"] 				= "Usulkan Ganti Map/RTV"
L["DERMA_PHMENU"] 			= "Menu Prop Hunt Lainnya"
L["DERMA_CHANGETEAM"]		= "Ganti Tim"

-- FRETTA: Scoreboard
L["DERMA_PLAYER"]			= "(%d pemain)"
L["DERMA_PLAYERS"]			= "(%d total pemain)"
L["DERMA_NAME"]				= "Nama"
L["DERMA_KILLS"]				= "Skor"
L["DERMA_DEATHS"]			= "Mati"
L["DERMA_PING"]				= "Ping"
L["DERMA_SERVER_TAG"]		= "SVR"
L["DERMA_BOT_TAG"]			= "BOT"
L["DERMA_GAMEMODE_CREDITS"]	= "%s | Versi: %s, Revisi %s"

L["CHAT_JOINED"]				= " bergabung "
L["CHAT_JOINEDTHE"]			= " menjadi " -- ini ke Team Spectator

L["CHAT_SWAPBALANCE"]		= "%s telah diganti ke %s untuk menyeimbangkan tim."
L["CHAT_SWAPBALANCEYOU"]		= "Kamu telah dipindahkan dari tim sebelumnya agar supaya lebih seimbang." -- Smile... for even in death, you have become children of Thanos

-- Fretta Splash Screen
L["SPASHSCREEN_BY_X"]		= "Oleh %s"
-- RichTextBox
L["HELP_DONATORS_AND_CONTRIBUTORS"]  = "\n\nDonor & Kontributor:\n- %s"

-- // END OF FRETTA SECTION \\

L["HELP_F1"] 				= [[Project Prop Hunt X.

Sebuah proyek mode permainan "Prop Hunt" untuk lebih modern dan optimal.

Informasi lebih lanjut bisa kunjungi di:
https://gmodgameservers.com/prophuntx

Untuk melihat tutorial, pengaturan, dan menu lainnya bisa diakses melalui:
Tombol [F1], tekan menu 'Menu Prop Hunt'.

Versi: ]].. PHX.VERSION ..[[ Revisi ke: ]].. PHX.REVISION ..[[

Selamat Bermain! :)
]]

-- Important!
L["LANGUAGE_CHANGED"]		= "Preferensi bahasa kamu sekarang diganti ke %s"

-- internal cl_menutypes section.
L["SUBTYPE_PREFERED_LANG"]	= "Preferensi Bahasa"

-- Events
L["EV_PLAYER_CONNECT"]		= "%s telah tersambung ke server."
L["EV_PLAYER_JOINED"]		= "%s telah bergabung di server."
L["EV_PLAYER_DISCONNECT"]	= "%s telah keluar dari server (Alasan: %s)"

-- HUD elements
L["HUD_HP"]					= "NYAWA"
L["HUD_AMMO"] 				= "PELURU"
L["HUD_MAGSEC"]				= "ISI / CAD." --Magazine | Secondary Magazine

L["TEAM_PROPS"]				= L["PHX_TEAM_PROPS"] 	--"Props"
L["TEAM_HUNTERS"]			= L["PHX_TEAM_HUNTERS"] 	--"Hunters"

L["HUD_ROTLOCK"]				= "Rotasi: Terkunci"
L["HUD_ROTFREE"]				= "Rotasi: Bebas"
L["HUD_KILLEDBY"]			= "Kamu barusan dibunuh oleh %s"

L["HUD_AUTOTAUNT"]			= "Taunt Otomatis dalam %d detik"
L["HUD_AUTOTAUNT_ALT"]		= "Taunt Otomatis dalam %d"
L["HUD_AUTOTAUNT_DISABLED"]	= "Taunt Otomatis non-aktif."

L["HUD_TargetID"]			= "Pemain: %s (%d%%)" -- Player: <NAME> (<HEALTH>%)

L["HUD_BLINDED"]				= "%s akan dilepaskan dalam %s"
L["HUD_UNBLINDED"]			= "Siap atau nggak, kami datang!"

L["BLIND_RESPAWN_TEAM"]		= "Kamu telah ter-respawn pada tim %s dalam waktu %d detik ketika hunter memejamkan mata."
L["BLIND_RESPAWN"]			= "Kamu telah ter-respawn dalam waktu %d detik ketika hunter memejamkan mata."

L["MISC_ACCEPT"]				= "Terima"
L["MISC_OK"]					= "OK"
L["MISC_CLOSE"]				= "Tutup"
L["MISC_PREV"]				= "< MUNDUR"
L["MISC_NEXT"]				= "MAJU >"
L["MISC_ACCESSDENIED"]		= "Akses Ditolak"

-- Chat messages
L["CHAT_NOPLAYERS"]			= "Tidak cukup player untuk memulai game!"
L["CHAT_SWAP"]				= "Tim telah ditukar!"

L["CHAT_SWAPTEAM_WARNING"]   = "Kamu sudah berpindah tim sebanyak %dx (%dx Maksimal). Setelah itu kamu tidak dapat berpindah tim lagi."
L["CHAT_SWAPTEAM_REVERT"]	= "Kamu tidak dapat pindah ke tim %s karena kamu sudah melebihi batas yang di izinkan untuk mengganti tim."

L["CHAT_PROP_NO_ROOM"] 		= "Tidak ada tempat untuk berubah manjadi prop tersebut!"

-- Notification
L["NOTIFY_IN_PROP_TEAM"]		= "Kamu sedang di tim prop! Sebagai prop, kamu dapat berputar dengan menggerakan mouse."
L["NOTIFY_ROTATE_NOTICE"]	= "Kamu juga dapat mengunci rotasi dengan menekan tombol [R]!"

-- Custom Taunt Window
L["TM_WARNING_CT_DISABLE"]	= "[PHX - Taunts] Peringatan: Custom taunt tidak tersedia di server ini."
L["TM_NO_TAUNTS"]			= "Peringatan: Tidak ada taunt yang terdeteksi di kategori ini."
L["TM_PLAY_ONLY_ALIVE"] 		= "Kamu hanya dapat menggunakan Custom Taunt disaat kamu masih hidup."

L["TM_WINDOW_TITLE"]			= "Prop Hunt Custom Taunt"
L["TM_NOTICE_PLSWAIT"]		= "Harap tunggu %s detik sebelum random taunt berakhir!"
L["TM_NOTICE_PLAYPREVIEW"]	= "Memainkan Taunt: %s"

L["TM_TOOLTIP_PLAYTAUNT"] 	= "Mainkan Taunt"
L["TM_TOOLTIP_PREVIEW"]		= "Dengarkan Taunt"
L["TM_TOOLTIP_PLAYCLOSE"]	= "Mainkan taunt dan tutup jendela"
L["TM_TOOLTIP_PLAYRANDOM"]	= "Mainkan taunt secara acak"
L["TM_TOOLTIP_CLOSE"]		= "Tutup"
L["TM_MENU_CLOSE"]			= "Tutup Menu"

L["TM_DELAYTAUNT_NOT_EXIST"] = "Taunt yang kamu pilih tidak dapat ditemukan di server ini!"
L["TM_DELAYTAUNT_PLSWAIT"]	= "Harap tunggu %s detik!"

-- PHX Menu window
L["PHXM_WINDOW_TITLE"]		= "Prop Hunt X - Menu & Pengaturan lebih lanjut"
L["SERVER_INFO_MOTD"]		= "INFORMASI SERVER & PERATURAN [MOTD]"

L["PHXM_TAB_HELP"]			= "Panduan"
L["PHXM_TAB_MUTE"]			= "Bisukan Pemain"
L["PHXM_TAB_PLAYER"]			= "Pengaturan Saya"
L["PHXM_TAB_MODEL"] 			= "Player Model"
L["PHXM_TAB_MODEL_DISABLED"]	= "Player Model"
L["PHXM_TAB_ADMIN"]			= "Pengaturan Admin"
L["PHXM_TAB_ABOUT"]			= "Tentang PH:X"
L["PHXM_TAB_MAPVOTE"]		= "Pengaturan MapVote"

L["PHXM_CVAR_CHANGED"]		= "[Pengaturan] ConVar %q telah diganti %q"

-- Player Mute Settings
L["PHXM_MUTE_SELECT"]		= "Pilih siapapun yang ingin kamu diamkan."

-- Player Settings
L["PHXM_PLAYER_OPTIONS"]		= "Pengaturan Player"
L["PHXM_PLAYER_LANG"]		= "Bahasa"
L["PHXM_PLAYER_BIND"]		= "Binds"
L["PHXM_PLAYER_HUDSETTINGS"]	= "Pengaturan HUD"

L["PHXM_PLAYER_TAUNT_KEY"]			= "Tombol Taunt Sembarang"
L["PHXM_PLAYER_TAUNTWINDOW_KEY"]		= "Tombol Taunt Menu"
L["PHXM_PLAYER_ROTATLOCK_KEY"]		= "Tombol Kunci Rotasi"

L["PHXM_PLAYER_TOGGLE_HALOS"]		= "Alihkan efek 'Halo' saat memilih prop"
L["PHXM_PLAYER_IDNAMES"]				= "Tampilkan nama player diatas kepala mereka (Tampil dibalik dinding juga)"
L["PHXM_PLAYER_ENDROUND_CUE"]		= "Mainkan suara akhir ronde"
L["PHXM_PLAYER_TAUNTMENU_AUTOCLOSE"]	= "Otomatis tutup setelah meng-dobel klik pada daftar Taunt Menu."
L["PHXM_PLAYER_SEE_HUNTER_LINE"]		= "Tampilkan garis pada hunter sehingga kita bisa melihat arahan mereka."
L["PHXM_PLAYER_SEE_LBALL_ICONS"]		= "Tampilkan 'Ikon Bola-Gaca' pada saat benda tersebut muncul"
L["PHXM_PLAYER_SEE_CRYSTAL_ICONS"]	= "Tampilkan 'Ikon Kristal-Setan' pada saat benda tersebut muncul"

L["PHXM_PLAYER_USE_NEW_HUD"]			= "Gunakan HUD Prop Hunt: X Baru"
L["PHXM_PLAYER_SHOW_TUTOR"]			= "Tampilkan tutorial singkat (Hanya muncul 2x pada saat spawn)"
L["PHXM_PLAYER_USE_NEW_CROSSHAIR"]	= "Tampilkan Crosshair Baru"
L["PHXM_PLAYER_SHOW_TEAM_TOPBAR"]	= "Tampilkan jumlah player yang masih hidup (Setidaknya 4 pemain dibutuhkan)"

-- Player model Browser Section
L["QUERY_MODEL_SELECTED"]	= "Skin %s telah terpilih dan akan digunakan setelah respawn."
L["QUERY_MODEL_INFO"]		= "Nama skin: %s - Tersedia untuk: Semua Orang"

L["MDL_MENU_REFRESH"] 		= "Muat ulang Ikon"
L["MDL_MENU_PREVIEW"] 		= "Pratinjau Skin"
L["MDL_MENU_MODELINFO"] 		= "Informasi Skin"


L["MISC_APPLYMDL"] 			= "Skin Diterapkan"

L["PHXM_MODEL_DISABLED"] 	= "Skin kustom telah di non-aktifkan di server ini."
L["PHXM_PLAYERMODEL_SETFOV"]	= "  Atur Kamera jarak/FOV"

-- Server Settings
L["PHXM_ADMIN_OPTIONS"]		= "Opsi-opsi Gamemode server (Hanya tampil jika kamu seorang Admin)"
L["PHXM_ADMIN_MUSTALIVE"]	= "Kamu harus dalam keadaan hidup untuk menaktifkan mode ini."

-- Language Override
L["PHXM_ADMIN_LANGOVERRIDE"]	= "Kontrol Bahasa"

L["PHXM_ADMIN_FORCELANG"] 				= "Gunakan Satu Bahasa? Pengaturan ini akan mengabaikan bahasa user yang telah dipilih dan mengikuti bahasa dari server."
L["PHXM_ADMIN_LANGTOUSE"]				= "Bahasa yang digunakan"
L["PHXM_ADMIN_PLAYERDEFAULTLANG"] 		= "Bahasa utama ketika pemain baru pertama kali main"

-- Gameplay settings
L["PHXM_ADMIN_CUSTOM_MODEL"]				= "Aktifkan kustom skin untuk Hunter"
L["PHXM_ADMIN_CUSTOM_MODEL_PROP"]		= "Aktifkan kustom skin untuk Props - Pastikan hunter juga diaktifkan!"
L["PHXM_ADMIN_TAUNT_DELAY_CUSTOM"]		= "Waktu tunda Taunt kustom (detik)"
L["PHXM_ADMIN_TAUNT_DELAY_RANDOM"]		= "Waktu tunda Taunt sembarang (detik)"
L["PHXM_ADMIN_TAUNT_DELAY_AUTO"]			= "Waktu tunda Taunt otomatis (detik)"
L["PHXM_ADMIN_AUTOTAUNT_ENABLE"]			= "Aktifkan fitur Taunt otomatis (Timer akan berfungsi setelah ronde baru"

L["PHXM_ADMIN_NOTICE_ROTATION"]			= "Tampilkan notifikasi 'Rotasi Prop' setiap kamu spawn"
L["PHXM_ADMIN_CAMERA_COLLIDE"]			= "Aktifkan Kamera agar tidak tembus dinding"
L["PHXM_ADMIN_FREEZECAM"]				= "Aktifkan 'Freeze Cam' untuk tim Prop"
L["PHXM_ADMIN_FREEZECAM_HUNTER"]			= "Aktifkan 'Freeze Cam' untuk tim Hunter"
L["PHXM_ADMIN_PROP_COLLIDE"]				= "Aktifkan prop bersentuhan dengan yang lainnya"
L["PHXM_ADMIN_SWAP_TEAM"] 				= "Tukarkan team setiap round - Non-aktifkan fitur ini akan membuat tim untuk tidak berpindah."
L["PHXM_ADMIN_HUNTER_PENALTY"]			= "Nyawa Pinalti untuk Hunter"
L["PHXM_ADMIN_HUNTER_KILL_BONUS"]		= "Jumlah Tambahan Bonus ketika Hunter membunuh Prop"
L["PHXM_ADMIN_HUNTER_SMG_GRENADES"]		= "Jumlah Granat Hunter SMG"
L["PHXM_ADMIN_GAME_TIME"]				= "(Butuh Map Restart) Total Game time (menit)"
L["PHXM_ADMIN_BLINDLOCK_TIME"]			= "Waktu hunter memejamkan mata (detik)"
L["PHXM_ADMIN_ROUND_TIME"]				= "(Butuh Map Restart) Waktu ronde permainan (detik)"
L["PHXM_ADMIN_ROUNDS_PER_MAP"]			= "(Butuh Map Restart) Total ronde per satu Map"
L["PHXM_ADMIN_ENABLE_LUCKYBALL"]			= "Perbolehkan 'Bola-Ghaca' untuk muncul di setiap Prop yang mudah dihancurkan? (Kesempatan 10%)"
L["PHXM_ADMIN_ENABLE_CRYSTAL"]			= "Perbolehkan 'Kristal-Setan' untuk muncul ketika Hunter mati?"
L["PHXM_ADMIN_WAIT_PLAYERS"]				= "Tunggu player lain untuk memulai permainan"
L["PHXM_ADMIN_WAIT_MIN_PLAYERS"]			= "Minimal pemain untuk menunggu sebelum permainan dimulai (default: 1)"
L["PHXM_ENABLE_PLAYER_JOIN_LEAVE"] 		= "Aktifkan notifikasi untuk Pemain Keluar Masuk? Ganti ke 0 jika kamu ingin menggunakan dari addon lain."

L["PHXM_ADMIN_FORCEJOINBALANCE"]			= "Perbolehkan player untuk masuk ke tim tertentu walaupun timnya sudah penuh?"
L["PHXM_ADMIN_ENABLETEAMBALANCE"]		= "Otomatis genapkan tim ketika tim tidak sempurna/seimbang"

L["PHXM_ADMIN_TAUNTMODES"]		= "Mode Taunt"
L["PHXM_ADMIN_TAUNTMODE_MODE"]	= "--[Mode taunt saat ini: %d ]--"
L["PHXM_ADMIN_TAUNTMODE0"]		= "Mode [0]: Taunt Sembarang"
L["PHXM_ADMIN_TAUNTMODE1"]		= "Mode [1]: Taunt Kustom"
L["PHXM_ADMIN_TAUNTMODE2"]		= "Mode [2]: Dua-duanya"
L["PHXM_ADMIN_TAUNTSOPEN"]		= "Buka jendela Taunt"

L["PHXM_ADMIN_PICKUP_PROPS"] 			= "Perbolehkan untuk mengambil objek kecil? 0: Tidak boleh, 1: Hunters saja, 2: Props saja, 3: Bolehkan semuanya."
L["PHXM_MODE_DEFAULT"] 					= "--[ Mode mengambil object saat ini: %d ]--"
L["PHXM_MODE0"]							= "Mode [0]: Tidak boleh"
L["PHXM_MODE1"]							= "Mode [1]: Hunters saja"
L["PHXM_MODE2"]							= "Mode [2]: Props saja"
L["PHXM_MODE3"]							= "Mode [3]: Bolehkan semuanya"

-- Admin Developer Sections
L["PHXM_ADMIN_DEVSECTION"]		= "Fitur Experimen / Developers"
L["PHXM_ADMIN_ROOMCHECK"]		= "Aktifkan pengecekan batas-batas pada object? Ini mencegah agar prop tidak tersangkut."
L["PHXM_ADMIN_USENEWMKBREN"]		= "Gunakan skin baru untuk senjata 'Bren MK II' (BUTUH MAP RESTART!)"
L["PHXM_ADMIN_BEVERBOSE"]		= "Developer: Be Verbose - Aktifkan fitur 'verbose' sehingga akan meginformasikan segala hal event."
L["PHXM_ADMIN_SHOWPLNAMEHEAD"]	= "Tampilkan nama player diatas kepala"
L["PHXM_ADMIN_USESINGLE_FZCAM"]	= "Gunakan satu suara 'Freeze Cam'"
L["PHXM_ADMIN_MODELLISTINGTYPE"] = "Tampilkan Skin dari: 0: Semua Playermodel, 1: Kustom: list.Get('PlayerOptionsModel')"
L["PHXM_ADMIN_JUMPPOWER"]		= "Tambahan tinggi lompat pada tim Prop"
L["PHXM_ADMIN_ENABLE_OBB"]		= "Developer: Aktifkan Enable Customized Prop Entities Model Boundaries (OBB) Modifier from config data" --Untranslateable
L["PHXM_ADMIN_RELOAD_OBB"]		= "Developer: Reload OBB Modifier data every round restarts" --Untranslateable

-- Experimental & PH:X Features
L["PHXM_ADMIN_EXPERIMENTALPHX"]			= "Seksi Fitur Experimen PH:X Baru"

L["PHXM_ADMIN_HLA_COMBINE"]				= "Tambahkan dukungan skin dari 'HL:Alyx Combine'"
L["PHXM_ADMIN_TEAMBALANCE"]				= "Aktifkan Pengeimbang Tim"
L["PHXM_ADMIN_CHANGETEAM_LIMIT"]			= "Aktifkan pembatasan tukar tim - Atur -1 untuk non-aktifkan. "
L["PHXM_ADMIN_USENEWCHAT"]				= "Gunakan ChatBox baru (eChat) - Fitur ini sementara. Jika kamu sudah punya chat baru, jangan dicentang."
L["PHXM_ADMIN_NEWCHATPOS"]				= "Kurangi berapa piksel untuk tinggi posisi chat Y. Default 45 piksel."
L["PHXM_ADMIN_RESPAWNONBLIND"]			= "Perbolehkan respawn pada saat Memejamkan mata"
L["PHXM_ADMIN_RESPAWNONBLIND_TEAM"]		= "Perbolehkan respawn pada saat Memejamkan mata untuk spesifik tim saja: 0: Semua, 1: Hunters, 2: Props"
L["PHXM_ADMIN_REWSPANTIMEPERCENT"]		= "Persentase waktu untuk memperbolehkan pemain untuk respawn. Default 0.75 (artinya 75% x Maximal Waktu memejamkan mata)"
L["PHXM_ADMIN_ALLOWRESPAWN_SPECTATOR"]	= "Perbolehkan respawn pada saat Memejamkan mata saat pindah dari tim Spektator"
L["PHXM_ADMIN_ALLOWRESPAWN_TEAMCHANGE"]	= "Perbolehkan respawn pada saat Memejamkan mata saat pindah dari tim lain (Tidak disarankan untuk mengaktifkan fitur ini)"

--[[
	MapVote Settings
]]
L["PHXM_MV_SETTINGS"]			= "Pengaturan Map Usulan (Voting)"

L["PHXM_MV_ALLOWCURMAP"]			= "Perbolehkan map sekarang untuk di voting?"
L["PHXM_MV_COOLDOWN"]			= "Aktifkan map 'Cooldown' untuk voting."
L["PHXM_MV_USE_ULX_VOTEMAPS"]	= "Gunakan daftar map dari ULX votemap? jika tidak akan menggunakan filter dari 'maps/*.bsp'."
L["PHXM_MV_MAPLIMIT"]			= "Jumlah map yang akan tampil di daftar voting"
L["PHXM_MV_TIMELIMIT"]			= "Waktu dalam detik untuk melakukan voting."
L["PHXM_MV_MAPBEFOREREVOTE"]		= "Berapa kali 'ganti map' untuk map yang dipilih tampil kembali"
L["PHXM_MV_RTVCOUNT"]			= "Berapa banyak pemain untuk bisa melakukan RTV ('Rock the Vote')"

L["PHXM_MV_EXPLANATION1"]		= "Untuk mengatur map apa yang akan dipilih, gunakan variable konsol 'mv_map_prefix' dengan mengisi: 'ph_,cs_,de_,'."
L["PHXM_MV_EXPLANATION2"]		= "Jika kamu menggunakan ULX, gunakan 'map_vote'. Jika tidak, gunakan 'mv_start'"
L["PHXM_MV_EXPLANATION3"]		= "Aksi MapVote"

L["PHXM_MV_START"]		= "Mulai MapVote"
L["PHXM_MV_STOP"]		= "Hentikan MapVote"

--[[ 
	Versioning, Credits or About section
]]
L["PHXM_ABOUT_VERSIONING"]	= "Versi: %s - Revisi: %s"
L["PHXM_ABOUT_AUTHOR"]		= "Oleh: %s"
L["PHXM_ABOUT_ENJOYING"]		= "Jika kamu senang bermain Prop Hunt X, jangan lupa support ya! :)"
L["PHXM_ABOUT_UPDATE"]		= "Update untuk Prop Hunt X"

L["PHXM_VIEW_UPDATE_INFO"]		= "Lihat info perbaharuan"
L["PHXM_CHECK_FOR_UPDATES"]		= "Cek untuk Update"
L["PHXM_UPDATE_FOUND_TEXT"]		= "Update telah di cek. Silahkan cek di console untuk informasi lebih lanjut.\n\nApakah kamu ingin melihat informasi update?"
L["PHXM_UPDATE_FOUND_TITLE"]   	= "Informasi Update"
L["PHXM_UPDATE_FOUND_BUTTON"]   	= "Lihat Update"

L["UPDATE_NOTIFY_MSG_NOTFOUND"]	= "Tidak ada informasi update. Mohon klik tombol 'Cek untuk Update' dahulu!"
L["UPDATE_NOTIFY_MSG_TITLE"]		= "Tidak ada update"
L["UPDATE_NOTIFY_WINDOW_TITLE"]	= "Pemberitahuan Update"
L["UPDATE_RTBOX_APPEND"]			= "\n\nInformasi Tambahan:\nSaat ini kamu menggunakan versi: %s Revisi: %s"
L["UPDATE_BTN_SEEFULL"]			= "Lihat Semua Pembaharuan"

L["PHXM_ABOUT_LINKS"]		= "Tautan dan Kredit"
L["PHXM_ABOUT_THANKS"]		= "Terima kasih banyak untuk Bantuan, Sugesti & Kontribusi kepada:\n %s"
L["PHXM_ABOUT_BTN_DONATE"]		= "Bantu PH:X dengan Donasi"
L["PHXM_ABOUT_BTN_HOME"]			= "Halaman Utama PH:X"
L["PHXM_ABOUT_BTN_GITHUB"]		= "GitHub Repository PH:X"
L["PHXM_ABOUT_BTN_PLUGINS"]		= "Plugin PH:X"
L["PHXM_ABOUT_BTN_CHANGELOGS"]	= "Catatan Riwayat PH:X"

L["HUD_SPECTATING"]	= "MENONTON"
L["HUD_YOUDIED"]		= "Kamu Mati!"

L["CHAT_STARTING_MAPVOTE"] = "Ronde telah Berakhir. Memulai 'MapVote'..."

L["HUD_PROP_TAUNT_TIME"]	= "Taunt"
L["HUD_PROP_CTAUNT_TIME"] = "Taunt Kustom"

L["PHXM_TAB_PLUGINS"]				= "Plugin & Tambahan"

L["PLUGINS_NO_PLUGINS"]				= "Tidak ada plugin terinstall. Cari plugin lainnya disini!"
L["PLUGINS_BROWSE_MORE"]				= "Cari plugin lainnya"
L["PLUGINS_SERVER_HAS_NO_PLUGINS"]	= "Server ini tidak mepunyai plugin atau tambahan (addon) terinstall."
L["PLUGINS_SERVER_SETTINGS"]			= "-- Pengaturan Server --"
L["PLUGINS_CLIENT_SETTINGS"]			= "-- Pengaturan Pengguna --"

-- Text Entries
L["TEXTENTRY_FZ_SINGLE"] = "Rintis untuk suara Freeze Cam"
L["TEXTENTRY_MV_PREFIX"] = "Imbuhan untuk MapVote"

-- Late Addition: 29.10.21/X2Z.

L["MISC_GAME_ENDED"]		= "Permainan telah berakhir."

--[[
	Credits: Late Addition: Revision: 16.09.21/X2Z
]]

L["PHXM_ABOUT_BTN_WIKI"]			= "Bantuan & Wiki PH:X"

--[[
	Auto Taunt: Late Addition: Revision: 16.09.21/X2Z
]]

L["HUD_AUTOTAUNT_DISABLED"]		= 	"Taunt Otomatis Non-aktif."
L["HUD_AUTOTAUNT_WAITFORUPDATE"]	=	"Sedang sinkron taunt otomatis..."

--[[
	MapVote: Late Addition: Revision: 16.09.21/X2Z
]]
L["PHXM_MV_VOTEROCKED"]				= " Vote telah ditentukan, map vote akan dimulai setelah ronde berakhir"
L["PHXM_MV_VOTEROCKED_IMMINENT"]		= "Vote telah ditentukan, map vote dimulai!"
L["PHXM_MV_VOTEROCKED_PLY_TOTAL"]	= "%s telah menyuarakan map vote. ( %d / %d )"

L["PHXM_MV_MUST_WAIT"]				= "Kamu harus menunggu sebentar sebelum voting!"
L["PHXM_MV_VOTEINPROG"]				= "Proses vote sedang berlangsung!"
L["PHXM_MV_HAS_VOTED"]				= "Kamu barusan sudah voting!"
L["PHXM_MV_ALR_IN_VOTE"]				= "Sudah ada vote berlangsung, ini lagi ganti mapnya!"
L["PHXM_MV_NEED_MORE_PLY"]			= "Kamu butuh banyak pemain sebelum melakukan voting!"

--[[
	Late Addition: Revision: 16.09.21/X2Z
]]
L["PROP_PLAYERMDL_BANNED"]	= "Kustom Prop Player Model kamu tidak bisa digunakan saat ini."

--[[
	Prop Menu/Prop Chooser, Revision: 16.09.21/X2Z
]]

L["PCR_USAGE_UNLIMIT"]		= "[Prop Menu] Kamu bisa gunakan menu ini **Sepuasnya**!"
L["PCR_USAGE_COUNT"]			= "[Prop Menu] Kamu bisa gunakan %dx lagi!"
L["PCR_PLS_WAIT"]			= "[Prop Menu] Mohon tunggu dalam %d detik."
L["PCR_NOROOM"]				= "[Prop Menu] Tempatmu kurang luas untuk mengganti prop ini!"
L["PCR_PROPBANNED"]			= "[Prop Menu] Prop ini telah dilarang dari server."
L["PCR_PROPBANNED_BYPCR"]	= "[Prop Menu] Kamu tidak bisa menggunakan prop ini."
L["PCR_REACHED_LIMIT"]		= "[Prop Menu] Kamu telah mencapai batas maksimal!"
L["PCR_STAY_ON_GROUND"]		= "[Prop Menu] Kamu harus menyentuh tanah dan tidak melompat atau tidak sedang jongkok!"
L["PCR_ONLY_GROUP"]			= "[Prop Menu] Hanya grup tertentu bisa menggunakan menu ini!"
L["PCR_NOT_EXIST_COUNT"]		= "Prop yang kamu pilih tidak berlaku di map ini! ( %s / 4 )"
L["PCR_NOT_EXIST"]			= "Prop yang kamu pilih tidak berlaku di map ini!"

-- PCR Client section, reason why there is a space because of chat.AddText between args.
L["PCR_NOTIFY_1"]			= " Server Ini menggunakan Prop Menu versi %s! Ketik "
L["PCR_NOTIFY_2"]			= " di console atau tekan tombol [F1] -> [Bantuan Prop Menu]."
L["PCR_CL_DISABLED"]			= " Kamu tidak bisa menggunakan fitur ini."
L["PCR_CL_GROUP"]			= " Hanya grup tertentu bisa menggunakan menu ini!"
L["PCR_CL_LIMIT"]			= " Kamu telah mencapai batas maksimal!"
L["PCR_UNLIMIT_TEXT"]		= "Sepuasnya"
L["PCR_WINDOW_TITLE"]		= "PHX Prop Menu"
L["PCR_HEADER_TOP"]			= "Pilih prop sesukamu. Kamu punya"
L["PCR_HEADER_MID"]			= "%sx batas"
L["PCR_HEADER_BOTTOM"]		= "penggunaan untuk menggunakan fitur ini!"
L["PCR_CL_TOOLTIP_BANNED"]	= "Kamu tidak bisa menggunakan model ini."
L["PCR_CL_TOOLTIP_MODEL"]	= "Model: %s"
L["PCR_CL_MENU_NOTREADY"]	= " Fitur ini sedang belum ada saat ini."
L["PCR_WINDOW_GUIDE_TTL"]	= "Panduat Cepat: Prop Menu"
L["PCR_BTN_HELP_MENU"]		= "Bantuan Prop Menu"

L["PCR_CL_CMDUSEULX"]		= " Perintah ini di non-aktifkan. Gunakan 'ulx propmenu' atau '!propmenu' di chat!"
L["PCR_CMD_ULX_DISABLED"]	= "Perintah 'ulx propmenu' di non-aktifkan. Tekan [Tombol Bind Prop Menu] untuk membuka menunya."

L["PCR_EDT_IN_USE"]			= "Seorang admin sedang menyunting prop menu. Tunggu sebentar!"
L["PCR_EDT_ERROR_DISABLED"]	= "[Prop Menu] Error: Tambahan Prop Kuston di non-aktifkan!"
L["PCR_EDT_NO_RIGHTS"]		= "Kamu tidak mempunyai hak untuk mengakses ini."

--[[
	Admin Section, Revision: 16.09.21/X2Z
]]
L["PHXM_PLAYER_PROP_CHOOSER_KEY"]	= "Tombol Bawaan untuk membuka Prop Menu (Prop Chooser)."
L["PHXM_PROP_FREEZE_MIDAIR"]			= "Tombol Bawaan untuk menggunakan fitur 'Diam Ditempat' pada saa di udara sebagai Prop."
L["PHXM_ADMIN_PROP_RIGHT_CLICK"]		= "Haruskah prop juga bisa taunt pada saat menekan tombol mouse klik kanan?"
L["PHXM_ADMIN_TAUNT_SCANNER"]		= "(Butuh Map Restart) Aktifkan Taunt Scanner? Sehingga taunt akan di scan otomatis melalui folder."
L["PHXM_ADMLBL_USABLE_ENTS"]			= "Tipe Prop Entity yang bisa Digunakan"
L["PHXM_ADMLBL_USABLE_ENTS_REF"]		= "Tipe-tipenya yaitu: 1: Hanya benda Fisik, 2: Fisik & Dinamik, 3: Hampir Semua termasuk Ragdoll, 4: Kustom."
L["PHXM_ADMIN_USABLE_ENT_TYPE"]		= "Tipe Entity yang digunakan untuk Prop untuk menyamar"
L["PHXM_ADMIN_NOTIFY_ENT_TYPE"]		= "Beri Tahu prop tentang beberapa entity tidak bisa disamar dengan menekan tombol E. Hanya berlaku jika 'ph_usable_prop_type' di-set ke 3 atau 4."
L["NOTIFY_PROP_ENTTYPE"]				= "Tekan [E] untuk berinteraksi, [Klik] untuk menyamar obyek."
L["NOTIFY_CUST_ENT_TYPE_IS_ON"]		= "[PHX] Peringatan: Tekan [E] untuk interaksi objek, Tekan [Klik] untuk Menyamar objek."

--[[
	Custom Taunts, Revision: 16.09.21/X2Z
]]
L["TM_TAUNTS_SEARCH_NOTHING"]		= "Kayaknya ga ada deh taunt '%s' disini :("
L["TM_SEARCH_PLACEHOLDER"]			= "Cari di kategori ini: Ketik kata, huruf kecil & tanpa wildcard. Kosong=Semua."
L["PHXM_MSG_INPUT_IS_EMPTY"]			= "Teks kosong atau kamu tidak menekan ENTER."

--============= LATE ADDITION OF 10.06.2022/X2Z. =============--

--goto line: @132
L["MISC_SET"]						= "Set"
L["MISC_APPLY"]						= "Terapkan"
L["MISC_NO"]							= "Tidak"
L["MISC_YES"]						= "Ya"
L["MISC_WARN"]						= "Perhatian"
L["MISC_ERROR"]						= "Galat"
L["MISC_INFO"]						= "Informasi"
L["MISC_NOTICE"]						= "Perhatian"
L["MISC_IDK"]						= "Tak Diketahui"
L["MISC_NA"]							= "Kosong"

-- HUD
L["HUD_DECOY_ACTIVE"]                = "Tekan [%s]"
L["HUD_FAKETAUNT_COUNT"]             = "Sisa %ix"
L["HUD_FAKETAUNT_UNLI"]              = "Tak Terbatas"
L["NOTICE_GRENADE_SMG_GIVEN"]        = "Kamu baru saja diberi Grenade SMG."

--[[
	ADMIN PANEL, Revision 10.06/2022/X2Z
]]--
L["PHXM_TAUNT_SETTINGS"]				= "Peraturan Taunt"
L["PHXM_GENERAL_SETTINGS"]			= "Peraturan Umum"
L["PHXM_FAKE_TAUNT_SETTINGS"]		= "Peraturan Tipuan Taunt"
L["PHXM_FAKE_TAUNT_ENABLE"]			= "Perbolehkan Tipuan Taunt untuk dimainkan didalam prop pada map ini, Hanya bisa diakses melalui Taunt Menu."
L["PHXM_FAKE_TAUNT_MAXUSAGE"]		= "Pemakaian maksimal untuk Tipuan taunt, -1 untuk tanpa batas."
L["PHXM_TAUNT_RIGHT_CLICK"]		    = "Klik kanan untuk Taunt. Ini akan mengnon-aktifkan menu klik kanan di Taunt menu!"

L["PHXM_TAUNT_PITCH_SETTINGS"]		= "Peraturan Nada Taunt (Pitch)"
L["PHXM_TAUNT_PITCH_ENABLE"]			= "Perbolehkan Nada untuk Taunt"
L["PHXM_TAUNT_PITCH_RANGE_MIN"]		= "Minimal jangkauan (range) untuk nada taunt, 1 s.d. 99."
L["PHXM_TAUNT_PITCH_RANGE_MAX"]		= "Maximal jangkauan (range) untuk nada taunt, 100 s.d. 255."

L["PHXM_DECOY_SETTINGS"]				= "Peraturan Umpan (Decoy)"
L["PHXM_DECOY_ENABLE"]				= "Berikan reward Umpan? Reward akan diberikan SEKALI (maupun sudah punya) ketika prop masih hidup saat round berakhir."

L["PHXM_DISABLE_FOOTSTEP"]           = "Alihkan suara langkah kaki untuk tim Prop (Bisukan atau tidak)"

L["PHXM_ADMIN_CHATSETTING"]			= "Peraturan Jendela Chat"
L["PHXM_ADMIN_HUNTERBLIND"]			= "Peraturan Kontrol Pemejaman Mata Hunter"

L["PHXM_ADMIN_GIVEGRENADE_NEAREND"]  = "Haruskah grenade diberikan sebelum round berakhir? Jika iya, lihat 'ph_give_grenade_roundend_before_time'"
L["PHXM_ADMIN_GIVEGRENADE_TIME"]     = "Waktu dalam detik untuk memberikan grenade sebelum round berakhir. Umumnya dimulai dari 10 s.d. 30 detik."

--[[
	Plugins in sh_init.lua, Revision 10.06/2022/X2Z
]]--
L["PLUG_NAME_VER"]					= "Plugin: %s | v.%s"
L["PLUG_DESCRIPTION"]				= "Deskripsi: %s"

--[[
	Taunt Pitch, Revision 10.06/2022/X2Z
]]--
L["PHX_CTAUNT_USE_PITCH"]			= "Gunakan nada untuk taunt kustom"
L["PHX_CTAUNT_RANDOM_PITCH"]			= "Gunakan nada secara acak ketika memainkan taunt"
L["PHX_RTAUNT_USE_PITCH"]			= "Gunakan nada untuk taunt acak [%s]"
L["PHX_RTAUNT_RANDOMIZE"]			= "Gunakan nada secara acak untuk taunt acak [%s]"
L["PHX_CTAUNT_PITCH_FOR_FAKE"]		= "Gunakan nada untuk taunt tipuan"
L["PHX_CTAUNT_RANDPITCH_FOR_FAKE"]	= "Gunakan nada secara acak untuk taunt tipuan"
L["PHX_CTAUNT_SLIDER_PITCH"]			= "Slider untuk nada taunt"
L["TM_TOOLTIP_FAKETAUNT"]			= "Mainkan taunt tipuan pada prop secara acak"
L["TM_PREFERRED_PITCH"]              = "Level nada taunt yang diinginkan"

--[[
	Fake Taunt, Revision 10.06/2022/X2Z
	Description: Play fake taunts on random props in the map (Not Players)
]]--
L["PHX_CTAUNT_ON_RAND_PROPS"]		= "Mainkan di prop apapun (%ix)"
L["PHX_CTAUNT_ON_RAND_PROPS_UNLI"]	= "Mainkan di prop apapun"
L["PHX_CTAUNT_PLAYED_ON_RANDPROP"]	= "Kamu memainkan taunt di prop sembarang."
L["PHX_CTAUNT_RAND_PROPS_LIMIT"]		= "Penggunaan telah mencapai batas!"
L["PHX_CTAUNT_RAND_PROPS_NOT_PROP"]  = "Fitur tidak tersedia saat ini."
L["PHX_CTAUNT_RANDPROP_DISABLED"]	= "Taunt tipuan sedang di non-aktifkan."

--[[
	PH:Z Simple Decoy, Revision 10.06/2022/X2Z
]]--
L.DECOY_PROP	= {
    "ngancurin barang tak berdosa.",
	"membunuh benda kerang ajaib.",
	"menyesal telah membunuh benda ajaib.",
	"kena tipu deh wkwkwk",
	"ngancurin benda ajaib tak bersalah.",
	"malu-maluin mecahin pot tetangga.",
    "yaaah kena tipu deh wkwkwk",
    "itu bukan prop bego wkwkwk",
    "diketawain sama ketawaan bajaj bajuri",
    "mau dapet mangga malah dapet cempedak.",
    "dapet kuota gratisan scam.",
    "malah dapet sms mama minta pulsa.",
    "mentung pocong lagi ngeronda sama pak hansip."
}

L["DECOY_PUT_SUCC"]					= "Decoy berhasil diletakkan."
L["DECOY_CANT_PUT_HERE"]				= "Gak bisa taruh decoy disini!"
L["DECOY_GET_REWARD"]				= "Selamat! Kamu mendapatkan ['Prop Decoy'] karena berhasil hidup di round ini!"
L["DECOY_REMINDER_GET"]              = "Kamu mempunyai ['Prop Decoy'] Taruh di sembarang tempat untuk membingungkan Hunter!."
L["DECOY_FRAGS_RECEIVED"]			= "Umpan sukses: Kamu mencuri 1 tambahan skor dari %s!"
L["DECOY_DISABLED"]					= "Saat ini ['Prop Decoy'] sedang tidak tersedia."
L["PHXM_CL_DECOY_KEYBIND"]			= "Tombol untuk meletakkan umpan decoy. Default adalah 1 (Bukan Keypad 1)."

L["DECOY_INDICATOR_INVALID"]         = "Terlalu Miring!"
L["DECOY_INDICATOR_TOOFAR"]          = "Kejauhan!"
L["DECOY_INDICATOR_OK"]              = "Taruh Decoy [Tekan %s]"

L["PHXM_DECOY_HEALTH"]				= "Nyawa yang harus diberikan untuk prop tipuan (decoy). Default: 10"
L["PHXM_PLAYER_SHOW_DECOY_HELPER"]   = "Tampilkan penempatan Decoy? ini akan menampilkan dot putih dan teks dekat crosshair."
L["PHXM_PLAYER_SHOW_DECOY_MARKER"]   = "Tampilkan penanda Decoy?"

--[[
	Revision 10.06/2022/X2Z
    Prop Menu Update: Menu, Editor, Browser
]]--
L["PCR_MODEL_DONT_EXISTS"]   = "Model yang kamu pilih tidak tersedia di map ini!"

L["PCR_PLUG_WARN_MSG"]		= "Perhatian: Penambahan Kustom Prop ('pcr_allow_custom') adalah 0.\nYKamu harus aktifkan fitur ini agar bisa menggunakan editor\nCatatan: Membutuhkan map restart!"
L["PCR_PLUG_LBL_BINDKEY"]	= "Untuk mengganti tombol Bind, ketuk pada menu '[Pengaturan Saya] > Binds'"
L["PCR_PLUG_LBL_EDITOR"]		= "Editor Kustom Prop Menu"
L["PCR_PLUG_BTN_OPEN_EDT"]	= "Buka Editor"
L["PCR_PLUG_LBL_COMSET"]		= "Peraturan Umum"
L["PCR_PLUG_LBL_TECHSET"]	= "Peraturan Teknis"
L["PCR_PLUG_LBL_EXPSET"]		= "Fitur Eksperiment"
L["PCR_PLUG_LBL_PLAYERSET"]	= "Peraturan Pemain"

L["PCR_PLUG_ENABLE"]			= "Aktifkan fitur 'Prop Menu'"
L["PCR_PLUG_ALLOW_CUSTOM"]	= "(Butuh Map Restart) Tambahkan kustom prop lainnya ke daftar Prop Menu"
L["PCR_PLUG_PROP_BAN"]		= "(Butuh Map Restart) Jangan tambahkan prop yang telah di banned (daftar hitam)"
L["PCR_PLUG_USAGE_LIMIT"]	= "Batas penggunaan maksimal. -1 untuk bebas limit."
L["PCR_PLUG_PROP_LIMIT"]		= "(Butuh Map Restart) Batasi tambahan prop ke daftar Prop Menu"
L["PCR_PLUG_PROP_LIMITMAX"]	= "Jumlah prop maksimal yang akan ditambahkan ke Prop Menu. Catatan: Ini akan diacak!"
L["PCR_PLUG_USE_ULXMENU"]	= "Haruskah Prop Menu bisa diakses melalui: Console/Perintah Chat (0) atau ULX (1)?"
L["PCR_PLUG_USE_DELAY"]		= "Tunda waktu (dalam detik) sebelum pemain menggunakan prop lainnya."
L["PCR_PLUG_KICK_INVALID"]	= "Kick pemain yang mencoba untuk mengakses Prop tidak valid (Maksimal 4x)"
L["PCR_PLUG_SPACE_CHECK"]	= "Periksa jarak ruang (sempit/luas) sebelum pemain menggunakan prop agar tidak Stuck."
L["PCR_PLUG_X_BBOX"]			= "(Butuh Map Restart) Periksa Batas 'Luas Kotak' Entity (OBB) sebelum menambahkan ke daftar Prop Menu."
L["PCR_PLUG_X_BBOX_MAX"]		= "Luas Kotak 'BBox CollisionBound' Tinggi Maksimum. Minus akan di auto-kalkulasi."
L["PCR_PLUG_X_BBOX_MIN"]		= "Luas Kotak 'BBox CollisionBound' Rendah Maksimum. Minus akan di auto-kalkulasi."
L["PCR_PLUG_ONLY_GROUPS"]	= "Apakah Prop Menu hanya bisa diakses oleh beberapa grup, misalkan: Donator?"
L["PCR_PLUG_NOTIFYMSG"]		= "Beri tahu pemain untuk cara menggunakan Prop Menu di setiap ronde dimulai."

L["PCR_EDITOR_MSG_ERROR"]	= "Peraturanmu gagal karena ada yang Error.\nMohon periksa CONSOLE di servermu!"
L["PCR_EDITOR_MSG_SUCC"]		= "Peraturanmu telah sukses tersimpan dan sudah diperbaharui!"

L["PHZ_generic_title"]		= "Editor untuk Penambahan Prop Kustom"
L["PHZ_generic_helptext"]	= [[[Cara Menggunakan:
[PANEL KIRI]
← Pilih konten game
← Klik ikon untuk menambah ke kanan
← Klik-Kanan ikon untuk buka menu

[PANEL KANAN]
→ Klik untuk 'menandai' sebelum menghapus
→ Tekan 'Hapus Terpilih' untuk menghapus
→ Tekan 'Simpan & Terapkan' untuk perbaharui

[INFORMASI]
- Kamu hanya bisa menambahkan maks. 2048 buah.
- Prop yang disediakan map sudah otomatis ditambah.
- Tekan [Close] untuk membatal & keluar editor.
- Tidak semua model mempunyai fisik (VPhysics)!
- Tidak semua pemain (Termasuk Server) mempunyai kustom model. Jika tidak mereka akan otomatis dihapus.
- Konten server yang dimiliki bisa berbeda dengan kamu. Jika "<game> [Tidak Aktif]" di menu dropdown maknanya kamu belum install game tsb.
- Untuk addon belum terimplementasi sehingga kamu harus gunakan 'Semua Kontent'.
]]
L["PHZ_generic_mdlinfo"] = [[Informasi Model:
%s
Ada Fisik: %s]]
L["PHZ_generic_mdlinfoStart"] = "(Pilih prop dulu!)"

L["PHZ_generic_no_ragdoll"]	= "Tidak: Ragdoll"
L["PHZ_generic_titlelabel"]	= "%s Pratinjau :"

L["PHZ_mount_game_sel"]		= "Pilih Game (Default: Garry's Mod)"
L["PHZ_input_placeholder1"]	= "Cari Folder: <nama folder> atau '*', blank = semua"
L["PHZ_input_placeholder2"]  = "Cari Addon: <nama> atau '*', blank = semua"
L["PHZ_msg_warn_close"]		= "Apakah kamu yakin untuk menutup Editor? Editan yang belum disimpan akan hilang."
L["PHZ_msg_commit"] 			= "Apakah kamu yakin untuk Perbaharui Perubahan?"
L["PHZ_msg_cant_empty"]		= "Daftar Prop tidak boleh Kosong!"
L["PHZ_msg_removesel"] 		= [[Hapus prop yang dipilih pada daftar. Legenda:
Merah = Tertanda untuk dihapus
Kuning: Prop tidak ada di server DAN harus di hapus.]]
L["PHZ_msg_warn_mdlinlist"]  = "PERHATIAN: Model ini sudah terdaftar!"
L["PHZ_msg_invalid_mdl"] 	= "Alasan: Model tidak cocok."
L["PHZ_apply_select"] 		= "Simpan & Terapkan"
L["PHZ_menu_copy"] 		    = "Salin Model"
L["PHZ_menu_refresh"] 	    = "Segarkan Model"
L["PHZ_tooltip_removesel"]	= "Hapus Terpilih"
L["PHZ_tooltip_wasmarked"] = [[Prop ini telah ditandai karena tidak ada di server.
Jika kamu menutup editor ini, prop tersebut akan dihapus.]]

L["PHZ_pcr_fb_allcontent"] = "Semua Kontent (Tidak semua pemain/server mempunyai konten yang sama)"
L["PHZ_pcr_fb_notmounted"] = "%s [Tidak Aktif]"

-- Revision XX/08/2022
L["PHX_ADMIN_ACCESS_ONLY"]		= "Akses Ditolak: hanya Admin yang bisa mengakses, %s !"
L["PHX_PROP_TOO_THIN"]           = "Tidak bisa ganti prop: Prop terlalu tipis!"
L["PHX_PROP_IS_BANNED"]			= "Prop yang kamu coba gunakan telah di Ban dari server!"
L["PHX_SPECT_JOINGAME"]			= "Untuk bermain, Tekan [F2] lalu pilih tim untuk Masuk."
L["PHX_TEAM_IS_FULL"]			= "Waduh, timnya penuh!"
L["FORCE_JOIN_TEAM_IS_DISABLED"]	= "Penggenapan Team telah di non-aktifkan (Tim Acak/Rotasi di Aktifkan)"

L["PHX_TM_MNBAR_OPTIONS"]		= "Opsi"
L["PHX_TM_MNBAR_SAVEFAV"]		= "Simpan Favorit"
L["PHX_TM_MNBAR_LOADFAV"]		= "Muat Favorite"
L["PHX_TM_MNBAR_SETTINGS"]		= "Lainnya"
L["PHX_TM_MNBAR_RESET"]			= "Reset Favorit"

L["PHX_TM_WARN_CLEARFAV"]		= "PERHATIAN: Ini akan MENGHAPUS SEMUA taunt yang tersimpan Lanjut?"

L["PHXM_BANNED_MODELS"]			= "Perboleh/Tidak dalam menggunakan Model yang dilarang (Banned Models)."
L["PHXM_ADMIN_ALLOWARMOR"]       = "Perbolehkan Tambahan Armor untuk tim Pemburu and Prop"
L["PHXM_ADMIN_ALLOW3P"]          = "Perbolehkan mode thirdperson untuk Pemburu"
L["PHXM_ADMIN_ALLOW3P_SVDESIRED"]= "Gunakan mode thirdperson dengan Kamera yang disediakan dari Server"
L["PHXM_ADMIN_ALLOW3P_DIST"]     = "Thirdperson: Jarak Kamera Jauh Dekat"
L["PHXM_ADMIN_ALLOW3P_RIGHT"]    = "Thirdperson: Jarak Kamera Kiri Kanan"
L["PHXM_ADMIN_ALLOW3P_UP"]     	= "Thirdperson: Jarak Kamera Atas Bawah"
L["PHXM_ADMIN_JUMPPOWER_H"]		= "Tambahan tinggi lompat pada tim Hunter"
L["PHXM_ADMIN_MDLCOLOR_PROP"]	= "Aktifkan Warna Player pada tim Props (Aktifkan Kustom Model untuk Hunter)"
L["PHXM_ADMIN_MDLCOLOR_HUNTER"]	= "Aktifkan Warna Player pada tim Hunters (Aktifkan Kustom Model untuk Hunter)"
L["PHXM_ADMIN_PITCH_ROTATION"]	= "[Eksperimen] Perbolehkan untuk menggunakan Rotasi Atas/Bawah pada prop. (Mungkin sedikit bug)."
L["PHXM_ADMIN_FALLDMG"]			= "Aktifkan fitur Fall Damage (Semua Tim)"
L["PHXM_ADMIN_FALLDMG_REAL"]		= "Aktifkan fitur Fall Damage 'Secara Realistis' (Jika Fall Damage Aktif)"
L["PHXM_INFORM_TO_JOIN"]			= "Beri tahu Penonton dengan teks untuk masuk ke-game."
L["PHXM_ADMIN_PROPOFFSET"]		= "Tambah/Kurang Tinggi offset kamera pada prop. Min: 0.6, Max: 1.2. Default: 0.8."
L["PHXM_ADMIN_REPL_MUST_STAND"]	= "[Eksperimen] Hanya boleh Replikasi prop ketika saat Berdiri. Matikan untuk Replikasi saat jongkok atau lompat."

L["PHXM_DROP_VBS_DISABLE"]       = "Matikan Verbose"
L["PHXM_DROP_VBS_ENABLE"]        = "Aktifkan Verbose"
L["PHXM_DROP_MDL_INCLUDEALL"]    = "Masukan Semua ( %d )"
L["PHXM_DROP_MDL_CUSTOMLIST"]    = "Pisah/Daftar Kustom ( %d )"
L["PHXM_DROP_MDLTYPE_PROP"]      = "Hanya Fisik ( %d )"
L["PHXM_DROP_MDLTYPE_PROPDYN"]   = "Fisik & Prop Dinamis ( %d )"
L["PHXM_DROP_MDLTYPE_ANYENTS"]   = "Semua Entitas Kompatibel ( %d )"
L["PHXM_DROP_MDLTYPE_CUSTOM"]    = "Entitas Kustom ( %d )"
L["PHXM_DROP_RESPAWNBLIND_BOTH"] = "Semua Team"

L["PHXM_TAB_ADMINGROUPS"]        = "Grup & Akses"
L["PHXM_TAB_PHEPLUS"]			= "Tambahan Plus"

L["PHXM_ADMIN_ACCESS_GROUP"]     = "Pilih grup untuk perbolehkan akses ke halaman Peraturan Admin, Tambahan Plus dan Plugins."
L["PHXM_ADMIN_ACCESS_GROUP_HINT"] = "Catatan: tidak bisa untuk \"superadmin\"."
L["PHXM_ADMIN_ACCESS_GROUP_NOULX"] = "Error: ULib & ULX tidak terinstall!"
L["PHXM_ADMIN_ACCESS_NOREVOKE"]  = " (Tidak bisa di hapus)"
L["PHXM_ADMIN_GROUP_WHOCANACC"]	= "Pilih grup untuk memperoleh akses ke [Peraturan Admin]."
L["PHXM_ADMIN_GROUP_MUTEABLE"]	= "Pilih grup untuk tidak perbolehkan bisu suara di [Bisukan Pemain]. (Pemain biasa selalu bisa di-bisukan)."

L["PHXM_ADMIN_ACCESS_CHATINFO"]  = "Barusan ada update konfigurasi, Membuka kembali..."
L["PHXM_ADMIN_ACCMSG_BODY"]      = "Anda yakin dengan pilihan tersebut?\nHarap dicatat bahwa grup sebelumnya akan tidak dapat mengakses kembali.\nJendela Prop Hunt Menu akan dibuka kembali."
L["PHXM_ADMIN_ACCMSG_TITLE"]     = "Terapkan Akses"
L["PHXM_ADMIN_ACCCFG_SUCC"]      = "Data untuk Grup Akses telah tersimpan."
L["PHXM_ADMIN_ACCCFG_FAIL"]      = "Ada error ketika menyimpan data Grup Akses. Mohon cek console kamu!"
L["PHXM_ADMIN_MUTCFG_SUCC"]      = "Data untuk Pembisuan Grup telah tersimpan."
L["PHXM_ADMIN_MUTCFG_FAIL"]      = "Ada error ketika menyimpan data Pembisuan Grup. Mohon cek console kamu!"

L["PHXM_ADMIN_ACCESS_APPLY"]     = "Terapkan Grup yang dipilih"

-- PHE/Plus
L["PHXM_ADMIN_PLUSSETTING"]		= "Peraturan Plus+"
L["PHXM_PLUSSETTING_HINT"]		= "Atur Penyeimbang Tim atau Peraturan lainnya."
L["PHXM_HEADER_UNSTUCK"]			= "Peraturan Unstuck"
L["PHXM_HEADER_TEAMSETTING"]		= "Peraturam Tim Tambahan"

L["LIST_PLAYER"]					= "Pemain"
L["LIST_FORCEDASPROP"]			= "Jadikan Prop?"
L["LIST_MARKEDASPROP"]			= "Ditandai sebagai Prop!"
L["LIST_NOHUNTERS"]				= "Tidak ada hunters yang sedang bermain..."

L["PHXM_PLUS_MSG_NO_HUNTERS"]	= "Tidak ada hunters untuk direset!"

L["PHXM_PLUS_BTNRESET"]			= "Hapus Pilihan (dan Tunda sebagai Prop)"
L["PHXM_PLUS_LISTTIPS"]			= "Tips: Dobel-Klik untuk menandai pemain sebagai prop."

L["PHXM_ADMIN_ENABLEUNSTUCK"]		= "Aktifkan fitur unstuck. Jika kamu menggunakan fitur addon unstuck, matikan ini."
L["PHXM_ADMIN_NOTPUNSTUCKINROUND"]	= "Jangan unstuck ke spawnpoint ketika Waktu Pengejaman mata telah berakhir"
L["PHXM_ADMIN_UNSTUCK_WAITTIME"]		= "Berapa lama untuk mengulang unstuck jika berhasil" --ph_unstuck_waittime
L["PHXM_ADMIN_TEAMBAL_ORIG"] 		= "Gunakan Penyeimbang Tim PH:X yang Asli (Fitur Tim dibawah akan di nonaktifkan)" --ph_originalteambalance
L["PHXM_ADMIN_FORCESPECTOPLAY"]		= "Masukan Juka Penonton untuk bermain ketika saat menyeimbangkan tim" --ph_forcespectatorstoplay
L["PHXM_ADMIN_NO_H_CONSECUTIVE"]		= "Hindari pemain menjadi Hunter 2x berturut-turut (hanya berlaku untuk tim acak)" --ph_preventconsecutivehunting
L["PHXM_ADMIN_HUNTER_COUNT"] 		= "Jumlah Hunter (0 = otomatis)" --ph_huntercount
L["PHXM_ADMIN_ROTATETEAM"] 			= "Matikan rotasi acak dan rotasi pemain sekalian" --ph_rotateteams
L["PHXM_ADMIN_RESET_ROTTEAM"] 		= "Reset rotasi" --ResetRotateTeams
L["PHXM_ADMIN_RESET_ROTTEAM_WARN"]	= "Restart rotasi dari awal (Seumpama kamu memulainya, berhenti, dan memulainya lagi dan rotasi saat ini tidak terpenuhi):" --ResetRotateTeams_warning
L["PHXM_ADMIN_RESET_MSG"]			= "Rotasi tim telah di reset!"
L["PHXM_ADMIN_FORCEH2P_WARN"]		= "Paksa Pemain Hunter untuk menjadi Prop di round berikutnya (hanya berlaku untuk tim acak):" --ForceHunterAsProp_warning
L["PHXM_ADMIN_FORCEH2P_RANDONLY"]	= "Hanya berlaku di tim acak!" --ForceHunterAsProp_randomonly

L["FORCEH2P_WILL_BE"]				= "%s akan menjadi Prop di round berikutnya."
L["FORCEH2P_IS_CANCELED"]			= "%s tidak akan menjadi Prop di round berikutnya."
L["FORCEH2P_IS_RESET"]				= "Semua Pemburu tidak akan menjadi Prop di round berikutnya."
L["FORCEH2P_PLAYER_NOT_FOUND"]		= "Prop yang terpilih tidak ditemukan, mungkin tidak terhubung dari server."
L["PHX_ROTATE_TEAM_RESET"]			= "Offset Tim Rotasi telah di reset."

L["UNSTUCK_YOURE_UNSTUCK"]			= "Kamu seharusnya telah bebas."
L["UNSTUCK_BAD_SPAWNPOINT"]			= "Galat: Spawn paling terdekat akan membuat mu stuck. Jika iya, coba unstuck kembali."
L["UNSTUCK_RESCUE_SPAWNPOINT"]		= "Spawn ini sangat terlalu dekat, jadi kamu masih stuck. Coba lagi."
L["UNSTUCK_NO_SPAWNPOINTS"]			= "Sepertinya tidak ada spawnpoint jadi saya akan teleport anda ditengah dunia. Coba unstuck kembali."
L["UNSTUCK_PLEASE_WAIT"]				= "Tunggu %d detik dan coba lagi."
L["UNSTUCK_NOT_ON_GROUND"] 			= "Tidak menyentuh tanah, checking..."
L["UNSTUCK_NOT_STUCK_JITTER"]		= "Kamu tidak stuck, jika iya, tunggu hingga prop tidak bergerak atau coba tekan ALT/CTRL dan coba lagi."
L["UNSTUCK_NOT_STUCK_TOOBAD"]		= "Kamu tidak stuck, jika iya, maaf kamu harus tunggu hingga round berakhir :("
L["UNSTUCK_CANNOT_FIND_SPOT"]		= "Tidak menemukan tempat untuk unstuck, Teleport ke spawn terdekat."
L["UNSTUCK_SPAWNPOINTS_DISABLED"]	= "Kamu sebenernya akan di teleport ke spawn terdekat tapi server tidak memperbolehkan pada saat hunter sudah dilepaskan."
-- End of PHE/Plus

L["MISC_SEL_APPLY"]  = "Terapkan Pilihan"
L["MISC_RESET_SEL"]  = "Reset Pilihan"
L["MISC_RESET"]      = "Reset"
L["MISC_CANCEL"]     = "Tidak Jadi"
L["MISC_SEL_ALL"]    = "Pilih Semua"
L["MISC_SEL_NONE"]   = "Kosongkan"

L["PHXM_CL_THIRDPERSON"]     = "Tombol untuk mode thirdperson"
L["PHXM_CL_UNSTUCK"]			= "Tombol untuk unstuck"
L["CL_THIRDPERSON_ENABLED"]  = "Third Person Aktif"
L["CL_THIRDPERSON_DISABLED"] = "Third Person Non-Aktif"

L["PHX_TP_ADJUSTVIEW_BTN"]	= "Atur mode Thirdperson" --Button, as well as window title.
L["PHX_TPS_ADJ_TITLE"]		= "Peringatan mode Thirdperson"
L["PHX_TPS_ADJ_SVDESIRED"]	= "Pengaturan Thirdperson dinon-aktifkan: Menggunakan yang telah disediakan dari server."
L["PHX_TPS_ADJ_3PDIS"]		= "Mode Thirdperson dinon-aktifkan."
L["PHX_TPS_ADJ_BLIND"]		= "Kamu sedang dipejamkan. Coba lagi nanti."
L["PHX_TPS_ADJ_NEEDALIVE"]	= "Kamu harus menjadi Hunter untuk bisa mengatur ini."

L["ANG_AXIS_DIST"]	= "Jarak" -- or Forward
L["ANG_AXIS_RIGHT"]	= "Kanan"
L["ANG_AXIS_UP"]		= "Atas"
L["VEC_POS_LEFT"]	= "Kiri" --X
L["VEC_POS_FRONT"]	= "Depan" --Y?
L["VEC_POS_TOP"]		= "Atas"  --Z

-- Key Hints
L["KEYHINT_HUNTER3P"] 	= "Pemburu Thirdperson"
L["KEYHINT_SHOOT"]		= "Tembak Senjata"
L["KEYHINT_SEC"]			= "Tembak Cadangan"
L["KEYHINT_PICKUP"]		= "Ambil Objek/Interaksi"

L["KEYHINT_LMB"]			= "Replikasi Prop"
L["KEYHINT_RMB"]			= "Taunt/Ability Spesial"
L["KEYHINT_RANDTAUNT"] 	= "Taunt Acak"
L["KEYHINT_TAUNTMENU"] 	= "Buka Taunt Menu"
L["KEYHINT_ROTATION"] 	= "Kunci Rotation"
L["KEYHINT_PROPMENU"] 	= "Prop Menu"
L["KEYHINT_FREEZEAIR"] 	= "Prop Freeze"
L["KEYHINT_SPAWNDECOY"] 	= "Taruh Decoy (Jika Ada)"
L["KEYHINT_UNSTUCK"]		= "Unstuck"

L["KEY_LMB"]				= "LMB" --Indo keknya ndak usah
L["KEY_RMB"]				= "RMB" --Indo keknya ndak usah

L["MISC_TEAM_NAME"]		= "TIM: %s"
L["NOTIFY_HEADER_TITLE"]	= "Informasi Kontrol"

-- Revision 14/09/2022
L["PHXM_MV_CHANGEMAP_NOPLAYER"]	= "Paksakan ganti map ketika server sudah kosong?"

L["KEY_MIDCLICK"]		= "MMB"

L["LD_MIDCLICK"]			= "KLIK TENGAH"
L["LD_RIGHTCLICK"]		= "KLIK KANAN"
L["LD_PRESS2SHOOT"]		= "Tekan [%s] untuk menembak %s!"

PHX.LANGUAGES[L.code] = L