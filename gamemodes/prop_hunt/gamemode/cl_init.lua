include("cl_fonts.lua")

language.Add("ph_fake_prop", "Prop Decoy")
killicon.Add("ph_fake_prop", "vgui/hud/killicon_decoy", Color(248,200,0,255))

-- public function for drawing simple circle.
function draw.Circle( x, y, radius, seg )
	local cir = {}

	table.insert( cir, { x = x, y = y, u = 0.5, v = 0.5 } )
	for i = 0, seg do
		local a = math.rad( ( i / seg ) * -360 )
		table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )
	end

	local a = math.rad( 0 ) -- This is needed for non absolute segment counts
	table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )

	surface.DrawPoly( cir )
end

include("sh_init.lua")
--include("sh_config.lua")
CL_GLOBAL_LIGHT_STATE	= 0
include("cl_lang.lua")
include("cl_fb_core.lua")
include("cl_chat.lua")
include("cl_hud_mask.lua")
include("cl_hud.lua")
include("cl_menutypes.lua")
include("cl_menu.lua")
include("cl_tauntwindow.lua")
include("cl_targetid.lua")
include("cl_autotaunt.lua")
-- Credits and Contributors message
include("cl_credits.lua")

-- /!\ Convars are now moved on sh_convars.lua.

-- Local Functions & Variables collection
local IndicatorColor = {
  ok = Color(20, 250, 0, 255),
  no = Color(250, 250, 0, 255)
}

local mat 		= "prophunt_enhanced/sprites/luckyball"
local pointer 	= "prophunt_enhanced/sprites/luckyball_pointer"
local dmat		= "prophunt_enhanced/sprites/devilball"
local dpointer	= "prophunt_enhanced/sprites/devilball_pointer"
local tutormat 	= "vgui/hud_control_help.png"
local crosshair = Material("vgui/hud_crosshair")

local decoy = {
    indicator   = "vgui/phehud/info_decoy",
    radial      = "vgui/phehud/info_decoy_orient"
}
local lgWind 	= {}
local curshow 	= 0

local translate = PHX.FTranslate

-- // local functions \\
local function DrawWaypointMarker( pl, matMarker, pointer, entToFind, offset )

	local offset = Vector( 0, 0, offset ) --45
	local ang = pl:EyeAngles()
	
	local w = ScrW()
	local h = ScrH()
	local cX = w/2
	local cY = h/2
	
	for _,ent in pairs(ents.FindByClass( entToFind )) do
	
		if IsValid(ent) then -- prevent icon stuck on new round
	
			local pos = ent:GetPos() + offset
			local poscr = pos:ToScreen()
			
			if pl:IsLineOfSightClear( ent ) then
			
				if ((poscr.x > 32 && poscr.x < (w-43)) && (poscr.y > 32 && poscr.y < (h-38))) then
					surface.SetDrawColor(255,255,255,255)
					surface.SetTexture(surface.GetTextureID( matMarker ))
					surface.DrawTexturedRect( poscr.x-32, poscr.y, 64, 64 )
				else
					local r = math.Round(cX/2)
					local rad = math.atan2(poscr.y-cY, poscr.x-cX)
					local deg = 0 - math.Round(math.deg( rad ))
					surface.SetDrawColor(255,255,255,255)
					surface.SetTexture(surface.GetTextureID( pointer ))
					surface.DrawTexturedRectRotated(math.cos(rad)*r+cX, math.sin(rad)*r+cY,64,64,deg+90)
				end
				
			end
			
		end
	end

end

local function DrawLine( pl, spriteMat, forTeam, dist, sizex, sizey, convarToCheck )

	if pl:Team() == forTeam then
    
        if !PHX:GetCLCVar( convarToCheck ) then return end
        
        local colour = color_white

        if dist == nil then dist = 100 end
        if sizex == nil then sizex = 8 end
        if sizey == nil then sizey = 8 end
	
		local trace = {}
            trace.start 	= pl:EyePos() + Vector(0,0,16)
            trace.endpos 	= pl:EyePos() + Vector(0,0,16) + pl:EyeAngles():Forward() * dist
            trace.mask		= MASK_PLAYERSOLID
            trace.filter	= ents.FindByClass('ph_prop')
            
        local tr = util.TraceLine( trace )
        local decoyCanBePlaced = ""
        
        if tr.Hit then
            if tr.HitNormal.z > 0.5 then
                colour = color_white
                decoyCanBePlaced = translate( "DECOY_INDICATOR_OK", input.GetKeyName(GetConVar("ph_cl_decoy_spawn_key"):GetInt()) )
            else
                decoyCanBePlaced = translate( "DECOY_INDICATOR_INVALID" )
                colour = Color(225, 25, 25)
            end
        else
            colour = Color(220, 40, 25)
            decoyCanBePlaced = translate( "DECOY_INDICATOR_TOOFAR" )
        end
        
        draw.DrawText( decoyCanBePlaced, "HunterBlindLockFont", ScrW() / 2 + 36, ScrH() / 2 - 6, colour, TEXT_ALIGN_LEFT )
		
        cam.Start3D()
            render.SetMaterial(spriteMat)
            render.DrawSprite(trace.endpos, sizex, sizey, colour)
        cam.End3D()
		
	end

