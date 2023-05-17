-- Kindly free to improve the language.

-- Originally written by: Fafy
-- Improved by Wolvindra-Vinzuerio & Godfather

local LANG = {}

LANG.code = "tr"

LANG.Name 		 	= "Türkçe" -- example: "Bahasa Indonesia"
LANG.NameEnglish	= "Turkish" -- Your Language but spoken in English, example: "Indonesian"
LANG.Author			= "Talha Berkay A. aka Matt, Nova Diablox, Fat Fox Talha" -- Only accept STRINGS.
-- Can Accept: String, and Table.
LANG.AuthorURL		= {	
	"https://steamcommunity.com/profiles/76561198443702005"
}
-- Special Section that isn't String-based
LANG.SUICIDEMSG = {  -- Fix me: there was addition text here but feel free to add more.
	"intihar etti!",
	"esrarengiz bir şekilde öldü.",
	"büyüden öldü.",
	"kendini dürbünsüz öldürdü.",
	"sinirlenip çıktı.",
	"sarhoş.",
	"öldü. Bir dahakine iyi şanslar!",
	"kendini tokatladı.",
	"ayağı kayıp düştü.",
	"baskıdan öldü.",
	"öldü. Ltfn F'e basın.",
	"Masum nesneları öldürdükten sonra pişmanlık duyuyor.",
	"Arka odalara geçti.",
	"soyunu kurutmayı deniyor.",
	"öldüdü.",
	"bütün nesneları öldürecekken panikledi.",
	"dur artık, yardıma ihtiyacın var.",
	"paçavra oldu.",
}
LANG.RANDOM_SPECTATORS = {
	"oturup izlemek için.",
	"takılmalarını izlemek için.",
	"ne olup bittiğini izlemek için.",
	" ",
}

LANG["PHX_TEAM_CONNECTING"] = "Bağlanıyor"
LANG["PHX_TEAM_PROPS"]		= "Nesneler"
LANG["PHX_TEAM_HUNTERS"] 	= "Avcılar"
LANG["PHX_TEAM_UNASSIGNED"]	= "Atanmamış"
LANG["PHX_TEAM_SPECTATOR"] 	= "İzleyici"

-- List of string-based translation

-- // FRETTA SECTION \\
--  FRETTA: Kill text (X killed Y)
LANG["HUD_KILLED"]				= "öldürdü"

-- FRETTA: HUDs
LANG["HUD_TIME"] 				= "SÜRE"
LANG["HUD_ROUND"]				= "RAUNT"
LANG["HUD_WAITPLY"]				= "Oyuncular bekleniyor..."
LANG["HUD_DEAD"]				= "(ÖLÜ) "

LANG["HUD_TEAMWIN"]				= "%s kazandı!"
LANG["HUD_LOSE"]				= "Berabere, herkes kaybetti!"
LANG["MISC_TIMELEFT"]			= "Kalan Süre: %s"
LANG["MISC_GAMEEND"] 			= "Oyun bu raunttan sonra bitecektir."

-- FRETTA: Team selection screen (F2)
LANG["DERMA_TEAMSELECT"]		= "Takım Seç"

-- FRETTA: F1 screeen
LANG["DERMA_RTV"] 				= "Harita Değişmek İçin Oyla"
LANG["DERMA_PHMENU"] 			= "Nesne Avı Menüsü"
LANG["DERMA_CHANGETEAM"]		= "Takım Değiş"

-- FRETTA: Scoreboard
LANG["DERMA_PLAYER"]			= "(%d oyuncu)"	
LANG["DERMA_PLAYERS"]			= "(%d oyuncular)"
LANG["DERMA_NAME"]				= "Ad"
LANG["DERMA_KILLS"]				= "Leş"
LANG["DERMA_DEATHS"]			= "Ölüm"
LANG["DERMA_PING"]				= "Gecikme"
LANG["DERMA_SERVER_TAG"]		= "SV"
LANG["DERMA_BOT_TAG"]			= "BOT"
LANG["DERMA_GAMEMODE_CREDITS"]	= "%s | Sürüm: %s - Rev. %s"

LANG["CHAT_JOINED"]				= " katıldı "
LANG["CHAT_JOINEDTHE"]			= " katıldı "

LANG["CHAT_SWAPBALANCE"]		= "Takım dengesi için %s , %s'lara aktarıldı."
LANG["CHAT_SWAPBALANCEYOU"]		= "Mükemmel dengeyi sağlamak için aktarıldın." -- Smile... for even in death, you have become children of Thanos

-- FRETTA: Splash Starting Screen
LANG["SPASHSCREEN_BY_X"]		= "%s tarafından"
-- RichTextBox
LANG["HELP_DONATORS_AND_CONTRIBUTORS"]  = "\n\nBağışçılar & Katkıda Bulunanlar:\n- %s"
-- // END OF FRETTA SECTION \\

LANG["HELP_F1"] 				= [[A Prop Hunt X Project.

A project to make Prop Hunt be more modern and customisable.

More info can be found at:
https://www.buymeacoffee.com/wolvindra

To See more info, help and guide, Press [F1] key and then click [Prop Hunt Menu] button.

Version: ]].. PHX.VERSION ..[[ Revision: ]].. PHX.REVISION ..[[

Have Fun!]]

LANG["LANGUAGE_CHANGED"]		= "Tercih edilen dil %s'yle değiştirildi."

-- internal cl_menutypes section.
LANG["SUBTYPE_PREFERED_LANG"]	= "Tercih Edilen Dil"

-- Events
LANG["EV_PLAYER_CONNECT"]		= "%s sunucuya bağlandı."
LANG["EV_PLAYER_JOINED"]		= "%s sunucuya katıldı."
LANG["EV_PLAYER_DISCONNECT"]	= "%s sunucudan ayrıldı. (Neden: %s)"

-- HUD elements
LANG["HUD_HP"]					= "CAN"
LANG["HUD_AMMO"] 				= "CEPHANE"
LANG["HUD_MAGSEC"]				= "MAG. / SEC." --Magazine | Secondary Magazine

-- !!WEAPON NAMES CANNOT BE TRANSLATED, THEY USE FROM language.GetPhrase THEREFORE IT'S IMPOSSIBLE TO DO.

LANG["TEAM_PROPS"]				= LANG["PHX_TEAM_PROPS"] 
LANG["TEAM_HUNTERS"]			= LANG["PHX_TEAM_HUNTERS"]

LANG["HUD_ROTLOCK"]				= "Nesne Döndürme: Kitli"
LANG["HUD_ROTFREE"]				= "Nesne Döndürme: Serbest"
LANG["HUD_KILLEDBY"]			= "%s tarafından öldürüldün"

LANG["HUD_AUTOTAUNT"]			= "Oto Taunt'a %d saniye"
LANG["HUD_AUTOTAUNT_ALT"]		= "Oto Taunt'a %d"

LANG["HUD_TargetID"]			= "Oyuncu: %s (%d%%)"

LANG["HUD_BLINDED"]				= "%s gözleri açılacak ve %s içinde serbest kalacaklar"
LANG["HUD_UNBLINDED"]			= "Önüm arkam sağım solum sobe saklanmayan ebe!"

LANG["BLIND_RESPAWN_TEAM"]		= "Sadece %s takımındayken %d saniyede yumarken doğmuştun."
LANG["BLIND_RESPAWN"]			= "Yumarken %d saniyede doğmuştun."

LANG["MISC_ACCEPT"]				= "Kabul"
LANG["MISC_OK"]					= "Tamam"
LANG["MISC_CLOSE"]				= "Kapat"
LANG["MISC_PREV"]				= "< ÖNCEKİ"
LANG["MISC_NEXT"]				= "SONRAKİ >"
LANG["MISC_ACCESSDENIED"]		= "Erişim Engellendi"

-- Chat messages
LANG["CHAT_NOPLAYERS"]			= "Oyunu başlatmak için yeterli oyuncu yok!"
LANG["CHAT_SWAP"]				= "Takımlar değiştirildi!"

LANG["CHAT_SWAPTEAM_WARNING"]   = "%dx (%dx MAKS) Takım değiştin. O süreden sonra takım değişemezsin."
LANG["CHAT_SWAPTEAM_REVERT"]	= "%s takımına geçemezsin çünkü takım değişme sayısını aştın."

LANG["CHAT_PROP_NO_ROOM"] 		= "Nesneye değişmek için yeterli alan yok!"

-- Notification
LANG["NOTIFY_IN_PROP_TEAM"]		= "Dönme özelliğinle Nesne Takımındasın! Fareyi hareket ettirerek nesneni döndürebilirsin."
LANG["NOTIFY_ROTATE_NOTICE"]	= "[R] tuşuna basarak dönmeyi kitleyebilirsiniz!"

-- Custom Taunt Window
LANG["TM_WARNING_CT_DISABLE"]	= "[NAX - Tauntlar] Uyarı: Bu sunucu özel tauntları devre dışı bırakmıştır."
LANG["TM_NO_TAUNTS"]			= "Uyarı: Bu kategoride tauntlar bulunamadı."
LANG["TM_PLAY_ONLY_ALIVE"] 		= "Özel tauntları sadece canlıyken çalabilirsin."

LANG["TM_WINDOW_TITLE"]			= "Nesne Avı Özel Taunt Penceresi"
LANG["TM_NOTICE_PLSWAIT"]		= "Lütfen rastgele taunt bitene kadar %s saniye bekleyiniz!"
LANG["TM_NOTICE_PLAYPREVIEW"]	= "Taunt Önizleniyor: %s"

