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
include("enhancedplus/cl_enhancedplus.lua")
CL_GLOBAL_LIGHT_STATE	= 0
include("cl_lang.lua")
include("cl_fb_core.lua")
include("cl_chat.lua")
include("cl_hud_mask.lua")
include("cl_hud.lua")
include("cl_menutypes.lua")
include("cl_menu.lua")
include("cl_menuadmacc.lua")
include("cl_tauntwindow.lua")
include("cl_autotaunt.lua")
include("cl_credits.lua") -- Credits and Contributors message

-- /!\ Convars are now moved on sh_convars.lua.

-- Local Functions & Variables collection
local cHullz 				= GM.ViewCam.cHullz
local client_prop_light 	= false
local blind 				= false
local CL_GLIMPCAM 		    = 0
local MAT_LASERDOT 		    = Material("sprites/glow04_noz")
local mat 		            = "prophunt_enhanced/sprites/luckyball"
local pointer 	            = "prophunt_enhanced/sprites/luckyball_pointer"
local dmat		            = "prophunt_enhanced/sprites/devilball"
local dpointer	            = "prophunt_enhanced/sprites/devilball_pointer"
local tutormat 	            = "vgui/hud_control_help.png"
local crosshair             = Material("vgui/hud_crosshair")
local curshow 	            = 0
local lgWind 	            = {}
local tpOn                  = false

--[[]]--
local decoy = {
    indicator   = "vgui/phehud/info_decoy",
    radial      = "vgui/phehud/info_decoy_orient"
}
local DecoyColor = { -- for decoy indicator
    invalid = Color(225,  25,  25),
    far     = Color(220,  40,  25)
}
local WordBoxCol = {
    bg      = Color(  0,   0,   0,  75),
    generic = Color(250, 250, 250, 255),
    hunter  = Color(255, 255,   0, 255),
	spectator = Color(255,200,16,255)
}
local FZTextColor = {
    fore    = Color(255,  10,  10, 255),
    outline = Color(0  ,   0,   0, 255)
}
local IndicatorColor = {
    ok      = Color( 20, 250,   0, 255),
    no      = Color(250, 250,   0, 255)
}
local DefaultKeysTut = {
	[TEAM_HUNTERS] = {
		Default = {
			["KEY_LMB"]	= "KEYHINT_SHOOT",
			["KEY_RMB"] = "KEYHINT_SEC",
			["E"] = "KEYHINT_PICKUP"
			},
		ConVars = {
			["ph_thirdperson_key"]			=  "KEYHINT_HUNTER3P" 
		}
	},
	[TEAM_PROPS] = {
		Default = {
		["KEY_LMB"]	= "KEYHINT_LMB",
		["KEY_RMB"]	= "KEYHINT_RMB",
		},
		ConVars = {
			["ph_default_taunt_key"]		=  "KEYHINT_RANDTAUNT",
			["ph_default_customtaunt_key"] 	=  "KEYHINT_TAUNTMENU",
			["ph_default_rotation_lock_key"] = "KEYHINT_ROTATION" ,
			["ph_prop_menu_key"]			=  "KEYHINT_PROPMENU" ,
			["ph_prop_midair_freeze_key"]	=  "KEYHINT_FREEZEAIR",
			["ph_cl_decoy_spawn_key"]		=  "KEYHINT_SPAWNDECOY",
			["ph_cl_unstuck_key"]			=  "KEYHINT_UNSTUCK"
		}
	}
}

-- // local functions \\
local function DrawWaypointMarker( pl, matMarker, pointer, entToFind, offset )

	local offset = Vector( 0, 0, offset ) --45
	local ang = pl:EyeAngles()
	
	local w = ScrW()
	local h = ScrH()
	local cX = w/2
	local cY = h/2
	
	for _,ent in pairs(ents.FindByClass( entToFind )) do
	
		if ent and IsValid(ent) then -- prevent icon stuck on new round
	
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
            trace = GAMEMODE.ViewCam:CamColEnabled( pl:EyePos(), pl:EyeAngles(), trace, "start", "endpos", dist, dist, dist, cHullz )
            trace.mask		= MASK_PLAYERSOLID
            trace.filter	= ents.FindByClass('ph_prop')
            
        local tr = util.TraceLine( trace )
        local decoyCanBePlaced = ""
        
        if tr.Hit then
            if tr.HitNormal.z > 0.5 then
                colour = color_white
                decoyCanBePlaced = PHX:FTranslate( "DECOY_INDICATOR_OK", input.GetKeyName(GetConVar("ph_cl_decoy_spawn_key"):GetInt()) )
            else
                decoyCanBePlaced = PHX:FTranslate( "DECOY_INDICATOR_INVALID" )
                colour = DecoyColor.invalid
            end
        else
            colour = DecoyColor.far
            decoyCanBePlaced = PHX:FTranslate( "DECOY_INDICATOR_TOOFAR" )
        end
        
        draw.DrawText( decoyCanBePlaced, "HunterBlindLockFont", ScrW() / 2 + 36, ScrH() / 2 - 6, colour, TEXT_ALIGN_LEFT )
		
        cam.Start3D()
            render.SetMaterial(spriteMat)
            render.DrawSprite(trace.endpos, sizex, sizey, colour)
        cam.End3D()
		
	end

