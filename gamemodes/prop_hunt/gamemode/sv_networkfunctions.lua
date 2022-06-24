local nets = {
	"ResetHull", 
	"SetBlind", 
	"SetHull", 
	"PlayFreezeCamSound", 
	"PlayerSwitchDynamicLight", 
	"DisableDynamicLight", 
	"PH_ShowTutor", 
	
	"CheckAdminFirst", 
	"CheckAdminResult", 
	"SvCommandReq", 
	"SvCommandSliderReq", 
	"SendTauntStateCmd", 
	
	"CL2SV_PlayThisTaunt", 
	
	"PH_ForceCloseTauntWindow", 
	"PH_AllowTauntWindow", 
	"PH_TeamWinning_Snd", 
	"AutoTauntSpawn", 
	"AutoTauntRoundEnd", 
	
	"PHX.rotateState", 
	
	"PHX.CenterPrint",
	"PHX.ChatPrint", 
	"PHX.bubbleNotify", 
	"PHX.ChatInfo", 
	
	"PHXPickupCmdState", 
	"SvCommandTextEntry",
	"SvCommandLang",
	
    "PHX.DeathNoticeDecoy",
	"PHX.UpdatePropbanInfo",
    
	"PHX.scan_ReqTaunts",
	"PHX.scan_SendTauntLists",
	
	-- X2Z Very-first Tutorial Window
	"phx_showVeryFirstTutorial"
}

for _,init in pairs(nets) do
	util.AddNetworkString(init)
end