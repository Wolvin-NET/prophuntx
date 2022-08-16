/*  ------------------
	Auto Taunt Section 
	------------------  */

-- Props will autotaunt at specified intervals (put this crap on the server because the old way was all on the client and that's silly)
local function TauntTimeLeft(ply)
	-- Always return 1 when the conditions are not met
	if !IsValid(ply) || !ply:Alive() || ply:Team() != TEAM_PROPS then return 1; end
	
	local lastTauntTime = ply:GetNWFloat("LastTauntTime")
	local nextTauntTime = lastTauntTime + PHX:GetCVar( "ph_autotaunt_delay" )
	local currentTime = CurTime()
	return nextTauntTime - currentTime
end

local function AutoTauntThink()

	if PHX:GetCVar( "ph_autotaunt_enabled" ) then
		
		for _, ply in ipairs(team.GetPlayers(TEAM_PROPS)) do
			local timeLeft = TauntTimeLeft(ply)
			
			if IsValid(ply) && ply:Alive() && ply:Team() == TEAM_PROPS && timeLeft <= 0 then
				local pitch = 100
				local isPitchEnabled 	= PHX:GetCVar( "ph_taunt_pitch_enable" )
				local pitchRandEnabled 	= ply:GetInfoNum( "ph_cl_pitch_apply_random", 0 )
				local isRandomized 		= ply:GetInfoNum( "ph_cl_pitch_randomized_random", 0 )
				local pitchlevel 		= ply:GetInfoNum( "ph_cl_pitch_level", 100 )
				local rand_taunt 		= table.Random(PHX.CachedTaunts[TEAM_PROPS])
				
				if !isstring(rand_taunt) then rand_taunt = tostring(rand_taunt); end
				
				if isPitchEnabled and tobool(pitchRandEnabled) then
					if tobool(isRandomized) then
						pitch = math.random( PHX:GetCVar("ph_taunt_pitch_range_min"), PHX:GetCVar("ph_taunt_pitch_range_max") )
                    else
                        pitch = math.Clamp( pitchlevel, PHX:GetCVar("ph_taunt_pitch_range_min"), PHX:GetCVar("ph_taunt_pitch_range_max") )
					end
				end
				
				ply:EmitSound(rand_taunt, 100, pitch)
				ply:SetNWFloat("LastTauntTime", CurTime())
			end
		end
		
	end
end
timer.Create("PHX.AutoTauntThinkTimer", 1, 0, AutoTauntThink)

/*  --------------------
	Custom Taunt Section 
	--------------------   */

-- Validity check to prevent some sort of spam
local function IsDelayed(ply)
	local delay = ply.lastCTauntTime + PHX:GetCVar( "ph_customtaunts_delay" )
	return { delay > CurTime(), delay - CurTime() }
end

local function CheckValidity( sndFile, plyTeam )
	return file.Exists("sound/"..sndFile, "GAME") and table.HasValue( PHX.CachedTaunts[plyTeam], sndFile )
end

local function SetLastTauntDelay( ply )
	ply.lastCTauntTime = CurTime()
	ply:SetNWFloat("CTaunt.LastTauntTime", CurTime())
	
	-- This affects random & auto taunt as well
	ply.last_taunt_time = CurTime()
	ply:SetNWFloat("LastTauntTime", CurTime())
end

net.Receive("CL2SV_PlayThisTaunt", function(len, ply)
	local snd 		= net.ReadString()
	local bool 		= net.ReadBool()	-- enable fake taunt
	
	local isPitchEnabled = PHX:GetCVar( "ph_taunt_pitch_enable" )
	
	if (ply and IsValid(ply)) then
	
		local delay 		= IsDelayed(ply)
		local isDelay 		= delay[1]
		local TauntTime 	= delay[2]
		local playerTeam	= ply:Team()
        local plPitchOn     = ply:GetInfoNum( "ph_cl_pitch_taunt_enable", 0 )
		local plApplyOnFake = ply:GetInfoNum( "ph_cl_pitch_apply_fake_prop", 0 )
        local plPitchRandomized = ply:GetInfoNum( "ph_cl_pitch_randomized", 0 )
        local randFakePitch = ply:GetInfoNum( "ph_cl_pitch_fake_prop_random", 0 )
		local desiredPitch	= ply:GetInfoNum( "ph_cl_pitch_level", 100 )
		local pitch			= 100
	
		if !isDelay then
			if bool then --if it's Fake Taunt
				if PHX:GetCVar( "ph_randtaunt_map_prop_enable" ) then
					local Count = ply:GetTauntRandMapPropCount()
                    
                    if ply:Team() ~= TEAM_PROPS then
                        ply:PHXChatInfo( "ERROR", "PHX_CTAUNT_RAND_PROPS_NOT_PROP" )
                        return
                    end
					
					if Count > 0 or PHX:GetCVar( "ph_randtaunt_map_prop_max" ) == -1 then
						
						if CheckValidity( snd, playerTeam ) then							
							if isPitchEnabled and tobool( plApplyOnFake ) then
                                if tobool( randFakePitch ) then
                                    pitch = math.random(PHX:GetCVar( "ph_taunt_pitch_range_min" ), PHX:GetCVar( "ph_taunt_pitch_range_max" ))
                                else
                                    pitch = math.Clamp(desiredPitch, PHX:GetCVar( "ph_taunt_pitch_range_min" ), PHX:GetCVar( "ph_taunt_pitch_range_max" ))
                                end
							end
							
							local props = ents.FindByClass("prop_physics")
                            table.Add( props, ents.FindByClass("ph_fake_prop") ) -- add ph_fake_prop as well.
							local randomprop = table.Random( props ) -- because of table.Add, it become non-sequential.
							
							if IsValid(randomprop) then
								randomprop:EmitSound(snd, 100, pitch)
								ply:SubTauntRandMapPropCount()
								SetLastTauntDelay( ply )
							end
						else
							ply:PHXChatInfo( "WARNING", "TM_DELAYTAUNT_NOT_EXIST" )
						end
						
					else
						ply:PHXChatInfo( "WARNING", "PHX_CTAUNT_RAND_PROPS_LIMIT" )
					end
				end
			else	-- if it's Player Taunt
				if CheckValidity( snd, playerTeam ) then
				
					if isPitchEnabled and tobool( plPitchOn ) then
                        if tobool( plPitchRandomized ) then
                            pitch = math.random(PHX:GetCVar( "ph_taunt_pitch_range_min" ), PHX:GetCVar( "ph_taunt_pitch_range_max" ))
                        else
                            pitch = math.Clamp(desiredPitch, PHX:GetCVar( "ph_taunt_pitch_range_min" ), PHX:GetCVar( "ph_taunt_pitch_range_max" ))
                        end
					end
				
					ply:EmitSound(snd, 100, pitch)
					SetLastTauntDelay( ply )
				else
					ply:PHXChatInfo( "WARNING", "TM_DELAYTAUNT_NOT_EXIST" )
				end
			end
		end
		
	end
end)
