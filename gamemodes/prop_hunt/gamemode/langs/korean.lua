-- Kindly free to improve the language.
local LANG = {}

LANG.code = "ko_kr"

LANG.Name = "한국어" -- example: "Bahasa Indonesia"
LANG.NameEnglish = "Korean" -- Your Language but spoken in English, example: "Indonesian"
LANG.Author = "So-chiru, 123rse" -- Only accept STRINGS.
-- Can Accept: String, and Table.
LANG.AuthorURL = {
     "https://steamcommunity.com/profiles/76561198273773489",
	 "https://steamcommunity.com/profiles/76561198097937113"
}

-- Special Section that isn't String-based
LANG.SUICIDEMSG = {  -- Fix me: there was addition text here but feel free to add more.
"님이 자살 당했습니다!'",
"님이 신비해졌습니다.",
 "님이 마법으로 죽었습니다.", 
"님이 저격총을 반대로 쐈습니다.",
"님이 게임을 빡종 당했습니다.",
 "님이 숙취로 돌아가셨습니다.",
"님이 죽었습니다. 다음엔 운이 좋기를 바랍니다!", 
"님이 서있던 바닥이 미끄러웠던 모양입니다.",
"님이 막대기에 걸려 넘어졌습니다.", 
"님이 포스의 힘에 의해 죽었습니다.", 
"님이 죽었습니다. F를 눌러 JOY를 표하십시오.",
"님이 무고한 프롭들을 죽인 죄책감에 시달렸습니다.",
 "님이 백룸으로 사라졌습니다.",
"님이 스스로 멸종을 택했습니다.",
 "님이 죽어어었습니다.",
 "님은 모든 프롭을 죽이는 대신 충격과 공포에 휩싸였습니다.",
"님 게임 그만하시고, 도움을 받으시기 바랍니다.",
"님이 죽어서 물리 엔진 오류를 몸소 체험 중입니다.",
}

LANG.RANDOM_SPECTATORS = { -- > FRETTA
"보면서 쉬려고", 
"게임을 관련하려고",
"헛것을 보려고", 
" ",
}

LANG["PHX_TEAM_CONNECTING"] = "연결중" 
LANG["PHX_TEAM_PROPS"]		= "프롭들이"
LANG["PHX_TEAM_HUNTERS"] 	= "헌터들이"
LANG["PHX_TEAM_UNASSIGNED"]	= "할당되지 않음"  
LANG["PHX_TEAM_SPECTATOR"] 	= "관전자"	

-- List of string-based translation

-- // FRETTA SECTION \\
--  FRETTA: Kill text (X killed Y)
LANG["HUD_KILLED"] = "님이 살해한"

-- FRETTA: HUDs
LANG["HUD_TIME"] = "시간"
LANG["HUD_ROUND"] = "라운드"
LANG["HUD_WAITPLY"] = "플레이어를 기다리는 중..."
LANG["HUD_DEAD"] = "(사망) "

LANG["HUD_TEAMWIN"] = "%s 승리!"
LANG["HUD_LOSE"] = "무승부! 모두 패배했습니다."
LANG["MISC_TIMELEFT"] = "남은 시간: %s"
LANG["MISC_GAMEEND"] = "이 라운드가 종료되면 게임이 끝납니다."

-- FRETTA: Team selection screen (F2)
LANG["DERMA_TEAMSELECT"] = "팀 선택"

-- FRETTA: F1 screeen
LANG["DERMA_RTV"] = "변경 투표 (RTV)"
LANG["DERMA_PHMENU"] = "Prop Hunt 메뉴"
LANG["DERMA_CHANGETEAM"] = "팀 변경"

-- FRETTA: Scoreboard
LANG["DERMA_PLAYER"] = "(%d 플레이어)"
LANG["DERMA_PLAYERS"] = "(%d 플레이어)"
LANG["DERMA_NAME"] = "이름"
LANG["DERMA_KILLS"] = "처치"
LANG["DERMA_DEATHS"] = "사망"
LANG["DERMA_PING"] = "핑"
LANG["DERMA_SERVER_TAG"]		= "서버" 
LANG["DERMA_BOT_TAG"]			= "봇" 
LANG["DERMA_GAMEMODE_CREDITS"]	= "%s | 버전: %s - 수정. %s" 

LANG["CHAT_JOINED"] = " 님이 참가한 "
LANG["CHAT_JOINEDTHE"] = " 님이 참가한 "

LANG["CHAT_SWAPBALANCE"] = "%s 님이 팀 밸런스를 맞추기 위해 %s 팀으로 이동되었습니다."
LANG["CHAT_SWAPBALANCEYOU"] = "팀 밸런스를 맞추기 위해 다른 팀으로 이동되었습니다." -- Smile... for even in death, you have become children of Thanos

-- FRETTA: Splash Starting Screen
LANG["SPASHSCREEN_BY_X"]		= "by %s"	--Fix Me
-- RichTextBox
LANG["HELP_DONATORS_AND_CONTRIBUTORS"]  = "\n\n후원자 & 기여자:\n- %s"
-- // END OF FRETTA SECTION \\

LANG["HELP_F1"] = [[Prop Hunt X 프로젝트

Prop Hunt X를 현대적이고 좀 더 커스텀 가능하도록 만든 프로젝트입니다.

자세한 정보는 아래 링크에서 확인할 수 있습니다.
https://gmodgameservers.com/prophuntx

자세한 도움말 및 가이드를 보시려면, [F1] 키를 누르고 [Prop Hunt 메뉴] 버튼을 클릭하세요.

버전: ]] .. PHX.VERSION .. [[ 수정: ]] .. PHX.REVISION .. [[

맘껏 즐기세요!]]

-- Important!
LANG["LANGUAGE_CHANGED"] = "선호하는 언어를 %s 으(로) 변경했습니다."

-- internal cl_menutypes section.
LANG["SUBTYPE_PREFERED_LANG"] = "선호하는 언어"

-- Events
LANG["EV_PLAYER_CONNECT"] = "%s 님이 서버에 연결했습니다."
LANG["EV_PLAYER_JOINED"] = "%s 님이 서버에 접속했습니다."
LANG["EV_PLAYER_DISCONNECT"] = "%s 님이 서버에서 퇴장했습니다. (%s)"

-- HUD elements
LANG["HUD_HP"] = "체력"
LANG["HUD_AMMO"] = "탄약"
LANG["HUD_MAGSEC"] = "기본무기 탄창. / 보조무기 탄창." -- Magazine Counts (separator) Secondary Magazine Counts

-- !!WEAPON NAMES CANNOT BE TRANSLATED, THEY USE FROM language.GetPhrase THEREFORE IT'S IMPOSSIBLE TO DO.

LANG["TEAM_PROPS"] 		= LANG["PHX_TEAM_PROPS"]
LANG["TEAM_HUNTERS"] 	= LANG["PHX_TEAM_HUNTERS"]

LANG["HUD_ROTLOCK"] = "프롭 회전 : 고정"
LANG["HUD_ROTFREE"] = "프롭 회전 : 자유"
LANG["HUD_KILLEDBY"] = "%s 님에게 죽었습니다"

LANG["HUD_AUTOTAUNT"] = "%d초 후 자동 도발"
LANG["HUD_AUTOTAUNT_ALT"] = "%d 후 자동 도발"

LANG["HUD_TargetID"] = "플레이어: %s (%d%%)" -- Player: <NAME> (<HEALTH>%)

LANG["HUD_BLINDED"] = "%s가 %s초 후에 풀려납니다"
LANG["HUD_UNBLINDED"] = "준비됐든 말든, 시작합니다!"

LANG["BLIND_RESPAWN_TEAM"] = "눈가림 시간 동안 %d초 후에 %s 팀으로 부활되었습니다."
LANG["BLIND_RESPAWN"] = "눈가림 시간 동안 %d초 후에 부활되었습니다."

LANG["MISC_ACCEPT"] = "승인"
LANG["MISC_OK"] = "확인"
LANG["MISC_CLOSE"] = "닫기"
LANG["MISC_PREV"] = "< 이전"
LANG["MISC_NEXT"] = "다음 >"
LANG["MISC_ACCESSDENIED"] = "접근 거부"

-- Chat messages
LANG["CHAT_NOPLAYERS"] = "플레이어가 충분하지 않습니다!"
LANG["CHAT_SWAP"] = "팀을 교대 했습니다!"

LANG["CHAT_SWAPTEAM_WARNING"] =
    "팀을 %dx회 변경하였습니다. (팀 변경 횟수는 최대 %dx회입니다.) 이후에는 상대 팀으로 이동할 수 없습니다."
LANG["CHAT_SWAPTEAM_REVERT"] = "팀 변경 횟수를 초과 했으므로 %s 팀으로 이동 할 수 없습니다."

LANG["CHAT_PROP_NO_ROOM"] = "해당 프롭으로 변경할 공간이 부족합니다!"

