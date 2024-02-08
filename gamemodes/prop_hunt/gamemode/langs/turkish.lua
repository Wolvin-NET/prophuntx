-- Kindly free to improve the language.

-- Originally written by: Fafy
-- Improved by Wolvindra-Vinzuerio & Godfather

local L={}

L.code = "tr"

L.Name 		 	= "Türkçe" -- example: "Bahasa Indonesia"
L.NameEnglish	= "Turkish" -- Your Language but spoken in English, example: "Indonesian"
L.Author			= "Talha Berkay Akbulut aka Matt" -- Only accept STRINGS.
-- Can Accept: String, and Table.
L.AuthorURL		= {	
	"https://steamcommunity.com/profiles/76561198443702005"
}
-- Special Section that isn't String-based
L.SUICIDEMSG = {  -- Fix me: there was addition text here but feel free to add more.
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
	"öldü. Ltfn F'ye basın.",
	"Masum nesneleri öldürdükten sonra pişmanlık duyuyor.",
	"Arka odalara geçti.",
	"soyunu kurutmayı deniyor.",
	"çok fena öldü.",
	"bütün nesneleri öldürecekken panikledi.",
	"dur artık, yardıma ihtiyacın var.",
	"paçavra oldu.",
}
L.RANDOM_SPECTATORS = {
	"oturup izlemek için.",
	"takılmalarını izlemek için.",
	"ne olup bittiğini izlemek için.",
	" ",
}

L["PHX_TEAM_CONNECTING"] = "Bağlanıyor"
L["PHX_TEAM_PROPS"]		= "Nesneler"
L["PHX_TEAM_HUNTERS"] 	= "Avcılar"
L["PHX_TEAM_UNASSIGNED"]	= "Atanmamış"
L["PHX_TEAM_SPECTATOR"] 	= "İzleyici"

-- List of string-based translation

-- // FRETTA SECTION \\
--  FRETTA: Kill text (X killed Y)
L["HUD_KILLED"]				= "öldürdü"

-- FRETTA: HUDs
L["HUD_TIME"] 				= "SÜRE"
L["HUD_ROUND"]				= "RAUNT"
L["HUD_WAITPLY"]				= "Oyuncular bekleniyor..."
L["HUD_DEAD"]				= "(ÖLÜ) "

L["HUD_TEAMWIN"]				= "%s kazandı!"
L["HUD_LOSE"]				= "Berabere, herkes kaybetti!"
L["MISC_TIMELEFT"]			= "Kalan Süre: %s"
L["MISC_GAMEEND"] 			= "Oyun bu raunttan sonra bitecektir."

-- FRETTA: Team selection screen (F2)
L["DERMA_TEAMSELECT"]		= "Takım Seç"

-- FRETTA: F1 screeen
L["DERMA_RTV"] 				= "Harita Değişmek İçin Oyla"
L["DERMA_PHMENU"] 			= "Nesne Avı Menüsü"
L["DERMA_CHANGETEAM"]		= "Takım Değiş"

-- FRETTA: Scoreboard
L["DERMA_PLAYER"]			= "(%d oyuncu)"	
L["DERMA_PLAYERS"]			= "(%d oyuncular)"
L["DERMA_NAME"]				= "Ad"
L["DERMA_KILLS"]				= "Leş"
L["DERMA_DEATHS"]			= "Ölüm"
L["DERMA_PING"]				= "Gecikme"
L["DERMA_SERVER_TAG"]		= "SV"
L["DERMA_BOT_TAG"]			= "BOT"
L["DERMA_GAMEMODE_CREDITS"]	= "%s | Sürüm: %s - Rev. %s"

L["CHAT_JOINED"]				= " katıldı "
L["CHAT_JOINEDTHE"]			= " katıldı "

L["CHAT_SWAPBALANCE"]		= "Takım dengesi için %s , %s'lara aktarıldı."
L["CHAT_SWAPBALANCEYOU"]		= "Mükemmel dengeyi sağlamak için aktarıldın." -- Smile... for even in death, you have become children of Thanos

-- FRETTA: Splash Starting Screen
L["SPASHSCREEN_BY_X"]		= "%s tarafından"
-- RichTextBox
L["HELP_DONATORS_AND_CONTRIBUTORS"]  = "\n\nBağışçılar & Katkıda Bulunanlar:\n- %s"
-- // END OF FRETTA SECTION \\

L["HELP_F1"] 				= [[Bir Nesne Avı X Projesi.

Nesne Avını daha modern ve özelleştirilebilir hale getiren bir proje.

Daha fazla bilgi şu adreste bulunabilir:
https://www.buymeacoffee.com/wolvindra

Daha fazla bilgi, yardım ve kılavuz görmek için [F1] tuşuna basın ve ardından [Nesne Avı Menüsü] düğmesine tıklayın.

Version: ]].. PHX.VERSION ..[[ Revision: ]].. PHX.REVISION ..[[

İyi Eğlenceler!]]

L["LANGUAGE_CHANGED"]		= "Tercih edilen dil %s'yle değiştirildi."

-- internal cl_menutypes section.
L["SUBTYPE_PREFERED_LANG"]	= "Tercih Edilen Dil"

-- Events
L["EV_PLAYER_CONNECT"]		= "%s sunucuya bağlandı."
L["EV_PLAYER_JOINED"]		= "%s sunucuya katıldı."
L["EV_PLAYER_DISCONNECT"]	= "%s sunucudan ayrıldı. (Neden: %s)"

-- HUD elements
L["HUD_HP"]					= "CAN"
L["HUD_AMMO"] 				= "CEPHANE"
L["HUD_MAGSEC"]				= "MAG. / SEC." --Magazine | Secondary Magazine

-- !!WEAPON NAMES CANNOT BE TRANSLATED, THEY USE FROM language.GetPhrase THEREFORE IT'S IMPOSSIBLE TO DO.

L["TEAM_PROPS"]				= L["PHX_TEAM_PROPS"] 
L["TEAM_HUNTERS"]			= L["PHX_TEAM_HUNTERS"]

L["HUD_ROTLOCK"]				= "Nesne Döndürme: Kitli"
L["HUD_ROTFREE"]				= "Nesne Döndürme: Serbest"
L["HUD_KILLEDBY"]			= "%s tarafından öldürüldün"

L["HUD_AUTOTAUNT"]			= "Otomatik Alaya %d saniye"
L["HUD_AUTOTAUNT_ALT"]		= "Otomatik Alaya %d"

L["HUD_TargetID"]			= "Oyuncu: %s (%d%%)"

L["HUD_BLINDED"]				= "%s gözleri açılacak ve %s içinde serbest kalacaklar"
L["HUD_UNBLINDED"]			= "Önüm arkam sağım solum sobe saklanmayan ebe!"

L["BLIND_RESPAWN_TEAM"]		= "Sadece %s takımındayken %d saniyede yumarken doğmuştun."
L["BLIND_RESPAWN"]			= "Yumarken %d saniyede doğmuştun."

L["MISC_ACCEPT"]				= "Kabul"
L["MISC_OK"]					= "Tamam"
L["MISC_CLOSE"]				= "Kapat"
L["MISC_PREV"]				= "< ÖNCEKİ"
L["MISC_NEXT"]				= "SONRAKİ >"
L["MISC_ACCESSDENIED"]		= "Erişim Engellendi"

-- Chat messages
L["CHAT_NOPLAYERS"]			= "Oyunu başlatmak için yeterli oyuncu yok!"
L["CHAT_SWAP"]				= "Takımlar değiştirildi!"

L["CHAT_SWAPTEAM_WARNING"]   = "%dx (%dx MAKS) Takım değiştin. O süreden sonra takım değişemezsin."
L["CHAT_SWAPTEAM_REVERT"]	= "%s takımına geçemezsin çünkü takım değişme sayısını aştın."

L["CHAT_PROP_NO_ROOM"] 		= "Nesneye değişmek için yeterli alan yok!"

-- Notification
L["NOTIFY_IN_PROP_TEAM"]		= "Dönme özelliğinle Nesne Takımındasın! Fareyi hareket ettirerek nesneni döndürebilirsin."
L["NOTIFY_ROTATE_NOTICE"]	= "[R] tuşuna basarak dönmeyi kitleyebilirsiniz!"

-- Custom Taunt Window
L["TM_WARNING_CT_DISABLE"]	= "[NAX - Alaylar] Uyarı: Bu sunucu özel alayları devre dışı bırakmıştır."
L["TM_NO_TAUNTS"]			= "Uyarı: Bu kategoride alaylar bulunamadı."
L["TM_PLAY_ONLY_ALIVE"] 		= "Özel alayları sadece canlıyken çalabilirsin."

L["TM_WINDOW_TITLE"]			= "Nesne Avı Özel Alay Penceresi"
L["TM_NOTICE_PLSWAIT"]		= "Lütfen rastgele alay bitene kadar %s saniye bekleyiniz!"
L["TM_NOTICE_PLAYPREVIEW"]	= "Alay Önizleniyor: %s"