LANG["TM_TOOLTIP_PLAYTAUNT"] 	= "Taunt Çal"
LANG["TM_TOOLTIP_PREVIEW"]		= "Taunt Önizle"
LANG["TM_TOOLTIP_PLAYCLOSE"]	= "Taunt Çal ve Kapat"
LANG["TM_TOOLTIP_PLAYRANDOM"]	= "Rastgele Taunt Çal"
LANG["TM_TOOLTIP_CLOSE"]		= "Kapat"
LANG["TM_MENU_CLOSE"]			= "Menüyü Kapat"

LANG["TM_DELAYTAUNT_NOT_EXIST"] = "Seçtiğin taunt sunucuda bulunamadı!"
LANG["TM_DELAYTAUNT_PLSWAIT"]	= "%s saniye bekleyiniz!"

--[[
	PHX Menu window
]]
LANG["PHXM_WINDOW_TITLE"]		= "Nesne Avı X - Gelişmiş Ayarlar & Menü"
LANG["SERVER_INFO_MOTD"]		= "SUNUCU BİLGİSİ & KURALLARI [GM]"

LANG["PHXM_TAB_HELP"]			= "Yardım & Rehber"
LANG["PHXM_TAB_MUTE"]			= "Oyuncu Susturma"
LANG["PHXM_TAB_PLAYER"]			= "Oyuncu Ayarları"
LANG["PHXM_TAB_MODEL"] 			= "Model Tarayıcısı"
LANG["PHXM_TAB_MODEL_DISABLED"]	= "Model Tarayıcısı (Devre Dışı)"
LANG["PHXM_TAB_ADMIN"]			= "Admin Ayarları"
LANG["PHXM_TAB_ABOUT"]			= "NA:X Hakkında"
LANG["PHXM_TAB_MAPVOTE"]		= "Harita Oyla"
LANG["PHXM_TAB_PLUGINS"]		= "Eklentiler"

LANG["PHXM_CVAR_CHANGED"]		= "[Ayarlar] %q CVarı %q'a değiştirildi."

--[[
	Player Mute Settings
]]
LANG["PHXM_MUTE_SELECT"]		= "Susturmak istediğiniz oyuncuyu seçin."

--[[ 
	Player Settings
]]
LANG["PHXM_PLAYER_OPTIONS"]		= "Oyuncu Ayarları"
LANG["PHXM_PLAYER_LANG"]		= "Diller"
LANG["PHXM_PLAYER_BIND"]		= "Tuş Atamaları"
LANG["PHXM_PLAYER_HUDSETTINGS"]	= "Arayüz Ayarları"

LANG["PHXM_PLAYER_TAUNT_KEY"]			= "Rastgele Taunt Tuşu"
LANG["PHXM_PLAYER_TAUNTWINDOW_KEY"]		= "Taunt Menü Tuşu"
LANG["PHXM_PLAYER_ROTATLOCK_KEY"]		= "Dönme Kilidi Tuşu"

LANG["PHXM_PLAYER_TOGGLE_HALOS"]		= "Nesne seçerken parlama efektini etkinleştir"
LANG["PHXM_PLAYER_IDNAMES"]				= "Takım oyuncularının adlarını başlarının üstünde göster (ayrıca duvar arkası gözükür)"
LANG["PHXM_PLAYER_ENDROUND_CUE"]		= "Raunt sonu işareti sesini çal"
LANG["PHXM_PLAYER_TAUNTMENU_AUTOCLOSE"]	= "Çift tıklandığında taunt penceresini otomatik kapatma seçeneği"
LANG["PHXM_PLAYER_SEE_HUNTER_LINE"]		= "İzleyici modunda avcıların nereye nişan aldığını görmek için ışın çizer."
LANG["PHXM_PLAYER_SEE_LBALL_ICONS"]		= "'Şanslı top' düştüğünde simgesini görünür yap."
LANG["PHXM_PLAYER_SEE_CRYSTAL_ICONS"]	= " 'Şeytan top' düştüğünde simgesini görünür yap."

LANG["PHXM_PLAYER_USE_NEW_HUD"]			= "Yeni (Gelişmiş) Arayüzü Kullan"
LANG["PHXM_PLAYER_SHOW_TUTOR"]			= "Öğretici Pencereyi Göster (2 kere nesne takımında doğunca gösterir)"
LANG["PHXM_PLAYER_USE_NEW_CROSSHAIR"]	= "Özel Nişangahı Etkinleştir"
LANG["PHXM_PLAYER_SHOW_TEAM_TOPBAR"]	= "Toplam hayatta olan takım oyuncularını sol üst köşede gösterir (En az 4 oyuncu gösterilir)"

--[[
	Player model Browser Section
]]
LANG["QUERY_MODEL_SELECTED"]	= " %s modeli seçildi ve yeniden doğduktan sonra geçerli olacak!"
LANG["QUERY_MODEL_INFO"]		= "Model adı: %s - Uygunluk: Herkese"

LANG["MDL_MENU_REFRESH"] 		= "Simgeyi Yenile"
LANG["MDL_MENU_PREVIEW"] 		= "Modeli Önizle"
LANG["MDL_MENU_MODELINFO"] 		= "Model Bilgisi"


LANG["MISC_APPLYMDL"] 			= "Modeli Uygula"

LANG["PHXM_MODEL_DISABLED"] 	= "Üzgünüz, Özel Oyuncu Modelleri bu sunucuda devre dışı!"
LANG["PHXM_PLAYERMODEL_SETFOV"]	= "Model Görüş Açısını Ayarla"

--[[
	Server Settings
]]
LANG["PHXM_ADMIN_OPTIONS"]		= "Sunucunun oyun ayarları (Sadece Adminlere ve Kurucuya Görünür)"
LANG["PHXM_ADMIN_MUSTALIVE"]	= "Bu işlemi gerçekleştirebilmek için canlı olmanız gerekiyor."

--[[
	Language Override
]]
LANG["PHXM_ADMIN_LANGOVERRIDE"]	= "Zorunlu Dil"

LANG["PHXM_ADMIN_FORCELANG"] 				= "Zorunlu dili kullan? Bu kullanıcının dilini sunucunun seçtiği ile değiştirecektir."
LANG["PHXM_ADMIN_LANGTOUSE"]				= "Zorunlu Dil kullanılacak."
LANG["PHXM_ADMIN_PLAYERDEFAULTLANG"] 		= "İlk girişte varsayılan oyuncu dili."

-- Gameplay settings
LANG["PHXM_ADMIN_CUSTOM_MODEL"]				= "Avcılar özel modellere erişebilir. Bu [Model Tarayıcı] menüsünü etkinleştirir."
LANG["PHXM_ADMIN_CUSTOM_MODEL_PROP"]		= "Nesneler özel modellere erişebilir (Avcıların özel modellere erişimi olmasını gerektirir.)"
LANG["PHXM_ADMIN_TAUNT_DELAY_CUSTOM"]		= "Özel Taunt Gecikmesi (Saniye)"
LANG["PHXM_ADMIN_TAUNT_DELAY_RANDOM"]		= "Normal Taunt Gecikmesi (Saniye)"
LANG["PHXM_ADMIN_TAUNT_DELAY_AUTO"]			= "Oto Taunt Gecikmesi (Saniye)"
LANG["PHXM_ADMIN_AUTOTAUNT_ENABLE"]			= "Oto Taunt Özelliklerini Etkinleştir. (Süre bir sonraki raunt düzelecektir)"

LANG["PHXM_ADMIN_NOTICE_ROTATION"]			= "Her doğulduğunda 'Nesne Dönme' bildirimini göster."
LANG["PHXM_ADMIN_CAMERA_COLLIDE"]			= "Nesne kamerasının duvarlara değmesini etkinleştir."
LANG["PHXM_ADMIN_FREEZECAM"]				= "Nesne takımı için Sabit Kamera özelliğini etkinleştir."
LANG["PHXM_ADMIN_FREEZECAM_HUNTER"]			= "Avcı takımı için Sabit Kamera özelliğini etkinleştir."
LANG["PHXM_ADMIN_PROP_COLLIDE"]				= "Nesne takımındaki oyuncuların birbirine değebilmesini etkinleştir."
LANG["PHXM_ADMIN_SWAP_TEAM"] 				= "Her raunt takım değiştir - Bu ayar devre dışı bırakılırsa takımlar olduğu gibi kalacaktır."
LANG["PHXM_ADMIN_HUNTER_PENALTY"]			= "Avcı can cezası"
LANG["PHXM_ADMIN_HUNTER_KILL_BONUS"]		= "Avcı leş bonusu "
LANG["PHXM_ADMIN_HUNTER_SMG_GRENADES"]		= "Avcı SMG bombaları"
LANG["PHXM_ADMIN_GAME_TIME"]				= "(Haritayı Yeniden Başlatma Gerektirir) Toplam oyun süresi(Dakika)"
LANG["PHXM_ADMIN_BLINDLOCK_TIME"]			= "Avcı yumma zamanı (Saniye)"
LANG["PHXM_ADMIN_ROUND_TIME"]				= "(Haritayı Yeniden Başlatma Gerektirir) Oyun raunt süresi(Saniye)"
LANG["PHXM_ADMIN_ROUNDS_PER_MAP"]			= "(Haritayı Yeniden Başlatma Gerektirir) Harita başı toplam oyun raundu"
LANG["PHXM_ADMIN_ENABLE_LUCKYBALL"]			= "Şanslı Topların kırılabilir nesnelerde çıkmasına izin ver (Çıkma şansı 8%)"
LANG["PHXM_ADMIN_ENABLE_CRYSTAL"]			= "Şeytan Toplarının avcı öldüğünde çıkmasına izin ver (Her zaman çıkar)"
LANG["PHXM_ADMIN_WAIT_PLAYERS"]				= "Oyuna başlamak için oyuncuları bekle"
LANG["PHXM_ADMIN_WAIT_MIN_PLAYERS"]			= "Oyunun başlaması için gereken en az oyuncu sayısı (varsayılan: 1)"
LANG["PHXM_ENABLE_PLAYER_JOIN_LEAVE"] 		= "Oyuncu ayrılıp katıldığında sohbet bildirimini etkinleştir. (Kendi özel sohbet eklentinizi kullanmak istiyorsanız bu değeri '0' yapın."

