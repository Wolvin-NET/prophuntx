surface.CreateFont( "HunterBlindLockFont", {
	font	= "Arial",
	size	= 14,
	weight	= 1200,
	antialias = true,
	underline = false
})

surface.CreateFont("TrebuchetBig", {
	font = "Impact",
	size = 40
})

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
include("sh_config.lua")
CL_GLOBAL_LIGHT_STATE	= 0
include("cl_chat.lua")
include("cl_hud_mask.lua")
include("cl_hud.lua")
include("cl_menutypes.lua")
include("cl_menu.lua")
include("cl_tauntwindow.lua")
include("cl_targetid.lua")
include("cl_autotaunt.lua")

include("cl_credits.lua")

PHX.CLCVAR = PHX.CLCVAR or {}

PHX.CLCVAR.PropHalos		= CreateClientConVar("ph_cl_halos", "1", true, true, "Toggle Enable/Disable Halo effects when choosing a prop.")
PHX.CLCVAR.PlayerText		= CreateClientConVar("ph_cl_pltext", "1", true, false, "Options for Text above players. 0 = Disable. 1 = Enable.")
PHX.CLCVAR.EndCue			= CreateClientConVar("ph_cl_endround_sound", "1", true, false, "Play a sound when round ends? 0 to disable.")
PHX.CLCVAR.AutoCloseTaunt	= CreateClientConVar("ph_cl_autoclose_taunt", "1", true, false, "Auto close the taunt window (When Double Clicking on them)?")
PHX.CLCVAR.HunterEyeLine	= CreateClientConVar("ph_cl_spec_hunter_line", "1", true, false, "Draw a line on hunters so we can see their aim in spectator mode.")
PHX.CLCVAR.IconLuckyBall	= CreateClientConVar("cl_enable_luckyballs_icon", "1", true,false, "Enable 'Lucky ball' icon to be displayed once they spawned")
PHX.CLCVAR.IconDevilCrystal	= CreateClientConVar("cl_enable_devilballs_icon", "1", true,false, "Enable 'Devil ball' icon to be displayed once they spawned")
PHX.CLCVAR.NewHUD			= CreateClientConVar("ph_hud_use_new", "1", true, false, "Use new PHX HUD")
PHX.CLCVAR.TeamTopBar		= CreateClientConVar("ph_show_team_topbar", "1", true, false, "Show total alive team players bar on the top left (Experimental)")
PHX.CLCVAR.CustomCrosshair	= CreateClientConVar("ph_show_custom_crosshair","1",true,false,"Show custom crosshair for props")
PHX.CLCVAR.ControlTutorial	= CreateClientConVar("ph_show_tutor_control","1",true,false,"Show 'Prop Gameplay Control' hud on each prop spawns. This only show twice and reset until map changes/user disconnect.")

-- Called immediately after starting the gamemode 
function Initialize()
	cHullz 	= 64
	client_prop_light = false
	blind = false
	
	cHullz_Min = 24	-- desired hull.z to modify.
	cHullz_Max = 84	-- desired hull.z to modify.
	
	CL_GLIMPCAM 	= 0
	MAT_LASERDOT 	= Material("sprites/glow04_noz")
	
	LocalPlayer():SetNWFloat("localLastTauntTime", 0)