L["TM_TOOLTIP_PLAYTAUNT"] 	= "Alay Et"
L["TM_TOOLTIP_PREVIEW"]		= "Alay Önizle"
L["TM_TOOLTIP_PLAYCLOSE"]	= "Alay Et ve Kapat"
L["TM_TOOLTIP_PLAYRANDOM"]	= "Rastgele Alay Et"
L["TM_TOOLTIP_CLOSE"]		= "Kapat"
L["TM_MENU_CLOSE"]			= "Menüyü Kapat"

L["TM_DELAYTAUNT_NOT_EXIST"] = "Seçtiğin alay sunucuda bulunamadı!"
L["TM_DELAYTAUNT_PLSWAIT"]	= "%s saniye bekleyiniz!"

--[[
	PHX Menu window
]]
L["PHXM_WINDOW_TITLE"]		= "Nesne Avı X - Gelişmiş Ayarlar ve Menü"
L["SERVER_INFO_MOTD"]		= "SUNUCU BİLGİSİ ve KURALLARI [GM]"

L["PHXM_TAB_HELP"]			= "Yardım & Rehber"
L["PHXM_TAB_MUTE"]			= "Oyuncu Susturma"
L["PHXM_TAB_PLAYER"]			= "Oyuncu Ayarları"
L["PHXM_TAB_MODEL"] 			= "Model Tarayıcısı"
L["PHXM_TAB_MODEL_DISABLED"]	= "Model Tarayıcısı (Devre Dışı)"
L["PHXM_TAB_ADMIN"]			= "Admin Ayarları"
L["PHXM_TAB_ABOUT"]			= "NA:X Hakkında"
L["PHXM_TAB_MAPVOTE"]		= "Harita Oyla"
L["PHXM_TAB_PLUGINS"]		= "Eklentiler"

L["PHXM_CVAR_CHANGED"]		= "[Ayarlar] %q CVarı %q'a değiştirildi."

--[[
	Player Mute Settings
]]
L["PHXM_MUTE_SELECT"]		= "Susturmak istediğiniz oyuncuyu seçin."

--[[ 
	Player Settings
]]
L["PHXM_PLAYER_OPTIONS"]		= "Oyuncu Ayarları"
L["PHXM_PLAYER_LANG"]		= "Diller"
L["PHXM_PLAYER_BIND"]		= "Tuş Atamaları"
L["PHXM_PLAYER_HUDSETTINGS"]	= "Arayüz Ayarları"

L["PHXM_PLAYER_TAUNT_KEY"]			= "Rastgele Alay Tuşu"
L["PHXM_PLAYER_TAUNTWINDOW_KEY"]		= "Alay Menü Tuşu"
L["PHXM_PLAYER_ROTATLOCK_KEY"]		= "Dönme Kilidi Tuşu"

L["PHXM_PLAYER_TOGGLE_HALOS"]		= "Nesne seçerken parlama efektini etkinleştir"
L["PHXM_PLAYER_IDNAMES"]				= "Takım oyuncularının adlarını başlarının üstünde göster (ayrıca duvar arkası gözükür)"
L["PHXM_PLAYER_ENDROUND_CUE"]		= "Raunt sonu işareti sesini çal"
L["PHXM_PLAYER_TAUNTMENU_AUTOCLOSE"]	= "Çift tıklandığında alay penceresini otomatik kapatma seçeneği"
L["PHXM_PLAYER_SEE_HUNTER_LINE"]		= "İzleyici modunda avcıların nereye nişan aldığını görmek için ışın çizer."
L["PHXM_PLAYER_SEE_LBALL_ICONS"]		= "'Şanslı top' düştüğünde simgesini görünür yap."
L["PHXM_PLAYER_SEE_CRYSTAL_ICONS"]	= " 'Şeytan top' düştüğünde simgesini görünür yap."

L["PHXM_PLAYER_USE_NEW_HUD"]			= "Yeni (Gelişmiş) Arayüzü Kullan"
L["PHXM_PLAYER_SHOW_TUTOR"]			= "Öğretici Pencereyi Göster (2 kere nesne takımında doğunca gösterir)"
L["PHXM_PLAYER_USE_NEW_CROSSHAIR"]	= "Özel Nişangahı Etkinleştir"
L["PHXM_PLAYER_SHOW_TEAM_TOPBAR"]	= "Toplam hayatta olan takım oyuncularını sol üst köşede gösterir (En az 4 oyuncu gösterilir)"

--[[
	Player model Browser Section
]]
L["QUERY_MODEL_SELECTED"]	= " %s modeli seçildi ve yeniden doğduktan sonra geçerli olacak!"
L["QUERY_MODEL_INFO"]		= "Model adı: %s - Uygunluk: Herkese"

L["MDL_MENU_REFRESH"] 		= "Simgeyi Yenile"
L["MDL_MENU_PREVIEW"] 		= "Modeli Önizle"
L["MDL_MENU_MODELINFO"] 		= "Model Bilgisi"


L["MISC_APPLYMDL"] 			= "Modeli Uygula"

L["PHXM_MODEL_DISABLED"] 	= "Üzgünüz, Özel Oyuncu Modelleri bu sunucuda devre dışı!"
L["PHXM_PLAYERMODEL_SETFOV"]	= "Model Görüş Açısını Ayarla"

--[[
	Server Settings
]]
L["PHXM_ADMIN_OPTIONS"]		= "Sunucunun oyun ayarları (Sadece Adminlere ve Kurucuya Görünür)"
L["PHXM_ADMIN_MUSTALIVE"]	= "Bu işlemi gerçekleştirebilmek için canlı olmanız gerekiyor."

--[[
	Language Override
]]
L["PHXM_ADMIN_LANGOVERRIDE"]	= "Zorunlu Dil"

L["PHXM_ADMIN_FORCELANG"] 				= "Zorunlu dili kullan? Bu kullanıcının dilini sunucunun seçtiği ile değiştirecektir."
L["PHXM_ADMIN_LANGTOUSE"]				= "Zorunlu Dil kullanılacak."
L["PHXM_ADMIN_PLAYERDEFAULTLANG"] 		= "İlk girişte varsayılan oyuncu dili."

-- Gameplay settings
L["PHXM_ADMIN_CUSTOM_MODEL"]				= "Avcılar özel modellere erişebilir. Bu [Model Tarayıcı] menüsünü etkinleştirir."
L["PHXM_ADMIN_CUSTOM_MODEL_PROP"]		= "Nesneler özel modellere erişebilir (Avcıların özel modellere erişimi olmasını gerektirir.)"
L["PHXM_ADMIN_TAUNT_DELAY_CUSTOM"]		= "Özel Alay Gecikmesi (Saniye)"
L["PHXM_ADMIN_TAUNT_DELAY_RANDOM"]		= "Normal Alay Gecikmesi (Saniye)"
L["PHXM_ADMIN_TAUNT_DELAY_AUTO"]			= "Otomatik Alay Gecikmesi (Saniye)"
L["PHXM_ADMIN_AUTOTAUNT_ENABLE"]			= "Otomatik Alay Özelliklerini Etkinleştir. (Süre bir sonraki raunt düzelecektir)"

L["PHXM_ADMIN_NOTICE_ROTATION"]			= "Her doğulduğunda 'Nesne Dönme' bildirimini göster."
L["PHXM_ADMIN_CAMERA_COLLIDE"]			= "Nesne kamerasının duvarlara değmesini etkinleştir."
L["PHXM_ADMIN_FREEZECAM"]				= "Nesne takımı için Sabit Kamera özelliğini etkinleştir."
L["PHXM_ADMIN_FREEZECAM_HUNTER"]			= "Avcı takımı için Sabit Kamera özelliğini etkinleştir."
L["PHXM_ADMIN_PROP_COLLIDE"]				= "Nesne takımındaki oyuncuların birbirine değebilmesini etkinleştir."
L["PHXM_ADMIN_SWAP_TEAM"] 				= "Her raunt takım değiştir - Bu ayar devre dışı bırakılırsa takımlar olduğu gibi kalacaktır."
L["PHXM_ADMIN_HUNTER_PENALTY"]			= "Avcı can cezası"
L["PHXM_ADMIN_HUNTER_KILL_BONUS"]		= "Avcı leş bonusu "
L["PHXM_ADMIN_HUNTER_SMG_GRENADES"]		= "Avcı SMG bombaları"
L["PHXM_ADMIN_GAME_TIME"]				= "(Haritayı Yeniden Başlatma Gerektirir) Toplam oyun süresi (Dakika)"
L["PHXM_ADMIN_BLINDLOCK_TIME"]			= "Avcı yumma zamanı (Saniye)"
L["PHXM_ADMIN_ROUND_TIME"]				= "(Haritayı Yeniden Başlatma Gerektirir) Oyun raunt süresi (Saniye)"
L["PHXM_ADMIN_ROUNDS_PER_MAP"]			= "(Haritayı Yeniden Başlatma Gerektirir) Harita başı toplam oyun raundu"
L["PHXM_ADMIN_ENABLE_LUCKYBALL"]			= "Şanslı Topların kırılabilir nesnelerde çıkmasına izin ver (Çıkma şansı %8)"
L["PHXM_ADMIN_ENABLE_CRYSTAL"]			= "Şeytan Toplarının avcı öldüğünde çıkmasına izin ver (Her zaman çıkar)"
L["PHXM_ADMIN_WAIT_PLAYERS"]				= "Oyuna başlamak için oyuncuları bekle"
L["PHXM_ADMIN_WAIT_MIN_PLAYERS"]			= "Oyunun başlaması için gereken en az oyuncu sayısı (varsayılan: 1)"
L["PHXM_ENABLE_PLAYER_JOIN_LEAVE"] 		= "Oyuncu ayrılıp katıldığında sohbet bildirimini etkinleştir. (Kendi özel sohbet eklentinizi kullanmak istiyorsanız bu değeri '0' yapın."