LANG["PHXM_ADMIN_FORCEJOINBALANCE"]			= "Oyuncular katıldıklarında takımları eşitlemesini sağla. (Takım Değişmesi açıksa bu ayarı devre dışı bırakın)"
LANG["PHXM_ADMIN_ENABLETEAMBALANCE"]		= "Takım Dengesini Etkinleştir: Raunt başında otomatik olarak takımları eşitle."
LANG["PHXM_ADMIN_PICKUP_PROPS"] 			= "Küçük nesnelerle etkileşime izin ver? 0: İzin Verme, 1: Sadece Avcılar, 2: Sadece Nesneler, 3: Herkese izin ver."

LANG["PHXM_ADMIN_TAUNTMODES"]			= "Taunt Modları"
LANG["PHXM_ADMIN_TAUNTMODE_MODE"]		= "--[Mevcut Taunt Modu: %d ]--"
LANG["PHXM_ADMIN_TAUNTMODE0"]			= "Mod [0]: F3/Rastgele Taunt"
LANG["PHXM_ADMIN_TAUNTMODE1"]			= "Mod [1]: C/Özel Taunt"
LANG["PHXM_ADMIN_TAUNTMODE2"]			= "Mod [2]: Her İkiside"
LANG["PHXM_ADMIN_TAUNTSOPEN"]			= "Taunt Penceresini Aç"

LANG["PHXM_MODE_DEFAULT"] 				= "--[ Etkileşim modu %d'ya ayarlandı ]--"
LANG["PHXM_MODE0"]						= "Mode [0]: İzin Verme"
LANG["PHXM_MODE1"]						= "Mode [1]: Sadece Avcılar"
LANG["PHXM_MODE2"]						= "Mode [2]: Sadece Nesneler"
LANG["PHXM_MODE3"]						= "Mode [3]: Herkese izin ver"

--[[
	Admin Developer Sections
]]
LANG["PHXM_ADMIN_DEVSECTION"]		= "Geliştirici Ayarları"
LANG["PHXM_ADMIN_ROOMCHECK"]		= "Nesne çarpışmasını etkinleştir? Bu ayar duvara veya nesnelere sıkışmanızı engeller."
LANG["PHXM_ADMIN_USENEWMKBREN"]		= "Bren MK II bonus silahı için yeni modeli kullan (Haritayı Yeniden Başlatma Gerektirir)"
LANG["PHXM_ADMIN_BEVERBOSE"]		= "Geliştirici: Ayrıntılı Ol - NA:X'in bütün olayları ve bilgileri açıkça bildirmesini etkinleştir."
LANG["PHXM_ADMIN_SHOWPLNAMEHEAD"]	= "Oyuncu takım adlarının ekranda belirmesini etkinleştir."
LANG["PHXM_ADMIN_USESINGLE_FZCAM"]	= "Ses listesi kullanmak yerine tek bir Sabit Kamera sesi kullan. (Sabit Kamera sesini belirlemek için 'ph_fc_cue_path' yolunu kullan)"
LANG["PHXM_ADMIN_MODELLISTINGTYPE"] = "Oyuncu Modeli Listeleme Metodu: 0: Her Şeyi Dahil Et, 1: list.Get('PlayerOptionsModel')'i kullan"
LANG["PHXM_ADMIN_JUMPPOWER"]		= "Nesneler için ek zıplama gücü katsayısı"
LANG["PHXM_ADMIN_ENABLE_OBB"]		= "Geliştirici: Özelleştirilmiş Nesne Varlık Modelinin Sınırları değiştiricisini config verisinden etkinleştir (OBB)"
LANG["PHXM_ADMIN_RELOAD_OBB"]		= "Geliştirici: Her raunt yeniden başlatıldığında OBB değiştiricisini yeniden yükle"

--[[
	Experimental & PH:X Features
]]
LANG["PHXM_ADMIN_EXPERIMENTALPHX"]			= "Nesne Avı: X Deneysel Şeyler"

LANG["PHXM_ADMIN_HLA_COMBINE"]				= "HL: Alyx Combine model desteği ekle"
LANG["PHXM_ADMIN_TEAMBALANCE"]				= "Temel Takım Ayarları"
LANG["PHXM_ADMIN_CHANGETEAM_LIMIT"]			= "Takım değiştirme sınırı kullan. Devre dışı bırakmak için '-1'."
LANG["PHXM_ADMIN_USENEWCHAT"]				= "Yeni Sohbet Kutusunu kullan (eChat) - Bu geçicidir. Eğer halihazırda varsa, dokunmayın."
LANG["PHXM_ADMIN_NEWCHATPOS"]				= "Yeni Sohbet Kutusu Pozisyonu: Yükseklik pozisyonunu N pikselden çıkar."
LANG["PHXM_ADMIN_RESPAWNONBLIND"]			= "Yumarken doğmaya izin ver"
LANG["PHXM_ADMIN_RESPAWNONBLIND_TEAM"]		= "Yumarken sadece belli bir takımın doğmasına izin ver: 0: Herkes, 1: Avcılar, 2: Nesneler"
LANG["PHXM_ADMIN_REWSPANTIMEPERCENT"]		= "Doğmana izin veren yumma süresi oranı. Varsayılan 0.75 (75% * Maksimum Yumma Süresi anlamına geliyor)"
LANG["PHXM_ADMIN_ALLOWRESPAWN_SPECTATOR"]	= "İzleyici takımına atanırken yumma süresinde doğmaya izin ver"
LANG["PHXM_ADMIN_ALLOWRESPAWN_TEAMCHANGE"]	= "Farklı bir takıma atanırken yumma süresinde doğmaya izin ver (Bunu etkinleştirmek önerilmez)"

--[[
	MapVote Settings
]]
LANG["PHXM_MV_SETTINGS"]			= "Harita Oylama Ayarları"

LANG["PHXM_MV_ALLOWCURMAP"]			= "Mevcut haritanın oylanmasına izin ver"
LANG["PHXM_MV_COOLDOWN"]			= "Oylama için harita bekleme süresini etkinleştir"
LANG["PHXM_MV_USE_ULX_VOTEMAPS"]	= "ULX harita oylama listesini kullan? Eğer yoksa, varsayılan maps/*.bsp kullanılacak."
LANG["PHXM_MV_MAPLIMIT"]			= "Harita oylamasından gösterilen haritaların sayısı."
LANG["PHXM_MV_TIMELIMIT"]			= "Varsayılan harita oylama süresi (Saniye)."
LANG["PHXM_MV_MAPBEFOREREVOTE"]		= "Bir haritanın yeniden gözükmesi için gereken harita değişikliği sayısı"
LANG["PHXM_MV_RTVCOUNT"]			= "Oylamayı başlatmak için gerekli oyuncu sayısı"

LANG["PHXM_MV_EXPLANATION1"]		= "Hangi haritanın listeleneceği, Örneğin [ mv_map_prefix 'phx_,ph_,cs_,de_' ] konsolda kullanın."
LANG["PHXM_MV_EXPLANATION2"]		= "Eğer ULX yüklüyse, 'ulx map_vote' kullanın. Aksi takdirde 'mv_start' kullanın."
LANG["PHXM_MV_EXPLANATION3"]		= "Harita Oylama Eylemi (İptal etmek için, basitçe 'ulx unmap_vote' yada 'mv_stop' konsolda kullanın.)"

LANG["PHXM_MV_START"]		= "Harita Oylamasını Başlat"
LANG["PHXM_MV_STOP"]		= "Harita Oylamasını Durdur"
--                  			  ^YOU VIOLATED THE LAW!

--[[ 
	Versioning, Credits or About section
]]
LANG["PHXM_ABOUT_VERSIONING"]		= "Sürüm: %s - Revizyon: %s"
LANG["PHXM_ABOUT_AUTHOR"]			= "%s tarafından"
LANG["PHXM_ABOUT_ENJOYING"]			= "Eğer oyunda eğleniyorsanız, bağış yapmaya ne dersiniz!"
LANG["PHXM_ABOUT_UPDATE"]			= "Nesne Avı X Güncellemeleri"

LANG["PHXM_VIEW_UPDATE_INFO"]		= "Güncelleme bilgisini göster"
LANG["PHXM_CHECK_FOR_UPDATES"]		= "Güncellemeleri konrol et"
LANG["PHXM_UPDATE_FOUND_TEXT"]		= "Güncellemeler konrol edildi. Lütfen daha fazla bilgi için konsolu kontrol edin.\n\nYenilikleri güncellemeyi görmek ister misiniz?"
LANG["PHXM_UPDATE_FOUND_TITLE"]   	= "Güncelleme Bilgisi"
LANG["PHXM_UPDATE_FOUND_BUTTON"]   	= "Güncellemeleri Göster"

