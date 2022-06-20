local LANG = {}

LANG.code = "id"

LANG.Name 		 	= "Bahasa Indonesia"
LANG.NameEnglish	= "Indonesian Language" --Note: to prevent controversy, this should written "Indonesian Language" because Malay can often use "Bahasa Malay" too!
LANG.Author			= "Wolvindra-Vinzuerio, KamFretoZ" -- Only accept STRINGS.
-- Can Accept: String, and Table.
LANG.AuthorURL		= "https://steamcommunity.com/profiles/76561198210777189"

-- Special Section that isn't String-based
LANG.SUICIDEMSG = {  -- Fix me: there was addition text here but feel free to add more.
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

LANG.RANDOM_SPECTATORS = { --> FRETTA
	"pengen nonton hiburan :)",
	"cuman buat gabut.",
	"cuman buat nonton.",
	"pengen lihat-lihat.",
	" ",
}

LANG["PHX_TEAM_CONNECTING"] = "Menyambung"
LANG["PHX_TEAM_PROPS"]		= "Prop"
LANG["PHX_TEAM_HUNTERS"] 	= "Pemburu"
LANG["PHX_TEAM_UNASSIGNED"]	= "Belum Join"
LANG["PHX_TEAM_SPECTATOR"] 	= "Penonton"

-- List of string-based translation

-- // FRETTA SECTION \\
--  FRETTA: Kill text (X killed Y)
LANG["HUD_KILLED"]				= "membunuh"

-- FRETTA: HUDs
LANG["HUD_TIME"] 				= "WAKTU"
LANG["HUD_ROUND"]				= "RONDE"
LANG["HUD_WAITPLY"]				= "Menunggu pemain lainnya..."
LANG["HUD_DEAD"]				= "(MATI) "

LANG["HUD_TEAMWIN"]				= "%s menang!"
LANG["HUD_LOSE"]				= "Seri, semuanya kalah!"
LANG["MISC_TIMELEFT"]			= "Waktu Tersisa: %s detik"
LANG["MISC_GAMEEND"] 			= "Permainan akan berakhir setelah ronde ini."

-- FRETTA: Team selection screen (F2)
LANG["DERMA_TEAMSELECT"]		= "Pilih Tim"

-- FRETTA: F1 screeen
LANG["DERMA_RTV"] 				= "Usulkan Ganti Map/RTV"
LANG["DERMA_PHMENU"] 			= "Menu Prop Hunt Lainnya"
LANG["DERMA_CHANGETEAM"]		= "Ganti Tim"

-- FRETTA: Scoreboard
LANG["DERMA_PLAYER"]			= "(%d pemain)"
LANG["DERMA_PLAYERS"]			= "(%d total pemain)"
LANG["DERMA_NAME"]				= "Nama"
LANG["DERMA_KILLS"]				= "Skor"
LANG["DERMA_DEATHS"]			= "Mati"
LANG["DERMA_PING"]				= "Ping"
LANG["DERMA_SERVER_TAG"]		= "SVR"
LANG["DERMA_BOT_TAG"]			= "BOT"
LANG["DERMA_GAMEMODE_CREDITS"]	= "%s | Versi: %s, Revisi %s"

LANG["CHAT_JOINED"]				= " bergabung "
LANG["CHAT_JOINEDTHE"]			= " menjadi " -- ini ke Team Spectator

LANG["CHAT_SWAPBALANCE"]		= "%s telah diganti ke %s untuk menyeimbangkan tim."
LANG["CHAT_SWAPBALANCEYOU"]		= "Kamu telah dipindahkan dari tim sebelumnya agar supaya lebih seimbang." -- Smile... for even in death, you have become children of Thanos

-- Fretta Splash Screen
LANG["SPASHSCREEN_BY_X"]		= "Oleh %s"
-- RichTextBox
LANG["HELP_DONATORS_AND_CONTRIBUTORS"]  = "\n\nDonor & Kontributor:\n- %s"

-- // END OF FRETTA SECTION \\

LANG["HELP_F1"] 				= [[Project Prop Hunt X.

Sebuah proyek mode permainan "Prop Hunt" untuk lebih modern dan optimal.

Informasi lebih lanjut bisa kunjungi di:
https://gmodgameservers.com/prophuntx

Untuk melihat tutorial, pengaturan, dan menu lainnya bisa diakses melalui:
Tombol [F1], tekan menu 'Menu Prop Hunt'.

Versi: ]].. PHX.VERSION ..[[ Revisi ke: ]].. PHX.REVISION ..[[

Selamat Bermain! :)
]]

-- Important!
LANG["LANGUAGE_CHANGED"]		= "Preferensi bahasa kamu sekarang diganti ke %s"

-- internal cl_menutypes section.
LANG["SUBTYPE_PREFERED_LANG"]	= "Preferensi Bahasa"

-- Events
LANG["EV_PLAYER_CONNECT"]		= "%s telah tersambung ke server."
LANG["EV_PLAYER_JOINED"]		= "%s telah bergabung di server."
LANG["EV_PLAYER_DISCONNECT"]	= "%s telah keluar dari server (Alasan: %s)"

-- HUD elements
LANG["HUD_HP"]					= "NYAWA"
LANG["HUD_AMMO"] 				= "PELURU"
LANG["HUD_MAGSEC"]				= "ISI / CAD." --Magazine | Secondary Magazine

LANG["TEAM_PROPS"]				= LANG["PHX_TEAM_PROPS"] 	--"Props"
LANG["TEAM_HUNTERS"]			= LANG["PHX_TEAM_HUNTERS"] 	--"Hunters"

LANG["HUD_ROTLOCK"]				= "Rotasi: Terkunci"
LANG["HUD_ROTFREE"]				= "Rotasi: Bebas"
LANG["HUD_KILLEDBY"]			= "Kamu barusan dibunuh oleh %s"

LANG["HUD_AUTOTAUNT"]			= "Taunt Otomatis dalam %d detik"
LANG["HUD_AUTOTAUNT_ALT"]		= "Taunt Otomatis dalam %d"
LANG["HUD_AUTOTAUNT_DISABLED"]	= "Taunt Otomatis non-aktif."

LANG["HUD_TargetID"]			= "Pemain: %s (%d%%)" -- Player: <NAME> (<HEALTH>%)

LANG["HUD_BLINDED"]				= "%s akan dilepaskan dalam %s"
LANG["HUD_UNBLINDED"]			= "Siap atau nggak, kami datang!"

LANG["BLIND_RESPAWN_TEAM"]		= "Kamu telah ter-respawn pada tim %s dalam waktu %d detik ketika hunter memejamkan mata."
LANG["BLIND_RESPAWN"]			= "Kamu telah ter-respawn dalam waktu %d detik ketika hunter memejamkan mata."