L["PHXM_ADMIN_FORCEJOINBALANCE"]			= "Oyuncular katıldıklarında takımları eşitlemesini sağla. (Takım Değişmesi açıksa bu ayarı devre dışı bırakın)"
L["PHXM_ADMIN_ENABLETEAMBALANCE"]		= "Takım Dengesini Etkinleştir: Raunt başında otomatik olarak takımları eşitle."
L["PHXM_ADMIN_PICKUP_PROPS"] 			= "Küçük nesnelerle etkileşime izin ver? 0: İzin Verme, 1: Sadece Avcılar, 2: Sadece Nesneler, 3: Herkese izin ver."

L["PHXM_ADMIN_TAUNTMODES"]			= "Alay Modları"
L["PHXM_ADMIN_TAUNTMODE_MODE"]		= "--[Mevcut Alay Modu: %d ]--"
L["PHXM_ADMIN_TAUNTMODE0"]			= "Mod [0]: F3/Rastgele Alay"
L["PHXM_ADMIN_TAUNTMODE1"]			= "Mod [1]: C/Özel Alay"
L["PHXM_ADMIN_TAUNTMODE2"]			= "Mod [2]: Her İkiside"
L["PHXM_ADMIN_TAUNTSOPEN"]			= "Alay Penceresini Aç"

L["PHXM_MODE_DEFAULT"] 				= "--[ Etkileşim modu %d'ya ayarlandı ]--"
L["PHXM_MODE0"]						= "Mode [0]: İzin Verme"
L["PHXM_MODE1"]						= "Mode [1]: Sadece Avcılar"
L["PHXM_MODE2"]						= "Mode [2]: Sadece Nesneler"
L["PHXM_MODE3"]						= "Mode [3]: Herkese izin ver"

--[[
	Admin Developer Sections
]]
L["PHXM_ADMIN_DEVSECTION"]		= "Geliştirici Ayarları"
L["PHXM_ADMIN_ROOMCHECK"]		= "Nesne çarpışmasını etkinleştir? Bu ayar duvara veya nesnelere sıkışmanızı engeller."
L["PHXM_ADMIN_USENEWMKBREN"]		= "Bren MK II bonus silahı için yeni modeli kullan (Haritayı Yeniden Başlatma Gerektirir)"
L["PHXM_ADMIN_BEVERBOSE"]		= "Geliştirici: Ayrıntılı Ol - NA:X'in bütün olayları ve bilgileri açıkça bildirmesini etkinleştir."
L["PHXM_ADMIN_SHOWPLNAMEHEAD"]	= "Oyuncu takım adlarının ekranda belirmesini etkinleştir."
L["PHXM_ADMIN_USESINGLE_FZCAM"]	= "Ses listesi kullanmak yerine tek bir Sabit Kamera sesi kullan. (Sabit Kamera sesini belirlemek için 'ph_fc_cue_path' yolunu kullan)"
L["PHXM_ADMIN_MODELLISTINGTYPE"] = "Oyuncu Modeli Listeleme Metodu: 0: Her Şeyi Dahil Et, 1: list.Get('PlayerOptionsModel')'i kullan"
L["PHXM_ADMIN_JUMPPOWER"]		= "Nesneler için ek zıplama gücü katsayısı"
L["PHXM_ADMIN_ENABLE_OBB"]		= "Geliştirici: Özelleştirilmiş Nesne Varlık Modelinin Sınırları değiştiricisini konfig verisinden etkinleştir (OBB)"
L["PHXM_ADMIN_RELOAD_OBB"]		= "Geliştirici: Her raunt yeniden başlatıldığında OBB değiştiricisini yeniden yükle"

--[[
	Experimental & PH:X Features
]]
L["PHXM_ADMIN_EXPERIMENTALPHX"]			= "Nesne Avı: X Deneysel Şeyler"

L["PHXM_ADMIN_HLA_COMBINE"]				= "HL: Alyx Combine model desteği ekle"
L["PHXM_ADMIN_TEAMBALANCE"]				= "Temel Takım Ayarları"
L["PHXM_ADMIN_CHANGETEAM_LIMIT"]			= "Takım değiştirme sınırı kullan. Devre dışı bırakmak için '-1'."
L["PHXM_ADMIN_USENEWCHAT"]				= "Yeni Sohbet Kutusunu kullan (eChat) - Bu geçicidir. Eğer halihazırda varsa, dokunmayın."
L["PHXM_ADMIN_NEWCHATPOS"]				= "Yeni Sohbet Kutusu Pozisyonu: Yükseklik pozisyonunu N pikselden çıkar."
L["PHXM_ADMIN_RESPAWNONBLIND"]			= "Yumarken doğmaya izin ver"
L["PHXM_ADMIN_RESPAWNONBLIND_TEAM"]		= "Yumarken sadece belli bir takımın doğmasına izin ver: 0: Herkes, 1: Avcılar, 2: Nesneler"
L["PHXM_ADMIN_REWSPANTIMEPERCENT"]		= "Doğmana izin veren yumma süresi oranı. Varsayılan 0.75 (75% * Maksimum Yumma Süresi anlamına geliyor)"
L["PHXM_ADMIN_ALLOWRESPAWN_SPECTATOR"]	= "İzleyici takımına atanırken yumma süresinde doğmaya izin ver"
L["PHXM_ADMIN_ALLOWRESPAWN_TEAMCHANGE"]	= "Farklı bir takıma atanırken yumma süresinde doğmaya izin ver (Bunu etkinleştirmek önerilmez)"

--[[
	MapVote Settings
]]
L["PHXM_MV_SETTINGS"]			= "Harita Oylama Ayarları"

L["PHXM_MV_ALLOWCURMAP"]			= "Mevcut haritanın oylanmasına izin ver"
L["PHXM_MV_COOLDOWN"]			= "Oylama için harita bekleme süresini etkinleştir"
L["PHXM_MV_USE_ULX_VOTEMAPS"]	= "ULX harita oylama listesini kullan? Eğer yoksa, varsayılan maps/*.bsp kullanılacak."
L["PHXM_MV_MAPLIMIT"]			= "Harita oylamasından gösterilen haritaların sayısı."
L["PHXM_MV_TIMELIMIT"]			= "Varsayılan harita oylama süresi (Saniye)."
L["PHXM_MV_MAPBEFOREREVOTE"]		= "Bir haritanın yeniden gözükmesi için gereken harita değişikliği sayısı"
L["PHXM_MV_RTVCOUNT"]			= "Oylamayı başlatmak için gerekli oyuncu sayısı"

L["PHXM_MV_EXPLANATION1"]		= "Hangi haritanın listeleneceği, Örneğin [ mv_map_prefix 'phx_,ph_,cs_,de_' ] konsolda kullanın."
L["PHXM_MV_EXPLANATION2"]		= "Eğer ULX yüklüyse, 'ulx map_vote' kullanın. Aksi takdirde 'mv_start' kullanın."
L["PHXM_MV_EXPLANATION3"]		= "Harita Oylama Eylemi (İptal etmek için, basitçe 'ulx unmap_vote' yada 'mv_stop' konsolda kullanın.)"

L["PHXM_MV_START"]		= "Harita Oylamasını Başlat"
L["PHXM_MV_STOP"]		= "Harita Oylamasını Durdur"
--                  			  ^YOU VIOLATED THE LAW!

--[[ 
	Versioning, Credits or About section
]]
L["PHXM_ABOUT_VERSIONING"]		= "Sürüm: %s - Revizyon: %s"
L["PHXM_ABOUT_AUTHOR"]			= "%s tarafından"
L["PHXM_ABOUT_ENJOYING"]			= "Eğer oyunda eğleniyorsanız, bağış yapmaya ne dersiniz!"
L["PHXM_ABOUT_UPDATE"]			= "Nesne Avı X Güncellemeleri"