-- Notification
LANG["NOTIFY_IN_PROP_TEAM"] =
    "회전이 가능한 프롭 팀에 들어왔습니다. 마우스를 움직여 회전을 할 수 있습니다."
LANG["NOTIFY_ROTATE_NOTICE"] = "또한 (기본값) [R] 키를 눌러 회전 고정을 할 수 있습니다."

-- Custom Taunt Window
LANG["TM_WARNING_CT_DISABLE"] =
    "[PHX - 도발] 주의: 이 서버에서는 커스텀 도발을 사용할 수 없습니다."
LANG["TM_NO_TAUNTS"] = "주의: 이 카테고리에서 도발을 감지하지 못했습니다."
LANG["TM_PLAY_ONLY_ALIVE"] = "살아 있을 때만 커스텀 도발을 할 수 있습니다."

LANG["TM_WINDOW_TITLE"] = "Prop Hunt 커스텀 도발 메뉴"
LANG["TM_NOTICE_PLSWAIT"] = "랜덤 실행되는 도발이 끝날때까지 %s초 동안 기다리세요."
LANG["TM_NOTICE_PLAYPREVIEW"] = "도발 %s 미리보는 중"

LANG["TM_TOOLTIP_PLAYTAUNT"] = "도발 실행"
LANG["TM_TOOLTIP_PREVIEW"] = "도발 미리보기"
LANG["TM_TOOLTIP_PLAYCLOSE"] = "도발 실행 후 닫기"
LANG["TM_TOOLTIP_PLAYRANDOM"] = "랜덤 도발 실행"
LANG["TM_TOOLTIP_CLOSE"] = "닫기"
LANG["TM_MENU_CLOSE"] = "메뉴 닫기"

LANG["TM_DELAYTAUNT_NOT_EXIST"] = "선택한 도발이 서버에 없습니다."
LANG["TM_DELAYTAUNT_PLSWAIT"] = "%s초 동안 기다리세요!"

--[[
	PHX Menu window
]]
LANG["PHXM_WINDOW_TITLE"] = "Prop Hunt X - 고급 설정 & 메뉴"
LANG["SERVER_INFO_MOTD"] = "서버 정보 & 규칙 [MOTD]"

LANG["PHXM_TAB_HELP"] = "도움말 & 가이드"
LANG["PHXM_TAB_MUTE"] = "플레이어 음소거"
LANG["PHXM_TAB_PLAYER"] = "플레이어 설정"
LANG["PHXM_TAB_MODEL"] = "플레이어 모델 브라우저"
LANG["PHXM_TAB_MODEL_DISABLED"] = "플레이어 모델 브라우저 (비활성화)"
LANG["PHXM_TAB_ADMIN"] = "관리자 설정"
LANG["PHXM_TAB_ABOUT"] = "Prop Hunt X 정보"
LANG["PHXM_TAB_MAPVOTE"] = "맵 투표 설정"
LANG["PHXM_TAB_PLUGINS"]		= "애드온 / 플러그인"

LANG["PHXM_CVAR_CHANGED"] = "[설정] CVar %q가 %q으(로) 변경되었습니다."

--[[
	Player Mute Settings
]]
LANG["PHXM_MUTE_SELECT"] = "음소거할 플레이어를 선택하세요."

--[[ 
	Player Settings
]]
LANG["PHXM_PLAYER_OPTIONS"] = "플레이어 옵션"
LANG["PHXM_PLAYER_LANG"] = "언어"
LANG["PHXM_PLAYER_BIND"] = "할당"
LANG["PHXM_PLAYER_HUDSETTINGS"] = "HUD 설정"

LANG["PHXM_PLAYER_TAUNT_KEY"] = "랜덤 도발 키"
LANG["PHXM_PLAYER_TAUNTWINDOW_KEY"] = "도발 메뉴 키"
LANG["PHXM_PLAYER_ROTATLOCK_KEY"] = "회전 고정 키"

LANG["PHXM_PLAYER_TOGGLE_HALOS"] = "프롭 선택 시, 빛이 은은하게 비치는 효과 사용"
LANG["PHXM_PLAYER_IDNAMES"] =
    "같은 팀 플레이어의 머리 위에 이름 표시하기 (벽을 통과해서도 보임)"
LANG["PHXM_PLAYER_ENDROUND_CUE"] = "라운드 종료 효과음 재생"
LANG["PHXM_PLAYER_TAUNTMENU_AUTOCLOSE"] = "도발 창 두 번 클릭하여 자동 닫기"
LANG["PHXM_PLAYER_SEE_HUNTER_LINE"] =
    "관전자 모드에서 헌터의 조준점을 볼 수 있도록 선으로 표시"
LANG["PHXM_PLAYER_SEE_LBALL_ICONS"] = "'행운의 공' 생성 시 아이콘 표시"
LANG["PHXM_PLAYER_SEE_CRYSTAL_ICONS"] = "'악마의 공' 생성 시 아이콘 표시"

LANG["PHXM_PLAYER_USE_NEW_HUD"] = "Prop Hunt X: Enhanced HUD 사용"
LANG["PHXM_PLAYER_SHOW_TUTOR"] = "튜토리얼 팝업 표시 (각 Props 팀 플레이어 부활 시 2회 표시)"
LANG["PHXM_PLAYER_USE_NEW_CROSSHAIR"] = "커스텀 조준선 사용"
LANG["PHXM_PLAYER_SHOW_TEAM_TOPBAR"] =
    "좌측 상단에 생존한 팀 플레이어 전체의 상태 바 표시 (최소 4명의 플레이어가 표시됨)"

--[[
	Player model Browser Section
]]
LANG["QUERY_MODEL_SELECTED"] = "모델 %s 은(는) 다음 부활 시 적용됩니다."
LANG["QUERY_MODEL_INFO"] = "모델명: %s - 전원 사용 가능"

LANG["MDL_MENU_REFRESH"] = "아이콘 새로고침"
LANG["MDL_MENU_PREVIEW"] = "모델 미리보기"
LANG["MDL_MENU_MODELINFO"] = "모델 정보"

LANG["MISC_APPLYMDL"] = "모델 적용"

LANG["PHXM_MODEL_DISABLED"] =
    "저런, 이 서버는 사용자 지정 플레이어 모델 사용이 비활성화되어 있습니다!"
LANG["PHXM_PLAYERMODEL_SETFOV"] = "  모델 FOV 설정"

--[[
	Server Settings
]]
LANG["PHXM_ADMIN_OPTIONS"] = "서버 측 게임 모드 옵션 (관리자 / 소유자에게만 표시됨)"
LANG["PHXM_ADMIN_MUSTALIVE"] = "이 작업을 수행하려면 생존해 있어야 합니다."

--[[
	Language Override
]]
LANG["PHXM_ADMIN_LANGOVERRIDE"] = "언어 덮어 쓰기"

LANG["PHXM_ADMIN_FORCELANG"] =
    "언어 강제를 활성화 하시겠습니까? 활성 시 모든 유저는 서버에서 선택한 언어를 사용하도록 제한됩니다."
LANG["PHXM_ADMIN_LANGTOUSE"] = "언어 강제 활성화."
LANG["PHXM_ADMIN_PLAYERDEFAULTLANG"] = "처음 참가한 플레이어가 사용할 기본 언어"

-- Gameplay settings
LANG["PHXM_ADMIN_CUSTOM_MODEL"] = "헌터팀의 사용자 지정 모델 활성화"
LANG["PHXM_ADMIN_CUSTOM_MODEL_PROP"] =
    "프롭팀의 사용자 지정 모델 활성화 - 헌터팀도 활성화 해야합니다."
LANG["PHXM_ADMIN_TAUNT_DELAY_CUSTOM"] = "사용자 지정 도발 지연 시간 (초)"
LANG["PHXM_ADMIN_TAUNT_DELAY_RANDOM"] = "일반 도발 지연 시간 (초)"
LANG["PHXM_ADMIN_TAUNT_DELAY_AUTO"] = "자동 도발 지연 시간 (초)"
LANG["PHXM_ADMIN_AUTOTAUNT_ENABLE"] = "자동 도발 기능 활성화"

