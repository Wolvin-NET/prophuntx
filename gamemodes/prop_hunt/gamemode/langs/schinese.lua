-- Kindly free to improve the language.

-- Originally written by: 辣雞 | LaGi

local LANG = {}

LANG.code = "zh-CN"

LANG.Name 		 	= "简体中文"
LANG.NameEnglish	= "Simplified Chinese"
LANG.Author			= "辣雞 | LaGi"
-- Can Accept: String, and Table.
LANG.AuthorURL		= {"http://steamcommunity.com/profiles/76561198057744616"}

-- Special Section that isn't String-based
LANG.SUICIDEMSG = { --> FRETTA
	"自杀!", -- i believe this was from 9gag joke.
	"神秘的死亡.",
	"离奇的消失.",
	"盲狙自己.",
	"愤怒的弹出去了.",
	"醉倒了.",
	"阵亡... 祝下次好运!",
	"把自己给拍没了.",
	"被棍子绊倒了.",
	"死于力量之下.",
	"变成布娃娃了.",
}

LANG.RANDOM_SPECTATORS = { --> FRETTA
	"观看与休息.",
	"看他们闲逛.",
	"看一些东西.",
	" ",
}

-- List of string-based translation

-- // FRETTA SECTION \\
--  FRETTA: Kill text (X killed Y)
LANG["HUD_KILLED"]				= "杀了"

-- FRETTA: HUDs
LANG["HUD_TIME"] 				= "时间"
LANG["HUD_ROUND"]				= "回合"
LANG["HUD_WAITPLY"]				= "正在等待玩家..."
LANG["HUD_DEAD"]				= "(死亡) "

LANG["HUD_TEAMWIN"]				= "%s 胜利!"
LANG["HUD_LOSE"]				= "平手, 大家都是输家!"
LANG["MISC_TIMELEFT"]			= "时间剩余: %s"
LANG["MISC_GAMEEND"] 			= "本回合游戏结束"

-- FRETTA: Team selection screen (F2)
LANG["DERMA_TEAMSELECT"]		= "选择队伍"

-- FRETTA: F1 screeen
LANG["DERMA_RTV"] 				= "投票选择 (RTV)"
LANG["DERMA_PHMENU"] 			= "物品猎杀菜单"
LANG["DERMA_CHANGETEAM"]		= "变更队伍"

-- FRETTA: Scoreboard
LANG["DERMA_PLAYER"]			= "(%d 玩家)"	
LANG["DERMA_PLAYERS"]			= "(%d 玩家)"
LANG["DERMA_NAME"]				= "名称"
LANG["DERMA_KILLS"]				= "击杀"
LANG["DERMA_DEATHS"]			= "死亡"
LANG["DERMA_PING"]				= "Ping"

LANG["CHAT_JOINED"]				= " 已加入 "
LANG["CHAT_JOINEDTHE"]			= " 加入了 "

LANG["CHAT_SWAPBALANCE"]		= "为了平衡队伍，将 %s 送到 %s 了."
LANG["CHAT_SWAPBALANCEYOU"]		= "你被调过来达到完美的游戏平衡." -- Smile... for even in death, you have become children of Thanos
-- // END OF FRETTA SECTION \\

LANG["HELP_F1"] 				= [[物品猎杀 (代号) X 专案.

本专案制作现代化与可定制的物品猎杀 X.

更多信息可在以下位置找到:
https://wolvindra.xyz/prophuntx

要查看更多信息、帮助和指南，请按[F1]键，然后点击[物品猎杀菜单]按钮.

版本: ]].. PHX.VERSION ..[[ 修订版: ]].. PHX.REVISION ..[[

祝您玩得开心!]]

-- Important!
LANG["LANGUAGE_CHANGED"]		= "首选语言更改为 %s"

-- internal cl_menutypes section.
LANG["SUBTYPE_PREFERED_LANG"]	= "首选语言"
--LANG["SUBTYPE_TEXTENTRY_?"]	= "???"

-- Events
LANG["EV_PLAYER_CONNECT"]		= "%s 已连接服务器."
LANG["EV_PLAYER_JOINED"]		= "%s 加入了服务器."
LANG["EV_PLAYER_DISCONNECT"]	= "%s 离开了服务器 (原因: %s)"

