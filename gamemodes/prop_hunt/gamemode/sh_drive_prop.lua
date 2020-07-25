hook.Add("Move", "moveProp", function(ply,move)
	if SERVER then
		if ply:Alive() && ply:Team() == TEAM_PROPS then
			-- Local variables
			local ent = ply.ph_prop
			-- Set position and angles
			if IsValid(ent) && IsValid(ply) && ply:Alive() then
				-- Set position
				if (ent:GetModel() == "models/player/kleiner.mdl" || ent:GetModel() == player_manager.TranslatePlayerModel(ply:GetInfo("cl_playermodel"))) then
					ent:SetPos(move:GetOrigin())
				else
					ent:SetPos(move:GetOrigin() - Vector(0, 0, ent:OBBMins().z))
				end
				-- Set angles
				if !ply:GetPlayerLockedRot() then
					local ang = move:GetAngles()
					ent:SetAngles(Angle(0,ang.y,0))
				end
			end
			
		end
		
	end
end)