LANG["MISC_ACCEPT"]				= "Terima"
LANG["MISC_OK"]					= "OK"
LANG["MISC_CLOSE"]				= "Tutup"
LANG["MISC_PREV"]				= "< MUNDUR"
LANG["MISC_NEXT"]				= "MAJU >"
LANG["MISC_ACCESSDENIED"]		= "Akses Ditolak"

-- Chat messages
LANG["CHAT_NOPLAYERS"]			= "Tidak cukup player untuk memulai game!"
LANG["CHAT_SWAP"]				= "Tim telah ditukar!"

LANG["CHAT_SWAPTEAM_WARNING"]   = "Kamu sudah berpindah tim sebanyak %dx (%dx Maksimal). Setelah itu kamu tidak dapat berpindah tim lagi."
LANG["CHAT_SWAPTEAM_REVERT"]	= "Kamu tidak dapat pindah ke tim %s karena kamu sudah melebihi batas yang di izinkan untuk mengganti tim."

LANG["CHAT_PROP_NO_ROOM"] 		= "Tidak ada tempat untuk berubah manjadi prop tersebut!"

-- Notification
LANG["NOTIFY_IN_PROP_TEAM"]		= "Kamu sedang di tim prop! Sebagai prop, kamu dapat berputar dengan menggerakan mouse."
LANG["NOTIFY_ROTATE_NOTICE"]	= "Kamu juga dapat mengunci rotasi dengan menekan tombol [R]!"

-- Custom Taunt Window
LANG["TM_WARNING_CT_DISABLE"]	= "[PHX - Taunts] Peringatan: Custom taunt tidak tersedia di server ini."
LANG["TM_NO_TAUNTS"]			= "Peringatan: Tidak ada taunt yang terdeteksi di kategori ini."
LANG["TM_PLAY_ONLY_ALIVE"] 		= "Kamu hanya dapat menggunakan Custom Taunt disaat kamu masih hidup."

LANG["TM_WINDOW_TITLE"]			= "Prop Hunt Custom Taunt"
LANG["TM_NOTICE_PLSWAIT"]		= "Harap tunggu %s detik sebelum random taunt berakhir!"
LANG["TM_NOTICE_PLAYPREVIEW"]	= "Memainkan Taunt: %s"

LANG["TM_TOOLTIP_PLAYTAUNT"] 	= "Mainkan Taunt"
LANG["TM_TOOLTIP_PREVIEW"]		= "Dengarkan Taunt"
LANG["TM_TOOLTIP_PLAYCLOSE"]	= "Mainkan taunt dan tutup jendela"
LANG["TM_TOOLTIP_PLAYRANDOM"]	= "Mainkan taunt secara acak"
LANG["TM_TOOLTIP_CLOSE"]		= "Tutup"
LANG["TM_MENU_CLOSE"]			= "Tutup Menu"

LANG["TM_DELAYTAUNT_NOT_EXIST"] = "Taunt yang kamu pilih tidak dapat ditemukan di server ini!"
LANG["TM_DELAYTAUNT_PLSWAIT"]	= "Harap tunggu %s detik!"

-- PHX Menu window
LANG["PHXM_WINDOW_TITLE"]		= "Prop Hunt X - Menu & Pengaturan lebih lanjut"
LANG["SERVER_INFO_MOTD"]		= "INFORMASI SERVER & PERATURAN [MOTD]"

LANG["PHXM_TAB_HELP"]			= "Panduan"
LANG["PHXM_TAB_MUTE"]			= "Bisukan Pemain"
LANG["PHXM_TAB_PLAYER"]			= "Pengaturan Saya"
LANG["PHXM_TAB_MODEL"] 			= "Player Model"
LANG["PHXM_TAB_MODEL_DISABLED"]	= "Player Model"
LANG["PHXM_TAB_ADMIN"]			= "Pengaturan Admin"
LANG["PHXM_TAB_ABOUT"]			= "Tentang PH:X"
LANG["PHXM_TAB_MAPVOTE"]		= "Pengaturan MapVote"

LANG["PHXM_CVAR_CHANGED"]		= "[Pengaturan] ConVar %q telah diganti %q"

-- Player Mute Settings
LANG["PHXM_MUTE_SELECT"]		= "Pilih siapapun yang ingin kamu diamkan."

-- Player Settings
LANG["PHXM_PLAYER_OPTIONS"]		= "Pengaturan Player"
LANG["PHXM_PLAYER_LANG"]		= "Bahasa"
LANG["PHXM_PLAYER_BIND"]		= "Binds"
LANG["PHXM_PLAYER_HUDSETTINGS"]	= "Pengaturan HUD"

LANG["PHXM_PLAYER_TAUNT_KEY"]			= "Tombol Taunt Sembarang"
LANG["PHXM_PLAYER_TAUNTWINDOW_KEY"]		= "Tombol Taunt Menu"
LANG["PHXM_PLAYER_ROTATLOCK_KEY"]		= "Tombol Kunci Rotasi"

LANG["PHXM_PLAYER_TOGGLE_HALOS"]		= "Alihkan efek 'Halo' saat memilih prop"
LANG["PHXM_PLAYER_IDNAMES"]				= "Tampilkan nama player diatas kepala mereka (Tampil dibalik dinding juga)"
LANG["PHXM_PLAYER_ENDROUND_CUE"]		= "Mainkan suara akhir ronde"
LANG["PHXM_PLAYER_TAUNTMENU_AUTOCLOSE"]	= "Otomatis tutup setelah meng-dobel klik pada daftar Taunt Menu."
LANG["PHXM_PLAYER_SEE_HUNTER_LINE"]		= "Tampilkan garis pada hunter sehingga kita bisa melihat arahan mereka."
LANG["PHXM_PLAYER_SEE_LBALL_ICONS"]		= "Tampilkan 'Ikon Bola-Gaca' pada saat benda tersebut muncul"
LANG["PHXM_PLAYER_SEE_CRYSTAL_ICONS"]	= "Tampilkan 'Ikon Kristal-Setan' pada saat benda tersebut muncul"

LANG["PHXM_PLAYER_USE_NEW_HUD"]			= "Gunakan HUD Prop Hunt: X Baru"
LANG["PHXM_PLAYER_SHOW_TUTOR"]			= "Tampilkan tutorial singkat (Hanya muncul 2x pada saat spawn)"
LANG["PHXM_PLAYER_USE_NEW_CROSSHAIR"]	= "Tampilkan Crosshair Baru"
LANG["PHXM_PLAYER_SHOW_TEAM_TOPBAR"]	= "Tampilkan jumlah player yang masih hidup (Setidaknya 4 pemain dibutuhkan)"

