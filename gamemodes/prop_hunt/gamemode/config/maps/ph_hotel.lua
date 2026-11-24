-- ph_hotel Configuration.
-- if you found this exploitable by Players, Adjust the Prop's bounding box to your appropriate setting.
PHX:VerboseMsg("[Map Config] Config for 'ph_hotel' has been loaded.")

local mdls = {
	"models/props_debris/wood_board05a.mdl",
	"models/props_debris/wood_board03a.mdl"
}

local function FixTallModelHulls()

	if (not GetConVar("ph_sv_enable_obb_modifier"):GetBool()) then
	  for i=1,3 do
		print("Warning: ConVar 'ph_sv_enable_obb_modifier' is not enabled by default! This wont fix the collission issue for taller props in this map!")
	  end
	end

	for i=1,#mdls do
	
		for _,ent in pairs(ents.FindByModel(mdls[i])) do
		
			if IsValid( ent ) and string.find(ent:GetClass(), "prop_physics") then
				
				local bounds = {
					min 	= Vector(-1.3, -4.3, 0),
					max 	= Vector(1.3, 4.3, 96),
					--[[ dmin 	= Vector(-1.3, -4.3, 0),
					dmax 	= Vector(1.3, 4.3, 32) ]]
				}
	
				ent:SetNWBool("hasCustomHull", true)
				ent.m_Hull 	= { bounds.min, bounds.max }
				-- ent.m_dHull = { bounds.dmin, bounds.dmax }
			
			end
		
		end
		
	end
end

hook.Add("PostCleanupMap", "PHX.ph_hotel.config", FixTallModelHulls)