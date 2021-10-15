local LANG = {}

LANG.code = "id"

LANG.Name 		 	= "Bahasa Indonesia"
LANG.NameEnglish	= "Indonesian Language" --Note: to prevent controversy, this should written "Indonesian Language" because Malay can often use "Bahasa Malay" too!
LANG.Author			= "Wolvindra-Vinzuerio, KamFretoZ" -- Only accept STRINGS.
-- Can Accept: String, and Table.
LANG.AuthorURL		= "https://steamcommunity.com/profiles/76561198210777189"

-- Special Section that isn't String-based
LANG.SUICIDEMSG = { --> FRETTA
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

LANG["CHAT_JOINED"]				= " bergabung "
LANG["CHAT_JOINEDTHE"]			= " menjadi " -- ini ke Team Spectator

LANG["CHAT_SWAPBALANCE"]		= "%s telah diganti ke %s untuk menyeimbangkan tim."
LANG["CHAT_SWAPBALANCEYOU"]		= "Kamu telah dipindahkan dari tim sebelumnya agar supaya lebih seimbang." -- Smile... for even in death, you have become children of Thanos
-- // END OF FRETTA SECTION \\

LANG["HELP_F1"] 				= [[Project Prop Hunt X.

Sebuah proyek mode permainan "Prop Hunt" untuk lebih modern dan optimal.

Informasi lebih lanjut bisa kunjungi di:
https://wolvindra.xyz/prophuntx

Untuk melihat tutorial, pengaturan, dan menu lainnya bisa diakses melalui:
Tombol [F1], tekan menu 'Menu Prop Hunt'.

Versi: ]].. PHX.VERSION ..[[ Revisi ke: ]].. PHX.REVISION ..[[

Selamat Bermain! :)
]]

-- Important!
LANG["LANGUAGE_CHANGED"]		= "Preferensi bahasa kamu sekarang diganti ke %s"

-- internal cl_menutypes section.
LANG["SUBTYPE_PREFERED_LANG"]	= "Preferensi Bahasa"
--LANG["SUBTYPE_TEXTENTRY_?"]	= "???"

-- Events
LANG["EV_PLAYER_CONNECT"]		= "%s telah tersambung ke server."
LANG["EV_PLAYER_JOINED"]		= "%s telah bergabung di server."
LANG["EV_PLAYER_DISCONNECT"]	= "%s telah keluar dari server (Alasan: %s)"

-- HUD elements
LANG["HUD_HP"]					= "NYAWA"
LANG["HUD_AMMO"] 				= "PELURU"	-- obsolete
LANG["HUD_MAGSEC"]				= "TTL. / CAD." --Magazine Counts (separator) Secondary Magazine Counts

-- !!WEAPON NAMES CANNOT BE TRANSLATED, THEY USE FROM language.GetPhrase THEREFORE IT'S IMPOSSIBLE TO DO.

LANG["TEAM_PROPS"]				= "Props"	-- ini agak aneh untuk di translate, jadi kita biarin aja dulu...
LANG["TEAM_HUNTERS"]			= "Hunters"	-- ini agak aneh untuk di translate, jadi kita biarin aja dulu...

LANG["HUD_ROTLOCK"]				= "Rotasi: Terkunci"
LANG["HUD_ROTFREE"]				= "Rotasi: Bebas"
LANG["HUD_KILLEDBY"]			= "Kamu barusan dibunuh oleh %s"

LANG["HUD_AUTOTAUNT"]			= "Taunt Otomatis dalam %d detik"
LANG["HUD_AUTOTAUNT_ALT"]		= "Taunt Otomatis dalam %d"
LANG["HUD_AUTOTAUNT_DISABLED"]	= "Taunt Otomatis non-aktif."

LANG["HUD_TargetID"]			= "Pemain: %s (%d%%)" -- Player: <NAME> (<HEALTH>%)

LANG["HUD_BLINDED"]				= "Hunters akan dilepaskan dalam %s"
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
LANG["TM_NOTICE_PLSWAIT"]		= "Harap Menunggu %s detik!"
LANG["TM_NOTICE_PLAYPREVIEW"]	= "Memainkan Taunt: %s"

LANG["TM_TOOLTIP_PLAYTAUNT"] 	= "Mainkan Taunt"
LANG["TM_TOOLTIP_PREVIEW"]		= "Dengarkan Taunt"
LANG["TM_TOOLTIP_PLAYCLOSE"]	= "Mainkan taunt dan tutup jendela"
LANG["TM_TOOLTIP_PLAYRANDOM"]	= "Mainkan taunt secara acak"
LANG["TM_TOOLTIP_CLOSE"]		= "Tutup"
LANG["TM_MENU_CLOSE"]			= "Tutup Menu"

