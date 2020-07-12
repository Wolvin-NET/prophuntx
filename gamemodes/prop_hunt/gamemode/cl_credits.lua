--[[
	PLEASE DO NOT CHANGE THIS FILE.
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
		title 	= "Prop Hunt X",
		author	= "by: Wolvindra-Vinzuerio & D4UNKN0WNM4N.",
		version = GAMEMODE._VERSION,
		rev 	= GAMEMODE.REVISION,
		credits	= "Godfather ♥, Yam, adk, Lucas2107, Jonpopnycorn, Thundernerd",
		lgit	= "https://www.google.com",
		lhome	= "https://www.wolvindra.net/prophuntx",
		ldonate = GAMEMODE.DONATEURL,
		lwiki	= "https://www.google.com",
		lklog	= "https://www.google.com",
		lplugins = "https://prophunt.wolvindra.net/plugins"
	}
	
	pVgui("","label","PHX.TitleFont",grid, label.title )
	pVgui("","label","Trebuchet24",grid, "Current Version: "..label.version.." | Current Revision: "..label.rev)
	pVgui("","label","Trebuchet24",grid, "If you are enjoyed with the gamemode, Please support by Donating!" )
	pVgui("spacer0","spacer",nil,grid,"" )
	--pVgui("","label",false,grid, "Changelog & Updates" )
	--[[ pVgui("","btn",{max = 2,textdata = {
		[1] = {"See Changelog", 	  function() gui.OpenURL(label.lklog); tab:GetParent():Close() end},
		[2] = {"Check for Updates", 
			function()
				LocalPlayer():ConCommand("ph_check_update")
				Derma_Message("Check on your console by pressing [~] or F10 key!","Checking Updates","OK, Got it!")
			end},
	}},grid,"") ]]
	pVgui("spacer1","spacer",nil,grid,"" )
	pVgui("","label",false,grid, "Helpful External Links & Credits" )
	pVgui("","btn",{max = 2,textdata = {
		[1] = {"Support the Project by Donating!", 	  				  function() gui.OpenURL(label.ldonate) end},
		--[2] = {"PHX Official Homepage", 	  function() gui.OpenURL(label.lhome) end},
		--[3] = {"GitHub Repository", 	  	  function() gui.OpenURL(label.lgit) end},
		--[4] = {"PHX Manuals & Wiki", 		  function() gui.OpenURL(label.lwiki) end},
		[2] = {"PHX Addons/Plugins", 		  function() gui.OpenURL(label.lplugins) end}
	}},grid,"")
	pVgui("spacer1","spacer",nil,grid,"" )
	pVgui("","label","Trebuchet24",grid, "Special Thanks for the support, suggestion & contributing:\n"..label.credits )
	
	local PanelModify = tab:AddSheet("", panel, "vgui/ph_iconmenu/m_info.png")
	paintPanelFunc(PanelModify, "About")

end)