-- Menu Group Access
local ug = {}

function ug:CreatePanel( tab )

	if ( !LocalPlayer():PHXIsStaff() ) then return end
	
    local W,H = tab:GetWide(),tab:GetTall() --unused
	local tabcW,tabcH=tab.Content:GetWide(),tab.Content:GetTall()
    
	self.panel = tab:Add( "DPanel" )
	self.panel:SetBackgroundColor(Color(40,40,40,220))
	self.panel:Dock(FILL)
    self.panel:DockMargin(4,16,8,8)
    
    self.label = self.panel:Add( "DLabel" )
    self.label:Dock(TOP)
    self.label:DockMargin(8,16,8,4)
    self.label:SetSize(0, 32)
    self.label:SetText( PHX:FTranslate("PHXM_ADMIN_ACCESS_GROUP") )
    self.label:SetFont( "PHX.MenuCategoryLabel" )
    self.label:SetTextColor( color_white )
    
    self.labelhint = self.panel:Add( "DLabel" )
    self.labelhint:Dock(TOP)
    self.labelhint:DockMargin(8,2,8,4)
    self.labelhint:SetSize(0, 20)
    self.labelhint:SetText( PHX:FTranslate("PHXM_ADMIN_ACCESS_GROUP_HINT") )
    self.labelhint:SetFont( "HudHintTextLarge" )
    self.labelhint:SetTextColor( Color(255,255,0) )
	
    -- Admin Access Control - scroll panel
	self.lacc = self.panel:Add( "DLabel" )
    self.lacc:Dock(TOP)
    self.lacc:DockMargin(8,4,8,0)
    self.lacc:SetSize(0, 32)
    self.lacc:SetText( PHX:FTranslate("PHXM_ADMIN_GROUP_WHOCANACC") )
    self.lacc:SetFont( "HudHintTextLarge" )	
	
	self.scroll = self.panel:Add( "DScrollPanel" )
	self.scroll:Dock(TOP)
	self.scroll:SetHeight( tabcH*0.3 )
    self.scroll:DockMargin(8,4,8,4)
	
	-- Group Mute configuration - scroll panel
	self.lmute = self.panel:Add( "DLabel" )
    self.lmute:Dock(TOP)
    self.lmute:DockMargin(8,4,8,0)
    self.lmute:SetSize(0, 32)
    self.lmute:SetText( PHX:FTranslate("PHXM_ADMIN_GROUP_MUTEABLE") )
    self.lmute:SetFont( "HudHintTextLarge" )
	
	self.mutescrl = self.panel:Add( "DScrollPanel" )
	self.mutescrl:Dock(TOP)
	self.mutescrl:SetHeight( tabcH*0.3 )
    self.mutescrl:DockMargin(8,4,8,4)
	
	self.listAdmin = {}
    self.listCheckBoxes = {}
	self.listMuteCB = {}
	
	-- Access
	self.grid = self.scroll:Add( "DGrid" )
    self.grid:SetPos(8,4)
	self.grid:SetCols(1)
	self.grid:SetColWide(tabcW*0.8)
	self.grid:SetRowHeight(24)
	
	-- Mute
	self.gridm = self.mutescrl:Add( "DGrid" )
    self.gridm:SetPos(8,4)
	self.gridm:SetCols(1)
	self.gridm:SetColWide(tabcW*0.8)
	self.gridm:SetRowHeight(24)
	
	--[[ for i=1,15 do
		self.listCheckBoxes[i] = vgui.Create("DCheckBoxLabel")
        self.listCheckBoxes[i]:SetSize( 300,32 )
		self.listCheckBoxes[i]:SetText( "Group-" .. i )
        self.listCheckBoxes[i]:SetFont("HudHintTextLarge")
		
		self.listMuteCB[i] = vgui.Create("DCheckBoxLabel")
        self.listMuteCB[i]:SetSize( 300,32 )
		self.listMuteCB[i]:SetText( "Group-" .. i )
        self.listMuteCB[i]:SetFont("HudHintTextLarge")
		
		self.grid:AddItem(self.listCheckBoxes[i])
		self.gridm:AddItem(self.listMuteCB[i])
	end ]]
	
    if ULib and ULib ~= nil and ULib.ucl and ULib.ucl ~= nil then
        self.listAdmin = table.GetKeys( ULib.ucl.groups )
    else
        self.labelhint = self.panel:Add( "DLabel" )
        self.labelhint:Dock(TOP)
        self.labelhint:DockMargin(8,8,8,4)
        self.labelhint:SetSize(0, 32)
        self.labelhint:SetText( PHX:FTranslate("PHXM_ADMIN_ACCESS_GROUP_NOULX") )
        self.labelhint:SetFont( "PHX.MenuCategoryLabel" )
        self.labelhint:SetTextColor( Color(240,72,72) )
        -- stop here.
        return self.panel
    end
    
	for _,group in pairs(self.listAdmin) do
        local pfx = ""
        if group == "user" then continue end
        if string.lower(group) == "superadmin" then pfx = PHX:FTranslate( "PHXM_ADMIN_ACCESS_NOREVOKE" ) end
    
        local gw,gh 	= self.grid:GetColWide(),self.grid:GetRowHeight()
		local gw2,gh2 	= self.gridm:GetColWide(),self.gridm:GetRowHeight()
    
		-- Admin Access
		self.listCheckBoxes[group] = vgui.Create("DCheckBoxLabel")
        self.listCheckBoxes[group]:SetSize( gw*0.85, gh )
		self.listCheckBoxes[group]:SetText( group .. pfx )
        self.listCheckBoxes[group]:SetFont("HudHintTextLarge")
		self.listCheckBoxes[group]:SetChecked( PHX.SVAdmins[group] )
		
		-- Mutes
		self.listMuteCB[group] = vgui.Create("DCheckBoxLabel")
        self.listMuteCB[group]:SetSize( gw2*0.85, gh2 )
		self.listMuteCB[group]:SetText( group )
        self.listMuteCB[group]:SetFont("HudHintTextLarge")
		self.listMuteCB[group]:SetChecked( PHX.IgnoreMutedUserGroup[group] )
        
        if string.lower(group) == "superadmin" then
            -- Bug: For some weird af reason, disabled check box is still clickable???
            -- Is it due reference issue
            self.listCheckBoxes[group]:SetEnabled(false)
            self.listCheckBoxes[group].OnChange = function( this )
                this:SetChecked(true)
            end
        end
        
        self.grid:AddItem( self.listCheckBoxes[group] )
		self.gridm:AddItem( self.listMuteCB[group] )
	end
	
	-- Button Panels
    self.panelbtn = self.panel:Add("DPanel")
    self.panelbtn:Dock(BOTTOM)
    self.panelbtn:DockMargin(8,8,8,8)
    self.panelbtn:SetSize(0,38)
    
	self.btn = self.panelbtn:Add( "DButton" )
	self.btn:SetText( PHX:FTranslate("PHXM_ADMIN_ACCESS_APPLY") )
    self.btn:Dock(RIGHT)
    self.btn:DockMargin(8,4,8,4)
    self.btn:SizeToContentsX( 16 )
    
    self.btn.DoClick = function()
    
        PHX:MsgBox_Query( "PHXM_ADMIN_ACCMSG_BODY", "PHXM_ADMIN_ACCMSG_TITLE",
            "MISC_YES", function()
            
            local t = {}
			local tm = {}
        
                for group,checkbox in pairs( self.listCheckBoxes ) do
                    if checkbox:GetChecked() then
                        t[group] = true
                    end
                end
				
				for group,checkbox in pairs( self.listMuteCB ) do
                    if checkbox:GetChecked() then
                        tm[group] = true
                    end
                end
				
				local dAdmin,len1 = util.PHXQuickCompress( t )
				local dMute,len2 = util.PHXQuickCompress( tm )
                
                -- net data here.
				net.Start("PHX.CLMutedGroupInfo") --send this first
                    net.WriteUInt(len2,16)
                    net.WriteData(dMute,len2)
                net.SendToServer()
				
                net.Start("PHX.CLAdminGroupInfo")
                    net.WriteUInt(len1,16)
                    net.WriteData(dAdmin,len1)
                net.SendToServer()
            
            end,
            "MISC_NO", function() end
        )
    end
    
    -- Reset Button
    self.btnx = self.panelbtn:Add( "DButton" )
	self.btnx:SetText( PHX:FTranslate("MISC_RESET_SEL") )
    self.btnx:Dock(RIGHT)
    self.btnx:DockMargin(4,4,4,4)
    self.btnx:SizeToContentsX( 16 )
    
    self.btnx.DoClick = function()
        for group,checkbox in pairs( self.listCheckBoxes ) do
            if PHX.SVAdmins[group] or string.lower(group) == "superadmin" then
                checkbox:SetChecked(true)
            else
                checkbox:SetChecked(false)
            end
        end
		
		for group,checkbox in pairs( self.listMuteCB ) do
			if PHX.IgnoreMutedUserGroup[group] then
				checkbox:SetChecked(true)
			else
				checkbox:SetChecked(false)
			end
		end
    end
    
    -- Select All Button
    self.btnall = self.panelbtn:Add( "DButton" )
	self.btnall:SetText( PHX:FTranslate("MISC_SEL_ALL") )
    self.btnall:Dock(RIGHT)
    self.btnall:DockMargin(4,4,4,4)
    self.btnall:SizeToContentsX( 16 )
    
    self.btnall.DoClick = function()
        for group,checkbox in pairs( self.listCheckBoxes ) do checkbox:SetChecked(true) end
		for group,checkbox in pairs( self.listMuteCB ) do checkbox:SetChecked(true) end
    end

	return self.panel
	
