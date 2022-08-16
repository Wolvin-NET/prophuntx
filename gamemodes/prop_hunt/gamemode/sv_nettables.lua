local nets = {
	-- sv_admins: --13
	"CheckAdminFirst",
	"CheckAdminResult",
	"SvCommandReq",
	"SvCommandSliderReq",
	"SendTauntStateCmd",
	"PHXPickupCmdState",
	"SvCommandTextEntry",
	"SvCommandLang",
    "SvCheckboxReq",
    "PHX.AdminGroupInfo",
    "PHX.CLAdminGroupInfo",
	"PHX.MutedGroupInfo",
	"PHX.CLMutedGroupInfo",
	-- end of sv_admins

	"ResetHull",
	"SetHull",
	"PlayFreezeCamSound",
	"PlayerSwitchDynamicLight",
	"DisableDynamicLight",
	--"PH_ShowTutor",
	
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

    "PHX.DeathNoticeDecoy",
	"PHX.UpdatePropbanInfo",
    
	"PHX.scan_ReqTaunts",
	"PHX.scan_SendTauntLists",

    -- X2Z Very-first Tutorial Window
	"phx_showVeryFirstTutorial"
}

for _,init in pairs(nets) do
	util.AddNetworkString( init )
end