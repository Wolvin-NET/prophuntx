-- Kindly free to improve the language.

-- Originally written by: 辣雞 | LaGi

local LANG = {}

LANG.code = "zh-TW"

LANG.Name 		 	= "繁體中文"
LANG.NameEnglish	= "Traditional Chinese"
LANG.Author			= "辣雞 | LaGi"
-- Can Accept: String, and Table.
LANG.AuthorURL		= {"http://steamcommunity.com/profiles/76561198057744616"}

-- Special Section that isn't String-based
LANG.SUICIDEMSG = { --> FRETTA
	"自殺!", -- i believe this was from 9gag joke.
	"神秘的死亡.",
	"離奇的消失.",
	"盲狙自己.",
	"憤怒的彈出去了.",
	"喝醉了.",
	"陣亡... 祝下次好運!",
	"把自己給拍沒了.",
	"被棍子絆倒了.",
	"死於力量之下.",
	"變成布娃娃了.",
}

LANG.RANDOM_SPECTATORS = { --> FRETTA
	"觀看與休息.",
	"看他們閒逛.",
	"看一些東西.",
	" ",
}

-- List of string-based translation

-- // FRETTA SECTION \\
--  FRETTA: Kill text (X killed Y)
LANG["HUD_KILLED"]				= "殺了"

-- FRETTA: HUDs
LANG["HUD_TIME"] 				= "時間"
LANG["HUD_ROUND"]				= "回合"
LANG["HUD_WAITPLY"]				= "正在等待玩家..."
LANG["HUD_DEAD"]				= "(死亡) "

LANG["HUD_TEAMWIN"]				= "%s 勝利!"
LANG["HUD_LOSE"]				= "平手, 大家都是輸家!"
LANG["MISC_TIMELEFT"]			= "時間剩餘: %s"
LANG["MISC_GAMEEND"] 			= "本回合遊戲結束"

-- FRETTA: Team selection screen (F2)
LANG["DERMA_TEAMSELECT"]		= "選擇隊伍"

-- FRETTA: F1 screeen
LANG["DERMA_RTV"] 				= "投票選擇 (RTV)"
LANG["DERMA_PHMENU"] 			= "物品獵殺選單"
LANG["DERMA_CHANGETEAM"]		= "變更隊伍"

-- FRETTA: Scoreboard
LANG["DERMA_PLAYER"]			= "(%d 玩家)"	
LANG["DERMA_PLAYERS"]			= "(%d 玩家)"
LANG["DERMA_NAME"]				= "名稱"
LANG["DERMA_KILLS"]				= "擊殺"
LANG["DERMA_DEATHS"]			= "死亡"
LANG["DERMA_PING"]				= "Ping"

LANG["CHAT_JOINED"]				= " 已加入 "
LANG["CHAT_JOINEDTHE"]			= " 加入了 "

LANG["CHAT_SWAPBALANCE"]		= "為了平衡隊伍，將 %s 送到 %s 了."
LANG["CHAT_SWAPBALANCEYOU"]		= "你被調過來達到完美的遊戲平衡." -- Smile... for even in death, you have become children of Thanos
-- // END OF FRETTA SECTION \\

LANG["HELP_F1"] 				= [[物品獵殺 (代號) X 計畫.

本計畫製作現代化與可定制的物品獵殺 X.

更多訊息可在以下位置找到:
https://wolvindra.xyz/prophuntx

要查看更多訊息、幫助和指南，請按[F1]鍵，然後點擊[物品獵殺選單]按鈕.

版本: ]].. PHX.VERSION ..[[ 修訂版: ]].. PHX.REVISION ..[[

祝您玩得開心!]]

-- Important!
LANG["LANGUAGE_CHANGED"]		= "首選語言更改為 %s"

-- internal cl_menutypes section.
LANG["SUBTYPE_PREFERED_LANG"]	= "首選語言"
--LANG["SUBTYPE_TEXTENTRY_?"]	= "???"

-- Events
LANG["EV_PLAYER_CONNECT"]		= "%s 已連線伺服器."
LANG["EV_PLAYER_JOINED"]		= "%s 加入了伺服器."
LANG["EV_PLAYER_DISCONNECT"]	= "%s 斷開了伺服器 (原因: %s)"

