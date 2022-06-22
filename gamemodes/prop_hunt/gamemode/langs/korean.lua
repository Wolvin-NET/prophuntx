-- Kindly free to improve the language.
local LANG = {}

LANG.code = "ko_kr"

LANG.Name = "한국어" -- example: "Bahasa Indonesia"
LANG.NameEnglish = "Korean" -- Your Language but spoken in English, example: "Indonesian"
LANG.Author = "So-chiru" -- Only accept STRINGS.
-- Can Accept: String, and Table.
LANG.AuthorURL = {"https://steamcommunity.com/profiles/76561198273773489"}

-- Special Section that isn't String-based
LANG.SUICIDEMSG = {  -- Fix me: there was addition text here but feel free to add more.
"님이 자살 '당함'!",
"님이 신비하게 죽었습니다.", "님이 마법으로 인해 죽으셨습니다.", "님이 저격총을 반대로 쐈나봐요.",
"님이 그냥 돌아버리셨나봐요.", "님이 숙취로 인해 돌아가셨습니다.",
"님이 죽었네요... 다음은 죽지 않도록 행운을 빌게요!", "님의 바닥이 미끄러웠던 모양입니다.",
"님이 막대기에 걸려 넘어졌나봐요.", "님이 어느 힘으로 인해 죽었습니다.", "님이 싸늘한 주검이 되었습니다."}

LANG.RANDOM_SPECTATORS = { -- > FRETTA
"잠시 여유를 즐기려", "노는 것을 지켜보려고", "뭔가 보려고", " "}

LANG["PHX_TEAM_CONNECTING"] = "연결" --Fix me
LANG["PHX_TEAM_PROPS"]		= "Props"
LANG["PHX_TEAM_HUNTERS"] 	= "헌터들이"
LANG["PHX_TEAM_UNASSIGNED"]	= "할당되지 않음"  --Fix Me
LANG["PHX_TEAM_SPECTATOR"] 	= "구경꾼"	--Fix Me

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
LANG["HUD_LOSE"] = "무승부! 모두 졌네요."
LANG["MISC_TIMELEFT"] = "남은 시간: %s"
LANG["MISC_GAMEEND"] = "이 라운드 후에 게임이 끝납니다"

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
LANG["DERMA_SERVER_TAG"]		= "SV" --Fix Me
LANG["DERMA_BOT_TAG"]			= "BOT" -- Fix Me
LANG["DERMA_GAMEMODE_CREDITS"]	= "%s | Version: %s - Rev. %s" -- Fix Me

LANG["CHAT_JOINED"] = " 님이 참가한 "
LANG["CHAT_JOINEDTHE"] = " 님이 참가한 "

LANG["CHAT_SWAPBALANCE"] = "%s 님이 밸런스를 위하여 %s 팀으로 이동하였습니다."
LANG["CHAT_SWAPBALANCEYOU"] = "밸런스를 맞추기 위해 다른 팀으로 이동되었습니다." -- Smile... for even in death, you have become children of Thanos

-- FRETTA: Splash Starting Screen
LANG["SPASHSCREEN_BY_X"]		= "by %s"	--Fix Me
-- RichTextBox
LANG["HELP_DONATORS_AND_CONTRIBUTORS"]  = "\n\nDonators & Contributors:\n- %s" --Fix Me
-- // END OF FRETTA SECTION \\

LANG["HELP_F1"] = [[Prop Hunt (코드네임) X

Prop Hunt X를 현대적이고 좀 더 커스텀 가능하도록 만든 프로젝트입니다.

자세한 정보는 아래 링크에서 확인할 수 있습니다.
https://gmodgameservers.com/prophuntx

자세한 도움말 및 가이드를 보시려면, [F1] 키를 누르고 [Prop Hunt 메뉴] 버튼을 클릭하세요.

버전: ]] .. PHX.VERSION .. [[ Rev: ]] .. PHX.REVISION .. [[

맘껏 놀아보세요!]]

-- Important!
LANG["LANGUAGE_CHANGED"] = "선호하는 언어를 %s 으(로) 변경하였습니다."

-- internal cl_menutypes section.
LANG["SUBTYPE_PREFERED_LANG"] = "선호하는 언어"
-- LANG["SUBTYPE_TEXTENTRY_?"]	= "???"

-- Events
LANG["EV_PLAYER_CONNECT"] = "%s 님이 서버에 연결하셨습니다."
LANG["EV_PLAYER_JOINED"] = "%s 님이 서버에 접속하셨습니다."
LANG["EV_PLAYER_DISCONNECT"] = "%s 님이 서버에서 퇴장하셨습니다. (%s)"

-- HUD elements
LANG["HUD_HP"] = "체력"
LANG["HUD_AMMO"] = "탄약" -- obsolete
LANG["HUD_MAGSEC"] = "탄창. / 보조." -- Magazine Counts (separator) Secondary Magazine Counts

