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
			if bool then
				if PHX:GetCVar( "ph_randtaunt_map_prop_enable" ) then
					local Count = ply:GetTauntRandMapPropCount()
                    
                    if ply:Team() ~= TEAM_PROPS then
                        ply:PHXChatInfo( "ERROR", "PHX_CTAUNT_RAND_PROPS_NOT_PROP" )
                        return
                    end
					
					if Count > 0 or PHX:GetCVar( "ph_randtaunt_map_prop_max" ) == -1 then
						
						if CheckValidity( snd, playerTeam ) then
							local props = ents.FindByClass("prop_physics")
                            local fakeprops = ents.FindByClass("ph_fake_prop")
                            if #fakeprops > 0 then
                                table.Add( props, fakeprops ) -- add ph_fake_prop as well.
                            end
                            
							local randomprop = props[math.random(1, #props)]
							
							if tobool( plApplyOnFake ) then
                                if tobool( randFakePitch ) then
                                    pitch = math.random(PHX:GetCVar("ph_taunt_pitch_range_min"), PHX:GetCVar("ph_taunt_pitch_range_max"))
                                else
                                    pitch = desiredPitch
                                end
							end
							
							randomprop:EmitSound(snd, 100, pitch)
                            ply:SubTauntRandMapPropCount()
							SetLastTauntDelay( ply )
						else
							ply:PHXChatInfo( "WARNING", "TM_DELAYTAUNT_NOT_EXIST" )
						end
						
					else
						ply:PHXChatInfo( "WARNING", "PHX_CTAUNT_RAND_PROPS_LIMIT" )
					end
				end
			else
				if CheckValidity( snd, playerTeam ) then
				
					if tobool( plPitchOn ) then
                        if tobool( plPitchRandomized ) then
                            pitch = math.random(PHX:GetCVar("ph_taunt_pitch_range_min"), PHX:GetCVar("ph_taunt_pitch_range_max"))
                        else
                            pitch = desiredPitch
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