-- Player model Browser Section
LANG["QUERY_MODEL_SELECTED"]	= "Skin %s telah terpilih dan akan digunakan setelah respawn."
LANG["QUERY_MODEL_INFO"]		= "Nama skin: %s - Tersedia untuk: Semua Orang"

LANG["MDL_MENU_REFRESH"] 		= "Muat ulang Ikon"
LANG["MDL_MENU_PREVIEW"] 		= "Pratinjau Skin"
LANG["MDL_MENU_MODELINFO"] 		= "Informasi Skin"


LANG["MISC_APPLYMDL"] 			= "Skin Diterapkan"

LANG["PHXM_MODEL_DISABLED"] 	= "Skin kustom telah di non-aktifkan di server ini."
LANG["PHXM_PLAYERMODEL_SETFOV"]	= "  Atur Kamera jarak/FOV"

-- Server Settings
LANG["PHXM_ADMIN_OPTIONS"]		= "Opsi-opsi Gamemode server (Hanya tampil jika kamu seorang Admin)"
LANG["PHXM_ADMIN_MUSTALIVE"]	= "Kamu harus dalam keadaan hidup untuk menaktifkan mode ini."

-- Language Override
LANG["PHXM_ADMIN_LANGOVERRIDE"]	= "Kontrol Bahasa"

LANG["PHXM_ADMIN_FORCELANG"] 				= "Gunakan Satu Bahasa? Pengaturan ini akan mengabaikan bahasa user yang telah dipilih dan mengikuti bahasa dari server."
LANG["PHXM_ADMIN_LANGTOUSE"]				= "Bahasa yang digunakan"
LANG["PHXM_ADMIN_PLAYERDEFAULTLANG"] 		= "Bahasa utama ketika pemain baru pertama kali main"

-- Gameplay settings
LANG["PHXM_ADMIN_CUSTOM_MODEL"]				= "Aktifkan kustom skin untuk Hunter"
LANG["PHXM_ADMIN_CUSTOM_MODEL_PROP"]		= "Aktifkan kustom skin untuk Props - Pastikan hunter juga diaktifkan!"
LANG["PHXM_ADMIN_TAUNT_DELAY_CUSTOM"]		= "Waktu tunda Taunt kustom (detik)"
LANG["PHXM_ADMIN_TAUNT_DELAY_RANDOM"]		= "Waktu tunda Taunt sembarang (detik)"
LANG["PHXM_ADMIN_TAUNT_DELAY_AUTO"]			= "Waktu tunda Taunt otomatis (detik)"
LANG["PHXM_ADMIN_AUTOTAUNT_ENABLE"]			= "Aktifkan fitur Taunt otomatis (Timer akan berfungsi setelah ronde baru"

LANG["PHXM_ADMIN_NOTICE_ROTATION"]			= "Tampilkan notifikasi 'Rotasi Prop' setiap kamu spawn"
LANG["PHXM_ADMIN_CAMERA_COLLIDE"]			= "Aktifkan Kamera agar tidak tembus dinding"
LANG["PHXM_ADMIN_FREEZECAM"]				= "Aktifkan 'Freeze Cam' untuk tim Prop"
LANG["PHXM_ADMIN_FREEZECAM_HUNTER"]			= "Aktifkan 'Freeze Cam' untuk tim Hunter"
LANG["PHXM_ADMIN_PROP_COLLIDE"]				= "Aktifkan prop bersentuhan dengan yang lainnya"
LANG["PHXM_ADMIN_SWAP_TEAM"] 				= "Tukarkan team setiap round - Non-aktifkan fitur ini akan membuat tim untuk tidak berpindah."
LANG["PHXM_ADMIN_HUNTER_PENALTY"]			= "Nyawa Pinalti untuk Hunter"
LANG["PHXM_ADMIN_HUNTER_KILL_BONUS"]		= "Jumlah Tambahan Bonus ketika Hunter membunuh Prop"
LANG["PHXM_ADMIN_HUNTER_SMG_GRENADES"]		= "Jumlah Granat Hunter SMG"
LANG["PHXM_ADMIN_GAME_TIME"]				= "(Butuh Map Restart) Total Game time (menit)"
LANG["PHXM_ADMIN_BLINDLOCK_TIME"]			= "Waktu hunter memejamkan mata (detik)"
LANG["PHXM_ADMIN_ROUND_TIME"]				= "(Butuh Map Restart) Waktu ronde permainan (detik)"
LANG["PHXM_ADMIN_ROUNDS_PER_MAP"]			= "(Butuh Map Restart) Total ronde per satu Map"
LANG["PHXM_ADMIN_ENABLE_LUCKYBALL"]			= "Perbolehkan 'Bola-Ghaca' untuk muncul di setiap Prop yang mudah dihancurkan? (Kesempatan 10%)"
LANG["PHXM_ADMIN_ENABLE_CRYSTAL"]			= "Perbolehkan 'Kristal-Setan' untuk muncul ketika Hunter mati?"
LANG["PHXM_ADMIN_WAIT_PLAYERS"]				= "Tunggu player lain untuk memulai permainan"
LANG["PHXM_ADMIN_WAIT_MIN_PLAYERS"]			= "Minimal pemain untuk menunggu sebelum permainan dimulai (default: 1)"
LANG["PHXM_ENABLE_PLAYER_JOIN_LEAVE"] 		= "Aktifkan notifikasi untuk Pemain Keluar Masuk? Ganti ke 0 jika kamu ingin menggunakan dari addon lain."

LANG["PHXM_ADMIN_FORCEJOINBALANCE"]			= "Perbolehkan player untuk masuk ke tim tertentu walaupun timnya sudah penuh?"
LANG["PHXM_ADMIN_ENABLETEAMBALANCE"]		= "Otomatis genapkan tim ketika tim tidak sempurna/seimbang"

LANG["PHXM_ADMIN_TAUNTMODES"]		= "Mode Taunt"
LANG["PHXM_ADMIN_TAUNTMODE_MODE"]	= "--[Mode taunt saat ini: %d ]--"
LANG["PHXM_ADMIN_TAUNTMODE0"]		= "Mode [0]: Taunt Sembarang"
LANG["PHXM_ADMIN_TAUNTMODE1"]		= "Mode [1]: Taunt Kustom"
LANG["PHXM_ADMIN_TAUNTMODE2"]		= "Mode [2]: Dua-duanya"
LANG["PHXM_ADMIN_TAUNTSOPEN"]		= "Buka jendela Taunt"