-- !!WEAPON NAMES CANNOT BE TRANSLATED, THEY USE FROM language.GetPhrase THEREFORE IT'S IMPOSSIBLE TO DO.

LANG["TEAM_PROPS"] 		= LANG["PHX_TEAM_PROPS"]
LANG["TEAM_HUNTERS"] 	= LANG["PHX_TEAM_HUNTERS"]

LANG["HUD_ROTLOCK"] = "프롭 회전 : 고정"
LANG["HUD_ROTFREE"] = "프롭 회전 : 자유"
LANG["HUD_KILLEDBY"] = "%s 님에게 죽었습니다"

LANG["HUD_AUTOTAUNT"] = "%d초 후 자동 도발"
LANG["HUD_AUTOTAUNT_ALT"] = "%d 후 자동 도발"

LANG["HUD_TargetID"] = "플레이어: %s (%d%%)" -- Player: <NAME> (<HEALTH>%)

LANG["HUD_BLINDED"] = "%s초 후에 %s 풀려납니다"
LANG["HUD_UNBLINDED"] = "준비됐든 말든, 시작합니다!"

LANG["BLIND_RESPAWN_TEAM"] = "눈가림 시간 동안 %d초만에 %s 팀에서 부활되었습니다."
LANG["BLIND_RESPAWN"] = "눈가림 시간 동안 %d초 만에 부활되었습니다."

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
    "팀을 %d회 변경하였습니다. (%d번 최대). 그 후에는 반대 팀으로 이동할 수 없습니다."
LANG["CHAT_SWAPTEAM_REVERT"] = "팀 변경 횟수를 초과 했으므로 %s 팀으로 이동 할 수 없습니다."

LANG["CHAT_PROP_NO_ROOM"] = "그 물체로 바뀔 충분한 공간이 없습니다!"

-- Notification
LANG["NOTIFY_IN_PROP_TEAM"] =
    "물체를 회전할 수 있는 Props 팀입니다. 마우스를 움직여 물체를 회전 할 수 있습니다."
LANG["NOTIFY_ROTATE_NOTICE"] = "또한 (기본값) [R] 키를 눌러 회전 고정을 할 수 있습니다."

-- Custom Taunt Window
LANG["TM_WARNING_CT_DISABLE"] =
    "[PHX - 도발] 주의: 이 서버에서는 커스텀 도발을 사용할 수 없습니다."
LANG["TM_NO_TAUNTS"] = "주의: 이 카테고리에서 도발을 감지하지 못했습니다."
LANG["TM_PLAY_ONLY_ALIVE"] = "살아 있을 때만 커스텀 도발을 할 수 있습니다."

LANG["TM_WINDOW_TITLE"] = "Prop Hunt 커스텀 도발 메뉴"
LANG["TM_NOTICE_PLSWAIT"] = "%s초 동안 기다리세요." -- fix me: Add " before Random Taunt ends!"
LANG["TM_NOTICE_PLAYPREVIEW"] = "도발 %s 미리보는 중"

LANG["TM_TOOLTIP_PLAYTAUNT"] = "도발 재생"
LANG["TM_TOOLTIP_PREVIEW"] = "도발 미리보기"
LANG["TM_TOOLTIP_PLAYCLOSE"] = "도발 재생 후 닫기"
LANG["TM_TOOLTIP_PLAYRANDOM"] = "랜덤 도발 재생"
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
LANG["PHXM_TAB_MUTE"] = "플레이어 음성 뮤트/해제"
LANG["PHXM_TAB_PLAYER"] = "플레이어 설정"
LANG["PHXM_TAB_MODEL"] = "플레이어 모델 브라우저"
LANG["PHXM_TAB_MODEL_DISABLED"] = "플레이어 모델 브라우저 (비활성화 됨)"
LANG["PHXM_TAB_ADMIN"] = "관리자 설정"
LANG["PHXM_TAB_ABOUT"] = "Prop Hunt X 정보"
LANG["PHXM_TAB_MAPVOTE"] = "맵 투표 설정"

LANG["PHXM_CVAR_CHANGED"] = "[설정] CVar %q가 %q으(로) 변경되었습니다."

--[[
	Player Mute Settings
]]
LANG["PHXM_MUTE_SELECT"] = "뮤트할 플레이어를 선택하세요."

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

LANG["PHXM_PLAYER_TOGGLE_HALOS"] = "프롭을 선택할 때 은은히 비치는 (Halo) 효과 사용"
LANG["PHXM_PLAYER_IDNAMES"] =
    "대신 머리 위에 팀 플레이어 이름 표시하기 (벽을 통과해서도 보임)"
