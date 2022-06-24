local LANG = {}

-- English Section
LANG["zh-CN"]   = {
    -- setting menu
    ["LPS_GENERAL_SETTINGS"]    = "常规设置",
    ["LPS_APPEARANCES"]         = "外观",
    ["LPS_WEAPON_SETTINGS"]     = "最后一物武器设置",
    
    ["LPS_MENU_ENABLE"]         = "启用最后一物",
	["LPS_ENABLE_MUSIC"]		= "最后一物时启用音乐. 需要重开一轮来生效.",
    ["LPS_WEAPON_SELECT"]       = "给予武器 ('random' 或 'name'). 查看下面的武器列表.",
    ["LPS_BTN_WEPLIST"]         = "可用武器列表",
    ["LPS_MINIMUM_PROPS_TEAM"]  = "最后一物触发前所需的最少物品队人数. 最小: 2.",
    
    ["LPS_WEPLIST"]             = "可用武器列表:\n%s\n你可以在控制台使用 'lps_weapon_list' 命令.",
    
	["LPS_SHOW_WEAPON"]			= "使最后一物武器可见", --Todo: Fix Me
    ["LPS_HALO_ENABLE"]         = "在最后一物周围绘制光晕?",
    ["LPS_HALO_SEETHROUGHWALL"] = "光晕效果穿墙?",
    ["LPS_HALO_COLOUR"]         = "最后一物光晕效果颜色 ('rainbow' 或十六进制色码)",
    ["LPS_TRAILS_ENABLE"]       = "在最后一物玩家身后绘制尾迹?",
    ["LPS_TRAILS_COLOUR"]       = "最后一物尾迹颜色 (十六进制色码)",
    ["LPS_TRAIL_TEXTURE"]       = "最后一物玩家尾迹颜色材质",
    
    ["LPS_PLAY_MUSIC"]          = "当最后一物事件开始时播放背景音乐. (只适用于下一曲)",
    ["LPS_CL_DRAW_HALO"]        = "(客户端) 展示/隐藏光晕, 即便服务器启用.",
    
    -- Internal: Weapon Settings
    ["LPS_WEPSET_REV_AMMO"]     = "最后一物左轮弹药. -1=无限制.",
    ["LPS_WEPSET_SMG_AMMO"]     = "最后一物冲锋枪弹药. -1=无限制.",
    
    ["LPS_WEPSET_DAMAGE_REV"]   = "最后一物左轮伤害",
    ["LPS_WEPSET_DAMAGE_SMG"]   = "最后一物冲锋枪伤害",
    ["LPS_WEPSET_DAMAGE_BLAST"] = "最后一物爆炸伤害",
    
    -- More into stuff now.
    ["LASTPROP_ANNOUNCE"]       = "你是最后一物!",
    ["LASTPROP_ANNOUNCE_ALL"]   = "最后一物正在负隅顽抗!",
    
    -- Weapon State
    ["WEAPON_STATE_READY"]      = "就绪",
    ["WEAPON_STATE_RELOAD"]     = "装弹中...",
    ["WEAPON_STATE_OUTOFAMMO"]  = "弹药耗尽",
    ["WEAPON_STATE_UNARMED"]    = "没有武器",
    
    ["WEAPON_AMMO_UNLI"]        = "无限"
}

list.Set("PHX.LanguageInsertion", "[LastPropStanding] Chinese Simplified", LANG)