LANG["PHXM_ADMIN_PICKUP_PROPS"] 			= "Perbolehkan untuk mengambil objek kecil? 0: Tidak boleh, 1: Hunters saja, 2: Props saja, 3: Bolehkan semuanya."
LANG["PHXM_MODE_DEFAULT"] 					= "--[ Mode mengambil object saat ini: %d ]--"
LANG["PHXM_MODE0"]							= "Mode [0]: Tidak boleh"
LANG["PHXM_MODE1"]							= "Mode [1]: Hunters saja"
LANG["PHXM_MODE2"]							= "Mode [2]: Props saja"
LANG["PHXM_MODE3"]							= "Mode [3]: Bolehkan semuanya"

-- Admin Developer Sections
LANG["PHXM_ADMIN_DEVSECTION"]		= "Fitur Experimen / Developers"
LANG["PHXM_ADMIN_ROOMCHECK"]		= "Aktifkan pengecekan batas-batas pada object? Ini mencegah agar prop tidak tersangkut."
LANG["PHXM_ADMIN_USENEWMKBREN"]		= "Gunakan skin baru untuk senjata 'Bren MK II' (BUTUH MAP RESTART!)"
LANG["PHXM_ADMIN_BEVERBOSE"]		= "Developer: Be Verbose - Aktifkan fitur 'verbose' sehingga akan meginformasikan segala hal event."
LANG["PHXM_ADMIN_SHOWPLNAMEHEAD"]	= "Tampilkan nama player diatas kepala"
LANG["PHXM_ADMIN_USESINGLE_FZCAM"]	= "Gunakan satu suara 'Freeze Cam'"
LANG["PHXM_ADMIN_MODELLISTINGTYPE"] = "Tampilkan skin dalam mode : 0 = Semua Playermodel (AddValidModel), 1 = Gunakan metode Lawas: list.Get('PlayerOptionsModel')"
LANG["PHXM_ADMIN_JUMPPOWER"]		= "Tambahan penggandaan tinggi lompat pada Prop"
LANG["PHXM_ADMIN_ENABLE_OBB"]		= "Developer: Aktifkan Enable Customized Prop Entities Model Boundaries (OBB) Modifier from config data" --Untranslateable
LANG["PHXM_ADMIN_RELOAD_OBB"]		= "Developer: Reload OBB Modifier data every round restarts" --Untranslateable

-- Experimental & PH:X Features
LANG["PHXM_ADMIN_EXPERIMENTALPHX"]			= "Seksi Fitur Experimen PH:X Baru"

LANG["PHXM_ADMIN_HLA_COMBINE"]				= "Tambahkan dukungan skin dari 'HL:Alyx Combine'"
LANG["PHXM_ADMIN_TEAMBALANCE"]				= "Aktifkan Pengeimbang Tim"
LANG["PHXM_ADMIN_CHANGETEAM_LIMIT"]			= "Aktifkan pembatasan tukar tim - Atur -1 untuk non-aktifkan. "
LANG["PHXM_ADMIN_USENEWCHAT"]				= "Gunakan ChatBox baru (eChat) - Fitur ini sementara. Jika kamu sudah punya chat baru, jangan dicentang."
LANG["PHXM_ADMIN_NEWCHATPOS"]				= "Kurangi berapa piksel untuk tinggi posisi chat Y. Default 45 piksel."
LANG["PHXM_ADMIN_RESPAWNONBLIND"]			= "Perbolehkan respawn pada saat Memejamkan mata"
LANG["PHXM_ADMIN_RESPAWNONBLIND_TEAM"]		= "Perbolehkan respawn pada saat Memejamkan mata untuk spesifik tim saja: 0: Semua, 1: Hunters, 2: Props"
LANG["PHXM_ADMIN_REWSPANTIMEPERCENT"]		= "Persentase waktu untuk memperbolehkan pemain untuk respawn. Default 0.75 (artinya 75% x Maximal Waktu memejamkan mata)"
LANG["PHXM_ADMIN_ALLOWRESPAWN_SPECTATOR"]	= "Perbolehkan respawn pada saat Memejamkan mata saat pindah dari tim Spektator"
LANG["PHXM_ADMIN_ALLOWRESPAWN_TEAMCHANGE"]	= "Perbolehkan respawn pada saat Memejamkan mata saat pindah dari tim lain (Tidak disarankan untuk mengaktifkan fitur ini)"

--[[
	MapVote Settings
]]
LANG["PHXM_MV_SETTINGS"]			= "Pengaturan Map Usulan (Voting)"

LANG["PHXM_MV_ALLOWCURMAP"]			= "Perbolehkan map sekarang untuk di voting?"
LANG["PHXM_MV_COOLDOWN"]			= "Aktifkan map 'Cooldown' untuk voting."
LANG["PHXM_MV_USE_ULX_VOTEMAPS"]	= "Gunakan daftar map dari ULX votemap? jika tidak akan menggunakan filter dari 'maps/*.bsp'."
LANG["PHXM_MV_MAPLIMIT"]			= "Jumlah map yang akan tampil di daftar voting"
LANG["PHXM_MV_TIMELIMIT"]			= "Waktu dalam detik untuk melakukan voting."
LANG["PHXM_MV_MAPBEFOREREVOTE"]		= "Berapa kali 'ganti map' untuk map yang dipilih tampil kembali"
LANG["PHXM_MV_RTVCOUNT"]			= "Berapa banyak pemain untuk bisa melakukan RTV ('Rock the Vote')"

LANG["PHXM_MV_EXPLANATION1"]		= "Untuk mengatur map apa yang akan dipilih, gunakan variable konsol 'mv_mapprefix' dengan mengisi: 'ph_,cs_,de_,'."
LANG["PHXM_MV_EXPLANATION2"]		= "Jika kamu menggunakan ULX, gunakan 'map_vote'. Jika tidak, gunakan 'mv_start'"
LANG["PHXM_MV_EXPLANATION3"]		= "Aksi MapVote"

LANG["PHXM_MV_START"]		= "Mulai MapVote"
LANG["PHXM_MV_STOP"]		= "Hentikan MapVote"

--[[ 
	Versioning, Credits or About section
]]
LANG["PHXM_ABOUT_VERSIONING"]	= "Versi: %s - Revisi: %s"
LANG["PHXM_ABOUT_AUTHOR"]		= "Oleh: %s"
LANG["PHXM_ABOUT_ENJOYING"]		= "Jika kamu senang bermain Prop Hunt X, jangan lupa support ya! :)"
LANG["PHXM_ABOUT_UPDATE"]		= "Update untuk Prop Hunt X"