LANG["PHXM_PLAYER_ENDROUND_CUE"] = "라운드 끝 사운드 큐 재생"
LANG["PHXM_PLAYER_TAUNTMENU_AUTOCLOSE"] = "도발 창을 두 번 클릭하면 자동으로 닫히는 옵션"
LANG["PHXM_PLAYER_SEE_HUNTER_LINE"] =
    "관전 모드에서 헌터의 조준점을 볼 수 있도록 헌터에 선을 그리기"
LANG["PHXM_PLAYER_SEE_LBALL_ICONS"] = "'행운의 공'이 생성되면 아이콘이 표시되도록 하기"
LANG["PHXM_PLAYER_SEE_CRYSTAL_ICONS"] = "'악마의 공'이 생성되면 아이콘이 표시되도록 하기"

LANG["PHXM_PLAYER_USE_NEW_HUD"] = "새 Prop Hunt X의 향상된 HUD 사용"
LANG["PHXM_PLAYER_SHOW_TUTOR"] = "튜토리얼 팝업 표시 (각 Props 팀 플레이어 스폰 시 2번 표시)"
LANG["PHXM_PLAYER_USE_NEW_CROSSHAIR"] = "커스텀 조준선 사용"
LANG["PHXM_PLAYER_SHOW_TEAM_TOPBAR"] =
    "왼쪽 상단에 총 살아있는 팀 플레이어 바 표시 (최소 4명의 플레이어가 표시됨)"

--[[
	Player model Browser Section
]]
LANG["QUERY_MODEL_SELECTED"] = "모델 %s 은(는) 다음 부활 시 적용됩니다."
LANG["QUERY_MODEL_INFO"] = "모델 이름: %s - 모두 사용 가능"

LANG["MDL_MENU_REFRESH"] = "아이콘 새로고침"
LANG["MDL_MENU_PREVIEW"] = "모델 미리보기"
LANG["MDL_MENU_MODELINFO"] = "모델 정보"

LANG["MISC_APPLYMDL"] = "모델 적용"

LANG["PHXM_MODEL_DISABLED"] =
    "이 서버에서는 사용자 지정 플레이어 모델이 비활성화되어 있습니다."
LANG["PHXM_PLAYERMODEL_SETFOV"] = "  모델 FOV 설정"

--[[
	Server Settings
]]
LANG["PHXM_ADMIN_OPTIONS"] = "서버 측 게임 모드 옵션 (관리자 / 소유자에게만 표시됨)"
LANG["PHXM_ADMIN_MUSTALIVE"] = "이 작업을 수행하려면 살아있는 팀에 있어야합니다."

--[[
	Language Override
]]
LANG["PHXM_ADMIN_LANGOVERRIDE"] = "언어 덮어 쓰기"

LANG["PHXM_ADMIN_FORCELANG"] =
    "언어 강제를 사용 하시겠습니까? 이것은 유저가 서버에서 선택한 언어를 사용하도록 강제합니다."
LANG["PHXM_ADMIN_LANGTOUSE"] = "언어 강제 사용."
LANG["PHXM_ADMIN_PLAYERDEFAULTLANG"] = "처음 참가한 플레이어가 사용할 기본 언어"

-- Gameplay settings
LANG["PHXM_ADMIN_CUSTOM_MODEL"] = "Hunters 팀의 커스텀 모델 활성화"
LANG["PHXM_ADMIN_CUSTOM_MODEL_PROP"] =
    "Props 팀의 커스텀 모델 활성화 - Hunters 팀에도 활성화 해야합니다."
LANG["PHXM_ADMIN_TAUNT_DELAY_CUSTOM"] = "커스텀 도발 지연 시간 (초 단위)"
LANG["PHXM_ADMIN_TAUNT_DELAY_RANDOM"] = "보통 도발 지연 시간 (초 단위)"
LANG["PHXM_ADMIN_TAUNT_DELAY_AUTO"] = "자동 도발 지연 시간 (초 단위)"
LANG["PHXM_ADMIN_AUTOTAUNT_ENABLE"] = "자동 도발 기능 활성화"