-- HUD elements
LANG["HUD_HP"]					= "生命"
LANG["HUD_AMMO"] 				= "弹药"	-- obsolete
LANG["HUD_MAGSEC"]				= "弹匣. / 次要." --Magazine Counts (separator) Secondary Magazine Counts

-- !!WEAPON NAMES CANNOT BE TRANSLATED, THEY USE FROM language.GetPhrase THEREFORE IT'S IMPOSSIBLE TO DO.

LANG["TEAM_PROPS"]				= "物品"
LANG["TEAM_HUNTERS"]			= "猎人"

LANG["HUD_ROTLOCK"]				= "物品旋转: 锁定"
LANG["HUD_ROTFREE"]				= "物品旋转: 自由"
LANG["HUD_KILLEDBY"]			= "你被 %s 击杀"

LANG["HUD_AUTOTAUNT"]			= "在 %d 秒后自动嘲讽"
LANG["HUD_AUTOTAUNT_ALT"]		= "在 %d 中自动嘲讽"

LANG["HUD_TargetID"]			= "玩家: %s (%d%%)" -- Player: <NAME> (<HEALTH>%)

LANG["HUD_BLINDED"]				= "猎人将在 %s 秒后行动"
LANG["HUD_UNBLINDED"]			= "准备好了吗，咱们来喽!"

LANG["BLIND_RESPAWN_TEAM"]		= "失明时间内，你在 %d 秒后在 %s队伍中复活."
LANG["BLIND_RESPAWN"]			= "失明时间内，你在 %d 秒后复活."

LANG["MISC_ACCEPT"]				= "接受"
LANG["MISC_OK"]					= "OK"
LANG["MISC_CLOSE"]				= "关闭"
LANG["MISC_PREV"]				= "< 前页"
LANG["MISC_NEXT"]				= "后页 >"
LANG["MISC_ACCESSDENIED"]		= "拒绝访问"

-- Chat messages
LANG["CHAT_NOPLAYERS"]			= "没有足够的玩家使游戏开始!"
LANG["CHAT_SWAP"]				= "队伍已交换!"

LANG["CHAT_SWAPTEAM_WARNING"]   = "你已经变更队伍 %dx (最多 %dx). 之后，不能在变更队伍。"
LANG["CHAT_SWAPTEAM_REVERT"]	= "不能变更到 %s 队伍，因为你超出变更次数."

LANG["CHAT_PROP_NO_ROOM"] 		= "没有足够的空间变更物品!"

-- Notification
LANG["NOTIFY_IN_PROP_TEAM"]		= "你在物品队伍中获得旋转能力! 你可以移动滑鼠来旋转."
LANG["NOTIFY_ROTATE_NOTICE"]	= "你可以按下(默认)[R]键来切换锁定旋转!"

-- Custom Taunt Window
LANG["TM_WARNING_CT_DISABLE"]	= "[PHX - 嘲讽] 警告: 本服务器禁用自订嘲讽."
LANG["TM_NO_TAUNTS"]			= "警告: 在此类别中未找到嘲讽."
LANG["TM_PLAY_ONLY_ALIVE"] 		= "仅能在活着的时候使用自订嘲讽."

LANG["TM_WINDOW_TITLE"]			= "物品猎杀自订嘲讽窗口"
LANG["TM_NOTICE_PLSWAIT"]		= "请稍等 %s 秒!"
LANG["TM_NOTICE_PLAYPREVIEW"]	= "预览嘲讽: %s"

LANG["TM_TOOLTIP_PLAYTAUNT"] 	= "播放嘲讽"
LANG["TM_TOOLTIP_PREVIEW"]		= "预览嘲讽"
LANG["TM_TOOLTIP_PLAYCLOSE"]	= "播放嘲讽并关闭"
LANG["TM_TOOLTIP_PLAYRANDOM"]	= "随机播放嘲讽"
LANG["TM_TOOLTIP_CLOSE"]		= "关闭"
LANG["TM_MENU_CLOSE"]			= "关闭菜单"

LANG["TM_DELAYTAUNT_NOT_EXIST"] = "服务器找不到你选择的嘲讽!"
LANG["TM_DELAYTAUNT_PLSWAIT"]	= "稍等 %s 秒!"