end

local function getIndicColor( trace, fallback, colorTrue, colorFalse )
    local color = fallback
    local hmx,hmy,hmz = trace.Entity:GetPropSize()
    
        if PHX:GetCVar( "ph_prop_must_standing" ) and (!LocalPlayer():IsOnGround() or LocalPlayer():Crouching()) then return colorFalse end
        if PHX:GetCVar( "ph_check_for_rooms" ) and not LocalPlayer():CheckHull(hmx,hmy,hmz) then return colorFalse end
        color = colorTrue
        
    return color
end

-- ShowHelp is now moved to prop_hunt gamemodedir.
function GM:ShowHelp()
	
	if GAMEMODE.VGUISplash and GAMEMODE.VGUISplash ~= nil and istable(GAMEMODE.VGUISplash) then
	
		local Help = vgui.CreateFromTable( GAMEMODE.VGUISplash )
		Help:SetHeaderText( GAMEMODE.Name or "Prop Hunt: X2Z" )
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

-- ShowTeam also moved in here.
local TeamPanel = {}
local Splash    = {}

function GM:ShowTeam()

    -- Add Warning that if the game rans on singleplayer.
    if (game.SinglePlayer()) then
        chat.AddText(Color(255,0,0), "WARNING: This Game cannot be played on Single Player. You need to host a Multiplayer Game in order to play this game!")
        return
    end

	if ( !IsValid( TeamPanel ) ) then 
	
		TeamPanel = vgui.CreateFromTable( GAMEMODE.VGUISplash )
		TeamPanel:SetHeaderText( PHX:FTranslate("DERMA_TEAMSELECT") )

		local AllTeams = team.GetAllTeams()
		for ID, TeamInfo in SortedPairs ( AllTeams ) do
		
			if ( ID != TEAM_CONNECTING && ID != TEAM_UNASSIGNED && ( ID != TEAM_SPECTATOR || GAMEMODE.AllowSpectating ) && team.Joinable(ID) ) then
			
				if ( ID == TEAM_SPECTATOR ) then
					TeamPanel:AddSpacer( 12 )
				end
			
				local strName = PHX:TranslateName( ID ) -- TeamInfo.Name
				local func = function() RunConsoleCommand( "changeteam", ID ) end
			
				local btn = TeamPanel:AddSelectButton( strName, func )
				btn.m_colBackground = TeamInfo.Color
				btn.Think = function( self ) 
					self:SetText( Format( "%s (%i)", strName, team.NumPlayers( ID ) ))
					--[[ if ID ~= TEAM_SPECTATOR then
						self:SetDisabled( GAMEMODE:TeamHasEnoughPlayers( ID ) ) 
					end ]]
					self:SetDisabled(GAMEMODE:CustomTeamHasEnoughPlayers(ID, LocalPlayer()))
				end
				
				if (  IsValid( LocalPlayer() ) && LocalPlayer():Team() == ID ) then
					btn:SetDisabled( true )
				end
				
			end
			
		end
		
		if (  IsValid( LocalPlayer() ) &&
		
			( LocalPlayer():Team() == TEAM_UNASSIGNED or
			LocalPlayer():Team() == TEAM_SPECTATOR or
			LocalPlayer():Team() == TEAM_HUNTERS or
			LocalPlayer():Team() == TEAM_PROPS ) ) then
			
			TeamPanel:AddCancelButton()
		end
		
	end
	
	TeamPanel:MakePopup()

end

function GM:ShowSplash()
    if PHX:GetCVar( "ph_show_splash_screen" ) then
        local pnl = vgui.CreateFromTable( GAMEMODE.VSplashScreen )
        pnl:MakePopup()
    end
end

function PHX:SetGlimpCam(int)
    CL_GLIMPCAM = int
end

local function tptoggle( ply )
    if ply:Alive() and ply:Team() == TEAM_HUNTERS and PHX:GetCVar( "ph_enable_thirdperson" ) then
        if !tpOn then tpOn = true else tpOn = false end
        PHX:CenterPrint( (tpOn and "CL_THIRDPERSON_ENABLED" or "CL_THIRDPERSON_DISABLED"), color_white )
    end
end
concommand.Add("ph_toggle_tp", tptoggle)
hook.Add("PlayerButtonDown", "PHX.EnableThirdPerson", function(ply,btn)
    if (IsFirstTimePredicted()) then
        if btn == GetConVar( "ph_thirdperson_key" ):GetInt() then
            tptoggle( ply )
        end
    end
end)

