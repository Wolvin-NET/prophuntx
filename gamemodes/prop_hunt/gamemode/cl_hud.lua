-- // WARNING: The section below may NOT be optimised and very unclean. I'm currently working on this as a Temporary solution. \\ --

-- Hides HUD
local hide = {
	["CHudHealth"] 	= true,
	["CHudBattery"] = true,
	["CHudAmmo"]	= true,
	["CHudSecondaryAmmo"] = true
}
local curteam
local mat = {
	[1] = 	Material("vgui/phehud/hud_hunter"),
	[2] = 	Material("vgui/phehud/hud_prop"),
}
local indic = {
	rotate 	= { mat = Material("vgui/phehud/i_rotate"), [0]	= Color(190,190,190,255), [1] = Color(255,255,0,255) },
	halo 	= { mat = Material("vgui/phehud/i_halo"), 	[0]	= Color(190,190,190,255), [1] = Color(0,255,0,255) },
	light 	= { mat = Material("vgui/phehud/i_light"), 	[0]	= Color(190,190,190,255), [1] = Color(255,255,0,255) },
	armor	= { mat = Material("vgui/phehud/i_shield"),	[0] = Color(190,190,190,255), [1] = Color(80,190,255,255) }
}
local hindic = {
	clip	= Material("vgui/phehud/i_clip"),
	mag		= Material("vgui/phehud/i_mag1"),
	mag2	= Material("vgui/phehud/i_mag2")
}
local hudtopbar = {
	mat = Material("vgui/phehud/hud_topbar"),
	x	= 0,
	y	= 60
}
local matw = Material("vgui/phehud/res_wep")

PHX.HUD = {}
PHX.HUD.ava = nil

local pos = { x = 0, y = ScrH()-230 }
local posw = { x = ScrW() - 480, y = ScrH()-130 }
local hp
local armor
local hpcolor
local AmmoColor = Color( 225,180,15,255 )

local bar = {
	hp = { h = 15, col = Color(250,40,10,240) },
	am = { h = 5, col = Color(80,255,80,240) }
}

local Rstate = 0
net.Receive("PHX.rotateState", function() Rstate = net.ReadUInt(1) end)

local function PopulateAliveTeam(tm)
	local tim = team.GetPlayers(tm)
	local liveply = liveply or 0
	
	for _,pl in pairs(tim) do
		if IsValid(pl) && pl:Alive() then liveply = liveply + 1 end
	end
	
	return liveply
end

local state = false
local disabledcolor = Color(100,100,100,255)

local xAdd = pos.x + 165
local yAdd = pos.y + 142.5
local tbl = {}

-- todo: do a better math next time. Also hey, Paralellogram!
tbl.hp = {
	{ x = xAdd,			y = yAdd + 30 },	-- a
	{ x = xAdd + 15,	y = yAdd + 15 },	-- b
	{ x = xAdd,			y = yAdd + 15 },	-- c end
	{ x = xAdd,			y = yAdd + 30 }		-- d end
}

local yArmorAdd = yAdd + 22.5
tbl.Armor = {
	{ x = xAdd - 10,	y = yArmorAdd + 20 },
	{ x = xAdd - 5,		y = yArmorAdd + 15 },
	{ x = xAdd,			y = yArmorAdd + 15 },
	{ x = xAdd,			y = yArmorAdd + 20 }
}

local hpx	= 0
local armx	= 0

local GUICondition = false

local function TranslateMe(text, ...)
	return PHX:FTranslate(text, ...)
end

-- Hook sections
hook.Add("HUDShouldDraw", "PHX.ShouldHideHUD", function(hudname)
	-- make sure matw is already installed, otherwise don't use new HUD.
	if PHX:GetCLCVar( "ph_hud_use_new" ) and (not matw:IsError()) then
		if (hide[hudname]) then return false end
	end
end)

hook.Add("Think", "PHX.GUIAvatarUI_Think", function()
	state = PHX:GetCLCVar( "ph_hud_use_new" )

	-- Avatar will behave strangely enough on HUDPaint so We'll use Think for now. Because it's a PANEL, not an HUD element.
	if IsValid(LocalPlayer()) && LocalPlayer():Alive() && state && (LocalPlayer():Team() == TEAM_HUNTERS or LocalPlayer():Team() == TEAM_PROPS) then
		if not IsValid(PHX.HUD.ava) then
			PHX.HUD.ava = vgui.Create("AvatarMask")
			PHX.HUD.ava:SetPos(35, pos.y+85)
			PHX.HUD.ava:SetSize(100,100)
			PHX.HUD.ava:SetPlayer(LocalPlayer(),128)
			PHX.HUD.ava:SetVisible(true)
		end
	
		GUICondition = gui.IsGameUIVisible()
		
		if PHX.HUD.ava and IsValid(PHX.HUD.ava) then
			PHX.HUD.ava:SetVisible( not GUICondition )
		end
	
	end
	
	if IsValid(LocalPlayer()) and (!LocalPlayer():Alive() or !state or (LocalPlayer():Team() == TEAM_SPECTATOR or LocalPlayer():Team() == TEAM_UNASSIGNED)) then
		if IsValid(PHX.HUD.ava) then
			PHX.HUD.ava:SetVisible(false)
			PHX.HUD.ava:Remove()
		end
	end
	
end)