end
hook.Add("Initialize", "PH_Initialize", Initialize)

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
		if PHX.CVAR.CameraCollision:GetBool() then
			local trace = {}

			local filterent = ents.FindByClass("ph_prop")
			table.insert(filterent, pl)
			
			if cHullz < cHullz_Min then
				trace.start = origin + Vector(0, 0, cHullz + (cHullz_Min-cHullz))
				trace.endpos = origin + Vector(0, 0, cHullz + (cHullz_Min-cHullz)) + (angles:Forward() * -80)
			elseif cHullz > cHullz_Max then
				trace.start = origin + Vector(0, 0, cHullz - cHullz_Max)
				trace.endpos = origin + Vector(0, 0, cHullz - cHullz_Max) + (angles:Forward() * -80)
			else
				trace.start = origin + Vector(0, 0, 8)
				trace.endpos = origin + Vector(0, 0, 8) + (angles:Forward() * -80)
			end
			
			trace.filter = filterent
			
			local tr = util.TraceLine(trace)
			view.origin = tr.HitPos
		else
			if cHullz < cHullz_Min then
				view.origin = origin + Vector(0, 0, cHullz + (cHullz_Min-cHullz)) + (angles:Forward() * -80)
			elseif cHullz > cHullz_Max then
				view.origin = origin + Vector(0, 0, cHullz - cHullz_Max) + (angles:Forward() * -80)
			else
				view.origin = origin + Vector(0, 0, 8) + (angles:Forward() * -80)
			end
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

local mat 		= "prophunt_enhanced/sprites/luckyball"
local pointer 	= "prophunt_enhanced/sprites/luckyball_pointer"