end

hook.Add("PH_CustomTabMenu", "PHX.AdminManageUserGroup", function(tab, pVgui, PaintFunc)

    if ( LocalPlayer():PHXIsStaff() ) then
        local pan = ug:CreatePanel( tab )
        local mod = tab:AddSheet("", pan, "vgui/ph_iconmenu/m_groupacc.png")
        PaintFunc(mod, PHX:FTranslate("PHXM_TAB_ADMINGROUPS"))
    end
	
end)

net.Receive("PHX.MutedGroupInfo", function()
    local byte = net.ReadUInt(16)
    local data = net.ReadData(byte)
    
    local t = util.PHXQuickDecompress( data )
    
    if t and t ~= nil and istable(t) then
        PHX.IgnoreMutedUserGroup = t
    end
end)

net.Receive("PHX.AdminGroupInfo", function()
    local byte = net.ReadUInt(16)
    local data = net.ReadData(byte)
    
    local t = util.PHXQuickDecompress( data )
    
    if t and t ~= nil and istable(t) then
        --Force update & Close main window.
        PHX.SVAdmins = t
        
        if PHX.UI.MainForm and PHX.UI.MainForm ~= nil and
            PHX.UI.MainForm:IsValid() and PHX.UI.MainForm:IsVisible() then
            
            PHX.UI.MainForm:Close()
            PHX:ChatInfo( PHX:Translate("PHXM_ADMIN_ACCESS_CHATINFO"), "NOTICE" )
            
            timer.Simple(0.1, function() LocalPlayer():ConCommand("ph_x_menu") end)
        end
    end
end)