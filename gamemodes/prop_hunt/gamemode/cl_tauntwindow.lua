local window = {}

surface.CreateFont("PHX.TauntFont", 
{
	font = "Roboto",
	size = 16,
	weight = 500,
	antialias = true,
	shadow = false
})

local hastaunt = false

window.state = false
window.CurrentlyOpen = false

net.Receive("PH_ForceCloseTauntWindow", function()
	if window.CurrentlyOpen then
		window.frame:Close()
	end
	window.state = false
end)

net.Receive("PH_AllowTauntWindow", function()
	window.state = true
end)

local function MainFrame()
	if PHX.CVAR.CustomTauntMode:GetInt() < 1 then
		chat.AddText(Color(220,0,0),"[PHX - Taunts] Warning: This server has custom taunts disabled.")
		return
	end
	
	window.CurrentlyOpen = true

	window.frame = vgui.Create("DFrame")
	window.frame:SetSize(490,600)
	window.frame:SetTitle("Prop Hunt Custom Taunt Window")
	window.frame:SetVisible(true)
	window.frame:ShowCloseButton(true)
	window.frame:Center()
	window.frame:SetMouseInputEnabled(true)
	window.frame:SetKeyboardInputEnabled(true)
	
	window.frame.Paint = function(self,w,h)
		surface.SetDrawColor(Color(40,40,40,180))
		surface.DrawRect(0,0,w,h)
	end
	
	window.frame.OnClose = function()
		window.CurrentlyOpen = false
		hastaunt = false
	end
	
	window.list = vgui.Create("DListView", window.frame)
	
	window.list:SetMultiSelect(false)
	window.list:AddColumn("soundlist") -- does nothing because header is invisible.
	window.list.m_bHideHeaders = true
	window.list:SetPos(10,52)
	window.list:SetSize(0,450)
	window.list:Dock(BOTTOM)
	
	window.comb = vgui.Create("DComboBox", window.frame)
	window.comb:Dock(TOP)
	window.comb:SetSize(0, 20)
	window.comb:SetValue( PHX.DEFAULT_CATEGORY )
	
	-- Let's Initialize the window.list.
	local defaultList = PHX.TAUNTS[PHX.DEFAULT_CATEGORY]
	
	-- add default list
	for name,_ in pairs( defaultList[LocalPlayer():Team()] ) do window.list:AddLine( name ) end
	-- add category list
	for category,_ in pairs( PHX.TAUNTS ) do window.comb:AddChoice( category ) end
	
	function window.comb:SortAndStyle( pnl )
		pnl:SortByColumn(1,false)
		
		pnl.Paint = function(self,w,h)
			surface.SetDrawColor(Color(50,50,50,180))
			surface.DrawRect(0,0,w,h)
		end
		
		local color = 
		{
			hover 	= Color(80,80,80,200),
			select 	= Color(120,120,120,255),
			alt		= Color(60,60,60,180),
			normal 	= Color(50,50,50,180)
		}
		
		for _,line in pairs( pnl:GetLines() ) do
			function line:Paint( w, h )
				if ( self:IsHovered() ) then
					surface.SetDrawColor(color.hover)
				elseif ( self:IsSelected() ) then
					surface.SetDrawColor(color.select)
				elseif ( self:GetAltLine() ) then
					surface.SetDrawColor(color.alt)
				else
					surface.SetDrawColor(color.normal)
				end
				surface.DrawRect(0,0,w,h)
			end
			for _,col in pairs(line["Columns"]) do
				col:SetFont("PHX.TauntFont")
				col:SetTextColor(color_white)
			end
		end
	end
	
	function window.comb:OnSelect(_, val)
		window.list:Clear()
		hastaunt = false
		window.CurrentCategory = val
		
			local ls = PHX.TAUNTS[val][LocalPlayer():Team()]
		
			if !table.IsEmpty(ls) then
				for name,_ in pairs( ls ) do
					window.list:AddLine( name )
				end
			else
				window.list:AddLine("Warning: No taunts detected in this category.")
			end
		
		self:SortAndStyle(window.list)
	end
	
	window.CurrentCategory = PHX.DEFAULT_CATEGORY
	window.comb:SortAndStyle(window.list)
	
	local btnpanel = vgui.Create("DPanel", window.frame)
	btnpanel:Dock(FILL)
	btnpanel:SetBackgroundColor(Color(20,20,20,200))
	
	local function CreateStyledButton(dock, size, ttip, margin, texture, imagedock, btnfunction)
		local left,top,right,bottom = margin[1],margin[2],margin[3],margin[4]
		
		local button = vgui.Create("DButton", btnpanel)
		button:Dock(dock)
		button:SetSize(size,0)
		button:DockMargin(left,top,right,bottom)
		button:SetText("")
		button:SetTooltip(ttip)
		
		button.Paint = function(self,w,h)
			if self:IsHovered() then
				surface.SetDrawColor(Color(90,90,90,200))
			else
				surface.SetDrawColor(Color(0,0,0,0))
			end
			surface.DrawRect(0,0,w,h)
		end
		
		button.DoClick = btnfunction
		
		local image = vgui.Create("DImage", button)
		image:SetImage(texture)
		image:Dock(imagedock)
	end
	
	local function TranslateTaunt(category, linename)
		local tm = LocalPlayer():Team()
		return PHX.TAUNTS[category][tm][linename]
	end
	
	local function SendToServer(snd)
		local lastTauntTime = LocalPlayer():GetNWFloat("localLastTauntTime", 0)
		local delay = lastTauntTime + PHX.CVAR.CustomTauntDelay:GetInt()
	
		if (delay <= CurTime()) then
			net.Start("CL2SV_PlayThisTaunt"); net.WriteString(tostring(snd)); net.SendToServer();
			LocalPlayer():SetNWFloat( "localLastTauntTime", CurTime() + PHX.CVAR.CustomTauntDelay:GetInt() )
		else
			chat.AddText(Color(220,40,0),"[PHX - Taunts] Warning: ",Color(220,220,220), "Please wait in " .. tostring(math.Round(delay - CurTime())) .. " second(s)!")
		end
	end
	
	CreateStyledButton(LEFT,86,"Play Taunt",{5,5,5,5},"vgui/phehud/btn_playpub.vmt",FILL, function()
		if hastaunt then
			local getline = TranslateTaunt(window.CurrentCategory, window.list:GetLine(window.list:GetSelectedLine()):GetValue(1))
			SendToServer(getline)
		end
	end)
	CreateStyledButton(LEFT,86,"Preview Taunt",{5,5,5,5}, "vgui/phehud/btn_play.vmt",FILL, function()
		if hastaunt then
			local getline = TranslateTaunt(window.CurrentCategory, window.list:GetLine(window.list:GetSelectedLine()):GetValue(1))
			surface.PlaySound(getline)
			chat.AddText(Color(20,220,0), "[PH] Playing taunt: ".. window.list:GetLine(window.list:GetSelectedLine()):GetValue(1) )
		end
	end)
	CreateStyledButton(LEFT,86,"Play Taunt and Close",{5,5,5,5},"vgui/phehud/btn_playx.vmt",FILL, function()
		if hastaunt then
			local getline = TranslateTaunt(window.CurrentCategory, window.list:GetLine(window.list:GetSelectedLine()):GetValue(1))
		
			SendToServer(getline)
			window.frame:Close()
		end
	end)
	CreateStyledButton(LEFT,86,"Play Random Taunt",{5,5,5,5},"vgui/phehud/btn_playrandom.vmt",FILL, function()
		local getRandom = table.Random(window.list:GetLines())
		local getline = TranslateTaunt(window.CurrentCategory, getRandom:GetValue(1))
		SendToServer(getline)
	end)
	CreateStyledButton(FILL,86,"Close the Window",{5,5,5,5},"vgui/phehud/btn_close.vmt",FILL, function()
		window.frame:Close()
	end)
	
	window.list.OnRowRightClick = function(panel,line)
		hastaunt = true
		local getline = TranslateTaunt(window.CurrentCategory, window.list:GetLine(window.list:GetSelectedLine()):GetValue(1))
		
		local menu = DermaMenu()
		menu:AddOption("Preview Taunt", function() surface.PlaySound(getline); print("Playing: "..getline); end):SetIcon("icon16/control_play.png")
		menu:AddOption("Play Taunt", function() SendToServer(getline); end):SetIcon("icon16/sound.png")
		menu:AddOption("Play and Close", function() SendToServer(getline); window.frame:Close(); end):SetIcon("icon16/sound_delete.png")
		menu:AddSpacer()
		menu:AddOption("Close Menu", function() window.frame:Close(); end):SetIcon("icon16/cross.png")
		menu:Open()
	end
	
	window.list.OnRowSelected = function()
		hastaunt = true
	end
	
	window.list.DoDoubleClick = function(id,line)
		hastaunt = true
		local getline = TranslateTaunt(window.CurrentCategory, window.list:GetLine(window.list:GetSelectedLine()):GetValue(1))
		SendToServer(getline)
		
		if PHX.CLCVAR.AutoCloseTaunt:GetBool() then window.frame:Close(); end
	end
	
	window.frame:MakePopup()
	window.frame:SetKeyboardInputEnabled(false)
end

concommand.Add("ph_showtaunts", function(ply)
if ply:Alive() and window.state and ply:GetObserverMode() == OBS_MODE_NONE then
	if !window.CurrentlyOpen then
		MainFrame()
	end
else
	chat.AddText(Color(220,40,0),"[PHX Taunts] Notice: ",Color(220,220,220), "You can only play custom taunts when you\'re alive as prop/hunter!")
end
end, nil, "Show Prop Hunt taunt menu")