local dmat		= "prophunt_enhanced/sprites/devilball"
local dpointer	= "prophunt_enhanced/sprites/devilball_pointer"
local crosshair = Material("vgui/hud_crosshair")
-- Draw round timeleft and hunter release timeleft
function HUDPaint()
	-- Draw player texts
	if PHX.CVAR.SeePlayerNames:GetBool() && PHX.CLCVAR.PlayerText:GetBool() && LocalPlayer():Team() != TEAM_SPECTATOR then
		for _, pl in pairs(player.GetAll()) do
			if pl != LocalPlayer() && (pl && pl:IsValid() && pl:Alive() && pl:Team() == LocalPlayer():Team()) then
				local addvector = Vector(0, 0, math.Clamp(pl:EyePos():Distance(LocalPlayer():EyePos())*0.04, 16, 64))
				-- todo: text will disappear in a specified distance.
				draw.DrawText(pl:Name().." ("..pl:Health().."%)", "TargetIDSmall", (pl:EyePos() + addvector):ToScreen().x, (pl:EyePos() + addvector):ToScreen().y, team.GetColor(pl:Team()), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
		end
	end
	
	-- Hunter Blindlock Time
	if GetGlobalBool("InRound", false) then
		local blindlock_time_left = (PHX.CVAR.BlindTime:GetInt() - (CurTime() - GetGlobalFloat("RoundStartTime", 0))) + 1
		
		if blindlock_time_left < 1 && blindlock_time_left > -6 then
			blindlock_time_left_msg = "Ready or not, here we come!"
		elseif blindlock_time_left > 0 then
			blindlock_time_left_msg = "Hunters will be unblinded and released in "..string.ToMinutesSeconds(blindlock_time_left)
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
	if PHX.CLCVAR.IconLuckyBall:GetBool() && LocalPlayer():Team() == TEAM_HUNTERS then
		local offset = Vector( 0, 0, 45 )
		local ang = LocalPlayer():EyeAngles()
		
		local w = ScrW()
		local h = ScrH()
		local cX = w/2
		local cY = h/2
		
		for _,ent in pairs(ents.FindByClass('ph_luckyball')) do
			local pos = ent:GetPos() + offset
			local poscr = pos:ToScreen()
			
			if LocalPlayer():IsLineOfSightClear(ent) then
			
				if ((poscr.x > 32 && poscr.x < (w-43)) && (poscr.y > 32 && poscr.y < (h-38))) then
					surface.SetDrawColor(255,255,255,255)
					surface.SetTexture(surface.GetTextureID(mat))
					surface.DrawTexturedRect( poscr.x-32, poscr.y, 64, 64 )
				else
					local r = math.Round(cX/2)
					local rad = math.atan2(poscr.y-cY, poscr.x-cX)
					local deg = 0 - math.Round(math.deg(rad))
					surface.SetDrawColor(255,255,255,255)
					surface.SetTexture(surface.GetTextureID(pointer))
					surface.DrawTexturedRectRotated(math.cos(rad)*r+cX, math.sin(rad)*r+cY,64,64,deg+90)
				end
				
			end
		end
		
	end
	
	-- Draw Devil Ball Icon
	if PHX.CLCVAR.IconDevilCrystal:GetBool() && LocalPlayer():Team() == TEAM_PROPS then
		local offset = Vector( 0, 0, 35 )
		local ang = LocalPlayer():EyeAngles()
		
		local w = ScrW()
		local h = ScrH()
		local cX = w/2
		local cY = h/2
		
		for _,ent in pairs(ents.FindByClass('ph_devilball')) do
			local pos = ent:GetPos() + offset
			local poscr = pos:ToScreen()
			
			if LocalPlayer():IsLineOfSightClear(ent) then
			
				if ((poscr.x > 32 && poscr.x < (w-43)) && (poscr.y > 32 && poscr.y < (h-38))) then
					surface.SetDrawColor(255,255,255,255)
					surface.SetTexture(surface.GetTextureID(dmat))
					surface.DrawTexturedRect( poscr.x-32, poscr.y, 64, 64 )
				else
					local r = math.Round(cX/2)
					local rad = math.atan2(poscr.y-cY, poscr.x-cX)
					local deg = 0 - math.Round(math.deg(rad))
					surface.SetDrawColor(255,255,255,255)
					surface.SetTexture(surface.GetTextureID(dpointer))
					surface.DrawTexturedRectRotated(math.cos(rad)*r+cX, math.sin(rad)*r+cY,64,64,deg+90)
				end
				
			end
		end
		
	end
	
	-- Prop Crosshair
	if PHX.CLCVAR.CustomCrosshair:GetBool() && LocalPlayer():Team() == TEAM_PROPS && LocalPlayer():Alive() then
		local color
		local trace = {}
		if cHullz < 24 then
			trace.start = LocalPlayer():EyePos() + Vector(0, 0, cHullz + (24-cHullz))
			trace.endpos = LocalPlayer():EyePos() + Vector(0, 0, cHullz + (24-cHullz)) + LocalPlayer():EyeAngles():Forward() * 100
		elseif cHullz > 84 then
			trace.start = LocalPlayer():EyePos() + Vector(0, 0, cHullz - 84)
			trace.endpos = LocalPlayer():EyePos() + Vector(0, 0, cHullz - 84) + LocalPlayer():EyeAngles():Forward() * 300
		else
			trace.start = LocalPlayer():EyePos() + Vector(0, 0, 8)
			trace.endpos = LocalPlayer():EyePos() + Vector(0, 0, 8) + LocalPlayer():EyeAngles():Forward() * 100
		end
		trace.filter = ents.FindByClass("ph_prop")
		
		local trace2 = util.TraceLine(trace)
		if trace2.Entity && trace2.Entity:IsValid() && table.HasValue(PHX.USABLE_PROP_ENTITIES, trace2.Entity:GetClass()) then
			color = Color(10,255,10,255)
		else
			color = Color(255,255,255,255)
		end
		surface.SetDrawColor( color )
		surface.SetMaterial( crosshair )
		surface.DrawTexturedRect( ScrW() / 2 - ( 64 / 2 ), ScrH() / 2 - ( 64 / 2 ), 64, 64 )
	end
	
	-- The 'You were Killed By' text, or the Freeze Cam text.
	if LocalPlayer():GetNWBool("InFreezeCam", false) then
		local w1, h1 = surface.GetTextSize("You were killed by "..LocalPlayer():GetNWEntity("PlayerKilledByPlayerEntity", nil):Name() );
		local textx = ScrW()/2
		local steamx = (ScrW()/2) - 32
		draw.SimpleTextOutlined("You were killed by "..LocalPlayer():GetNWEntity("PlayerKilledByPlayerEntity", nil):Name(), "TrebuchetBig", textx, ScrH()*0.75, Color(255, 10, 10, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1.5, Color(0, 0, 0, 255))
	end
end
hook.Add("HUDPaint", "PH_HUDPaint", HUDPaint)


-- After the player has been drawn
function PH_PostPlayerDraw(pl)
	-- Draw a line on hunters
	if PHX.CLCVAR.HunterEyeLine:GetBool() && (!LocalPlayer():Alive() || LocalPlayer():Team() == TEAM_SPECTATOR) then
		if IsValid(pl) && pl:Alive() && pl:Team() == TEAM_HUNTERS then
			render.DrawLine(pl:GetShootPos(), pl:GetEyeTrace().HitPos, team.GetColor(pl:Team()), true)
			render.SetMaterial(MAT_LASERDOT)
			render.DrawSprite(pl:GetEyeTrace().HitPos, 8, 8, team.GetColor(pl:Team()))
		end
	end
end
hook.Add("PostPlayerDraw", "PH_PostPlayerDraw", PH_PostPlayerDraw)

hook.Add("PrePlayerDraw", "PHX.HidePlayer", function(ply)
	if ply:Team() == TEAM_PROPS then return true end
end)

-- Draws halos on team members
function drawPropSelectHalos()

	if PHX.CLCVAR.PropHalos:GetBool() then
		-- Something to tell if the prop is selectable
		if LocalPlayer():Team() == TEAM_PROPS && LocalPlayer():Alive() then
			local trace = {}
			-- fix for smaller prop size. They should stay horizontal rather than looking straight down.
			if cHullz < 24 then
				trace.start = LocalPlayer():EyePos() + Vector(0, 0, cHullz + (24-cHullz))
				trace.endpos = LocalPlayer():EyePos() + Vector(0, 0, cHullz + (24-cHullz)) + LocalPlayer():EyeAngles():Forward() * 100
			elseif cHullz > 84 then
				trace.start = LocalPlayer():EyePos() + Vector(0, 0, cHullz - 84)
				trace.endpos = LocalPlayer():EyePos() + Vector(0, 0, cHullz - 84) + LocalPlayer():EyeAngles():Forward() * 300
			else
				trace.start = LocalPlayer():EyePos() + Vector(0, 0, 8)
				trace.endpos = LocalPlayer():EyePos() + Vector(0, 0, 8) + LocalPlayer():EyeAngles():Forward() * 100
			end
			trace.filter = ents.FindByClass("ph_prop")
			
			local trace2 = util.TraceLine(trace) 
			if trace2.Entity && trace2.Entity:IsValid() && table.HasValue(PHX.USABLE_PROP_ENTITIES, trace2.Entity:GetClass()) then
				local ent_table = {}
				table.insert(ent_table, trace2.Entity)
				halo.Add(ent_table, Color(20, 250, 0), 1.2, 1.2, 1, true, true)
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

local tutormat = "vgui/hud_control_help.png"
local curshow = 0
net.Receive("PH_ShowTutor", function()
	if PHX.CLCVAR.ControlTutorial:GetBool() && LocalPlayer():Alive() then
	
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

-- Receive the Winning Notification
net.Receive("PH_RoundDraw_Snd", function(len)
	if PHX.CLCVAR.EndCue:GetBool() then
		surface.PlaySound(table.Random(PHX.WINNINGSOUNDS["Draw"]))
	end
end)
net.Receive("PH_TeamWinning_Snd", function(len)
	local snd = net.ReadString()
	if PHX.CLCVAR.EndCue:GetBool() then
		surface.PlaySound(snd)
	end
end)

-- Resets the player hull
net.Receive("ResetHull", function()
	if LocalPlayer() && LocalPlayer():IsValid() then
		LocalPlayer():ResetHull()
		cHullz = 64
	end
end)

-- Plays the Freeze Cam sound
-- PHX.FreezeCamSounds is moved to sh_config.lua!

net.Receive("PlayFreezeCamSound", function()
	if PHX.CVAR.FreezeCamUseSingle:GetBool() then
		surface.PlaySound( PHX.LegalSoundPath )
	else
		surface.PlaySound( table.Random(PHX.FreezeCamSounds) )
	end
end)

-- Sets the player hull
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
