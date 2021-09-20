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
	if PHX:GetCVar( "ph_custom_taunt_mode" ) < 1 then
		PHX:ChatInfo(PHX:Translate("TM_WARNING_CT_DISABLE"), "WARNING")
		return
	end
	
	window.CurrentlyOpen = true

	window.frame = vgui.Create("DFrame")
	window.frame:SetSize(490,680)
	window.frame:SetTitle( PHX:FTranslate("TM_WINDOW_TITLE") )
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
	window.list:SetSize(0,505)
	window.list:Dock(BOTTOM)
	
	window.comb = vgui.Create("DComboBox", window.frame)
	window.comb:Dock(TOP)
	window.comb:SetSize(0, 20)
	window.comb:SetValue( PHX.DEFAULT_CATEGORY )
	
	window.input = vgui.Create("DTextEntry", window.frame)
	window.input:Dock(TOP)
	window.input:SetSize(0, 20)
	window.input:DockMargin(0,5,0,0)
	window.input:SetPlaceholderText( PHX:FTranslate("TM_SEARCH_PLACEHOLDER") )
	
	window.input.OnGetFocus = function()
		window.frame:SetKeyboardInputEnabled(true)
	end
	
	window.input.OnLoseFocus = function(self)
		window.frame:SetKeyboardInputEnabled(false)
	end
	
	-- Let's Initialize the window.list.
	local defaultList = PHX.TAUNTS[PHX.DEFAULT_CATEGORY]
	
	-- Make sure each category isn't empty and has lines.
	local hasLines = false
	
	-- add default list
	for name,_ in pairs( defaultList[LocalPlayer():Team()] ) do window.list:AddLine( name ) end
	hasLines = true
	
	-- add category list
	for category,_ in pairs( PHX.TAUNTS ) do
		-- don't add if team taunt data is empty!
		if PHX.TAUNTS[category][LocalPlayer():Team()] and PHX.TAUNTS[category][LocalPlayer():Team()] ~= nil then
			window.comb:AddChoice( category )
		end
	end
	
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
	
	function window:ResetList( ls )
		if !table.IsEmpty(ls) then
			for name,_ in pairs( ls ) do
				self.list:AddLine( name )
			end
			hasLines = true
		else
			self.list:AddLine( PHX:FTranslate("TM_NO_TAUNTS") )
			hasLines = false
		end
	end
	
	function window:DoSearch( ls, strToFind )
		local tTemp = {}
		
		if !table.IsEmpty(ls) then
			for name,_ in pairs( ls ) do
				if string.find(string.lower(name), strToFind) then -- just accept upper case too.
					table.insert(tTemp, name)
				end
			end
			
			if !table.IsEmpty(tTemp) then
				for _,v in pairs(tTemp) do
					self.list:AddLine( v )
				end
				hasLines = true
			else
				self.list:AddLine( PHX:FTranslate("TM_TAUNTS_SEARCH_NOTHING", strToFind) )
				hasLines = false
			end
			
		else
			self.list:AddLine( PHX:FTranslate("TM_NO_TAUNTS") )
			hasLines = false
		end
	end
	
	function window.input:OnEnter( val )
		window.list:Clear()
		hastaunt = false
		
		local t = PHX.TAUNTS[window.CurrentCategory][LocalPlayer():Team()]
		
		if (val == "" or !val or val == nil) then
			window:ResetList( t )
		else
			window:DoSearch( t, val )
		end
		
		window.comb:SortAndStyle(window.list)
	end
	
	function window.comb:OnSelect(_, val)
		window.list:Clear()
		hastaunt = false
		window.CurrentCategory = val
		window.input:SetText("")
			
		local t = PHX.TAUNTS[val][LocalPlayer():Team()]
		window:ResetList( t )
			
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
		local delay = lastTauntTime + PHX:GetCVar( "ph_customtaunts_delay" )
	
		if (delay <= CurTime()) then
			net.Start("CL2SV_PlayThisTaunt"); net.WriteString(tostring(snd)); net.SendToServer();
			LocalPlayer():SetNWFloat( "localLastTauntTime", CurTime() + PHX:GetCVar( "ph_customtaunts_delay" ) )
		else
			PHX:ChatInfo( PHX:Translate("TM_NOTICE_PLSWAIT", tostring(math.Round(delay - CurTime()))) , "WARNING" )
		end
	end
	
	CreateStyledButton(LEFT,86,PHX:FTranslate("TM_TOOLTIP_PLAYTAUNT"),{5,5,5,5},"vgui/phehud/btn_playpub.vmt",FILL, function()
		if hastaunt and hasLines then
			local getline = TranslateTaunt(window.CurrentCategory, window.list:GetLine(window.list:GetSelectedLine()):GetValue(1))
			SendToServer(getline)
		end
	end)
	CreateStyledButton(LEFT,86,PHX:FTranslate("TM_TOOLTIP_PREVIEW"),{5,5,5,5}, "vgui/phehud/btn_play.vmt",FILL, function()
		if hastaunt and hasLines then
			local getline = TranslateTaunt(window.CurrentCategory, window.list:GetLine(window.list:GetSelectedLine()):GetValue(1))
			surface.PlaySound(getline)
			PHX:AddChat(PHX:Translate("TM_NOTICE_PLAYPREVIEW", getline), Color(20,220,0))
		end
	end)
	CreateStyledButton(LEFT,86,PHX:FTranslate("TM_TOOLTIP_PLAYCLOSE"),{5,5,5,5},"vgui/phehud/btn_playx.vmt",FILL, function()
		if hastaunt and hasLines then
			local getline = TranslateTaunt(window.CurrentCategory, window.list:GetLine(window.list:GetSelectedLine()):GetValue(1))
		
			SendToServer(getline)
			window.frame:Close()
		end
	end)
	CreateStyledButton(LEFT,86,PHX:FTranslate("TM_TOOLTIP_PLAYRANDOM"),{5,5,5,5},"vgui/phehud/btn_playrandom.vmt",FILL, function()
		if hasLines then
			local getRandom = table.Random(window.list:GetLines())
			local getline = TranslateTaunt(window.CurrentCategory, getRandom:GetValue(1))
			SendToServer(getline)
		end
	end)
	CreateStyledButton(FILL,86,PHX:FTranslate("TM_TOOLTIP_CLOSE"),{5,5,5,5},"vgui/phehud/btn_close.vmt",FILL, function()
		window.frame:Close()
	end)
	
	window.list.OnRowRightClick = function(panel,line)
		if !PHX:GetCVar( "ph_prop_right_mouse_taunt" ) then -- don't show menu if Prop Taunt Right Click is enabled!
			hastaunt = true
			local getline = TranslateTaunt(window.CurrentCategory, window.list:GetLine(window.list:GetSelectedLine()):GetValue(1))
			
			local menu = DermaMenu()
			menu:AddOption(PHX:FTranslate("TM_TOOLTIP_PREVIEW"), function() if hasLines then surface.PlaySound(getline); PHX:AddChat(PHX:Translate("TM_NOTICE_PLAYPREVIEW", getline), Color(20,220,0)); end end):SetIcon("icon16/control_play.png")
			menu:AddOption(PHX:FTranslate("TM_TOOLTIP_PLAYTAUNT"), function() if hasLines then SendToServer(getline); end end):SetIcon("icon16/sound.png")
			menu:AddOption(PHX:FTranslate("TM_TOOLTIP_PLAYCLOSE"), function() if hasLines then SendToServer(getline); window.frame:Close(); end end):SetIcon("icon16/sound_delete.png")
			menu:AddSpacer()
			menu:AddOption(PHX:FTranslate("TM_MENU_CLOSE"), function() window.frame:Close(); end):SetIcon("icon16/cross.png")
			menu:Open()
		end
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
	PHX:ChatInfo( PHX:Translate("TM_PLAY_ONLY_ALIVE"), "WARNING" )
end
end, nil, "Show Prop Hunt taunt menu")