LANG["PHXM_VIEW_UPDATE_INFO"]		= "Lihat info perbaharuan"
LANG["PHXM_CHECK_FOR_UPDATES"]		= "Cek untuk Update"
LANG["PHXM_UPDATE_FOUND_TEXT"]		= "Update telah di cek. Silahkan cek di console untuk informasi lebih lanjut.\n\nApakah kamu ingin melihat informasi update?"
LANG["PHXM_UPDATE_FOUND_TITLE"]   	= "Informasi Update"
LANG["PHXM_UPDATE_FOUND_BUTTON"]   	= "Lihat Update"

LANG["UPDATE_NOTIFY_MSG_NOTFOUND"]	= "Tidak ada informasi update. Mohon klik tombol 'Cek untuk Update' dahulu!"
LANG["UPDATE_NOTIFY_MSG_TITLE"]		= "Tidak ada update"
LANG["UPDATE_NOTIFY_WINDOW_TITLE"]	= "Pemberitahuan Update"
LANG["UPDATE_RTBOX_APPEND"]			= "\n\nInformasi Tambahan:\nSaat ini kamu menggunakan versi: %s Revisi: %s"
LANG["UPDATE_BTN_SEEFULL"]			= "Lihat Semua Pembaharuan"

LANG["PHXM_ABOUT_LINKS"]		= "Tautan dan Kredit"
LANG["PHXM_ABOUT_THANKS"]		= "Terima kasih banyak untuk Bantuan, Sugesti & Kontribusi kepada:\n %s"
LANG["PHXM_ABOUT_BTN_DONATE"]		= "Bantu PH:X dengan Donasi"
LANG["PHXM_ABOUT_BTN_HOME"]			= "Halaman Utama PH:X"
LANG["PHXM_ABOUT_BTN_GITHUB"]		= "GitHub Repository PH:X"
LANG["PHXM_ABOUT_BTN_PLUGINS"]		= "Plugin PH:X"
LANG["PHXM_ABOUT_BTN_CHANGELOGS"]	= "Catatan Riwayat PH:X"

LANG["HUD_SPECTATING"]	= "MENONTON"
LANG["HUD_YOUDIED"]		= "Kamu Mati!"

LANG["CHAT_STARTING_MAPVOTE"] = "Ronde telah Berakhir. Memulai 'MapVote'..."

LANG["HUD_PROP_TAUNT_TIME"]	= "Taunt"
LANG["HUD_PROP_CTAUNT_TIME"] = "Taunt Kustom"

LANG["PHXM_TAB_PLUGINS"]				= "Plugin & Tambahan"

LANG["PLUGINS_NO_PLUGINS"]				= "Tidak ada plugin terinstall. Cari plugin lainnya disini!"
LANG["PLUGINS_BROWSE_MORE"]				= "Cari plugin lainnya"
LANG["PLUGINS_SERVER_HAS_NO_PLUGINS"]	= "Server ini tidak mepunyai plugin atau tambahan (addon) terinstall."
LANG["PLUGINS_SERVER_SETTINGS"]			= "-- Pengaturan Server --"
LANG["PLUGINS_CLIENT_SETTINGS"]			= "-- Pengaturan Pengguna --"

-- Text Entries
LANG["TEXTENTRY_FZ_SINGLE"] = "Rintis untuk suara Freeze Cam"
LANG["TEXTENTRY_MV_PREFIX"] = "Imbuhan untuk MapVote"

-- Late Addition: 29.10.21/X2Z.

LANG["MISC_GAME_ENDED"]		= "Permainan telah berakhir."

--[[
	Credits: Late Addition: Revision: 16.09.21/X2Z
]]

LANG["PHXM_ABOUT_BTN_WIKI"]			= "Bantuan & Wiki PH:X"

--[[
	Auto Taunt: Late Addition: Revision: 16.09.21/X2Z
]]

LANG["HUD_AUTOTAUNT_DISABLED"]		= 	"Taunt Otomatis Non-aktif."
LANG["HUD_AUTOTAUNT_WAITFORUPDATE"]	=	"Sedang sinkron taunt otomatis..."

--[[
	MapVote: Late Addition: Revision: 16.09.21/X2Z
]]
LANG["PHXM_MV_VOTEROCKED"]				= " Vote telah ditentukan, map vote akan dimulai setelah ronde berakhir"
LANG["PHXM_MV_VOTEROCKED_IMMINENT"]		= "Vote telah ditentukan, map vote dimulai!"
LANG["PHXM_MV_VOTEROCKED_PLY_TOTAL"]	= "%s telah menyuarakan map vote. ( %d / %d )"

LANG["PHXM_MV_MUST_WAIT"]				= "Kamu harus menunggu sebentar sebelum voting!"
LANG["PHXM_MV_VOTEINPROG"]				= "Proses vote sedang berlangsung!"
LANG["PHXM_MV_HAS_VOTED"]				= "Kamu barusan sudah voting!"
LANG["PHXM_MV_ALR_IN_VOTE"]				= "Sudah ada vote berlangsung, ini lagi ganti mapnya!"
LANG["PHXM_MV_NEED_MORE_PLY"]			= "Kamu butuh banyak pemain sebelum melakukan voting!"

--[[
	Late Addition: Revision: 16.09.21/X2Z
]]
LANG["PROP_PLAYERMDL_BANNED"]	= "Kustom Prop Player Model kamu tidak bisa digunakan saat ini."

--[[
	Prop Menu/Prop Chooser, Revision: 16.09.21/X2Z
]]

LANG["PCR_USAGE_UNLIMIT"]		= "[Prop Menu] Kamu bisa gunakan menu ini **Sepuasnya**!"
LANG["PCR_USAGE_COUNT"]			= "[Prop Menu] Kamu bisa gunakan %dx lagi!"
LANG["PCR_PLS_WAIT"]			= "[Prop Menu] Mohon tunggu dalam %d detik."
LANG["PCR_NOROOM"]				= "[Prop Menu] Tempatmu kurang luas untuk mengganti prop ini!"
LANG["PCR_PROPBANNED"]			= "[Prop Menu] Prop ini telah dilarang dari server."
LANG["PCR_PROPBANNED_BYPCR"]	= "[Prop Menu] Kamu tidak bisa menggunakan prop ini."
LANG["PCR_REACHED_LIMIT"]		= "[Prop Menu] Kamu telah mencapai batas maksimal!"
LANG["PCR_STAY_ON_GROUND"]		= "[Prop Menu] Kamu harus menyentuh tanah dan tidak melompat atau tidak sedang jongkok!"
LANG["PCR_ONLY_GROUP"]			= "[Prop Menu] Hanya grup tertentu bisa menggunakan menu ini!"
LANG["PCR_NOT_EXIST_COUNT"]		= "Prop yang kamu pilih tidak berlaku di map ini! ( %s / 4 )"
LANG["PCR_NOT_EXIST"]			= "Prop yang kamu pilih tidak berlaku di map ini!"

