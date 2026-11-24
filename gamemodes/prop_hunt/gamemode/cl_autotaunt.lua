-- For the love of furry heck, THIS PLACE NEEDS A CLEANING!
-- Props will autotaunt at specified intervals
local isEnabled = false
local isProp = false
local delay = PHX:GetCVar( "ph_autotaunt_delay" )
local started = false
local timerID = "ph_autotaunt_timer"
local teamCheckTimer = "ph_autotaunt_teamchecktimer"

local xStart
local xEnd
local y
local w = 140
local h = 30
local previousTime
local tweenTime = 0

local state

local function TimeLeft()
	local ply = LocalPlayer()
	local lastTauntTime = ply:GetLastTauntTime( "LastTauntTime" ) --ply:GetNWFloat("LastTauntTime")
	local nextTauntTime = lastTauntTime + delay
	local currentTime = CurTime()
	return nextTauntTime - currentTime
end

local function TimeleftRTaunt()
	local ply = LocalPlayer()
	local lastTauntTime = ply:GetLastTauntTime( "LastTauntTime" ) --ply:GetNWFloat("LastTauntTime")
	local nextRandomTime = lastTauntTime + PHX:GetCVar( "ph_normal_taunt_delay" )
	local curTime = CurTime()
	return nextRandomTime - curTime
end

local function TimeleftCTaunt()
	local ply = LocalPlayer()
	local lastTauntTime = ply:GetLastTauntTime( "CLastTauntTime" ) --ply:GetNWFloat("CTaunt.LastTauntTime", 0)
	local nextCustomTime = lastTauntTime + PHX:GetCVar( "ph_customtaunts_delay" )
	local curTime = CurTime()
	return nextCustomTime - curTime
end

local function FakeTauntRemainings()
    local ply = LocalPlayer()
    return LocalPlayer():GetTauntRandMapPropCount()
end

-- a: amplitude
-- p: period
local function outElastic(t, b, c, d, a, p)
	local pi = math.pi
	if t == 0 then return b end

	t = t / d

	if t == 1 then return b + c end

	if not p then p = d * 0.3 end

	local s

	if not a or a < math.abs(c) then
		a = c
		s = p / 4
	else
		s = p / (2 * pi) * math.asin(c / a)
	end

	return a * math.pow(2, - 10 * t) * math.sin((t * d - s) * (2 * pi) / p) + c + b
end

