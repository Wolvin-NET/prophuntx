--[[
////////////////////////////////////////////
	PLEASE DO NOT MODIFY/EDIT THIS FILE.
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
]]

hook.Add("PH_CustomTabMenu", "PHX.About", function(tab, pVgui, paintPanelFunc)
	
	surface.CreateFont("PHX.TitleFont", 
	{
		font = "Roboto",
		size = 40,
		weight = 700,
		antialias = true,
		shadow = true
	})
	
	local panel = vgui.Create("DPanel", tab)
	panel:SetBackgroundColor(Color(40,40,40,120))
	panel:Dock(FILL)
	
	local scroll = vgui.Create( "DScrollPanel", panel )
	scroll:Dock(FILL)
	
	local grid = vgui.Create("DGrid", scroll)
	grid:Dock(NODOCK)
	grid:SetPos(10,10)
	grid:SetCols(1)
	grid:SetColWide(800)
	grid:SetRowHeight(50)
	
	local label = {
		title 	= "Prop Hunt: XIIZ",
		author	= GAMEMODE.Author,
		version = GAMEMODE._VERSION,
		rev 	= GAMEMODE.REVISION,
		credits	= "Godfather ♥, Galaxio, Yam, adk, Haeiven, Jonpopnycorn, Thundernerd, TR1NITY",
		lgit	= "https://github.com/Wolvin-NET/prophuntx/",
		lhome	= "https://wolvindra.xyz/prophuntx",
		ldonate = GAMEMODE.DONATEURL,
		lwiki	= "https://wolvindra.xyz/wiki/prophuntx",
		lklog	= "https://wolvindra.xyz/phxchangelogs",
		lplugins = "https://wolvindra.xyz/phxplugins"
	}
	
	pVgui("","label","PHX.TitleFont",grid, label.title )
	pVgui("","label","Trebuchet24",grid, PHX:FTranslate("PHXM_ABOUT_AUTHOR", label.author) )
	pVgui("","label","Trebuchet24",grid, PHX:FTranslate("PHXM_ABOUT_VERSIONING", label.version, label.rev) )
	pVgui("","label",false,grid, PHX:FTranslate("PHXM_ABOUT_ENJOYING") )
	pVgui("","label",false,grid, PHX:FTranslate("PHXM_ABOUT_UPDATE") )
	pVgui("","btn",{max = 2,textdata = {
		-- This section isn't translated by intentionally. Because the response always returned to English anyway.
		[1] = {"View update info", function() PHX:notifyUser() end},
		[2] = {"Check for Updates", 
			function()
				PHX:CheckUpdate()
				Derma_Query("Update has been checked. Please check on the Console for more information.\n\nWould you like to view update what's new & info?","Update Info","View Update", function()
					PHX:notifyUser()
				end,
				"No", function() end)
			end},
	}},grid,"")
	pVgui("","label",false,grid, PHX:FTranslate("PHXM_ABOUT_LINKS") )
	pVgui("","btn",{max = 6, textdata = {
		[1] = {PHX:FTranslate("PHXM_ABOUT_BTN_DONATE"),		function() gui.OpenURL(label.ldonate)  end},
		[2] = {PHX:FTranslate("PHXM_ABOUT_BTN_HOME"),		function() gui.OpenURL(label.lhome)    end},
		[3] = {PHX:FTranslate("PHXM_ABOUT_BTN_GITHUB"),		function() gui.OpenURL(label.lgit)     end},
		[4] = {PHX:FTranslate("PHXM_ABOUT_BTN_PLUGINS"),  	function() gui.OpenURL(label.lplugins) end},
		[5] = {PHX:FTranslate("PHXM_ABOUT_BTN_CHANGELOGS"),	function() gui.OpenURL(label.lklog)    end},
		[6] = {PHX:FTranslate("PHXM_ABOUT_BTN_WIKI"),		function() gui.OpenURL(label.wiki)     end}
	}},grid,"")
	pVgui("spacer2","spacer",nil,grid,"" )
	pVgui("","label","Trebuchet24",grid, PHX:FTranslate("PHXM_ABOUT_THANKS", label.credits) )
	
	local PanelModify = tab:AddSheet("", panel, "vgui/ph_iconmenu/m_info.png")
	paintPanelFunc(PanelModify, PHX:FTranslate("PHXM_TAB_ABOUT"))

end)