LANG["PHXM_ADMIN_NOTICE_ROTATION"] = "프롭으로 부활할 때 마다 '프롭 회전' 알림 표시"
LANG["PHXM_ADMIN_CAMERA_COLLIDE"] = "벽에 접촉 시 Prop 팀 카메라 활성화"
LANG["PHXM_ADMIN_FREEZECAM"] = "프롭팀의 고정 카메라 기능 활성화"
LANG["PHXM_ADMIN_FREEZECAM_HUNTER"] = "헌터팀의 고정 카메라 기능 활성화"
LANG["PHXM_ADMIN_PROP_COLLIDE"] = "다른 프롭팀 플레이어와 충돌 활성화"
LANG["PHXM_ADMIN_SWAP_TEAM"] = "매 라운드마다 팀 교대 - 비활성시 팀이 계속 유지됩니다."
LANG["PHXM_ADMIN_HUNTER_PENALTY"] = "헌터 체력 패널티"
LANG["PHXM_ADMIN_HUNTER_KILL_BONUS"] = "헌터 처치 보너스"
LANG["PHXM_ADMIN_HUNTER_SMG_GRENADES"] = "헌터 SMG 수류탄"
LANG["PHXM_ADMIN_GAME_TIME"] = "(맵 재시작 필요) 총 게임 시간 (분)"
LANG["PHXM_ADMIN_BLINDLOCK_TIME"] = "헌터 눈가림 시간 (초)"
LANG["PHXM_ADMIN_ROUND_TIME"] = "(맵 재시작 필요) 게임 라운드 시간 (초)"
LANG["PHXM_ADMIN_ROUNDS_PER_MAP"] = "(맵 재시작 필요) 맵당 총 게임 라운드"
LANG["PHXM_ADMIN_ENABLE_LUCKYBALL"] = "파괴 가능한 프롭에 행운의 공이 생성되도록 허용 (8% 확률)"
LANG["PHXM_ADMIN_ENABLE_CRYSTAL"] = "헌터가 죽을 때 악마 공이 생성되도록 허용 (100% 확률)"
LANG["PHXM_ADMIN_WAIT_PLAYERS"] = "플레이어가 게임 플레이를 시작할 때까지 기다리기"
LANG["PHXM_ADMIN_WAIT_MIN_PLAYERS"] = "게임 시작 전에 기다려야하는 최소 플레이어 수 (기본값 : 1)"
LANG["PHXM_ENABLE_PLAYER_JOIN_LEAVE"] =
    "플레이어 참가 및 퇴장에 대한 채팅 알림을 활성화 하시겠습니까? 사용자 지정 채팅 애드온을 사용하려면 0으로 설정하세요."

LANG["PHXM_ADMIN_FORCEJOINBALANCE"] = "플레이어 참가 시 팀을 강제로 균등하게 만들기"
LANG["PHXM_ADMIN_ENABLETEAMBALANCE"] = "라운드 시작 시 팀을 자동으로 균등하게 만들기 (팀 밸런스)"
LANG["PHXM_ADMIN_PICKUP_PROPS"] =
    "소형 프롭을 픽업하도록 하시겠습니까? 0: 비허용, 1: 헌터팀 허용, 2: 프롭팀 허용, 3: 모두 허용"

LANG["PHXM_ADMIN_TAUNTMODES"] = "도발 모드"
LANG["PHXM_ADMIN_TAUNTMODE_MODE"] = "--[ 현재 도발 모드는 %d 입니다. ]--"
LANG["PHXM_ADMIN_TAUNTMODE0"] = "모드 [0]: F3/무작위 도발"
LANG["PHXM_ADMIN_TAUNTMODE1"] = "모드 [1]: C/사용자 지정 도발"
LANG["PHXM_ADMIN_TAUNTMODE2"] = "모드 [2]: 전체 모드"
LANG["PHXM_ADMIN_TAUNTSOPEN"] = "도발 창 열기"

LANG["PHXM_MODE_DEFAULT"] = "--[ 현재 픽업 모드는 %d 입니다. ]--"
LANG["PHXM_MODE0"] = "모드 [0]: 비허용"
LANG["PHXM_MODE1"] = "모드 [1]: 헌터팀 허용"
LANG["PHXM_MODE2"] = "모드 [2]: 프롭팀 허용"
LANG["PHXM_MODE3"] = "모드 [3]: 픽업 허용"

--[[
	Admin Developer Sections
]]
LANG["PHXM_ADMIN_DEVSECTION"] = "개발자 옵션 / 실험 기능"
LANG["PHXM_ADMIN_ROOMCHECK"] = "경계 확인을 활성화 할까요? 활성 시 물체나 벽에 끼이는 것을 방지 해줍니다."
LANG["PHXM_ADMIN_USENEWMKBREN"] = "Bren MK II 보너스 무기에 신형 모델 사용 (맵 재시작 필요)"
LANG["PHXM_ADMIN_BEVERBOSE"] = "개발자: Be Verbose 모드 활성화 - Prop Hunt X의 내부 정보 및 이벤트를 표시하도록 설정"
LANG["PHXM_ADMIN_SHOWPLNAMEHEAD"] = "플레이어 팀 이름이 화면에 표시되도록 하기."
LANG["PHXM_ADMIN_USESINGLE_FZCAM"] =
    "사운드 목록 대신 단일 고정 카메라 사운드 사용 ('ph_fc_cue_path'를 사용하여 고정 카메라 사운드 경로 확인)"
LANG["PHXM_ADMIN_MODELLISTINGTYPE"] =
    "이전 모델 목록 사용 : 0 = 모든 플레이어 모델 사용 (AddValidModel), 1 = 이전 모델 사용 : list.Get('PlayerOptionsModel')"
LANG["PHXM_ADMIN_JUMPPOWER"] = "프롭 팀에 추가 점프력 증폭"
LANG["PHXM_ADMIN_ENABLE_OBB"] =
    "개발자 : 구성 데이터에서 사용자 정의된 프롭 엔티티 모델 경계 (OBB) 수정자 활성화"
LANG["PHXM_ADMIN_RELOAD_OBB"] = "개발자: 매 라운드 재시작마다 OBB 수정자 데이터 불러오기"

--[[
	Experimental & PH:X Features
]]
LANG["PHXM_ADMIN_EXPERIMENTALPHX"] = "새 Prop Hunt X 실험 섹션"

LANG["PHXM_ADMIN_HLA_COMBINE"] = "HL: Alyx 콤바인 모델 지원 추가"
LANG["PHXM_ADMIN_TEAMBALANCE"] = "팀 밸런스 설정"
LANG["PHXM_ADMIN_CHANGETEAM_LIMIT"] = "팀 교체 제한 설정. -1 로 비활성화 할 수 있습니다. "
LANG["PHXM_ADMIN_USENEWCHAT"] =
    "새 채팅 박스 사용 (eChat) - 임시 방편으로 넣은 기능입니다. 이미 있으시다면 체크 해제하세요."
LANG["PHXM_ADMIN_NEWCHATPOS"] = "새 채팅 박스 위치 : 높이 (Y) 위치에서 N 픽셀만큼 뺍니다."
LANG["PHXM_ADMIN_RESPAWNONBLIND"] = "눈가림 시간에 부활 허용"
LANG["PHXM_ADMIN_RESPAWNONBLIND_TEAM"] =
    "눈가림 시간 중 특정 팀만 부활 허용: 0: 전체, 1: 헌터팀, 2: 프롭팀"
LANG["PHXM_ADMIN_REWSPANTIMEPERCENT"] =
    "눈가림 시간 중 부활할 수 있는 시간 퍼센트. 기본 값은 0.75 입니다. (이는 75%에 해당합니다. * 최대 눈가림 시간)"
LANG["PHXM_ADMIN_ALLOWRESPAWN_SPECTATOR"] = "관전 팀으로 배정 시 눈가림 시간에 부활 허용"
LANG["PHXM_ADMIN_ALLOWRESPAWN_TEAMCHANGE"] =
    "다른 팀으로 배정 시 눈가림 시간에 부활 허용 (비활성화 하는 것을 권장합니다.)"

--[[
	MapVote Settings
]]
LANG["PHXM_MV_SETTINGS"] = "맵 투표 설정"

LANG["PHXM_MV_ALLOWCURMAP"] = "현재 맵을 투표할 수 있도록 허용"
LANG["PHXM_MV_COOLDOWN"] = "맵 쿨다운 투표 활성화"
LANG["PHXM_MV_USE_ULX_VOTEMAPS"] = "ULX 맵 투표에서 목록을 사용 하시겠습니까? 사용하지 않으면 기본 maps/*.bsp 맵이 사용됩니다."
LANG["PHXM_MV_MAPLIMIT"] = "맵 투표에 선정되는 맵의 갯수."
LANG["PHXM_MV_TIMELIMIT"] = "투표 시 주어지는 기본 맵 투표 시간 (초)."
LANG["PHXM_MV_MAPBEFOREREVOTE"] = "맵이 다시 나올때까지 필요한 맵 변경 횟수"
LANG["PHXM_MV_RTVCOUNT"] = "RTV (Rock the Vote)를 사용하는 데 필요한 플레이어 수"

LANG["PHXM_MV_EXPLANATION1"] =
    "어느 맵을 목록에 표시할지 지정하려면, 다음을 콘솔에 입력하시기 바랍니다. (예시) [ mv_mapprefix 'ph_,cs_,de_' ]"
LANG["PHXM_MV_EXPLANATION2"] =
    "ULX를 사용하는 경우 map_vote를 입력하시고, 그렇지 않은 경우 mv_start를 입력하세요."
LANG["PHXM_MV_EXPLANATION3"] =
    "맵 투표 활동 (취소하려면 !unmap_vote (ULX) 또는 mv_stop을 콘솔에 입력하세요.)"