LANG["PHXM_ADMIN_NOTICE_ROTATION"] = "Props 팀 스폰시마다 '프롭 회전' 알림 표시"
LANG["PHXM_ADMIN_CAMERA_COLLIDE"] = "벽에 닿을시 Prop 팀 카메라 충돌 활성화"
LANG["PHXM_ADMIN_FREEZECAM"] = "Props 팀의 카메라 고정 기능 활성화"
LANG["PHXM_ADMIN_PROP_COLLIDE"] = "다른 Prop 팀 플레이어와 프롭 충돌 활성화"
LANG["PHXM_ADMIN_SWAP_TEAM"] = "매 라운드마다 팀 교대 - 비활성화시 팀이 계속 유지됩니다."
LANG["PHXM_ADMIN_HUNTER_PENALTY"] = "헌터 체력 패널티"
LANG["PHXM_ADMIN_HUNTER_KILL_BONUS"] = "헌터 처치 보너스"
LANG["PHXM_ADMIN_HUNTER_SMG_GRENADES"] = "헌터 SMG 수류탄"
LANG["PHXM_ADMIN_GAME_TIME"] = "총 게임 시간 (분)"
LANG["PHXM_ADMIN_BLINDLOCK_TIME"] = "헌터 눈가림 시간 (초)"
LANG["PHXM_ADMIN_ROUND_TIME"] = "게임 라운드 시간 (초)"
LANG["PHXM_ADMIN_ROUNDS_PER_MAP"] = "맵당 총 게임 라운드"
LANG["PHXM_ADMIN_ENABLE_LUCKYBALL"] = "파괴 가능한 프롭에 행운의 공이 생성되도록 허용 (8% 확률)"
LANG["PHXM_ADMIN_ENABLE_CRYSTAL"] = "헌터가 죽을 때 악마 공이 생성되도록 허용 (70% 확률)"
LANG["PHXM_ADMIN_WAIT_PLAYERS"] = "플레이어가 게임 플레이를 시작할 때까지 기다리기"
LANG["PHXM_ADMIN_WAIT_MIN_PLAYERS"] = "게임 시작 전에 기다려야하는 최소 플레이어 수 (기본값 : 1)"
LANG["PHXM_ENABLE_PLAYER_JOIN_LEAVE"] =
    "플레이어 참가 및 퇴장에 대한 채팅 알림을 사용 하시겠습니까? 기본 알림 대신 사용자 지정 채팅 애드온을 사용하려면 0으로 설정하세요."

LANG["PHXM_ADMIN_FORCEJOINBALANCE"] = "플레이어 합류시 팀을 강제로 균등하게 만들기"
LANG["PHXM_ADMIN_ENABLETEAMBALANCE"] = "라운드 시작시 팀을 자동으로 균등하게 만들기 (팀 밸런스)"
LANG["PHXM_ADMIN_PICKUP_PROPS"] =
    "작은 프롭을 들 수 있게 할까요? 0: 비허용, 1: Hunters 팀 전용, 2: Props 팀 전용, 3: 모두 허용"

LANG["PHXM_ADMIN_TAUNTMODES"] = "도발 모드"
LANG["PHXM_ADMIN_TAUNTMODE_MODE"] = "--[ 현재 도발 모드는 %d 입니다. ]--"
LANG["PHXM_ADMIN_TAUNTMODE0"] = "모드 [0]: F3/랜덤 도발"
LANG["PHXM_ADMIN_TAUNTMODE1"] = "모드 [1]: C/커스텀 도발"
LANG["PHXM_ADMIN_TAUNTMODE2"] = "모드 [2]: 전체"
LANG["PHXM_ADMIN_TAUNTSOPEN"] = "도발 창 열기"

LANG["PHXM_MODE_DEFAULT"] = "--[ 현재 픽업 모드는 %d 입니다. ]--"
LANG["PHXM_MODE0"] = "모드 [0]: 비허용"
LANG["PHXM_MODE1"] = "모드 [1]: Hunters 팀 전용"
LANG["PHXM_MODE2"] = "모드 [2]: Props 팀 전용"
LANG["PHXM_MODE3"] = "모드 [3]: 픽업 허용"

--[[
	Admin Developer Sections
]]
LANG["PHXM_ADMIN_DEVSECTION"] = "개발자 옵션 / 실험 기능"
LANG["PHXM_ADMIN_ROOMCHECK"] = "경계 확인을 활성화 할까요? 활성화 시 물체/벽에 끼이는 것을 방지 해줍니다."
LANG["PHXM_ADMIN_USENEWMKBREN"] = "Bren MK II 보너스 무기에 새 모델 사용 (맵 재시작 필요)"
LANG["PHXM_ADMIN_BEVERBOSE"] = "개발자: Verbose 모드 활성화 - PH:X의 내부 정보와 이벤트를 표시하도록 설정"
LANG["PHXM_ADMIN_SHOWPLNAMEHEAD"] = "플레이어 팀 이름이 화면에 표시되도록 하기."
LANG["PHXM_ADMIN_USESINGLE_FZCAM"] =
    "사운드 목록 대신 단일 Freezecam 사운드 사용 ('ph_fc_cue_path'를 사용하여 Freezecam 사운드 경로 확인)"
LANG["PHXM_ADMIN_MODELLISTINGTYPE"] =
    "이전 모델 목록 사용 : 0 = 모든 플레이어 모델 (AddValidModel), 1 = 이전 모델 사용 : list.Get('PlayerOptionsModel')"
LANG["PHXM_ADMIN_JUMPPOWER"] = "Prop 팀 플레이어의 추가 점프 파워 배율"
LANG["PHXM_ADMIN_ENABLE_OBB"] =
    "개발자 : 구성 데이터에서 사용자 정의 된 Prop 엔티티 모델 경계 (OBB) 수정 자 사용"