LANG["TM_DELAYTAUNT_NOT_EXIST"] = "Taunt yang kamu pilih tidak dapat ditemukan di server ini!"
LANG["TM_DELAYTAUNT_PLSWAIT"]	= "Harap tunggu %s detik!"

--[[
	PHX Menu window
]]
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

--[[
	Player Mute Settings
]]
LANG["PHXM_MUTE_SELECT"]		= "Pilih siapapun yang ingin kamu diamkan."

--[[ 
	Player Settings
]]
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

--[[
	Player model Browser Section
]]
LANG["QUERY_MODEL_SELECTED"]	= "Skin %s telah terpilih dan akan digunakan setelah respawn."
LANG["QUERY_MODEL_INFO"]		= "Nama skin: %s - Tersedia untuk: Semua Orang"

LANG["MDL_MENU_REFRESH"] 		= "Muat ulang Ikon"
LANG["MDL_MENU_PREVIEW"] 		= "Pratinjau Skin"
LANG["MDL_MENU_MODELINFO"] 		= "Informasi Skin"


LANG["MISC_APPLYMDL"] 			= "Skin Diterapkan"

LANG["PHXM_MODEL_DISABLED"] 	= "Skin kustom telah di non-aktifkan di server ini."
LANG["PHXM_PLAYERMODEL_SETFOV"]	= "  Atur Kamera jarak/FOV"

--[[
	Server Settings
]]
LANG["PHXM_ADMIN_OPTIONS"]		= "Opsi-opsi Gamemode server (Hanya tampil jika kamu seorang Admin)"
LANG["PHXM_ADMIN_MUSTALIVE"]	= "Kamu harus dalam keadaan hidup untuk menaktifkan mode ini."

--[[
	Language Override
]]
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
LANG["PHXM_ABOUT_LINKS"]		= "Tautan dan Kredit"
LANG["PHXM_ABOUT_THANKS"]		= "Terima kasih banyak untuk Bantuan, Sugesti & Kontribusi kepada:\n %s"
LANG["PHXM_ABOUT_BTN_DONATE"]		= "Bantu PH:X dengan Donasi"
LANG["PHXM_ABOUT_BTN_HOME"]			= "Halaman Utama PH:X"
LANG["PHXM_ABOUT_BTN_GITHUB"]		= "GitHub Repository PH:X"
LANG["PHXM_ABOUT_BTN_PLUGINS"]		= "Plugin PH:X"
LANG["PHXM_ABOUT_BTN_CHANGELOGS"]	= "Catatan Riwayat PH:X"

-- fretta
LANG["HUD_SPECTATING"]	= "MENONTON"
LANG["HUD_YOUDIED"]		= "Kamu Mati!"

LANG["CHAT_STARTING_MAPVOTE"] = "Ronde telah Berakhir. Memulai 'MapVote'..."

-- This used for HUD Taunt Timer
LANG["HUD_PROP_TAUNT_TIME"]	= "Taunt"
LANG["HUD_PROP_CTAUNT_TIME"] = "Taunt Kustom"

LANG["PHXM_TAB_PLUGINS"]				= "Plugin & Tambahan"

-- Plugins Section
LANG["PLUGINS_NO_PLUGINS"]				= "Tidak ada plugin terinstall. Cari plugin lainnya disini!"
LANG["PLUGINS_BROWSE_MORE"]				= "Cari plugin lainnya"
LANG["PLUGINS_SERVER_HAS_NO_PLUGINS"]	= "Server ini tidak mepunyai plugin atau tambahan (addon) terinstall."
LANG["PLUGINS_SERVER_SETTINGS"]			= "-- Pengaturan Server --"
LANG["PLUGINS_CLIENT_SETTINGS"]			= "-- Pengaturan Pengguna --"

-- Text Entries
LANG["TEXTENTRY_FZ_SINGLE"] = "Rintis untuk suara Freeze Cam" -- this one is for ph_fc_cue_path command
LANG["TEXTENTRY_MV_PREFIX"] = "Imbuhan untuk MapVote"			 -- the map previx for mv_mapprefix

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

-- I'm actually exhausted and feel so burned out, but I'll update this in future, or in PH:Zero I guess.
-- Section: Custom Prop Editor File Browser and stuff...
-- LANG["PCR_EDT_XXX"] 	= "todo"
-- LANG["PCR_FB_XXX"] 	= "todo"

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

-- Add to Language Table.
PHX.LANGUAGES[LANG.code] = LANG