hook.Add("HUDPaint", "PHX.MainHUD", function()
	
	if IsValid(LocalPlayer()) && LocalPlayer():Alive() && state && (LocalPlayer():Team() == TEAM_HUNTERS or LocalPlayer():Team() == TEAM_PROPS) then
		-- Get Player Info
		curteam		= LocalPlayer():Team()
		hp			= LocalPlayer():Health()
		armor		= LocalPlayer():Armor()
		
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.SetMaterial( mat[curteam] )
		surface.DrawTexturedRect( pos.x, pos.y, 440, 220 )
		
		if hp > 100 then hpx = 100 elseif hp < 1 then hpx = 0 else hpx = hp end
		if armor > 100 then armx = 100 elseif armor < 1 then armx = 0 else armx = armor end
		
		if hp < 30 then
			hpcolor = Color( 255, 1 * (hp*8), 1 * (hp*8), 255 )
		else
			hpcolor = Color( 255, 255, 255, 255 )
		end
		
		-- HP and Armor Bar
		local percent = xAdd + hpx * 2
		local armorpct = xAdd + armx * 2
		
		surface.SetDrawColor( 255, 0, 0, 245 )
		draw.NoTexture()
		tbl.hp[3].x = percent + 15
		tbl.hp[4].x = percent
		surface.DrawPoly( tbl.hp )
		
		-- these are only background
		local bgA = tbl.Armor
		
		surface.SetDrawColor( 0,100,0, 150 )
		draw.NoTexture()
		bgA[3].x = (xAdd + 200) - 5
		bgA[4].x = (xAdd + 200) - 10
		surface.DrawPoly( bgA )
		-- end of backgrounds
		
		surface.SetDrawColor( 80,255,80, 255 )
		draw.NoTexture()
		tbl.Armor[3].x = armorpct - 5
		tbl.Armor[4].x = armorpct - 10
		surface.DrawPoly( tbl.Armor )
		
		if hp > 999 then hp = "bruh" end
		if armor > 255 then armor = "wtf" end
		draw.DrawText( TranslateMe("HUD_HP"), "Trebuchet24", pos.x + 215, pos.y + 110, color_white, TEXT_ALIGN_LEFT )
		draw.DrawText( hp, "PHX.HealthFont", pos.x + 370, pos.y + 86, hpcolor, TEXT_ALIGN_RIGHT )
		draw.DrawText( " / "..armor, "PHX.ArmorFont", pos.x + 370, pos.y + 104, Color( 255,255,255,255 ), TEXT_ALIGN_LEFT )
		
		-- Indicators
		if LocalPlayer():Team() == TEAM_HUNTERS then
			surface.SetDrawColor( disabledcolor )
		else
			surface.SetDrawColor( indic.rotate[Rstate] )
		end
		surface.SetMaterial( indic.rotate.mat )
		surface.DrawTexturedRect( pos.x + (172), pos.y + 82, 32, 32 )
		
		if LocalPlayer():Team() == TEAM_HUNTERS then
			if LocalPlayer():FlashlightIsOn() then
				surface.SetDrawColor( indic.light[1] )
			else
				surface.SetDrawColor( indic.light[0] )
			end
		else
			surface.SetDrawColor( indic.light[CL_GLOBAL_LIGHT_STATE] )
		end
		surface.SetMaterial( indic.light.mat )
		surface.DrawTexturedRect( pos.x + (140), pos.y + 28, 32, 32 )
		
		if LocalPlayer():Team() == TEAM_HUNTERS then
			surface.SetDrawColor(disabledcolor)
		else
			surface.SetDrawColor( indic.halo[tonumber( GetConVar("ph_cl_halos"):GetInt() )])
		end
		surface.SetMaterial( indic.halo.mat )
		surface.DrawTexturedRect( pos.x + (82), pos.y + 7, 32, 32 )
		
		if LocalPlayer():Armor() < 10 then
			surface.SetDrawColor( indic.armor[0] )
		else
			surface.SetDrawColor( indic.armor[1] )
		end
		surface.SetMaterial( indic.armor.mat )
		surface.DrawTexturedRect (pos.x + (22), pos.y + 18, 32, 32 )
	end
	
	-- Weapon HUD
	if IsValid(LocalPlayer()) && LocalPlayer():Alive() && state && LocalPlayer():Team() == TEAM_HUNTERS then		
		local curWep = LocalPlayer():GetActiveWeapon()
		
		local clip
		local maxclip
		local mag
		local mag2
		local name
		local percent
		local LiteralString
		local LiteralStringSec
		
		if IsValid(curWep) then
            surface.SetDrawColor( 255, 255, 255, 255 )
            surface.SetMaterial( matw )
            surface.DrawTexturedRect( posw.x, posw.y, 480, 120 )
        
			clip 	= curWep:Clip1()
			maxclip = curWep:GetMaxClip1()
			mag 	= LocalPlayer():GetAmmoCount(curWep:GetPrimaryAmmoType())
			mag2	= LocalPlayer():GetAmmoCount(curWep:GetSecondaryAmmoType())
			name	= language.GetPhrase(curWep:GetPrintName())
			
			if mag > 999 then mag = 999 end
			
			LiteralString = tostring(clip)
			LiteralStringSec = tostring(mag)
		
			if clip <= -1 then
				if mag > 0 then
					LiteralString = tostring(mag)
					LiteralStringSec = "-"
				else
					LiteralString = "0"
					LiteralStringSec = "-"
				end
				clip = 0
			end
			
			if mag2 > 99 then -- we'll reduce it as it sound looks ridiculous
				mag2 = 99
			end
			
			if maxclip < 0 then maxclip = 0 end
			
			if (clip < 0 || maxclip < 0) then
				percent = 0
			else
				--percent = math.Round(clip / maxclip * 260)
				percent = clip / maxclip
			end
			
			surface.SetDrawColor(150,90,0,180)
			surface.DrawRect(posw.x + 22, posw.y + 58, 260, 4)
			
			surface.SetDrawColor( AmmoColor )
			surface.DrawRect(posw.x + 22, posw.y + 58, percent * 260, 4)
		
			surface.SetDrawColor( AmmoColor )
			draw.NoTexture()
			draw.Circle( ScrW()-58, posw.y + 60, percent * 45, 24 )
			
			-- PHX.AmmoFont -- deprecated
			draw.DrawText( TranslateMe("HUD_MAGSEC"), "PHX.AmmoFont", posw.x + 70, posw.y + 5, color_white, TEXT_ALIGN_LEFT )
			draw.DrawText( LiteralStringSec, "PHX.TopBarFont", posw.x + 94, posw.y + 28, color_white, TEXT_ALIGN_LEFT )
			draw.DrawText( mag2, "PHX.ArmorFont", posw.x + 175, posw.y + 22, color_white, TEXT_ALIGN_LEFT )
			draw.DrawText( LiteralString, "PHX.HealthFont", ScrW()-195, posw.y + 2, Color( 255,255,180,255 ), TEXT_ALIGN_RIGHT )
			draw.DrawText( name, "PHX.TopBarFont", ScrW() - 170, posw.y + 83, color_white, TEXT_ALIGN_RIGHT )
			
			-- Icons
			surface.SetDrawColor( 255, 255, 255, 240 )
			surface.SetMaterial( hindic.clip )
			surface.DrawTexturedRect( ScrW() - 90, posw.y + 28, 64, 64 )
			
			surface.SetDrawColor( 255, 255, 255, 240 )
			surface.SetMaterial( hindic.mag )
			surface.DrawTexturedRect( posw.x + 56, posw.y + 22, 32, 32 )
			
			surface.SetDrawColor( 255, 255, 255, 240 )
			surface.SetMaterial( hindic.mag2 )
			surface.DrawTexturedRect( posw.x + 132, posw.y + 14, 42, 42 )
			
		end
	end
	
	-- the Team Bar. This requires at least 4 players to get this displayed.
	if PHX:GetCLCVar( "ph_show_team_topbar" ) then
		if ((player.GetCount() >= 4 && LocalPlayer():Alive()) && (LocalPlayer():Team() != TEAM_UNASSIGNED && LocalPlayer():Team() != TEAM_SPECTATOR)) then
			surface.SetDrawColor( 255, 255, 255, 255 )
			surface.SetMaterial( hudtopbar.mat )
			surface.DrawTexturedRect( hudtopbar.x, hudtopbar.y, 400, 50 )
			
			-- Draw Props
			draw.DrawText( TranslateMe("TEAM_PROPS"), "PHX.TopBarFont", 4, hudtopbar.y + 2, Color(255,255,255,255), TEXT_ALIGN_LEFT )
			draw.DrawText( tostring(PopulateAliveTeam(TEAM_PROPS)), "PHX.TopBarFontTeam", 120, hudtopbar.y - 7, Color(255,255,255,255), TEXT_ALIGN_LEFT )
			
			-- Draw Hunters
			draw.DrawText( TranslateMe("TEAM_HUNTERS"), "PHX.TopBarFont", 350, hudtopbar.y + 22, Color(255,255,255,255), TEXT_ALIGN_RIGHT )
			draw.DrawText( tostring(PopulateAliveTeam(TEAM_HUNTERS)), "PHX.TopBarFontTeam", 210, hudtopbar.y - 7, Color(255,255,255,255), TEXT_ALIGN_LEFT )
		end
	end
end)