end

-- Called immediately after starting the gamemode 
function Initialize()
	cHullz 				= 64
	client_prop_light 	= false
	blind 				= false
	
	cHullz_Min 			= 24 -- desired amount of hull.z to modify.
	cHullz_Max 			= 84 -- desired amount of hull.z to modify.
	
	CL_GLIMPCAM 		= 0
	MAT_LASERDOT 		= Material("sprites/glow04_noz")
	
	LocalPlayer():SetNWFloat("localLastTauntTime", 0)
end
hook.Add("Initialize", "PH_Initialize", Initialize)

-- ShowHelp is now moved to prop_hunt gamemodedir.
function GM:ShowHelp()
	
	if vgui_Splash and vgui_Splash ~= nil and istable(vgui_Splash) then
	
		local Help = vgui.CreateFromTable( vgui_Splash )
		Help:SetHeaderText( GAMEMODE.Name or "Prop Hunt: X" )
		Help:SetForHelp( "HELP_F1", GAMEMODE.PHXContributors )
		
		Help.lblFooterText.Think = function( panel ) 
			local tl = GAMEMODE:GetGameTimeLeft()
			if ( tl == -1 ) then return end
			
			if( GetGlobalBool( "IsEndOfGame", false ) ) then panel:SetText( PHX:FTranslate("MISC_GAME_ENDED") ) return end
			if( GAMEMODE.RoundBased && CurTime() > GAMEMODE:GetTimeLimit() ) then panel:SetText( PHX:FTranslate("MISC_GAMEEND") ) return end
			
			local timeLeft = PHX:FTranslate("MISC_TIMELEFT", util.ToMinutesSeconds( tl ))
			panel:SetText( timeLeft )
		end
		
		-- Internal Select buttons.
		local btnadd = Help:AddSelectButton(PHX:FTranslate("DERMA_PHMENU"), function()
			LocalPlayer():ConCommand("ph_x_menu")
		end)
		btnadd.m_colBackground = Color(255,128,40)
		
		hook.Run("PH_AddSplashHelpButton", Help)
		
		local btn = Help:AddSelectButton( PHX:FTranslate("DERMA_CHANGETEAM"), function() GAMEMODE:ShowTeam() end )
		btn.m_colBackground = Color( 120, 255, 100 )

		Help:AddCancelButton()
		Help:MakePopup()
        Help:NoFadeIn()
        
	else
	
		Help:AddCancelButton()
        
        Help:MakePopup()
        Help:NoFadeIn()
		ErrorNoHalt("[Prop Hunt: X] - Unable to open Help splash screen!!!")

	end
	
end

GM.ViewCam = {}
function GM.ViewCam.CamColEnabled( self, origin, Endpos, trace, traceStart, traceEnd, distMin, distMax, distNorm )
	
	if cHullz < cHullz_Min then
		trace[traceStart] 	= origin + Vector(0, 0, cHullz + (cHullz_Min-cHullz))
		trace[traceEnd] 	= origin + Vector(0, 0, cHullz + (cHullz_Min-cHullz)) + (Endpos:Forward() * distMin)
	elseif cHullz > cHullz_Max then
		trace[traceStart] 	= origin + Vector(0, 0, cHullz - cHullz_Max)
		trace[traceEnd] 	= origin + Vector(0, 0, cHullz - cHullz_Max) + (Endpos:Forward() * distMax)
	else
		trace[traceStart] 	= origin + Vector(0, 0, 8)
		trace[traceEnd] 	= origin + Vector(0, 0, 8) + (Endpos:Forward() * distNorm)
	end
	
	return trace
end

