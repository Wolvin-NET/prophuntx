-- This is a template of Devil Balls Additions which will adds a new events for Devil balls entity.
-- Note: Key name (the "UniqueName") must be different and cannot be similar with other name's addition. This is purposely used for PHX.VerboseMsg and preventing
-- Duplicated addition and table reading errors.

list.Set("DevilBallsAddition", "ChangePropColour", function(pl)
	
	-- give something to the player or modify something to pl.ph_prop. for example:
	pl:ChatPrint("[Devil Crystal] Hello! Let me change the prop color and revert in 5 seconds!")	
	pl.ph_prop:SetMaterial("models/shiny")
	pl.ph_prop:SetColor(255,0,0)
	
	pl.RevertColor = timer.Simple(8, function()
		if IsValid(pl.ph_prop) then
			pl.ph_prop:SetMaterial("")
			pl.ph_prop:SetColor(255,255,255)
		end
	end)
end)