--[[
	PHX Menu window
]]
LANG["PHXM_WINDOW_TITLE"]		= "物品猎杀 X - 高级设置 & 菜单"
LANG["SERVER_INFO_MOTD"]		= "服务器信息 & 规则 [MOTD]"

LANG["PHXM_TAB_HELP"]			= "帮助 & 指南"
LANG["PHXM_TAB_MUTE"]			= "玩家(取消)静音"
LANG["PHXM_TAB_PLAYER"]			= "玩家设置"
LANG["PHXM_TAB_MODEL"] 			= "玩家模型浏览器"
LANG["PHXM_TAB_MODEL_DISABLED"]	= "玩家模型浏览器 (已禁用)"
LANG["PHXM_TAB_ADMIN"]			= "管理员设置"
LANG["PHXM_TAB_ABOUT"]			= "关于物品猎杀 X"
LANG["PHXM_TAB_MAPVOTE"]		= "地图投票"

LANG["PHXM_CVAR_CHANGED"]		= "[设置] CVar %q 已更改为 %q"

--[[
	Player Mute Settings
]]
LANG["PHXM_MUTE_SELECT"]		= "选择你想要禁音的玩家."

--[[ 
	Player Settings
]]
LANG["PHXM_PLAYER_OPTIONS"]		= "玩家选项"
LANG["PHXM_PLAYER_LANG"]		= "语言"
LANG["PHXM_PLAYER_BIND"]		= "绑定"
LANG["PHXM_PLAYER_HUDSETTINGS"]	= "HUD设置"

LANG["PHXM_PLAYER_TAUNT_KEY"]			= "随机嘲讽按键"
LANG["PHXM_PLAYER_TAUNTWINDOW_KEY"]		= "嘲讽菜单按键"
LANG["PHXM_PLAYER_ROTATLOCK_KEY"]		= "旋转锁定按键"

LANG["PHXM_PLAYER_TOGGLE_HALOS"]		= "切换选择物品时的光晕效果"
LANG["PHXM_PLAYER_IDNAMES"]				= "显示队伍玩家名称(穿透墙壁可见)"
LANG["PHXM_PLAYER_ENDROUND_CUE"]		= "播放回合结束声音提示"
LANG["PHXM_PLAYER_TAUNTMENU_AUTOCLOSE"]	= "双击嘲讽视窗时自动关闭选项"
LANG["PHXM_PLAYER_SEE_HUNTER_LINE"]		= "在猎人身上画线，在旁观模式下可见猎人的目标"
LANG["PHXM_PLAYER_SEE_LBALL_ICONS"]		= "生成 '幸运球' 图标后将其显示"
LANG["PHXM_PLAYER_SEE_CRYSTAL_ICONS"]	= "生成 '恶魔球' 图标后将其显示"

LANG["PHXM_PLAYER_USE_NEW_HUD"]			= "使用新PH: 增强HUD"
LANG["PHXM_PLAYER_SHOW_TUTOR"]			= "显示教程弹出视窗 (每个物品生程仅显是2x)"
LANG["PHXM_PLAYER_USE_NEW_CROSSHAIR"]	= "开启自订准心"
LANG["PHXM_PLAYER_SHOW_TEAM_TOPBAR"]	= "左上角显示还活着的玩家栏(至少显示4位玩家)"

--[[
	Player model Browser Section
]]
LANG["QUERY_MODEL_SELECTED"]	= "将在重生后，变更已选择的模型 %s !"
LANG["QUERY_MODEL_INFO"]		= "模型名称: %s - 适用于: 每个人"

LANG["MDL_MENU_REFRESH"] 		= "刷新图标"
LANG["MDL_MENU_PREVIEW"] 		= "预览模型"
LANG["MDL_MENU_MODELINFO"] 		= "模组信息"


LANG["MISC_APPLYMDL"] 			= "应用模型"

LANG["PHXM_MODEL_DISABLED"] 	= "抱歉喽，本服务器已禁用自订玩家模型"
LANG["PHXM_PLAYERMODEL_SETFOV"]	= "模型视距(FOV)"

