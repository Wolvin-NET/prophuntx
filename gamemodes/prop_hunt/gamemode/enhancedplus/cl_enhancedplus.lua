PHX.HunterList = {}

local plus = {}
plus.Unstuck = {
	["ph_use_unstuck"] 				= { "check", nil, "PHXM_ADMIN_ENABLEUNSTUCK" },
	["ph_disabletpunstuckinround"]		= { "check", nil, "PHXM_ADMIN_NOTPUNSTUCKINROUND" },
	["ph_unstuck_waittime"] 			= { "slider", function() return 5,15 end, "PHXM_ADMIN_UNSTUCK_WAITTIME" },
}
plus.TeamData = {
	-- This is almost similar on menutypes but we want to make it simpler.
	["ph_forcespectatorstoplay"] 		= { "check", nil, "PHXM_ADMIN_FORCESPECTOPLAY" },
	["ph_preventconsecutivehunting"] 	= { "check", nil, "PHXM_ADMIN_NO_H_CONSECUTIVE" },
	["ph_rotateteams"]					= { "check", nil, "PHXM_ADMIN_ROTATETEAM" },
	["ph_huntercount"]					= { "slider", function() return 0,math.max(0, GAMEMODE:GetPlayingCount(nil)-1) end, "PHXM_ADMIN_HUNTER_COUNT" },
	-- Lua really don't have "Write as It Source" ordering???
	["xdummy1"]							= { "simplebutton", { text="PHXM_ADMIN_RESET_ROTTEAM", func = function(btn)
		net.Start( "PHX.ResetRotateTeams" )
		net.SendToServer()
		
		PHX:MsgBox("PHXM_ADMIN_RESET_MSG","MISC_NOTICE","MISC_OK")
		
	end }, "PHXM_ADMIN_RESET_ROTTEAM_WARN" },	
	["xdummy2"]							= { "label", nil, "PHXM_ADMIN_FORCEH2P_WARN" }
}

plus.PanelType = {
	["label"]	= function(_, _, p, l)
		local Text = p:Add("DLabel")
		Text:Dock(TOP)
		Text:SetHeight(32)
		Text:DockMargin(8,4,8,4)
		Text:SetText( PHX:QTrans( l ) )
		Text:SetWrap( true )
	end,
	
	["simplebutton"] = function(c, d, p, l, w, h)
	
		if !d.text or d.text == nil then
			d.text = "DUMMY BUTTON"
		end
	
		local panel = p:Add("DPanel")
		panel:Dock(TOP)
		panel:SetHeight(48)
		panel:DockMargin(8,4,8,4)
		panel:SetBackgroundColor(Color(16,16,16,130))
		
		local label = panel:Add("DLabel")
		label:Dock(LEFT)
		label:SetWidth(w*0.75)
		label:DockMargin(8,4,8,4)
		label:SetText( PHX:QTrans( l ) )
		label:SetWrap( true )
		
		local Btn = panel:Add("DButton")
		Btn:Dock(FILL)
		Btn:DockMargin(8,4,8,4)
		Btn:SetText( PHX:QTrans( d.text ) )
		Btn:SetToolTip( PHX:QTrans( d.text ) )
		
		local f = function() print("Button: It's nothing here. Did you forgot to add something?") end
		if d.func and d.func ~= nil and isfunction(d.func) then
			Btn.DoClick = d.func
		else
			Btn.DoClick = f
		end
	
	end,
	
	["check"]	= function(c, _, p, l, w, h)
		local panel = p:Add("DPanel")
		panel:Dock(TOP)
		panel:SetHeight(32)
		panel:DockMargin(8,4,8,4)
		panel:SetBackgroundColor(Color(16,16,16,130))
	
		local CxBox = panel:Add("DCheckBoxLabel")
		CxBox:Dock(FILL)
		CxBox:SetText( PHX:QTrans( l ) )
		CxBox:DockMargin(8,4,8,4)
		CxBox:SetValue( GetConVar(c):GetBool() )
		function CxBox:OnChange( bool )
			local v = bool and 1 or 0
			net.Start("SvCommandReq")
				net.WriteString(c)
				net.WriteString(tostring(v))
			net.SendToServer()
		end
	end,
	
	["slider"]	= function(c, d, p, l, w, h)
	
		local Min,Max = 0,1
		if d and d ~= nil and isfunction(d) then
			Min,Max = d()
		end
	
		local panel = p:Add("DPanel")
		panel:Dock(TOP)
		panel:SetHeight(32)
		panel:DockMargin(8,4,8,4)
		panel:SetBackgroundColor(Color(16,16,16,130))
		
		local label = panel:Add("DLabel")
		label:Dock(LEFT)
		label:SetWidth(w*0.6)
		label:DockMargin(8,4,8,4)
		label:SetText( PHX:QTrans( l ) )
		label:SetWrap( true )
		
		local Slider = panel:Add("DNumSlider")
		Slider:Dock(FILL)
		Slider:DockMargin(8,4,8,4)
		Slider:SetText("")
		Slider:SetToolTip( PHX:QTrans( l ) )
		Slider:SetMin(Min)
		Slider:SetMax(Max)
		Slider:SetValue( GetConVar(c):GetInt() )
		Slider:SetDecimals(0)
		function Slider:PerformLayout() self.Label:SetWide( 32 ) end
		Slider.OnValueChanged = function(self,value)
			self:SetValue(value)
			net.Start("SvCommandSliderReq")
				net.WriteString(c)
				net.WriteBool(false)
				net.WriteInt(tonumber(self:GetValue()), 16)
			net.SendToServer()
		end
		
		-- Special Think used for ph_huntercount
		panel.Think = function()
			if c ~= "ph_huntercount" then return end
			
			local mn,mx = 0,1
			if d and d ~= nil and isfunction(d) then
				mn,mx = d()
			end
			if mx < 1 then mx = 1 end
			Slider:SetMin(mn); Slider:SetMax(mx); 
		end
	end
}