-- PCR Client section, reason why there is a space because of chat.AddText between args.
LANG["PCR_NOTIFY_1"]			= " Server Ini menggunakan Prop Menu versi %s! Ketik "
LANG["PCR_NOTIFY_2"]			= " di console atau tekan tombol [F1] -> [Bantuan Prop Menu]."
LANG["PCR_CL_DISABLED"]			= " Kamu tidak bisa menggunakan fitur ini."
LANG["PCR_CL_GROUP"]			= " Hanya grup tertentu bisa menggunakan menu ini!"
LANG["PCR_CL_LIMIT"]			= " Kamu telah mencapai batas maksimal!"
LANG["PCR_UNLIMIT_TEXT"]		= "Sepuasnya"
LANG["PCR_WINDOW_TITLE"]		= "PHX Prop Menu"
LANG["PCR_HEADER_TOP"]			= "Pilih prop sesukamu. Kamu punya"
LANG["PCR_HEADER_MID"]			= "%sx batas"
LANG["PCR_HEADER_BOTTOM"]		= "penggunaan untuk menggunakan fitur ini!"
LANG["PCR_CL_TOOLTIP_BANNED"]	= "Kamu tidak bisa menggunakan model ini."
LANG["PCR_CL_TOOLTIP_MODEL"]	= "Model: %s"
LANG["PCR_CL_MENU_NOTREADY"]	= " Fitur ini sedang belum ada saat ini."
LANG["PCR_WINDOW_GUIDE_TTL"]	= "Panduat Cepat: Prop Menu"
LANG["PCR_BTN_HELP_MENU"]		= "Bantuan Prop Menu"

LANG["PCR_CL_CMDUSEULX"]		= " Perintah ini di non-aktifkan. Gunakan 'ulx propmenu' atau '!propmenu' di chat!"
LANG["PCR_CMD_ULX_DISABLED"]	= "Perintah 'ulx propmenu' di non-aktifkan. Tekan [Tombol Bind Prop Menu] untuk membuka menunya."

LANG["PCR_EDT_IN_USE"]			= "Seorang admin sedang menyunting prop menu. Tunggu sebentar!"
LANG["PCR_EDT_ERROR_DISABLED"]	= "[Prop Menu] Error: Tambahan Prop Kuston di non-aktifkan!"
LANG["PCR_EDT_NO_RIGHTS"]		= "Kamu tidak mempunyai hak untuk mengakses ini."

--[[
	Admin Section, Revision: 16.09.21/X2Z
]]
LANG["PHXM_PLAYER_PROP_CHOOSER_KEY"]	= "Tombol Bawaan untuk membuka Prop Menu (Prop Chooser)."
LANG["PHXM_PROP_FREEZE_MIDAIR"]			= "Tombol Bawaan untuk menggunakan fitur 'Diam Ditempat' pada saa di udara sebagai Prop."
LANG["PHXM_ADMIN_PROP_RIGHT_CLICK"]		= "Haruskah prop juga bisa taunt pada saat menekan tombol mouse klik kanan?"
LANG["PHXM_ADMIN_TAUNT_SCANNER"]		= "(Butuh Map Restart) Aktifkan Taunt Scanner? Sehingga taunt akan di scan otomatis melalui folder."
LANG["PHXM_ADMLBL_USABLE_ENTS"]			= "Tipe Prop Entity yang bisa Digunakan"
LANG["PHXM_ADMLBL_USABLE_ENTS_REF"]		= "Tipe-tipenya yaitu: 1: Hanya benda Fisik, 2: Fisik & Dinamik, 3: Hampir Semua termasuk Ragdoll, 4: Kustom."
LANG["PHXM_ADMIN_USABLE_ENT_TYPE"]		= "Tipe Entity yang digunakan untuk Prop untuk menyamar"
LANG["PHXM_ADMIN_NOTIFY_ENT_TYPE"]		= "Beri Tahu prop tentang beberapa entity tidak bisa disamar dengan menekan tombol E. Hanya berlaku jika 'ph_usable_prop_type' di-set ke 3 atau 4."
LANG["NOTIFY_PROP_ENTTYPE"]				= "Tekan [E] untuk berinteraksi, [Klik] untuk menyamar obyek."
LANG["NOTIFY_CUST_ENT_TYPE_IS_ON"]		= "[PHX] Peringatan: Tekan [E] untuk interaksi objek, Tekan [Klik] untuk Menyamar objek."

--[[
	Custom Taunts, Revision: 16.09.21/X2Z
]]
LANG["TM_TAUNTS_SEARCH_NOTHING"]		= "Kayaknya ga ada deh taunt '%s' disini :("
LANG["TM_SEARCH_PLACEHOLDER"]			= "Cari di kategori ini: Ketik kata, huruf kecil & tanpa wildcard. Kosong=Semua."
LANG["PHXM_MSG_INPUT_IS_EMPTY"]			= "Teks kosong atau kamu tidak menekan ENTER."

--============= LATE ADDITION OF 10.06.2022/X2Z. =============--

--goto line: @132
LANG["MISC_SET"]						= "Set"
LANG["MISC_APPLY"]						= "Terapkan"
LANG["MISC_NO"]							= "Tidak"
LANG["MISC_YES"]						= "Ya"
LANG["MISC_WARN"]						= "Perhatian"
LANG["MISC_ERROR"]						= "Galat"
LANG["MISC_INFO"]						= "Informasi"
LANG["MISC_NOTICE"]						= "Perhatian"
LANG["MISC_IDK"]						= "Tak Diketahui"
LANG["MISC_NA"]							= "Kosong"

-- HUD
LANG["HUD_DECOY_ACTIVE"]                = "Tekan [%s]"
LANG["HUD_FAKETAUNT_COUNT"]             = "Sisa %ix"
LANG["HUD_FAKETAUNT_UNLI"]              = "Tak Terbatas"
LANG["NOTICE_GRENADE_SMG_GIVEN"]        = "Kamu baru saja diberi Grenade SMG."