--[[
	Server Settings
]]
LANG["PHXM_ADMIN_OPTIONS"]		= "服务端的游戏模式选项 (仅对管理员/所有人可见)"
LANG["PHXM_ADMIN_MUSTALIVE"]	= "你必须在活着的队伍中才能执行此操作"

--[[
	Language Override
]]
LANG["PHXM_ADMIN_LANGOVERRIDE"]	= "语言覆盖"

LANG["PHXM_ADMIN_FORCELANG"] 				= "使用强制语言? 这将会覆盖客户端语言，以使用服务器选择的语言."
LANG["PHXM_ADMIN_LANGTOUSE"]				= "强制语言使用"
LANG["PHXM_ADMIN_PLAYERDEFAULTLANG"] 		= "首次加入游玩时玩家的默认语言"

-- Gameplay settings
LANG["PHXM_ADMIN_CUSTOM_MODEL"]				= "开启猎人自订模型"
LANG["PHXM_ADMIN_CUSTOM_MODEL_PROP"]		= "开启物品自订模型 - 确认也开启猎人自订模型"
LANG["PHXM_ADMIN_TAUNT_DELAY_CUSTOM"]		= "自订嘲讽"
LANG["PHXM_ADMIN_TAUNT_DELAY_RANDOM"]		= "一般嘲讽延迟(秒)"
LANG["PHXM_ADMIN_TAUNT_DELAY_AUTO"]			= "自动嘲讽延迟(秒)"
LANG["PHXM_ADMIN_AUTOTAUNT_ENABLE"]			= "开启自动嘲讽功能"

LANG["PHXM_ADMIN_NOTICE_ROTATION"]			= "在每个物品重生时显示'物品旋转'通知"
LANG["PHXM_ADMIN_CAMERA_COLLIDE"]			= "开启物品镜头的墙壁碰撞"
LANG["PHXM_ADMIN_FREEZECAM"]				= "开启物品队伍的死亡特写"
LANG["PHXM_ADMIN_PROP_COLLIDE"]				= "开启物品与其他物品玩家碰撞"
LANG["PHXM_ADMIN_SWAP_TEAM"] 				= "每轮交换队伍 - 禁用意味着队伍始终不交换"
LANG["PHXM_ADMIN_HUNTER_PENALTY"]			= "猎人生命惩罚"
LANG["PHXM_ADMIN_HUNTER_KILL_BONUS"]		= "猎人击杀红利"
LANG["PHXM_ADMIN_HUNTER_SMG_GRENADES"]		= "猎人冲锋枪榴弹"
LANG["PHXM_ADMIN_GAME_TIME"]				= "总游戏时间(分钟)"
LANG["PHXM_ADMIN_BLINDLOCK_TIME"]			= "猎人失明时间(秒)"
LANG["PHXM_ADMIN_ROUND_TIME"]				= "游戏回合时间(秒)"
LANG["PHXM_ADMIN_ROUNDS_PER_MAP"]			= "每张地图的总游戏回合数"
LANG["PHXM_ADMIN_ENABLE_LUCKYBALL"]			= "允许在易碎的物品上产生幸运球 (机率为8%)"
LANG["PHXM_ADMIN_ENABLE_CRYSTAL"]			= "允许猎人死亡时产生恶魔球 (机率为70%)"
LANG["PHXM_ADMIN_WAIT_PLAYERS"]				= "等待玩家开始游戏"
LANG["PHXM_ADMIN_WAIT_MIN_PLAYERS"]			= "游戏开始前等待的最少玩家数(默认:1)"
LANG["PHXM_ENABLE_PLAYER_JOIN_LEAVE"] 		= "要开启玩家加入或离开的聊天通知吗? 如果你希望使用自己的自订聊天插件，请设置为0."

LANG["PHXM_ADMIN_FORCEJOINBALANCE"]			= "强迫玩家加入后平衡队伍"
LANG["PHXM_ADMIN_ENABLETEAMBALANCE"]		= "在回合开始时自动平衡队伍(队伍平衡)"
LANG["PHXM_ADMIN_PICKUP_PROPS"] 			= "允许捡起小道具吗? 0:不允许; 1:仅猎人 2:仅物品 3:允许所有人"

