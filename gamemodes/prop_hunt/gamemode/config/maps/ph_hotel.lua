local map = game.GetMap()
local hookname="PHX.MapConfig_"..map
local mdls = {
	-- Mins Z Should never below 0!
	["models/props_debris/wood_board03a.mdl"] = {mins=Vector(-1.3, -4, 0), maxs=Vector(1.3, 4, 96)},
	["models/props_debris/wood_board05a.mdl"] = {mins=Vector(-1.3, -8, 0), maxs=Vector(1.3, 8, 96)},
}

local only={
	["prop_physics"] = true
}

local function FixTallModelHulls()

	if (not GetConVar("ph_sv_enable_obb_modifier"):GetBool()) then
	  for i=1,3 do
		print("Warning: ConVar 'ph_sv_enable_obb_modifier' is not enabled by default! This wont fix the collission issue for taller props in this map!")
	  end
	end

	for model,data in pairs(mdls) do
	
		if !PHX.OBB_DATA[model] then PHX.OBB_DATA[model] = data; end
	
		for _,ent in ipairs( ents.FindByModel( model ) ) do
		
			if IsValid(ent) and only[ent:GetClass()] then	
				
				PHX:OBB_ModifyPropOBB( ent, data.mins, data.maxs )
				
			end
		
		end
		
	end
end

hook.Add("PostCleanupMap", hookname, FixTallModelHulls)