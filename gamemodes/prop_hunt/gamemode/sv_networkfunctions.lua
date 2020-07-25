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
	"PH_RoundDraw_Snd", 
	"PH_TeamWinning_Snd", 
	"AutoTauntSpawn", 
	"AutoTauntRoundEnd", 
	
	"PHX.rotateState", 
	
	"PHX.ChatPrint", 
	"PHX.bubbleNotify", 
	"PHX.ChatInfo", 
	
	"PHXPickupCmdState", 
	"SvCommandTextEntry",
	"SvCommandLang"
}

for _,init in pairs(nets) do
	util.AddNetworkString(init)
end