--[[
	ADMIN PANEL, Revision 10.06/2022/X2Z
]]--
LANG["PHXM_TAUNT_SETTINGS"]				= "Peraturan Taunt"
LANG["PHXM_GENERAL_SETTINGS"]			= "Peraturan Umum"
LANG["PHXM_FAKE_TAUNT_SETTINGS"]		= "Peraturan Tipuan Taunt"
LANG["PHXM_FAKE_TAUNT_ENABLE"]			= "Perbolehkan Tipuan Taunt untuk dimainkan didalam prop pada map ini, Hanya bisa diakses melalui Taunt Menu."
LANG["PHXM_FAKE_TAUNT_MAXUSAGE"]		= "Pemakaian maksimal untuk Tipuan taunt, -1 untuk tanpa batas."
LANG["PHXM_TAUNT_RIGHT_CLICK"]		    = "Klik kanan untuk Taunt. Ini akan mengnon-aktifkan menu klik kanan di Taunt menu!"

LANG["PHXM_TAUNT_PITCH_SETTINGS"]		= "Peraturan Nada Taunt (Pitch)"
LANG["PHXM_TAUNT_PITCH_ENABLE"]			= "Perbolehkan Nada untuk Taunt"
LANG["PHXM_TAUNT_PITCH_RANGE_MIN"]		= "Minimal jangkauan (range) untuk nada taunt, 1 s.d. 99."
LANG["PHXM_TAUNT_PITCH_RANGE_MAX"]		= "Maximal jangkauan (range) untuk nada taunt, 100 s.d. 255."

LANG["PHXM_DECOY_SETTINGS"]				= "Peraturan Umpan (Decoy)"
LANG["PHXM_DECOY_ENABLE"]				= "Berikan reward Umpan? Reward akan diberikan SEKALI (maupun sudah punya) ketika prop masih hidup saat round berakhir."

LANG["PHXM_DISABLE_FOOTSTEP"]           = "Alihkan suara langkah kaki untuk tim Prop (Bisukan atau tidak)"

LANG["PHXM_ADMIN_CHATSETTING"]			= "Peraturan Jendela Chat"
LANG["PHXM_ADMIN_HUNTERBLIND"]			= "Peraturan Kontrol Pemejaman Mata Hunter"

LANG["PHXM_ADMIN_GIVEGRENADE_NEAREND"]  = "Haruskah grenade diberikan sebelum round berakhir? Jika iya, lihat 'ph_give_grenade_roundend_before_time'"
LANG["PHXM_ADMIN_GIVEGRENADE_TIME"]     = "Waktu dalam detik untuk memberikan grenade sebelum round berakhir. Umumnya dimulai dari 10 s.d. 30 detik."

--[[
	Plugins in sh_init.lua, Revision 10.06/2022/X2Z
]]--
LANG["PLUG_NAME_VER"]					= "Plugin: %s | v.%s"
LANG["PLUG_DESCRIPTION"]				= "Deskripsi: %s"

--[[
	Taunt Pitch, Revision 10.06/2022/X2Z
]]--
LANG["PHX_CTAUNT_USE_PITCH"]			= "Gunakan nada untuk taunt kustom"
LANG["PHX_CTAUNT_RANDOM_PITCH"]			= "Gunakan nada secara acak ketika memainkan taunt"
LANG["PHX_RTAUNT_USE_PITCH"]			= "Gunakan nada untuk taunt acak [%s]"
LANG["PHX_RTAUNT_RANDOMIZE"]			= "Gunakan nada secara acak untuk taunt acak [%s]"
LANG["PHX_CTAUNT_PITCH_FOR_FAKE"]		= "Gunakan nada untuk taunt tipuan"
LANG["PHX_CTAUNT_RANDPITCH_FOR_FAKE"]	= "Gunakan nada secara acak untuk taunt tipuan"
LANG["PHX_CTAUNT_SLIDER_PITCH"]			= "Slider untuk nada taunt"
LANG["TM_TOOLTIP_FAKETAUNT"]			= "Mainkan taunt tipuan pada prop secara acak"
LANG["TM_PREFERRED_PITCH"]              = "Level nada taunt yang diinginkan"

--[[
	Fake Taunt, Revision 10.06/2022/X2Z
	Description: Play fake taunts on random props in the map (Not Players)
]]--
LANG["PHX_CTAUNT_ON_RAND_PROPS"]		= "Mainkan di prop apapun (%ix)"
LANG["PHX_CTAUNT_ON_RAND_PROPS_UNLI"]	= "Mainkan di prop apapun"
LANG["PHX_CTAUNT_PLAYED_ON_RANDPROP"]	= "Kamu memainkan taunt di prop sembarang."
LANG["PHX_CTAUNT_RAND_PROPS_LIMIT"]		= "Penggunaan telah mencapai batas!"
LANG["PHX_CTAUNT_RAND_PROPS_NOT_PROP"]  = "Fitur tidak tersedia saat ini."
LANG["PHX_CTAUNT_RANDPROP_DISABLED"]	= "Taunt tipuan sedang di non-aktifkan."