LANG["UPDATE_NOTIFY_MSG_NOTFOUND"]	= "Güncelleme bulunamadı. Lütfen ilk olarak 'Güncellemeleri konrol et' butonuna tıklayın!"
LANG["UPDATE_NOTIFY_MSG_TITLE"]		= "Güncelleme bulunamadı"
LANG["UPDATE_NOTIFY_WINDOW_TITLE"]	= "Güncelleme Bildirimi"
LANG["UPDATE_RTBOX_APPEND"]			= "\n\nBilginize:\nŞuanda: %s sürümünü %s revizyonuyla kullanıyorsunuz"
LANG["UPDATE_BTN_SEEFULL"]			= "Tüm Değişiklikleri Gör"

LANG["PHXM_ABOUT_LINKS"]			= "Bağlantılar ve Krediler"
LANG["PHXM_ABOUT_THANKS"]			= "Destek için Özel Teşekkürler, Öneri & Katkılar:\n %s"
LANG["PHXM_ABOUT_BTN_DONATE"]		= "NA:X'ı bağış yaparak destekle"
LANG["PHXM_ABOUT_BTN_HOME"]			= "NAX Anasayfası"
LANG["PHXM_ABOUT_BTN_GITHUB"]		= "NAX GitHub Dizini"
LANG["PHXM_ABOUT_BTN_PLUGINS"]		= "NAX Eklentiler"
LANG["PHXM_ABOUT_BTN_CHANGELOGS"]	= "NAX Değişiklik Kaydı"

-- fretta
LANG["HUD_SPECTATING"]	= "İZLENİYOR"
LANG["HUD_YOUDIED"]		= "Öldün!"

LANG["CHAT_STARTING_MAPVOTE"] = "Raunt bitti. Harita oylaması başlatılıyor..."

-- This used for HUD Taunt Timer
LANG["HUD_PROP_TAUNT_TIME"]	= "Rastgele Taunt"
LANG["HUD_PROP_CTAUNT_TIME"] = "Özel Taunt"

-- Plugins Section
LANG["PLUGINS_NO_PLUGINS"]				= "Yüklü eklenti yok. Burada daha fazla eklentiye göz atın!"
LANG["PLUGINS_BROWSE_MORE"]				= "Daha fazla eklentiye göz atın"
LANG["PLUGINS_SERVER_HAS_NO_PLUGINS"]	= "Üzgünüz, Bu sunucuda kurulu özel eklenti yok."
LANG["PLUGINS_SERVER_SETTINGS"]			= "-- Sunucu Ayarları --"
LANG["PLUGINS_CLIENT_SETTINGS"]			= "-- Kullanıcı Ayarları --"

-- Text Entries
LANG["TEXTENTRY_FZ_SINGLE"] = "Sabit Kamera Tek Ses Yolu"
LANG["TEXTENTRY_MV_PREFIX"] = "Harita Oylama Harita Öneki"

LANG["MISC_GAME_ENDED"]		= "Oyun bitti."

--============= LATE ADDITION OF 16.09.21/X2Z. =============--

--[[
	Credits: Late Addition: Revision: 16.09.21/X2Z
]]

LANG["PHXM_ABOUT_BTN_WIKI"]			= "NAX Wiki & Kılavuzlar"

--[[
	Auto Taunt: Late Addition: Revision: 16.09.21/X2Z
]]

LANG["HUD_AUTOTAUNT_DISABLED"]		= 	"Oto Taunt devre dışı."
LANG["HUD_AUTOTAUNT_WAITFORUPDATE"]	=	"Oto Taunt senkronize ediliyor..."

--[[
	MapVote: Late Addition: Revision: 16.09.21/X2Z
]]
LANG["PHXM_MV_VOTEROCKED"]				= "Oylama çağrısı yapıldı, harita oylaması raunt sonu başlayacak"
LANG["PHXM_MV_VOTEROCKED_IMMINENT"]		= "Oylama çağrısı yapıldı, harita oylaması çok yakın"
LANG["PHXM_MV_VOTEROCKED_PLY_TOTAL"]	= "%s oylama çağrısı yaptı. ( %d / %d )"

LANG["PHXM_MV_MUST_WAIT"]				= "Oy vermeden önce biraz beklemelisin!"
LANG["PHXM_MV_VOTEINPROG"]				= "Şu anda devam eden bir oylama var!"
LANG["PHXM_MV_HAS_VOTED"]				= "Zaten oylama çağrısı yaptın!"
LANG["PHXM_MV_ALR_IN_VOTE"]				= "Zaten oylama yapıldı, harita değişecek!"
LANG["PHXM_MV_NEED_MORE_PLY"]			= "Oylama çağrısı için daha fazla oyuncuya ihtiyacınız var!"

--[[
	Late Addition: Revision: 16.09.21/X2Z
]]
LANG["PROP_PLAYERMDL_BANNED"]	= "Özel Nesne Oyuncu Modeliniz sunucudan yasaklandı."

--[[
	Prop Menu/Prop Chooser, Revision: 16.09.21/X2Z
]]

LANG["PCR_USAGE_UNLIMIT"]		= "[Nesne Menü] **Unlimited** kullanımın kaldı!"
LANG["PCR_USAGE_COUNT"]			= "[Nesne Menü] %d kullanımın kaldı!"
LANG["PCR_PLS_WAIT"]			= "[Nesne Menü] Lütfen %d saniye bekleyiniz."
LANG["PCR_NOROOM"]				= "[Nesne Menü] Nesne değiştirmek için yeterli alan yok!"
LANG["PCR_PROPBANNED"]			= "[Nesne Menü] Bu nesne sunucu tarafından yasaklanmıştır."
LANG["PCR_PROPBANNED_BYPCR"]	= "[Nesne Menü] Nesne menüsü bu nesneyi yasakladığı için kullanamazsınız."
LANG["PCR_REACHED_LIMIT"]		= "[Nesne Menü] Sınıra ulaştın!"
LANG["PCR_STAY_ON_GROUND"]		= "[Nesne Menü] Yerde kalmalı ve çömelmemelisiniz!"
LANG["PCR_ONLY_GROUP"]			= "[Nesne Menü] Sadece belli gruplar bu menüyü açabilir!"
LANG["PCR_NOT_EXIST_COUNT"]		= "Seçtiğiniz nesne bu haritada yok! ( %s / 4 )"
LANG["PCR_NOT_EXIST"]			= "Seçtiğiniz nesne bu haritada yok!"

-- PCR Client section, reason why there is a space because of chat.AddText between args.
LANG["PCR_NOTIFY_1"]			= " Bunu sunucu nesne menüsü %s sürümünü kullanıyor!"
LANG["PCR_NOTIFY_2"]			= " konsolda veya F1 -> [Nesne Seçme Yardımı] menüsü."
LANG["PCR_CL_DISABLED"]			= " Bu özellik devre dışı."
LANG["PCR_CL_GROUP"]			= " Sadece belli gruplar bu menüyü açabilir!"
LANG["PCR_CL_LIMIT"]			= " Sınıra ulaştın!"

LANG["PCR_UNLIMIT_TEXT"]		= "Sınırsız"
LANG["PCR_WINDOW_TITLE"]		= "NA:X Nesne Menü"
LANG["PCR_HEADER_TOP"]			= "İstediğin nesneyi seç."
LANG["PCR_HEADER_MID"]			= "%s hakkın var"
LANG["PCR_HEADER_BOTTOM"]		= "bu nesne seçiciyi kullanmak için!"
LANG["PCR_CL_TOOLTIP_BANNED"]	= "Bu modeli kullanamazsın."
LANG["PCR_CL_TOOLTIP_MODEL"]	= "Model: %s"
LANG["PCR_CL_MENU_NOTREADY"]	= " Bu özellik şu anda kullanılamıyor."
LANG["PCR_WINDOW_GUIDE_TTL"]	= "Hızlı Rehber: Nesne Menüsü 101"
LANG["PCR_BTN_HELP_MENU"]		= "Nesne Yardım Menüsü"

LANG["PCR_CL_CMDUSEULX"]		= " Bu komut devre dışı. 'ulx propmenu' kullanın!"
LANG["PCR_CMD_ULX_DISABLED"]	= "ulx propmenu komutu devre dışı. [Nesne Menüsü Tuş Ataması]'na basarak açınız."

LANG["PCR_EDT_IN_USE"]			= "Bir admin hala nesne bilgisini düzenliyor. Lütfen bekleyiniz!"
LANG["PCR_EDT_ERROR_DISABLED"]	= "[Nesne Menüsü] Hata: Özel Nesne Eki Devre dışı!"
LANG["PCR_EDT_NO_RIGHTS"]		= "Bu özelliğe erişme hakkınız yok."