-- HUD elements
LANG["HUD_HP"]					= "生命"
LANG["HUD_AMMO"] 				= "彈藥"	-- obsolete
LANG["HUD_MAGSEC"]				= "彈匣. / 次要." --Magazine Counts (separator) Secondary Magazine Counts

-- !!WEAPON NAMES CANNOT BE TRANSLATED, THEY USE FROM language.GetPhrase THEREFORE IT'S IMPOSSIBLE TO DO.

LANG["TEAM_PROPS"]				= "物品"
LANG["TEAM_HUNTERS"]			= "獵人"

LANG["HUD_ROTLOCK"]				= "物品旋轉: 鎖定"
LANG["HUD_ROTFREE"]				= "物品旋轉: 自由"
LANG["HUD_KILLEDBY"]			= "你被 %s 擊殺"

LANG["HUD_AUTOTAUNT"]			= "在 %d 秒後自動嘲諷"
LANG["HUD_AUTOTAUNT_ALT"]		= "在 %d 中自動嘲諷"

LANG["HUD_TargetID"]			= "玩家: %s (%d%%)" -- Player: <NAME> (<HEALTH>%)

LANG["HUD_BLINDED"]				= "獵人將在 %s 秒後釋放"
LANG["HUD_UNBLINDED"]			= "準備好了嗎，我們來囉!"

LANG["BLIND_RESPAWN_TEAM"]		= "矇眼時間內，你在 %d 秒後在 %s隊伍中復活."
LANG["BLIND_RESPAWN"]			= "矇眼時間內，你在 %d 秒後復活."

LANG["MISC_ACCEPT"]				= "接受"
LANG["MISC_OK"]					= "OK"
LANG["MISC_CLOSE"]				= "關閉"
LANG["MISC_PREV"]				= "< 上頁"
LANG["MISC_NEXT"]				= "下頁 >"
LANG["MISC_ACCESSDENIED"]		= "拒絕訪問"

-- Chat messages
LANG["CHAT_NOPLAYERS"]			= "沒有足夠的玩家使遊戲開始!"
LANG["CHAT_SWAP"]				= "隊伍已交換!"

LANG["CHAT_SWAPTEAM_WARNING"]   = "你已經變更隊伍 %dx (最多 %dx). 之後，不能在變更隊伍。"
LANG["CHAT_SWAPTEAM_REVERT"]	= "不能變更到 %s 隊伍，因為你超出變更次數."

LANG["CHAT_PROP_NO_ROOM"] 		= "沒有足夠的空間變更物品!"

-- Notification
LANG["NOTIFY_IN_PROP_TEAM"]		= "你在物品隊伍中獲得旋轉能力! 你可以移動滑鼠來旋轉."
LANG["NOTIFY_ROTATE_NOTICE"]	= "你可以按下(預設)[R]鍵來切換鎖定旋轉!"

-- Custom Taunt Window
LANG["TM_WARNING_CT_DISABLE"]	= "[PHX - 嘲諷] 警告: 本伺服器禁用自訂嘲諷."
LANG["TM_NO_TAUNTS"]			= "警告: 在此類別中未找到嘲諷."
LANG["TM_PLAY_ONLY_ALIVE"] 		= "僅能在活著的時候使用自訂嘲諷."

LANG["TM_WINDOW_TITLE"]			= "物品獵殺自訂嘲諷視窗"
LANG["TM_NOTICE_PLSWAIT"]		= "請等待 %s 秒!"
LANG["TM_NOTICE_PLAYPREVIEW"]	= "預覽嘲諷: %s"

LANG["TM_TOOLTIP_PLAYTAUNT"] 	= "播放嘲諷"
LANG["TM_TOOLTIP_PREVIEW"]		= "預覽嘲諷"
LANG["TM_TOOLTIP_PLAYCLOSE"]	= "播放嘲諷並關閉"
LANG["TM_TOOLTIP_PLAYRANDOM"]	= "隨機播放嘲諷"
LANG["TM_TOOLTIP_CLOSE"]		= "關閉"
LANG["TM_MENU_CLOSE"]			= "關閉選單"

