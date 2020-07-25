PHX.UI = PHX.UI or {}

-- Global for Mute Function.
function PHX.UI:GetMutedStateIcon(bool)
	if bool then
		return "vgui/phehud/voice_off"
	end
	
	return "vgui/phehud/voice_on"
end

function PHX.UI.BaseMainMenu(ply, cmd, args)
	
	if (PHX.LANGUAGES[PHX.CVAR.Language:GetString()] == nil or table.IsEmpty(PHX.LANGUAGES[PHX.CVAR.Language:GetString()])) then
		PHX:AddChat("Error: Cannot open Prop Hunt X Menu because the language you're using is not available.", Color(255,0,0))
		PHX:AddChat("Please revert to default language by typing 'ph_cl_language en_us' in the console!", Color(255,255,0))
		return
	end

	local mdlName = ply:GetInfo("cl_playermodel")
	local mdlPath = player_manager.TranslatePlayerModel(mdlName)
	
	PHX.UI.MainForm = vgui.Create("DFrame")
	PHX.UI.MainForm:SetSize(ScrW()-96,ScrH()-80)
	PHX.UI.MainForm:SetTitle( PHX:FTranslate("PHXM_WINDOW_TITLE") )
	PHX.UI.MainForm.Paint = function(self,w,h)
		surface.SetDrawColor(50,50,50,255)
		surface.DrawRect(0,0,w,h)
	end
	PHX.UI.MainForm:SetDraggable(false)
	PHX.UI.MainForm:Center()
	PHX.UI.MainForm:MakePopup()
	
	PHX.UI.PnlTab = vgui.Create("DColumnSheet", PHX.UI.MainForm)	-- DPropertySheet
	PHX.UI.PnlTab:Dock(FILL)
	PHX.UI.PnlTab:DockMargin(12,12,12,12)
	PHX.UI.PnlTab.Paint = function(self)
		surface.SetDrawColor(50,50,50,255)
		surface.DrawRect(0,0,self:GetWide(),self:GetTall())
	end
	PHX.UI.PnlTab:UseButtonOnlyStyle()
	
	function PHX.UI:CreateBasicLayout( color, pTab )
		local panel = vgui.Create("DPanel", pTab )
		panel:SetBackgroundColor(color)
		panel:Dock(FILL)
		
		local scroll = vgui.Create( "DScrollPanel", panel )
		scroll:Dock(FILL)
		scroll:InvalidateParent(true)
		
		local grid = scroll:Add("DGrid")
		grid:SetPos(16,12)
		grid:SetCols(1)
		grid:SetColWide(PHX.UI.MainForm:GetWide() - 200)
		grid:SetRowHeight(35)
		
		return panel,grid
	end
	
	function PHX.UI.PaintTabButton ( item, text )
	
		item.Button:SetSize(item.Button:GetParent():GetWide(), 70)
		item.Button:SetText("")
		item.Button:SetStretchToFit( false )
		item.Button:SetToolTip( text )
		item.Button.Paint = function(self)
			surface.SetDrawColor(20,20,20,200)
			surface.DrawRect(0,0,self:GetWide(),self:GetTall())
		end
		
		item.Button.OnCursorEntered = function(self)
			self:SetColor(Color(255,255,0))
		end
		
		item.Button.OnCursorExited = function(self)
			self:SetColor(color_white)
		end
	
	end
	
	--[[
	Info:
		cmd: the Console Command to execute for.
		typ: the Data type variable. (see below)
		data: what data cotains. string / number / userdata
		panel: the Parent panel we'll use for. In this case usually is the "PHX.UI.PnlTab"
		text: A label text.
	
	Usage:
		PHX.UI:CreateVGUIType( cmd, typ, data, panel, text )
		
	Available Data type of "typ": 
		"check", "label", "btn", "slider"
	]]
	function PHX.UI:CreateVGUIType( cmd, typ, data, panel, text )
		-- do the Action.
		local CreateMenu = PHX.CLUI[ typ ]( cmd, data, panel, text )
		panel:AddItem( CreateMenu )
	end
	
	--[[
		Info: 
			HelpSelections // Help Menu Tab panel
		
		Usage:
			<internal::call>
	]]
	function PHX.UI:HelpSelections()
		local panel = vgui.Create("DPanel", PHX.UI.PnlTab)
		panel:SetBackgroundColor(Color(100,100,100,255))
		panel:Dock(FILL)
	
		local helpImage = vgui.Create("DImage", panel)
		helpImage.Count = 1
		helpImage:Dock(FILL)
		helpImage:SetImage("vgui/phhelp1.vmt")
	
		local pBottom = vgui.Create("DPanel", panel)
		pBottom:Dock(BOTTOM)
		pBottom:SetSize(0,40)
		pBottom:SetBackgroundColor(Color(0,0,0,0))
		
		local motd = vgui.Create("DButton", pBottom)
		motd:Dock(FILL)
		motd:SetSize(0,40)
		motd:SetText(PHX:FTranslate("SERVER_INFO_MOTD"))
		motd:SetFont("PHX.ArmorFont")
		motd:SetTextColor(color_white)
		motd.hover = {r=55,g=55,b=55}
		motd.Paint = function(pnl)
		if pnl:IsHovered() then
			pnl.hover = {r=70,g=70,b=70}
		else
			pnl.hover = {r=55,g=55,b=55}
		end
			surface.SetDrawColor(pnl.hover.r,pnl.hover.g,pnl.hover.b,255)
			surface.DrawRect(0,0,motd:GetWide(),motd:GetTall())
		end
		motd.DoClick = function() ply:ConCommand("ulx motd"); PHX.UI.MainForm:Close() end
		
		local bnext = vgui.Create("DButton", pBottom)
		bnext:Dock(RIGHT)
		bnext:SetSize(128,40)
		bnext:SetText(PHX:FTranslate("MISC_NEXT"))
		bnext:SetFont("HudHintTextLarge")
		bnext:SetTextColor(color_white)
		bnext.hover = {r=100,g=100,b=100}
		bnext.Paint = function(pnl)
		if pnl:IsHovered() then
			pnl.hover = {r=130,g=130,b=130}
			pnl:SetTextColor(color_white)
		elseif pnl:GetDisabled() then
			pnl.hover = {r=20,g=20,b=20}
			pnl:SetTextColor(Color(40,40,40))
		else
			pnl.hover = {r=100,g=100,b=100}
			pnl:SetTextColor(color_white)
		end
			surface.SetDrawColor(pnl.hover.r,pnl.hover.g,pnl.hover.b,255)
			surface.DrawRect(0,0,motd:GetWide(),motd:GetTall())
		end
		bnext.DoClick = function(pnl)
			helpImage.Count = helpImage.Count + 1
			if helpImage.Count > 6 then
				helpImage.Count = 1
			end
			helpImage:SetImage("vgui/phhelp"..helpImage.Count..".vmt")
		end
		
		local bprev = vgui.Create("DButton", pBottom)
		bprev:Dock(LEFT)
		bprev:SetSize(128,40)
		bprev:SetText(PHX:FTranslate("MISC_PREV"))
		bprev:SetFont("HudHintTextLarge")
		bprev:SetTextColor(color_white)
		bprev.hover = {r=100,g=100,b=100}
		bprev.Paint = function(pnl)
		if pnl:IsHovered() then
			pnl.hover = {r=130,g=130,b=130}
			pnl:SetTextColor(color_white)
		elseif pnl:GetDisabled() then
			pnl.hover = {r=20,g=20,b=20}
			pnl:SetTextColor(Color(40,40,40))
		else
			pnl.hover = {r=100,g=100,b=100}
			pnl:SetTextColor(color_white)
		end
			surface.SetDrawColor(pnl.hover.r,pnl.hover.g,pnl.hover.b,255)
			surface.DrawRect(0,0,motd:GetWide(),motd:GetTall())
		end
		bprev.DoClick = function(pnl)
			helpImage.Count = helpImage.Count - 1
			if helpImage.Count < 1 then
				helpImage.Count = 6
			end
			helpImage:SetImage("vgui/phhelp"..helpImage.Count..".vmt")
		end

		local PanelModify = PHX.UI.PnlTab:AddSheet("", panel, "vgui/ph_iconmenu/m_help.png")
		PHX.UI.PaintTabButton(PanelModify, PHX:FTranslate("PHXM_TAB_HELP"))
	end
	
	--[[
		Info: 
			PlayerModelSelections // Playermodel UI and Selections.
			This may include Model Additions too based on convar of PHX.CVAR.UseModelType
			and PHX.CVAR.UseCustomModel
		
		Usage:
			<internal::call>
	]]
	function PHX.UI:PlayerModelSelections()
		local panel = vgui.Create("DPanel", PHX.UI.PnlTab)
		panel:SetBackgroundColor(Color(40,40,40,120))
		panel:Dock(FILL)
		
		function PHX.UI:PlayerModelAdditions()
		
			-- the Model's DPanel preview. The Pos & Size must be similar as the ModelPreview.
			local panelpreview = vgui.Create( "DPanel", panel )
			panelpreview:Dock(FILL)
			panelpreview:SetBackgroundColor(Color(120,120,120,100))
			
			-- Model Preview.
			local modelPreview = vgui.Create( "DModelPanel", panelpreview )
			modelPreview:Dock(FILL)
			modelPreview:SetFOV ( 50 )
			modelPreview:SetModel ( mdlPath )
			
			local slider = vgui.Create("DNumSlider", panelpreview)
			slider:Dock(BOTTOM)
			slider:SetSize(0,32)
			slider:SetText(PHX:FTranslate("PHXM_PLAYERMODEL_SETFOV"))
			slider:SetMin(50)
			slider:SetMax(90)
			slider:SetValue(40)
			slider:SetDecimals(0)
			slider.OnValueChanged = function(pnl,val)
				slider:SetValue(val)
				modelPreview:SetFOV(val)
			end
			
			local scroll = vgui.Create( "DScrollPanel", panel )
			scroll:Dock(LEFT)
			scroll:SetSize( 720, 0 )
			
			-- ^dito, grid dimensions 66x66 w/ Coloumn 7.
			local pnl = vgui.Create( "DGrid", scroll )
			pnl:Dock(FILL)
			pnl:SetCols( 10 )
			pnl:SetColWide( 68 )
			pnl:SetRowHeight( 68 )
			
			local plMode = PHX.CVAR.UseModelType:GetInt()
			local plWhich = {
				[0]	= player_manager.AllValidModels(),
				[1]	= list.Get("PlayerOptionsModel")
			}
			if plMode == nil then plWhich = 0 end
			
			-- Get All Valid Paired Models and sort 'em out.
			for name, model in SortedPairs( plWhich[plMode] ) do
				
				-- dont forget to cache.
				util.PrecacheModel(model)
				
				local icon = vgui.Create( "SpawnIcon" )
				
				-- Click functions
				icon.DoClick = function()
					surface.PlaySound( "buttons/combine_button3.wav" )
					RunConsoleCommand( "cl_playermodel", name )
					modelPreview:SetModel(model)
					Derma_Query(PHX:FTranslate("QUERY_MODEL_SELECTED", name), "PHX",
						PHX:FTranslate("MISC_OK"), function() end)
				end
				
				-- Right click functions
				icon.DoRightClick = function()
					local menu = DermaMenu()
					menu:AddOption( "Apply Model", function() 
						surface.PlaySound( "buttons/combine_button3.wav" )
						RunConsoleCommand( "cl_playermodel", name )
						modelPreview:SetModel(model)
						Derma_Query(PHX:FTranslate("QUERY_MODEL_SELECTED", name), "PHX", PHX:FTranslate("MISC_OK"), function() end)
					end):SetIcon("icon16/tick.png")
					menu:AddSpacer()
					menu:AddOption( PHX:FTranslate("MDL_MENU_REFRESH"), function() icon:RebuildSpawnIcon() end):SetIcon("icon16/arrow_refresh.png")
					menu:AddOption( PHX:FTranslate("MDL_MENU_PREVIEW"), function() modelPreview:SetModel(model) end):SetIcon("icon16/magnifier.png")
					menu:AddOption( PHX:FTranslate("MDL_MENU_MODELINFO"),	function()
						Derma_Message( PHX:FTranslate("QUERY_MODEL_INFO", name), "Model Info", "Close" )
						end ):SetIcon("icon16/information.png")
					menu:AddSpacer()
					menu:AddOption( PHX:FTranslate("MISC_CLOSE") ):SetIcon("icon16/cross.png")
					menu:Open()
				end
				
				-- Make sure the user has noticed after choosing a model by indicating from "Borders".
				icon.PaintOver = function() 
					if ( GetConVar("cl_playermodel"):GetString() == name ) then 
						surface.SetDrawColor( Color( 255, 210 + math.sin(RealTime()*10)*40, 0 ) )
						surface.DrawOutlinedRect( 4, 4, icon:GetWide()-8, icon:GetTall()-8 )
						surface.DrawOutlinedRect( 3, 3, icon:GetWide()-6, icon:GetTall()-6 ) 
					end
				end
				
				-- Set set etc...
				icon:SetModel(model)
				icon:SetSize(64,64)
				icon:SetTooltip(name)
				
				pnl:AddItem(icon)
			end
			return pnl
		end
		
		-- Self Explanationary.
		if PHX.CVAR.UseCustomModel:GetBool() then
			-- Call the VGUI Properties of PlayerModelAdditions().
			PHX.UI:PlayerModelAdditions()
			local PanelModify = PHX.UI.PnlTab:AddSheet("", panel, "vgui/ph_iconmenu/m_plmodel.png")
			PHX.UI.PaintTabButton(PanelModify, PHX:FTranslate("PHXM_TAB_MODEL"))
		else
			-- Show small message instead
			local scroll = vgui.Create( "DScrollPanel", panel )
			scroll:Dock(FILL)
			
			local gridmdl = vgui.Create("DGrid", scroll)
			gridmdl:Dock(NODOCK)
			gridmdl:SetPos(10,10)
			gridmdl:SetCols(1)
			gridmdl:SetColWide(800)
			gridmdl:SetRowHeight(32)
			
			PHX.UI:CreateVGUIType("", "label", false, gridmdl, PHX:FTranslate("PHXM_MODEL_DISABLED"))
			
			-- this hook is intended to use for custom player model outside from PHX Menu. (like Custom Donator Model window or something).
			hook.Call("PH_CustomPlayermdlButton", nil, panel, gridmdl, function(cmd,typ,data,panel,text) PHX.UI:CreateVGUIType(cmd,typ,data,panel,text) end)
			
			local PanelModify = PHX.UI.PnlTab:AddSheet("", panel, "vgui/ph_iconmenu/m_plmodel.png")
			PHX.UI.PaintTabButton(PanelModify, PHX:FTranslate("PHXM_TAB_MODEL_DISABLED"))
		end
	end
	
	--[[
		Info: 
			PlayerOption // Player Options
		
		Usage:
			<internal::call>
	]]
	function PHX.UI:PlayerOption()
		local panel,gridpl = PHX.UI:CreateBasicLayout(Color(40,40,40,180),PHX.UI.PnlTab)

		PHX.UI:CreateVGUIType("", "label", false, gridpl, PHX:FTranslate("PHXM_PLAYER_LANG"))
		if (PHX.CVAR.UseForceLang:GetBool()) then
			PHX.UI:CreateVGUIType("", "label", false, gridpl, "Server is currently using a forced language. Current Language is: " .. PHX.LANGUAGES[PHX.CVAR.ForcedLanguage:GetString()].NameEnglish)
		else
			PHX.UI:CreateVGUIType(nil, "langcombobox", nil, gridpl, nil)
			PHX.UI:CreateVGUIType("", "btn", {max = 1, textdata = {
			-- will translate later.
			[1] = {"See all available Languages" , 
			function(self)
				PHX:showLangPreview()
			end}
			}}, gridpl ,"")
		end
		PHX.UI:CreateVGUIType("", "label", false, gridpl, PHX:FTranslate("PHXM_PLAYER_BIND"))
		
		PHX.UI:CreateVGUIType("ph_default_taunt_key", "binder", false, gridpl, PHX:FTranslate("PHXM_PLAYER_TAUNT_KEY"))
		PHX.UI:CreateVGUIType("ph_default_customtaunt_key", "binder", false, gridpl, PHX:FTranslate("PHXM_PLAYER_TAUNTWINDOW_KEY"))
		PHX.UI:CreateVGUIType("ph_default_rotation_lock_key", "binder", false, gridpl, PHX:FTranslate("PHXM_PLAYER_ROTATLOCK_KEY"))
		
		PHX.UI:CreateVGUIType("", "label", false, gridpl, PHX:FTranslate("PHXM_PLAYER_OPTIONS"))
		PHX.UI:CreateVGUIType("ph_cl_halos", "check", "CLIENT", gridpl, PHX:FTranslate("PHXM_PLAYER_TOGGLE_HALOS") )
		PHX.UI:CreateVGUIType("ph_cl_pltext", "check", "CLIENT", gridpl, PHX:FTranslate("PHXM_PLAYER_IDNAMES"))
		PHX.UI:CreateVGUIType("ph_cl_endround_sound", "check", "CLIENT", gridpl, PHX:FTranslate("PHXM_PLAYER_ENDROUND_CUE"))
		PHX.UI:CreateVGUIType("ph_cl_autoclose_taunt", "check", "CLIENT", gridpl, PHX:FTranslate("PHXM_PLAYER_TAUNTMENU_AUTOCLOSE"))
		PHX.UI:CreateVGUIType("ph_cl_spec_hunter_line", "check", "CLIENT", gridpl, PHX:FTranslate("PHXM_PLAYER_SEE_HUNTER_LINE"))
		PHX.UI:CreateVGUIType("cl_enable_luckyballs_icon", "check", "CLIENT", gridpl, PHX:FTranslate("PHXM_PLAYER_SEE_LBALL_ICONS"))
		PHX.UI:CreateVGUIType("cl_enable_devilballs_icon", "check", "CLIENT", gridpl, PHX:FTranslate("PHXM_PLAYER_SEE_CRYSTAL_ICONS"))
		
		PHX.UI:CreateVGUIType("hudspacer","spacer",nil,gridpl,"" )
		PHX.UI:CreateVGUIType("", "label", false, gridpl, PHX:FTranslate("PHXM_PLAYER_HUDSETTINGS"))
		
		PHX.UI:CreateVGUIType("ph_hud_use_new", "check", "CLIENT", gridpl, PHX:FTranslate("PHXM_PLAYER_USE_NEW_HUD"))
		PHX.UI:CreateVGUIType("ph_show_tutor_control", "check", "CLIENT", gridpl, PHX:FTranslate("PHXM_PLAYER_SHOW_TUTOR"))
		PHX.UI:CreateVGUIType("ph_show_custom_crosshair", "check", "CLIENT", gridpl, PHX:FTranslate("PHXM_PLAYER_USE_NEW_CROSSHAIR"))
		PHX.UI:CreateVGUIType("ph_show_team_topbar", "check", "CLIENT", gridpl, PHX:FTranslate("PHXM_PLAYER_SHOW_TEAM_TOPBAR"))
		
		local PanelModify = PHX.UI.PnlTab:AddSheet("", panel, "vgui/ph_iconmenu/m_player.png")
		PHX.UI.PaintTabButton(PanelModify, PHX:FTranslate("PHXM_TAB_PLAYER"))
	end
	
	--[[
		Info: 
			PlayerMute // Player Mute tab function.
		
		Usage:
			<internal::call>
	]]
	function PHX.UI:PlayerMute()
		local panel,gridmute = PHX.UI:CreateBasicLayout(Color(40,40,40,180),PHX.UI.PnlTab)
	
		PHX.UI:CreateVGUIType("","label",false,gridmute, PHX:FTranslate("PHXM_MUTE_SELECT"))
		for _,Plys in pairs(player.GetAll()) do
			PHX.UI:CreateVGUIType("","mute",Plys,gridmute,"")
		end
	
		local PanelModify = PHX.UI.PnlTab:AddSheet("", panel, "vgui/ph_iconmenu/m_voice.png")
		PHX.UI.PaintTabButton(PanelModify, PHX:FTranslate("PHXM_TAB_MUTE"))
	end
	
	function PHX.UI:ShowAdminMenu()
		local panel,grid = PHX.UI:CreateBasicLayout(Color(40,40,40,180),PHX.UI.PnlTab)

		PHX.UI:CreateVGUIType("", "label", false, grid, PHX:FTranslate("PHXM_ADMIN_LANGOVERRIDE"))
		PHX.UI:CreateVGUIType("ph_use_lang", "check", "SERVER", grid, PHX:FTranslate("PHXM_ADMIN_FORCELANG"))
		PHX.UI:CreateVGUIType("ph_force_lang", "langcombobox", true, grid, PHX:FTranslate("PHXM_ADMIN_LANGTOUSE"))
		PHX.UI:CreateVGUIType("ph_default_lang", "langcombobox", true, grid, PHX:FTranslate("PHXM_ADMIN_PLAYERDEFAULTLANG"))
		
		PHX.UI:CreateVGUIType("", "label", false, grid, PHX:FTranslate("PHXM_ADMIN_OPTIONS"))
		PHX.UI:CreateVGUIType("ph_notify_player_join_leave", "check", "SERVER", grid, PHX:FTranslate("PHXM_ENABLE_PLAYER_JOIN_LEAVE"))
		PHX.UI:CreateVGUIType("ph_use_custom_plmodel", "check", "SERVER", grid, PHX:FTranslate("PHXM_ADMIN_CUSTOM_MODEL"))
		PHX.UI:CreateVGUIType("ph_use_custom_plmodel_for_prop", "check", "SERVER", grid, PHX:FTranslate("PHXM_ADMIN_CUSTOM_MODEL_PROP"))
		PHX.UI:CreateVGUIType("ph_customtaunts_delay", "slider", {min = 2, max = 120, init = PHX.CVAR.CustomTauntDelay:GetInt(), dec = 0, kind = "SERVER"}, grid, PHX:FTranslate("PHXM_ADMIN_TAUNT_DELAY_CUSTOM"))
		PHX.UI:CreateVGUIType("ph_normal_taunt_delay", "slider", {min = 2, max = 120, init = PHX.CVAR.NormalTauntDelay:GetInt(), dec = 0, kind = "SERVER"}, grid, PHX:FTranslate("PHXM_ADMIN_TAUNT_DELAY_RANDOM"))
		PHX.UI:CreateVGUIType("ph_autotaunt_enabled", "check", "SERVER", grid, PHX:FTranslate("PHXM_ADMIN_AUTOTAUNT_ENABLE"))
		PHX.UI:CreateVGUIType("ph_autotaunt_delay", "slider", {min = 30, max = 180, init = PHX.CVAR.AutoTauntDelay:GetInt(), dec = 0, kind = "SERVER"}, grid, PHX:FTranslate("PHXM_ADMIN_TAUNT_DELAY_AUTO"))
		PHX.UI:CreateVGUIType("ph_forcejoinbalancedteams", "check", "SERVER", grid, PHX:FTranslate("PHXM_ADMIN_FORCEJOINBALANCE"))
		PHX.UI:CreateVGUIType("ph_enable_teambalance", "check", "SERVER", grid, PHX:FTranslate("PHXM_ADMIN_ENABLETEAMBALANCE"))
		PHX.UI:CreateVGUIType("devspacer","spacer",nil,grid,"" )
		PHX.UI:CreateVGUIType("ph_notice_prop_rotation", "check", "SERVER", grid, PHX:FTranslate("PHXM_ADMIN_NOTICE_ROTATION"))
		PHX.UI:CreateVGUIType("ph_prop_camera_collisions", "check", "SERVER", grid, PHX:FTranslate("PHXM_ADMIN_CAMERA_COLLIDE"))
		PHX.UI:CreateVGUIType("ph_freezecam", "check", "SERVER", grid, PHX:FTranslate("PHXM_ADMIN_FREEZECAM"))
		PHX.UI:CreateVGUIType("ph_prop_collision", "check", "SERVER", grid, PHX:FTranslate("PHXM_ADMIN_PROP_COLLIDE"))
		PHX.UI:CreateVGUIType("ph_swap_teams_every_round", "check", "SERVER", grid, PHX:FTranslate("PHXM_ADMIN_SWAP_TEAM"))
		PHX.UI:CreateVGUIType("ph_hunter_fire_penalty", "slider", 	{min = 2, max = 80, init = PHX.CVAR.HunterPenalty:GetInt(), dec = 0, kind = "SERVER"}, grid, PHX:FTranslate("PHXM_ADMIN_HUNTER_PENALTY"))
		PHX.UI:CreateVGUIType("ph_hunter_kill_bonus", "slider", 	{min = 5, max = 100, init = PHX.CVAR.HunterKillBonus:GetInt(), dec = 0, kind = "SERVER"}, grid, PHX:FTranslate("PHXM_ADMIN_HUNTER_KILL_BONUS"))
		PHX.UI:CreateVGUIType("ph_smggrenadecounts",  "slider", 	{min = 1, max = 50, init = PHX.CVAR.SMGGrenadeCounts:GetInt(), dec = 0, kind = "SERVER"}, grid, PHX:FTranslate("PHXM_ADMIN_HUNTER_SMG_GRENADES"))
		PHX.UI:CreateVGUIType("ph_game_time", "slider", 			{min = 20, max = 300, init = PHX.CVAR.GameTime:GetInt(), dec = 0, kind = "SERVER"}, grid, PHX:FTranslate("PHXM_ADMIN_GAME_TIME"))
		PHX.UI:CreateVGUIType("ph_hunter_blindlock_time", "slider", {min = 15, max = 60, init = PHX.CVAR.BlindTime:GetInt(), dec = 0, kind = "SERVER"}, grid, PHX:FTranslate("PHXM_ADMIN_BLINDLOCK_TIME"))
		PHX.UI:CreateVGUIType("ph_round_time", "slider", 			{min = 120, max = 600, init = PHX.CVAR.RoundTime:GetInt(), dec = 0, kind = "SERVER"}, grid, PHX:FTranslate("PHXM_ADMIN_ROUND_TIME"))
		PHX.UI:CreateVGUIType("ph_rounds_per_map", "slider", 		{min = 5, max = 30, init = PHX.CVAR.TotalRounds:GetInt(), dec = 0, kind = "SERVER"}, grid, PHX:FTranslate("PHXM_ADMIN_ROUNDS_PER_MAP"))
		PHX.UI:CreateVGUIType("ph_enable_lucky_balls", "check", "SERVER", grid, PHX:FTranslate("PHXM_ADMIN_ENABLE_LUCKYBALL"))
		PHX.UI:CreateVGUIType("ph_enable_devil_balls", "check", "SERVER", grid, PHX:FTranslate("PHXM_ADMIN_ENABLE_CRYSTAL"))
		PHX.UI:CreateVGUIType("ph_waitforplayers", "check", "SERVER", grid, PHX:FTranslate("PHXM_ADMIN_WAIT_PLAYERS"))
		PHX.UI:CreateVGUIType("ph_min_waitforplayers", "slider", { min = 1, max = game.MaxPlayers(), init = PHX.CVAR.MinWaitForPlayers:GetInt(), dec = 0, kind = "SERVER" }, grid, PHX:FTranslate("PHXM_ADMIN_WAIT_MIN_PLAYERS"))
		PHX.UI:CreateVGUIType("", "label", false, grid, PHX:FTranslate("PHXM_ADMIN_TAUNTMODES"))
		PHX.UI:CreateVGUIType("", "btn", {max = 2, textdata = {
			[1] = {PHX:FTranslate( "PHXM_ADMIN_TAUNTMODE_MODE", PHX.CVAR.CustomTauntMode:GetInt() ), 
			function(self)
				local CusTauntConvar = {
					[0] = PHX:FTranslate("PHXM_ADMIN_TAUNTMODE0"),
					[1] = PHX:FTranslate("PHXM_ADMIN_TAUNTMODE1"),
					[2] = PHX:FTranslate("PHXM_ADMIN_TAUNTMODE2")
				}
				local function SendTauntCommandState(state)
					net.Start("SendTauntStateCmd")
					net.WriteString(tostring(state))
					net.SendToServer()
				end
				
				self:SetText(CusTauntConvar[PHX.CVAR.CustomTauntMode:GetInt()])
				local state = 0
				if PHX.CVAR.CustomTauntMode:GetInt() == 0 then
					state = 1
					SendTauntCommandState(1)
					self:SetText(CusTauntConvar[state])
				elseif PHX.CVAR.CustomTauntMode:GetInt() == 1 then
					state = 2
					SendTauntCommandState(2)
					self:SetText(CusTauntConvar[state])
				elseif PHX.CVAR.CustomTauntMode:GetInt() == 2 then
					state = 0
					SendTauntCommandState(0)
					self:SetText(CusTauntConvar[state])
				end
				
				self:SizeToContents()
				self:SetSize(self:GetWide()+16, self:GetTall())
			end},
			[2] = {PHX:FTranslate("PHXM_ADMIN_TAUNTSOPEN"), function(self)
				if !LocalPlayer():Alive() and (LocalPlayer():Team() == TEAM_PROPS or LocalPlayer():Team() == TEAM_HUNTERS) then
					PHX:ChatInfo(PHX:Translate("PHXM_ADMIN_MUSTALIVE"), "NOTICE")
					PHX.UI.MainForm:Close()
				elseif	LocalPlayer():Team() == TEAM_SPECTATOR then
					PHX:ChatInfo(PHX:Translate("PHXM_ADMIN_MUSTALIVE"), "WARNING")
					PHX.UI.MainForm:Close()
				else
					LocalPlayer():ConCommand("ph_showtaunts")
				end
			end}
			}
		}, grid ,"")
		PHX.UI:CreateVGUIType("devspacer","spacer",nil,grid,"" )
		PHX.UI:CreateVGUIType("", "label", false, grid, PHX:FTranslate("PHXM_ADMIN_DEVSECTION"))
		PHX.UI:CreateVGUIType("ph_check_props_boundaries", "check", "SERVER", grid, PHX:FTranslate("PHXM_ADMIN_ROOMCHECK"))
		PHX.UI:CreateVGUIType("ph_mkbren_use_new_mdl","check","SERVER",grid, PHX:FTranslate("PHXM_ADMIN_USENEWMKBREN"))
		PHX.UI:CreateVGUIType("ph_print_verbose", "check", "SERVER", grid, PHX:FTranslate("PHXM_ADMIN_BEVERBOSE"))
		PHX.UI:CreateVGUIType("ph_enable_plnames", "check", "SERVER", grid, PHX:FTranslate("PHXM_ADMIN_SHOWPLNAMEHEAD"))
		PHX.UI:CreateVGUIType("ph_fc_use_single_sound", "check", "SERVER", grid, PHX:FTranslate("PHXM_ADMIN_USESINGLE_FZCAM"))
		PHX.UI:CreateVGUIType("ph_fc_cue_path","textentry","SERVER", grid, PHX:FTranslate("TEXTENTRY_FZ_SINGLE"))
		PHX.UI:CreateVGUIType("ph_use_playermodeltype", "check", "SERVER", grid, PHX:FTranslate("PHXM_ADMIN_MODELLISTINGTYPE"))
		PHX.UI:CreateVGUIType("ph_prop_jumppower", "slider", {min = 1, max = 3, init = PHX.CVAR.PropJumpPower:GetFloat(), dec = 2, float = true, kind = "SERVER"}, grid, PHX:FTranslate("PHXM_ADMIN_JUMPPOWER"))
		PHX.UI:CreateVGUIType("ph_sv_enable_obb_modifier","check","SERVER",grid, PHX:FTranslate("PHXM_ADMIN_ENABLE_OBB"))
		PHX.UI:CreateVGUIType("ph_reload_obb_setting_everyround","check","SERVER",grid, PHX:FTranslate("PHXM_ADMIN_RELOAD_OBB"))
		
		-- new cvar PH:X additions
		PHX.UI:CreateVGUIType("","spacer",nil,grid,"" )
		PHX.UI:CreateVGUIType("", "label", false, grid, PHX:FTranslate("PHXM_ADMIN_EXPERIMENTALPHX"))

		PHX.UI:CreateVGUIType("ph_add_hla_combine", "check", "SERVER", grid, PHX:FTranslate("PHXM_ADMIN_HLA_COMBINE"))
		PHX.UI:CreateVGUIType("ph_enable_teambalance", "check", "SERVER", grid, PHX:FTranslate("PHXM_ADMIN_TEAMBALANCE"))
		PHX.UI:CreateVGUIType("ph_max_teamchange_limit", "slider", {min = 3, max = 50, init = PHX.CVAR.ChangeTeamLimit:GetInt(), dec = 0, kind = "SERVER"}, grid, PHX:FTranslate("PHXM_ADMIN_CHANGETEAM_LIMIT"))
		PHX.UI:CreateVGUIType("ph_use_new_chat", "check", "SERVER", grid, PHX:FTranslate("PHXM_ADMIN_USENEWCHAT"))
		PHX.UI:CreateVGUIType("ph_new_chat_pos_sub", "slider", {min = 45, max = 1500, init = PHX.CVAR.NewChatPosSubstract:GetInt(), dec = 0, kind = "SERVER"}, grid, PHX:FTranslate("PHXM_ADMIN_NEWCHATPOS"))

		PHX.UI:CreateVGUIType("ph_allow_respawnonblind", "check", "SERVER", grid, PHX:FTranslate("PHXM_ADMIN_RESPAWNONBLIND"))
		PHX.UI:CreateVGUIType("ph_allow_respawnonblind_team_only", "slider", {min = 0, max = 2, init = PHX.CVAR.AllowRespawnOnBlindTeam:GetInt(), dec = 0, kind = "SERVER"}, grid, PHX:FTranslate("PHXM_ADMIN_RESPAWNONBLIND_TEAM"))
		PHX.UI:CreateVGUIType("ph_allow_respawn_from_spectator", "check", "SERVER", grid, PHX:FTranslate("PHXM_ADMIN_ALLOWRESPAWN_SPECTATOR"))
		PHX.UI:CreateVGUIType("ph_blindtime_respawn_percent", "slider", {min = 0, max = 1, init = PHX.CVAR.BlindRespawnTimePercent:GetFloat(), dec = 2, float = true, kind = "SERVER"}, grid, PHX:FTranslate("PHXM_ADMIN_REWSPANTIMEPERCENT"))
		PHX.UI:CreateVGUIType("ph_allow_respawnonblind_teamchange", "check", "SERVER", grid, PHX:FTranslate("PHXM_ADMIN_ALLOWRESPAWN_TEAMCHANGE"))
		
		PHX.UI:CreateVGUIType("", "label", false, grid, PHX:FTranslate("PHXM_ADMIN_PICKUP_PROPS"))
		-- ph_allow_pickup_object
		PHX.UI:CreateVGUIType("", "btn", {max = 1, textdata = {
			[1] = {PHX:FTranslate( "PHXM_MODE_DEFAULT", PHX.CVAR.AllowPickupProp:GetInt() ), 
			function(self)
				local modes = {
					[0] = PHX:FTranslate("PHXM_MODE0"),
					[1] = PHX:FTranslate("PHXM_MODE1"),
					[2] = PHX:FTranslate("PHXM_MODE2"),
					[3] = PHX:FTranslate("PHXM_MODE3")
				}
				local function SendPickupCmdState(state)
					net.Start("PHXPickupCmdState")
					net.WriteUInt(state,3)
					net.SendToServer()
				end
				
				local function apply(panel, state)
					SendPickupCmdState(state)
					panel:SetText(modes[state])
				end
				
				self:SetText(modes[PHX.CVAR.AllowPickupProp:GetInt()])
				local state = 0
				if PHX.CVAR.AllowPickupProp:GetInt() == 0 then
					state = 1
				elseif PHX.CVAR.AllowPickupProp:GetInt() == 1 then
					state = 2
				elseif PHX.CVAR.AllowPickupProp:GetInt() == 2 then
					state = 3
				elseif PHX.CVAR.AllowPickupProp:GetInt() == 3 then
					state = 0
				end
				apply(self,state)
				
				self:SizeToContents()
				self:SetSize(self:GetWide()+16, self:GetTall())
			end}
		}}, grid ,"")
		
		PHX.UI:CreateVGUIType("","spacer",nil,grid,"" )
		
	local PanelModify = PHX.UI.PnlTab:AddSheet("", panel, "vgui/ph_iconmenu/m_admin.png")
	PHX.UI.PaintTabButton(PanelModify, PHX:FTranslate("PHXM_TAB_ADMIN"))
	
	end
	
	function PHX.UI:MapVoteMenu()
		local panel,grid = PHX.UI:CreateBasicLayout(Color(40,40,40,180),PHX.UI.PnlTab)
		
		PHX.UI:CreateVGUIType("", "label", false, grid, PHX:FTranslate("PHXM_MV_SETTINGS"))
		PHX.UI:CreateVGUIType("mv_allowcurmap","check","SERVER",grid,PHX:FTranslate("PHXM_MV_ALLOWCURMAP"))
		PHX.UI:CreateVGUIType("mv_cooldown","check","SERVER",grid,PHX:FTranslate("PHXM_MV_COOLDOWN"))
		PHX.UI:CreateVGUIType("mv_use_ulx_votemaps","check","SERVER",grid,PHX:FTranslate("PHXM_MV_USE_ULX_VOTEMAPS"))
		PHX.UI:CreateVGUIType("mv_mapprefix","textentry","SERVER",grid, PHX:FTranslate("TEXTENTRY_MV_PREFIX"))
		PHX.UI:CreateVGUIType("mv_maplimit", "slider", 	{min = 2, max = 80, init = GetConVar("mv_maplimit"):GetInt(), dec = 0, kind = "SERVER"}, grid, PHX:FTranslate("PHXM_MV_MAPLIMIT"))
		PHX.UI:CreateVGUIType("mv_timelimit", "slider", {min = 15, max = 90, init = GetConVar("mv_timelimit"):GetInt(), dec = 0, kind = "SERVER"}, grid, PHX:FTranslate("PHXM_MV_TIMELIMIT"))
		PHX.UI:CreateVGUIType("mv_mapbeforerevote", "slider", 	{min = 1, max = 10, init = GetConVar("mv_mapbeforerevote"):GetInt(), dec = 0, kind = "SERVER"}, grid, PHX:FTranslate("PHXM_MV_MAPBEFOREREVOTE"))
		PHX.UI:CreateVGUIType("mv_rtvcount", "slider", 	{min = 2, max = game.MaxPlayers(), init = GetConVar("mv_rtvcount"):GetInt(), dec = 0, kind = "SERVER"}, grid, PHX:FTranslate("PHXM_MV_RTVCOUNT"))
		PHX.UI:CreateVGUIType("s1","spacer",nil,grid,"" )
		PHX.UI:CreateVGUIType("", "label", false, grid, PHX:FTranslate("PHXM_MV_EXPLANATION1"))
		PHX.UI:CreateVGUIType("", "label", false, grid, PHX:FTranslate("PHXM_MV_EXPLANATION2"))
		PHX.UI:CreateVGUIType("s2","spacer",nil,grid,"" )
		PHX.UI:CreateVGUIType("", "label", false, grid, PHX:FTranslate("PHXM_MV_EXPLANATION3"))
		
		PHX.UI:CreateVGUIType("", "btn", {max = 2, textdata = {
			[1] = {PHX:FTranslate("PHXM_MV_START"), function(self) 
				if (ulx and ulx ~= nil) then
					LocalPlayer():ConCommand("map_vote")
				else
					LocalPlayer():ConCommand("mv_start")
				end
			end
			},
			[2] = {PHX:FTranslate("PHXM_MV_STOP"), function(self)
				if (ulx and ulx ~= nil) then
					LocalPlayer():ConCommand("unmap_vote")
				else
					LocalPlayer():ConCommand("mv_stop")
				end
			end}
			}
		},grid,"")
	
		local PanelModify = PHX.UI.PnlTab:AddSheet("", panel, "vgui/ph_iconmenu/m_map.png")
		PHX.UI.PaintTabButton(PanelModify, PHX:FTranslate("PHXM_TAB_MAPVOTE"))
	end
	
	-- //////////////// Call the rest of the created Menus \\\\\\\\\\\\\\\\\\
	-- Note: Admin tab must have a validity and verification check from serverside before accessing for security reason.
	PHX.UI:HelpSelections()
	PHX.UI:PlayerMute()
	PHX.UI:PlayerOption()
	PHX.UI:PlayerModelSelections()
	
	-- Custom Hook Menu here. Give 1 second for better "safe-calling"...
	timer.Simple(1, function() 
		hook.Call("PH_CustomTabMenu", nil, PHX.UI.PnlTab, 
		function(cmd,typ,data,panel,text) 
			PHX.UI:CreateVGUIType(cmd,typ,data,panel,text)
		end,
		function(panel, text)
			PHX.UI.PaintTabButton(panel, text)
		end)
	end)
	
	-- Verify if current player is Admin or not.
	if ply:IsAdmin() then
		net.Start("CheckAdminFirst")
		net.SendToServer()
	end
	
	-- If verification success, Call the special admin menus.
	net.Receive("CheckAdminResult", function(len)
		PHX.UI:ShowAdminMenu()
		PHX.UI:MapVoteMenu()
	end)
	
	-- This was a test for painting vertical tab. I'll just leave it here for reference.
	--local Btns = PHX.UI.PnlTab.Navigation:GetChildren()[1]:GetChildren()
	--[[ local dTabItems = PHX.UI.PnlTab.Items
	for _,item in pairs(dTabItems) do
		item.Button:SetSize(item.Button:GetParent():GetWide(), 60)
		item.Button:SetText("")
		item.Button:SetStretchToFit( false )
		item.Button.Paint = function(self)
			surface.SetDrawColor(20,20,20,200)
			surface.DrawRect(0,0,self:GetWide(),60)
		end
	end ]]
end
concommand.Add("ph_x_menu", PHX.UI.BaseMainMenu, nil, "Open Prop Hunt X Advanced Menu window." )