L["PHXM_VIEW_UPDATE_INFO"]		= "Güncelleme bilgisini göster"
L["PHXM_CHECK_FOR_UPDATES"]		= "Güncellemeleri konrol et"
L["PHXM_UPDATE_FOUND_TEXT"]		= "Güncellemeler konrol edildi. Lütfen daha fazla bilgi için konsolu kontrol edin.\n\nYenilikleri güncellemeyi görmek ister misiniz?"
L["PHXM_UPDATE_FOUND_TITLE"]   	= "Güncelleme Bilgisi"
L["PHXM_UPDATE_FOUND_BUTTON"]   	= "Güncellemeleri Göster"

L["UPDATE_NOTIFY_MSG_NOTFOUND"]	= "Güncelleme bulunamadı. Lütfen ilk olarak 'Güncellemeleri konrol et' butonuna tıklayın!"
L["UPDATE_NOTIFY_MSG_TITLE"]		= "Güncelleme bulunamadı"
L["UPDATE_NOTIFY_WINDOW_TITLE"]	= "Güncelleme Bildirimi"
L["UPDATE_RTBOX_APPEND"]			= "\n\nBilginize:\nŞuanda: %s sürümünü %s revizyonuyla kullanıyorsunuz"
L["UPDATE_BTN_SEEFULL"]			= "Tüm Değişiklikleri Gör"

L["PHXM_ABOUT_LINKS"]			= "Bağlantılar ve Krediler"
L["PHXM_ABOUT_THANKS"]			= "Destek için Özel Teşekkürler, Öneri & Katkılar:\n %s"
L["PHXM_ABOUT_BTN_DONATE"]		= "NA:X'ı bağış yaparak destekle"
L["PHXM_ABOUT_BTN_HOME"]			= "NAX Anasayfası"
L["PHXM_ABOUT_BTN_GITHUB"]		= "NAX GitHub Dizini"
L["PHXM_ABOUT_BTN_PLUGINS"]		= "NAX Eklentiler"
L["PHXM_ABOUT_BTN_CHANGELOGS"]	= "NAX Değişiklik Kaydı"

-- fretta
L["HUD_SPECTATING"]	= "İZLENİYOR"
L["HUD_YOUDIED"]		= "Öldün!"

L["CHAT_STARTING_MAPVOTE"] = "Raunt bitti. Harita oylaması başlatılıyor..."

-- This used for HUD Taunt Timer
L["HUD_PROP_TAUNT_TIME"]	= "Rastgele Alay"
L["HUD_PROP_CTAUNT_TIME"] = "Özel Alay"

-- Plugins Section
L["PLUGINS_NO_PLUGINS"]				= "Yüklü eklenti yok. Burada daha fazla eklentiye göz atın!"
L["PLUGINS_BROWSE_MORE"]				= "Daha fazla eklentiye göz atın"
L["PLUGINS_SERVER_HAS_NO_PLUGINS"]	= "Üzgünüz, Bu sunucuda kurulu özel eklenti yok."
L["PLUGINS_SERVER_SETTINGS"]			= "-- Sunucu Ayarları --"
L["PLUGINS_CLIENT_SETTINGS"]			= "-- Kullanıcı Ayarları --"

-- Text Entries
L["TEXTENTRY_FZ_SINGLE"] = "Sabit Kamera Tek Ses Yolu"
L["TEXTENTRY_MV_PREFIX"] = "Harita Oylama Harita Öneki"

L["MISC_GAME_ENDED"]		= "Oyun bitti."

--============= LATE ADDITION OF 16.09.21/X2Z. =============--

--[[
	Credits: Late Addition: Revision: 16.09.21/X2Z
]]

L["PHXM_ABOUT_BTN_WIKI"]			= "NAX Wiki & Kılavuzlar"

--[[
	Auto Taunt: Late Addition: Revision: 16.09.21/X2Z
]]

L["HUD_AUTOTAUNT_DISABLED"]		= 	"Otomatik Alay devre dışı."
L["HUD_AUTOTAUNT_WAITFORUPDATE"]	=	"Otomatik Alay senkronize ediliyor..."

--[[
	MapVote: Late Addition: Revision: 16.09.21/X2Z
]]
L["PHXM_MV_VOTEROCKED"]				= "Oylama çağrısı yapıldı, harita oylaması raunt sonu başlayacak"
L["PHXM_MV_VOTEROCKED_IMMINENT"]		= "Oylama çağrısı yapıldı, harita oylaması çok yakın"
L["PHXM_MV_VOTEROCKED_PLY_TOTAL"]	= "%s oylama çağrısı yaptı. ( %d / %d )"

L["PHXM_MV_MUST_WAIT"]				= "Oy vermeden önce biraz beklemelisin!"
L["PHXM_MV_VOTEINPROG"]				= "Şu anda devam eden bir oylama var!"
L["PHXM_MV_HAS_VOTED"]				= "Zaten oylama çağrısı yaptın!"
L["PHXM_MV_ALR_IN_VOTE"]				= "Zaten oylama yapıldı, harita değişecek!"
L["PHXM_MV_NEED_MORE_PLY"]			= "Oylama çağrısı için daha fazla oyuncuya ihtiyacınız var!"

--[[
	Late Addition: Revision: 16.09.21/X2Z
]]
L["PROP_PLAYERMDL_BANNED"]	= "Özel Nesne Oyuncu Modeliniz sunucudan yasaklandı."

--[[
	Prop Menu/Prop Chooser, Revision: 16.09.21/X2Z
]]

L["PCR_USAGE_UNLIMIT"]		= "[Nesne Menü] **Unlimited** kullanımın kaldı!"
L["PCR_USAGE_COUNT"]			= "[Nesne Menü] %d kullanımın kaldı!"
L["PCR_PLS_WAIT"]			= "[Nesne Menü] Lütfen %d saniye bekleyiniz."
L["PCR_NOROOM"]				= "[Nesne Menü] Nesne değiştirmek için yeterli alan yok!"
L["PCR_PROPBANNED"]			= "[Nesne Menü] Bu nesne sunucu tarafından yasaklanmıştır."
L["PCR_PROPBANNED_BYPCR"]	= "[Nesne Menü] Nesne menüsü bu nesneyi yasakladığı için kullanamazsınız."
L["PCR_REACHED_LIMIT"]		= "[Nesne Menü] Sınıra ulaştın!"
L["PCR_STAY_ON_GROUND"]		= "[Nesne Menü] Yerde kalmalı ve çömelmemelisiniz!"
L["PCR_ONLY_GROUP"]			= "[Nesne Menü] Sadece belli gruplar bu menüyü açabilir!"
L["PCR_NOT_EXIST_COUNT"]		= "Seçtiğiniz nesne bu haritada yok! ( %s / 4 )"
L["PCR_NOT_EXIST"]			= "Seçtiğiniz nesne bu haritada yok!"

-- PCR Client section, reason why there is a space because of chat.AddText between args.
L["PCR_NOTIFY_1"]			= " Bunu sunucu nesne menüsü %s sürümünü kullanıyor!"
L["PCR_NOTIFY_2"]			= " konsolda veya F1 -> [Nesne Seçme Yardımı] menüsü."
L["PCR_CL_DISABLED"]			= " Bu özellik devre dışı."
L["PCR_CL_GROUP"]			= " Sadece belli gruplar bu menüyü açabilir!"
L["PCR_CL_LIMIT"]			= " Sınıra ulaştın!"

L["PCR_UNLIMIT_TEXT"]		= "Sınırsız"
L["PCR_WINDOW_TITLE"]		= "NA:X Nesne Menü"
L["PCR_HEADER_TOP"]			= "İstediğin nesneyi seç."
L["PCR_HEADER_MID"]			= "%s hakkın var"
L["PCR_HEADER_BOTTOM"]		= "bu nesne seçiciyi kullanmak için!"
L["PCR_CL_TOOLTIP_BANNED"]	= "Bu modeli kullanamazsın."
L["PCR_CL_TOOLTIP_MODEL"]	= "Model: %s"
L["PCR_CL_MENU_NOTREADY"]	= " Bu özellik şu anda kullanılamıyor."
L["PCR_WINDOW_GUIDE_TTL"]	= "Hızlı Rehber: Nesne Menüsü 101"
L["PCR_BTN_HELP_MENU"]		= "Nesne Yardım Menüsü"

L["PCR_CL_CMDUSEULX"]		= " Bu komut devre dışı. 'ulx propmenu' kullanın!"
L["PCR_CMD_ULX_DISABLED"]	= "ulx propmenu komutu devre dışı. [Nesne Menüsü Tuş Ataması]'na basarak açınız."

L["PCR_EDT_IN_USE"]			= "Bir admin hala nesne bilgisini düzenliyor. Lütfen bekleyiniz!"
L["PCR_EDT_ERROR_DISABLED"]	= "[Nesne Menüsü] Hata: Özel Nesne Eki Devre dışı!"
L["PCR_EDT_NO_RIGHTS"]		= "Bu özelliğe erişme hakkınız yok."