LANG["TM_DELAYTAUNT_NOT_EXIST"] = "伺服器找不到你選擇的嘲諷!"
LANG["TM_DELAYTAUNT_PLSWAIT"]	= "等待 %s 秒!"

--[[
	PHX Menu window
]]
LANG["PHXM_WINDOW_TITLE"]		= "物品獵殺 X - 高級設置 & 選單"
LANG["SERVER_INFO_MOTD"]		= "伺服器訊息 & 規則 [MOTD]"

LANG["PHXM_TAB_HELP"]			= "幫助 & 指南"
LANG["PHXM_TAB_MUTE"]			= "玩家(取消)靜音"
LANG["PHXM_TAB_PLAYER"]			= "玩家設定"
LANG["PHXM_TAB_MODEL"] 			= "玩家模型瀏覽器"
LANG["PHXM_TAB_MODEL_DISABLED"]	= "玩家模型瀏覽器 (已禁用)"
LANG["PHXM_TAB_ADMIN"]			= "管理員設定"
LANG["PHXM_TAB_ABOUT"]			= "關於物品獵殺 X"
LANG["PHXM_TAB_MAPVOTE"]		= "地圖投票"

LANG["PHXM_CVAR_CHANGED"]		= "[設置] CVar %q 已更改為 %q"

--[[
	Player Mute Settings
]]
LANG["PHXM_MUTE_SELECT"]		= "選擇你想要禁音的玩家."

--[[ 
	Player Settings
]]
LANG["PHXM_PLAYER_OPTIONS"]		= "玩家選項"
LANG["PHXM_PLAYER_LANG"]		= "語言"
LANG["PHXM_PLAYER_BIND"]		= "綁定"
LANG["PHXM_PLAYER_HUDSETTINGS"]	= "HUD設定"

LANG["PHXM_PLAYER_TAUNT_KEY"]			= "隨機嘲諷按鍵"
LANG["PHXM_PLAYER_TAUNTWINDOW_KEY"]		= "嘲諷選單按鍵"
LANG["PHXM_PLAYER_ROTATLOCK_KEY"]		= "旋轉鎖定按鍵"

LANG["PHXM_PLAYER_TOGGLE_HALOS"]		= "切換選擇物品時的光暈效果"
LANG["PHXM_PLAYER_IDNAMES"]				= "顯示隊伍玩家名稱(穿透牆壁可見)"
LANG["PHXM_PLAYER_ENDROUND_CUE"]		= "播放回合結束聲音提示"
LANG["PHXM_PLAYER_TAUNTMENU_AUTOCLOSE"]	= "雙擊嘲諷視窗時自動關閉選項"
LANG["PHXM_PLAYER_SEE_HUNTER_LINE"]		= "在獵人身上畫線，在觀戰模式下可見獵人的目標"
LANG["PHXM_PLAYER_SEE_LBALL_ICONS"]		= "生成 '幸運球' 圖標後將其顯示"
LANG["PHXM_PLAYER_SEE_CRYSTAL_ICONS"]	= "生成 '惡魔球' 圖標後將其顯示"

LANG["PHXM_PLAYER_USE_NEW_HUD"]			= "使用新PH: 增強HUD"
LANG["PHXM_PLAYER_SHOW_TUTOR"]			= "顯示教程彈出視窗 (每個物品生程僅顯是2x)"
LANG["PHXM_PLAYER_USE_NEW_CROSSHAIR"]	= "開啟自訂準心"
LANG["PHXM_PLAYER_SHOW_TEAM_TOPBAR"]	= "左上角顯示還活著的玩家欄(至少顯示4位玩家)"

--[[
	Player model Browser Section
]]
LANG["QUERY_MODEL_SELECTED"]	= "將在重生後，變更已選擇的模型 %s !"
LANG["QUERY_MODEL_INFO"]		= "模型名稱: %s - 適用於: 每個人"

LANG["MDL_MENU_REFRESH"] 		= "重新載入圖標"
LANG["MDL_MENU_PREVIEW"] 		= "預覽模型"
LANG["MDL_MENU_MODELINFO"] 		= "模組訊息"


LANG["MISC_APPLYMDL"] 			= "套用模型"

