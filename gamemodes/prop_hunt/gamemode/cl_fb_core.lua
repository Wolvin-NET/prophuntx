local function checkmodel( fPath, label )
	local mdlInfo = util.GetModelInfo( fPath )
	
	if mdlInfo == nil then
		label:SetText( PHX:FTranslate("PHZ_generic_mdlinfo", fPath, PHX:FTranslate("MISC_NO")) )
		return false 
	end
	
	if mdlInfo.KeyValues and mdlInfo.KeyValues ~= nil then
		local info = util.KeyValuesToTablePreserveOrder( mdlInfo.KeyValues )
	
		if info and info ~= nil then
			if (info[2] and info[2] ~= nil) and info[2]["Key"] == "solid" then -- Asume it's Ragdoll.
				-- We currently do not support Ragdolls until further testing. 
				-- If we found that ragdoll can no longer server/client crashes, this feature will be re-enabled.
				label:SetText( PHX:FTranslate("PHZ_generic_mdlinfo", fPath, PHX:FTranslate("PHZ_generic_no_ragdoll")) )
			elseif (info[1] and info[1] ~= nil) and info[1]["Key"] == "solid" then
				label:SetText( PHX:FTranslate("PHZ_generic_mdlinfo", fPath, PHX:FTranslate("MISC_YES")) )
				return true
			end
		end
	else
		label:SetText( PHX:FTranslate("PHZ_generic_mdlinfo", fPath, PHX:FTranslate("MISC_NO")) )
	end
	
	return false
end