LANG["PHXM_ADMIN_RELOAD_OBB"] = "개발자: 매 라운드 재시작 마다 OBB 수정 자 사용"

--[[
	Experimental & PH:X Features
]]
LANG["PHXM_ADMIN_EXPERIMENTALPHX"] = "새 PHX 실험 섹션"

LANG["PHXM_ADMIN_HLA_COMBINE"] = "HLA 콤바인 모델 지원 추가"
LANG["PHXM_ADMIN_TEAMBALANCE"] = "팀 밸런스 기능 활성화"
LANG["PHXM_ADMIN_CHANGETEAM_LIMIT"] = "팀 교체 제한 사용. -1 로 비활성화 할 수 있습니다. "
LANG["PHXM_ADMIN_USENEWCHAT"] =
    "새 채팅 박스 사용 (eChat) - 임시 대안입니다. 이미 있으시다면 체크 해제하세요."
LANG["PHXM_ADMIN_NEWCHATPOS"] = "새 채팅 상자 위치 : 높이 (Y) 위치를 N 픽셀만큼 뺍니다."
LANG["PHXM_ADMIN_RESPAWNONBLIND"] = "눈가림 시간에 부활 허용"
LANG["PHXM_ADMIN_RESPAWNONBLIND_TEAM"] =
    "눈가림 시간 중 특정 팀만 부활 허용: 0: 전체, 1: Hunters 팀, 2: Props 팀"
LANG["PHXM_ADMIN_REWSPANTIMEPERCENT"] =
    "눈가림 시간 중 부활할 수 있는 시간 퍼센트. 기본 값은 0.75 입니다. (75% * 최대 눈가림 시간)"
LANG["PHXM_ADMIN_ALLOWRESPAWN_SPECTATOR"] = "관전 팀에 배정할 때 눈가림 시간에 부활 허용"
LANG["PHXM_ADMIN_ALLOWRESPAWN_TEAMCHANGE"] =
    "다른 팀에 할당 될 때 눈가림 시간에 부활 허용 (활성화하지 않는 것이 좋습니다.)"

--[[
	MapVote Settings
]]
LANG["PHXM_MV_SETTINGS"] = "맵 투표 설정"

LANG["PHXM_MV_ALLOWCURMAP"] = "현재 맵을 투표할 수 있게 허용"
LANG["PHXM_MV_COOLDOWN"] = "투표에서 맵 쿨다운 활성화"
LANG["PHXM_MV_USE_ULX_VOTEMAPS"] = "ULX 맵 투표에서 목록을 가져올까요? 사용하지 않으면 기본 maps/*.bsp 맵이 사용됩니다."
LANG["PHXM_MV_MAPLIMIT"] = "맵 투표에서 보일 맵의 갯수."
LANG["PHXM_MV_TIMELIMIT"] = "투표 할 때 기본 맵 투표에 대한 시간 (초)."
LANG["PHXM_MV_MAPBEFOREREVOTE"] = "맵이 다시 나올때까지 필요한 맵 변경 횟수"
LANG["PHXM_MV_RTVCOUNT"] = "RTV (Rock the Vote)를 사용하는 데 필요한 플레이어 수"

LANG["PHXM_MV_EXPLANATION1"] =
    "어느 맵을 목록에 표시할지 지정하려면, 예를 들어 [ mv_map_prefix 'phx_,ph_,cs_,de_' ] 를 콘솔에 쓰면 됩니다."
LANG["PHXM_MV_EXPLANATION2"] =
    "ULX를 사용하는 경우 map_vote를 사용하시고, 그렇지 않은 경우 mv_start를 사용하세요."
LANG["PHXM_MV_EXPLANATION3"] =
    "맵 투표 활동 (취소하려면 !unmap_vote (ULX) 를 채팅에 입력하거나 mv_stop을 콘솔에 입력하세요.)"

LANG["PHXM_MV_START"] = "맵 투표 시작"
LANG["PHXM_MV_STOP"] = "맵 투표 중지"
--                  			  ^YOU VIOLATED THE LAW!

--[[ 
	Versioning, Credits or About section
]]
LANG["PHXM_ABOUT_VERSIONING"] = "버전: %s - Rev: %s"
LANG["PHXM_ABOUT_AUTHOR"] = "제작: %s"
LANG["PHXM_ABOUT_ENJOYING"] = "게임모드가 재미있으시다면 기부도 한번 고려 해주세요!"
LANG["PHXM_ABOUT_UPDATE"] = "Prop Hunt X 업데이트"
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
LANG["PHXM_ABOUT_LINKS"] = "링크 및 제작자"
LANG["PHXM_ABOUT_THANKS"] = "지원, 제안 및 기여에 도움주신 다음 분들께 감사드립니다.\n%s"
LANG["PHXM_ABOUT_BTN_DONATE"] = "PH:X를 후원으로 도와주세요"
LANG["PHXM_ABOUT_BTN_HOME"] = "PHX 홈페이지"
LANG["PHXM_ABOUT_BTN_GITHUB"] = "PHX GitHub 리포지터리"
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
LANG["HUD_PROP_CTAUNT_TIME"] = "커스텀 도발"