--[[
	Admin Section, Revision: 16.09.21/X2Z
]]
L["PHXM_PLAYER_PROP_CHOOSER_KEY"]	= "Nesne Menüsünü açmak için varsayılan tuş."
L["PHXM_PROP_FREEZE_MIDAIR"]			= "Bir nesne olarak havadayken hareketi dondurmak için varsayılan tuş"
L["PHXM_ADMIN_TAUNT_SCANNER"]		= "(Haritayı Yeniden Başlatma Gerektirir) alay tarayıcısını etkinleştir?"
L["PHXM_ADMLBL_USABLE_ENTS"]			= "Kullanılabilir Nesne Varlık Türleri"
L["PHXM_ADMLBL_USABLE_ENTS_REF"]		= "Türler: 1: Yalnızca Fizik, 2: Fizik & Dinamikler, 3: Neredeyse Her şey (cesetler dahil), 4: Özel Varlıklar."
L["PHXM_ADMIN_USABLE_ENT_TYPE"]		= "Nesnenin dönüşebileceği varlık türleri"
L["PHXM_ADMIN_NOTIFY_ENT_TYPE"]		= "Nesnelere [E]'ye basılarak dönüşülemeyen varlıkları bildir. Sadece 'ph_usable_prop_type' 3 veya 4'se çalışır."
L["NOTIFY_PROP_ENTTYPE"]				= "Etkileşime girmek için [E]'ye bas, Dönüşmek için sol tıkla."
L["NOTIFY_CUST_ENT_TYPE_IS_ON"]		= "[NAX] Uyarı: Etkileşime girmek için [E]'ye bas, Dönüşmek için sol tıkla."

--[[
	Custom Taunts, Revision: 16.09.21/X2Z
]]
L["TM_TAUNTS_SEARCH_NOTHING"]		= "'%s' içeren alay bulunamadı..."
L["TM_SEARCH_PLACEHOLDER"]			= "Bu kategoride ara: sözcük gir, küçük harf & joker karakter yok. Boş=Hepsini Göster."
L["PHXM_MSG_INPUT_IS_EMPTY"]			= "Metin boş veya ENTER tuşuna basmadınız."

--============= LATE ADDITION OF 10.06.2022/X2Z. =============--

--goto line: @132
L["MISC_SET"]						= "Ayarla"
L["MISC_APPLY"]						= "Uygula"
L["MISC_NO"]							= "Hayır"
L["MISC_YES"]						= "Evet"
L["MISC_WARN"]						= "Uyarı"
L["MISC_ERROR"]						= "Hata"
L["MISC_INFO"]						= "Bilgi"
L["MISC_NOTICE"]						= "Uyarı"
L["MISC_IDK"]						= "Bilinmeyen"
L["MISC_NA"]							= "N/A"

-- HUD
L["HUD_DECOY_ACTIVE"]                = "[%s]'e bas"
L["HUD_FAKETAUNT_COUNT"]             = "%ix Kaldı"
L["HUD_FAKETAUNT_UNLI"]              = "Sınırsız"
L["NOTICE_GRENADE_SMG_GIVEN"]        = "SMG bombaları edindin."

--[[
	ADMIN PANEL, Revision 10.06/2022/X2Z
]]--
L["PHXM_TAUNT_SETTINGS"]				= "Alay Ayarları"
L["PHXM_GENERAL_SETTINGS"]			= "Genel Ayarlar"
L["PHXM_FAKE_TAUNT_SETTINGS"]		= "Sahte Alay Ayarları"
L["PHXM_FAKE_TAUNT_ENABLE"]			= "Sahte alayların haritada rastgele bir şekilde nesnelerin üzerinde çalınmasına izin ver. Sadece Özel Alay Menüsünden erişilebilir."
L["PHXM_FAKE_TAUNT_MAXUSAGE"]		= "En fazla kullanılabilir sahte alay; -1 sınırsızdır."
L["PHXM_TAUNT_RIGHT_CLICK"]		    = "Alay için sağ tıkla. Bu özel menüde sağ tıkı devre dışı bırakacaktır!"

L["PHXM_TAUNT_PITCH_SETTINGS"]		= "Alay Ses Perdeleme Ayarları"
L["PHXM_TAUNT_PITCH_ENABLE"]			= "Alay Ses Perdesini Ayarla"
L["PHXM_TAUNT_PITCH_RANGE_MIN"]		= "Bir alay için en az kabul edilebilir ses perdeleme aralığı. 1'den 99'a kadar."
L["PHXM_TAUNT_PITCH_RANGE_MAX"]		= "Bir alay için en fazla kabul edilebilir ses perdeleme aralığı. 100'den 255'e kadar."

L["PHXM_DECOY_SETTINGS"]				= "Yem Ayarları"
L["PHXM_DECOY_ENABLE"]				= "Yem Ödülünü Etkinleştir? Ödül raunt bitene kadar sadece bir kereliğe mahsus canlı nesnelere verilecektir. Birikmezler ve koyulduklarında eksilirler."

L["PHXM_DISABLE_FOOTSTEP"]           = "Nesne takımının adım seslerini sessize al"

L["PHXM_ADMIN_CHATSETTING"]			= "Sohbet Penceresi Ayarları"
L["PHXM_ADMIN_HUNTERBLIND"]			= "Avcı Yumma Kontrolü"

L["PHXM_ADMIN_GIVEGRENADE_NEAREND"]  = "Bombalar raunt sonuna yakın mı verilmeli? Eğer evetse, 'ph_give_grenade_roundend_before_time' komutunu kontrol ediniz."
L["PHXM_ADMIN_GIVEGRENADE_TIME"]     = "Raunt bitmeden önce bomba verme süresi (Saniye). Genel olarak 10 ile 30 saniye arasındadır."

--[[
	Plugins in sh_init.lua, Revision 10.06/2022/X2Z
]]--
L["PLUG_NAME_VER"]					= "Eklenti: %s | v.%s"
L["PLUG_DESCRIPTION"]				= "Açıklama: %s"

--[[
	Taunt Pitch, Revision 10.06/2022/X2Z
]]--
L["PHX_CTAUNT_USE_PITCH"]			= "Özel alaylar için perde kullan"
L["PHX_CTAUNT_RANDOM_PITCH"]			= "Alay ederken ses perdeleme seviyesini rastgele seç"
L["PHX_RTAUNT_USE_PITCH"]			= "Rastgele alaylar için ses perdelemesi kullan [%s]"
L["PHX_RTAUNT_RANDOMIZE"]			= "Rastgele alaylarda ses perdeleme seviyesini rastgele seç [%s]"
L["PHX_CTAUNT_PITCH_FOR_FAKE"]		= "Sahte alaylar için ses perdelemesi kullan"
L["PHX_CTAUNT_RANDPITCH_FOR_FAKE"]	= "Sahte alaylar için rastgele ses perdelemesi kullan"
L["PHX_CTAUNT_SLIDER_PITCH"]			= "Alay Ses Perdeleme."
L["TM_TOOLTIP_FAKETAUNT"]			= "Rastgele bir nesne üzerinden alay et"
L["TM_PREFERRED_PITCH"]              = "Tercih Edilen Alay Ses Perdeleme Seviyesi"

--[[
	Fake Taunt, Revision 10.06/2022/X2Z
	Description: Play fake taunts on random props in the map (Not Players)
]]--
L["PHX_CTAUNT_ON_RAND_PROPS"]		= "Rastgele nesneler üzerinde çal (%ix)"
L["PHX_CTAUNT_ON_RAND_PROPS_UNLI"]	= "Rastgele nesneler üzerinde çal"
L["PHX_CTAUNT_PLAYED_ON_RANDPROP"]	= "Rastgele bir nesne üzerinden alay ettin."
L["PHX_CTAUNT_RAND_PROPS_LIMIT"]		= "Sınıra ulaştın!"
L["PHX_CTAUNT_RAND_PROPS_NOT_PROP"]  = "Şu anda mevcut değil."
L["PHX_CTAUNT_RANDPROP_DISABLED"]	= "Sahte alay şu anda devre dışı."

--[[
	PH:Z Simple Decoy, Revision 10.06/2022/X2Z
]]--
L.DECOY_PROP	= {
	"kuklayı öldürdü!",
	"kuklayı öldürdükten sonra pişman oldu.",
	"bir yem öldürdü.",
	"masum bir kukla öldürdü.",
	"bir kukla öldürdüğü için utandı."
}

L["DECOY_PUT_SUCC"]					= "Yem başarılı bir şekilde koyuldu."
L["DECOY_CANT_PUT_HERE"]				= "Buraya yem koyamazsın."
L["DECOY_GET_REWARD"]				= "Tebrikler! Bu raunt hayatta kaldığınız için ['Nesne Yemi'] kazandınız!"
L["DECOY_REMINDER_GET"]              = "Bir Yem/Kukla nesnen var! Avcıları şaşırtmak için bir yere koy!"
L["DECOY_FRAGS_RECEIVED"]			= "Yem başarıyla yemlendi: %s'dan 1 puan çaldınız!"
L["DECOY_DISABLED"]					= "Şu anda, yem mevcut değil."
L["PHXM_CL_DECOY_KEYBIND"]			= "Yem koymak için varsayılan tuş. Varsayılan 1 (Num Tuş Takımı 1 değil)."