LANG["PHXM_MODEL_DISABLED"] 	= "抱歉喽，本伺服器已禁用自訂玩家模型"
LANG["PHXM_PLAYERMODEL_SETFOV"]	= "模型視距(FOV)"

--[[
	Server Settings
]]
LANG["PHXM_ADMIN_OPTIONS"]		= "伺服端的遊戲模式選項 (僅對管理員/所有人可見)"
LANG["PHXM_ADMIN_MUSTALIVE"]	= "你必須在活著的隊伍中才能執行此操作"

--[[
	Language Override
]]
LANG["PHXM_ADMIN_LANGOVERRIDE"]	= "語言覆蓋"

LANG["PHXM_ADMIN_FORCELANG"] 				= "使用強制語言? 這將會覆蓋客戶端語言，以使用伺服器選擇的語言."
LANG["PHXM_ADMIN_LANGTOUSE"]				= "強制語言使用"
LANG["PHXM_ADMIN_PLAYERDEFAULTLANG"] 		= "首次加入遊玩時玩家的默認語言"

-- Gameplay settings
LANG["PHXM_ADMIN_CUSTOM_MODEL"]				= "開啟獵人自訂模型"
LANG["PHXM_ADMIN_CUSTOM_MODEL_PROP"]		= "開啟物品自訂模型 - 確認也開啟獵人自訂模型"
LANG["PHXM_ADMIN_TAUNT_DELAY_CUSTOM"]		= "自訂嘲諷"
LANG["PHXM_ADMIN_TAUNT_DELAY_RANDOM"]		= "一般嘲諷延遲(秒)"
LANG["PHXM_ADMIN_TAUNT_DELAY_AUTO"]			= "自動嘲諷延遲(秒)"
LANG["PHXM_ADMIN_AUTOTAUNT_ENABLE"]			= "開啟自動嘲諷功能"

LANG["PHXM_ADMIN_NOTICE_ROTATION"]			= "在每個物品重生時顯示'物品旋轉'通知"
LANG["PHXM_ADMIN_CAMERA_COLLIDE"]			= "開啟物品鏡頭的牆壁碰撞"
LANG["PHXM_ADMIN_FREEZECAM"]				= "開啟物品隊伍的死亡特寫"
LANG["PHXM_ADMIN_PROP_COLLIDE"]				= "開啟物品與其他物品玩家碰撞"
LANG["PHXM_ADMIN_SWAP_TEAM"] 				= "每輪交換隊伍 - 禁用意味著隊伍始終不交換"
LANG["PHXM_ADMIN_HUNTER_PENALTY"]			= "獵人生命懲罰"
LANG["PHXM_ADMIN_HUNTER_KILL_BONUS"]		= "獵人擊殺紅利"
LANG["PHXM_ADMIN_HUNTER_SMG_GRENADES"]		= "獵人衝鋒槍榴彈"
LANG["PHXM_ADMIN_GAME_TIME"]				= "總遊戲時間(分鐘)"
LANG["PHXM_ADMIN_BLINDLOCK_TIME"]			= "獵人矇眼時間(秒)"
LANG["PHXM_ADMIN_ROUND_TIME"]				= "遊戲回合時間(秒)"
LANG["PHXM_ADMIN_ROUNDS_PER_MAP"]			= "每張地圖的總遊戲回合數"
LANG["PHXM_ADMIN_ENABLE_LUCKYBALL"]			= "允許在易碎的物品上產生幸運球 (機率為8%)"
LANG["PHXM_ADMIN_ENABLE_CRYSTAL"]			= "允許獵人死亡時產生惡魔球 (機率為70%)"
LANG["PHXM_ADMIN_WAIT_PLAYERS"]				= "等待玩家開始遊戲"
LANG["PHXM_ADMIN_WAIT_MIN_PLAYERS"]			= "遊戲開始前等待的最少玩家數(預設值:1)"
LANG["PHXM_ENABLE_PLAYER_JOIN_LEAVE"] 		= "要開啟玩家加入或離開的聊天通知嗎? 如果你希望使用自己的自訂聊天外掛，請設定為0."

