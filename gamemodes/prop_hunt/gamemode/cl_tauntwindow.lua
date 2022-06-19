local window = {}

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
	window.frame:SetSize(580, ScrH() - 80)
	window.frame:SetTitle( PHX:FTranslate("TM_WINDOW_TITLE") )
	window.frame:SetVisible(true)
	window.frame:ShowCloseButton(true)
	window.frame:Center()
	window.frame:SetMouseInputEnabled(true)
	window.frame:SetKeyboardInputEnabled(true)
	
	window.frame.Paint = function(self,w,h)
		surface.SetDrawColor(Color(40,40,40,230))
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
	window.list:SetPos(10,52) --ignore?
	--window.list:SetSize(0,505)
	window.list:SetDataHeight(21)
	window.list:Dock(FILL) --BOTTOM ?
	
	window.comb = vgui.Create("DComboBox", window.frame)
	window.comb:Dock(TOP)
	window.comb:SetSize(0, 20)
	window.comb:SetValue( PHX.DEFAULT_CATEGORY )
	
	window.input = vgui.Create("DTextEntry", window.frame)
	window.input:Dock(TOP)
	window.input:SetSize(0, 20)
	window.input:DockMargin(0,5,0,0)
	window.input:SetPlaceholderText( PHX:FTranslate("TM_SEARCH_PLACEHOLDER") )
	
	-- Checkbox Label & Slider for Pitch and stuff here
	window.slider = vgui.Create("DNumSlider", window.frame)
	window.slider:Dock(TOP)
	window.slider:SetSize(0,24)
	window.slider:DockMargin(8,2,0,0)
	window.slider:SetTooltip( PHX:FTranslate("PHX_CTAUNT_SLIDER_PITCH") )
	window.slider:SetMin( PHX:GetCVar("ph_taunt_pitch_range_min") )
	window.slider:SetMax( PHX:GetCVar("ph_taunt_pitch_range_max") )
	window.slider:SetValue( PHX:GetCLCVar( "ph_cl_pitch_level" ) )
    window.slider:SetText( PHX:FTranslate( "TM_PREFERRED_PITCH" ) )
	window.slider:SetDecimals(1)
    
	-- Normal Custom Taunt pitch
	window.ckpitch = vgui.Create("DCheckBoxLabel", window.frame)
	window.ckpitch:Dock(TOP)
	window.ckpitch:SetSize(0,20)
	window.ckpitch:DockMargin(8,1,0,0)
	window.ckpitch:SetText( PHX:FTranslate("PHX_CTAUNT_USE_PITCH") )
	window.ckpitch:SetConVar( "ph_cl_pitch_taunt_enable" )
    function window.ckpitch:OnChange( bool )
        window.ckpitrand:SetEnabled( bool )
    end
	
	window.ckpitrand = vgui.Create("DCheckBoxLabel", window.frame)
	window.ckpitrand:Dock(TOP)
	window.ckpitrand:SetSize(0,20)
	window.ckpitrand:DockMargin(8,1,0,0)
	window.ckpitrand:SetText( PHX:FTranslate("PHX_CTAUNT_RANDOM_PITCH") )
	window.ckpitrand:SetConVar( "ph_cl_pitch_randomized" )
    window.ckpitrand:SetEnabled( window.ckpitch:GetChecked() )
	
	-- The [F3] Random taunt pitch
	window.ckPF3 = vgui.Create("DCheckBoxLabel", window.frame)
	window.ckPF3:Dock(TOP)
	window.ckPF3:SetSize(0,20)
	window.ckPF3:DockMargin(8,1,0,0)
	window.ckPF3:SetText( PHX:FTranslate("PHX_RTAUNT_USE_PITCH", input.GetKeyName( PHX:GetCLCVar( "ph_default_taunt_key" ) )) )
	window.ckPF3:SetConVar( "ph_cl_pitch_apply_random" )
    function window.ckPF3:OnChange( bool )
        window.ckPRandF3:SetEnabled( bool )
    end
	
	window.ckPRandF3 = vgui.Create("DCheckBoxLabel", window.frame)
	window.ckPRandF3:Dock(TOP)
	window.ckPRandF3:SetSize(0,20)
	window.ckPRandF3:DockMargin(8,1,0,0)
	window.ckPRandF3:SetText( PHX:FTranslate("PHX_RTAUNT_RANDOMIZE", input.GetKeyName( PHX:GetCLCVar( "ph_default_taunt_key" ) )) )
	window.ckPRandF3:SetConVar( "ph_cl_pitch_randomized_random" )
    window.ckPRandF3:SetEnabled( window.ckPF3:GetChecked() )
	
	-- The Fake Taunts pitch
	window.ckPFake = vgui.Create("DCheckBoxLabel", window.frame)
	window.ckPFake:Dock(TOP)
	window.ckPFake:SetSize(0,20)
	window.ckPFake:DockMargin(8,1,0,0)
	window.ckPFake:SetText( PHX:FTranslate("PHX_CTAUNT_PITCH_FOR_FAKE") )
	window.ckPFake:SetConVar( "ph_cl_pitch_apply_fake_prop" )
    function window.ckPFake:OnChange( bool )
        window.ckPRandFake:SetEnabled( bool )
    end
	
	window.ckPRandFake = vgui.Create("DCheckBoxLabel", window.frame)
	window.ckPRandFake:Dock(TOP)
	window.ckPRandFake:SetSize(0,20)
	window.ckPRandFake:DockMargin(8,1,0,5)
	window.ckPRandFake:SetText( PHX:FTranslate("PHX_CTAUNT_RANDPITCH_FOR_FAKE") )
    window.ckPRandFake:SetConVar( "ph_cl_pitch_fake_prop_random" )
    window.ckPRandFake:SetEnabled( window.ckPFake:GetChecked() )

	local btnpanel = vgui.Create("DPanel", window.frame)
	btnpanel:Dock(TOP)
	btnpanel:SetSize(0,91) -- 86+5
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
	
	window.slider.OnValueChanged = function(self,value)
		self:SetValue(value)
		RunConsoleCommand( "ph_cl_pitch_level", tostring( value ) )
	end
	
	window.CurrentCategory = PHX.DEFAULT_CATEGORY
	window.comb:SortAndStyle(window.list)
	
	local function TranslateTaunt(category, linename)
		local tm = LocalPlayer():Team()
		return PHX.TAUNTS[category][tm][linename]
	end
	
	local function SendToServer(snd, bFakeTaunt)
	
		if bFakeTaunt == nil then bFakeTaunt = false end
	
		local lastCTauntTime = LocalPlayer():GetNWFloat("CTaunt.LastTauntTime", 0)
		local lastRTauntTime = LocalPlayer():GetNWFloat("LastTauntTime",0)
		
		local delay = lastCTauntTime + PHX:GetCVar( "ph_customtaunts_delay" )
		local delayR = lastRTauntTime + PHX:GetCVar( "ph_normal_taunt_delay" )
	
		if (delay <= CurTime() and delayR <= CurTime()) then
			net.Start("CL2SV_PlayThisTaunt")
				net.WriteString(tostring(snd))
				net.WriteBool(bFakeTaunt)
			net.SendToServer();
		else
			local time = 0
			local text = ""
			if delay >= CurTime() then
				time = delay
				text   = "TM_DELAYTAUNT_PLSWAIT"	-- added extra random taunt text.
			elseif delayR >= CurTime() then
				time = delayR
				text   = "TM_NOTICE_PLSWAIT"
			end
			PHX:ChatInfo( PHX:Translate(text, tostring(math.Round(time - CurTime()))) , "NOTICE" )
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
			--surface.PlaySound(getline)
            local pt = 100
            if window.ckpitch:GetChecked() then
                if window.ckpitrand:GetChecked() then
                    pt = math.random(window.slider:GetMin(), window.slider:GetMax())
                else
                    pt = window.slider:GetValue()
                end
            end
            LocalPlayer():EmitSound( getline, 0, pt )
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
	CreateStyledButton(LEFT,86,PHX:FTranslate("TM_TOOLTIP_FAKETAUNT"),{5,5,5,5},"vgui/phehud/btn_faketaunt.vmt",FILL, function( btn )    
		if hastaunt and hasLines then
            if LocalPlayer():Team() == TEAM_PROPS then
                local getline = TranslateTaunt(window.CurrentCategory, window.list:GetLine(window.list:GetSelectedLine()):GetValue(1))
			
                if PHX:GetCVar( "ph_randtaunt_map_prop_enable" ) then
                    SendToServer(getline, true)
                    PHX:AddChat(PHX:Translate("PHX_CTAUNT_PLAYED_ON_RANDPROP"), Color(20,220,0))
                else
                    PHX:AddChat(PHX:Translate("PHX_CTAUNT_RANDPROP_DISABLED"), Color(220,20,0))
                end
            else
                PHX:AddChat(PHX:Translate("PHX_CTAUNT_RAND_PROPS_NOT_PROP"), Color(220,20,0))
            end
		end
	end)
	CreateStyledButton(FILL,86,PHX:FTranslate("TM_TOOLTIP_CLOSE"),{5,5,5,5},"vgui/phehud/btn_close.vmt",FILL, function()
		window.frame:Close()
	end)
	
	window.list.OnRowRightClick = function(panel,line)
		if !PHX:GetCLCVar( "ph_prop_right_mouse_taunt" ) then
			hastaunt = true
			local getline = TranslateTaunt(window.CurrentCategory, window.list:GetLine(window.list:GetSelectedLine()):GetValue(1))
			
			local textRandProp = { "PHX_CTAUNT_ON_RAND_PROPS", LocalPlayer():GetTauntRandMapPropCount() }
			if PHX:GetCVar( "ph_randtaunt_map_prop_max" ) == -1 then textRandProp = "PHX_CTAUNT_ON_RAND_PROPS_UNLI" end
			
			local menu = DermaMenu()
			menu:AddOption(PHX:FTranslate("TM_TOOLTIP_PREVIEW"), function() 
                if hasLines then 
                    --surface.PlaySound(getline);
                    local pt = 100
                    if window.ckpitch:GetChecked() then
                        if window.ckpitrand:GetChecked() then
                            pt = math.random(window.slider:GetMin(), window.slider:GetMax())
                        else
                            pt = window.slider:GetValue()
                        end
                    end
                    LocalPlayer():EmitSound( getline, 0, pt )
                    PHX:AddChat(PHX:Translate("TM_NOTICE_PLAYPREVIEW", getline), Color(20,220,0)); 
                end 
            end):SetIcon("icon16/control_play.png")
			
			if PHX:GetCVar( "ph_randtaunt_map_prop_enable" ) and LocalPlayer():Team() == TEAM_PROPS then
				menu:AddOption(PHX:QTrans( textRandProp ), function()
					if hasLines then
                        if LocalPlayer():GetTauntRandMapPropCount() >= 0 then
                            SendToServer(getline, true)
                            PHX:AddChat(PHX:Translate("PHX_CTAUNT_PLAYED_ON_RANDPROP"), Color(20,220,0))
                        else
                            PHX:AddChat(PHX:Translate("PHX_CTAUNT_RAND_PROPS_LIMIT"), Color(220,150,30))
                        end
					end
				end):SetIcon("icon16/feed.png")
			end
			
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
		
		if PHX:GetCLCVar( "ph_cl_autoclose_taunt" ) then window.frame:Close(); end
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