LANG["PHXM_MV_START"] = "맵 투표 시작"
LANG["PHXM_MV_STOP"] = "맵 투표 중지"
--                  			  ^YOU VIOLATED THE LAW!

--[[ 
	Versioning, Credits or About section
]]
LANG["PHXM_ABOUT_VERSIONING"] = "버전: %s - Rev: %s"
LANG["PHXM_ABOUT_AUTHOR"] = "제작: %s"
LANG["PHXM_ABOUT_ENJOYING"] = "게임모드가 재미있으셨다면 후원하는 것도 잊지마세요!"
LANG["PHXM_ABOUT_UPDATE"] = "Prop Hunt X 업데이트"
-- [[ FIX ME ]] --
LANG["PHXM_VIEW_UPDATE_INFO"]		= "업데이트 정보 보기"
LANG["PHXM_CHECK_FOR_UPDATES"]		= "업데이트 확인"
LANG["PHXM_UPDATE_FOUND_TEXT"]		= "업데이트가 확인되었습니다. 더 자세한 정보는 콘솔을 통해 확인하시기 바랍니다.\n\n업데이트를 통해 무엇이 달라졌는지 확인하시겠습니까?"
LANG["PHXM_UPDATE_FOUND_TITLE"]   	= "업데이트 정보"
LANG["PHXM_UPDATE_FOUND_BUTTON"]   	= "업데이트 보기"
LANG["UPDATE_NOTIFY_MSG_NOTFOUND"]	= "업데이트를 찾을 수 없습니다. '업데이트 확인' 버튼을 먼저 클릭하세요!"
LANG["UPDATE_NOTIFY_MSG_TITLE"]		= "업데이트를 찾을 수 없습니다."
LANG["UPDATE_NOTIFY_WINDOW_TITLE"]	= "업데이트 공지"
LANG["UPDATE_RTBOX_APPEND"]			= "\n\n참고사항:\n현재 사용중인 버전: %s 및 수정: %s"
LANG["UPDATE_BTN_SEEFULL"]			= "변경사항 전체보기"
-- [[ FIX ME ]] --
LANG["PHXM_ABOUT_LINKS"] = "링크 및 제작자"
LANG["PHXM_ABOUT_THANKS"] = "후원, 아이디어 제공 및 기여에 도움주신 다음 분들께 감사드립니다.\n%s"
LANG["PHXM_ABOUT_BTN_DONATE"] = "PH:X를 후원으로 도와주세요"
LANG["PHXM_ABOUT_BTN_HOME"] = "PHX 홈페이지"
LANG["PHXM_ABOUT_BTN_GITHUB"] = "PHX GitHub 저장소"
LANG["PHXM_ABOUT_BTN_PLUGINS"] = "PHX 에드온/플러그인"
LANG["PHXM_ABOUT_BTN_CHANGELOGS"] = "PHX 변경 사항"

--[[
	Late Additionals
]]
-- fretta
LANG["HUD_SPECTATING"] = "관전 중"
LANG["HUD_YOUDIED"] = "죽었습니다!"

LANG["CHAT_STARTING_MAPVOTE"] = "라운드가 종료되었습니다. 맵 투표를 시작합니다..."

-- This used for HUD Taunt Timer
LANG["HUD_PROP_TAUNT_TIME"] = "랜덤 도발"
LANG["HUD_PROP_CTAUNT_TIME"] = "사용자 지정 도발"

-- Plugins Section
LANG["PLUGINS_NO_PLUGINS"] = "플러그인이 없습니다. 여기서 플러그인을 찾아보세요!"
LANG["PLUGINS_BROWSE_MORE"] = "더 많은 플러그인 찾아보기"
LANG["PLUGINS_SERVER_HAS_NO_PLUGINS"] =
    "죄송합니다, 이 서버에는 사용자 지정 애드온 / 플러그인이 설치되어 있지 않습니다."
LANG["PLUGINS_SERVER_SETTINGS"] = "-- 서버 설정 --"
LANG["PLUGINS_CLIENT_SETTINGS"] = "-- 클라이언트 설정 --"

-- Text Entries
LANG["TEXTENTRY_FZ_SINGLE"] = "고정 카메라 단일 사운드 경로" -- this one is for ph_fc_cue_path command
LANG["TEXTENTRY_MV_PREFIX"] = "맵 투표 맵 접두사" -- the map previx for mv_mapprefix

--============= LATE ADDITION OF 29.10.21/X2Z. Please Improve your Language Here! =============--

LANG["MISC_GAME_ENDED"]		= "게임이 종료되었습니다."

--============= LATE ADDITION OF 16.09.21/X2Z. =============--

--[[
	Credits: Late Addition: Revision: 16.09.21/X2Z
]]

LANG["PHXM_ABOUT_BTN_WIKI"]			= "PHX 위키 및 메뉴얼"

--[[
	Auto Taunt: Late Addition: Revision: 16.09.21/X2Z
]]

LANG["HUD_AUTOTAUNT_DISABLED"]		= 	"자동 도발이 비활성화되었습니다."
LANG["HUD_AUTOTAUNT_WAITFORUPDATE"]	=	"자동 도발 동기화 중..."

--[[
	MapVote: Late Addition: Revision: 16.09.21/X2Z
]]
LANG["PHXM_MV_VOTEROCKED"]				= " 투표 진행이 결정되었습니다. 라운드가 끝나면 맵 투표가 시작됩니다."
LANG["PHXM_MV_VOTEROCKED_IMMINENT"]		= "투표 진행이 결정되었습니다. 곧 맵 투표가 시작됩니다."
LANG["PHXM_MV_VOTEROCKED_PLY_TOTAL"]	= "%s님이 투표 진행에 표를 던졌습니다. ( %d / %d )"

LANG["PHXM_MV_MUST_WAIT"]				= "투표를 하려면 잠시 기다려 주시기 바랍니다!"
LANG["PHXM_MV_VOTEINPROG"]				= "현재 진행 중인 투표가 있습니다!"
LANG["PHXM_MV_HAS_VOTED"]				= "이미 투표 진행에 표를 던졌습니다!"
LANG["PHXM_MV_ALR_IN_VOTE"]				= "이미 투표가 진행되어, 곧 맵이 변경됩니다!"
LANG["PHXM_MV_NEED_MORE_PLY"]			= "투표를 진행하려면 더 많은 플레이어가 필요합니다!"

--[[
	Late Addition: Revision: 16.09.21/X2Z
]]
LANG["PROP_PLAYERMDL_BANNED"]	= "사용자 지정 프롭 모델이 서버에서 금지되었습니다."

--[[
	Prop Menu/Prop Chooser, Revision: 16.09.21/X2Z
]]

LANG["PCR_USAGE_UNLIMIT"]		= "[프롭 메뉴] 사용 한도가 없는 **무제한**입니다!"
LANG["PCR_USAGE_COUNT"]			= "[프롭 메뉴] 사용 한도가 %d 남았습니다!"
LANG["PCR_PLS_WAIT"]			= "[프롭 메뉴] %d 초 동안 기다리시기 바랍니다."
LANG["PCR_NOROOM"]				= "[프롭 메뉴] 해당 프롭으로 변경할 공간이 부족합니다!"
LANG["PCR_PROPBANNED"]			= "[프롭 메뉴] 해당 프롭은 서버에서 금지되었습니다."
LANG["PCR_PROPBANNED_BYPCR"]	= "[프롭 메뉴] 해당 프롭은 프롭 메뉴에서 금지되어 사용이 불가합니다."
LANG["PCR_REACHED_LIMIT"]		= "[프롭 메뉴] 한계에 도달했습니다!"
LANG["PCR_STAY_ON_GROUND"]		= "[프롭 메뉴] 웅크리지 말고 가만히 서 있어야 합니다!"
LANG["PCR_ONLY_GROUP"]			= "[프롭 메뉴] 특정 그룹에서만 이용할 수 있는 메뉴입니다!"
LANG["PCR_NOT_EXIST_COUNT"]		= "선택하신 프롭이 맵 상에 존재하지 않습니다! ( %s / 4 )"
LANG["PCR_NOT_EXIST"]			= "선택하신 프롭이 맵 상에 존재하지 않습니다!"

-- PCR Client section, reason why there is a space because of chat.AddText between args.
LANG["PCR_NOTIFY_1"]			= " 이 서버에서 사용 중인 프롭 메뉴의 버전은 %s입니다! "
LANG["PCR_NOTIFY_2"]			= " 콘솔 또는 F1 누르기 -> [프롭 선택기 도움말] 메뉴"
LANG["PCR_CL_DISABLED"]			= " 해당 특성이 비활성화되었습니다."
LANG["PCR_CL_GROUP"]			= " 특정 그룹에서만 이용할 수 있는 메뉴입니다!"
LANG["PCR_CL_LIMIT"]			= " 한계에 도달했습니다!"