LANG["PHXM_ADMIN_FORCEJOINBALANCE"]			= "強迫玩家加入後平衡隊伍"
LANG["PHXM_ADMIN_ENABLETEAMBALANCE"]		= "在回合開始時自動平衡隊伍(隊伍平衡)"
LANG["PHXM_ADMIN_PICKUP_PROPS"] 			= "允許撿起小道具嗎? 0:不允許; 1:只有獵人 2:只有物品 3:允許所有人"

LANG["PHXM_ADMIN_TAUNTMODES"]			= "嘲諷模式"
LANG["PHXM_ADMIN_TAUNTMODE_MODE"]		= "--[當前嘲諷模式為: %d ]--"
LANG["PHXM_ADMIN_TAUNTMODE0"]			= "模式 [0]: F3/隨機嘲諷"
LANG["PHXM_ADMIN_TAUNTMODE1"]			= "模式 [1]: C/自訂嘲諷"
LANG["PHXM_ADMIN_TAUNTMODE2"]			= "模式 [2]: 兩者模式"
LANG["PHXM_ADMIN_TAUNTSOPEN"]			= "開啟嘲諷視窗"

LANG["PHXM_MODE_DEFAULT"] 				= "--[ 拾取模式設定為 %d ]--"
LANG["PHXM_MODE0"]						= "模式 [0]: 不允許"
LANG["PHXM_MODE1"]						= "模式 [1]: 只有獵人"
LANG["PHXM_MODE2"]						= "模式 [2]: 只有物品"
LANG["PHXM_MODE3"]						= "模式 [3]: 允許拾取"

--[[
	Admin Developer Sections
]]
LANG["PHXM_ADMIN_DEVSECTION"]		= "開發人員選項/實驗功能"
LANG["PHXM_ADMIN_ROOMCHECK"]		= "開啟邊界檢查? 能防止你卡在物體/牆壁上"
LANG["PHXM_ADMIN_USENEWMKBREN"]		= "對Bren MK II獎勵武器使用新模型(需要重新啟動地圖)"
LANG["PHXM_ADMIN_BEVERBOSE"]		= "開發人員: 詳細 - 開啟打印PH:X詳細訊息和事件嗎?"
LANG["PHXM_ADMIN_SHOWPLNAMEHEAD"]	= "開啟隊伍玩家名稱顯示在螢幕上."
LANG["PHXM_ADMIN_USESINGLE_FZCAM"]	= "使用獨一死亡特寫的聲音，而不是聲音清單(使用'ph_fc_cue_path'來確認死亡特寫的聲音路徑)"
LANG["PHXM_ADMIN_MODELLISTINGTYPE"] = "使用舊版模型清單: 0 = 所有玩家模型(AddValidModel), 1 = 使用舊版: list.Get('PlayerOptionsModel')"
LANG["PHXM_ADMIN_JUMPPOWER"]		= "物品額外跳躍力倍數"
LANG["PHXM_ADMIN_ENABLE_OBB"]		= "開發人員: 從配置數據開啟自訂物品實體模型邊界(OBB)編輯器"
LANG["PHXM_ADMIN_RELOAD_OBB"]		= "開發人員: 每次重新啟動時重新載入OBB編輯器數據"

--[[
	Experimental & PH:X Features
]]
LANG["PHXM_ADMIN_EXPERIMENTALPHX"]			= "新的PHX實驗部分"

LANG["PHXM_ADMIN_HLA_COMBINE"]				= "新增支援戰慄時空：艾莉克絲合成人模型"
LANG["PHXM_ADMIN_TEAMBALANCE"]				= "開啟隊伍平衡功能"
LANG["PHXM_ADMIN_CHANGETEAM_LIMIT"]			= "使用隊伍切換限制器. 設定-1為禁用 "
LANG["PHXM_ADMIN_USENEWCHAT"]				= "使用新聊天框(eChat) - 這是臨時替換. 如果你有新的聊天框,請取消選取."
LANG["PHXM_ADMIN_NEWCHATPOS"]				= "新聊天框位置: 將高度(Y)減去N個像素."
LANG["PHXM_ADMIN_RESPAWNONBLIND"]			= "允許矇眼時間復活"
LANG["PHXM_ADMIN_RESPAWNONBLIND_TEAM"]		= "允許特定隊伍在矇眼時間內復活: 0:全部, 1:獵人, 2:物品"
LANG["PHXM_ADMIN_REWSPANTIMEPERCENT"]		= "允許你復活的矇眼時間百分比. 預設為0.75 (意味著75%最大矇眼時間)"
LANG["PHXM_ADMIN_ALLOWRESPAWN_SPECTATOR"]	= "分配觀戰者時允許在矇眼時間復活"
LANG["PHXM_ADMIN_ALLOWRESPAWN_TEAMCHANGE"]	= "分配不同隊伍時允許在矇眼時間復活(不建議開啟此功能)"