--[[
	Admin Section, Revision: 16.09.21/X2Z
]]
LANG["PHXM_PLAYER_PROP_CHOOSER_KEY"]	= "Nesne Menüsünü açmak için varsayılan tuş."
LANG["PHXM_PROP_FREEZE_MIDAIR"]			= "Bir nesne olarak havadayken hareketi dondurmak için varsayılan tuş"
LANG["PHXM_ADMIN_TAUNT_SCANNER"]		= "(Haritayı Yeniden Başlatma Gerektirir) taunt tarayıcısını etkinleştir?"
LANG["PHXM_ADMLBL_USABLE_ENTS"]			= "Kullanılabilir Nesne Varlık Türleri"
LANG["PHXM_ADMLBL_USABLE_ENTS_REF"]		= "Türler: 1: Yalnızca Fizik, 2: Fizik & Dinamikler, 3: Neredeyse Her şey (cesetler dahil), 4: Özel Varlıklar."
LANG["PHXM_ADMIN_USABLE_ENT_TYPE"]		= "Nesnenin dönüşebileceği varlık türleri"
LANG["PHXM_ADMIN_NOTIFY_ENT_TYPE"]		= "Nesnelere [E]'ye basılarak dönüşülemeyen varlıkları bildir. Sadece 'ph_usable_prop_type' 3 veya 4'se çalışır."
LANG["NOTIFY_PROP_ENTTYPE"]				= "Etkileşime girmek için [E]'ye bas, Dönüşmek için sol tıkla."
LANG["NOTIFY_CUST_ENT_TYPE_IS_ON"]		= "[NAX] Uyarı: Etkileşime girmek için [E]'ye bas, Dönüşmek için sol tıkla."

--[[
	Custom Taunts, Revision: 16.09.21/X2Z
]]
LANG["TM_TAUNTS_SEARCH_NOTHING"]		= "'%s' içeren taunt bulunamadı..."
LANG["TM_SEARCH_PLACEHOLDER"]			= "Bu kategoride ara: sözcük gir, küçük harf & joker karakter yok. Boş=Hepsini Göster."
LANG["PHXM_MSG_INPUT_IS_EMPTY"]			= "Metin boş veya ENTER tuşuna basmadınız."

--============= LATE ADDITION OF 10.06.2022/X2Z. =============--

--goto line: @132
LANG["MISC_SET"]						= "Ayarla"
LANG["MISC_APPLY"]						= "Uygula"
LANG["MISC_NO"]							= "Hayır"
LANG["MISC_YES"]						= "Evet"
LANG["MISC_WARN"]						= "Uyarı"
LANG["MISC_ERROR"]						= "Hata"
LANG["MISC_INFO"]						= "Bilgi"
LANG["MISC_NOTICE"]						= "Uyarı"
LANG["MISC_IDK"]						= "Bilinmeyen"
LANG["MISC_NA"]							= "N/A"

-- HUD
LANG["HUD_DECOY_ACTIVE"]                = "[%s]'e bas"
LANG["HUD_FAKETAUNT_COUNT"]             = "%ix Kaldı"
LANG["HUD_FAKETAUNT_UNLI"]              = "Sınırsız"
LANG["NOTICE_GRENADE_SMG_GIVEN"]        = "SMG bombaları edindin."

--[[
	ADMIN PANEL, Revision 10.06/2022/X2Z
]]--
LANG["PHXM_TAUNT_SETTINGS"]				= "Taunt Ayarları"
LANG["PHXM_GENERAL_SETTINGS"]			= "Genel Ayarlar"
LANG["PHXM_FAKE_TAUNT_SETTINGS"]		= "Sahte Taunt Ayarları"
LANG["PHXM_FAKE_TAUNT_ENABLE"]			= "Sahte tauntların haritada rastgele bir şekilde nesnelerin üzerinde çalınmasına izin ver. Sadece Özel Taunt Menüsünden erişilebilir."
LANG["PHXM_FAKE_TAUNT_MAXUSAGE"]		= "En fazla kullanılabilir sahte taunt; -1 sınırsızdır."
LANG["PHXM_TAUNT_RIGHT_CLICK"]		    = "Taunt için sağ tıkla. Bu özel menüde sağ tıkı devre dışı bırakacaktır!"

LANG["PHXM_TAUNT_PITCH_SETTINGS"]		= "Taunt Ses Perdeleme Ayarları"
LANG["PHXM_TAUNT_PITCH_ENABLE"]			= "Taunt Ses Perdesini Ayarla"
LANG["PHXM_TAUNT_PITCH_RANGE_MIN"]		= "Bir taunt için en az kabul edilebilir ses perdeleme aralığı. 1'den 99'a kadar."
LANG["PHXM_TAUNT_PITCH_RANGE_MAX"]		= "Bir taunt için en fazla kabul edilebilir ses perdeleme aralığı. 100'den 255'e kadar."

LANG["PHXM_DECOY_SETTINGS"]				= "Yem Ayarları"
LANG["PHXM_DECOY_ENABLE"]				= "Yem Ödülünü Etkinleştir? Ödül raunt bitene kadar sadece bir kereliğe mahsus canlı nesnelere verilecektir. Birikmezler ve koyulduklarında eksilirler."

LANG["PHXM_DISABLE_FOOTSTEP"]           = "Nesne takımının adım seslerini sessize al"

LANG["PHXM_ADMIN_CHATSETTING"]			= "Sohbet Penceresi Ayarları"
LANG["PHXM_ADMIN_HUNTERBLIND"]			= "Avcı Yumma Kontrolü"

LANG["PHXM_ADMIN_GIVEGRENADE_NEAREND"]  = "Bombalar raunt sonuna yakın mı verilmeli? Eğer evetse, 'ph_give_grenade_roundend_before_time' komutunu kontrol ediniz."
LANG["PHXM_ADMIN_GIVEGRENADE_TIME"]     = "Raunt bitmeden önce bomba verme süresi (Saniye). Genel olarak 10 ile 30 saniye arasındadır."

--[[
	Plugins in sh_init.lua, Revision 10.06/2022/X2Z
]]--
LANG["PLUG_NAME_VER"]					= "Eklenti: %s | v.%s"
LANG["PLUG_DESCRIPTION"]				= "Açıklama: %s"

--[[
	Taunt Pitch, Revision 10.06/2022/X2Z
]]--
LANG["PHX_CTAUNT_USE_PITCH"]			= "Özel tauntlar için perde kullan"
LANG["PHX_CTAUNT_RANDOM_PITCH"]			= "Taunt çalarken ses perdeleme seviyesini rastgele seç"
LANG["PHX_RTAUNT_USE_PITCH"]			= "Rastgele tauntlar için ses perdelemesi kullan [%s]"
LANG["PHX_RTAUNT_RANDOMIZE"]			= "Rastgele tauntlarda ses perdeleme seviyesini rastgele seç [%s]"
LANG["PHX_CTAUNT_PITCH_FOR_FAKE"]		= "Sahte tauntlar için ses perdelemesi kullan"
LANG["PHX_CTAUNT_RANDPITCH_FOR_FAKE"]	= "Sahte tauntlar için rastgele ses perdelemesi kullan"
LANG["PHX_CTAUNT_SLIDER_PITCH"]			= "Taunt Ses Perdeleme."
LANG["TM_TOOLTIP_FAKETAUNT"]			= "Rastgele bir nesne üzerinde Taunt çal"
LANG["TM_PREFERRED_PITCH"]              = "Tercih Edilen Taunt Ses Perdeleme Seviyesi"

--[[
	Fake Taunt, Revision 10.06/2022/X2Z
	Description: Play fake taunts on random props in the map (Not Players)
]]--
LANG["PHX_CTAUNT_ON_RAND_PROPS"]		= "Rastgele nesneler üzerinde çal (%ix)"
LANG["PHX_CTAUNT_ON_RAND_PROPS_UNLI"]	= "Rastgele nesneler üzerinde çal"
LANG["PHX_CTAUNT_PLAYED_ON_RANDPROP"]	= "Rastgele bir nesne üzerinde taunt çaldın."
LANG["PHX_CTAUNT_RAND_PROPS_LIMIT"]		= "Sınıra ulaştın!"
LANG["PHX_CTAUNT_RAND_PROPS_NOT_PROP"]  = "Şu anda mevcut değil."
LANG["PHX_CTAUNT_RANDPROP_DISABLED"]	= "Sahte taunt şu anda devre dışı."

--[[
	PH:Z Simple Decoy, Revision 10.06/2022/X2Z
]]--
LANG.DECOY_PROP	= {
	"kuklayı öldürdü!",
	"kuklayı öldürdükten sonra pişman oldu.",
	"bir yem öldürdü.",
	"masum bir kukla öldürdü.",
	"bir kukla öldürdüğü için utandı."
}

LANG["DECOY_PUT_SUCC"]					= "Yem başarılı bir şekilde koyuldu."
LANG["DECOY_CANT_PUT_HERE"]				= "Buraya yem koyamazsın."
LANG["DECOY_GET_REWARD"]				= "Tebrikler! Bu raunt hayatta kaldığınız için ['Nesne Yemi'] kazandınız!"
LANG["DECOY_REMINDER_GET"]              = "Bir Yem/Kukla nesnen var! Avcıları şaşırtmak için bir yere koy!"
LANG["DECOY_FRAGS_RECEIVED"]			= "Yem başarıyla yemlendi: %s'dan 1 puan çaldınız!"
LANG["DECOY_DISABLED"]					= "Şu anda, yem mevcut değil."
LANG["PHXM_CL_DECOY_KEYBIND"]			= "Yem koymak için varsayılan tuş. Varsayılan 1 (Num Tuş Takımı 1 değil)."

LANG["DECOY_INDICATOR_INVALID"]         = "Geçersiz Eğim!"
LANG["DECOY_INDICATOR_TOOFAR"]          = "Çok uzak!"
LANG["DECOY_INDICATOR_OK"]              = "Yem koy [%s'e bas]"