LANG["PHXM_TAB_PLUGINS"] = "에드온 & 플러그인"

-- Plugins Section
LANG["PLUGINS_NO_PLUGINS"] = "플러그인이 없습니다. 여기서 플러그인을 찾아보세요!"
LANG["PLUGINS_BROWSE_MORE"] = "더 많은 플러그인 찾아보기"
LANG["PLUGINS_SERVER_HAS_NO_PLUGINS"] =
    "이 서버에는 사용자 지정 애드온 / 플러그인이 설치되어 있지 않습니다."
LANG["PLUGINS_SERVER_SETTINGS"] = "-- 서버 설정 --"
LANG["PLUGINS_CLIENT_SETTINGS"] = "-- 클라이언트 설정 --"

-- Text Entries
LANG["TEXTENTRY_FZ_SINGLE"] = "Freeze Cam 단일 사운드 경로" -- this one is for ph_fc_cue_path command
LANG["TEXTENTRY_MV_PREFIX"] = "맵 투표 맵 접두사" -- the map previx for mv_map_prefix

--============= LATE ADDITION OF 29.10.21/X2Z. Please Improve your Language Here! =============--

LANG["MISC_GAME_ENDED"]		= "Game has ended."

--============= LATE ADDITION OF 16.09.21/X2Z. =============--

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
LANG["PHXM_ADMIN_FREEZECAM_HUNTER"]			= "Enable Freeze Cam features for team hunters"


--============= LATE ADDITION OF 10.06.2022/X2Z. =============--

LANG["PHXM_MSG_INPUT_IS_EMPTY"]			= "Text is empty or you didn't pressed ENTER key."
LANG["MISC_SET"]						= "Set"
LANG["MISC_APPLY"]						= "Apply"
LANG["MISC_NO"]							= "No"
LANG["MISC_YES"]						= "Yes"
LANG["MISC_WARN"]						= "Warning"
LANG["MISC_ERROR"]						= "Error"
LANG["MISC_INFO"]						= "Information"
LANG["MISC_NOTICE"]						= "Notice"
LANG["MISC_IDK"]						= "Unknown"
LANG["MISC_NA"]							= "N/A"

-- HUD
LANG["HUD_DECOY_ACTIVE"]                = "Press [%s]"
LANG["HUD_FAKETAUNT_COUNT"]             = "%ix Left"
LANG["HUD_FAKETAUNT_UNLI"]              = "Unlimited"
LANG["NOTICE_GRENADE_SMG_GIVEN"]        = "You are now acquired some SMG Grenades."

--[[
	ADMIN PANEL, Revision 10.06/2022/X2Z
]]--
LANG["PHXM_TAUNT_SETTINGS"]				= "Taunt Settings"
LANG["PHXM_GENERAL_SETTINGS"]			= "General Settings"
LANG["PHXM_FAKE_TAUNT_SETTINGS"]		= "Fake Taunt Settings"
LANG["PHXM_FAKE_TAUNT_ENABLE"]			= "Allow fake taunts to be played on random props in the map. Can be accessed only through Custom Taunt menu."
LANG["PHXM_FAKE_TAUNT_MAXUSAGE"]		= "Maximum usage for fake taunts to be used; -1 is unlimited."
LANG["PHXM_TAUNT_RIGHT_CLICK"]		    = "Right click for taunt. This will disable Right-clicking on custom menu!"

LANG["PHXM_TAUNT_PITCH_SETTINGS"]		= "Taunt Pitch Settings"
LANG["PHXM_TAUNT_PITCH_ENABLE"]			= "Enable Taunt Pitch"
LANG["PHXM_TAUNT_PITCH_RANGE_MIN"]		= "Minimum threshold/acceptable pitch range for a taunt. 1 to 99."
LANG["PHXM_TAUNT_PITCH_RANGE_MAX"]		= "Maximum threshold/acceptable pitch range for a taunt. 100 to 255."

LANG["PHXM_DECOY_SETTINGS"]				= "Decoy Settings"
LANG["PHXM_DECOY_ENABLE"]				= "Enable Decoy reward? Reward will be given ONLY ONCE for alive props until the round ends. They don't add and only substract once they're placed."

LANG["PHXM_DISABLE_FOOTSTEP"]           = "Toggle silent prop team footsteps"

LANG["PHXM_ADMIN_CHATSETTING"]			= "Chat Window Settings"
LANG["PHXM_ADMIN_HUNTERBLIND"]			= "Hunter Blind Control"