-- Decides where  the player view should be (forces third person for props)
local cameradist = 0
local camMaxCollBounds=Vector(4,4,4)
local camBlindFoldV = Vector(20000, 0, 0)
function GM:CalcView(pl, origin, angles, fov)
	local view = {} 
	
	if blind then
		view.origin = camBlindFoldV
		view.angles = angle_zero
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
			trace = self.ViewCam:CamColEnabled( origin, angles, trace, "start", "endpos", -80, -80, -80, cHullz )
			trace.filter = filterent
            
            trace.maxs = camMaxCollBounds
			
            local prop = pl:GetPlayerPropEntity()
            if IsValid(prop) then
                local xymax = math.Round( math.Max(prop:OBBMaxs().x, prop:OBBMaxs().y) )
				local z = prop:OBBMaxs().z
                if (xymax >= 1 and xymax < 4) then
                    trace.maxs = Vector(xymax,xymax,xymax)
				elseif (z >= 1 and z < 4) then
					trace.maxs = Vector(z,z,z)
                end
            end
            
            trace.mins = trace.maxs*-1
			
            local tr = util.TraceHull(trace)
			view.origin = tr.HitPos
		else
			
			self.ViewCam:CamColDisabled( origin, angles, view, "origin", -80, -80, -80, cHullz )

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
		
        -- thirdperson camera
        if PHX:GetCVar( "ph_enable_thirdperson" ) and tpOn then
            local tp={}
			if PHX:GetCVar( "ph_sv_thirdperson_desired" ) then
				tp.f=GetConVar("ph_sv_thirdperson_ddist"):GetInt()
				tp.r=GetConVar("ph_sv_thirdperson_dright"):GetInt()
				tp.up=GetConVar("ph_sv_thirdperson_dup"):GetInt()
			else
				tp.f=GetConVar("ph_tpcam_dist"):GetInt()
				tp.r=GetConVar("ph_tpcam_right"):GetInt()
				tp.up=GetConVar("ph_tpcam_up"):GetInt()
			end
            local tr = self.ViewCam:Hunter3pCollEnabled( pl:Crouching(), origin, angles, tp.f, tp.r, tp.up )
            view.drawviewer = true
            view.origin = tr.HitPos
        end
        
		-- hunter glimpse of thirdperson
		if !tpOn and CL_GLIMPCAM > CurTime() then
            local tr = self.ViewCam:Hunter3pCollEnabled( pl:Crouching(), origin, angles, 80 )
			view.drawviewer = true
			view.origin = tr.HitPos
		end
	end
 	
 	return view 
end

local blindlock_time_left = 0
local blindlock_time_left_msg = nil

