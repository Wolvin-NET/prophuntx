-- Validity check to prevent some sort of spam
local function IsDelayed(ply)
	local lastTauntTime = ply:GetNWFloat("LastTauntTime")
	local delayedTauntTime = lastTauntTime + PHX:GetCVar( "ph_customtaunts_delay" )
	local currentTime = CurTime()
	
	return { delayedTauntTime > currentTime, delayedTauntTime - currentTime }
end

net.Receive("CL2SV_PlayThisTaunt", function(len, ply)
	local snd = net.ReadString()
	if (ply and IsValid(ply)) then
	
		local delay 		= IsDelayed(ply)
		local isDelay 		= delay[1]
		local TauntTime 	= delay[2]
		local playerTeam	= ply:Team()
	
		if !isDelay then
			if file.Exists("sound/"..snd, "GAME") and table.HasValue( PHX.CachedTaunts[playerTeam], snd ) then --Added Extra Checks
				ply:EmitSound(snd, 100)
				ply:SetNWFloat("LastTauntTime", CurTime())
			else
				ply:PHXChatInfo( "WARNING", "TM_DELAYTAUNT_NOT_EXIST" )
			end
		else
			ply:PHXChatInfo( "NOTICE", "TM_DELAYTAUNT_PLSWAIT", tostring(math.Round(TauntTime)) )
		end
		
	end
end)
