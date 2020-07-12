-- Validity check to prevent some sort of spam
local function IsDelayed(ply)
	local lastTauntTime = ply:GetNWFloat("LastTauntTime")
	local delayedTauntTime = lastTauntTime + PHX.CVAR.CustomTauntDelay:GetInt()
	local currentTime = CurTime()
	
	return { delayedTauntTime > currentTime, delayedTauntTime - currentTime }
end

net.Receive("CL2SV_PlayThisTaunt", function(len, ply)
	local snd = net.ReadString()
	if (ply and IsValid(ply)) then
	
		local delay = IsDelayed(ply)
		local isDelay 	= delay[1]
		local TauntTime = delay[2]
	
		if !isDelay then
			if file.Exists("sound/"..snd, "GAME") then
				ply:EmitSound(snd, 100)
				ply:SetNWFloat("LastTauntTime", CurTime())
			else
				ply:ChatPrint("[PHX] - Warning: That taunt you selected does not exists on server!")
			end
		else
			ply:ChatPrint("[PHX] - Please wait in ".. tostring(math.Round(TauntTime)) .." second(s)!")
		end
		
	end
end)