function GM.ViewCam.CamColDisabled( self, origin, Endpos, trace, traceStart, distMin, distMax, distNorm )
	if cHullz < cHullz_Min then
		trace[traceStart] = origin + Vector(0, 0, cHullz + (cHullz_Min-cHullz)) + (Endpos:Forward() * distMin)
	elseif cHullz > cHullz_Max then
		trace[traceStart] = origin + Vector(0, 0, cHullz - cHullz_Max) + (Endpos:Forward() * distMax)
	else
		trace[traceStart] = origin + Vector(0, 0, 8) + (Endpos:Forward() * distNorm)
	end

	return trace
end

-- Decides where  the player view should be (forces third person for props)
function GM:CalcView(pl, origin, angles, fov)
	local view = {} 
	
	if blind then
		view.origin = Vector(20000, 0, 0)
		view.angles = Angle(0, 0, 0)
		view.fov = fov
		
		return view
	end
	
 	view.origin = origin 
 	view.angles	= angles 
 	view.fov = fov 
 	
 	-- Give the active weapon a go at changing the viewmodel position 
	if pl:Team() == TEAM_PROPS && pl:Alive() then
		if PHX:GetCVar( "ph_prop_camera_collisions" ) then
			local trace = {}

			local filterent = ents.FindByClass("ph_prop")
			table.insert(filterent, pl)
			
			trace = self.ViewCam:CamColEnabled( origin, angles, trace, "start", "endpos", -80, -80, -80 )
			
			trace.filter = filterent
			
			local tr = util.TraceLine(trace)
			view.origin = tr.HitPos
		else
			self.ViewCam:CamColDisabled( origin, angles, view, "origin", -80, -80, -80 )

		end
	elseif pl:Team() == TEAM_HUNTERS && pl:Alive() then
	 	local wep = pl:GetActiveWeapon() 
	 	if wep && wep != NULL then
	 		local func = wep.GetViewModelPosition 
	 		if func then 
	 			view.vm_origin, view.vm_angles = func(wep, origin*1, angles*1)
	 		end
	 		 
	 		local func = wep.CalcView 
	 		if func then 
	 			view.origin, view.angles, view.fov = func(wep, pl, origin*1, angles*1, fov)
	 		end 
	 	end
		
		-- hunter glimpse of thirdperson
		if CL_GLIMPCAM > CurTime() then
			local trace = {}
			
			trace.start = origin
			trace.endpos = origin + (angles:Forward() * -80)
			trace.filter = player.GetAll()
			trace.maxs = Vector(4, 4, 4)
			trace.mins = Vector(-4, -4, -4)
			local tr = util.TraceHull(trace)
			
			view.drawviewer = true
			view.origin = tr.HitPos
		end
	end
 	
 	return view 
end