--[[
	MapVote Settings
]]
LANG["PHXM_MV_SETTINGS"]			= "地圖投票設定"

LANG["PHXM_MV_ALLOWCURMAP"]			= "允許投票目前地圖"
LANG["PHXM_MV_COOLDOWN"]			= "開啟地圖投票冷卻時間"
LANG["PHXM_MV_USE_ULX_VOTEMAPS"]	= "使用ULX地圖投票的地圖清單? 否則,使用預設 maps/*.bsp ."
LANG["PHXM_MV_MAPLIMIT"]			= "在地圖投票中顯示的地圖數量"
LANG["PHXM_MV_TIMELIMIT"]			= "投票時作為預設的地圖投票時間(秒)."
LANG["PHXM_MV_MAPBEFOREREVOTE"]		= "重新出現地圖所需的地圖更改數"
LANG["PHXM_MV_RTVCOUNT"]			= "需要多少人才能使用RTV(投票表決)"

LANG["PHXM_MV_EXPLANATION1"]		= "要設置列出相對應的地圖，請在控制台中使用(舉例)[ mv_mapprefix 'ph_,cs_,de_' ]."
LANG["PHXM_MV_EXPLANATION2"]		= "如果你使用ULX，請使用map_vote. 若不是，請使用mv_start."
LANG["PHXM_MV_EXPLANATION3"]		= "地圖投票操作(要取消，需在控制台中輸入!unmap_vote(ULX)或mv_stop.)"

LANG["PHXM_MV_START"]		= "開始地圖投票"
LANG["PHXM_MV_STOP"]		= "停止地圖投票"
--                  			  ^YOU VIOLATED THE LAW!


--[[ 
	Versioning, Credits or About section
]]
LANG["PHXM_ABOUT_VERSIONING"]		= "版本: %s - 修訂版: %s"
LANG["PHXM_ABOUT_AUTHOR"]			= "By: %s"
LANG["PHXM_ABOUT_ENJOYING"]			= "如果您喜歡此遊戲，請考慮捐贈我們!"
LANG["PHXM_ABOUT_UPDATE"]			= "物品獵殺 X 更新"
LANG["PHXM_ABOUT_LINKS"]			= "連結和名單"
LANG["PHXM_ABOUT_THANKS"]			= "特別感謝支持、建議與貢獻:\n %s"
LANG["PHXM_ABOUT_BTN_DONATE"]		= "捐款支持PH:X"
LANG["PHXM_ABOUT_BTN_HOME"]			= "PHX 主頁"
LANG["PHXM_ABOUT_BTN_GITHUB"]		= "PHX GitHub 資料庫"
LANG["PHXM_ABOUT_BTN_PLUGINS"]		= "PHX 插件/外掛"
LANG["PHXM_ABOUT_BTN_CHANGELOGS"]	= "PHX 變更日誌"

--[[
	Late Additionals
]]
-- fretta
LANG["HUD_SPECTATING"]	= "觀戰"
LANG["HUD_YOUDIED"]		= "你死了!"

LANG["CHAT_STARTING_MAPVOTE"] = "回合結束. 正在開始地圖投票..."

-- This used for HUD Taunt Timer
LANG["HUD_PROP_TAUNT_TIME"]	= "隨機嘲諷"
LANG["HUD_PROP_CTAUNT_TIME"] = "自訂嘲諷"

LANG["PHXM_TAB_PLUGINS"]				= "插件 & 外掛"