local f = {}
f.__index = f
function PHXPM_openFileBrowser( ply, global, sub, svContents, wTitle )

	if ( !ply:PHXIsStaff() ) then return end

	if !isstring(global) then return end
	if !isstring(sub) then return end
	
	if (!_G[global] or _G[global] == nil) then return end
	if (!_G[global][sub] or _G[global][sub] == nil) then return end
	
	if !wTitle or wTitle == nil then wTitle = "Editor" end	-- this is fallback
	
	local tblModify = table.Copy( _G[global][sub] )
	
	if !f.isOpen then	-- prevent this window to open twice

		f.isHaventSave 	= false
	
		--[[ PANEL HEADER ]] --
		
		f.frame = vgui.Create("DFrame")
		f.frame:SetSize(ScrW() - 128, ScrH() - 80)
		f.frame:SetTitle(PHX:FTranslate("PHZ_generic_title"))
		f.frame:ShowCloseButton( false )
		f.frame:Center()
		
		f.panel = vgui.Create("DPanel", f.frame)
		f.panel:Dock(TOP)
		f.panel:SetSize(0,64) --annoying part is that you can't use :SizeToChildren() even though :InvalidateLayout() has been called...
		
		  f.pnHeader = vgui.Create("DPanel", f.panel)
		  f.pnHeader:Dock(LEFT)
		  f.pnHeader:SetSize(f.frame:GetWide()*0.8,0)
		
			f.comb = vgui.Create("DComboBox", f.pnHeader)
			f.comb:Dock(TOP)
			f.comb:SetSize(0,20)
			f.comb:DockMargin(20,5,20,5)
			f.comb:SetValue(PHX:FTranslate("PHZ_mount_game_sel"))
			
			for path,name in SortedPairs( svContents ) do
				f.comb:AddChoice( name, path )
			end
			
			f.input = vgui.Create("DTextEntry", f.pnHeader)
			f.input:Dock(TOP)
			f.input:SetSize(0, 20)
			f.input:DockMargin(20,5,20,15)
			f.input:SetPlaceholderText(PHX:FTranslate("PHZ_input_placeholder1"))
			
		  f.pnButton = vgui.Create("DPanel", f.panel)
		  f.pnButton:Dock(FILL)
		
			f.btnCancel = vgui.Create("DButton", f.pnButton)
			f.btnCancel:Dock(FILL)
			f.btnCancel:SetFont("RobotoWarn")
			f.btnCancel:SetText(PHX:FTranslate("MISC_CLOSE"))
			f.btnCancel:DockMargin(20,5,20,15)
			f.btnCancel.DoClick = function()	-- we'll put this on top.
				if f.isHaventSave then
					PHX:MsgBox_Query(
						"PHZ_msg_warn_close",
						"MISC_WARN",
						"MISC_YES", function()
							net.Start(global .. ".DoneEditing")
							net.SendToServer()
							f.isOpen = false
							f.frame:Close()
							end,
						"MISC_NO", function() end
					)
				else
					net.Start(global .. ".DoneEditing")
					net.SendToServer()
					f.isOpen = false
					f.frame:Close()
				end
			end
		
		--[[ PANEL FILE BROWSER ]] --
		
		f.panelMain = vgui.Create("DPanel", f.frame)
		f.panelMain:Dock(FILL)
		
		f.panel2 = vgui.Create("DPanel", f.panelMain)
		f.panel2:Dock(LEFT)
		f.panel2:SetSize(f.frame:GetWide()*0.45,0)
		f.panel2:InvalidateParent(true)
		
			f.fb = vgui.Create("DFileBrowser", f.panel2)
			
			f.fb:Dock(FILL)
			f.fb:DockMargin(20,10,20,10)
			
			f.fb:SetPath( "MOD" )
			f.fb:SetBaseFolder( "models" )
			f.fb:SetFileTypes( "*.mdl" )
			f.fb:SetName( "Garry's Mod" )
			f.fb:SetModels( true )
		
		--[[ PANEL MODEL INFO ]] --
		
		f.panelinfo = vgui.Create("DPanel", f.panelMain)
		f.panelinfo:Dock(LEFT)
		f.panelinfo:SetSize(f.panel2:GetWide()*0.55,0)
		
		f.lbl = vgui.Create("DLabel", f.panelinfo)
		f.lbl:SetFont("RobotoInfo")
		f.lbl:SetColor(Color(20,20,20,255))
		f.lbl:SetText(PHX:FTranslate("PHZ_generic_mdlinfo", PHX:FTranslate("PHZ_generic_mdlinfoStart"), PHX:FTranslate("MISC_IDK")))
		f.lbl:Dock(TOP)
		f.lbl:DockMargin(10,10,10,5)
		f.lbl:SetWrap(true)
		f.lbl:SetAutoStretchVertical(true)
		
		f.lbwarn = vgui.Create("DLabel", f.panelinfo)
		f.lbwarn:SetFont("RobotoWarn")
		f.lbwarn:SetColor(Color(255,0,0,255))
		f.lbwarn:SetText("")
		f.lbwarn:Dock(TOP)
		f.lbwarn:SetSize(0,24)
		f.lbwarn:DockMargin(10,5,10,5)
		
		f.lblHelp = vgui.Create("DLabel", f.panelinfo)
		f.lblHelp:SetFont("RobotoWarn")
		f.lblHelp:SetColor(Color(40,40,40,255))
		f.lblHelp:SetText(PHX:FTranslate("PHZ_generic_helptext")) --HelpText
		f.lblHelp:Dock(TOP)
		f.lblHelp:DockMargin(10,5,10,5)
		f.lblHelp:SetWrap(true)
		f.lblHelp:SetAutoStretchVertical(true)
		
		--[[ PANEL PROP MENU PREVIEW ]] --
		local function addIcon( panel, model )
			local bg = panel:Add("DPanel")
			bg:SetSize(64,64)
			
			local ico = bg:Add("SpawnIcon", bg)
			ico:SetModel( model )
			ico.DoClick = function(self)
				local bg = self:GetParent()
				
				if !bg.selected then
					bg:SetBackgroundColor(Color(220,20,20))
					bg.model = self:GetModelName()
					bg.selected = true
				else
					bg:SetBackgroundColor(color_white)
					bg.model = nil
					bg.selected = false
				end
			end
		end
		
		f.panelpm = vgui.Create("DPanel", f.panelMain)
		f.panelpm:Dock(FILL)
		
			f.label = vgui.Create("DLabel", f.panelpm)
			f.label:Dock(TOP)
			f.label:SetSize(0,26)
			f.label:DockMargin(20,5,0,0)
			f.label:SetFont("RobotoInfo")
			f.label:SetColor(Color(20,20,20,255))
			f.label:SetText(PHX:FTranslate("PHZ_generic_titlelabel", wTitle))
			
			f.btn = vgui.Create("DButton", f.panelpm)
			f.btn:Dock(TOP)
			f.btn:SetSize(0,32)
			f.btn:SetFont("RobotoWarn")
			f.btn:DockMargin(20,5,10,5)
			f.btn:SetText(PHX:FTranslate("PHZ_tooltip_removesel"))
			f.btn:SetToolTip(PHX:FTranslate("PHZ_Tooltip_removesel"))
			
			f.list = vgui.Create("DIconBrowser", f.panelpm)
			f.list:Dock(FILL)
			f.list:DockMargin(20,0,10,5)
			f.list:SetManual(true)
			
			if tblModify then
				for _,model in pairs(tblModify) do
					addIcon(f.list, model)
				end
			end
			
			f.btnApply = vgui.Create("DButton", f.panelpm)
			f.btnApply:Dock(BOTTOM)
			f.btnApply:SetFont("RobotoInfo")
			f.btnApply:SetSize(0,30)
			f.btnApply:DockMargin(20,5,10,10)
			f.btnApply:SetText(PHX:FTranslate("PHZ_apply_select"))
			f.btnApply:SetDisabled(true)
		
		--[[ PANEL FUNCTIONS, MUST BE WRITTEN HERE ]] --
		
		function f:markPropExist( mdlname )
			local icons = self.list:GetChildren()[1]:GetChildren()[1]:GetChildren()
			
			if icons and icons ~= nil then
				if (not table.IsEmpty(icons)) then
					for _,ic in ipairs(icons) do
						local realIcon = ic:GetChildren()[1]
						if realIcon:GetModelName() == mdlname then
							ic._oldbg = ic:GetBackgroundColor()
							ic:SetBackgroundColor(Color(92,197,222))
							timer.Simple(2, function()
								if (ic and ic ~= nil) and ic:IsValid() then ic:SetBackgroundColor(ic._oldbg) end
							end)
							break --stop once it found.
						end
					end
				end
			end
		end
		
		function f.frame:OnClose()
			f.isOpen = false
		end

		function f.fb:OnSelect(fPath, p)
			local mdl = p:GetModelName()
			local legit = checkmodel( fPath, f.lbl )
			
			if table.HasValue(tblModify, mdl) then
				f.lbwarn:SetText(PHX:FTranslate("PHZ_msg_warn_mdlinlist"))
				f:markPropExist( mdl )
			else
				if legit then
					-- Button Apply and isHaventSave will be triggered in here.
					table.insert(tblModify, mdl)
					addIcon(f.list, mdl)
					if !f.isHaventSave then
						f.btnApply:SetDisabled(false)
						f.isHaventSave = true
					end
					f.lbwarn:SetText("")
				else
					f.lbwarn:SetText(PHX:FTranslate("PHZ_msg_invalid_mdl"))
				end
			end
		end
		
		function f.fb:OnRightClick(fPath, p)
			local mdl = p:GetModelName()
			local m = DermaMenu()
			m:AddOption("Model Info", function()
				local legit = checkmodel( fPath, f.lbl )
				if table.HasValue(tblModify, mdl) then
					f.lbwarn:SetText(PHX:FTranslate("PHZ_msg_warn_mdlinlist"))
					f:markPropExist( mdl )
				else
					if !legit then
						f.lbwarn:SetText(PHX:FTranslate("PHZ_msg_invalid_mdl"))
					else
						f.lbwarn:SetText("")
					end
				end
			end):SetIcon("icon16/information.png")
			m:AddOption(PHX:FTranslate("PHZ_menu_copy"), function() SetClipboardText( mdl ) end):SetIcon("icon16/page_copy.png")
			m:AddSpacer()
			m:AddOption(PHX:FTranslate("PHZ_menu_refresh"), function() p:RebuildSpawnIcon() end):SetIcon("icon16/arrow_rotate_clockwise.png")
			m:Open()
		end
		
		function f.comb:OnSelect(i, name, data)
			f.fb:Clear()
			f.fb:SetPath( data )
			f.fb:SetBaseFolder( "models" )
			f.fb:SetFileTypes( "*.mdl" )
			f.fb:SetName( name )
			f.fb:SetModels( true )
		end
		
		function f.input:OnEnter( val )
			f.fb:SetSearch( val )
		end
		
		f.btn.DoClick = function()
			local icons = f.list:GetChildren()[1]:GetChildren()[1]:GetChildren()
			
			if icons and icons ~= nil then
				if (not table.IsEmpty(icons)) then
					for _,ic in ipairs(icons) do
						if ic.selected or (ic.markeddontexist and ic.markeddontexist ~= nil) then
							table.RemoveByValue(tblModify, ic.model)
							ic:Remove()
						end
					end
					
					if !f.isHaventSave then
						f.btnApply:SetDisabled(false)
						f.isHaventSave = true
					end
				end
			end
			
		end
		
		function f:updatePreview()
			local icons = self.list:GetChildren()[1]:GetChildren()[1]:GetChildren()
			
			if icons and icons ~= nil then
				if (not table.IsEmpty(icons)) then
					for _,ic in ipairs(icons) do
						-- don't remove, but we'll mark as 'markeddontexist' instead!						
						local realIcon = ic:GetChildren()[1]
						if !table.HasValue(_G[global][sub], realIcon:GetModelName()) then
							ic.markeddontexist = true
							ic:SetBackgroundColor(Color(255,200,16))
							realIcon:SetToolTip(PHX:FTranslate("PHZ_tooltip_wasmarked"))
						end
						if !ic.markeddontexist then ic:Remove() end
					end
				end
			end
			
			-- Refresh Icon
			if _G[global][sub] then -- don't use tblModify, instead, we'll receive a direct copy from _G[global][sub] instead!
				for _,model in pairs( _G[global][sub] ) do
					addIcon(f.list, model)
				end
			end
		end
		
		f.btnApply.DoClick = function(self)
		
			PHX:MsgBox_Query(
				"PHZ_msg_commit",
				"MISC_NOTICE",
				"MISC_YES", function()
				
					if !table.IsEmpty( tblModify ) then
				
						local curData = util.TableToJSON( tblModify )
						local data = util.Compress(curData)
						local size = data:len()
						
						net.Start(global .. ".EditedCustomPropData")
							net.WriteString( global )
							net.WriteString( sub )
							net.WriteUInt( size, 32 )
							net.WriteData( data, size )
						net.SendToServer()
						
						self:SetDisabled(true)
						f.btnCancel:SetDisabled(true)
						f.btn:SetDisabled(true)
					else
						PHX:MsgBox("PHZ_msg_cant_empty", "MISC_WARN", "MISC_OK")
					end
				end,
				"MISC_NO", function()
			end)
		end
		
		function f.fb.Tree:OnNodeSelected( pnl )
			f.lbwarn:SetText("")
		end
		
		f.isOpen = true
		
		f.frame:MakePopup()
		
		return f
		
	end
	
end