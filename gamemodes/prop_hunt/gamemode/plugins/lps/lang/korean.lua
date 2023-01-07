local LANG = {}

-- English Section
LANG["ko_kr"]   = {
    -- Header Text Group
    ["LPS_GENERAL_SETTINGS"]    = "일반 설정",
    ["LPS_APPEARANCES"]         = "외형",
    ["LPS_WEAPON_SETTINGS"]     = "최근 무기 설정",
	["LPS_WEAPON_DMG_SETTINGS"] = "Last Stands Weapon Damage",
    ["LPS_HEALTH_ARMOR"]        = "Health & Armor Options",
    ["LPS_TRIGGER_CONDITION"]   = "LPS Event Trigger Condition",
    
	-- Appearances & General Settings
    ["LPS_MENU_ENABLE"]         = "사용 가능 프롭",
	["LPS_ENABLE_MUSIC"]		= "LPS 발생 시 음악을 재생합니다. 해당 효과를 적용하려면 라운드 재시작이 필요합니다.",
    ["LPS_WEAPON_SELECT"]       = "무기 지급 ('random' 또는 '무기 이름'). 아래의 목록에서 무기를 확인하세요.", -- 'random' don't have to be translated
    ["LPS_BTN_WEPLIST"]         = "사용 가능 무기 목록",
    ["LPS_MINIMUM_PROPS_TEAM"]  = "LPS 허용 전 팀에 필요한 최소 인원 수: 2.",
	
	["LPS_START_RANDOM"]        = "Whether LPS should be started randomly. (Delayed Start will be overriden)",
    ["LPS_START_DELAYED"]       = "Should LPS be Delayed-Start after X rounds?",
    ["LPS_START_X_ROUNDS"]      = "If Delayed-Start enabled, increment to X rounds to trigger LPS.",
    ["LPS_SET_USEHEALTH"]       = "Should LPS Players STARTS with 100 HP? Changing to other prop doesn't keep the health!",
    ["LPS_SET_USEARMOR"]        = "Should Give LPS Players an Armor? Starts with 100 AP.",
	["LPS_ALLOW_HOLSTER"]		= "Allow Weapon Holstering. This will hide Halo and Trails effect when enabled.",
    
    ["LPS_WEPLIST"]             = "사용 가능 무기 목록:\n%s\n콘솔에'lps_weapon_list'를 입력하시기 바랍니다.",
    
	["LPS_SHOW_WEAPON"]			= "Show Last Prop Standing's Weapon?",
    ["LPS_HALO_ENABLE"]         = "마지막 프롭 주위에 후광 효과를 추가하시겠습니까?",
    ["LPS_HALO_SEETHROUGHWALL"] = "후광 효과가 벽을 통과해서 비추도록 하시겠습니까?",
    ["LPS_HALO_COLOUR"]         = "마지막 프롭에 추가될 후광 효과의 색상 ('rainbow' 또는 헥스 코드)",
    ["LPS_TRAILS_ENABLE"]       = "마지막 프롭 뒤에 기차를 추가하시겠습니까?",
    ["LPS_TRAILS_COLOUR"]       = "마지막 프롭에 추가될 기차의 색상 (헥스 코드)",
    ["LPS_TRAIL_TEXTURE"]       = "마지막 프롭에 추가될 기차 텍스처",
	["LPS_LASER_COLOUR"]        = "Colour for Last Prop Standing's Laser Gun ('rainbow' or hex code)", -- 'rainbow' don't have to be translated
    
    ["LPS_PLAY_MUSIC"]          = "LPS 이벤트 발동 시 배경음악을 재생합니다. (다음 음악만 적용됩니다)",
    ["LPS_CL_DRAW_HALO"]        = "(클라이언트 전용 옵션) 후광 효과 보이기/가리기.",
    
    -- Weapon Settings
    ["LPS_WEPSET_REV_AMMO"]     = "LPS 리볼버 탄약. -1=무제한.",
    ["LPS_WEPSET_SMG_AMMO"]     = "LPS SMG 탄약. -1=무제한.",
	["LPS_WEPSET_AIR_AMMO"]     = "LPS Airboat Gun Ammo. -1=Unlimited",
    ["LPS_WEPSET_SHOT_AMMO"]    = "LPS Shotgun Ammo. -1=Unlimited",
    ["LPS_WEPSET_RPG_AMMO"]     = "LPS RPG Ammo. -1=Unlimited",
    
    ["LPS_WEPSET_DAMAGE_REV"]   = "리볼버 LPS 피해량",
    ["LPS_WEPSET_DAMAGE_SMG"]   = "SMG LPS 피해량",
    ["LPS_WEPSET_DAMAGE_BLAST"] = "블라스터 LPS 피해량",
	["LPS_WEPSET_DAMAGE_AIR"]   = "LPS Damage for Airboat Gun",
    ["LPS_WEPSET_DAMAGE_SHOT"]  = "LPS Damage for Shotgun per 1 Pellet",
    ["LPS_WEPSET_DAMAGE_RPG"]   = "LPS Damage for RPG",
    ["LPS_WEPSET_DAMAGE_LASER"] = "LPS Damage for Laser per 0.1s",
    
    -- More into stuff now.
    ["LASTPROP_ANNOUNCE"]       = "유일하게 살아남은 프롭이 되셨습니다!",
    ["LASTPROP_ANNOUNCE_ALL"]   = "마지막 남은 프롭이 생존 중입니다!",
    
    -- Weapon State
    ["WEAPON_STATE_READY"]      = "준비",
    ["WEAPON_STATE_RELOAD"]     = "재장전중...",
    ["WEAPON_STATE_OUTOFAMMO"]  = "탄약 없음",
    ["WEAPON_STATE_UNARMED"]    = "무기 없음",
	["WEAPON_STATE_HOLSTER"]	= "<HOLSTERED>",
	
	["LPS_HOLSTER_HELPER_TEXT"] = "[CLICK] to Fire - [R-CLICK] to Holster weapon",
    
    ["WEAPON_AMMO_UNLI"]        = "무제한"
}

list.Set("PHX.LanguageInsertion", "[LastPropStanding] Korean", LANG)