local xElastic = 0
local function AutoTauntPaint()
	if !isEnabled || !isProp || !started then return; end

	if tweenTime < 1 then
		xElastic = outElastic(tweenTime, xStart, xEnd - xStart, 1, 1, 0.5)
		local cTime = CurTime()
		tweenTime = tweenTime + (cTime - previousTime)
		previousTime = cTime
	end

	local timeLeft = math.ceil(TimeLeft())
	local percentage = timeLeft / delay

	local txt = PHX:FTranslate("HUD_AUTOTAUNT_ALT", timeLeft)

	draw.RoundedBox(5, xElastic, y, w, h, Color(0, 0, 0, 200))
	draw.RoundedBox(5, xElastic + 5, y + 5, (w - 10) * percentage, h - 10, Color(200, 0, 0, 200))
	draw.DrawText(txt, "HunterBlindLockFont", xElastic + 70, ScrH() - 57, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
end

local matw          = Material("vgui/phehud/res_wep")
local matFkTaunt    = Material("vgui/phehud/ftaunt_count")
local matDecoyHUD   = Material("vgui/phehud/decoy_hud")
local posw = { x = ScrW() - 480, y = ScrH()-130 }

local indic = {
	auto = Material("vgui/phehud/ataunt_timer"),
	cust = Material("vgui/phehud/ctaunt_timer"),
	rand = Material("vgui/phehud/taunt_timer"),
	cek  = Material("vgui/phehud/hud_check")
}

local function CreateTauntIndicators( material, color, tx, ty, w, h )
	if LocalPlayer():Team() == TEAM_PROPS then
		surface.SetDrawColor( color )
		surface.SetMaterial( material )
		surface.DrawTexturedRect(tx, ty, w, h)
	end
end

local delayR = PHX:GetCVar( "ph_normal_taunt_delay" )
local delayC = PHX:GetCVar( "ph_customtaunts_delay" )

-- /!\ NOTICE: This is prototype, will improved or changed sometime in future.
local colText = color_white -- decoy
local function AutoTauntPaint_phx()

	if IsValid(LocalPlayer()) && LocalPlayer():Alive() && LocalPlayer():Team()==TEAM_PROPS && started then
		local timeLeft = math.ceil(TimeLeft())
		local percentage = timeLeft / delay
		local taunttext = ""
		
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.SetMaterial( matw )
		surface.DrawTexturedRect( posw.x, posw.y, 480, 120 )
		
		if PHX:GetCVar( "ph_autotaunt_enabled" ) then
			taunttext = PHX:FTranslate("HUD_AUTOTAUNT", timeLeft)
			
			if timeLeft < 0 then
				taunttext 	= PHX:FTranslate("HUD_AUTOTAUNT_WAITFORUPDATE")
				timeLeft 	= 0	-- wait for synchronize
				percentage 	= 0 -- fix draw.Circle overdrawn
			end
			
			surface.SetDrawColor( Color(200,40,40) )
			draw.NoTexture()
			draw.Circle( ScrW()-58, posw.y + 60, percentage * 45, 24 )
		else
			taunttext = PHX:FTranslate("HUD_AUTOTAUNT_DISABLED")
		end
		
		draw.DrawText( taunttext, "PHX.TopBarFont", ScrW() - 164, posw.y + 83, color_white, TEXT_ALIGN_RIGHT )
		
		CreateTauntIndicators(indic.auto, Color(225,225,225,64), ScrW()-88, posw.y + 28, 64, 64)
		
		local r = math.Round(TimeleftRTaunt())
		local c = math.Round(TimeleftCTaunt())
        local ftRm = FakeTauntRemainings()
		
		local colR      = Color(255,255,255,50)
		local colC      = Color(255,255,255,50)
		local colCR     = Color(200,200,200,30)
		local colCC     = Color(200,200,200,30)
        local colftRm   = Color(20,230,230,255)
		
		local literalR = r
		local literalC = c
		
		if r < 0 then 
			literalR = ""
			colR = Color(20,255,20,220)
			colCR = colR
		end
		if c < 0 then
			literalC = ""
			colC = Color(20,230,230,220)
			colCC = colC
		end
        -- Fake Taunt text & color
        local fakeTauntRem = PHX:FTranslate("HUD_FAKETAUNT_COUNT", ftRm)
        if ftRm <= 0 then
            colftRm = Color(128,128,128,200)
        end
        if GetConVar("ph_randtaunt_map_prop_max"):GetInt() == -1 then
            colftRm = Color(220,220,10,200)
            fakeTauntRem = PHX:FTranslate("HUD_FAKETAUNT_UNLI")
        end
        
        -- Decoy Prop color setting
        local decoyKey = "..."
        if LocalPlayer():HasFakePropEntity() then
            colText = Color(240, 200, 30, 255)
            decoyKey = PHX:FTranslate("HUD_DECOY_ACTIVE", input.GetKeyName( GetConVar("ph_cl_decoy_spawn_key"):GetInt() ))
        else
            colText = Color(200, 200, 200, 128)
            decoyKey = PHX:FTranslate( "MISC_NA" )
        end
		
		draw.DrawText(PHX:FTranslate("HUD_PROP_TAUNT_TIME"), "PHX.AmmoFont", posw.x + 96, posw.y + 50, color_white, TEXT_ALIGN_CENTER)
		draw.DrawText(PHX:FTranslate("HUD_PROP_CTAUNT_TIME"), "PHX.AmmoFont", posw.x + 212, posw.y + 50, color_white, TEXT_ALIGN_CENTER)
		
		draw.DrawText(literalR, "PHX.TopBarFont", posw.x + 96 + 50, posw.y + 18, color_white, TEXT_ALIGN_CENTER)
		draw.DrawText(literalC, "PHX.TopBarFont", posw.x + 212 + 50, posw.y + 19, color_white, TEXT_ALIGN_CENTER)
        
        -- Fake taunt & Decoy texts
        draw.DrawText(decoyKey,     "PHX.TopBarFont", posw.x+96+30, posw.y-30, colText, TEXT_ALIGN_LEFT)
        draw.DrawText(fakeTauntRem, "PHX.TopBarFont", posw.x+212+30, posw.y-30,  colftRm, TEXT_ALIGN_LEFT)
		
		CreateTauntIndicators(indic.rand, colR, posw.x + 72, posw.y + 2, 50, 50)
		CreateTauntIndicators(indic.cust, colC, posw.x + 190, posw.y + 2, 50, 50)
        
        -- Fake taunt & Decoy Indicator
        CreateTauntIndicators(matDecoyHUD, colText, posw.x+72, posw.y-55, 64, 64)
        CreateTauntIndicators(matFkTaunt,  colftRm, posw.x+190, posw.y-55, 64, 64)
        
		
		-- check list
		if not indic.cek:IsError() then
			CreateTauntIndicators(indic.cek, colCR, posw.x + 132, posw.y + 14, 32, 32)
			CreateTauntIndicators(indic.cek, colCC, posw.x + 244, posw.y + 14, 32, 32)
		end
		
	end

end
hook.Add("HUDPaint", "PH_AutoTauntPaint", function()
	state = PHX:GetCLCVar( "ph_hud_use_new" )
	if state and (not matw:IsError()) then
		AutoTauntPaint_phx()
	else
		AutoTauntPaint()
	end
end)

local function RemoveTimer()
	if timer.Exists(timerID) then
		timer.Destroy(timerID)
	end
end

local function CheckAutoTaunt()
	local timeLeft = TimeLeft()
	local ply = LocalPlayer()

	-- Stop everything under these conditions
	if !ply:Alive() || ply:Team() != TEAM_PROPS then
		started = false
		RemoveTimer()
		PHX:VerboseMsg("[AutoTaunt] Blocked!")
		return
	end
end

local function Setup()
	local ply = LocalPlayer()

	isEnabled = PHX:GetCVar( "ph_autotaunt_enabled" )
	isProp = ply:Team() == TEAM_PROPS
	started = true
	previousTime = CurTime()
	tweenTime = 0

	if isEnabled && isProp then
		delay = PHX:GetCVar( "ph_autotaunt_delay" )
		timer.Create(timerID, 1, 0, CheckAutoTaunt)
	end
end

local function CheckPlayer()
	local ply = LocalPlayer()

	if ply:Alive() && ply:Team() == TEAM_PROPS then
		if timer.Exists(teamCheckTimer) then
			timer.Destroy(teamCheckTimer)
		end

		Setup()
		return true
	end

	return false
end

local function AutoTauntSpawn()
	xStart = ScrW() + 200
	xEnd = ScrW() - 195
	y = ScrH() - 65

	if !CheckPlayer() then
		timer.Create(teamCheckTimer, 0.1, 10, CheckPlayer)
	end
end
net.Receive("AutoTauntSpawn", function() AutoTauntSpawn() end)

local function AutoTauntRoundEnd()
	started = false
	RemoveTimer()
end
net.Receive("AutoTauntRoundEnd", function() AutoTauntRoundEnd() end)