LANG["PCR_UNLIMIT_TEXT"]		= "무제한"
LANG["PCR_WINDOW_TITLE"]		= "PHX 프롭 메뉴"
LANG["PCR_HEADER_TOP"]			= "보유 중이거나 원하는 프롭을 선택하세요."
LANG["PCR_HEADER_MID"]			= "%s 사용 한도"
LANG["PCR_HEADER_BOTTOM"]		= "프롭 선택기를 사용하세요!"
LANG["PCR_CL_TOOLTIP_BANNED"]	= "해당 모델은 사용할 수 없습니다."
LANG["PCR_CL_TOOLTIP_MODEL"]	= "모델: %s"
LANG["PCR_CL_MENU_NOTREADY"]	= " 해당 특성은 현재 사용할 수 없습니다."
LANG["PCR_WINDOW_GUIDE_TTL"]	= "퀵 가이드: 프롭 메뉴 101"
LANG["PCR_BTN_HELP_MENU"]		= "프롭 메뉴 도움말"

LANG["PCR_CL_CMDUSEULX"]		= " 해당 커맨드는 사용이 불가능합니다. 'ulx propmenu'를 사용하세요!"
LANG["PCR_CMD_ULX_DISABLED"]	= "ulx propmenu의 커맨드는 사용이 불가능합니다. [프롭 메뉴 할당]을 누르세요."	--input.GetKeyName is impossible to access.

LANG["PCR_EDT_IN_USE"]			= "관리자가 해당 프롭 데이터를 수정 중입니다. 기다리시기 바랍니다!"
LANG["PCR_EDT_ERROR_DISABLED"]	= "[프롭 메뉴] 오류: 사용자 지정 프롭 에디션이 비활성화되었습니다!"
LANG["PCR_EDT_NO_RIGHTS"]		= "해당 특성에 대한 접근 권한이 없습니다."

--[[
	Admin Section, Revision: 16.09.21/X2Z
]]
LANG["PHXM_PLAYER_PROP_CHOOSER_KEY"]	= "프롭 메뉴 열기 기본 키 (프롭 선택기)."
LANG["PHXM_PROP_FREEZE_MIDAIR"]			= "프롭으로 공중에 떠있을 때 정지하기 기본 키"
LANG["PHXM_ADMIN_PROP_RIGHT_CLICK"]		= "프롭일 때 마우스 우클릭으로 도발하기?"
LANG["PHXM_ADMIN_TAUNT_SCANNER"]		= "(맵 재시작 필요) 도발 스캐너 활성화?"
LANG["PHXM_ADMLBL_USABLE_ENTS"]			= "사용 가능 프롭 엔티티 타입"
LANG["PHXM_ADMLBL_USABLE_ENTS_REF"]		= "다음의 유형이 있습니다: 1: 물리 전용, 2: 물리 및 역학, 3: Almost Anything inc.의 레그돌, 4: 사용자 지정 엔티티."
LANG["PHXM_ADMIN_USABLE_ENT_TYPE"]		= "프롭 복제용 엔티티 유형"
LANG["PHXM_ADMIN_NOTIFY_ENT_TYPE"]		= "엔티티 관련 프롭은 E키를 눌러 복제할 수 없습니다. 단, 'ph_usable_prop_type'의 값이 3 혹은 4로 설정되어 있는 경우에 한하여 가능합니다."
LANG["NOTIFY_PROP_ENTTYPE"]				= "[E]를 눌러 상호작용 하세요, [마우스 클릭]으로 복사하세요."
LANG["NOTIFY_CUST_ENT_TYPE_IS_ON"]		= "[PHX] 알림: [E]를 눌러 상호작용 하세요, [마우스 클릭]으로 복사하세요."

--[[
	Custom Taunts, Revision: 16.09.21/X2Z
]]
LANG["TM_TAUNTS_SEARCH_NOTHING"]		= "'%s'을 포함한 도발을 찾을 수 없습니다..."
LANG["TM_SEARCH_PLACEHOLDER"]			= "해당 카테고리 검색 중: Enter word, lowercase & no wildcards. Empty=Show All."
LANG["PHXM_MSG_INPUT_IS_EMPTY"]			= "텍스트에 내용이 없거나 엔터 키를 누르지 않았습니다."

--============= LATE ADDITION OF 10.06.2022/X2Z. =============--

--goto line: @132
LANG["MISC_SET"]						= "세트"
LANG["MISC_APPLY"]						= "적용"
LANG["MISC_NO"]							= "아니요"
LANG["MISC_YES"]						= "네"
LANG["MISC_WARN"]						= "경고"
LANG["MISC_ERROR"]						= "오류"
LANG["MISC_INFO"]						= "정보"
LANG["MISC_NOTICE"]						= "알림"
LANG["MISC_IDK"]						= "미확인"
LANG["MISC_NA"]							= "해당 없음"

-- HUD
LANG["HUD_DECOY_ACTIVE"]                = "[%s]를 누르세요"
LANG["HUD_FAKETAUNT_COUNT"]             = "%ix 왼쪽"
LANG["HUD_FAKETAUNT_UNLI"]              = "무제한"
LANG["NOTICE_GRENADE_SMG_GIVEN"]        = "SMG 수류탄을 획득했습니다."

--[[
	ADMIN PANEL, Revision 10.06/2022/X2Z
]]--
LANG["PHXM_TAUNT_SETTINGS"]				= "도발 설정"
LANG["PHXM_GENERAL_SETTINGS"]			= "일반 설정"
LANG["PHXM_FAKE_TAUNT_SETTINGS"]		= "가짜 도발 설정"
LANG["PHXM_FAKE_TAUNT_ENABLE"]			= "맵에 있는 프롭 중에 무작위로 가짜 도발을 하도록 허용합니다. 사용자 지정 도발 메뉴를 통해서만 접근 권한을 얻을 수 있습니다."
LANG["PHXM_FAKE_TAUNT_MAXUSAGE"]		= "사용된 가짜 도발 최대 사용 가능 횟수. -1로 설정하면 횟수 제한이 사라집니다."
LANG["PHXM_TAUNT_RIGHT_CLICK"]		    = "우클릭하여 도발을 실행하세요. 사용자 지정 메뉴를 우클릭하면 해당 기능이 사라집니다!"

LANG["PHXM_TAUNT_PITCH_SETTINGS"]		= "도발 피치 설정"
LANG["PHXM_TAUNT_PITCH_ENABLE"]			= "도발 피치 허용"
LANG["PHXM_TAUNT_PITCH_RANGE_MIN"]		= "도발 피치 허용 최소 범위 지정. 1에서 99까지."
LANG["PHXM_TAUNT_PITCH_RANGE_MAX"]		= "도발 피치 허용 최대 범위 지정. 100에서 255까지."

LANG["PHXM_DECOY_SETTINGS"]				= "디코이 설치"
LANG["PHXM_DECOY_ENABLE"]				= "디코이 보상을 허용하시겠습니까? 보상은 라운드 동안 생존에 성공한 프롭에 한하여 1회 주어집니다. 또한, 보상 허용 이전에 설치했던 디코이에 한하여 적용됩니다."

LANG["PHXM_DISABLE_FOOTSTEP"]           = "프롭 팀 발소리 음소거"

LANG["PHXM_ADMIN_CHATSETTING"]			= "채팅창 설정"
LANG["PHXM_ADMIN_HUNTERBLIND"]			= "헌터 눈가림 컨트롤"

LANG["PHXM_ADMIN_GIVEGRENADE_NEAREND"]  = "다음 라운드 종료시 유탄이 주어지길 원하십니까? 그렇다면, 'ph_give_grenade_roundend_before_time'를 확인하세요."
LANG["PHXM_ADMIN_GIVEGRENADE_TIME"]     = "라운드 종료 이전 수류탄이 주어지는 시간을 초단위로 설정합니다. 일반적으로 10초에서 30초 사이의 시간이 주어집니다."

--[[
	Plugins in sh_init.lua, Revision 10.06/2022/X2Z
]]--
LANG["PLUG_NAME_VER"]					= "플러그인: %s | v.%s"
LANG["PLUG_DESCRIPTION"]				= "설명: %s"

--[[
	Taunt Pitch, Revision 10.06/2022/X2Z
]]--
LANG["PHX_CTAUNT_USE_PITCH"]			= "사용자 지정 도발에 피치 사용"
LANG["PHX_CTAUNT_RANDOM_PITCH"]			= "도발에 무작위 피치 설정"
LANG["PHX_RTAUNT_USE_PITCH"]			= "무작위 도발에 피치 사용 [%s]"
LANG["PHX_RTAUNT_RANDOMIZE"]			= "무작위 도발에 무작위 피치 설정 [%s]"
LANG["PHX_CTAUNT_PITCH_FOR_FAKE"]		= "가짜 도발에 피치 사용"
LANG["PHX_CTAUNT_RANDPITCH_FOR_FAKE"]	= "가짜 도발에 피치를 무작위로 설정"
LANG["PHX_CTAUNT_SLIDER_PITCH"]			= "도발 피치 슬라이더."
LANG["TM_TOOLTIP_FAKETAUNT"]			= "프롭 중 무작위로 가짜 도발 실행"
LANG["TM_PREFERRED_PITCH"]              = "선호되는 도발 피치 레벨"

