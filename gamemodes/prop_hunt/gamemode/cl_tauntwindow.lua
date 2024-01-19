-- QoL Improvement by: Darktooth (Scrollbar improvement, taunt close by bind keys, and other enhancement)
-- Special thanks for the idea and implementations!

PHX.FAVORITE_CATEGORY = "Favorite Taunts"
-- Had to put this to Public PHX table because of LUA Refresh event. We don't want our favorite list gets reset by itself
-- just because of Lua Refresh (Meaning that, incase someone edited the gamemode files while the server IS running). This one will fixed it.
PHX.FavoriteTaunts = PHX.FavoriteTaunts or {}
-- BTW, do note that cl_tauntwindow.lua are 'included' in #11 position in cl_init.lua, which is way behind from sh_init.lua (#1)!
-- Meaning that, if you're trying to access 'PHX.FavoriteTaunts' global table BEFORE to this inclusion (e.g: in cl_chat.lua), this will return nil!
-- Solution: Use InitPostEntity hook instead. DO NOT USE Initialize HOOK!

local window = {}
local hastaunt = false
local conf = PHX.ConfigPath

local function TauntFavPath( ply )
	return string.format( "%s/%s/%s.json", conf, "tauntfav", ply:GetVar( "_SavedSteamID", "localplayer" ) ) -- original: tostring( ply:SteamID64() )
end

local function ManageFavTaunt( ply, tbl, bShouldSave )

	if !ply or !tbl or ply == nil or ply == NULL or tbl == nil then 
		ErrorNoHaltWithStack("[Taunt Menu] Supplied Value for ManageFavTaunt (ply: ",ply,", tbl: ",tbl,") are invalid!")
		return
	end

	local path = TauntFavPath( ply )

	-- Save the file
	if (bShouldSave) then
		local f = util.TableToJSON( tbl, true )
		file.Write( path, f )
		
		-- Check if file exist and legit we store the data
		if !file.Exists( path, "DATA" ) or file.Size( path, "DATA" ) < 1 then
			-- Otherwise, uh oh!
			print("[Taunt Menu] Failed to save taunt file: " .. path .."!")
		end
		
		return --stop here.
		
	end

	-- Load the File instead, if bShouldSave is false or nil
	local r = file.Read( path , "DATA" )
	local t = {}
	
	if r and (r) ~= nil then t = util.JSONToTable( r ) end
	if t and (t) ~= nil and istable(t) then
		print("[Taunt Menu] Favorite Taunt File Loaded Successfully. Have Fun! ")
		tbl = t
	else
		print("[Taunt Menu] Failed to read Favorite taunt file: " .. path .. "! Is your game has write permission?")
		tbl = {}
	end
	
	return tbl
end

--Load favorite taunts stored locally (clientside)
--Between servers they will be the same
local function loadFavoriteTaunts( ply, tbl ) --Should be renamed something like "CheckExistence"
	
	-- We'll simply store our file in `phx_config` directory.
	-- Also, avoid using capital letters, as any Linux/MacOS has problem with file name reading in garry's mod.
	
	if not file.Exists( conf .. "/tauntfav", "DATA" ) then
		print("[Taunt Menu] It appears the default " .. conf .. "/tauntfav directory wasn't created. Making new one!")
		file.CreateDir( conf .. "/tauntfav" )
	end
	
	local path = TauntFavPath( ply )
	
	if not file.Exists( path, "DATA" ) then
		print("[Taunt Menu] 'Favorite Taunt' file does not exist. Create an empty file for now...")
		file.Write( path, util.TableToJSON( {} ) )
		tbl = {}
	--[[ else
		PHX.FavoriteTaunts = ManageFavTaunt( ply, PHX.FavoriteTaunts, false ) ]]
	end
	
	print("[Taunt Menu] Everything Looks Good, Attempting to Load 'Favorite Taunt' File...")
end