LANG["PHXM_ADMIN_TAUNTMODES"]			= "嘲讽模式"
LANG["PHXM_ADMIN_TAUNTMODE_MODE"]		= "--[当前嘲讽模式为: %d ]--"
LANG["PHXM_ADMIN_TAUNTMODE0"]			= "模式 [0]: F3/随机嘲讽"
LANG["PHXM_ADMIN_TAUNTMODE1"]			= "模式 [1]: C/自订嘲讽"
LANG["PHXM_ADMIN_TAUNTMODE2"]			= "模式 [2]: 两者模式"
LANG["PHXM_ADMIN_TAUNTSOPEN"]			= "开启嘲讽视口"

LANG["PHXM_MODE_DEFAULT"] 				= "--[ 拾取模式设置为 %d ]--"
LANG["PHXM_MODE0"]						= "模式 [0]: 不允许"
LANG["PHXM_MODE1"]						= "模式 [1]: 仅猎人"
LANG["PHXM_MODE2"]						= "模式 [2]: 仅物品"
LANG["PHXM_MODE3"]						= "模式 [3]: 允许拾取"

--[[
	Admin Developer Sections
]]
LANG["PHXM_ADMIN_DEVSECTION"]		= "开发人员选项/实验功能"
LANG["PHXM_ADMIN_ROOMCHECK"]		= "开启边界检查? 能防止你卡在物体/墙上"
LANG["PHXM_ADMIN_USENEWMKBREN"]		= "对Bren MK II奖励武器使用新模型(需要重启地图)"
LANG["PHXM_ADMIN_BEVERBOSE"]		= "开发人员: 详细 - 开启打印PH:X详细信息和事件吗?"
LANG["PHXM_ADMIN_SHOWPLNAMEHEAD"]	= "开启队伍玩家名称显示在萤幕上."
LANG["PHXM_ADMIN_USESINGLE_FZCAM"]	= "使用单个死亡特写的声音，而不是声音列表(使用'ph_fc_cue_path'来确认定格镜头的声音路径)"
LANG["PHXM_ADMIN_MODELLISTINGTYPE"] = "使用旧版模型清单: 0 = 所有玩家模型(AddValidModel), 1 = 使用旧版: list.Get('PlayerOptionsModel')"
LANG["PHXM_ADMIN_JUMPPOWER"]		= "物品额外弹跳力倍数"
LANG["PHXM_ADMIN_ENABLE_OBB"]		= "开发人员: 从配置数据开启自订物品实体模型边界(OBB)编辑器"
LANG["PHXM_ADMIN_RELOAD_OBB"]		= "开发人员: 每次重新启动时刷新OBB编辑器数据"

--[[
	Experimental & PH:X Features
]]
LANG["PHXM_ADMIN_EXPERIMENTALPHX"]			= "新的PHX实验部分"

LANG["PHXM_ADMIN_HLA_COMBINE"]				= "新增支持半条命:爱莉克斯联合军模型"
LANG["PHXM_ADMIN_TEAMBALANCE"]				= "开启队伍平衡功能"
LANG["PHXM_ADMIN_CHANGETEAM_LIMIT"]			= "使用队伍切换限制器. 设置-1为禁用"
LANG["PHXM_ADMIN_USENEWCHAT"]				= "使用新聊天框(eChat) - 这是临时替换. 如果你有新的聊天框,请取消选取."
LANG["PHXM_ADMIN_NEWCHATPOS"]				= "新聊天框位置: 将高度(Y)减去N个像素."
LANG["PHXM_ADMIN_RESPAWNONBLIND"]			= "允许失明时间重生"
LANG["PHXM_ADMIN_RESPAWNONBLIND_TEAM"]		= "允许特定队伍在失明时间内重生: 0:全部, 1:猎人, 2:物品"
LANG["PHXM_ADMIN_REWSPANTIMEPERCENT"]		= "允许你重生的失明时间百分比. 预设为0.75 (意味着75%最大失明时间)"
LANG["PHXM_ADMIN_ALLOWRESPAWN_SPECTATOR"]	= "分配旁观者时允许在失明时间重生"
LANG["PHXM_ADMIN_ALLOWRESPAWN_TEAMCHANGE"]	= "分配不同队伍时允许在失明时间重生(不建议开启此功能)"