--[[
	Fake Taunt, Revision 10.06/2022/X2Z
	Description: Play fake taunts on random props in the map (Not Players)
]]--
LANG["PHX_CTAUNT_ON_RAND_PROPS"]		= "랜덤 프롭으로 플레이 하기 (%ix)"
LANG["PHX_CTAUNT_ON_RAND_PROPS_UNLI"]	= "랜덤 프롭으로 플레이 하기"
LANG["PHX_CTAUNT_PLAYED_ON_RANDPROP"]	= "랜덤 프롭으로 도발을 실행했습니다."
LANG["PHX_CTAUNT_RAND_PROPS_LIMIT"]		= "한계에 도달했습니다!"
LANG["PHX_CTAUNT_RAND_PROPS_NOT_PROP"]  = "현재 불가능합니다."
LANG["PHX_CTAUNT_RANDPROP_DISABLED"]	= "가짜 도발은 현재 불가능합니다."

--[[
	PH:Z Simple Decoy, Revision 10.06/2022/X2Z
]]--
LANG.DECOY_PROP	= {
	"더미를 죽였습니다!",
	"더미를 죽이고 스스로를 자책하세요.",
	"디코이를 죽이세요.",
	"무고한 더미를 죽이세요.",
	"더미를 죽이고 그게 부끄러운 줄 아세요."
}

LANG["DECOY_PUT_SUCC"]					= "디코이가 설치되었습니다."
LANG["DECOY_CANT_PUT_HERE"]				= "디코이를 설치할 수 없습니다."
LANG["DECOY_GET_REWARD"]				= "축하합니다! 이번 라운드에 살아남아 ['디코이 프롭']을 획득했습니다!"
LANG["DECOY_REMINDER_GET"]              = "현재 디코이나 더미 프롭이 있습니다! 설치하여 헌터가 햇갈리게 하세요!"
LANG["DECOY_FRAGS_RECEIVED"]			= "디코이 낚시 성공: %s에게서 1점을 빼앗아옵니다!"
LANG["DECOY_DISABLED"]					= "현재 디코이 사용이 불가능합니다."
LANG["PHXM_CL_DECOY_KEYBIND"]			= "디코이 설지 기본 키. 기본 값은 숫자 키 1 입니다. (키패드에 있는 숫자 키 1이 아닙니다)."

LANG["DECOY_INDICATOR_INVALID"]         = "유효하지 않은 슬로프입니다!"
LANG["DECOY_INDICATOR_TOOFAR"]          = "범위가 너무 멀리 설정되었습니다!"
LANG["DECOY_INDICATOR_OK"]              = "디코이 설치 [%s를 누르세요]"

LANG["PHXM_DECOY_HEALTH"]				= "디코이의 체력을 설정합니다. 기본 값은 10입니다."
LANG["PHXM_PLAYER_SHOW_DECOY_HELPER"]   = "디코이 설치 도우미를 보이게 하거나/숨깁니다. 사용 시 조준점 주변에 텍스트와 함께 흰 점이 표시됩니다."
LANG["PHXM_PLAYER_SHOW_DECOY_MARKER"]   = "디코이 마커를 보이게 하거나/숨깁니다"

--[[
	Revision 10.06/2022/X2Z
    Prop Menu Update: Menu, Editor, Browser
]]--
LANG["PCR_MODEL_DONT_EXISTS"]   = "죄송합니다, 이 모델은 현재 사용이 불가능합니다!"

LANG["PCR_PLUG_WARN_MSG"]		= "경고: 사용자 지정 프롭 애디션(pcr_allow_custom) 값이 0으로 설정되어 있습니다.\n사용자 지정 프롭을 편집하기 위해서 반드시 필요한 설정입니다!\n해당 설정을 적용하기 위해서는 맵 변경이 필요합니다."
LANG["PCR_PLUG_LBL_BINDKEY"]	= "바인드 키를 변경하려면 '[플레이어] 텝으로 변경하세요."
LANG["PCR_PLUG_LBL_EDITOR"]		= "사용자 지정 프롭 메뉴 에디터"
LANG["PCR_PLUG_BTN_OPEN_EDT"]	= "에디터 열기"
LANG["PCR_PLUG_LBL_COMSET"]		= "기본 설정"
LANG["PCR_PLUG_LBL_TECHSET"]	= "고급 설정"
LANG["PCR_PLUG_LBL_EXPSET"]		= "실험"
LANG["PCR_PLUG_LBL_PLAYERSET"]	= "플레이어 설정"

LANG["PCR_PLUG_ENABLE"]			= "'프롭 메뉴' 특성 활성화"
LANG["PCR_PLUG_ALLOW_CUSTOM"]	= "(맵 변경 필요) 프롭 메뉴 목록에 사용자 지정 프롭 추가를 허락합니다."
LANG["PCR_PLUG_PROP_BAN"]		= "(맵 변경 필요) 프롭 메뉴 목록에 금지 프롭을 제외합니다."
LANG["PCR_PLUG_USAGE_LIMIT"]	= "플레이어 최대 사용 빈도 제한. -1 값은 제한 없음을 나타냅니다."
LANG["PCR_PLUG_PROP_LIMIT"]		= "(맵 변경 필요) 프롭 메뉴 목록에 추가할 프롭 수를 제한합니다."
LANG["PCR_PLUG_PROP_LIMITMAX"]	= "프롭 메뉴 목록에 추가할 최대 프롭 수 제한. 안내: 프롭이 무작위로 추가됩니다!"
LANG["PCR_PLUG_USE_ULXMENU"]	= "콘솔 (0) 또는 ULX (1)를 통한 프롭 메뉴 접속을 허용하시겠습니까? 해당 설정은 바운딩 키 적용이 가능합니다."
LANG["PCR_PLUG_USE_DELAY"]		= "플레이어가 다른 프롭을 사용하기 위해 프롭 메뉴 사용 시 시간을 지연시킵니다."
LANG["PCR_PLUG_KICK_INVALID"]	= "허용되지 않은 모델을 사용하는 유저를 추방합니다."
LANG["PCR_PLUG_SPACE_CHECK"]	= "프롭 변경으로 인한 끼임 현상을 방지하는 데 필요한 공간을 미리 확인합니다."
LANG["PCR_PLUG_X_BBOX"]			= "(맵 변경 필요) 프롭 메뉴 목록을 추가하기 전에 BBox 엔티티 제한을 확인합니다."
LANG["PCR_PLUG_X_BBOX_MAX"]		= "BBox 충돌 경계 최대 높이 제한. 최소 높이는 자동으로 측정됩니다."
LANG["PCR_PLUG_X_BBOX_MIN"]		= "BBox 충돌 경계 최대 너비 제한. 최소 높이는 자동으로 측정됩니다."
LANG["PCR_PLUG_ONLY_GROUPS"]	= "프롭 메뉴 접근 권한을 특정 그룹에 부여합니다. 예시, 후원자"
LANG["PCR_PLUG_NOTIFYMSG"]		= "매 라운드 시작마다 프롭 메뉴 사용법 알림이 뜹니다."

LANG["PCR_EDITOR_MSG_ERROR"]	= "변경 사항이 오류로 인해 저장되었습니다.\n서버 콘솔을 확인하시기 바랍니다!"
LANG["PCR_EDITOR_MSG_SUCC"]		= "변경 사항 및 사용자 지정 프롭 데이터가 저장 및 업데이트되었습니다."