LANG["PHXM_DECOY_HEALTH"]				= "Bir yemin ne kadar canı olmalı. Varsayılan 10."
LANG["PHXM_PLAYER_SHOW_DECOY_HELPER"]   = "Yem koyma yardımcısını göster? Bu ayar nişangahın üstünde beyaz bir noktayla metin gösterecektir."
LANG["PHXM_PLAYER_SHOW_DECOY_MARKER"]   = "Yem işaretini göster?"

--[[
	Revision 10.06/2022/X2Z
    Prop Menu Update: Menu, Editor, Browser
]]--
LANG["PCR_MODEL_DONT_EXISTS"]   = "Üzgünüz, bu model şu anda mevcut değil!"

LANG["PCR_PLUG_WARN_MSG"]		= "Uyarı: Özel Nesne Eklemesi (pcr_allow_custom) 0'a ayarlandı.\nÖzel nesnenizi düzenlemek için bu özelliği etkinleştirmelisiniz!\nA Bu ayarı değiştirmek için bir harita değişikliği gerekli."
LANG["PCR_PLUG_LBL_BINDKEY"]	= "Tuş atamasını değişmek için [Oyuncu] sekmesine geçin."
LANG["PCR_PLUG_LBL_EDITOR"]		= "Özel Nesne Düzenleyicisi"
LANG["PCR_PLUG_BTN_OPEN_EDT"]	= "Düzenleyiciyi Aç"
LANG["PCR_PLUG_LBL_COMSET"]		= "Genel Ayarlar"
LANG["PCR_PLUG_LBL_TECHSET"]	= "Teknik Ayarlar"
LANG["PCR_PLUG_LBL_EXPSET"]		= "Deneysel"
LANG["PCR_PLUG_LBL_PLAYERSET"]	= "Oyuncu Ayarları"

LANG["PCR_PLUG_ENABLE"]			= "Nesne Menüsünü etkinleştir."
LANG["PCR_PLUG_ALLOW_CUSTOM"]	= "(Haritayı Yeniden Başlatma Gerektirir) Özel nesnelerin nesne menüsü listesine eklenmesine izin ver?"
LANG["PCR_PLUG_PROP_BAN"]		= "(Haritayı Yeniden Başlatma Gerektirir) Nesne Menüsü listesine yasaklanmış nesneleri dahil etme?"
LANG["PCR_PLUG_USAGE_LIMIT"]	= "Oyuncunun kullanması için en fazla kullanım sınırı. -1 sınırsızdır."
LANG["PCR_PLUG_PROP_LIMIT"]		= "(Haritayı Yeniden Başlatma Gerektirir) Özel Nesne listesine nesne ekleme miktarını sınırlandır"
LANG["PCR_PLUG_PROP_LIMITMAX"]	= "Nesne Menüsü listesine eklenecek en fazla nesne sayısı. Not: Rastgele eklenecektir!"
LANG["PCR_PLUG_USE_ULXMENU"]	= "Nesne Menüsü Konsol (0) veya ULX (1) kullanılarak mı erişilsin? Daha önce atanmış tuş bu ayarla düzgün çalışacaktır"
LANG["PCR_PLUG_USE_DELAY"]		= "Nesne Menüsünde nesne seçme gecikmesi (Saniye)"
LANG["PCR_PLUG_KICK_INVALID"]	= "Herhangi bir kullanıcının Geçersiz Modele erişme girişimini sunucudan atarak durdurun (4x En fazla kabul edilebilir)"
LANG["PCR_PLUG_SPACE_CHECK"]	= "Oyuncunun başka bir nesneye sıkışmasını engellemeden önce alanı kontrol et"
LANG["PCR_PLUG_X_BBOX"]			= "(Haritayı Yeniden Başlatma Gerektirir) Nesne Menüsü listesine eklemeden önce Varlıkların Temas Sınır seviyesini kontrol et"
LANG["PCR_PLUG_X_BBOX_MAX"]		= "Varlıkların Temas Sınır Yükseklik seviyesi. En az olanlar otomatik hesaplanır."
LANG["PCR_PLUG_X_BBOX_MIN"]		= "Varlıkların Temas Sınır Genişlik seviyesi. En az olanlar otomatik hesaplanır."
LANG["PCR_PLUG_ONLY_GROUPS"]	= "Should Prop Menu can only be accessed by certain groups e.g. Donator?"
LANG["PCR_PLUG_NOTIFYMSG"]		= "Oyuncuyu Nesne Menüsünü nasıl kullanacağı hakkında bilgilendir"

LANG["PCR_EDITOR_MSG_ERROR"]	= "Değişiklikler bir hata nedeniyle kaydedilemedi.\nLütfen sunucu konsolonu kontrol et!"
LANG["PCR_EDITOR_MSG_SUCC"]		= "Değişikliklerin ve Özel Nesne bilgilerin başarıyla kaydedildi ve güncellendi." --Thanks galaxio! x)