-- Plugins Section
LANG["PLUGINS_NO_PLUGINS"]				= "沒有安裝插件. 此處瀏覽更多插件!"
LANG["PLUGINS_BROWSE_MORE"]				= "瀏覽更多插件!"
LANG["PLUGINS_SERVER_HAS_NO_PLUGINS"]	= "抱歉,本伺服器沒有自訂插件/外掛安裝"
LANG["PLUGINS_SERVER_SETTINGS"]			= "-- 伺服器設定 --"
LANG["PLUGINS_CLIENT_SETTINGS"]			= "-- 客戶端設定 --"

-- Text Entries
LANG["TEXTENTRY_FZ_SINGLE"] = "死亡特寫獨一聲音路徑" -- this one is for ph_fc_cue_path command
LANG["TEXTENTRY_MV_PREFIX"] = "地圖投票的地圖前綴"			 -- the map previx for mv_mapprefix

--============= LATE ADDITION OF 16.09.21/X2Z. Please Improve your Language Here! =============--

--[[
	Credits: Late Addition: Revision: 16.09.21/X2Z
]]

LANG["PHXM_ABOUT_BTN_WIKI"]			= "PHX Wiki & Manuals"

--[[
	Auto Taunt: Late Addition: Revision: 16.09.21/X2Z
]]

LANG["HUD_AUTOTAUNT_DISABLED"]		= 	"Auto Taunting is disabled."
LANG["HUD_AUTOTAUNT_WAITFORUPDATE"]	=	"Auto Taunt is Synchronizing..."

--[[
	MapVote: Late Addition: Revision: 16.09.21/X2Z
]]
LANG["PHXM_MV_VOTEROCKED"]				= " The vote has been rocked, map vote will begin on round end"
LANG["PHXM_MV_VOTEROCKED_IMMINENT"]		= "The vote has been rocked, map vote imminent"
LANG["PHXM_MV_VOTEROCKED_PLY_TOTAL"]	= "%s has voted to Rock the Vote. ( %d / %d )"

LANG["PHXM_MV_MUST_WAIT"]				= "You must wait a bit before voting!"
LANG["PHXM_MV_VOTEINPROG"]				= "There is currently a vote in progress!"
LANG["PHXM_MV_HAS_VOTED"]				= "You have already voted to Rock the Vote!"
LANG["PHXM_MV_ALR_IN_VOTE"]				= "There has already been a vote, the map is going to change!"
LANG["PHXM_MV_NEED_MORE_PLY"]			= "You need more players before you can rock the vote!"

--[[
	Late Addition: Revision: 16.09.21/X2Z
]]
LANG["PROP_PLAYERMDL_BANNED"]	= "Your custom Prop Player Model was banned from the server."

--[[
	Prop Menu/Prop Chooser, Revision: 16.09.21/X2Z
]]

LANG["PCR_USAGE_UNLIMIT"]		= "[Prop Menu] You have **unlimitted** usage left!"
LANG["PCR_USAGE_COUNT"]			= "[Prop Menu] You have %d usage left!"
LANG["PCR_PLS_WAIT"]			= "[Prop Menu] Please wait in %d seconds."
LANG["PCR_NOROOM"]				= "[Prop Menu] There is no room to change the prop!"
LANG["PCR_PROPBANNED"]			= "[Prop Menu] This prop was banned by the server."
LANG["PCR_PROPBANNED_BYPCR"]	= "[Prop Menu] You cannot use this prop because it was banned by Prop Menu."
LANG["PCR_REACHED_LIMIT"]		= "[Prop Menu] You have reached the limit!"
LANG["PCR_STAY_ON_GROUND"]		= "[Prop Menu] You need to stay on the ground and not crouching!"
LANG["PCR_ONLY_GROUP"]			= "[Prop Menu] Only certain groups can open this menu!"
LANG["PCR_NOT_EXIST_COUNT"]		= "That prop you have selected does not exists in this map! ( %s / 4 )"
LANG["PCR_NOT_EXIST"]			= "That prop you have selected does not exists in this map!"