LANG["PHZ_generic_title"]		= "사용자 지정 프롭 추가 에디터"
LANG["PHZ_generic_helptext"]	= [[[How To Use:
[LEFT PANEL]
← Choose a game content
← Click on icons to add models to the right
← Right Click to open context menu

[RIGHT PANEL]
→ Click to 'mark' any props before deleting
→ Hit 'Remove Selected' to Remove Models
→ Hit 'Apply Selection' to Make changes

[INFO]
- You can only add models up to 2048 entries.
- All maps props will be included automatically, so you don't have to.
- Pressing [Close] button will cancel the operation.
- Not all models will have a valid VPhysics.
- Not all Players (inc. Your Server) will have custom models. If they don't exists they will removed after Applying selections.
- Your Server content might be different from you. If you see "<game> [Not Mounted]" on dropdown menu, it means that you haven't mounted/installed the game.
- Addon folder browsing isn't implemented yet so You'll have to use 'All Contents' instead.
]]
LANG["PHZ_generic_mdlinfo"] = [[Model Info:
%s
Has Physics: %s]]
LANG["PHZ_generic_mdlinfoStart"] = "(모델을 먼저 선택하세요!)"

LANG["PHZ_generic_no_ragdoll"]	= "레그돌: 불가"
LANG["PHZ_generic_titlelabel"]	= "%s 미리보기 :"

LANG["PHZ_mount_game_sel"]		= "탑재된 게임 선택 (기본 설정: Garry's Mod)"
LANG["PHZ_input_placeholder1"]	= "폴더 검색: <폴더명> 또는 '*', 폴더 전체 여백."
LANG["PHZ_input_placeholder2"]  = "애드온 검색: <이름> 또는 '*', 폴더 전체 여백."
LANG["PHZ_msg_warn_close"]		= "정말로 이 창을 닫으시겠습니까? 저장하지 않은 편집 내역이 사라집니다!"
LANG["PHZ_msg_commit"] 			= "정말로 커밋을 변경하시겠습니까?"
LANG["PHZ_msg_cant_empty"]		= "프롭 목록은 비워둘 수 없습니다!"
LANG["PHZ_msg_removesel"] 		= [[Remove selected props in the list. Legends:
Red = Marked Selections
Yellow: Prop don't exists in server AND should be Removed.]]
LANG["PHZ_msg_warn_mdlinlist"]  = "경고: 이 모델은 이미 목록에 있습니다!"
LANG["PHZ_msg_invalid_mdl"] 	= "사유: 유효하지 않은 모델입니다"
LANG["PHZ_apply_select"] 		= "적용 및 저장 선택"
LANG["PHZ_menu_copy"] 		= "모델 복사"
LANG["PHZ_menu_refresh"] 	= "모델 새로고침"
LANG["PHZ_tooltip_removesel"]	= "선택 항목 삭제"
LANG["PHZ_tooltip_wasmarked"] = [[표시된 프롭은 더 이상 서버에 존재하지 않습니다. 에디터 종료 시, 자동으로 삭제됩니다.]]

LANG["PHZ_pcr_fb_allcontent"] = "모든 콘텐츠 (서버나 플레이어 모두가 동일한 콘텐츠를 소장하고 있는 것은 아닙니다.)"
LANG["PHZ_pcr_fb_notmounted"] = "%s [탑재되지 않음]"

-- Revision 25-27/08/2022
LANG["PHX_ADMIN_ACCESS_ONLY"]		= "Access Denied: only Admins can do that, %s !"
LANG["PHX_PROP_TOO_THIN"]           = "Cannot Replicate: Prop is too thin!"
LANG["PHX_PROP_IS_BANNED"]			= "The prop you're trying to use is banned from server!"
LANG["PHX_SPECT_JOINGAME"]			= "To join the game, Press [F2] then select a team to join."
LANG["PHX_TEAM_IS_FULL"]			= "That team is full!"
LANG["FORCE_JOIN_TEAM_IS_DISABLED"]	= "Even-out Team Balance is disabled (Team Shuffle/Rotation is Enabled)"

LANG["PHX_TM_MNBAR_OPTIONS"]		= "Options"
LANG["PHX_TM_MNBAR_SAVEFAV"]		= "Save Favorites"
LANG["PHX_TM_MNBAR_LOADFAV"]		= "Reload Favorites"
LANG["PHX_TM_MNBAR_SETTINGS"]		= "Others"
LANG["PHX_TM_MNBAR_RESET"]			= "Reset Favorites"

LANG["PHX_TM_WARN_CLEARFAV"]		= "WARNING: This will CLEAR ALL your previously saved Favorite Taunts. Are you sure you want to continue?"

LANG["PHXM_BANNED_MODELS"]			= "Dis/Allow the use of Restricted Models (Banned Models). This does not include from Prohibitted Models (They're always deleted)."
LANG["PHXM_ADMIN_ALLOWARMOR"]       = "Allow Armor Addition for team Hunters and Props"
LANG["PHXM_ADMIN_ALLOW3P"]          = "Allow thirdperson mode for Hunters"
LANG["PHXM_ADMIN_ALLOW3P_SVDESIRED"]= "Allow thirdperson mode to use Server's Desired Camera position (Disallow player custom position)"
LANG["PHXM_ADMIN_ALLOW3P_DIST"]     = "Thirdperson: Desired Camera Distance"
LANG["PHXM_ADMIN_ALLOW3P_RIGHT"]    = "Thirdperson: Desired Camera Right Position"
LANG["PHXM_ADMIN_ALLOW3P_UP"]     	= "Thirdperson: Desired Camera Up Position"
LANG["PHXM_ADMIN_JUMPPOWER_H"]		= "Additional Jump Power multiplier for Hunters"
LANG["PHXM_ADMIN_MDLCOLOR_PROP"]	= "Enable Player Color for team Props (Require Hunter Custom Models to be enabled)"
LANG["PHXM_ADMIN_MDLCOLOR_HUNTER"]	= "Enable Player Color for team Hunters (Require Hunter Custom Models to be enabled)"
LANG["PHXM_ADMIN_PITCH_ROTATION"]	= "[Experimental] Allow to use pitch rotation for props. This may be buggy."
LANG["PHXM_ADMIN_FALLDMG"]			= "Enable Fall Damage (Applies on All Teams)"
LANG["PHXM_ADMIN_FALLDMG_REAL"]		= "Enable 'Realistic' Fall Damage"
LANG["PHXM_INFORM_TO_JOIN"]			= "Inform Unassigned/Spectators with static text advice to join the game."
LANG["PHXM_ADMIN_PROPOFFSET"]		= "Substract/Add Prop View Offset Height using multiplier. Min: 0.6, Max: 1.2. Default: 0.8."
LANG["PHXM_ADMIN_REPL_MUST_STAND"]	= "[Experimental] Restrict props replication only when they're standing. Disable this to allow replicating when ducking or jumping."

LANG["PHXM_DROP_VBS_DISABLE"]       = "Disable Verbose"
LANG["PHXM_DROP_VBS_ENABLE"]        = "Enable Verbose"
LANG["PHXM_DROP_MDL_INCLUDEALL"]    = "Include Everything ( %d )"
LANG["PHXM_DROP_MDL_CUSTOMLIST"]    = "Seperate/Custom List ( %d )"
LANG["PHXM_DROP_MDLTYPE_PROP"]      = "Physics Only ( %d )"
LANG["PHXM_DROP_MDLTYPE_PROPDYN"]   = "Physics & Dynamic Props ( %d )"
LANG["PHXM_DROP_MDLTYPE_ANYENTS"]   = "Any Compatible Entities ( %d )"
LANG["PHXM_DROP_MDLTYPE_CUSTOM"]    = "Custom Entities ( %d )"
LANG["PHXM_DROP_RESPAWNBLIND_BOTH"] = "Both Teams"

LANG["PHXM_TAB_ADMINGROUPS"]        = "Group & Access Option"
LANG["PHXM_TAB_PHEPLUS"]			= "Enhanced Plus Settings"

LANG["PHXM_ADMIN_ACCESS_GROUP"]     = "Select groups to allow access PH:X Admin Settings, Enhanced Plus & Plugin Settings page."
LANG["PHXM_ADMIN_ACCESS_GROUP_HINT"] = "Please note that \"superadmins\" cannot be revoked."
LANG["PHXM_ADMIN_ACCESS_GROUP_NOULX"] = "Error: ULib & ULX is not installed on your server."
LANG["PHXM_ADMIN_ACCESS_NOREVOKE"]  = " (Cannot be revoked)"
LANG["PHXM_ADMIN_GROUP_WHOCANACC"]	= "Select groups to allow access [Admin Settings]."
LANG["PHXM_ADMIN_GROUP_MUTEABLE"]	= "Select groups to disallow Voice Mute in [Player Muting]. (User is always mute-able)."

LANG["PHXM_ADMIN_ACCESS_CHATINFO"]  = "There was a configuration update for Prop Hunt Menu window. Reopening..."
LANG["PHXM_ADMIN_ACCMSG_BODY"]      = "Do you want to save selection and proceed the changes?\nPlease note that any previous groups you revoked will no longer have the access.\nThis will restart the Prop Hunt Menu if they're still opened."
LANG["PHXM_ADMIN_ACCMSG_TITLE"]     = "Apply Group Access"
LANG["PHXM_ADMIN_ACCCFG_SUCC"]      = "Group Access data successfully saved."
LANG["PHXM_ADMIN_ACCCFG_FAIL"]      = "There was an error saving Group Access data. Check your server console!"
LANG["PHXM_ADMIN_MUTCFG_SUCC"]      = "Mutedable Group Access data successfully saved."
LANG["PHXM_ADMIN_MUTCFG_FAIL"]      = "There was an error saving Muteable Group data. Check your server console!"

LANG["PHXM_ADMIN_ACCESS_APPLY"]     = "Apply Selected Groups"

-- PHE/Plus
LANG["PHXM_ADMIN_PLUSSETTING"]		= "Plus+ Settings"
LANG["PHXM_PLUSSETTING_HINT"]		= "Configure Team Balance or any other additional settings."
LANG["PHXM_HEADER_UNSTUCK"]			= "Unstuck Settings"
LANG["PHXM_HEADER_TEAMSETTING"]		= "More Team Options & Settings"

LANG["LIST_PLAYER"]					= "Players"
LANG["LIST_FORCEDASPROP"]			= "Forced As Prop?"
LANG["LIST_MARKEDASPROP"]			= "Marked to be forced as Prop"
LANG["LIST_NOHUNTERS"]				= "No Hunters are currently playing."

LANG["PHXM_PLUS_MSG_NO_HUNTERS"]	= "There are no hunters to reset."

LANG["PHXM_PLUS_BTNRESET"]			= "Clear Selections (and Reset All Forced)"
LANG["PHXM_PLUS_LISTTIPS"]			= "Tips: Double Click to toggle Force Player as Prop."

LANG["PHXM_ADMIN_ENABLEUNSTUCK"]		= "Toggle Enable/Disable Built-in unstuck feature. If you use an addon, disable this."
LANG["PHXM_ADMIN_NOTPUNSTUCKINROUND"]	= "Disable last-resort unstuck teleportations to spawnpoints outside of the hiding phase" --ph_disabletpunstuckinround
LANG["PHXM_ADMIN_UNSTUCK_WAITTIME"]		= "How much seconds must pass between each unstuck attempt" --ph_unstuck_waittime
LANG["PHXM_ADMIN_TEAMBAL_ORIG"] 		= "Use PH:X's original auto-balancing (disables all following team-related options below)" --ph_originalteambalance
LANG["PHXM_ADMIN_TEAMBAL_UNCHECK"] 		= "Uncheck the previous checkbox to access the advanced team balance options." --ph_originalteambalance_uncheck [UNUSED]
LANG["PHXM_ADMIN_FORCESPECTOPLAY"]		= "Force spectators to play by including them when balancing teams" --ph_forcespectatorstoplay
LANG["PHXM_ADMIN_NO_H_CONSECUTIVE"]		= "Prevent players from being a Hunter twice in a row (only works in shuffle mode)" --ph_preventconsecutivehunting
LANG["PHXM_ADMIN_HUNTER_COUNT"] 		= "Hunter count (0 = automatic)" --ph_huntercount
LANG["PHXM_ADMIN_ROTATETEAM"] 			= "Disable shuffle mode and rotate players instead" --ph_rotateteams
LANG["PHXM_ADMIN_RESET_ROTTEAM"] 		= "Reset rotations" --ResetRotateTeams
LANG["PHXM_ADMIN_RESET_ROTTEAM_WARN"]	= "Restart rotations from the beginning (in case you've started them, stopped, then started again and the current rotation does not satisfy you):" --ResetRotateTeams_warning
LANG["PHXM_ADMIN_RESET_MSG"]			= "Rotation Team has been Reset!"
LANG["PHXM_ADMIN_FORCEH2P_WARN"]		= "Force a Hunter to be a Prop next time (only works in shuffle mode):" --ForceHunterAsProp_warning
LANG["PHXM_ADMIN_FORCEH2P_RANDONLY"]	= "This action is only available in shuffle mode." --ForceHunterAsProp_randomonly
LANG["PHXM_ADMIN_FORCEH2P_NOHUNT"]		= "[NO HUNTERS]" --ForceHunterAsProp_nohunters [UNUSED]
LANG["PHXM_ADMIN_FORCEH2P_NOHUNTMSG"] 	= "There are no hunters goddammit, it's written on the button!" --ForceHunterAsProp_nohuntersmsg [UNUSED]

LANG["FORCEH2P_WILL_BE"]				= "%s will be a Prop next round."
LANG["FORCEH2P_IS_CANCELED"]			= "%s won't be a Prop next round."
LANG["FORCEH2P_IS_RESET"]				= "All Hunters won't be Forced as a Prop next round."
LANG["FORCEH2P_PLAYER_NOT_FOUND"]		= "Selected player was not found, probably they were disconnected."
LANG["PHX_ROTATE_TEAM_RESET"]			= "Rotation Team Offset has been reset."
LANG["FORCEH2P_ALREADY"]				= "%s has already been defined as a Prop for next round." -- [UNUSED]

LANG["UNSTUCK_YOURE_UNSTUCK"]			= "You should be unstuck!"
LANG["UNSTUCK_BAD_SPAWNPOINT"]			= "Error: The closest spawnpoint might get you stuck again. If it does, try to unstuck again."
LANG["UNSTUCK_RESCUE_SPAWNPOINT"]		= "This spawnpoint is extremely close, so you might still be stuck. Try unstucking again if you are."
LANG["UNSTUCK_NO_SPAWNPOINTS"]			= "For unknown reasons, no spawnpoint could be found. As a backup strategy, you will be teleported to (0, 0, 0). There is a very high chance that you will be stuck, so if you are please try unstucking again."
LANG["UNSTUCK_PLEASE_WAIT"]				= "Please wait %d seconds between each unstuck attempt."
LANG["UNSTUCK_NOT_ON_GROUND"] 			= "Not on ground, checking..."
LANG["UNSTUCK_NOT_STUCK_JITTER"]		= "You're not stuck. If you really are, wait until your prop no longer moves/jitters (try pressing ALT) then try again."
LANG["UNSTUCK_NOT_STUCK_TOOBAD"]		= "You're not stuck. If you really are, sorry, you'll have to wait until the end of the round."
LANG["UNSTUCK_CANNOT_FIND_SPOT"]		= "Cannot find a place to move you to, teleporting to closest spawnpoint."
LANG["UNSTUCK_SPAWNPOINTS_DISABLED"]	= "You were going to be teleported to a close spawnpoint, but this server disallows it outside of the hiding/hunter blind period. Sorry!"
-- End of PHE/Plus

LANG["MISC_SEL_APPLY"]  = "Apply Selections"
LANG["MISC_RESET_SEL"]  = "Reset Selections"
LANG["MISC_RESET"]      = "Reset"
LANG["MISC_CANCEL"]     = "Cancel"
LANG["MISC_SEL_ALL"]    = "Select All"
LANG["MISC_SEL_NONE"]   = "Select None"

LANG["PHXM_CL_THIRDPERSON"]     = "Key for Toggling thirdperson mode"
LANG["PHXM_CL_UNSTUCK"]			= "Key for Unstuck"
LANG["CL_THIRDPERSON_ENABLED"]  = "Thirdperson Enabled"
LANG["CL_THIRDPERSON_DISABLED"] = "Thirdperson Disabled"

LANG["PHX_TP_ADJUSTVIEW_BTN"]	= "Adjust Thirdperson View" --Button, as well as window title.
LANG["PHX_TPS_ADJ_TITLE"]		= "Thirdperson Warning"
LANG["PHX_TPS_ADJ_SVDESIRED"]	= "Thirdperson Customization disabled: Using Server's desired position."
LANG["PHX_TPS_ADJ_3PDIS"]		= "Thirdperson mode is disabled."
LANG["PHX_TPS_ADJ_BLIND"]		= "You're blinded. Try again later."
LANG["PHX_TPS_ADJ_NEEDALIVE"]	= "You need to be on Alive Hunter Team to do this."

LANG["ANG_AXIS_DIST"]	= "Distance" -- or Forward
LANG["ANG_AXIS_RIGHT"]	= "Right"
LANG["ANG_AXIS_UP"]		= "Up"
LANG["VEC_POS_LEFT"]	= "Left" --X
LANG["VEC_POS_FRONT"]	= "Front" --Y?
LANG["VEC_POS_TOP"]		= "Top"  --Z

-- Key Hints
LANG["KEYHINT_HUNTER3P"] 	= "Hunter Thirdperson"
LANG["KEYHINT_SHOOT"]		= "Fire Weapon"
LANG["KEYHINT_SEC"]			= "Fire Secondary"
LANG["KEYHINT_PICKUP"]		= "Pickup Object/Interact"

LANG["KEYHINT_LMB"]			= "Replicate Prop"
LANG["KEYHINT_RMB"]			= "Prop Taunt/Special Ability"
LANG["KEYHINT_RANDTAUNT"] 	= "Random Taunt"
LANG["KEYHINT_TAUNTMENU"] 	= "Toggle Taunt Menu"
LANG["KEYHINT_ROTATION"] 	= "Toggle Rotation Lock"
LANG["KEYHINT_PROPMENU"] 	= "Toggle Prop Menu"
LANG["KEYHINT_FREEZEAIR"] 	= "Toggle Prop Freeze"
LANG["KEYHINT_SPAWNDECOY"] 	= "Spawn Decoy"
LANG["KEYHINT_UNSTUCK"]		= "Unstuck Key"

LANG["KEY_LMB"]				= "LMB" -- Left Mouse Button, Short version
LANG["KEY_RMB"]				= "RMB" -- Right Mouse Button, Short version

LANG["MISC_TEAM_NAME"]		= "TEAM: %s" -- TEAM PROPS, TEAM HUNTERS, but in 1 sentence.
LANG["NOTIFY_HEADER_TITLE"]	= "Game Controls"

PHX.LANGUAGES[LANG.code] = LANG