--[[
	MapVote Settings
]]
LANG["PHXM_MV_SETTINGS"]			= "地图投票设置"

LANG["PHXM_MV_ALLOWCURMAP"]			= "允许投票目前地图"
LANG["PHXM_MV_COOLDOWN"]			= "开启地图投票冷却"
LANG["PHXM_MV_USE_ULX_VOTEMAPS"]	= "使用ULX地图投票的地图列表? 否则,使用默认 maps/*.bsp ."
LANG["PHXM_MV_MAPLIMIT"]			= "在地图投票中显示的地图数量"
LANG["PHXM_MV_TIMELIMIT"]			= "投票时作为默认的地图投票时间(秒)."
LANG["PHXM_MV_MAPBEFOREREVOTE"]		= "重新出现地图所需的地图更改数"
LANG["PHXM_MV_RTVCOUNT"]			= "需要多少人才能使用RTV(投票表决)"

LANG["PHXM_MV_EXPLANATION1"]		= "要设置列出相对应的地图，请在控制台中使用(举例)[ mv_mapprefix 'ph_,cs_,de_' ]."
LANG["PHXM_MV_EXPLANATION2"]		= "如果你使用ULX，请使用map_vote. 若不是，请使用mv_start."
LANG["PHXM_MV_EXPLANATION3"]		= "地图投票操作(要取消，需在控制台中输入!unmap_vote(ULX)或mv_stop.)"

LANG["PHXM_MV_START"]		= "开始地图投票"
LANG["PHXM_MV_STOP"]		= "停止地图投票"
--                  			  ^YOU VIOLATED THE LAW!


--[[ 
	Versioning, Credits or About section
]]
LANG["PHXM_ABOUT_VERSIONING"]		= "版本: %s - 修订版: %s"
LANG["PHXM_ABOUT_AUTHOR"]			= "By: %s"
LANG["PHXM_ABOUT_ENJOYING"]			= "如果您喜欢此游戏，请考虑捐赠我们!"
LANG["PHXM_ABOUT_UPDATE"]			= "物品猎杀 X 更新"
LANG["PHXM_ABOUT_LINKS"]			= "连结和名单"
LANG["PHXM_ABOUT_THANKS"]			= "特别感谢支持、建议与贡献:\n %s"
LANG["PHXM_ABOUT_BTN_DONATE"]		= "捐款支持PH:X"
LANG["PHXM_ABOUT_BTN_HOME"]			= "PHX 主页"
LANG["PHXM_ABOUT_BTN_GITHUB"]		= "PHX GitHub 资料库"
LANG["PHXM_ABOUT_BTN_PLUGINS"]		= "PHX 插件/外挂"
LANG["PHXM_ABOUT_BTN_CHANGELOGS"]	= "PHX 变更日志"

--[[
	Late Additionals
]]
-- fretta
LANG["HUD_SPECTATING"]	= "旁观"
LANG["HUD_YOUDIED"]		= "你死了!"

LANG["CHAT_STARTING_MAPVOTE"] = "回合结束. 正在开始地图投票..."

-- This used for HUD Taunt Timer
LANG["HUD_PROP_TAUNT_TIME"]	= "随机嘲讽"
LANG["HUD_PROP_CTAUNT_TIME"] = "自订嘲讽"

LANG["PHXM_TAB_PLUGINS"]				= "插件 & 外挂"

-- Plugins Section
LANG["PLUGINS_NO_PLUGINS"]				= "没有安装插件. 此处浏览更多插件!"
LANG["PLUGINS_BROWSE_MORE"]				= "浏览更多插件!"
LANG["PLUGINS_SERVER_HAS_NO_PLUGINS"]	= "抱歉,本服务器没有自订插件/外挂安装"
LANG["PLUGINS_SERVER_SETTINGS"]			= "-- 服务器设置 --"
LANG["PLUGINS_CLIENT_SETTINGS"]			= "-- 客户端设置 --"

-- Text Entries
LANG["TEXTENTRY_FZ_SINGLE"] = "死亡特写单个声音路径" -- this one is for ph_fc_cue_path command
LANG["TEXTENTRY_MV_PREFIX"] = "地图投票的地图前缀"			 -- the map previx for mv_mapprefix

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