-- PCR Client section, reason why there is a space because of chat.AddText between args.
LANG["PCR_NOTIFY_1"]			= " This server use Prop Menu version %s! Type "
LANG["PCR_NOTIFY_2"]			= " in console or use F1 -> [PropChooser Help] menu."
LANG["PCR_CL_DISABLED"]			= " This feature is disabled."
LANG["PCR_CL_GROUP"]			= " Only certain groups can open this menu!"
LANG["PCR_CL_LIMIT"]			= " You have reached the limit!"
LANG["PCR_UNLIMIT_TEXT"]		= "Unlimited"
LANG["PCR_WINDOW_TITLE"]		= "PHX Prop Menu"
LANG["PCR_HEADER_TOP"]			= "Choose any prop you want. You have"
LANG["PCR_HEADER_MID"]			= "%s usage limit"
LANG["PCR_HEADER_BOTTOM"]		= "to use this prop chooser!"
LANG["PCR_CL_TOOLTIP_BANNED"]	= "You cannot use this model."
LANG["PCR_CL_TOOLTIP_MODEL"]	= "Model: %s"
LANG["PCR_CL_MENU_NOTREADY"]	= " This feature is not available at the moment."
LANG["PCR_WINDOW_GUIDE_TTL"]	= "Quick Guide: Prop Menu 101"
LANG["PCR_BTN_HELP_MENU"]		= "Prop Menu Help"

LANG["PCR_CL_CMDUSEULX"]		= " This command is disabled. Use 'ulx propmenu' instead!"
LANG["PCR_CMD_ULX_DISABLED"]	= "Command ulx propmenu is disabled. Press your [Prop Menu Bind] to open."	--input.GetKeyName is impossible to access.

LANG["PCR_EDT_IN_USE"]			= "An admin is still editing the prop data. Please Wait!"
LANG["PCR_EDT_ERROR_DISABLED"]	= "[Prop Menu] Error: Custom Prop Addition is Disabled!"
LANG["PCR_EDT_NO_RIGHTS"]		= "You have no rights to access this feature."

-- I'm actually exhausted and feel so burned out, but I'll update this in future, or in PH:Zero I guess.
-- Section: Custom Prop Editor File Browser and stuff...
-- LANG["PCR_EDT_XXX"] 	= "todo"
-- LANG["PCR_FB_XXX"] 	= "todo"

--[[
	Admin Section, Revision: 16.09.21/X2Z
]]
LANG["PHXM_PLAYER_PROP_CHOOSER_KEY"]	= "Default Key to open Prop Menu (Prop Chooser)."
LANG["PHXM_PROP_FREEZE_MIDAIR"]			= "Default Key to toogle Freeze movement during on midair as a Prop."
LANG["PHXM_ADMIN_PROP_RIGHT_CLICK"]		= "Should Props also able to Taunt by pressing Right Click?"
LANG["PHXM_ADMIN_TAUNT_SCANNER"]		= "(Require Map Restart) Enable Taunt Scanner?"
LANG["PHXM_ADMLBL_USABLE_ENTS"]			= "Usable Prop Entities Types"
LANG["PHXM_ADMLBL_USABLE_ENTS_REF"]		= "Types can be: 1: Physics Only, 2: Physics & Dynamics, 3: Almost Anything inc. Ragdolls, 4: Custom Entities."
LANG["PHXM_ADMIN_USABLE_ENT_TYPE"]		= "Type of Entities to use for Prop to Replicate"
LANG["PHXM_ADMIN_NOTIFY_ENT_TYPE"]		= "Notify Props about entities that cannot be replicated by pressing E. Only works if 'ph_usable_prop_type' is set to 3 or 4."
LANG["NOTIFY_PROP_ENTTYPE"]				= "Press [E] to interact, [Click] to replicate object."
LANG["NOTIFY_CUST_ENT_TYPE_IS_ON"]		= "[PHX] Notice: Press [E] to interact object, Press [Click] to Replicate the object."

--[[
	Custom Taunts, Revision: 16.09.21/X2Z
]]
LANG["TM_TAUNTS_SEARCH_NOTHING"]		= "Taunt containing '%s' was not found..."
LANG["TM_SEARCH_PLACEHOLDER"]			= "Search in this category: Enter word, lowercase & no wildcards. Empty=Show All."

--[[
	Freeze Cam, Revision: 23.09.21/X2Z
]]
LANG["PHXM_ADMIN_FREEZECAM_HUNTER"]			= "Enable Freeze Cam features for team hunters"	-- Todo: Translate Me

-- Add to Language Table.
PHX.LANGUAGES[LANG.code] = LANG