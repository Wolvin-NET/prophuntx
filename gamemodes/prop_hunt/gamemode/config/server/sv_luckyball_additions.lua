-- This is a template of Lucky Balls Additions which will adds a new events for luck balls entity.
-- Note: Key name (the "UniqueName") must be different and cannot be similar with other name's addition. This is purposely used for PHX.VerboseMsg and preventing
-- Duplicated addition and table reading errors.

-- To add something, Remove "--[[" and "]]" to make them available again.

--[[
list.Set("LuckyBallsAddition", "UniqueName", function(pl)
	
	-- give something to the player. for example: Stunstick

	pl:ChatPrint("Hello! Here is your free Stunstick! :D")
	pl:Give("weapon_stunstick")
	
end)
]]