function HUDPaint()
	-- Draw player texts
	if PHX:GetCVar( "ph_enable_plnames" ) && PHX:GetCLCVar( "ph_cl_pltext" ) && LocalPlayer():Team() != TEAM_SPECTATOR then
		for _, pl in pairs(player.GetAll()) do
			if pl != LocalPlayer() && (pl && pl:IsValid() && pl:Alive() && pl:Team() == LocalPlayer():Team()) then
				local addvector = Vector(0, 0, math.Clamp(pl:EyePos():Distance(LocalPlayer():EyePos())*0.04, 16, 64))
				-- todo: text will disappear in a specified distance - not yet
				draw.DrawText(PHX:FTranslate("HUD_TargetID", pl:Name(), pl:Health()), "TargetIDSmall", (pl:EyePos() + addvector):ToScreen().x, (pl:EyePos() + addvector):ToScreen().y, team.GetColor(pl:Team()), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
		end
	end
	
	-- Hunter Blindlock Time
	if GetGlobalBool("InRound", false) then
		local blindlock_time_left = (PHX:GetCVar( "ph_hunter_blindlock_time" ) - (CurTime() - GetGlobalFloat("RoundStartTime", 0))) + 1
		
		if blindlock_time_left < 1 && blindlock_time_left > -6 then
			blindlock_time_left_msg = PHX:FTranslate("HUD_UNBLINDED")
		elseif blindlock_time_left > 0 then
			blindlock_time_left_msg = PHX:FTranslate("HUD_BLINDED", string.ToMinutesSeconds(blindlock_time_left))
		else
			blindlock_time_left_msg = nil
		end
		
		if blindlock_time_left_msg then
			surface.SetFont("HunterBlindLockFont")
			local tw, th = surface.GetTextSize(blindlock_time_left_msg)
			
			draw.RoundedBox(8, 20, 20, tw + 20, 26, Color(0, 0, 0, 75))
			draw.DrawText(blindlock_time_left_msg, "HunterBlindLockFont", 31, 26, Color(255, 255, 0, 255), TEXT_ALIGN_LEFT)
		end
	end
	
	-- Draw Lucky Balls Icon
	if PHX:GetCLCVar( "cl_enable_luckyballs_icon" ) && LocalPlayer():Team() == TEAM_HUNTERS then
		DrawWaypointMarker( LocalPlayer(), mat, pointer, 'ph_luckyball', 45 )
	end
	
	-- Draw Devil Ball Icon
	if PHX:GetCLCVar( "cl_enable_devilballs_icon" ) && LocalPlayer():Team() == TEAM_PROPS then
		DrawWaypointMarker( LocalPlayer(), dmat, dpointer, 'ph_devilball', 35 )
	end
    
    if PHX:GetCLCVar( "ph_cl_decoy_spawn_marker" ) && LocalPlayer():Team() == TEAM_PROPS then
        DrawWaypointMarker( LocalPlayer(), decoy.indicator, decoy.radial, 'ph_fake_prop', 50 )
    end
	
	-- Prop Crosshair
	if PHX:GetCLCVar( "ph_show_custom_crosshair" ) && LocalPlayer():Team() == TEAM_PROPS && LocalPlayer():Alive() then
		local color
		local trace = {}
		
		trace = GAMEMODE.ViewCam:CamColEnabled( LocalPlayer():EyePos(), LocalPlayer():EyeAngles(), trace, "start", "endpos", 100, 300, 100 )

		local filter = {}
		
		for k,v in pairs(ents.GetAll()) do
			if v:GetClass() == "ph_prop" or string.lower(v:GetClass()) == "player" then
				table.insert(filter, v)
			end
		end

		trace.filter = filter
		
		local trace2 = util.TraceLine(trace)
		if trace2.Entity && trace2.Entity:IsValid() && PHX:IsUsablePropEntity( trace2.Entity:GetClass() ) then
			if (!LocalPlayer():IsOnGround() or LocalPlayer():Crouching()) then
				color = IndicatorColor.no
			else
				color = IndicatorColor.ok
			end
		else
			color = Color(255,255,255,255)
		end
		surface.SetDrawColor( color )
		surface.SetMaterial( crosshair )
		surface.DrawTexturedRect( ScrW() / 2 - ( 64 / 2 ), ScrH() / 2 - ( 64 / 2 ), 64, 64 )
	end
	
	-- The 'You were Killed By' text, or the Freeze Cam text.
	if LocalPlayer():GetNWBool("InFreezeCam", false) then
		local transtext = PHX:FTranslate("HUD_KILLEDBY", LocalPlayer():GetNWEntity("PlayerKilledByPlayerEntity", nil):Name())
		
		local w1, h1 = surface.GetTextSize( transtext );
		local textx = ScrW()/2
		local steamx = (ScrW()/2) - 32
		draw.SimpleTextOutlined(transtext , "TrebuchetBig", textx, ScrH()*0.75, Color(255, 10, 10, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1.5, Color(0, 0, 0, 255))
	end
    
    -- Draw a sprite
    if GetGlobalBool("InRound", false) and LocalPlayer():HasFakePropEntity() and LocalPlayer():Alive() then
		DrawLine(LocalPlayer(), MAT_LASERDOT, TEAM_PROPS, 250, 24, 24, "ph_cl_decoy_spawn_helper" )
	end
end
hook.Add("HUDPaint", "PH_HUDPaint", HUDPaint)

-- After the player has been drawn
function PH_PostPlayerDraw(pl)
	-- Draw a line on hunters
	if PHX:GetCLCVar( "ph_cl_spec_hunter_line" ) && (!LocalPlayer():Alive() || LocalPlayer():Team() == TEAM_SPECTATOR) then        
        local trace = {}
        trace.start = pl:GetShootPos()
        trace.endpos = pl:GetEyeTrace().HitPos
        
        render.DrawLine(trace.start, trace.endpos, team.GetColor(pl:Team()), true)
		render.SetMaterial(MAT_LASERDOT)
		render.DrawSprite(trace.endpos, 8, 8, team.GetColor(pl:Team()))
    end
end
hook.Add("PostPlayerDraw", "PH_PostPlayerDraw", PH_PostPlayerDraw)

hook.Add("PrePlayerDraw", "PHX.HidePlayer", function(ply)
	if ply:Team() == TEAM_PROPS then return true end
end)

-- Draws halos on team members
function drawPropSelectHalos()
	local halocol = IndicatorColor.ok
	
	if PHX:GetCLCVar( "ph_cl_halos" ) then
		-- Something to tell if the prop is selectable
		if LocalPlayer():Team() == TEAM_PROPS && LocalPlayer():Alive() then
		
			if (!LocalPlayer():IsOnGround() or LocalPlayer():Crouching()) then
				halocol = IndicatorColor.no
			else
				halocol = IndicatorColor.ok
			end
		
			local trace = {}
			
			trace = GAMEMODE.ViewCam:CamColEnabled( LocalPlayer():EyePos(), LocalPlayer():EyeAngles(), trace, "start", "endpos", 100, 300, 100 )
			
			local filter = {} -- We need to filter out players and the ph_prop.
			for k,v in pairs(ents.GetAll()) do
				if v:GetClass() == "ph_prop" or string.lower(v:GetClass()) == "player" then
					table.insert(filter, v)
				end
			end
			
			trace.filter = filter
			
			local trace2 = util.TraceLine(trace) 
			if trace2.Entity && trace2.Entity:IsValid() && PHX:IsUsablePropEntity(trace2.Entity:GetClass()) then
				local ent_table = {}
				table.insert(ent_table, trace2.Entity)
				halo.Add(ent_table, halocol, 1.2, 1.2, 1, true, true)
			end
		end
		
	end
end
hook.Add("PreDrawHalos", "PHX.drawPropSelectHalos", drawPropSelectHalos)

-- Called every client frame
function GM:Think()
	-- updates everytime.
	blind = LocalPlayer():GetBlindState()

	-- Prop light
	if client_prop_light && LocalPlayer() && LocalPlayer():IsValid() && LocalPlayer():Alive() && LocalPlayer():Team() == TEAM_PROPS then
		local prop_light = DynamicLight(LocalPlayer():EntIndex())
		if prop_light then
			prop_light.pos = LocalPlayer():GetPos()
			prop_light.r = 255
			prop_light.g = 255
			prop_light.b = 255
			prop_light.brightness = 0.25
			prop_light.decay = 1
			prop_light.size = 180
			prop_light.dietime = CurTime() + 0.1
		end
	end
end

-- ///////////////////\\\\\\\\\\\\\\\\\ --
-- 			Net Receives Hooks 			--
-- ///////////////////\\\\\\\\\\\\\\\\\ --

net.Receive("PH_ShowTutor", function()
	if PHX:GetCLCVar( "ph_show_tutor_control" ) && LocalPlayer():Alive() then
	
		if curshow <= 2 then
	
			local xNotify = vgui.Create( "DNotify" )
			xNotify:SetPos( ScrW() - 300 , 60 )
			xNotify:SetSize( 256, 256 )
			xNotify:SetLife(12)
			
			local bg = vgui.Create( "DPanel", xNotify )
			bg:Dock( FILL )
			bg:SetBackgroundColor( Color( 16, 16, 16, 180 ) )
			
			local image = vgui.Create( "DImage", bg )
			image:SetImage(tutormat)
			image:Dock(FILL)
			
			xNotify:AddItem(bg)
			
			curshow = curshow + 1
			
		end
	end
end)

net.Receive("PH_TeamWinning_Snd", function(len)
	local snd = net.ReadString()
	if PHX:GetCLCVar( "ph_cl_endround_sound" ) then
		surface.PlaySound(snd)
	end
end)

net.Receive("ResetHull", function()
	if LocalPlayer() && LocalPlayer():IsValid() then
		LocalPlayer():ResetHull()
		cHullz = 64
	end
end)

net.Receive("PlayFreezeCamSound", function()
	if PHX:GetCVar( "ph_fc_use_single_sound" ) then
		surface.PlaySound( PHX.LegalSoundPath )
	else
		surface.PlaySound( PHX.FreezeCamSounds[math.random(1, #PHX.FreezeCamSounds)] )
	end
end)

net.Receive("SetHull", function()
	local hullxy = net.ReadInt(32)
	local huz = net.ReadInt(32)
	local hulldz = net.ReadInt(32)
	local new_health = net.ReadInt(9)
	cHullz = huz
	LocalPlayer():SetHull(Vector(hullxy * -1, hullxy * -1, 0), Vector(hullxy, hullxy, huz))
	LocalPlayer():SetHullDuck(Vector(hullxy * -1, hullxy * -1, 0), Vector(hullxy, hullxy, hulldz))
	LocalPlayer():SetHealth(new_health)
end)

-- Replaces the flashlight with a client-side dynamic light for props
net.Receive("PlayerSwitchDynamicLight", function() 
	if client_prop_light then
		client_prop_light = false
		surface.PlaySound("prop_idbs/light_off1.wav")
		CL_GLOBAL_LIGHT_STATE = 0
	else
		client_prop_light = true
		surface.PlaySound("prop_idbs/light_on.wav")
		CL_GLOBAL_LIGHT_STATE = 1
	end
end)

-- Turns the dynamic light OFF
net.Receive("DisableDynamicLight", function()
	if client_prop_light then
		client_prop_light = false
	end
end)

-- Draw a deathnotice from decoy prop
function PHX:DrawDecoyDeathNotice( attacker, inflictor )
    GAMEMODE:AddDeathNotice( attacker:Nick(), -1, inflictor, "#ph_fake_prop", -1 )
end

net.Receive( "PHX.DeathNoticeDecoy", function() 
    local attacker = net.ReadEntity()
    local inflictor = net.ReadEntity()
    
    PHX:DrawDecoyDeathNotice( attacker, inflictor )
end )

-- Language Preview Window
function PHX:showLangPreview()
	
	lgWind.frame = vgui.Create("DFrame")
	lgWind.frame:SetSize(600, ScrH()-200)
	lgWind.frame:SetTitle("Language List & Preview")
	lgWind.frame:Center()
	lgWind.frame:MakePopup()
	
	lgWind.panel = vgui.Create("DPanel", lgWind.frame)
	lgWind.panel:Dock(FILL)
	lgWind.panel:DockMargin(6,6,6,6)
	lgWind.panel:SetBackgroundColor(Color(90,90,90,200))
	
	lgWind.scroll = vgui.Create("DScrollPanel", lgWind.panel)
	lgWind.scroll:Dock(FILL)
	lgWind.scroll:DockMargin(4,4,4,4)
	
	local langList = PHX.LANGUAGES
	for code, data in pairs(langList) do
		local Name = data.Name
		local NameEnglish = data.NameEnglish
		local Author = data.Author
		local URLs = data.AuthorURL
		
		local dPanel = lgWind.scroll:Add("DPanel")
		dPanel:Dock(TOP)
		dPanel:SetSize(0,128)
		dPanel:DockMargin( 0, 0, 0, 4 )
		dPanel:SetBackgroundColor(Color(64,64,64,180))
		
		local title = vgui.Create("DLabel", dPanel)
		title:Dock(TOP)
		title:SetSize(0,28)
		title:DockMargin( 6, 4, 6, 1 )
		title:SetText( Name .. " (".. NameEnglish ..")" )
		title:SetTextColor(color_white)
		title:SetFont("Trebuchet24")
		
		local PreviewText = vgui.Create("DLabel", dPanel)
		PreviewText:Dock(TOP)
		PreviewText:DockMargin( 6, 0, 6, 5 )
		PreviewText:SetSize(0,25)
		PreviewText:SetText( string.format("Example: %q, %q", langList[code]["MISC_GAMEEND"], langList[code]["HUD_HP"] ) )
		PreviewText:SetTextColor(Color(150,210,235))
		PreviewText:SetFont("PHX.TopBarFont")
		
		local function createURLLabel(textUrl, pParent)
			local url = vgui.Create("DLabelURL", pParent)
			url:Dock(TOP)
			url:DockMargin( 6, 0, 6, 3 )
			url:SetSize(0,10)
			url:SetColor(Color(255,255,0))
			url:SetText(textUrl)
			url:SetURL(textUrl)
		end
		
		local lbl = vgui.Create("DLabel", dPanel)
		lbl:Dock(TOP)
		lbl:DockMargin( 6, 0, 6, 4 )
		lbl:SetSize(0,12)
		lbl:SetText( "Author(s): " .. Author )
		lbl:SetTextColor(color_white)
		lbl:SetFont("PHX.AmmoFont")
		
		if type(URLs) == "string" then
			createURLLabel(URLs, dPanel)
		elseif type(URLs) == "table" then
			for _,url in pairs(URLs) do
				createURLLabel(url, dPanel)
			end
		end
		
	end
	
end