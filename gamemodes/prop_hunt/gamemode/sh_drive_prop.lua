local dummy

--[=[ hook.Add("Move", "moveProp", function(ply,move)
	if SERVER then
		if ply:Alive() && ply:Team() == TEAM_PROPS then
			-- Local variables
			local ent = ply.ph_prop
			-- Set position and angles
			if IsValid(ent) && IsValid(ply) && ply:Alive() then
				-- Set position
				if (ent:GetModel() == "models/player/kleiner.mdl" || ent:GetModel() == player_manager.TranslatePlayerModel(ply:GetInfo("cl_playermodel"))) then
					ent:SetPropPos(move:GetOrigin())
				else
					ent:SetPropPos(move:GetOrigin() - Vector(0, 0, ent:OBBMins().z))
				end
				-- Set angles
				--if !ply:GetPlayerLockedRot() then
                    
                    local ang = ply:LocalEyeAngles()
					if PHX:GetCVar( "ph_exp_rot_pitch" ) then
						ent:SetRotationAngle(Angle(ang.x,ang.y,0))
					else
						ent:SetRotationAngle(Angle(0,ang.y,0))
					end
					
				--end
			end
			
		end
		
	end
end) ]=]