L["DECOY_INDICATOR_INVALID"]         = "Geçersiz Eğim!"
L["DECOY_INDICATOR_TOOFAR"]          = "Çok uzak!"
L["DECOY_INDICATOR_OK"]              = "Yem koy [%s'e bas]"

L["PHXM_DECOY_HEALTH"]				= "Bir yemin ne kadar canı olmalı. Varsayılan 10."
L["PHXM_PLAYER_SHOW_DECOY_HELPER"]   = "Yem koyma yardımcısını göster? Bu ayar nişangahın üstünde beyaz bir noktayla metin gösterecektir."
L["PHXM_PLAYER_SHOW_DECOY_MARKER"]   = "Yem işaretini göster?"

--[[
	Revision 10.06/2022/X2Z
    Prop Menu Update: Menu, Editor, Browser
]]--
L["PCR_MODEL_DONT_EXISTS"]   = "Üzgünüz, bu model şu anda mevcut değil!"

L["PCR_PLUG_WARN_MSG"]		= "Uyarı: Özel Nesne Eklemesi (pcr_allow_custom) 0'a ayarlandı.\nÖzel nesnenizi düzenlemek için bu özelliği etkinleştirmelisiniz!\nA Bu ayarı değiştirmek için bir harita değişikliği gerekli."
L["PCR_PLUG_LBL_BINDKEY"]	= "Tuş atamasını değişmek için [Oyuncu] sekmesine geçin."
L["PCR_PLUG_LBL_EDITOR"]		= "Özel Nesne Düzenleyicisi"
L["PCR_PLUG_BTN_OPEN_EDT"]	= "Düzenleyiciyi Aç"
L["PCR_PLUG_LBL_COMSET"]		= "Genel Ayarlar"
L["PCR_PLUG_LBL_TECHSET"]	= "Teknik Ayarlar"
L["PCR_PLUG_LBL_EXPSET"]		= "Deneysel"
L["PCR_PLUG_LBL_PLAYERSET"]	= "Oyuncu Ayarları"

L["PCR_PLUG_ENABLE"]			= "Nesne Menüsünü etkinleştir."
L["PCR_PLUG_ALLOW_CUSTOM"]	= "(Haritayı Yeniden Başlatma Gerektirir) Özel nesnelerin nesne menüsü listesine eklenmesine izin ver?"
L["PCR_PLUG_PROP_BAN"]		= "(Haritayı Yeniden Başlatma Gerektirir) Nesne Menüsü listesine yasaklanmış nesneleri dahil etme?"
L["PCR_PLUG_USAGE_LIMIT"]	= "Oyuncunun kullanması için en fazla kullanım sınırı. -1 sınırsızdır."
L["PCR_PLUG_PROP_LIMIT"]		= "(Haritayı Yeniden Başlatma Gerektirir) Özel Nesne listesine nesne ekleme miktarını sınırlandır"
L["PCR_PLUG_PROP_LIMITMAX"]	= "Nesne Menüsü listesine eklenecek en fazla nesne sayısı. Not: Rastgele eklenecektir!"
L["PCR_PLUG_USE_ULXMENU"]	= "Nesne Menüsü Konsol (0) veya ULX (1) kullanılarak mı erişilsin? Daha önce atanmış tuş bu ayarla düzgün çalışacaktır"
L["PCR_PLUG_USE_DELAY"]		= "Nesne Menüsünde nesne seçme gecikmesi (Saniye)"
L["PCR_PLUG_KICK_INVALID"]	= "Herhangi bir kullanıcının Geçersiz Modele erişme girişimini sunucudan atarak durdurun (4x En fazla kabul edilebilir)"
L["PCR_PLUG_SPACE_CHECK"]	= "Oyuncunun başka bir nesneye sıkışmasını engellemeden önce alanı kontrol et"
L["PCR_PLUG_X_BBOX"]			= "(Haritayı Yeniden Başlatma Gerektirir) Nesne Menüsü listesine eklemeden önce Varlıkların Temas Sınır seviyesini kontrol et"
L["PCR_PLUG_X_BBOX_MAX"]		= "Varlıkların Temas Sınır Yükseklik seviyesi. En az olanlar otomatik hesaplanır."
L["PCR_PLUG_X_BBOX_MIN"]		= "Varlıkların Temas Sınır Genişlik seviyesi. En az olanlar otomatik hesaplanır."
L["PCR_PLUG_ONLY_GROUPS"]	= "Should Prop Menu can only be accessed by certain groups e.g. Donator?"
L["PCR_PLUG_NOTIFYMSG"]		= "Oyuncuyu Nesne Menüsünü nasıl kullanacağı hakkında bilgilendir"

L["PCR_EDITOR_MSG_ERROR"]	= "Değişiklikler bir hata nedeniyle kaydedilemedi.\nLütfen sunucu konsolonu kontrol et!"
L["PCR_EDITOR_MSG_SUCC"]		= "Değişikliklerin ve Özel Nesne bilgilerin başarıyla kaydedildi ve güncellendi." --Thanks galaxio! x)