LANG["PHXM_ADMIN_GIVEGRENADE_NEAREND"]  = "Should grenades will be given near round end? If Yes, see 'ph_give_grenade_roundend_before_time'"
LANG["PHXM_ADMIN_GIVEGRENADE_TIME"]     = "Time in seconds to give grenades before Round Ends. This is typically between 10 to 30 seconds"

--[[
	Plugins in sh_init.lua, Revision 10.06/2022/X2Z
]]--
LANG["PLUG_NAME_VER"]					= "Plugin: %s | v.%s"
LANG["PLUG_DESCRIPTION"]				= "Description: %s"

--[[
	Taunt Pitch, Revision 10.06/2022/X2Z
]]--
LANG["PHX_CTAUNT_USE_PITCH"]			= "Use pitch for custom taunts"
LANG["PHX_CTAUNT_RANDOM_PITCH"]			= "Randomize pitch when playing taunt"
LANG["PHX_RTAUNT_USE_PITCH"]			= "Use pitch for random taunts [%s]"
LANG["PHX_RTAUNT_RANDOMIZE"]			= "Randomize pitch for random taunts [%s]"
LANG["PHX_CTAUNT_PITCH_FOR_FAKE"]		= "Use pitch for fake taunts"
LANG["PHX_CTAUNT_RANDPITCH_FOR_FAKE"]	= "Randomize pitch for fake taunts"
LANG["PHX_CTAUNT_SLIDER_PITCH"]			= "Taunt pitch slider."
LANG["TM_TOOLTIP_FAKETAUNT"]			= "Play a Fake Taunt on random prop"
LANG["TM_PREFERRED_PITCH"]              = "Preferred Taunt Pitch Level"

--[[
	Fake Taunt, Revision 10.06/2022/X2Z
	Description: Play fake taunts on random props in the map (Not Players)
]]--
LANG["PHX_CTAUNT_ON_RAND_PROPS"]		= "Play on random props (%ix)"
LANG["PHX_CTAUNT_ON_RAND_PROPS_UNLI"]	= "Play on random props"
LANG["PHX_CTAUNT_PLAYED_ON_RANDPROP"]	= "You played a taunt on a random prop."
LANG["PHX_CTAUNT_RAND_PROPS_LIMIT"]		= "You have hit the limit!"
LANG["PHX_CTAUNT_RAND_PROPS_NOT_PROP"]  = "Not available at this moment."
LANG["PHX_CTAUNT_RANDPROP_DISABLED"]	= "Fake taunt is currently disabled."

--[[
	PH:Z Simple Decoy, Revision 10.06/2022/X2Z
]]--
LANG.DECOY_PROP	= {
	"killed the dummy!",
	"feel regret after killing a dummy.",
	"killed a decoy.",
	"killed an innocent dummy.",
	"feel embarrased after killing a dummy."
}

LANG["DECOY_PUT_SUCC"]					= "Decoy successfully placed."
LANG["DECOY_CANT_PUT_HERE"]				= "Cannot put decoy here."
LANG["DECOY_GET_REWARD"]				= "Congrats! You received ['Prop Decoy'] for suviving this round!"
LANG["DECOY_REMINDER_GET"]              = "You have a Decoy/Dummy prop! Place somewhere to confuse hunters!"
LANG["DECOY_FRAGS_RECEIVED"]			= "Decoy successfully baited: You stole 1 score from %s!"
LANG["DECOY_DISABLED"]					= "Currently, decoy is unavailable."
LANG["PHXM_CL_DECOY_KEYBIND"]			= "Default key to place a decoy prop. Default is 1 (not keypad 1)."

LANG["DECOY_INDICATOR_INVALID"]         = "Invalid Slope!"
LANG["DECOY_INDICATOR_TOOFAR"]          = "Range too far!"
LANG["DECOY_INDICATOR_OK"]              = "Place Decoy [Press %s]"

LANG["PHXM_DECOY_HEALTH"]				= "How much health does the decoy should have. Default is 10."
LANG["PHXM_PLAYER_SHOW_DECOY_HELPER"]   = "Show/Hide Decoy placement helper? This will show a white dot with a text near on your crosshair."
LANG["PHXM_PLAYER_SHOW_DECOY_MARKER"]   = "Show/Hide Decoy marker?"

--[[
	Revision 10.06/2022/X2Z
    Prop Menu Update: Menu, Editor, Browser
]]--
LANG["PCR_MODEL_DONT_EXISTS"]   = "Sorry, this model is not available at the moment!"

