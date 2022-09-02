-- ph_motel_blacke_v3 Configuration.
PHX.VerboseMsg("[PHX Map Config] Config for 'ph_motel_blacke_v3' has been loaded.")

local function ph_motel_blacke_v3_config()

	-- Add More Spawn
	local PlayerSpawns = ents.FindByClass('info_player_start')
	
	for _,v in ipairs(PlayerSpawns) do
	
		-- Move the Z up a bit.
		local pos = v:GetPos()
		v:SetPos( Vector(pos.x, pos.y, pos.z+6) )
		
		-- Add New Spawn Above them
		local spawn = ents.Create( 'info_player_start' )
		spawn:SetPos( pos + Vector( 0, 0, 78 ) )
		spawn:SetAngles( angle_zero )
		
		spawn:Spawn()
	
	end

end

hook.Add("PreCleanupMap", "PHX.ph_motel_blacke_v3.config_pre", ph_motel_blacke_v3_config)
hook.Add("PostCleanupMap", "PHX.ph_motel_blacke_v3.config", ph_motel_blacke_v3_config)