local menubarList = {
	["PHX_TM_MNBAR_OPTIONS"]	= {
		["PHX_TM_MNBAR_SAVEFAV"]		= { f = function() ManageFavTaunt( LocalPlayer(), PHX.FavoriteTaunts, true ) end, icon = "icon16/disk.png" },
		["PHX_TM_MNBAR_LOADFAV"]		= { f = function() 
			ManageFavTaunt( LocalPlayer(), PHX.FavoriteTaunts, false)
			if (window.CurrentlyOpen) then
				window.frame:Close()
				timer.Simple(0.15, function() LocalPlayer():ConCommand("ph_showtaunts") end)
			end
		end, icon = "icon16/folder_go.png" }
	},
	["PHX_TM_MNBAR_SETTINGS"] = {
		["PHX_TM_MNBAR_RESET"]		= { f = function() 
			PHX:MsgBox_Query("PHX_TM_WARN_CLEARFAV", "MISC_WARN",
				"MISC_YES", function()
					file.Write( TauntFavPath( LocalPlayer() ), util.TableToJSON( {} ) )
					PHX.FavoriteTaunts = {}
					
					if (window.CurrentlyOpen) then
						window.frame:Close()
						timer.Simple(0.15, function() LocalPlayer():ConCommand("ph_showtaunts") end)
					end
				end,
				"MISC_NO", function() end
			)
		end, icon = "icon16/arrow_rotate_clockwise.png" },
	}
}

window.state = false
window.CurrentlyOpen = false

