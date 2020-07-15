PHX.UI = PHX.UI or {}

-- Global for Mute Function.
function PHX.UI:GetMutedStateIcon(bool)
	if bool then
		return "vgui/phehud/voice_off"
	end
	
	return "vgui/phehud/voice_on"
end

function PHX.UI.BaseMainMenu(ply, cmd, args)
	local mdlName = ply:GetInfo("cl_playermodel")
	local mdlPath = player_manager.TranslatePlayerModel(mdlName)
	
	PHX.UI.MainForm = vgui.Create("DFrame")
	PHX.UI.MainForm:SetSize(ScrW()-96,ScrH()-128)
	PHX.UI.MainForm:SetTitle("Prop Hunt X - Advanced Setting Menu")
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
		motd:SetText("SERVER INFORMATION & RULES [MOTD]")
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
		bnext:SetText("NEXT >")
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
			if helpImage.Count >= 6 then
				helpImage.Count = 6
			end
			helpImage:SetImage("vgui/phhelp"..helpImage.Count..".vmt")
		end
		
		local bprev = vgui.Create("DButton", pBottom)
		bprev:Dock(LEFT)
		bprev:SetSize(128,40)
		bprev:SetText("< PREVIOUS")
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
			if helpImage.Count <= 1 then
				helpImage.Count = 1
			end
			helpImage:SetImage("vgui/phhelp"..helpImage.Count..".vmt")
		end

		local PanelModify = PHX.UI.PnlTab:AddSheet("", panel, "vgui/ph_iconmenu/m_help.png")
		PHX.UI.PaintTabButton(PanelModify, "Help Panel")
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
			slider:SetText(" Set Model FOV")
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
					Derma_Query("Model " .. name.. " has been selected and it will be applied after respawn!", "Model Applied",
						"OK", function() end)
				end
				
				-- Right click functions
				icon.DoRightClick = function()
					-- Same as above, but they has custom menus once user tries to right click on the models.
					local menu = DermaMenu()
					-- if user caught it says 'ERROR' but the model present, refresh it (:RebuildSpawnIcon)
					menu:AddOption( "Apply Model", function() 
						surface.PlaySound( "buttons/combine_button3.wav" )
						RunConsoleCommand( "cl_playermodel", name )
						modelPreview:SetModel(model)
						Derma_Query("Model " .. name.. " has been selected and it will be applied after respawn!", "Model Applied", "OK", function() end)
					end):SetIcon("icon16/tick.png")
					menu:AddSpacer()
					menu:AddOption( "Refresh Icon", function() icon:RebuildSpawnIcon() end):SetIcon("icon16/arrow_refresh.png")
					menu:AddOption( "Preview", function() modelPreview:SetModel(model) end):SetIcon("icon16/magnifier.png")
					menu:AddOption( "Model Information", function()
						Derma_Message( "Model's name is: " .. name .. "\n \nUsable by: Everyone.", "Model Info", "Close" )
						end ):SetIcon("icon16/information.png")
					menu:AddSpacer()
					menu:AddOption( "Close" ):SetIcon("icon16/cross.png")
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
			PHX.UI.PaintTabButton(PanelModify, "Player Models Browser")
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
			
			PHX.UI:CreateVGUIType("", "label", false, gridmdl, "Sorry, Custom Player Model is disabled on this server!")
			
			-- this hook is intended to use for custom player model outside from PHX Menu. (like Custom Donator Model window or something).
			hook.Call("PH_CustomPlayermdlButton", nil, panel, gridmdl, function(cmd,typ,data,panel,text) PHX.UI:CreateVGUIType(cmd,typ,data,panel,text) end)
			
			local PanelModify = PHX.UI.PnlTab:AddSheet("", panel, "vgui/ph_iconmenu/m_plmodel.png")
			PHX.UI.PaintTabButton(PanelModify, "Player Models (Disabled)")
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

		PHX.UI:CreateVGUIType("", "label", false, gridpl, "Player Options:")
		PHX.UI:CreateVGUIType("ph_cl_halos", "check", "CLIENT", gridpl, "Toggle Halo effect when choosing a prop" )
		PHX.UI:CreateVGUIType("ph_cl_pltext", "check", "CLIENT", gridpl, "Show Team player names above their heads instead (and appear through wall too)")
		PHX.UI:CreateVGUIType("ph_cl_endround_sound", "check", "CLIENT", gridpl, "Play End round sound cue")
		PHX.UI:CreateVGUIType("ph_cl_autoclose_taunt", "check", "CLIENT", gridpl, "Option for Auto closing for Taunt window when double-clicking them")
		PHX.UI:CreateVGUIType("ph_cl_spec_hunter_line", "check", "CLIENT", gridpl, "Draw a line on hunters so we can see their aim in spectator mode.")
		PHX.UI:CreateVGUIType("cl_enable_luckyballs_icon", "check", "CLIENT", gridpl, "Enable 'Lucky ball' icon to be displayed once they are spawned")
		PHX.UI:CreateVGUIType("cl_enable_devilballs_icon", "check", "CLIENT", gridpl, "Enable 'Devil ball' icon to be displayed once they are spawned")
		PHX.UI:CreateVGUIType("hudspacer","spacer",nil,gridpl,"" )
		PHX.UI:CreateVGUIType("", "label", false, gridpl, "HUD Settings")
		PHX.UI:CreateVGUIType("ph_hud_use_new", "check", "CLIENT", gridpl, "Use New PHX HUD")
		PHX.UI:CreateVGUIType("ph_show_tutor_control", "check", "CLIENT", gridpl, "Show Tutorial Pop-up (Shown only 2x on each prop spawns)")
		PHX.UI:CreateVGUIType("ph_show_custom_crosshair", "check", "CLIENT", gridpl, "Enable Custom Crosshair")
		PHX.UI:CreateVGUIType("ph_show_team_topbar", "check", "CLIENT", gridpl, "Show total alive team players bar on the top left (At least 4 Players will be shown)")
		PHX.UI:CreateVGUIType("", "label", false, gridpl, "Binds")
		PHX.UI:CreateVGUIType("ph_default_taunt_key", "binder", false, gridpl, "Random Taunt key")
		PHX.UI:CreateVGUIType("ph_default_customtaunt_key", "binder", false, gridpl, "Taunt Menu key")
		
		local PanelModify = PHX.UI.PnlTab:AddSheet("", panel, "vgui/ph_iconmenu/m_player.png")
		PHX.UI.PaintTabButton(PanelModify, "Player Settings")
	end
	
	--[[
		Info: 
			PlayerMute // Player Mute tab function.
		
		Usage:
			<internal::call>
	]]
	function PHX.UI:PlayerMute()
		local panel,gridmute = PHX.UI:CreateBasicLayout(Color(40,40,40,180),PHX.UI.PnlTab)
	
		PHX.UI:CreateVGUIType("","label",false,gridmute,"Select one player that you wish to mute.")
		for _,Plys in pairs(player.GetAll()) do
			PHX.UI:CreateVGUIType("","mute",Plys,gridmute,"")
		end
	
		local PanelModify = PHX.UI.PnlTab:AddSheet("", panel, "vgui/ph_iconmenu/m_voice.png")
		PHX.UI.PaintTabButton(PanelModify, "Voice Un/Mute")
	end
	
	function PHX.UI:ShowAdminMenu()
		local panel,grid = PHX.UI:CreateBasicLayout(Color(40,40,40,180),PHX.UI.PnlTab)

		PHX.UI:CreateVGUIType("", "label", false, grid, "Serverside gamemode Options (Only visible for Admins/Owner)")
		PHX.UI:CreateVGUIType("ph_use_custom_plmodel", "check", "SERVER", grid, "Enable custom models for Hunters")
		PHX.UI:CreateVGUIType("ph_use_custom_plmodel_for_prop", "check", "SERVER", grid, "Enable custom models for Props - Make sure to enable for Hunter too.")
		PHX.UI:CreateVGUIType("ph_customtaunts_delay", "slider", {min = 2, max = 120, init = PHX.CVAR.CustomTauntDelay:GetInt(), dec = 0, kind = "SERVER"}, grid, "Custom Taunts Delay (Seconds)")
		PHX.UI:CreateVGUIType("ph_normal_taunt_delay", "slider", {min = 2, max = 120, init = PHX.CVAR.NormalTauntDelay:GetInt(), dec = 0, kind = "SERVER"}, grid, "Normal Taunts Delay (Seconds)")
		PHX.UI:CreateVGUIType("ph_autotaunt_enabled", "check", "SERVER", grid, "Enable Auto Taunt Features")
		PHX.UI:CreateVGUIType("ph_autotaunt_delay", "slider", {min = 30, max = 180, init = PHX.CVAR.AutoTauntDelay:GetInt(), dec = 0, kind = "SERVER"}, grid, "Auto Taunts Delay (Seconds)")
		PHX.UI:CreateVGUIType("devspacer","spacer",nil,grid,"" )
		PHX.UI:CreateVGUIType("ph_notice_prop_rotation", "check", "SERVER", grid, "Display 'Prop Rotation' notification on every Prop Spawns")
		PHX.UI:CreateVGUIType("ph_prop_camera_collisions", "check", "SERVER", grid, "Enable Prop Camera collision to the wall")
		PHX.UI:CreateVGUIType("ph_freezecam", "check", "SERVER", grid, "Enable Freecam features for team props")
		PHX.UI:CreateVGUIType("ph_prop_collision", "check", "SERVER", grid, "Enable Prop collide on each other prop players")
		PHX.UI:CreateVGUIType("ph_swap_teams_every_round", "check", "SERVER", grid, "Swap team every round - Disabling means team will stay forever")
		PHX.UI:CreateVGUIType("ph_hunter_fire_penalty", "slider", 	{min = 2, max = 80, init = PHX.CVAR.HunterPenalty:GetInt(), dec = 0, kind = "SERVER"}, grid, "Hunter points penalty")
		PHX.UI:CreateVGUIType("ph_hunter_kill_bonus", "slider", 	{min = 5, max = 100, init = PHX.CVAR.HunterKillBonus:GetInt(), dec = 0, kind = "SERVER"}, grid, "Hunter kill bonus") 
		PHX.UI:CreateVGUIType("ph_game_time", "slider", 			{min = 20, max = 300, init = PHX.CVAR.GameTime:GetInt(), dec = 0, kind = "SERVER"}, grid, "Total Game time (Minutes)") 
		PHX.UI:CreateVGUIType("ph_hunter_blindlock_time", "slider", {min = 15, max = 60, init = PHX.CVAR.BlindTime:GetInt(), dec = 0, kind = "SERVER"}, grid, "Hunter blindlock time (Seconds)") 
		PHX.UI:CreateVGUIType("ph_round_time", "slider", 			{min = 120, max = 600, init = PHX.CVAR.RoundTime:GetInt(), dec = 0, kind = "SERVER"}, grid, "Game round time (Seconds)") 
		PHX.UI:CreateVGUIType("ph_rounds_per_map", "slider", 		{min = 5, max = 30, init = PHX.CVAR.TotalRounds:GetInt(), dec = 0, kind = "SERVER"}, grid, "Total game Rounds per Map") 
		PHX.UI:CreateVGUIType("ph_enable_lucky_balls", "check", "SERVER", grid, "Allow Lucky Balls Features to be spawned on breakable props (Chance is 8%)")
		PHX.UI:CreateVGUIType("ph_enable_devil_balls", "check", "SERVER", grid, "Allow Devil Balls Features to be spawned when hunter dies (Chance is 70%)")
		PHX.UI:CreateVGUIType("ph_waitforplayers", "check", "SERVER", grid, "Wait for Players to begin the gameplay")
		PHX.UI:CreateVGUIType("ph_min_waitforplayers", "slider", { min = 1, max = game.MaxPlayers(), init = PHX.CVAR.MinWaitForPlayers:GetInt(), dec = 0, kind = "SERVER" }, grid, "Mininum Players to Wait before the game starts (default: 1)")
		PHX.UI:CreateVGUIType("", "label", false, grid, "Enable Custom Taunt. Mode: 0 = Random, 1 = Custom, 2 Both mode)")
		PHX.UI:CreateVGUIType("", "btn", {max = 2, textdata = {
			[1] = {"--[ Current Mode is Mode: "..PHX.CVAR.CustomTauntMode:GetInt().." ] --", 
			function(self)
				local CusTauntConvar = {
					[0] = "Mode [0/F3]: Random Taunt",
					[1] = "Mode [1/C]: Custom Taunt",
					[2] = "Mode [2]: Both Modes"
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
			end},
			[2] = {"Open Taunt Window", function(self)
				if !LocalPlayer():Alive() then
					print("You must do this action when you are alive!")
					PHX.UI.MainForm:Close()
				else
					LocalPlayer():ConCommand("ph_showtaunts")
				end
			end}
			}
		}, grid ,"")
		PHX.UI:CreateVGUIType("devspacer","spacer",nil,grid,"" )
		PHX.UI:CreateVGUIType("", "label", false, grid, "Developer Options/Experimentals Features")
		PHX.UI:CreateVGUIType("ph_check_props_boundaries", "check", "SERVER", grid, "[WORK IN PROGRESS] Enable Boundaries Check? This prevents you to get stuck with objects/walls.")
		PHX.UI:CreateVGUIType("ph_mkbren_use_new_mdl","check","SERVER",grid, "Developer: Use new model for Bren MK II Bonus Weapon (Require Map Restart!)")
		PHX.UI:CreateVGUIType("ph_print_verbose", "check", "SERVER", grid, "Developer: Enable verbose information of PHX events in the console")
		PHX.UI:CreateVGUIType("ph_enable_plnames", "check", "SERVER", grid, "Enable Player team names to be appear on their screen.")
		PHX.UI:CreateVGUIType("ph_fc_use_single_sound", "check", "SERVER", grid, "Use single Freezecam sound instead of sound list (Use 'ph_fc_cue_path' to determine Freezecam sound path)")
		PHX.UI:CreateVGUIType("ph_use_playermodeltype", "check", "SERVER", grid, "Use Legacy Model List : 0 = All Playermodels (AddValidModel), 1 = Use Legacy: list.Get('PlayerOptionsModel')")
		PHX.UI:CreateVGUIType("ph_prop_jumppower", "slider", {min = 1, max = 3, init = PHX.CVAR.PropJumpPower:GetFloat(), dec = 2, float = true, kind = "SERVER"}, grid, "Additional Jump Power multiplier for Props")
		PHX.UI:CreateVGUIType("ph_sv_enable_obb_modifier","check","SERVER",grid, "Developer: Enable Customized Prop Entity OBB Model Data Modifier")
		PHX.UI:CreateVGUIType("ph_reload_obb_setting_everyround","check","SERVER",grid, "Developer: Reload Customized Prop Entity OBB Model Data Modifier every round restarts")
		
	local PanelModify = PHX.UI.PnlTab:AddSheet("", panel, "vgui/ph_iconmenu/m_admin.png")
	PHX.UI.PaintTabButton(PanelModify, "Admin Panel")
	
	end
	
	function PHX.UI:MapVoteMenu()
		local panel,grid = PHX.UI:CreateBasicLayout(Color(40,40,40,180),PHX.UI.PnlTab)
		
		PHX.UI:CreateVGUIType("", "label", false, grid, "MapVote Settings")
		PHX.UI:CreateVGUIType("mv_allowcurmap","check","SERVER",grid,"Allow Current map to be Voted")
		PHX.UI:CreateVGUIType("mv_cooldown","check","SERVER",grid,"Enable map Cooldown for voting")
		PHX.UI:CreateVGUIType("mv_use_ulx_votemaps","check","SERVER",grid,"Use map listing from ULX Mapvote? 1 = use from ULX mapvote list (which you can whitelist them), 0 = use default maps/*.bsp directory listing.")
		PHX.UI:CreateVGUIType("mv_maplimit", "slider", 	{min = 2, max = 80, init = GetConVar("mv_maplimit"):GetInt(), dec = 0, kind = "SERVER"}, grid, "Number of Maps to be shown in MapVote.")
		PHX.UI:CreateVGUIType("mv_timelimit", "slider", {min = 15, max = 90, init = GetConVar("mv_timelimit"):GetInt(), dec = 0, kind = "SERVER"}, grid, "Time in Seconds for default mapvote when voting.")
		PHX.UI:CreateVGUIType("mv_mapbeforerevote", "slider", 	{min = 1, max = 10, init = GetConVar("mv_mapbeforerevote"):GetInt(), dec = 0, kind = "SERVER"}, grid, "How many times cooldown map to be appear again?")
		PHX.UI:CreateVGUIType("mv_rtvcount", "slider", 	{min = 2, max = game.MaxPlayers(), init = GetConVar("mv_rtvcount"):GetInt(), dec = 0, kind = "SERVER"}, grid, "How many players required to use RTV (Rock the Vote)")
		PHX.UI:CreateVGUIType("s1","spacer",nil,grid,"" )
		PHX.UI:CreateVGUIType("", "label", false, grid, "To Setup which map should be listed, use (for example) [ mv_mapprefix 'ph_,cs_,de_' ] in the console.")
		PHX.UI:CreateVGUIType("", "label", false, grid, "If you are unable to do a MapVote, you NEED to install ULX Admin Mod!")
		PHX.UI:CreateVGUIType("s2","spacer",nil,grid,"" )
		PHX.UI:CreateVGUIType("", "label", false, grid, "MapVote Action (To cancel, simply type !unmap_vote in the chat or type 'unmap_vote' in console)")
		PHX.UI:CreateVGUIType("", "btn", {max = 2, textdata = {
			[1] = {"Start MapVote", function(self) 
				LocalPlayer():ConCommand("map_vote")
			end
			},
			[2] = {"Stop MapVote", function(self)
				LocalPlayer():ConCommand("unmap_vote")
			end}
			}
		},grid,"")
	
		local PanelModify = PHX.UI.PnlTab:AddSheet("", panel, "vgui/ph_iconmenu/m_map.png")
		PHX.UI.PaintTabButton(PanelModify, "MapVote")
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
	
	-- Let's paint... it?
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
concommand.Add("ph_x_menu", PHX.UI.BaseMainMenu, nil, "Open Prop Hunt X Advanced Menu." )