LANG["PHZ_generic_title"]		= "Özel Nesne Kapsama Düzenleyecisi"
LANG["PHZ_generic_helptext"]	= [[[Nasıl Kullanılır:
[LEFT PANEL]
← Bir oyun içeriği seçin
← Sağa model eklemek için simgelere tıklayın
← Bağlam menüsünü açmak için sağ tıklayın

[RIGHT PANEL]
→ Herhangi bir nesneyi silmeden önce 'işaretlemek' için tıklayın
→ Modelleri kaldırmak için "Seçilenleri Kaldır"a basın
→ Değişiklik yapmak için 'Seçimi Uygula'ya basın

[INFO]
- Yalnızca 2048 girişe kadar model ekleyebilirsiniz.
- Tüm harita nesneleri otomatik olarak dahil edilecektir, yani buna gerek yok.
- [Kapat] düğmesine basmak işlemi iptal edecek.
- Tüm modellerin geçerli bir 'VPhysics' VFiziği olmayacaktır.
- Tüm oyuncuların (Sunucunuz dahil) özel modelleri olmayacak. Mevcut değillerse, seçimler uygulandıktan sonra kaldırılacaklar.
- Sunucu içeriğiniz sizinkinden farklı olabilir. Aşağıya doğru açılan menüde "<oyun> [İlişkilendirilmemiş]" görüyorsanız, oyunu yüklemediğiniz/ilişkilendirmediğiniz anlamına geliyor.
- Eklenti klasörüne göz atma özelliği henüz geliştirilmedi, bu nedenle bunun yerine 'Tüm İçerikler'i kullanmanız gerekecek.
]]
LANG["PHZ_generic_mdlinfo"] = [[Model Info:
%s
Has Physics: %s]]
LANG["PHZ_generic_mdlinfoStart"] = "(İlk önce model seç!)"

LANG["PHZ_generic_no_ragdoll"]	= "No: Ragdoll"
LANG["PHZ_generic_titlelabel"]	= "%s Önizle :"

LANG["PHZ_mount_game_sel"]		= "İlişkilendirilmiş oyun seç (Default: Garry's Mod)"
LANG["PHZ_input_placeholder1"]	= "Aranacak Klasör: <klasör adı> veya '*', tüm klasörler için boş."
LANG["PHZ_input_placeholder2"]  = "Aranacak Eklenti: <ad> veya '*', tüm klasörler için boş."
LANG["PHZ_msg_warn_close"]		= "Bu pencereyi kapatmak istediğinizden emin misiniz? Kaydedilmemiş düzenlemeler kaybolacak!"
LANG["PHZ_msg_commit"] 			= "Değişiklik yapmak istediğinizden emin misiniz??"
LANG["PHZ_msg_cant_empty"]		= "Nesne listesi boş olamaz!"
LANG["PHZ_msg_removesel"] 		= [[Remove selected props in the list. Hedefşer:
Kırmızı = İşaretli Seçimler
Sarı: Nesne sunucuda yok ve kaldırılmalı.]]
LANG["PHZ_msg_warn_mdlinlist"]  = "Uyarı: Bu model zaten listede!"
LANG["PHZ_msg_invalid_mdl"] 	= "Neden: Bu geçersiz bir model"
LANG["PHZ_apply_select"] 		= "Seçimleri Uygula ve Kaydet"
LANG["PHZ_menu_copy"] 		= "Modeli Kopyala"
LANG["PHZ_menu_refresh"] 	= "Modeli Yenile"
LANG["PHZ_tooltip_removesel"]	= "Seçileni Kaldır"
LANG["PHZ_tooltip_wasmarked"] = [[Bu nesne, sunucuda bulunmadığı için işaretlendi.
Bu düzenleyiciyi kapatırsanız, bu otomatik olarak kaldırılacaktır.]]

LANG["PHZ_pcr_fb_allcontent"] = "Tüm İçerikler (Tüm Oyuncular/Sunucu sizinle aynı içeriğe sahip olmayacaktır)"
LANG["PHZ_pcr_fb_notmounted"] = "%s [İlişkilendirilmemiş]"

-- Revision 25-27/08/2022
LANG["PHX_ADMIN_ACCESS_ONLY"]		= "Erişim engellendi: bunu sadece adminler yapabilir, %s !"
LANG["PHX_PROP_TOO_THIN"]           = "Dönüşülemez: Nesne çok ince!"
LANG["PHX_PROP_IS_BANNED"]			= "Kullanmaya çalıştığınız nesne sunucudan yasaklandı!"
LANG["PHX_SPECT_JOINGAME"]			= "Oyuna katılmak için, [F2]ye basın ve bir takım seçiniz."
LANG["PHX_TEAM_IS_FULL"]			= "O takım dolu!"
LANG["FORCE_JOIN_TEAM_IS_DISABLED"]	= "Takım eşitleme devre dışı (Takım Karması/Aktarması etkin)"

LANG["PHX_TM_MNBAR_OPTIONS"]		= "Ayarlar"
LANG["PHX_TM_MNBAR_SAVEFAV"]		= "Favorileri Kaydet"
LANG["PHX_TM_MNBAR_LOADFAV"]		= "Favorileri Yeniden Yükle"
LANG["PHX_TM_MNBAR_SETTINGS"]		= "Diğerleri"
LANG["PHX_TM_MNBAR_RESET"]			= "Favorileri Sıfırla"

LANG["PHX_TM_WARN_CLEARFAV"]		= "UYARI: Bu önceden kaydettiğiniz Favori Tauntları silecektir. Devam etmek istediğine emin misiniz?"

LANG["PHXM_BANNED_MODELS"]			= "Kısıtlanmış Modellerin kullanımına izin ver/me (Yasaklanmış Modeller). Buna Yasaklı Modeller dahil değildir (Bunlar her zaman silinir)."
LANG["PHXM_ADMIN_ALLOWARMOR"]       = "Nesne ve avcı takımında zırha izin ver"
LANG["PHXM_ADMIN_ALLOW3P"]          = "Avcılar ÜŞBA'ya erişebilir"
LANG["PHXM_ADMIN_ALLOW3P_SVDESIRED"]= "ÜŞBA'nın sunucunun istediği kamera pozisyonunu kullanmasına izin ver (Özel oyuncu pozisyonuna izin verme)"
LANG["PHXM_ADMIN_ALLOW3P_DIST"]     = "ÜŞBA: Kamera Mesafesi"
LANG["PHXM_ADMIN_ALLOW3P_RIGHT"]    = "ÜŞBA: Kamera Sağ Pozisyonu"
LANG["PHXM_ADMIN_ALLOW3P_UP"]     	= "ÜŞBA: Kamera Üst Pozisyonu"
LANG["PHXM_ADMIN_JUMPPOWER_H"]		= "Avcılar için ek Zıplama Gücü çarpanı"
LANG["PHXM_ADMIN_MDLCOLOR_PROP"]	= "Nesne Takımı için Oyuncu Rengini etkinleştir (Özel Avcı Modellerinin etkinleştirilmesini gerektir)"
LANG["PHXM_ADMIN_MDLCOLOR_HUNTER"]	= "Avcı Takımı için Oyuncu Rengini etkinleştir (Özel Avcı Modellerinin etkinleştirilmesini gerektir)"
LANG["PHXM_ADMIN_PITCH_ROTATION"]	= "[Deneysel] Nesneler için ses döndürme kullanımına izin ver. Bu hatalı olabilir."
LANG["PHXM_ADMIN_FALLDMG"]			= "Düşme hasarını etkinleştir (Tüm Takımlarda Geçerlidir)"
LANG["PHXM_ADMIN_FALLDMG_REAL"]		= "'Gerçekçi' Düşme hasarını etkinleştir"
LANG["PHXM_INFORM_TO_JOIN"]			= "Atanmamışları/İzleyicileri oyuna katılmaları için statik metin tavsiyesiyle bilgilendirin."
LANG["PHXM_ADMIN_PROPOFFSET"]		= "Nesne Görüş Denge Yüksekliğini çarpan kullanarak eksilt/arttır. En az: 0.6, En çok: 1.2. Varsayılan: 0.8."
LANG["PHXM_ADMIN_REPL_MUST_STAND"]	= "[Deneysel] Nesneleri sadece sabit dururken dönüşmelerine izin ver. Zıplarken veya eğilirken dönüşmeye izin vermek için bu ayarı devre dışı bırakınız."

LANG["PHXM_DROP_VBS_DISABLE"]       = "Ayrıntı Devre dışı"
LANG["PHXM_DROP_VBS_ENABLE"]        = "Ayrıntı Etkin"
LANG["PHXM_DROP_MDL_INCLUDEALL"]    = "Her Şeyi Dahil Et ( %d )"
LANG["PHXM_DROP_MDL_CUSTOMLIST"]    = "Özel Listeyi Ayır ( %d )"
LANG["PHXM_DROP_MDLTYPE_PROP"]      = "Sadece Fizik ( %d )"
LANG["PHXM_DROP_MDLTYPE_PROPDYN"]   = "Fizik & Dinamik Nesneler ( %d )"
LANG["PHXM_DROP_MDLTYPE_ANYENTS"]   = "Tüm Uyumlu Varlıklar ( %d )"
LANG["PHXM_DROP_MDLTYPE_CUSTOM"]    = "Özel Varlıklar ( %d )"
LANG["PHXM_DROP_RESPAWNBLIND_BOTH"] = "Her İki Takım"

LANG["PHXM_TAB_ADMINGROUPS"]        = "Grup ve Erişim Seçeneği"
LANG["PHXM_TAB_PHEPLUS"]			= "Gelişmiş+ Ayarları"

LANG["PHXM_ADMIN_ACCESS_GROUP"]     = "NA:X Yönetici Ayarlarına erişime izin vermek için grupları seçiniz, Gelişmiş Plus & Eklenti Ayarları sayfası."
LANG["PHXM_ADMIN_ACCESS_GROUP_HINT"] = "Bilginize, \"superadminler\"in yetkisi geri alınamaz."
LANG["PHXM_ADMIN_ACCESS_GROUP_NOULX"] = "Hata: ULib ve ULX sunucunuzda yüklü değil."
LANG["PHXM_ADMIN_ACCESS_NOREVOKE"]  = " (Geri alınamaz)"
LANG["PHXM_ADMIN_GROUP_WHOCANACC"]	= "Erişime izin vermek için grupları seçin [Admin Ayarları]."
LANG["PHXM_ADMIN_GROUP_MUTEABLE"]	= "Susturmaya izin verilmeyecek grupları seçin [Oyuncu Susturma]. (Kullanıcı her zaman susturulabilir)."

LANG["PHXM_ADMIN_ACCESS_CHATINFO"]  = "Nesne Avı Menü penceresi için bir konfigürasyon güncellemesi vardı. Yeniden açılıyor..."
LANG["PHXM_ADMIN_ACCMSG_BODY"]      = "Seçimi kaydedip değişikliklere devam etmek istiyor musunuz?\nDaha önce geri aldığınız gruplar erişim yetkisini kaybedecektir.\nEğer hala açıksa Nesne Avı Menüsünü yeniden başlatacaktır."
LANG["PHXM_ADMIN_ACCMSG_TITLE"]     = "Grup Erişimini Uygula"
LANG["PHXM_ADMIN_ACCCFG_SUCC"]      = "Grup Erişimi verileri başarıyla kaydedildi."
LANG["PHXM_ADMIN_ACCCFG_FAIL"]      = "Grup Erişimi verileri kaydedilirken bir hata oluştu. Sunucu konsolunuzu kontrol edin!"
LANG["PHXM_ADMIN_MUTCFG_SUCC"]      = "Susturulabilir Grup Erişimi verileri başarıyla kaydedildi."
LANG["PHXM_ADMIN_MUTCFG_FAIL"]      = "Grup Erişimi verileri kaydedilirken bir hata oluştu. Sunucu konsolunuzu kontrol edin!"

LANG["PHXM_ADMIN_ACCESS_APPLY"]     = "Seçilen Grupları Uygula"

-- PHE/Plus
LANG["PHXM_ADMIN_PLUSSETTING"]		= "Artı+ Ayarlar"
LANG["PHXM_PLUSSETTING_HINT"]		= "Takım Dengesini veya diğer ek ayarları yapılandırın."
LANG["PHXM_HEADER_UNSTUCK"]			= "Sıkışma Ayarları"
LANG["PHXM_HEADER_TEAMSETTING"]		= "Daha Fazla Takım Ayarları ve Seçenekleri"

LANG["LIST_PLAYER"]					= "Oyuncular"
LANG["LIST_FORCEDASPROP"]			= "Nesneye Zorlandı?"
LANG["LIST_MARKEDASPROP"]			= "Nesneye zorlanmış olarak işaretle"
LANG["LIST_NOHUNTERS"]				= "Şu anda oynayan Avcı bulunmamaktadır."

LANG["PHXM_PLUS_MSG_NO_HUNTERS"]	= "Sıfırlamak için Avcı yok."

LANG["PHXM_PLUS_BTNRESET"]			= "Seçimleri Temizle (ve tüm zorlanmışları sıfırla)"
LANG["PHXM_PLUS_LISTTIPS"]			= "İpuçları: Bir oyuncuyu Nesne Takımında olmasını zorlamak için çift tıklayın."

LANG["PHXM_ADMIN_ENABLEUNSTUCK"]		= "Eklentinin sıkışmaktan kurtulma özelliğini etkinleştirin veya devre dışı bırakın. Eğer özel bir eklenti kullanıyorsanız, bu ayarı devre dışı bırakın."
LANG["PHXM_ADMIN_NOTPUNSTUCKINROUND"]	= "Saklanma aşamasındayken doğma noktalarının dışında son çare olarak sıkışmaktan kurtulmak için ışınlanmayı devre dışı bırak" --ph_disabletpunstuckinround
LANG["PHXM_ADMIN_UNSTUCK_WAITTIME"]		= "Her bir sıkışmaktan kurtulma denemesi arasında kaç saniye geçmeli" --ph_unstuck_waittime
LANG["PHXM_ADMIN_TEAMBAL_ORIG"] 		= "NA:X'ın kendi takım dengeleme özelliğini kullan (takım ilgili aşağıdaki tüm ayarları devre dışı bırakır)" --ph_originalteambalance
LANG["PHXM_ADMIN_TEAMBAL_UNCHECK"] 		= "Gelişmiş takım dengesi ayarlarına erişmek için önceki onay kutusunun işaretini kaldırın." --ph_originalteambalance_uncheck [KULLANILMAMIŞ]
LANG["PHXM_ADMIN_FORCESPECTOPLAY"]		= "Takımları dengelerken izleyicileri oynaması için zorla" --ph_forcespectatorstoplay
LANG["PHXM_ADMIN_NO_H_CONSECUTIVE"]		= "Oyuncuların arka arkaya iki kez Avcı olmasını engelle (Sadece karma modunda çalışır)" --ph_preventconsecutivehunting
LANG["PHXM_ADMIN_HUNTER_COUNT"] 		= "Avcı sayısı (0 = otomatik)" --ph_huntercount
LANG["PHXM_ADMIN_ROTATETEAM"] 			= "Karma modu devre dışı bırak ve oyuncuları aktarmayı kullan" --ph_rotateteams
LANG["PHXM_ADMIN_RESET_ROTTEAM"] 		= "Aktarmaları sıfırla" --ResetRotateTeams
LANG["PHXM_ADMIN_RESET_ROTTEAM_WARN"]	= "Başlangıçta değişmeyi yeniden başlat (eğer onları başlatmışsan, veya durdurmuşsan, ve yeniden başlatmışsanız ve şu anki değişim sizi memnun etmiyorsa):" --ResetRotateTeams_warning
LANG["PHXM_ADMIN_RESET_MSG"]			= "Takım Aktarması sıfırlandı!"
LANG["PHXM_ADMIN_FORCEH2P_WARN"]		= "Bir Avcıyı bir dahaki sefere Nesne olması için zorla (sadece karma modunda çalışır):" --ForceHunterAsProp_warning
LANG["PHXM_ADMIN_FORCEH2P_RANDONLY"]	= "Bu eylem sadece karma modunda geçerli." --ForceHunterAsProp_randomonly
LANG["PHXM_ADMIN_FORCEH2P_NOHUNT"]		= "[AVCI YOK]" --ForceHunterAsProp_nohunters [UNUSED]
LANG["PHXM_ADMIN_FORCEH2P_NOHUNTMSG"] 	= "Avcı yok Allah kahretsin, düğmede yazılı!" --ForceHunterAsProp_nohuntersmsg [UNUSED]

LANG["FORCEH2P_WILL_BE"]				= "%s sonraki raunt Nesne."
LANG["FORCEH2P_IS_CANCELED"]			= "%s sonraki raunt Nesne olmayacak."
LANG["FORCEH2P_IS_RESET"]				= "Sonraki rauntta tüm Avcılar Nesne olarak zorlanmayacak."
LANG["FORCEH2P_PLAYER_NOT_FOUND"]		= "Seçilen oyuncu bulunamadı, muhtemelen ayrıldı."
LANG["PHX_ROTATE_TEAM_RESET"]			= "Takım Aktarma Dengesi sıfırlandı."
LANG["FORCEH2P_ALREADY"]				= "%s zaten bir sonraki raunt için Nesne olarak belirlenmiş." -- [UNUSED]

LANG["UNSTUCK_YOURE_UNSTUCK"]			= "Artık kurtulmuş olmalısın!"
LANG["UNSTUCK_BAD_SPAWNPOINT"]			= "Hata: En yakın doğma noktası seni yeniden sıkıştırabilir. Eğer sıkışırsan, yeniden kurtulmayı deneyin."
LANG["UNSTUCK_RESCUE_SPAWNPOINT"]		= "Bu doğma noktası aşırı yakın, hala sıkışmış olabilirsin. Sıkışmışsanız yeniden deneyin."
LANG["UNSTUCK_NO_SPAWNPOINTS"]			= "Bilinmeyen nedenlerden ötürü, doğma noktası bulunamadı. Önlem olarak, (0, 0, 0)a ışınlanacaksanız. Sıkışmanıza çok yüksek bir şans var, eğer sıkışırsanız tekrar deneyin."
LANG["UNSTUCK_PLEASE_WAIT"]				= "Lütfen her bir sıkışmaktan kurtulma denemesinde %d saniye bekleyin."
LANG["UNSTUCK_NOT_ON_GROUND"] 			= "Zeminde değil, kontrol ediliyor..."
LANG["UNSTUCK_NOT_STUCK_JITTER"]		= "Sıkışmamışsın. Eğer gerçekten sıkıştıysanız, Nesneniniz hareket etmeyi veya titremeyi bırakana kadar bekleyin (ALT'a basmayı deneyin) ve yeniden deneyin."
LANG["UNSTUCK_NOT_STUCK_TOOBAD"]		= "Sıkışmamışsın. Eğer gerçekten sıkıştıysanız, üzgünüm, raunt sonuna kadar beklemek zorundasın."
LANG["UNSTUCK_CANNOT_FIND_SPOT"]		= "Sizin hareket edebileceğiniz bir yer bulunamadı, en yakın doğma noktasına ışınlanılıyor."
LANG["UNSTUCK_SPAWNPOINTS_DISABLED"]	= "Doğma noktasına ışınlanacaktın, ama bu sunucu yumma süresinin dışında izin vermiyor. Üzgünüz!"
-- End of PHE/Plus

LANG["MISC_SEL_APPLY"]  = "Seçimleri Uygula"
LANG["MISC_RESET_SEL"]  = "Seçimleri Sıfırla"
LANG["MISC_RESET"]      = "Sıfırla"
LANG["MISC_CANCEL"]     = "İptal"
LANG["MISC_SEL_ALL"]    = "Hepsini Seç"
LANG["MISC_SEL_NONE"]   = "Hiçbirini Seçme"

LANG["PHXM_CL_THIRDPERSON"]     = "ÜŞBA modu tuşu (Üçüncü Şahıs Bakış Açısı)"
LANG["PHXM_CL_UNSTUCK"]			= "Sıkışmaktan kurtulma tuşu"
LANG["CL_THIRDPERSON_ENABLED"]  = "ÜŞBA Etkin"
LANG["CL_THIRDPERSON_DISABLED"] = "ÜŞBA Devre dışı"

LANG["PHX_TP_ADJUSTVIEW_BTN"]	= "ÜŞBA görünümünü ayarla" --Button, as well as window title.
LANG["PHX_TPS_ADJ_TITLE"]		= "ÜŞBA Uyarısı"
LANG["PHX_TPS_ADJ_SVDESIRED"]	= "ÜŞBA özelleştirmesi devre dışı: Sunucunun istediği pozisyon kullanılıyor."
LANG["PHX_TPS_ADJ_3PDIS"]		= "ÜŞBA Devre Dışı."
LANG["PHX_TPS_ADJ_BLIND"]		= "Kör oldunuz. Yeniden deneyin."
LANG["PHX_TPS_ADJ_NEEDALIVE"]	= "Bunu yapmak için Avcı Takımında canlı olmanız gerekiyor."

LANG["ANG_AXIS_DIST"]	= "İleri" -- or Forward
LANG["ANG_AXIS_RIGHT"]	= "Sağ"
LANG["ANG_AXIS_UP"]		= "Yukarı"
LANG["VEC_POS_LEFT"]	= "Sol" --X
LANG["VEC_POS_FRONT"]	= "Ön" --Y?
LANG["VEC_POS_TOP"]		= "Üst"  --Z

-- Key Hints
LANG["KEYHINT_HUNTER3P"] 	= "Avcı ÜŞBA"
LANG["KEYHINT_SHOOT"]		= "Ateş Et"
LANG["KEYHINT_SEC"]			= "İkincil Ateş"
LANG["KEYHINT_PICKUP"]		= "Nesneyle Etkileşim"

LANG["KEYHINT_LMB"]			= "Nesneye Dönüş"
LANG["KEYHINT_RMB"]			= "Nesne Taunt/Özel Yetenek"
LANG["KEYHINT_RANDTAUNT"] 	= "Rastgele Taunt"
LANG["KEYHINT_TAUNTMENU"] 	= "Taunt Menüsü"
LANG["KEYHINT_ROTATION"] 	= "Dönme Kilidi"
LANG["KEYHINT_PROPMENU"] 	= "Nesne Menüsü"
LANG["KEYHINT_FREEZEAIR"] 	= "Nesne Donması"
LANG["KEYHINT_SPAWNDECOY"] 	= "Yem At"
LANG["KEYHINT_UNSTUCK"]		= "Sıkışmaktan Kurtulma Tuşu"

LANG["KEY_LMB"]				= "LMB" -- Sol Fare Tuşu, Kısaltılmış
LANG["KEY_RMB"]				= "RMB" -- Sağ Fare Tuşu, Kısaltılmış

LANG["MISC_TEAM_NAME"]		= "%s TAKIMI" -- NESNELER, AVCILAR, ama bir cümlede.
LANG["NOTIFY_HEADER_TITLE"]	= "Oyun Ayarları"

-- Revision 14/09/2022
LANG["PHXM_MV_CHANGEMAP_NOPLAYER"]	= "Sunucuda oyuncu kalmayınca haritayı değiştir?"

PHX.LANGUAGES[LANG.code] = LANG