net.Receive("PH_ForceCloseTauntWindow", function()
	-- Reset Category upon team change or death
	LocalPlayer():SetVar("tauntWindowCategorie", PHX.DEFAULT_CATEGORY)
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
	window.frame:SetDraggable(true)
	window.frame:SetMouseInputEnabled(true)
	window.frame:SetKeyboardInputEnabled(true)
	
	window.frame.Paint = function(self,w,h)
		surface.SetDrawColor(Color(42,42,42,230))
		surface.DrawRect(0,0,w,h)
	end
	
	window.frame.OnClose = function()
		-- Save Scrollbar State & Save Favorite Taunt goes here!
		LocalPlayer():SetVar( "tauntWindowScrolling", window.list.VBar:GetScroll() )
		-- ManageFavTaunt( LocalPlayer(), PHX.FavoriteTaunts, true )
		window.CurrentlyOpen = false
		hastaunt = false
	end
	
	-- MenuBar, exclusively for Favorite Taunt
	window.menuBar = vgui.Create("DMenuBar", window.frame)
	window.menuBar:DockMargin(-3,-6,-3,0) -- are they automatically docked?
	
	for topMenu,ListSubMenu in SortedPairs(menubarList) do
		local H = window.menuBar:AddMenu( PHX:FTranslate(topMenu) )
		for subMenu,Data in SortedPairs(ListSubMenu) do
			local icon = nil
			if Data.icon and Data.icon ~= nil then icon = Data.icon end
			local S = H:AddOption( PHX:FTranslate(subMenu), Data.f ):SetIcon( icon )
		end
	end
	

	window.list = vgui.Create("DListView", window.frame)
	window.list:SetMultiSelect(false)
	window.list:AddColumn("soundlist") -- does nothing because header is invisible.
	window.list.m_bHideHeaders = true
	window.list:SetDataHeight(21)
	window.list:Dock(FILL) -- FILL is the one working on DListView
	-- it appears that works after setting it on next frame. Tried to paste on another location, it resets to 0.
	timer.Simple(0.12, function()
		if ispanel(window.list.VBar) and window.list.VBar:IsValid() then
			window.list.VBar:SetScroll( LocalPlayer():GetVar( "tauntWindowScrolling", 0 )  )
		end
	end)
	
	window.toppanel = vgui.Create("DPanel", window.frame)
	window.toppanel:Dock(TOP)
	window.toppanel:DockPadding(4,6,4,2)
	window.toppanel:SetBackgroundColor(Color(16,16,16,180))

	window.comb = window.toppanel:Add("DComboBox")
	window.comb:Dock(TOP)
	window.comb:SetSize(0, 20)
	if (PHX.TAUNTS[ LocalPlayer():GetVar( "tauntWindowCategorie", PHX.DEFAULT_CATEGORY )] != nil && PHX.TAUNTS[ LocalPlayer():GetVar( "tauntWindowCategorie", PHX.DEFAULT_CATEGORY )][LocalPlayer():Team()] == nil) then
		window.comb:SetValue(PHX.DEFAULT_CATEGORY)
	else
		window.comb:SetValue( LocalPlayer():GetVar("tauntWindowCategorie", PHX.DEFAULT_CATEGORY) )
	end
	
	window.input = window.toppanel:Add("DTextEntry")
	window.input:Dock(TOP)
	window.input:SetSize(0, 20)
	window.input:DockMargin(0,5,0,5)
	window.input:SetPlaceholderText( PHX:FTranslate("TM_SEARCH_PLACEHOLDER") )
	
	window.pitchpanel = vgui.Create("DPanel", window.frame)
	window.pitchpanel:Dock(TOP)
	window.pitchpanel:DockPadding(4,2,4,4)
	window.pitchpanel:SetBackgroundColor(Color(16,16,16,180))
	
	-- Checkbox Label & Slider for Pitch and stuff here
	window.slider = window.pitchpanel:Add("DNumSlider")
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
	window.ckpitch = window.pitchpanel:Add("DCheckBoxLabel")
	window.ckpitch:Dock(TOP)
	window.ckpitch:SetSize(0,20)
	window.ckpitch:DockMargin(8,1,0,0)
	window.ckpitch:SetText( PHX:FTranslate("PHX_CTAUNT_USE_PITCH") )
	window.ckpitch:SetConVar( "ph_cl_pitch_taunt_enable" )
    function window.ckpitch:OnChange( bool )
        window.ckpitrand:SetEnabled( bool )
    end
	
	window.ckpitrand = window.pitchpanel:Add("DCheckBoxLabel")
	window.ckpitrand:Dock(TOP)
	window.ckpitrand:SetSize(0,20)
	window.ckpitrand:DockMargin(8,1,0,0)
	window.ckpitrand:SetText( PHX:FTranslate("PHX_CTAUNT_RANDOM_PITCH") )
	window.ckpitrand:SetConVar( "ph_cl_pitch_randomized" )
    window.ckpitrand:SetEnabled( window.ckpitch:GetChecked() )
	
	-- The [F3] Random taunt pitch
	window.ckPF3 = window.pitchpanel:Add("DCheckBoxLabel")
	window.ckPF3:Dock(TOP)
	window.ckPF3:SetSize(0,20)
	window.ckPF3:DockMargin(8,1,0,0)
	window.ckPF3:SetText( PHX:FTranslate("PHX_RTAUNT_USE_PITCH", input.GetKeyName( PHX:GetCLCVar( "ph_default_taunt_key" ) )) )
	window.ckPF3:SetConVar( "ph_cl_pitch_apply_random" )
    function window.ckPF3:OnChange( bool )
        window.ckPRandF3:SetEnabled( bool )
    end
	
	window.ckPRandF3 = window.pitchpanel:Add("DCheckBoxLabel")
	window.ckPRandF3:Dock(TOP)
	window.ckPRandF3:SetSize(0,20)
	window.ckPRandF3:DockMargin(8,1,0,0)
	window.ckPRandF3:SetText( PHX:FTranslate("PHX_RTAUNT_RANDOMIZE", input.GetKeyName( PHX:GetCLCVar( "ph_default_taunt_key" ) )) )
	window.ckPRandF3:SetConVar( "ph_cl_pitch_randomized_random" )
    window.ckPRandF3:SetEnabled( window.ckPF3:GetChecked() )
	
	-- The Fake Taunts pitch
	window.ckPFake = window.pitchpanel:Add("DCheckBoxLabel")
	window.ckPFake:Dock(TOP)
	window.ckPFake:SetSize(0,20)
	window.ckPFake:DockMargin(8,1,0,0)
	window.ckPFake:SetText( PHX:FTranslate("PHX_CTAUNT_PITCH_FOR_FAKE") )
	window.ckPFake:SetConVar( "ph_cl_pitch_apply_fake_prop" )
    function window.ckPFake:OnChange( bool )
        window.ckPRandFake:SetEnabled( bool )
    end
	
	window.ckPRandFake = window.pitchpanel:Add("DCheckBoxLabel")
	window.ckPRandFake:Dock(TOP)
	window.ckPRandFake:SetSize(0,20)
	window.ckPRandFake:DockMargin(8,1,0,5)
	window.ckPRandFake:SetText( PHX:FTranslate("PHX_CTAUNT_RANDPITCH_FOR_FAKE") )
    window.ckPRandFake:SetConVar( "ph_cl_pitch_fake_prop_random" )
    window.ckPRandFake:SetEnabled( window.ckPFake:GetChecked() )
	
	window.toppanel:InvalidateLayout(true)
	window.toppanel:SizeToChildren(false,true)
	window.pitchpanel:InvalidateLayout(true)
	window.pitchpanel:SizeToChildren(false,true)
	window.pitchpanel.Think = function()
		local stat = GetConVar( "ph_taunt_pitch_enable" ):GetBool()
		
		if stat then
			window.pitchpanel:SetVisible( true )
			window.pitchpanel:InvalidateParent()
		else
			window.pitchpanel:SetVisible( false )
			window.pitchpanel:InvalidateParent()
		end
	end

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

	--Check if taunt is favorite
	local function isTauntFavorite(taunt)
	
		if (not PHX.FavoriteTaunts[taunt]) or PHX.FavoriteTaunts[taunt] == nil then
			return false
		end
	
		return true
		
	end

	--Icon creation
	local function createIconForLine(linePanel, name)
		local tmpIcon = linePanel:Add("DImageButton") -- it's the same as vgui.create, but we'll make it visible and parented immediately.
		--local tmpIcon = vgui.Create("DImageButton", linePanel)

		if (isTauntFavorite(name)) then
			tmpIcon:SetColor(Color(255,255,255))
		else
			tmpIcon:SetColor(Color(120,120,120))
		end
		tmpIcon:SetImage("icon16/star.png")
		tmpIcon:SetSize(16,16)
		tmpIcon:SetPos(window.frame:GetWide()-45,2)
		function tmpIcon:DoClick()
			if isTauntFavorite(name) then
				self:SetColor(Color(120,120,120))
				PHX.FavoriteTaunts[name] = nil
			else
				self:SetColor(Color(255,255,255))
				PHX.FavoriteTaunts[name] = true
			end
		end
		--linePanel:Add(tmpIcon)
	end
	

	-- Let's Initialize the window.list.
	local defaultList = {}
	--If it's favorite tabs, we manage it differently
	if (LocalPlayer():GetVar("tauntWindowCategorie", PHX.DEFAULT_CATEGORY) == PHX.FAVORITE_CATEGORY) then
		for k,v in pairs(PHX.TAUNTS) do
		--Making sure that the v[Team_ID] is not nil
			if v[LocalPlayer():Team()]!=nil then
				for k2,v2 in pairs(v[LocalPlayer():Team()]) do
					--Initialise table
					if defaultList[LocalPlayer():Team()]==nil then
						defaultList[LocalPlayer():Team()] = {}
					end
					if isTauntFavorite(k2) then
						defaultList[LocalPlayer():Team()][k2] = v2
					end
				end
			end
		end
	else
		defaultList = PHX.TAUNTS[LocalPlayer():GetVar("tauntWindowCategorie", PHX.DEFAULT_CATEGORY)]
	end
	
	--in case categorie isn't set for the 2 teams
	if defaultList[LocalPlayer():Team()]==nil or !istable(defaultList[LocalPlayer():Team()]) then
		defaultList = PHX.TAUNTS[PHX.DEFAULT_CATEGORY]
	end
	
	-- Make sure each category isn't empty and has lines.
	local hasLines = false
	
	--Load favorite taunts before usage in loop below
	--loadFavoriteTaunts()
	
	-- add default list and check if there is a taunt inside the category
	if !table.IsEmpty(defaultList[LocalPlayer():Team()]) then
		for name,_ in pairs( defaultList[LocalPlayer():Team()] ) do
			local newCreatedLine = window.list:AddLine( name )
			createIconForLine(newCreatedLine,name)
		end
		
		hasLines = true
	else
		window.list:AddLine( PHX:FTranslate("TM_NO_TAUNTS") )
		hasLines = false
	end

	--init size
	-- window.list:SetSize(0,table.getn(window.list:GetLines())*21)

	-- add category list
	for category,_ in pairs( PHX.TAUNTS ) do
		-- don't add if team taunt data is empty!
		if PHX.TAUNTS[category][LocalPlayer():Team()] and PHX.TAUNTS[category][LocalPlayer():Team()] ~= nil then
			window.comb:AddChoice( category )
		end
	end

	--Favorite choice for the combobox
	window.comb:AddChoice( PHX.FAVORITE_CATEGORY )
	
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
				local newCreatedLine = self.list:AddLine( name )
				createIconForLine(newCreatedLine,name)
			end
			hasLines = true
			--window.list:SetSize(1,table.getn(self.list:GetLines())*21)
			window.list.VBar:SetScroll( 0 )
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
					local newCreatedLine = self.list:AddLine( v )
					createIconForLine(newCreatedLine,v)
				end
				hasLines = true
				--self.list:SetSize(0,table.getn(self.list:GetLines())*21)
				window.list.VBar:SetScroll( 0 )
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
		local t = {}

		if (val != PHX.FAVORITE_CATEGORY) then
			t = PHX.TAUNTS[val][LocalPlayer():Team()]
		else
			for k,v in pairs(PHX.TAUNTS) do
				--Making sure that the v[Team_ID] is not nil
				if v[LocalPlayer():Team()] != nil then
					for k2,v2 in pairs(v[LocalPlayer():Team()]) do
						if isTauntFavorite(k2) then
							t[k2] = v2
						end
					end
				end
			end 
		end
		
		LocalPlayer():SetVar("tauntWindowCategorie", val)
		window:ResetList( t )
			
		self:SortAndStyle(window.list)
	end
	
	window.slider.OnValueChanged = function(self,value)
		self:SetValue(value)
		RunConsoleCommand( "ph_cl_pitch_level", tostring( value ) )
	end
	
	window.CurrentCategory = LocalPlayer():GetVar("tauntWindowCategorie", PHX.DEFAULT_CATEGORY)
	window.comb:SortAndStyle(window.list)
	
	local function TranslateTaunt(category, linename)
		local tm = LocalPlayer():Team()
		if category != PHX.FAVORITE_CATEGORY then
			return linename, PHX.TAUNTS[category][tm][linename]
		else
			--Easier method would be to save taunt path into favoriteTaunt table and only have to get it from there
			for k,v in pairs(PHX.TAUNTS) do
				if v[tm]!=nil then
					for k2,v2 in pairs(v[tm]) do
						if k2==linename then
							return linename, v2
						end
					end
				end
			end
		end
	end
	
	local function SendToServer(name, snd, bFakeTaunt)
	
		if bFakeTaunt == nil then bFakeTaunt = false end
	
		local lastCTauntTime = LocalPlayer():GetLastTauntTime( "CLastTauntTime" ) --LocalPlayer():GetNWFloat("CTaunt.LastTauntTime", 0)
		local lastRTauntTime = LocalPlayer():GetLastTauntTime( "LastTauntTime" ) --LocalPlayer():GetNWFloat("LastTauntTime",0)
		
		local delay = lastCTauntTime + PHX:GetCVar( "ph_customtaunts_delay" )
		local delayR = lastRTauntTime + PHX:GetCVar( "ph_normal_taunt_delay" )
	
		if (delay <= CurTime() and delayR <= CurTime()) then
		
			net.Start("CL2SV_PlayThisTaunt")
				net.WriteString(tostring(name))
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
			local Name,getline = TranslateTaunt(window.CurrentCategory, window.list:GetLine(window.list:GetSelectedLine()):GetValue(1))
			SendToServer(Name,getline)
		end
	end)
	CreateStyledButton(LEFT,86,PHX:FTranslate("TM_TOOLTIP_PREVIEW"),{5,5,5,5}, "vgui/phehud/btn_play.vmt",FILL, function()
		if hastaunt and hasLines then
			local Name,getline = TranslateTaunt(window.CurrentCategory, window.list:GetLine(window.list:GetSelectedLine()):GetValue(1))
            local pt = 100
            if window.ckpitch:GetChecked() then
                if window.ckpitrand:GetChecked() then
                    pt = math.random(window.slider:GetMin(), window.slider:GetMax())
                else
                    pt = window.slider:GetValue()
                end
            end
            LocalPlayer():EmitSound( getline, 0, pt )
			PHX:AddChat(PHX:Translate("TM_NOTICE_PLAYPREVIEW", "["..Name.."] : "..getline), Color(20,220,0))
		end
	end)
	CreateStyledButton(LEFT,86,PHX:FTranslate("TM_TOOLTIP_PLAYCLOSE"),{5,5,5,5},"vgui/phehud/btn_playx.vmt",FILL, function()
		if hastaunt and hasLines then
			local Name,getline = TranslateTaunt(window.CurrentCategory, window.list:GetLine(window.list:GetSelectedLine()):GetValue(1))
		
			SendToServer(Name,getline)
			window.frame:Close()
		end
	end)
	CreateStyledButton(LEFT,86,PHX:FTranslate("TM_TOOLTIP_PLAYRANDOM"),{5,5,5,5},"vgui/phehud/btn_playrandom.vmt",FILL, function()
		if hasLines then
			local getRandom = table.Random(window.list:GetLines())
			local Name,getline = TranslateTaunt(window.CurrentCategory, getRandom:GetValue(1))
			SendToServer(Name,getline)
		end
	end)
	CreateStyledButton(LEFT,86,PHX:FTranslate("TM_TOOLTIP_FAKETAUNT"),{5,5,5,5},"vgui/phehud/btn_faketaunt.vmt",FILL, function( btn )    
		if hastaunt and hasLines then
            if LocalPlayer():Team() == TEAM_PROPS then
                local Name,getline = TranslateTaunt(window.CurrentCategory, window.list:GetLine(window.list:GetSelectedLine()):GetValue(1))
			
                if PHX:GetCVar( "ph_randtaunt_map_prop_enable" ) then
                    SendToServer(Name,getline, true)
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
			local Name,getline = TranslateTaunt(window.CurrentCategory, window.list:GetLine(window.list:GetSelectedLine()):GetValue(1))
			
			local textRandProp = { "PHX_CTAUNT_ON_RAND_PROPS", LocalPlayer():GetTauntRandMapPropCount() }
			if PHX:GetCVar( "ph_randtaunt_map_prop_max" ) == -1 then textRandProp = "PHX_CTAUNT_ON_RAND_PROPS_UNLI" end
			
			local menu = DermaMenu()
			menu:AddOption(PHX:FTranslate("TM_TOOLTIP_PREVIEW"), function() 
                if hasLines and (window) and IsValid(window.frame) then 
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
                    PHX:AddChat(PHX:Translate("TM_NOTICE_PLAYPREVIEW", "["..Name.."] : "..getline), Color(20,220,0)); 
                end 
            end):SetIcon("icon16/control_play.png")
			
			if PHX:GetCVar( "ph_randtaunt_map_prop_enable" ) and LocalPlayer():Team() == TEAM_PROPS then
				menu:AddOption(PHX:QTrans( textRandProp ), function()
					if hasLines then
                        if LocalPlayer():GetTauntRandMapPropCount() >= 0 then
                            SendToServer(Name,getline, true)
                            PHX:AddChat(PHX:Translate("PHX_CTAUNT_PLAYED_ON_RANDPROP"), Color(20,220,0))
                        else
                            PHX:AddChat(PHX:Translate("PHX_CTAUNT_RAND_PROPS_LIMIT"), Color(220,150,30))
                        end
					end
				end):SetIcon("icon16/feed.png")
			end
			
			menu:AddOption(PHX:FTranslate("TM_TOOLTIP_PLAYTAUNT"), function() if hasLines then SendToServer(Name,getline); end end):SetIcon("icon16/sound.png")
			menu:AddOption(PHX:FTranslate("TM_TOOLTIP_PLAYCLOSE"), function()
				if hasLines and (window) and IsValid(window.frame) then
					SendToServer(Name,getline)
					window.frame:Close()
				end 
			end):SetIcon("icon16/sound_delete.png")
			menu:AddSpacer()
			menu:AddOption(PHX:FTranslate("TM_MENU_CLOSE"), function()
				if (window) and IsValid(window.frame) then
					window.frame:Close()
				end
			end):SetIcon("icon16/cross.png")
			menu:Open()
		end
	end
	
	window.list.OnRowSelected = function()
		hastaunt = true
	end
	
	window.list.DoDoubleClick = function(id,line)
		hastaunt = true
		local Name,getline = TranslateTaunt(window.CurrentCategory, window.list:GetLine(window.list:GetSelectedLine()):GetValue(1))
		SendToServer(Name,getline)
		if PHX:GetCLCVar( "ph_cl_autoclose_taunt" ) then window.frame:Close(); end
	end
	
	window.frame:MakePopup()
	window.frame:SetKeyboardInputEnabled(false)
	
end

hook.Add("InitPostEntity", "PHX.LoadFavFile", function()
	if IsValid( LocalPlayer() ) and (not LocalPlayer():IsBot()) then --yes?
		print("[Taunt Menu] Initializing 'Favorite Taunt'")
		-- As for safety, we want to store 'The Local' Player ID into a Key and use them later for Saving.
		-- This is due to ShutDown Hook: https://wiki.facepunch.com/gmod/GM:ShutDown (See Warning)
		if (!LocalPlayer():SteamID64()) or tostring(LocalPlayer():SteamID64()) == "90071996842377216" then -- incase "-multirun" is used or their steamID is 90071996842377216 (STEAM_0:0:0)
			LocalPlayer():SetVar( "_SavedSteamID", "localplayer" )
		else
			LocalPlayer():SetVar( "_SavedSteamID", tostring( LocalPlayer():SteamID64() ) )
		end
		loadFavoriteTaunts( LocalPlayer(), PHX.FavoriteTaunts ) --Check File Existence...
		PHX.FavoriteTaunts = ManageFavTaunt( LocalPlayer(), PHX.FavoriteTaunts, false )
	end
end)

hook.Add("ShutDown", "PHX.SaveFavFile", function()
	if (PHX.FavoriteTaunts) and istable(PHX.FavoriteTaunts) and
		!table.IsEmpty(PHX.FavoriteTaunts) then
		print("[Taunt Menu] Saving 'Favorite Taunt' into a file... Done!")
		ManageFavTaunt( LocalPlayer(), PHX.FavoriteTaunts, true )
	else
		print("[Taunt Menu] Not Saving 'Favorite Taunt' because Favorite Taunts are empty.")
	end
end)

concommand.Add("ph_showtaunts", function(ply)
if ply:Alive() and window.state and ply:GetObserverMode() == OBS_MODE_NONE then
	if !window.CurrentlyOpen then
		MainFrame()
	else
		window.frame:Close()
	end
else
	PHX:ChatInfo( PHX:Translate("TM_PLAY_ONLY_ALIVE"), "WARNING" )
end
end, nil, "Show Prop Hunt taunt menu")