--[[
	PH:Z Simple Decoy, Revision 10.06/2022/X2Z
]]--
LANG.DECOY_PROP	= {
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

LANG["DECOY_PUT_SUCC"]					= "Decoy berhasil diletakkan."
LANG["DECOY_CANT_PUT_HERE"]				= "Gak bisa taruh decoy disini!"
LANG["DECOY_GET_REWARD"]				= "Selamat! Kamu mendapatkan ['Prop Decoy'] karena berhasil hidup di round ini!"
LANG["DECOY_REMINDER_GET"]              = "Kamu mempunyai ['Prop Decoy'] Taruh di sembarang tempat untuk membingungkan Hunter!."
LANG["DECOY_FRAGS_RECEIVED"]			= "Umpan sukses: Kamu mencuri 1 tambahan skor dari %s!"
LANG["DECOY_DISABLED"]					= "Saat ini ['Prop Decoy'] sedang tidak tersedia."
LANG["PHXM_CL_DECOY_KEYBIND"]			= "Tombol untuk meletakkan umpan decoy. Default adalah 1 (Bukan Keypad 1)."

LANG["DECOY_INDICATOR_INVALID"]         = "Terlalu Miring!"
LANG["DECOY_INDICATOR_TOOFAR"]          = "Kejauhan!"
LANG["DECOY_INDICATOR_OK"]              = "Taruh Decoy [Tekan %s]"

LANG["PHXM_DECOY_HEALTH"]				= "Nyawa yang harus diberikan untuk prop tipuan (decoy). Default: 10"
LANG["PHXM_PLAYER_SHOW_DECOY_HELPER"]   = "Tampilkan penempatan Decoy? ini akan menampilkan dot putih dan teks dekat crosshair."
LANG["PHXM_PLAYER_SHOW_DECOY_MARKER"]   = "Tampilkan penanda Decoy?"

--[[
	Revision 10.06/2022/X2Z
    Prop Menu Update: Menu, Editor, Browser
]]--
LANG["PCR_MODEL_DONT_EXISTS"]   = "Model yang kamu pilih tidak tersedia di map ini!"

LANG["PCR_PLUG_WARN_MSG"]		= "Perhatian: Penambahan Kustom Prop ('pcr_allow_custom') adalah 0.\nYKamu harus aktifkan fitur ini agar bisa menggunakan editor\nCatatan: Membutuhkan map restart!"
LANG["PCR_PLUG_LBL_BINDKEY"]	= "Untuk mengganti tombol Bind, ketuk pada menu '[Pengaturan Saya] > Binds'"
LANG["PCR_PLUG_LBL_EDITOR"]		= "Editor Kustom Prop Menu"
LANG["PCR_PLUG_BTN_OPEN_EDT"]	= "Buka Editor"
LANG["PCR_PLUG_LBL_COMSET"]		= "Peraturan Umum"
LANG["PCR_PLUG_LBL_TECHSET"]	= "Peraturan Teknis"
LANG["PCR_PLUG_LBL_EXPSET"]		= "Fitur Eksperiment"
LANG["PCR_PLUG_LBL_PLAYERSET"]	= "Peraturan Pemain"

LANG["PCR_PLUG_ENABLE"]			= "Aktifkan fitur 'Prop Menu'"
LANG["PCR_PLUG_ALLOW_CUSTOM"]	= "(Butuh Map Restart) Tambahkan kustom prop lainnya ke daftar Prop Menu"
LANG["PCR_PLUG_PROP_BAN"]		= "(Butuh Map Restart) Jangan tambahkan prop yang telah di banned (daftar hitam)"
LANG["PCR_PLUG_USAGE_LIMIT"]	= "Batas penggunaan maksimal. -1 untuk bebas limit."
LANG["PCR_PLUG_PROP_LIMIT"]		= "(Butuh Map Restart) Batasi tambahan prop ke daftar Prop Menu"
LANG["PCR_PLUG_PROP_LIMITMAX"]	= "Jumlah prop maksimal yang akan ditambahkan ke Prop Menu. Catatan: Ini akan diacak!"
LANG["PCR_PLUG_USE_ULXMENU"]	= "Haruskah Prop Menu bisa diakses melalui: Console/Perintah Chat (0) atau ULX (1)?"
LANG["PCR_PLUG_USE_DELAY"]		= "Tunda waktu (dalam detik) sebelum pemain menggunakan prop lainnya."
LANG["PCR_PLUG_KICK_INVALID"]	= "Kick pemain yang mencoba untuk mengakses Prop tidak valid (Maksimal 4x)"
LANG["PCR_PLUG_SPACE_CHECK"]	= "Periksa jarak ruang (sempit/luas) sebelum pemain menggunakan prop agar tidak Stuck."
LANG["PCR_PLUG_X_BBOX"]			= "(Butuh Map Restart) Periksa Batas 'Luas Kotak' Entity (OBB) sebelum menambahkan ke daftar Prop Menu."
LANG["PCR_PLUG_X_BBOX_MAX"]		= "Luas Kotak 'BBox CollisionBound' Tinggi Maksimum. Minus akan di auto-kalkulasi."
LANG["PCR_PLUG_X_BBOX_MIN"]		= "Luas Kotak 'BBox CollisionBound' Rendah Maksimum. Minus akan di auto-kalkulasi."
LANG["PCR_PLUG_ONLY_GROUPS"]	= "Apakah Prop Menu hanya bisa diakses oleh beberapa grup, misalkan: Donator?"
LANG["PCR_PLUG_NOTIFYMSG"]		= "Beri tahu pemain untuk cara menggunakan Prop Menu di setiap ronde dimulai."

LANG["PCR_EDITOR_MSG_ERROR"]	= "Peraturanmu gagal karena ada yang Error.\nMohon periksa CONSOLE di servermu!"
LANG["PCR_EDITOR_MSG_SUCC"]		= "Peraturanmu telah sukses tersimpan dan sudah diperbaharui!"

LANG["PHZ_generic_title"]		= "Editor untuk Penambahan Prop Kustom"
LANG["PHZ_generic_helptext"]	= [[[Cara Menggunakan:
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
LANG["PHZ_generic_mdlinfo"] = [[Informasi Model:
%s
Ada Fisik: %s]]
LANG["PHZ_generic_mdlinfoStart"] = "(Pilih prop dulu!)"

LANG["PHZ_generic_no_ragdoll"]	= "Tidak: Ragdoll"
LANG["PHZ_generic_titlelabel"]	= "%s Pratinjau :"

LANG["PHZ_mount_game_sel"]		= "Pilih Game (Default: Garry's Mod)"
LANG["PHZ_input_placeholder1"]	= "Cari Folder: <nama folder> atau '*', blank = semua"
LANG["PHZ_input_placeholder2"]  = "Cari Addon: <nama> atau '*', blank = semua"
LANG["PHZ_msg_warn_close"]		= "Apakah kamu yakin untuk menutup Editor? Editan yang belum disimpan akan hilang."
LANG["PHZ_msg_commit"] 			= "Apakah kamu yakin untuk Perbaharui Perubahan?"
LANG["PHZ_msg_cant_empty"]		= "Daftar Prop tidak boleh Kosong!"
LANG["PHZ_msg_removesel"] 		= [[Hapus prop yang dipilih pada daftar. Legenda:
Merah = Tertanda untuk dihapus
Kuning: Prop tidak ada di server DAN harus di hapus.]]
LANG["PHZ_msg_warn_mdlinlist"]  = "PERHATIAN: Model ini sudah terdaftar!"
LANG["PHZ_msg_invalid_mdl"] 	= "Alasan: Model tidak cocok."
LANG["PHZ_apply_select"] 		= "Simpan & Terapkan"
LANG["PHZ_menu_copy"] 		    = "Salin Model"
LANG["PHZ_menu_refresh"] 	    = "Segarkan Model"
LANG["PHZ_tooltip_removesel"]	= "Hapus Terpilih"
LANG["PHZ_tooltip_wasmarked"] = [[Prop ini telah ditandai karena tidak ada di server.
Jika kamu menutup editor ini, prop tersebut akan dihapus.]]

LANG["PHZ_pcr_fb_allcontent"] = "Semua Kontent (Tidak semua pemain/server mempunyai konten yang sama)"
LANG["PHZ_pcr_fb_notmounted"] = "%s [Tidak Aktif]"

PHX.LANGUAGES[LANG.code] = LANG