function plus:CreateVGUI( panel, ConVar, sType, tData, sLabel )
	local W,H = panel:GetWide(),panel:GetTall()
	self.PanelType[sType]( ConVar, tData, panel, sLabel, W, H )
end

function plus:CreatePanel( tab )

	if ( !LocalPlayer():PHXIsStaff() ) then return end --incase someone are able to access this.
	
	local tabcW,tabcH=tab.Content:GetWide()*0.8,tab.Content:GetTall()
    
	self.panel = tab:Add( "DPanel" )
	self.panel:SetBackgroundColor(Color(40,40,40,220))
	self.panel:Dock(FILL)
    self.panel:DockMargin(4,16,8,8)
	self.panel:InvalidateParent(true)
    
    self.label = self.panel:Add( "DLabel" )
    self.label:Dock(TOP)
    self.label:DockMargin(8,16,8,4)
    self.label:SetSize(0, 32)
    self.label:SetText( PHX:FTranslate( "PHXM_ADMIN_PLUSSETTING" ) )
    self.label:SetFont( "PHX.MenuCategoryLabel" )
    self.label:SetTextColor( color_white )
    
    self.labelhint = self.panel:Add( "DLabel" )
    self.labelhint:Dock(TOP)
    self.labelhint:DockMargin(8,2,8,10)
    self.labelhint:SetSize(0, 20)
    self.labelhint:SetText( PHX:FTranslate( "PHXM_PLUSSETTING_HINT" ) )
    self.labelhint:SetFont( "HudHintTextLarge" )
    self.labelhint:SetTextColor( Color(255,255,0) )
	
	self.labelUnstuck = self.panel:Add( "DLabel" )
    self.labelUnstuck:Dock(TOP)
    self.labelUnstuck:DockMargin(8,4,8,0)
    self.labelUnstuck:SetSize(0, 32)
    self.labelUnstuck:SetText( PHX:FTranslate( "PHXM_HEADER_UNSTUCK" ) )
    self.labelUnstuck:SetFont( "HudHintTextLarge" )
    self.labelUnstuck:SetTextColor( color_white )
	
	for convar,data in pairs( self.Unstuck ) do
	
		self:CreateVGUI( self.panel, convar, data[1], data[2], data[3] )
		
	end
	
	self.labelTeam = self.panel:Add( "DLabel" )
    self.labelTeam:Dock(TOP)
    self.labelTeam:DockMargin(8,4,8,0)
    self.labelTeam:SetSize(0, 32)
    self.labelTeam:SetText( PHX:FTranslate( "PHXM_HEADER_TEAMSETTING" ) )
    self.labelTeam:SetFont( "HudHintTextLarge" )
    self.labelTeam:SetTextColor( color_white )
	
	-- I know this is worst duplicate, but this one is a specialized one.
	self.pnlOrigTeamBal = self.panel:Add("DPanel")
	self.pnlOrigTeamBal:Dock(TOP)
	self.pnlOrigTeamBal:SetHeight(32)
	self.pnlOrigTeamBal:DockMargin(8,4,8,4)
	self.pnlOrigTeamBal:SetBackgroundColor(Color(16,16,16,130))
	
	self.chkOrigTeamBal = self.pnlOrigTeamBal:Add("DCheckBoxLabel")
    self.chkOrigTeamBal:Dock(FILL)
	self.chkOrigTeamBal:DockMargin(8,4,8,4)
	self.chkOrigTeamBal:SetText( PHX:QTrans( "PHXM_ADMIN_TEAMBAL_ORIG" ) )
    self.chkOrigTeamBal:SetFont( "HudHintTextLarge" )
	self.chkOrigTeamBal:SetValue( PHX:GetCVar( "ph_team_balance_classic" ) )
	function self.chkOrigTeamBal:OnChange(bool)
		local v = "0"
		if (bool) then v = "1" end
	
		net.Start( "SvCommandReq" )
			net.WriteString( "ph_team_balance_classic" )
			net.WriteString( v )
		net.SendToServer()
	end
	
	self.scroll = self.panel:Add( "DScrollPanel" )
	self.scroll:Dock(FILL)
    self.scroll:DockMargin(8,4,8,4)
	self.scroll:InvalidateParent(true)
	
	for convar,data in SortedPairs( self.TeamData ) do -- we had to use sortedpairs, lua doesn't have Keep as Source order thingy...
	
		self:CreateVGUI( self.scroll, convar, data[1], data[2], data[3] )
		
	end
	
	self.panel.Think = function()
		local bool = PHX:GetCVar( "ph_team_balance_classic" )
		self.scroll:SetVisible( !bool and true or false )
	end
	
	local Hunter = {}
	
	Hunter.Panel = self.scroll:Add( "DPanel" )
	Hunter.Panel:Dock(TOP)
	Hunter.Panel:DockMargin(8,4,8,4)
	Hunter.Panel:SetHeight( 500 )
	
	-- I know I don't want to get this list being stretched by the window, so I'm going to do a fixed panel instead.
	-- Very stupid hacks, tbh...
	Hunter.FixedPanel = Hunter.Panel:Add("DPanel")
	Hunter.FixedPanel:SetPos(8,8)
	Hunter.FixedPanel:SetSize(360,480)
	Hunter.FixedPanel:SetPaintBackground(false)
	
	Hunter.Tips = Hunter.FixedPanel:Add( "DLabel" )
    Hunter.Tips:Dock(TOP)
    Hunter.Tips:DockMargin(0,0,0,6)
    Hunter.Tips:SetSize(0, 24)
    Hunter.Tips:SetText( PHX:FTranslate( "PHXM_PLUS_LISTTIPS" ) )
	Hunter.Tips:SetTextColor(Color(16,16,16))
	
	Hunter.List = Hunter.FixedPanel:Add( "DListView" )
	Hunter.List:Dock(FILL)
	Hunter.List:SetMultiSelect(false)
	Hunter.List:AddColumn(PHX:FTranslate("LIST_PLAYER"), 1)
	Hunter.List:AddColumn(PHX:FTranslate("LIST_FORCEDASPROP"), 2)
	
	Hunter.BtnReset = Hunter.FixedPanel:Add("DButton")
	Hunter.BtnReset:Dock(BOTTOM)
	Hunter.BtnReset:DockMargin(0,8,0,8)
	Hunter.BtnReset:SetHeight(32)
	Hunter.BtnReset:SetText( PHX:FTranslate( "PHXM_PLUS_BTNRESET" ) )
	
	Hunter.FixedPanel:SetContentAlignment(4) -- don't think this would work. I'll leave this here.
	
	Hunter.IsBlank = false
	
	PHX.HunterList.List = Hunter.List -- REFERENCE, DO NOT USE THIS!!!
	
	self.UpdatePlayerStatus = function(panel)
		if (!panel.IsForced) then
			panel:SetColumnText( 2, "--" )
		else
			panel:SetColumnText( 2, PHX:FTranslate("LIST_MARKEDASPROP") )
		end
	end
	
	self.RefreshList = function()
		Hunter.List:Clear()
		
		if #team.GetPlayers(TEAM_HUNTERS) > 0 then
			Hunter.IsBlank = false
			for _,ply in ipairs(team.GetPlayers(TEAM_HUNTERS)) do
				local p 	= Hunter.List:AddLine( ply:Nick(), "--" )
				p.UserID	= ply:UserID()
				p.IsForced	= ply:IsCurrentlyForcedAsProp()
				self.UpdatePlayerStatus( p )
			end
		else
			Hunter.IsBlank = true
			local p 	= Hunter.List:AddLine( PHX:FTranslate("LIST_NOHUNTERS"), "--" )
			p.UserID	= -1
			p.IsForced	= false
			self.UpdatePlayerStatus( p )
		end
		
		-- Update
		PHX.HunterList.List = Hunter.List -- REFERENCE, DO NOT USE THIS!!!
		PHX.HunterList.RefreshFunc = self.RefreshList
	end
	
	self.RefreshList()
	PHX.HunterList.RefreshFunc = self.RefreshList
	
	local function DoSetHunterAsProp( panel, playerID )
		if !playerID or playerID == nil then return end
		if PHX:GetCVar( "ph_enable_teambalance" ) and !PHX:GetCVar( "ph_rotateteams" ) then
			net.Start("PHX.ForceHunterAsProp")
				net.WriteUInt( playerID, 16 )
			net.SendToServer()
			
			if (!panel.IsForced) then
				panel.IsForced = true
			else
				panel.IsForced = false
			end
			self.UpdatePlayerStatus( panel )
		else
			PHX:MsgBox("PHXM_ADMIN_FORCEH2P_RANDONLY", "MISC_NOTICE", "MISC_OK")
		end
	end
	
	function Hunter.List:DoDoubleClick(id,line)
		
		if Hunter.IsBlank then return end
		
		local panel = Hunter.List:GetLine( Hunter.List:GetSelectedLine() )
		local item 	= panel:GetValue(1)
		local plyID = panel.UserID
		
		DoSetHunterAsProp( panel, plyID )
		
	end
	
	Hunter.BtnReset.DoClick = function(btn)
		
		if Hunter.IsBlank then PHX:MsgBox("PHXM_PLUS_MSG_NO_HUNTERS", "MISC_NOTICE", "MISC_OK"); return end
		
		if PHX:GetCVar( "ph_enable_teambalance" ) and !PHX:GetCVar( "ph_rotateteams" ) then
			net.Start("PHX.ForceResetHunterAsProp")
			net.SendToServer()
			
			for index,line in pairs( Hunter.List:GetLines() ) do
				line:SetColumnText( 2, "--" )
				line.IsForced = false
			end
		else
			PHX:MsgBox("PHXM_ADMIN_FORCEH2P_RANDONLY", "MISC_NOTICE", "MISC_OK")
		end
	end
	
	return self.panel
	
end

net.Receive("ResetHunterForceAsPropList", function()
	if PHX.HunterList.List and PHX.HunterList.List ~= nil and
		PHX.HunterList.List:IsValid() then
		
		PHX.HunterList.List:Clear()
		timer.Simple(0.5, function()
			if PHX.HunterList.RefreshFunc and PHX.HunterList.RefreshFunc ~= nil and isfunction(PHX.HunterList.RefreshFunc) then
				PHX.HunterList.RefreshFunc()
			end
		end)
	end
	
end)

hook.Add("PH_CustomTabMenu", "PHX.EnhancedPlusMenu", function(tab, pVgui, PaintFunc)

    if ( LocalPlayer():PHXIsStaff() ) then
        local pan = plus:CreatePanel( tab, pVgui )
        local mod = tab:AddSheet("", pan, "vgui/ph_iconmenu/m_plus.png")
        PaintFunc(mod, PHX:FTranslate("PHXM_TAB_PHEPLUS"))
    end
	
end)