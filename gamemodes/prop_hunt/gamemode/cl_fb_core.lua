-- Currently, this isn't translated. Maybe in future version of PH:X, sorry everyone!

surface.CreateFont("RobotoInfo", {
	font	= "Roboto",
	size	= 24,
	weight	= 750
})
surface.CreateFont("RobotoWarn", {
	font	= "Roboto",
	size	= 16,
	weight	= 750
})

local formatText = [[Model Info:
%s
Has Physics: %s]]

local HelpText = [[How To Use:
[LEFT PANEL]
← Choose a game content
← Click on icons to add models to the right
← Right Click to open context menu

[RIGHT PANEL]
→ Click to 'mark' before deleting
→ Hit 'Remove Selected' to Remove Models
→ Hit 'Apply Selection' to Send & Save to server

[INFO]
- You can only add models up to 2048 entries.
- All maps props will be included automatically, so You Don't Have to.
- Pressing [Close] button will cancel the operation.
- Not all models will have a valid VPhysics.
- Not all Players (inc. Your Server) will have custom models. If they don't exists they will removed after Applying selections.
- Your Server content might be different from you. If you see "<game> [Not Available]" on dropdown menu, it means that you haven't mounted/installed the game.
- Addon folder browsing isn't implemented yet so You'll have to use 'All Contents' instead.
]]

local function checkmodel( fPath, label )
	local mdlInfo = util.GetModelInfo( fPath )
	
	if mdlInfo == nil then
		label:SetText(string.format(formatText, fPath, "NO"))
		return false 
	end
	
	if mdlInfo.KeyValues and mdlInfo.KeyValues ~= nil then
		local info = util.KeyValuesToTablePreserveOrder( mdlInfo.KeyValues )
	
		if info and info ~= nil then
			if (info[2] and info[2] ~= nil) and info[2]["Key"] == "solid" then -- Asume it's Ragdoll.
				label:SetText(string.format(formatText, fPath, "NO: Ragdoll")) -- We currently do not support Ragdolls until further testing. If found nothing crashing server/client, this feature will be re-enabled.
			elseif (info[1] and info[1] ~= nil) and info[1]["Key"] == "solid" then
				label:SetText(string.format(formatText, fPath, "YES"))
				return true
			end
		end
	else
		label:SetText(string.format(formatText, fPath, "NO"))
	end
	
	return false
end

local f = {}
f.__index = f
function PHXPM_openFileBrowser( ply, global, sub, svContents, wTitle )

	if !ply:CheckUserGroup() or !ply:IsSuperAdmin() then return end

	if !isstring(global) then return end
	if !isstring(sub) then return end
	
	if (!_G[global] or _G[global] == nil) then return end
	if (!_G[global][sub] or _G[global][sub] == nil) then return end
	
	if !wTitle or wTitle == nil then wTitle = "Prop Menu" end
	
	local tblModify = table.Copy( _G[global][sub] )
	
	if !f.isOpen then	-- prevent this window to open twice

		f.isHaventSave 	= false
	
		--[[ PANEL HEADER ]] --
		
		f.frame = vgui.Create("DFrame")
		f.frame:SetSize(ScrW() - 128, ScrH() - 80)
		f.frame:SetTitle("Prop Hunt X: Custom Prop Editor [BETA]")
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
			f.comb:SetValue("Select Mounted Game (Default: Garry's Mod)")
			
			for path,name in SortedPairs( svContents ) do
				f.comb:AddChoice( name, path )
			end
			
			f.input = vgui.Create("DTextEntry", f.pnHeader)
			f.input:Dock(TOP)
			f.input:SetSize(0, 20)
			f.input:DockMargin(20,5,20,15)
			f.input:SetPlaceholderText("Folder to Search: <folder name> or '*', blank for all folders.")
			
		  f.pnButton = vgui.Create("DPanel", f.panel)
		  f.pnButton:Dock(FILL)
		
			f.btnCancel = vgui.Create("DButton", f.pnButton)
			f.btnCancel:Dock(FILL)
			f.btnCancel:SetFont("RobotoWarn")
			f.btnCancel:SetText("Close")
			f.btnCancel:DockMargin(20,5,20,15)
			f.btnCancel.DoClick = function()	-- we'll put this on top.
				if f.isHaventSave then
					Derma_Query(
						"Are you sure you want to close this window? Any unsaved edits will be lost!",
						"Warning",
						"Yes", function()
							net.Start(global .. ".DoneEditing")
							net.SendToServer()
							f.isOpen = false
							f.frame:Close()
							end,
						"No", function() end
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
		f.lbl:SetText(string.format(formatText, "(Select a model first!)", "Unknown"))
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
		f.lblHelp:SetText(HelpText)
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
			f.label:SetText(wTitle .. " Preview :")
			
			f.btn = vgui.Create("DButton", f.panelpm)
			f.btn:Dock(TOP)
			f.btn:SetSize(0,32)
			f.btn:SetFont("RobotoWarn")
			f.btn:DockMargin(20,5,10,5)
			f.btn:SetText("Remove Selected")
			f.btn:SetToolTip("Remove selected props in the list. Legends:\nRed = Your Marked Selections\nYellow: Prop don't exists in server AND should be Removed.")
			
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
			f.btnApply:SetText("Apply & Save Selections")
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
				f.lbwarn:SetText("WARNING: This Model is already in the list!")
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
					f.lbwarn:SetText("Reason: This is invalid model.")
				end
			end
		end
		
		function f.fb:OnRightClick(fPath, p)
			local mdl = p:GetModelName()
			local m = DermaMenu()
			m:AddOption("Model Info", function()
				local legit = checkmodel( fPath, f.lbl )
				if table.HasValue(tblModify, mdl) then
					f.lbwarn:SetText("WARNING: This Model is already in the list!")
					f:markPropExist( mdl )
				else
					if !legit then
						f.lbwarn:SetText("Reason: This is invalid model.")
					else
						f.lbwarn:SetText("")
					end
				end
			end):SetIcon("icon16/information.png")
			m:AddOption("Copy Model", function() SetClipboardText( mdl ) end):SetIcon("icon16/page_copy.png")
			m:AddSpacer()
			m:AddOption("Refresh Model", function() p:RebuildSpawnIcon() end):SetIcon("icon16/arrow_rotate_clockwise.png")
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
							realIcon:SetToolTip("This prop was marked because it does't exist in the server.\nIf you close this editor, this will automatically removed.")
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
		
			Derma_Query(
				"Are you sure you want to commit changes?",
				"Notice",
				"Yes", function()
				
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
						Derma_Message("Prop List cannot be empty.","Warning","OK")
					end
				end,
				"No", function() end
			)
		end
		
		function f.fb.Tree:OnNodeSelected( pnl )
			--f.lbl:SetText(string.format(formatText, "(Select Model on the Left)", "N/A"))
			f.lbwarn:SetText("")
		end
		
		f.isOpen = true
		
		f.frame:MakePopup()
		
		return f
		
	end
	
end