LANG["PCR_PLUG_WARN_MSG"]		= "Warning: Custom Prop Addition (pcr_allow_custom) is set to 0.\nYou Must Enable this feature in order to edit your custom prop!\nA Map change is required to change this setting."
LANG["PCR_PLUG_LBL_BINDKEY"]	= "To change bind key, switch to '[Player] tab."
LANG["PCR_PLUG_LBL_EDITOR"]		= "Custom Prop Menu Editor"
LANG["PCR_PLUG_BTN_OPEN_EDT"]	= "Open Editor"
LANG["PCR_PLUG_LBL_COMSET"]		= "Common Settings"
LANG["PCR_PLUG_LBL_TECHSET"]	= "Technical Settings"
LANG["PCR_PLUG_LBL_EXPSET"]		= "Experimentals"
LANG["PCR_PLUG_LBL_PLAYERSET"]	= "Player Settings"

LANG["PCR_PLUG_ENABLE"]			= "Enable 'Prop Menu' feature"
LANG["PCR_PLUG_ALLOW_CUSTOM"]	= "(Require Map Restart) Allow custom props to be added in to the Prop Menu list?"
LANG["PCR_PLUG_PROP_BAN"]		= "(Require Map Restart) Do not include banned props into Prop Menu list?"
LANG["PCR_PLUG_USAGE_LIMIT"]	= "Maximum usage limit for player to use. -1 means unlimited."
LANG["PCR_PLUG_PROP_LIMIT"]		= "(Require Map Restart) Limit amount of prop addition to Prop Menu list"
LANG["PCR_PLUG_PROP_LIMITMAX"]	= "Maximum amount of props that will be added to Prop Menu list. Note: This will be randomly added!"
LANG["PCR_PLUG_USE_ULXMENU"]	= "Should Prop Menu can be accessed by Console (0) or ULX (1)? Bound key will respect with this setting"
LANG["PCR_PLUG_USE_DELAY"]		= "Delay in seconds before player to use another Prop in Prop Menu"
LANG["PCR_PLUG_KICK_INVALID"]	= "Kick any user attempt to access Invalid Model (4x Max. threshold)"
LANG["PCR_PLUG_SPACE_CHECK"]	= "Check for space for a room before player use another prop to prevent Stuck"
LANG["PCR_PLUG_X_BBOX"]			= "(Require Map Restart) Check Entity BBox Limit before adding to Prop Menu list"
LANG["PCR_PLUG_X_BBOX_MAX"]		= "BBox CollisionBound Maximum Height limit. Mins will be auto-calculated."
LANG["PCR_PLUG_X_BBOX_MIN"]		= "BBox CollisionBound Maximum Width limit. ins will be auto-calculated."
LANG["PCR_PLUG_ONLY_GROUPS"]	= "Should Prop Menu can only be accessed by certain groups e.g. Donator?"
LANG["PCR_PLUG_NOTIFYMSG"]		= "Notify player on how to use Prop Menu on every round start"

LANG["PCR_EDITOR_MSG_ERROR"]	= "Your changes hasn't been saved due to Errors.\nPlease check on your server console!"
LANG["PCR_EDITOR_MSG_SUCC"]		= "Your changes and Custom Prop data has has been saved and updated successfully."

LANG["PHZ_generic_title"]		= "Custom Prop Inclusion Editor"
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
LANG["PHZ_generic_mdlinfoStart"] = "(Select model first!)"

LANG["PHZ_generic_no_ragdoll"]	= "No: Ragdoll"
LANG["PHZ_generic_titlelabel"]	= "%s Preview :"

LANG["PHZ_mount_game_sel"]		= "Select mounted game (Default: Garry's Mod)"
LANG["PHZ_input_placeholder1"]	= "Folder to Search: <folder name> or '*', blank for all folders."
LANG["PHZ_input_placeholder2"]  = "Addon to Search: <name> or '*', blank for all folders."
LANG["PHZ_msg_warn_close"]		= "Are you sure you want to close this window? Any unsaved edits will be lost!"
LANG["PHZ_msg_commit"] 			= "Are you sure you want to commit changes?"
LANG["PHZ_msg_cant_empty"]		= "Prop List cannot be empty!"
LANG["PHZ_msg_removesel"] 		= [[Remove selected props in the list. Legends:
Red = Marked Selections
Yellow: Prop don't exists in server AND should be Removed.]]
LANG["PHZ_msg_warn_mdlinlist"]  = "WARNING: This Model is already in the list!"
LANG["PHZ_msg_invalid_mdl"] 	= "Reason: This is invalid model"
LANG["PHZ_apply_select"] 		= "Apply & Save Selections"
LANG["PHZ_menu_copy"] 		= "Copy Model"
LANG["PHZ_menu_refresh"] 	= "Refresh Model"
LANG["PHZ_tooltip_removesel"]	= "Remove Selected"
LANG["PHZ_tooltip_wasmarked"] = [[This prop was marked because it does't exist in the server.
If you close this editor, this will automatically removed.]]

LANG["PHZ_pcr_fb_allcontent"] = "All Contents (Not All Players/Server will have same contents as you)"
LANG["PHZ_pcr_fb_notmounted"] = "%s [Not Mounted]"

PHX.LANGUAGES[LANG.code] = LANG