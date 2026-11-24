-- This is a template of Devil Balls Additions which will adds a new events for Devil balls entity.
-- Note: Key name (the "UniqueName") must be different and cannot be similar with other name's addition. This is purposely used for PHX:VerboseMsg and preventing
-- Duplicated addition and table reading errors.

-- To add something, Remove "--[[" and "]]" to make them available again.

--[[
list.Set("DevilBallsAddition", "UniqueName", function(pl)
	
	-- give something to the player or modify something to pl.ph_prop. for example:
	pl:ChatPrint("Hello! Let me change the prop color and revert in 5 seconds!")
	
	if IsValid(pl.ph_prop) then
		pl.ph_prop:SetMaterials("models/shiny")
		pl.ph_prop:SetColor(255,0,0)
		
		pl.RevertColor = timer.Simple(5, function()
			pl.ph_prop:SetMaterials("")
			pl.ph_prop:SetColor(255,255,255)
		end)
	end
end)
]]