L["PHZ_generic_title"]		= "Özel Nesne Kapsama Düzenleyecisi"
L["PHZ_generic_helptext"]	= [[[Nasıl Kullanılır:
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
L["PHZ_generic_mdlinfo"] = [[Model Info:
%s
Has Physics: %s]]
L["PHZ_generic_mdlinfoStart"] = "(İlk önce model seç!)"

L["PHZ_generic_no_ragdoll"]	= "No: Ragdoll"
L["PHZ_generic_titlelabel"]	= "%s Önizle :"

L["PHZ_mount_game_sel"]		= "İlişkilendirilmiş oyun seç (Default: Garry's Mod)"
L["PHZ_input_placeholder1"]	= "Aranacak Klasör: <klasör adı> veya '*', tüm klasörler için boş."
L["PHZ_input_placeholder2"]  = "Aranacak Eklenti: <ad> veya '*', tüm klasörler için boş."
L["PHZ_msg_warn_close"]		= "Bu pencereyi kapatmak istediğinizden emin misiniz? Kaydedilmemiş düzenlemeler kaybolacak!"
L["PHZ_msg_commit"] 			= "Değişiklik yapmak istediğinizden emin misiniz??"
L["PHZ_msg_cant_empty"]		= "Nesne listesi boş olamaz!"
L["PHZ_msg_removesel"] 		= [[Remove selected props in the list. Hedefşer:
Kırmızı = İşaretli Seçimler
Sarı: Nesne sunucuda yok ve kaldırılmalı.]]
L["PHZ_msg_warn_mdlinlist"]  = "Uyarı: Bu model zaten listede!"
L["PHZ_msg_invalid_mdl"] 	= "Neden: Bu geçersiz bir model"
L["PHZ_apply_select"] 		= "Seçimleri Uygula ve Kaydet"
L["PHZ_menu_copy"] 		= "Modeli Kopyala"
L["PHZ_menu_refresh"] 	= "Modeli Yenile"
L["PHZ_tooltip_removesel"]	= "Seçileni Kaldır"
L["PHZ_tooltip_wasmarked"] = [[Bu nesne, sunucuda bulunmadığı için işaretlendi.
Bu düzenleyiciyi kapatırsanız, bu otomatik olarak kaldırılacaktır.]]

L["PHZ_pcr_fb_allcontent"] = "Tüm İçerikler (Tüm Oyuncular/Sunucu sizinle aynı içeriğe sahip olmayacaktır)"
L["PHZ_pcr_fb_notmounted"] = "%s [İlişkilendirilmemiş]"

-- Revision 25-27/08/2022
L["PHX_ADMIN_ACCESS_ONLY"]		= "Erişim engellendi: bunu sadece adminler yapabilir, %s !"
L["PHX_PROP_TOO_THIN"]           = "Dönüşülemez: Nesne çok ince!"
L["PHX_PROP_IS_BANNED"]			= "Kullanmaya çalıştığınız nesne sunucudan yasaklandı!"
L["PHX_SPECT_JOINGAME"]			= "Oyuna katılmak için, [F2]ye basın ve bir takım seçiniz."
L["PHX_TEAM_IS_FULL"]			= "O takım dolu!"
L["FORCE_JOIN_TEAM_IS_DISABLED"]	= "Takım eşitleme devre dışı (Takım Karması/Aktarması etkin)"

L["PHX_TM_MNBAR_OPTIONS"]		= "Ayarlar"
L["PHX_TM_MNBAR_SAVEFAV"]		= "Favorileri Kaydet"
L["PHX_TM_MNBAR_LOADFAV"]		= "Favorileri Yeniden Yükle"
L["PHX_TM_MNBAR_SETTINGS"]		= "Diğerleri"
L["PHX_TM_MNBAR_RESET"]			= "Favorileri Sıfırla"

L["PHX_TM_WARN_CLEARFAV"]		= "UYARI: Bu önceden kaydettiğiniz Favori Alayları silecektir. Devam etmek istediğine emin misiniz?"

L["PHXM_BANNED_MODELS"]			= "Kısıtlanmış Modellerin kullanımına izin ver/me (Yasaklanmış Modeller). Buna Yasaklı Modeller dahil değildir (Bunlar her zaman silinir)."
L["PHXM_ADMIN_ALLOWARMOR"]       = "Nesne ve avcı takımında zırha izin ver"
L["PHXM_ADMIN_ALLOW3P"]          = "Avcılar ÜŞBA'ya erişebilir"
L["PHXM_ADMIN_ALLOW3P_SVDESIRED"]= "ÜŞBA'nın sunucunun istediği kamera pozisyonunu kullanmasına izin ver (Özel oyuncu pozisyonuna izin verme)"
L["PHXM_ADMIN_ALLOW3P_DIST"]     = "ÜŞBA: Kamera Mesafesi"
L["PHXM_ADMIN_ALLOW3P_RIGHT"]    = "ÜŞBA: Kamera Sağ Pozisyonu"
L["PHXM_ADMIN_ALLOW3P_UP"]     	= "ÜŞBA: Kamera Üst Pozisyonu"
L["PHXM_ADMIN_JUMPPOWER_H"]		= "Avcılar için ek Zıplama Gücü çarpanı"
L["PHXM_ADMIN_MDLCOLOR_PROP"]	= "Nesne Takımı için Oyuncu Rengini etkinleştir (Özel Avcı Modellerinin etkinleştirilmesini gerektir)"
L["PHXM_ADMIN_MDLCOLOR_HUNTER"]	= "Avcı Takımı için Oyuncu Rengini etkinleştir (Özel Avcı Modellerinin etkinleştirilmesini gerektir)"
L["PHXM_ADMIN_PITCH_ROTATION"]	= "[Deneysel] Nesneler için ses döndürme kullanımına izin ver. Bu hatalı olabilir."
L["PHXM_ADMIN_FALLDMG"]			= "Düşme hasarını etkinleştir (Tüm Takımlarda Geçerlidir)"
L["PHXM_ADMIN_FALLDMG_REAL"]		= "'Gerçekçi' Düşme hasarını etkinleştir"
L["PHXM_INFORM_TO_JOIN"]			= "Atanmamışları/İzleyicileri oyuna katılmaları için statik metin tavsiyesiyle bilgilendirin."
L["PHXM_ADMIN_PROPOFFSET"]		= "Nesne Görüş Denge Yüksekliğini çarpan kullanarak eksilt/arttır. En az: 0.6, En çok: 1.2. Varsayılan: 0.8."
L["PHXM_ADMIN_REPL_MUST_STAND"]	= "[Deneysel] Nesneleri sadece sabit dururken dönüşmelerine izin ver. Zıplarken veya eğilirken dönüşmeye izin vermek için bu ayarı devre dışı bırakınız."

L["PHXM_DROP_VBS_DISABLE"]       = "Ayrıntı Devre dışı"
L["PHXM_DROP_VBS_ENABLE"]        = "Ayrıntı Etkin"
L["PHXM_DROP_MDL_INCLUDEALL"]    = "Her Şeyi Dahil Et ( %d )"
L["PHXM_DROP_MDL_CUSTOMLIST"]    = "Özel Listeyi Ayır ( %d )"
L["PHXM_DROP_MDLTYPE_PROP"]      = "Sadece Fizik ( %d )"
L["PHXM_DROP_MDLTYPE_PROPDYN"]   = "Fizik & Dinamik Nesneler ( %d )"
L["PHXM_DROP_MDLTYPE_ANYENTS"]   = "Tüm Uyumlu Varlıklar ( %d )"
L["PHXM_DROP_MDLTYPE_CUSTOM"]    = "Özel Varlıklar ( %d )"
L["PHXM_DROP_RESPAWNBLIND_BOTH"] = "Her İki Takım"

L["PHXM_TAB_ADMINGROUPS"]        = "Grup ve Erişim Seçeneği"
L["PHXM_TAB_PHEPLUS"]			= "Gelişmiş+ Ayarları"

L["PHXM_ADMIN_ACCESS_GROUP"]     = "NA:X Yönetici Ayarlarına erişime izin vermek için grupları seçiniz, Gelişmiş Plus & Eklenti Ayarları sayfası."
L["PHXM_ADMIN_ACCESS_GROUP_HINT"] = "Bilginize, \"superadminler\"in yetkisi geri alınamaz."
L["PHXM_ADMIN_ACCESS_GROUP_NOULX"] = "Hata: ULib ve ULX sunucunuzda yüklü değil."
L["PHXM_ADMIN_ACCESS_NOREVOKE"]  = " (Geri alınamaz)"
L["PHXM_ADMIN_GROUP_WHOCANACC"]	= "Erişime izin vermek için grupları seçin [Admin Ayarları]."
L["PHXM_ADMIN_GROUP_MUTEABLE"]	= "Susturmaya izin verilmeyecek grupları seçin [Oyuncu Susturma]. (Kullanıcı her zaman susturulabilir)."

L["PHXM_ADMIN_ACCESS_CHATINFO"]  = "Nesne Avı Menü penceresi için bir konfigürasyon güncellemesi vardı. Yeniden açılıyor..."
L["PHXM_ADMIN_ACCMSG_BODY"]      = "Seçimi kaydedip değişikliklere devam etmek istiyor musunuz?\nDaha önce geri aldığınız gruplar erişim yetkisini kaybedecektir.\nEğer hala açıksa Nesne Avı Menüsünü yeniden başlatacaktır."
L["PHXM_ADMIN_ACCMSG_TITLE"]     = "Grup Erişimini Uygula"
L["PHXM_ADMIN_ACCCFG_SUCC"]      = "Grup Erişimi verileri başarıyla kaydedildi."
L["PHXM_ADMIN_ACCCFG_FAIL"]      = "Grup Erişimi verileri kaydedilirken bir hata oluştu. Sunucu konsolunuzu kontrol edin!"
L["PHXM_ADMIN_MUTCFG_SUCC"]      = "Susturulabilir Grup Erişimi verileri başarıyla kaydedildi."
L["PHXM_ADMIN_MUTCFG_FAIL"]      = "Grup Erişimi verileri kaydedilirken bir hata oluştu. Sunucu konsolunuzu kontrol edin!"

L["PHXM_ADMIN_ACCESS_APPLY"]     = "Seçilen Grupları Uygula"

-- PHE/Plus
L["PHXM_ADMIN_PLUSSETTING"]		= "Artı+ Ayarlar"
L["PHXM_PLUSSETTING_HINT"]		= "Takım Dengesini veya diğer ek ayarları yapılandırın."
L["PHXM_HEADER_UNSTUCK"]			= "Sıkışma Ayarları"
L["PHXM_HEADER_TEAMSETTING"]		= "Daha Fazla Takım Ayarları ve Seçenekleri"

L["LIST_PLAYER"]					= "Oyuncular"
L["LIST_FORCEDASPROP"]			= "Nesneye Zorlandı?"
L["LIST_MARKEDASPROP"]			= "Nesneye zorlanmış olarak işaretle"
L["LIST_NOHUNTERS"]				= "Şu anda oynayan Avcı bulunmamaktadır."

L["PHXM_PLUS_MSG_NO_HUNTERS"]	= "Sıfırlamak için Avcı yok."

L["PHXM_PLUS_BTNRESET"]			= "Seçimleri Temizle (ve tüm zorlanmışları sıfırla)"
L["PHXM_PLUS_LISTTIPS"]			= "İpuçları: Bir oyuncuyu Nesne Takımında olmasını zorlamak için çift tıklayın."

L["PHXM_ADMIN_ENABLEUNSTUCK"]		= "Eklentinin sıkışmaktan kurtulma özelliğini etkinleştirin veya devre dışı bırakın. Eğer özel bir eklenti kullanıyorsanız, bu ayarı devre dışı bırakın."
L["PHXM_ADMIN_NOTPUNSTUCKINROUND"]	= "Saklanma aşamasındayken doğma noktalarının dışında son çare olarak sıkışmaktan kurtulmak için ışınlanmayı devre dışı bırak" --ph_disabletpunstuckinround
L["PHXM_ADMIN_UNSTUCK_WAITTIME"]		= "Her bir sıkışmaktan kurtulma denemesi arasında kaç saniye geçmeli" --ph_unstuck_waittime
L["PHXM_ADMIN_TEAMBAL_ORIG"] 		= "NA:X'ın kendi takım dengeleme özelliğini kullan (takım ilgili aşağıdaki tüm ayarları devre dışı bırakır)" --ph_originalteambalance
L["PHXM_ADMIN_TEAMBAL_UNCHECK"] 		= "Gelişmiş takım dengesi ayarlarına erişmek için önceki onay kutusunun işaretini kaldırın." --ph_originalteambalance_uncheck [KULLANILMAMIŞ]
L["PHXM_ADMIN_FORCESPECTOPLAY"]		= "Takımları dengelerken izleyicileri oynaması için zorla" --ph_forcespectatorstoplay
L["PHXM_ADMIN_NO_H_CONSECUTIVE"]		= "Oyuncuların arka arkaya iki kez Avcı olmasını engelle (Sadece karma modunda çalışır)" --ph_preventconsecutivehunting
L["PHXM_ADMIN_HUNTER_COUNT"] 		= "Avcı sayısı (0 = otomatik)" --ph_huntercount
L["PHXM_ADMIN_ROTATETEAM"] 			= "Karma modu devre dışı bırak ve oyuncuları aktarmayı kullan" --ph_rotateteams
L["PHXM_ADMIN_RESET_ROTTEAM"] 		= "Aktarmaları sıfırla" --ResetRotateTeams
L["PHXM_ADMIN_RESET_ROTTEAM_WARN"]	= "Başlangıçta değişmeyi yeniden başlat (eğer onları başlatmışsan, veya durdurmuşsan, ve yeniden başlatmışsanız ve şu anki değişim sizi memnun etmiyorsa):" --ResetRotateTeams_warning
L["PHXM_ADMIN_RESET_MSG"]			= "Takım Aktarması sıfırlandı!"
L["PHXM_ADMIN_FORCEH2P_WARN"]		= "Bir Avcıyı bir dahaki sefere Nesne olması için zorla (sadece karma modunda çalışır):" --ForceHunterAsProp_warning
L["PHXM_ADMIN_FORCEH2P_RANDONLY"]	= "Bu eylem sadece karma modunda geçerli." --ForceHunterAsProp_randomonly
L["PHXM_ADMIN_FORCEH2P_NOHUNT"]		= "[AVCI YOK]" --ForceHunterAsProp_nohunters [UNUSED]
L["PHXM_ADMIN_FORCEH2P_NOHUNTMSG"] 	= "Avcı yok Allah kahretsin, düğmede yazılı!" --ForceHunterAsProp_nohuntersmsg [UNUSED]

L["FORCEH2P_WILL_BE"]				= "%s sonraki raunt Nesne."
L["FORCEH2P_IS_CANCELED"]			= "%s sonraki raunt Nesne olmayacak."
L["FORCEH2P_IS_RESET"]				= "Sonraki rauntta tüm Avcılar Nesne olarak zorlanmayacak."
L["FORCEH2P_PLAYER_NOT_FOUND"]		= "Seçilen oyuncu bulunamadı, muhtemelen ayrıldı."
L["PHX_ROTATE_TEAM_RESET"]			= "Takım Aktarma Dengesi sıfırlandı."
L["FORCEH2P_ALREADY"]				= "%s zaten bir sonraki raunt için Nesne olarak belirlenmiş." -- [UNUSED]

L["UNSTUCK_YOURE_UNSTUCK"]			= "Artık kurtulmuş olmalısın!"
L["UNSTUCK_BAD_SPAWNPOINT"]			= "Hata: En yakın doğma noktası seni yeniden sıkıştırabilir. Eğer sıkışırsan, yeniden kurtulmayı deneyin."
L["UNSTUCK_RESCUE_SPAWNPOINT"]		= "Bu doğma noktası aşırı yakın, hala sıkışmış olabilirsin. Sıkışmışsanız yeniden deneyin."
L["UNSTUCK_NO_SPAWNPOINTS"]			= "Bilinmeyen nedenlerden ötürü, doğma noktası bulunamadı. Önlem olarak, (0, 0, 0)a ışınlanacaksanız. Sıkışmanıza çok yüksek bir şans var, eğer sıkışırsanız tekrar deneyin."
L["UNSTUCK_PLEASE_WAIT"]				= "Lütfen her bir sıkışmaktan kurtulma denemesinde %d saniye bekleyin."
L["UNSTUCK_NOT_ON_GROUND"] 			= "Zeminde değil, kontrol ediliyor..."
L["UNSTUCK_NOT_STUCK_JITTER"]		= "Sıkışmamışsın. Eğer gerçekten sıkıştıysanız, Nesneniniz hareket etmeyi veya titremeyi bırakana kadar bekleyin (ALT'a basmayı deneyin) ve yeniden deneyin."
L["UNSTUCK_NOT_STUCK_TOOBAD"]		= "Sıkışmamışsın. Eğer gerçekten sıkıştıysanız, üzgünüm, raunt sonuna kadar beklemek zorundasın."
L["UNSTUCK_CANNOT_FIND_SPOT"]		= "Sizin hareket edebileceğiniz bir yer bulunamadı, en yakın doğma noktasına ışınlanılıyor."
L["UNSTUCK_SPAWNPOINTS_DISABLED"]	= "Doğma noktasına ışınlanacaktın, ama bu sunucu yumma süresinin dışında izin vermiyor. Üzgünüz!"
-- End of PHE/Plus

L["MISC_SEL_APPLY"]  = "Seçimleri Uygula"
L["MISC_RESET_SEL"]  = "Seçimleri Sıfırla"
L["MISC_RESET"]      = "Sıfırla"
L["MISC_CANCEL"]     = "İptal"
L["MISC_SEL_ALL"]    = "Hepsini Seç"
L["MISC_SEL_NONE"]   = "Hiçbirini Seçme"

L["PHXM_CL_THIRDPERSON"]     = "ÜŞBA modu tuşu (Üçüncü Şahıs Bakış Açısı)"
L["PHXM_CL_UNSTUCK"]			= "Sıkışmaktan kurtulma tuşu"
L["CL_THIRDPERSON_ENABLED"]  = "ÜŞBA Etkin"
L["CL_THIRDPERSON_DISABLED"] = "ÜŞBA Devre dışı"

L["PHX_TP_ADJUSTVIEW_BTN"]	= "ÜŞBA görünümünü ayarla" --Button, as well as window title.
L["PHX_TPS_ADJ_TITLE"]		= "ÜŞBA Uyarısı"
L["PHX_TPS_ADJ_SVDESIRED"]	= "ÜŞBA özelleştirmesi devre dışı: Sunucunun istediği pozisyon kullanılıyor."
L["PHX_TPS_ADJ_3PDIS"]		= "ÜŞBA Devre Dışı."
L["PHX_TPS_ADJ_BLIND"]		= "Kör oldunuz. Yeniden deneyin."
L["PHX_TPS_ADJ_NEEDALIVE"]	= "Bunu yapmak için Avcı Takımında canlı olmanız gerekiyor."

L["ANG_AXIS_DIST"]	= "İleri" -- or Forward
L["ANG_AXIS_RIGHT"]	= "Sağ"
L["ANG_AXIS_UP"]		= "Yukarı"
L["VEC_POS_LEFT"]	= "Sol" --X
L["VEC_POS_FRONT"]	= "Ön" --Y?
L["VEC_POS_TOP"]		= "Üst"  --Z

-- Key Hints
L["KEYHINT_HUNTER3P"] 	= "Avcı ÜŞBA"
L["KEYHINT_SHOOT"]		= "Ateş Et"
L["KEYHINT_SEC"]			= "İkincil Ateş"
L["KEYHINT_PICKUP"]		= "Nesneyle Etkileşim"

L["KEYHINT_LMB"]			= "Nesneye Dönüş"
L["KEYHINT_RMB"]			= "Nesne Alay/Özel Yetenek"
L["KEYHINT_RANDTAUNT"] 	= "Rastgele Alay"
L["KEYHINT_TAUNTMENU"] 	= "Alay Menüsü"
L["KEYHINT_ROTATION"] 	= "Dönme Kilidi"
L["KEYHINT_PROPMENU"] 	= "Nesne Menüsü"
L["KEYHINT_FREEZEAIR"] 	= "Nesne Donması"
L["KEYHINT_SPAWNDECOY"] 	= "Yem At"
L["KEYHINT_UNSTUCK"]		= "Sıkışmaktan Kurtulma Tuşu"

L["KEY_LMB"]				= "LMB" -- Sol Fare Tuşu, Kısaltılmış
L["KEY_RMB"]				= "RMB" -- Sağ Fare Tuşu, Kısaltılmış

L["MISC_TEAM_NAME"]		= "%s TAKIMI" -- NESNELER, AVCILAR, ama bir cümlede.
L["NOTIFY_HEADER_TITLE"]	= "Oyun Ayarları"

-- Revision 14/09/2022
L["PHXM_MV_CHANGEMAP_NOPLAYER"]	= "Sunucuda oyuncu kalmayınca haritayı değiştir?"

L["KEY_MIDCLICK"]        = "OFT"

L["LD_MIDCLICK"]         = "ORTA TUŞ"
L["LD_RIGHTCLICK"]       = "SAĞ TIK"
L["LD_PRESS2SHOOT"]      = "%s Ateş etmek için [%s] tuşuna basın!"

PHX.LANGUAGES[L.code] = L