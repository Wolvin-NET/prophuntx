-- Kindly free to improve the language.

-- Originally written by: 辣雞 | LaGi

local LANG = {}

LANG.code = "zh-TW"

LANG.Name 		 	= "繁體中文"
LANG.NameEnglish	= "Traditional Chinese"
LANG.Author			= "辣雞 | LaGi, Ph.X"
-- Can Accept: String, and Table.
LANG.AuthorURL		= {
     "http://steamcommunity.com/profiles/76561198057744616",
     "https://steamcommunity.com/profiles/76561198034356313"
}

-- Special Section that isn't String-based
LANG.SUICIDEMSG = {  -- Fix me: there was addition text here but feel free to add more.
	"自殺!", -- i believe this was from 9gag joke.
	"神秘的死亡.",
	"離奇的消失.",
	"盲狙自己.",
	"憤怒的彈出去了.",
	"喝醉了.",
	"陣亡. 祝下次好運!",
	"為殺害無辜物品而後悔.",
	"穿越到暗房.",
	"正在努力滅絕.",
	"仆街.",
	"驚慌失措並試圖殺死所有物品.",
	"停手, 找人幫忙.",
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

LANG["PHX_TEAM_CONNECTING"] = "連接"
LANG["PHX_TEAM_PROPS"]		= "物品"
LANG["PHX_TEAM_HUNTERS"] 	= "獵人"
LANG["PHX_TEAM_UNASSIGNED"]	= "未分配" --Fix Me
LANG["PHX_TEAM_SPECTATOR"] 	= "觀眾" --Fix Me

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
LANG["DERMA_SERVER_TAG"]		= "SV" --Fix Me
LANG["DERMA_BOT_TAG"]			= "BOT" -- Fix Me
LANG["DERMA_GAMEMODE_CREDITS"]	= "%s | Version: %s - Rev. %s" -- Fix Me

LANG["CHAT_JOINED"]				= " 已加入 "
LANG["CHAT_JOINEDTHE"]			= " 加入了 "

LANG["CHAT_SWAPBALANCE"]		= "為了平衡隊伍，將 %s 送到 %s 了."
LANG["CHAT_SWAPBALANCEYOU"]		= "你被調過來達到完美的遊戲平衡." -- Smile... for even in death, you have become children of Thanos

-- FRETTA: Splash Starting Screen
LANG["SPASHSCREEN_BY_X"]		= "by %s"	--Fix Me
-- RichTextBox
LANG["HELP_DONATORS_AND_CONTRIBUTORS"]  = "\n\nDonators & Contributors:\n- %s" --Fix Me
-- // END OF FRETTA SECTION \\

LANG["HELP_F1"] 				= [[物品獵殺 (代號) X 計畫.

本計畫製作現代化與可定制的物品獵殺 X.

更多訊息可在以下位置找到:
https://gmodgameservers.com/prophuntx

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

LANG["TEAM_PROPS"]				= LANG["PHX_TEAM_PROPS"]
LANG["TEAM_HUNTERS"]			= LANG["PHX_TEAM_HUNTERS"]

LANG["HUD_ROTLOCK"]				= "物品旋轉: 鎖定"
LANG["HUD_ROTFREE"]				= "物品旋轉: 自由"
LANG["HUD_KILLEDBY"]			= "你被 %s 擊殺"

LANG["HUD_AUTOTAUNT"]			= "在 %d 秒後自動嘲諷"
LANG["HUD_AUTOTAUNT_ALT"]		= "在 %d 中自動嘲諷"

LANG["HUD_TargetID"]			= "玩家: %s (%d%%)" -- Player: <NAME> (<HEALTH>%)

LANG["HUD_BLINDED"]				= "%s將在 %s 秒後釋放"
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
LANG["TM_NOTICE_PLSWAIT"]		= "請等待 %s 秒!" -- fix me: Add " before Random Taunt ends!"
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
-- [[ FIX ME ]] --
LANG["PHXM_VIEW_UPDATE_INFO"]		= "View update info"
LANG["PHXM_CHECK_FOR_UPDATES"]		= "Check for Updates"
LANG["PHXM_UPDATE_FOUND_TEXT"]		= "Update has been checked. Please check on the Console for more information.\n\nWould you like to view update what's new?"
LANG["PHXM_UPDATE_FOUND_TITLE"]   	= "Update Information"
LANG["PHXM_UPDATE_FOUND_BUTTON"]   	= "View Updates"
LANG["UPDATE_NOTIFY_MSG_NOTFOUND"]	= "No update was found. Please click on 'Check for Updates' button first!"
LANG["UPDATE_NOTIFY_MSG_TITLE"]		= "No updates found"
LANG["UPDATE_NOTIFY_WINDOW_TITLE"]	= "Update Notice"
LANG["UPDATE_RTBOX_APPEND"]			= "\n\nFor your information:\nCurrently you are using version: %s with Revision: %s"
LANG["UPDATE_BTN_SEEFULL"]			= "See Full Changes"
-- [[ FIX ME ]] --
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

--============= LATE ADDITION OF 29.10.21/X2Z. Please Improve your Language Here! =============--

LANG["MISC_GAME_ENDED"]		= "游戲已結束."

--============= LATE ADDITION OF 16.09.21/X2Z. =============--

--[[
	Credits: Late Addition: Revision: 16.09.21/X2Z
]]

LANG["PHXM_ABOUT_BTN_WIKI"]			= "PHX 維基 & 手冊"

--[[
	Auto Taunt: Late Addition: Revision: 16.09.21/X2Z
]]

LANG["HUD_AUTOTAUNT_DISABLED"]		= 	"自動嘲諷已禁用."
LANG["HUD_AUTOTAUNT_WAITFORUPDATE"]	=	"正在同步自動嘲諷..."

--[[
	MapVote: Late Addition: Revision: 16.09.21/X2Z
]]
LANG["PHXM_MV_VOTEROCKED"]				= " 投票已撼動,本輪結束後將開始地圖投票"
LANG["PHXM_MV_VOTEROCKED_IMMINENT"]		= "投票已撼動,即將開始地圖投票"
LANG["PHXM_MV_VOTEROCKED_PLY_TOTAL"]	= "%s 支持撼動投票. ( %d / %d )"

LANG["PHXM_MV_MUST_WAIT"]				= "你必須在投票前等待一段時間!"
LANG["PHXM_MV_VOTEINPROG"]				= "目前正在進行一項投票!"
LANG["PHXM_MV_HAS_VOTED"]				= "你已支持撼動投票!"
LANG["PHXM_MV_ALR_IN_VOTE"]				= "已經通過一項投票,即將更換地圖!"
LANG["PHXM_MV_NEED_MORE_PLY"]			= "你需要更多的玩家來發起撼動投票!"

--[[
	Late Addition: Revision: 16.09.21/X2Z
]]
LANG["PROP_PLAYERMDL_BANNED"]	= "你的自订物品玩家模型被該伺服器封禁."

--[[
	Prop Menu/Prop Chooser, Revision: 16.09.21/X2Z
]]

LANG["PCR_USAGE_UNLIMIT"]		= "[物品選單] 你還有 **無限次** 使用權!"
LANG["PCR_USAGE_COUNT"]			= "[物品選單] 你還有 %d 次使用權!"
LANG["PCR_PLS_WAIT"]			= "[物品選單] 請等待 %d 秒."
LANG["PCR_NOROOM"]				= "[物品選單] 沒有足夠的空間變形該物品!"
LANG["PCR_PROPBANNED"]			= "[物品選單] 該物品已被伺服器封禁."
LANG["PCR_PROPBANNED_BYPCR"]	= "[物品選單] 你不能使用該物品因為其被物品選單禁用."
LANG["PCR_REACHED_LIMIT"]		= "[物品選單] 你已達到限制!"
LANG["PCR_STAY_ON_GROUND"]		= "[物品選單] 你需要站在地上且不能蹲下!"
LANG["PCR_ONLY_GROUP"]			= "[物品選單] 只有特定組別可以打開這個選單!"
LANG["PCR_NOT_EXIST_COUNT"]		= "你選擇的那個物品不存在於這張地圖中! ( %s / 4 )"
LANG["PCR_NOT_EXIST"]			= "你選擇的那個物品不存在於這張地圖中!"

-- PCR Client section, reason why there is a space because of chat.AddText between args.
LANG["PCR_NOTIFY_1"]			= " 本伺服器使用物品選單版本 %s! 類型 "
LANG["PCR_NOTIFY_2"]			= " 在控制台或使用 F1 -> [物品選擇幫助] 選單."
LANG["PCR_CL_DISABLED"]			= " 該功能已禁用."
LANG["PCR_CL_GROUP"]			= " 只有特定組別可以打開這個選單!"
LANG["PCR_CL_LIMIT"]			= " 你已達到限制!"
LANG["PCR_UNLIMIT_TEXT"]		= "無限"
LANG["PCR_WINDOW_TITLE"]		= "PHX 物品選單"
LANG["PCR_HEADER_TOP"]			= "選擇你想要的物品."
LANG["PCR_HEADER_MID"]			= "你還有 %s 次"
LANG["PCR_HEADER_BOTTOM"]		= "物品選擇使用權!"
LANG["PCR_CL_TOOLTIP_BANNED"]	= "你不能使用這個模型."
LANG["PCR_CL_TOOLTIP_MODEL"]	= "模型: %s"
LANG["PCR_CL_MENU_NOTREADY"]	= " 該功能當前不可用."
LANG["PCR_WINDOW_GUIDE_TTL"]	= "快速指南: 物品選單 101"
LANG["PCR_BTN_HELP_MENU"]		= "物品選單幫助"

LANG["PCR_CL_CMDUSEULX"]		= " 該指令已禁用. 請使用 'ulx propmenu'!"
LANG["PCR_CMD_ULX_DISABLED"]	= "指令 ulx propmenu 已禁用. 按下 [物品選單鍵] 來開啟."	--input.GetKeyName is impossible to access.

LANG["PCR_EDT_IN_USE"]			= "一名管理員仍在編輯物品數據. 請稍候!"
LANG["PCR_EDT_ERROR_DISABLED"]	= "[物品選單] 錯誤: 自訂物品添加已被禁用!"
LANG["PCR_EDT_NO_RIGHTS"]		= "你無權訪問該功能."

-- I'm actually exhausted and feel so burned out, but I'll update this in future, or in PH:Zero I guess.
-- Section: Custom Prop Editor File Browser and stuff...
-- LANG["PCR_EDT_XXX"] 	= "todo"
-- LANG["PCR_FB_XXX"] 	= "todo"

--[[
	Admin Section, Revision: 16.09.21/X2Z
]]
LANG["PHXM_PLAYER_PROP_CHOOSER_KEY"]	= "打開物品選單 (物品選擇器) 的默認鍵."
LANG["PHXM_PROP_FREEZE_MIDAIR"]			= "作為物品在空中靜止的默認鍵."
LANG["PHXM_ADMIN_PROP_RIGHT_CLICK"]		= "作為物品時是否能用右鍵嘲諷?"
LANG["PHXM_ADMIN_TAUNT_SCANNER"]		= "(需要重啟地圖) 啟用嘲諷掃描器?"
LANG["PHXM_ADMLBL_USABLE_ENTS"]			= "可用的物品實體類型"
LANG["PHXM_ADMLBL_USABLE_ENTS_REF"]		= "類型可以為: 1: 僅物理, 2: 物理 & 動態, 3: 幾乎所有包括布娃娃, 4: 自訂實體."
LANG["PHXM_ADMIN_USABLE_ENT_TYPE"]		= "用於復制的物品實體類型"
LANG["PHXM_ADMIN_NOTIFY_ENT_TYPE"]		= "按 E 時告知物品玩家無法復制的實體. 僅檔'ph_usable_prop_type' 設置為 3 或 4 時有效.."
LANG["NOTIFY_PROP_ENTTYPE"]				= "按 [E] 來互動, [左鍵] 來復制目標."
LANG["NOTIFY_CUST_ENT_TYPE_IS_ON"]		= "[PHX] 通知: 按 [E] 來互動目標, [左鍵] 來復制目標."

--[[
	Custom Taunts, Revision: 16.09.21/X2Z
]]
LANG["TM_TAUNTS_SEARCH_NOTHING"]		= "未找到包含 '%s' 的嘲諷..."
LANG["TM_SEARCH_PLACEHOLDER"]			= "在該類別種查找: 輸入名字, 小寫且無通配符. 留空=展示所有."

--[[
	Freeze Cam, Revision: 23.09.21/X2Z
]]
LANG["PHXM_ADMIN_FREEZECAM_HUNTER"]			= "開啟獵人隊伍的死亡特寫"


--============= LATE ADDITION OF 10.06.2022/X2Z. =============--

LANG["PHXM_MSG_INPUT_IS_EMPTY"]			= "文本為空或你沒有按回車鍵."
LANG["MISC_SET"]						= "設置"
LANG["MISC_APPLY"]						= "應用"
LANG["MISC_NO"]							= "否"
LANG["MISC_YES"]						= "是"
LANG["MISC_WARN"]						= "警告"
LANG["MISC_ERROR"]						= "錯誤"
LANG["MISC_INFO"]						= "信息"
LANG["MISC_NOTICE"]						= "通知"
LANG["MISC_IDK"]						= "未知"
LANG["MISC_NA"]							= "N/A"

-- HUD
LANG["HUD_DECOY_ACTIVE"]                = "按 [%s]"
LANG["HUD_FAKETAUNT_COUNT"]             = "剩餘 %ix"
LANG["HUD_FAKETAUNT_UNLI"]              = "無限"
LANG["NOTICE_GRENADE_SMG_GIVEN"]        = "你現在獲得了一些 SMG 手雷."

--[[
	ADMIN PANEL, Revision 10.06/2022/X2Z
]]--
LANG["PHXM_TAUNT_SETTINGS"]				= "嘲諷設置"
LANG["PHXM_GENERAL_SETTINGS"]			= "常規設置"
LANG["PHXM_FAKE_TAUNT_SETTINGS"]		= "假嘲諷設置"
LANG["PHXM_FAKE_TAUNT_ENABLE"]			= "允許地圖上的隨機物品進行假嘲諷. 只能通過自訂嘲諷選單使用."
LANG["PHXM_FAKE_TAUNT_MAXUSAGE"]		= "假嘲諷的最多使用次數; -1 為無限制."
LANG["PHXM_TAUNT_RIGHT_CLICK"]		    = "右鍵嘲諷. 這會禁用右鍵自訂選單!"

LANG["PHXM_TAUNT_PITCH_SETTINGS"]		= "嘲諷音調設置"
LANG["PHXM_TAUNT_PITCH_ENABLE"]			= "啟用嘲諷音調"
LANG["PHXM_TAUNT_PITCH_RANGE_MIN"]		= "嘲諷音調的最低閾值. 1 到 99."
LANG["PHXM_TAUNT_PITCH_RANGE_MAX"]		= "嘲諷音調的最高閾值. 100 到 255."

LANG["PHXM_DECOY_SETTINGS"]				= "誘餌設置"
LANG["PHXM_DECOY_ENABLE"]				= "啟用誘餌獎勵? 對活到回合結束的物品僅獎勵一次. 一旦放置就不會增加只會減少."

LANG["PHXM_DISABLE_FOOTSTEP"]           = "切換靜音物品組的腳步聲"

LANG["PHXM_ADMIN_CHATSETTING"]			= "聊天視窗設置"
LANG["PHXM_ADMIN_HUNTERBLIND"]			= "獵人失明控制"

LANG["PHXM_ADMIN_GIVEGRENADE_NEAREND"]  = "是否在回合結束前提供手雷? 若是, 請查看 'ph_give_grenade_roundend_before_time'"
LANG["PHXM_ADMIN_GIVEGRENADE_TIME"]     = "回合結束前提供手雷的秒數. 通常設置為 10 到 30 秒"

--[[
	Plugins in sh_init.lua, Revision 10.06/2022/X2Z
]]--
LANG["PLUG_NAME_VER"]					= "插件: %s | v.%s"
LANG["PLUG_DESCRIPTION"]				= "描述: %s"

--[[
	Taunt Pitch, Revision 10.06/2022/X2Z
]]--
LANG["PHX_CTAUNT_USE_PITCH"]			= "對自訂嘲諷使用音調"
LANG["PHX_CTAUNT_RANDOM_PITCH"]			= "使用嘲諷時隨機音調"
LANG["PHX_RTAUNT_USE_PITCH"]			= "對隨機嘲諷使用音調 [%s]"
LANG["PHX_RTAUNT_RANDOMIZE"]			= "使用隨機嘲諷時隨機音調 [%s]"
LANG["PHX_CTAUNT_PITCH_FOR_FAKE"]		= "對假嘲諷使用音調"
LANG["PHX_CTAUNT_RANDPITCH_FOR_FAKE"]	= "使用假嘲諷時隨機音調"
LANG["PHX_CTAUNT_SLIDER_PITCH"]			= "嘲諷音調滑塊."
LANG["TM_TOOLTIP_FAKETAUNT"]			= "在隨機物品上播放假嘲諷"
LANG["TM_PREFERRED_PITCH"]              = "偏好的嘲諷音調"

--[[
	Fake Taunt, Revision 10.06/2022/X2Z
	Description: Play fake taunts on random props in the map (Not Players)
]]--
LANG["PHX_CTAUNT_ON_RAND_PROPS"]		= "在隨機物品上播放 (%ix)"
LANG["PHX_CTAUNT_ON_RAND_PROPS_UNLI"]	= "在隨機物品上播放"
LANG["PHX_CTAUNT_PLAYED_ON_RANDPROP"]	= "你在隨機物品上播放了一個嘲諷."
LANG["PHX_CTAUNT_RAND_PROPS_LIMIT"]		= "你已達到使用上限!"
LANG["PHX_CTAUNT_RAND_PROPS_NOT_PROP"]  = "當前不可用."
LANG["PHX_CTAUNT_RANDPROP_DISABLED"]	= "假嘲諷目前已被禁用."

--[[
	PH:Z Simple Decoy, Revision 10.06/2022/X2Z
]]--
LANG.DECOY_PROP	= {
	"擊殺了假人!",
	"後悔擊殺了假人.",
	"擊殺了誘餌.",
	"擊殺了一個無辜假人.",
	"尷尬於擊殺了一個假人."
}

LANG["DECOY_PUT_SUCC"]					= "誘餌已放置."
LANG["DECOY_CANT_PUT_HERE"]				= "不能把誘餌放在這里."
LANG["DECOY_GET_REWARD"]				= "恭喜! 你獲得了 ['物品誘餌'] 來活過本輪!"
LANG["DECOY_REMINDER_GET"]              = "你有一個誘餌/假人物品! 放在某處來迷惑獵人吧!"
LANG["DECOY_FRAGS_RECEIVED"]			= "上鉤了: 你從 %s 竊取了一分!"
LANG["DECOY_DISABLED"]					= "誘餌當前不可用."
LANG["PHXM_CL_DECOY_KEYBIND"]			= "放置誘餌的默認鍵. 默認為 1 (不是小鍵盤 1)."

LANG["DECOY_INDICATOR_INVALID"]         = "坡度太陡!"
LANG["DECOY_INDICATOR_TOOFAR"]          = "距離太遠!"
LANG["DECOY_INDICATOR_OK"]              = "放置誘餌 [按 %s]"

LANG["PHXM_DECOY_HEALTH"]				= "誘餌的血量. 默認為 10."
LANG["PHXM_PLAYER_SHOW_DECOY_HELPER"]   = "是否展示誘餌擺放助手? 這會在你的準星旁邊展示一個帶文字的白點."
LANG["PHXM_PLAYER_SHOW_DECOY_MARKER"]   = "是否展示誘餌標記?"

--[[
	Revision 10.06/2022/X2Z
    Prop Menu Update: Menu, Editor, Browser
]]--
LANG["PCR_MODEL_DONT_EXISTS"]   = "對不起, 該模型當前不可用!"

LANG["PCR_PLUG_WARN_MSG"]		= "警告: 自訂物品添加 (pcr_allow_custom) 設置為 0.\n必須啟用此功能才能編輯你的自訂物品!\n更改此設置需要更改地圖."
LANG["PCR_PLUG_LBL_BINDKEY"]	= "改變綁定的按鍵, 切換至 '[玩家] 標簽頁."
LANG["PCR_PLUG_LBL_EDITOR"]		= "自訂物品選單編輯器"
LANG["PCR_PLUG_BTN_OPEN_EDT"]	= "打開編輯器"
LANG["PCR_PLUG_LBL_COMSET"]		= "常見設置"
LANG["PCR_PLUG_LBL_TECHSET"]	= "技術設置"
LANG["PCR_PLUG_LBL_EXPSET"]		= "實驗性"
LANG["PCR_PLUG_LBL_PLAYERSET"]	= "玩家設置"

LANG["PCR_PLUG_ENABLE"]			= "啟用 '物品選單' 功能"
LANG["PCR_PLUG_ALLOW_CUSTOM"]	= "(需要重啟地圖) 允許在物品選單列表中添加自訂物品?"
LANG["PCR_PLUG_PROP_BAN"]		= "(需要重啟地圖) 不將被封禁的物品納入物品選單列表中?"
LANG["PCR_PLUG_USAGE_LIMIT"]	= "玩家使用的最大使用限制. -1 代表無限制."
LANG["PCR_PLUG_PROP_LIMIT"]		= "(需要重啟地圖) 限制物品選單列表中增加的物品數量"
LANG["PCR_PLUG_PROP_LIMITMAX"]	= "可添加到物品選單列表中的最大數量. 注意: 該數值會隨機增加!"
LANG["PCR_PLUG_USE_ULXMENU"]	= "物品選單可否通過控制台 (0) 或 ULX (1) 打開? 綁定的按鍵將遵從此設置"
LANG["PCR_PLUG_USE_DELAY"]		= "玩家在物品選單中使用另一個物品前的延遲秒數"
LANG["PCR_PLUG_KICK_INVALID"]	= "踢掉任何試圖訪問無效模型的用戶 (4x 最大閾值)"
LANG["PCR_PLUG_SPACE_CHECK"]	= "在玩家使用另一個物品之前，檢查房間的空間，以防卡住"
LANG["PCR_PLUG_X_BBOX"]			= "(需要重啟地圖) 在添加到物品選單列表前檢查實體的 BBox 限制"
LANG["PCR_PLUG_X_BBOX_MAX"]		= "BBox 碰撞的最大高度限制. 最小值將自動計算."
LANG["PCR_PLUG_X_BBOX_MIN"]		= "BBox 碰撞的最大寬度限制. 最小值將自動計算."
LANG["PCR_PLUG_ONLY_GROUPS"]	= "物品選單是否只能由某些組別訪問例如捐助者?"
LANG["PCR_PLUG_NOTIFYMSG"]		= "在每輪開始時通知玩家如何使用物品選單"

LANG["PCR_EDITOR_MSG_ERROR"]	= "你的更改由於錯誤而未被保存.\n請檢查你的伺服器控制台!"
LANG["PCR_EDITOR_MSG_SUCC"]		= "您的更改和自訂物品數據已成功保存和更新."

LANG["PHZ_generic_title"]		= "自訂物品收錄編輯"
LANG["PHZ_generic_helptext"]	= [[[使用方法:
[左側面板]
← 選擇一個游戲內容
← 點擊圖標，將模型添加到右側
← 右擊打開上下文菜單

[右側面板]
→ 點擊 '標記' 想要刪除的物品
→ 點擊 '移除選中' 來刪除模型
→ 點擊 '應用篩選' 來完成改動

[信息]
- 你至多能添加 2048 個模型.
- 所有的地圖物品將被自動包括在內，所以你不必添加.
- 點擊 [關閉] 按鈕將取消操作.
- 並非所有模型都有有效的 VPhysics.
- 不是所有的玩家 (包括你的伺服器) 都有自定義模型. 若不存在模型，則其將在應用篩選後被刪除.
- 你的伺服器內容可能與你不同. 如果你在下拉菜單中看到 "<game> [Not Mounted]", 這意味著你還沒有安裝/調試好游戲.
- Addon 文件夾瀏覽尚未實現，所以你必須使用 '所有內容' 來代替.
]]
LANG["PHZ_generic_mdlinfo"] = [[模型信息:
%s
是否有物理: %s]]
LANG["PHZ_generic_mdlinfoStart"] = "(先選擇模型!)"

LANG["PHZ_generic_no_ragdoll"]	= "否: 布娃娃"
LANG["PHZ_generic_titlelabel"]	= "%s 預覽 :"

LANG["PHZ_mount_game_sel"]		= "選擇安裝的游戲 (默認: Garry's Mod)"
LANG["PHZ_input_placeholder1"]	= "查找的文件夾: <文件夾名> or '*', 留空表示所有文件夾."
LANG["PHZ_input_placeholder2"]  = "搜索的擴展: <名字> or '*', 留空表示所有文件夾."
LANG["PHZ_msg_warn_close"]		= "你確定要關閉此視窗嗎? 任何未保存的編輯都將丟失!"
LANG["PHZ_msg_commit"] 			= "你確定要提交修改嗎?"
LANG["PHZ_msg_cant_empty"]		= "物品列表不能為空!"
LANG["PHZ_msg_removesel"] 		= [[移除列表中的選定物品. 圖例:
紅色 = 標記為選中
黃色: 不存在於伺服器且應被刪除的物品.]]
LANG["PHZ_msg_warn_mdlinlist"]  = "警告: 該模型已經在列表中!"
LANG["PHZ_msg_invalid_mdl"] 	= "原因: 這是個無效模型"
LANG["PHZ_apply_select"] 		= "應用 & 保存篩選"
LANG["PHZ_menu_copy"] 		= "復制模型"
LANG["PHZ_menu_refresh"] 	= "刷新模型"
LANG["PHZ_tooltip_removesel"]	= "刪除選中"
LANG["PHZ_tooltip_wasmarked"] = [[該物品被標記是因為它不存在於伺服器中.
如果你關閉編輯器，它將被自動刪除.]]

LANG["PHZ_pcr_fb_allcontent"] = "所有內容 (不是所有的玩家/伺服器都有與你相同的內容)"
LANG["PHZ_pcr_fb_notmounted"] = "%s [未安裝]"

PHX.LANGUAGES[LANG.code] = LANG