local function HUDPaint()
    if (game.SinglePlayer()) then
        draw.WordBox( 8, ScrW()/2, ScrH()/2, "[WARNING] Single Player Mode is not Supported! Please Host a Multiplayer to play!", "Trebuchet24",
        Color(0,0,0,250), Color(220,10,10), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        return
    end

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
	
		local cX,cY = ScrW()*0.5,ScrH()*0.5
	
		if PHX:GetCVar( "ph_spect_inform_join_team" ) and (LocalPlayer():Team() == TEAM_SPECTATOR or LocalPlayer():Team() == TEAM_UNASSIGNED) then
			draw.WordBox( 8, cX, ScrH()*0.125, PHX:FTranslate("PHX_SPECT_JOINGAME"), "HunterBlindLockFont",
			WordBoxCol.bg, WordBoxCol.spectator, TEXT_ALIGN_CENTER )
		end
	
		blindlock_time_left = (PHX:GetCVar( "ph_hunter_blindlock_time" ) - (CurTime() - GetGlobalFloat("RoundStartTime", 0))) + 1
		
		if blindlock_time_left < 1 && blindlock_time_left > -6 then
			blindlock_time_left_msg = PHX:FTranslate("HUD_UNBLINDED")
		elseif blindlock_time_left > 0 then
			blindlock_time_left_msg = PHX:FTranslate("HUD_BLINDED", PHX:TranslateName(TEAM_HUNTERS), string.ToMinutesSeconds(blindlock_time_left))
		else
			blindlock_time_left_msg = nil
		end
		
		if blindlock_time_left_msg then
            
            if LocalPlayer():Team() == TEAM_HUNTERS and LocalPlayer():Alive() and blindlock_time_left > 1 then                
                local time = math.sin( CurTime() )
                
                surface.SetDrawColor( 0, 92, 132, 210 )
                draw.NoTexture()
                draw.Circle( cX,ScrH()*0.65, 50 + time * 30, time * 20 + 25 )
            
                draw.WordBox( 4, cX, cY, blindlock_time_left_msg, "PHX.TitleFont",
                WordBoxCol.bg, WordBoxCol.generic, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
            else
                draw.WordBox( 8, 20, 20, blindlock_time_left_msg, "HunterBlindLockFont",
                WordBoxCol.bg, WordBoxCol.hunter, TEXT_ALIGN_LEFT )
            end
		end
	end
	
	if (GetGlobalBool("InRound", false)) then
	
		-- Draw Lucky Balls Icon
		if PHX:GetCLCVar( "cl_enable_luckyballs_icon" ) && LocalPlayer():Team() == TEAM_HUNTERS then
			DrawWaypointMarker( LocalPlayer(), mat, pointer, 'ph_luckyball', 45 )
		end
		
		-- Draw Devil Ball Icon
		if PHX:GetCLCVar( "cl_enable_devilballs_icon" ) && LocalPlayer():Team() == TEAM_PROPS then
			DrawWaypointMarker( LocalPlayer(), dmat, dpointer, 'ph_devilball', 35 )
		end
		
		-- Draw Decoy Indicator Icon
		if PHX:GetCLCVar( "ph_cl_decoy_spawn_marker" ) && LocalPlayer():Team() == TEAM_PROPS then
			DrawWaypointMarker( LocalPlayer(), decoy.indicator, decoy.radial, 'ph_fake_prop', 50 )
		end
		
		-- Custom Crosshair
		if PHX:GetCLCVar( "ph_show_custom_crosshair" ) and LocalPlayer():Alive() and (LocalPlayer():Team() == TEAM_PROPS or LocalPlayer():Team() == TEAM_HUNTERS) then
			local color = color_white
			local XX,XY = ScrW()/2-32,ScrH()/2-32
			
			if LocalPlayer():Team() == TEAM_PROPS then
				local trace = {}
				trace = GAMEMODE.ViewCam:CommonCamCollEnabledView( LocalPlayer():EyePos(), LocalPlayer():EyeAngles(), cHullz )
				local filter = {}
			
				table.Add(filter, ents.FindByClass("ph_prop"))
				table.Add(filter, player.GetAll())

				trace.filter = filter
			
				local trace2 = util.TraceLine(trace)
				if trace2.Entity && trace2.Entity:IsValid() then
					if PHX:IsUsablePropEntity( trace2.Entity:GetClass() ) then
						color = getIndicColor( trace2, color_white, IndicatorColor.ok, IndicatorColor.no )
					end
				end
			elseif LocalPlayer():Team() == TEAM_HUNTERS then
				
				if PHX:GetCVar( "ph_enable_thirdperson" ) and tpOn then
					local tr = LocalPlayer():GetEyeTrace()
					local pos = tr.HitPos:ToScreen()
					
					XX = pos.x-32
					XY = pos.y-32
				end
				
			end
			
			if !blind then
				surface.SetDrawColor( color )
				surface.SetMaterial( crosshair )
				surface.DrawTexturedRect( XX, XY, 64, 64 )
			end
		end
		
		-- Draw a sprite
		if LocalPlayer():HasFakePropEntity() and LocalPlayer():Alive() then
			DrawLine(LocalPlayer(), MAT_LASERDOT, TEAM_PROPS, PHX.DecoyDistance, 24, 24, "ph_cl_decoy_spawn_helper" )
		end
	
	end
	
	-- The 'You were Killed By' text, or the Freeze Cam text.
	if LocalPlayer():GetNWBool("InFreezeCam", false) then
		local Attacker = LocalPlayer():GetNWEntity("PlayerKilledByPlayerEntity", nil)
		if IsValid(Attacker) and Attacker:IsPlayer() then
	
			local transtext = PHX:FTranslate("HUD_KILLEDBY", Attacker:Name())
		
			local w1, h1 = surface.GetTextSize( transtext );
			local textx = ScrW()/2
			local steamx = (ScrW()/2) - 32
			draw.SimpleTextOutlined(transtext , "TrebuchetBig", textx, ScrH()*0.75, FZTextColor.fore, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1.5, FZTextColor.outline)
			
		end
	end
end
hook.Add("HUDPaint", "PH_HUDPaint", HUDPaint)

function GM:HUDDrawTargetID()
	local tr = util.GetPlayerTrace(LocalPlayer())
	local trace = util.TraceLine(tr)
	
	-- Don't show if 'Player Names above their head' is enabled.
	if PHX:GetCVar( "ph_enable_plnames" ) && PHX:GetCLCVar( "ph_cl_pltext" ) then return end
	
	if (!trace.Hit) then return end
	if (!trace.HitNonWorld) then return end
	
	local text = "ERROR"
	local font = "TargetID"
	
	if (trace.Entity:IsPlayer() && trace.Entity:Team() == LocalPlayer():Team()) then
		text = trace.Entity:Nick()
	else
		return
	end
	
	surface.SetFont(font)
	local w, h = surface.GetTextSize(text)
	local MouseX, MouseY = gui.MousePos()
	
	if (MouseX == 0 && MouseY == 0) then
		MouseX = ScrW() / 2
		MouseY = ScrH() / 2
	end
	
	local x = MouseX
	local y = MouseY
	
	x = x - w / 2
	y = y + 30
	
	draw.SimpleText(text, font, x + 1, y + 1, Color(0, 0, 0, 120))
	draw.SimpleText(text, font, x + 2, y + 2, Color(0, 0, 0, 50))
	draw.SimpleText(text, font, x, y, self:GetTeamColor(trace.Entity))
	
	y = y + h + 5
	
	local text = trace.Entity:Health().."%"
	local font = "TargetIDSmall"
	
	surface.SetFont(font)
	local w, h = surface.GetTextSize(text)
	local x = MouseX - w / 2
	
	draw.SimpleText(text, font, x + 1, y + 1, Color(0, 0, 0, 120))
	draw.SimpleText(text, font, x + 2, y + 2, Color(0, 0, 0, 50))
	draw.SimpleText(text, font, x, y, self:GetTeamColor(trace.Entity))
end

-- After the player has been drawn
local function PH_PostPlayerDraw(pl)
	-- Draw a line on hunters
	if PHX:GetCLCVar( "ph_cl_spec_hunter_line" ) && (!LocalPlayer():Alive() || LocalPlayer():Team() == TEAM_SPECTATOR) and pl:Team() == TEAM_HUNTERS then
        local eyepos = pl:GetShootPos()
        local eyeAtt = pl:GetAttachment( pl:LookupAttachment( "eyes" ) )
        if (eyeAtt and eyeAtt ~= nil) and (eyeAtt.Pos and eyeAtt.Pos ~= nil) then
            eyepos = eyeAtt.Pos
        end
    
        local trace = {}
        trace.start = eyepos
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
local function drawPropSelectHalos()
	local halocol = IndicatorColor.ok
	
	if PHX:GetCLCVar( "ph_cl_halos" ) and GetGlobalBool("InRound", false) then
		-- Something to tell if the prop is selectable
		if LocalPlayer():Team() == TEAM_PROPS && LocalPlayer():Alive() then
		
			local trace = {}
			
            trace = GAMEMODE.ViewCam:CommonCamCollEnabledView( LocalPlayer():EyePos(), LocalPlayer():EyeAngles(), cHullz )
			
			local filter = {} -- We need to filter out players and the ph_prop.
            
			table.Add(filter, ents.FindByClass("ph_prop"))
            table.Add(filter, player.GetAll())
			
			trace.filter = filter
			
			local trace2 = util.TraceLine(trace) 
			if trace2.Entity && trace2.Entity:IsValid() && PHX:IsUsablePropEntity(trace2.Entity:GetClass()) then
				local ent_table = {}
				table.insert(ent_table, trace2.Entity)
                
                halocol = getIndicColor( trace2, color_white, IndicatorColor.ok, IndicatorColor.no ) --fallback is unused but just for failsafe.
                
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
			prop_light.pos = LocalPlayer():GetPos() + Vector(0,0,8)
			prop_light.r = 255
			prop_light.g = 255
			prop_light.b = 255
			prop_light.brightness = 2
			prop_light.decay = 1
			prop_light.size = 180
			prop_light.dietime = CurTime() + 0.1
		end
	end
end

-- ///////////////////\\\\\\\\\\\\\\\\\ --
-- 			Net Receives Hooks 			--
-- ///////////////////\\\\\\\\\\\\\\\\\ --

net.Receive("PHX.UpdatePropbanInfo", function()
	local key = net.ReadString()
	local size = net.ReadUInt(16)
	local comp = net.ReadData(size)
	
	local data = util.PHXQuickDecompress( comp )
	
	if !data or istable(data) and table.IsEmpty(data) then
		PHX:VerboseMsg( "[Model Ban] Warning: Retreiving an empty prop ban data! Reverting to default bans!", 2)
		return
	end
	-- Replace the data anyway.
	PHX[key]	= {}
	for _,mdl in pairs( data ) do
		table.insert(PHX[key], mdl)
	end
end)

function PHX:ShowTutorPopup()

	if (not IsValid(LocalPlayer())) then return end

	if self:GetCLCVar( "ph_show_tutor_control" ) && LocalPlayer():Alive() && (LocalPlayer():Team() == TEAM_PROPS or LocalPlayer():Team() == TEAM_HUNTERS) then
	
		if curshow <= 4 then
			
			-- Increment Height Hack
			local incH = 0
			
			local xNotify = vgui.Create( "DNotify" )
			xNotify:SetPos( ScrW() - 300 , 60 )
			xNotify:SetSize( 256, 56 )
			if LocalPlayer():Team() == TEAM_HUNTERS then
				xNotify:SetLife( math.Round( PHX:GetCVar( "ph_hunter_blindlock_time" ) * 0.75 ) )
			elseif LocalPlayer():Team() == TEAM_PROPS then
				xNotify:SetLife( math.Round( PHX:GetCVar( "ph_hunter_blindlock_time" ) * 0.5 ) )
			end
			
			local bg = xNotify:Add("DPanel")
			bg:Dock( FILL )
			bg:SetBackgroundColor( Color( 16, 16, 16, 200 ) )
			
			local gr = bg:Add("DGrid")
			gr:SetPos(4,4)
			gr:SetCols(1)
			gr:SetColWide(xNotify:GetWide()-8)
			gr:SetRowHeight(32)
			
			local function createItems( w,h,key,text,iH )
				local p = vgui.Create("DPanel")
				p:SetSize(w,h)
				p:SetPaintBackground(false)
				
				local pKey = p:Add("DPanel")
				pKey:Dock(LEFT)
				pKey:DockMargin(0,2,0,2)
				pKey:SetWidth(42)
				pKey:SetBackgroundColor(Color(64,64,64,220))
				
				local Key = pKey:Add("DLabel")
				Key:Dock(FILL)
				Key:SetContentAlignment(5)
				Key:SetText( key )
				Key:SetFont( "GModNotify" )
				
				local label = p:Add("DLabel")
				label:Dock(FILL)
				label:DockMargin(8,0,0,0)
				label:SetText( self:FTranslate( text ) )
				label:SetFont("PHX.TopBarFont")
				label:SetWrap(true)
				label:SetTextColor(color_white)
				
				return p
			end
			
			local grW,grH = gr:GetColWide(),gr:GetRowHeight()
			
			local Header = vgui.Create("DLabel")
			Header:SetSize(grW,grH)
			Header:SetContentAlignment(2)
			Header:SetText( PHX:FTranslate( "NOTIFY_HEADER_TITLE" ) )
			Header:SetFont( "RobotoInfo" )
			gr:AddItem(Header)
			incH=incH+32
			
			local TeamHeaderPanel = vgui.Create("DPanel")
			TeamHeaderPanel:SetSize( grW, grH-4 )
			TeamHeaderPanel:SetBackgroundColor( team.GetColor(LocalPlayer():Team()) )
			
			local TeamHeader = TeamHeaderPanel:Add("DLabel")
			TeamHeader:Dock(FILL)
			TeamHeader:SetContentAlignment(5)
			--TeamHeader:SetText( PHX:FTranslate("MISC_TEAM_NAME", team.GetName( LocalPlayer():Team() ):upper()) )
			TeamHeader:SetText( PHX:FTranslate("MISC_TEAM_NAME", self:TranslateName( LocalPlayer():Team() ):upper()) )
			TeamHeader:SetFont( "GModNotify" )
			TeamHeader:SetTextColor(color_white)
			
			gr:AddItem(TeamHeaderPanel)
			incH=incH+32
			
			for cv,text in pairs(DefaultKeysTut[LocalPlayer():Team()].ConVars) do
				local var = input.GetKeyName( GetConVar(cv):GetInt() ):upper()
				local item = createItems(grW,grH,var,text)
				incH=incH+32
				gr:AddItem( item )
			end
			for id,text in pairs(DefaultKeysTut[LocalPlayer():Team()].Default) do
				local var = id:upper()
				if (string.find(id, "^KEY_")) then -- if a string *starts* with "KEY_" will be translated. This especially for LMB and RMB keys.
					var = self:FTranslate(id):upper()
				end
				local item = createItems(grW,grH,var,text)
				
				incH=incH+32
				gr:AddItem( item )
			end
			--[[ Usage: 
				list.Set("PHX.ControlHintList",  KEY_F7, 			 { team = TEAM_PROPS or 2, type = "number",  text = "TRANSLATION_ID_HERE" }) --Number
				list.Set("PHX.ControlHintList", "ph_my_default_key", { team = TEAM_HUNTERS or 1, type = "convar",  text = "TRANSLATION_ID_HERE" }) --ConVar
				list.Set("PHX.ControlHintList", "KEYHINT_CUSTOM", 	 { team = TEAM_PROPS or 2, type = "default", text = "TRANSLATION_ID_HERE" }) --Default, KEYHINT_CUSTOM can be Translation ID
			]]
			for eId,eData in pairs(list.Get("PHX.ControlHintList")) do
				local var = "?"
				local text = "Unknown"
				local Team = 2
				if eData.type and eData.type ~= nil then
					if eData.type == "number" then
						var = input.GetKeyName(eId):upper()
					elseif eData.type == "convar" then
						var = input.GetKeyName( GetConVar(eId):GetInt() ):upper()
					elseif eData.type == "default" then
						if (string.find(id, "^KEY_")) then
							var = PHX:FTranslate(eId):upper()
						else
							var = eId:upper()
						end
					end
					if eData.team and eData.team ~= nil then Team = eData.team end
					if eData.text and eData.text ~= nil then text = eData.text end
				end
				
				if LocalPlayer():Team() == Team then
					local item = createItems(grW,grH,var,text)
					incH=incH+32
					gr:AddItem( item )
				end
				
			end
			
			xNotify:AddItem(bg)
			xNotify:SetTall(incH + 8)
			
			curshow = curshow + 1
			
		end
	end

end

hook.Add("PostCleanupMap", "PHX.ShowKeyHints", function()
	timer.Simple(1, function() PHX:ShowTutorPopup() end)
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
	local HullMins = net.ReadVector()
	local HullMaxs = net.ReadVector()	
	local new_health = net.ReadInt(9)
	cHullz = HullMaxs.z
	
	LocalPlayer():SetHull(HullMins, HullMaxs)
	LocalPlayer():SetHullDuck(HullMins, HullMaxs)
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

-- Make something with Thirdperson Window Control
local function adjustview( x, y, z )
    RunConsoleCommand( "ph_tpcam_dist", tostring(x))
    RunConsoleCommand( "ph_tpcam_right", tostring(y))
    RunConsoleCommand( "ph_tpcam_up", tostring(z))
end
function PHX:TPSAdjust( wMenu, tblOldVal )
    if !PHX:GetCVar( "ph_enable_thirdperson" ) then
		self:MsgBox( "PHX_TPS_ADJ_3PDIS", "PHX_TPS_ADJ_TITLE", "MISC_OK" )
		return
	end
	if PHX:GetCVar( "ph_sv_thirdperson_desired" ) then
		self:MsgBox( "PHX_TPS_ADJ_SVDESIRED", "PHX_TPS_ADJ_TITLE", "MISC_OK" )
		return
	end
    if blind then
		self:MsgBox( "PHX_TPS_ADJ_BLIND", "PHX_TPS_ADJ_TITLE", "MISC_OK" )
		return
	end
    if !LocalPlayer():Alive() or LocalPlayer():Team() != TEAM_HUNTERS then
        self:MsgBox( "PHX_TPS_ADJ_NEEDALIVE", "PHX_TPS_ADJ_TITLE", "MISC_OK" )
        return
    end

    local adj = {}
    adj.f = vgui.Create("DFrame")
    adj.f:SetSize(500,180)
    adj.f:SetTitle( PHX:FTranslate("PHX_TP_ADJUSTVIEW_BTN") )
    adj.f:SetPos( ScrW()/2 - adj.f:GetWide()/2, ScrH()*0.7 )
    
	-- this is fucking ugly.
    local lbls = { 
        [1] = { PHX:FTranslate("ANG_AXIS_DIST" ), GetConVar( "ph_tpcam_dist" ):GetMin(), GetConVar( "ph_tpcam_dist" ):GetMax(), GetConVar( "ph_tpcam_dist" ):GetHelpText(), GetConVar( "ph_tpcam_dist" ):GetInt(), "ph_tpcam_dist" },
        [2] = { PHX:FTranslate("ANG_AXIS_RIGHT"), GetConVar( "ph_tpcam_right" ):GetMin(), GetConVar( "ph_tpcam_right" ):GetMax(), GetConVar( "ph_tpcam_right" ):GetHelpText(), GetConVar( "ph_tpcam_right" ):GetInt(), "ph_tpcam_right" },
        [3] = { PHX:FTranslate("ANG_AXIS_UP"   ), GetConVar( "ph_tpcam_up" ):GetMin(), GetConVar( "ph_tpcam_up" ):GetMax(), GetConVar( "ph_tpcam_up" ):GetHelpText(), GetConVar( "ph_tpcam_up" ):GetInt(), "ph_tpcam_up" }
    }
	local olds = {
		[1] = tblOldVal.x,
		[2] = tblOldVal.y,
		[3] = tblOldVal.z
	}
    
	adj.s = {}
    for i=1,3 do
        adj.s[i] = adj.f:Add("DNumSlider")
        adj.s[i]:Dock(TOP)
        adj.s[i]:DockMargin(8,2,8,2)
        adj.s[i]:SetSize(0,24)
        adj.s[i]:SetText( lbls[i][1] )
		adj.s[i]:SetToolTip( lbls[i][4] )
		adj.s[i]:SetMin( lbls[i][2] )
		adj.s[i]:SetMax( lbls[i][3] )
		adj.s[i]:SetValue( lbls[i][5] )
		adj.s[i]:SetDecimals( 0 )
        adj.s[i].OnValueChanged = function(s, val)
            RunConsoleCommand( lbls[i][6], tostring(val) )
        end
    end
    
    adj.panelbtn = adj.f:Add("DPanel")
    adj.panelbtn:Dock(BOTTOM)
    adj.panelbtn:DockMargin(8,2,8,2)
    adj.panelbtn:SetSize(0,38)
    
    adj.btnx = adj.panelbtn:Add("DButton")
    adj.btnx:SetText( PHX:FTranslate("MISC_RESET") )
    adj.btnx:Dock(RIGHT)
    adj.btnx:DockMargin(4,4,4,4)
    adj.btnx:SizeToContentsX( 16 )
    adj.btnx.DoClick = function()
        adjustview( tblOldVal.x, tblOldVal.y, tblOldVal.z )
		for i=1,3 do
			adj.s[i]:SetValue( olds[i] )
		end
    end
    
    function adj.f:OnClose()
        tpOn = false
        if wMenu and wMenu ~= nil and wMenu:IsValid() and !wMenu:IsVisible() then
            wMenu:SetVisible(true)
        end
    end
    if wMenu and wMenu ~= nil and wMenu:IsValid() and wMenu:IsVisible() then
        wMenu:SetVisible(false)
    end
    tpOn = true
    adj.f:MakePopup()
end

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

--Very First Tutorial - this will only show ONCE.
local ShowIntro = CreateClientConVar("ph_cl_show_introduction","1",true,true,"Show PH:X introduction.")
local function ShowVeryFirstTutorial()
	local fh = {}
	local WFix=ScrW()*0.8
	local HFix=ScrH()*0.85
	if WFix <= 1090 then WFix = 1090 end
	if HFix <= 648 then HFix = 648 end

	fh.frame = vgui.Create("DFrame")
	fh.frame:SetSize( WFix, HFix )
	fh.frame:Center()
	fh.frame:SetTitle("Prop Hunt X2Z: Tutorial")
	
		fh.panel = vgui.Create("DPanel", fh.frame)
		fh.panel:SetBackgroundColor(Color(100,100,100,255))
		fh.panel:Dock(FILL)
		
		fh.helpImage = vgui.Create("DImage", fh.panel)
		fh.helpImage.Count = 1
		fh.helpImage:Dock(FILL)
		fh.helpImage:SetImage("vgui/phhelp1.vmt")
	
		fh.pBottom = vgui.Create("DPanel", fh.panel)
		fh.pBottom:Dock(BOTTOM)
		fh.pBottom:SetSize(0,56)
		fh.pBottom:SetPaintBackground(false)
		
		fh.center = vgui.Create("DPanel", fh.pBottom)
		fh.center:Dock(FILL)
		fh.center:SetSize(0,40)
		fh.center:SetPaintBackground(false)

		fh.btnSetting = vgui.Create("DLabel", fh.center)
		fh.btnSetting:Dock(FILL)
		fh.btnSetting:SetContentAlignment(5)
		fh.btnSetting:SetText("Hint: To Change Settings such as Languages, Models, Admin & Host settings,\nAccess by pressing [F1] and click [Prop Hunt Menu] button.")
		fh.btnSetting:SetFont( "PHX.TopBarFont" )
		fh.btnSetting:SetTextColor( Color(238,185,12) )

		fh.bOpenMenu = vgui.Create("DButton", fh.pBottom)
		fh.bOpenMenu:Dock(RIGHT)
		fh.bOpenMenu:SetSize(160,40)
		fh.bOpenMenu:SetText( "Settings Menu" )
		fh.bOpenMenu:SetFont( "RobotoInfo" )
		fh.bOpenMenu.DoClick = function() RunConsoleCommand("ph_x_menu", ""); fh.frame:Close() end
		
		fh.bnext = vgui.Create("DButton", fh.pBottom)
		fh.bnext:Dock(RIGHT)
		fh.bnext:SetSize(132,40)
		fh.bnext:SetText(PHX:FTranslate("MISC_NEXT"))
		fh.bnext:SetFont( "RobotoInfo" )
		fh.bnext.DoClick = function(pnl)
			fh.helpImage.Count = fh.helpImage.Count + 1
			if fh.helpImage.Count > 10 then
				fh.helpImage.Count = 1
			end
			fh.helpImage:SetImage("vgui/phhelp" .. fh.helpImage.Count .. ".vmt")
		end
		
		fh.bprev = vgui.Create("DButton", fh.pBottom)
		fh.bprev:Dock(LEFT)
		fh.bprev:SetSize(132,40)
		fh.bprev:SetText(PHX:FTranslate("MISC_PREV"))
		fh.bprev:SetFont( "RobotoInfo" )
		fh.bprev.DoClick = function(pnl)
			fh.helpImage.Count = fh.helpImage.Count - 1
			if fh.helpImage.Count < 1 then
				fh.helpImage.Count = 10
			end
			fh.helpImage:SetImage("vgui/phhelp" .. fh.helpImage.Count .. ".vmt")
		end
	
	fh.frame:MakePopup()

	RunConsoleCommand("ph_cl_show_introduction", "0")
end

net.Receive("phx_showVeryFirstTutorial", function()
	if ShowIntro:GetBool() then
		Derma_Query("Prop Hunt: X2Z Introduces many new features.\nWould you like to see the Tutorial window & access [Prop Hunt Menu] before playing?", "Prop Hunt X2Z",
		"Yes", function() ShowVeryFirstTutorial() end,
		"No", function() RunConsoleCommand("ph_cl_show_introduction", "0") end)
	end
end)


----
local ShowDonate = CreateClientConVar("ph_cl_show_donate","1",true,true)
hook.Add("InitPostEntity", "PHX.ShowDonateMessage", function()
	if ShowDonate:GetBool() then
		timer.Simple(2, function()
			Derma_Query(
				"Thank you for using Prop Hunt: X2Z! However Modifying & Updating this gamemode and making it to stay updated requires a lot of effort...\n\nIf you can help me to keep updated with PH:X, would you like to help me to Support by Donating?\nAny amount of donation is Highly appreciated though, Thanks!", "Have a moment?",
				"Yes", function()
					gui.OpenURL( GAMEMODE.DONATEURL )
				 end,
				"No", function() 
				end
			)
			RunConsoleCommand("ph_cl_show_donate", "0")
		end)
	end
end)
----