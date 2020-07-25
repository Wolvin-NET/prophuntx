-- This is a template of Lucky Balls Additions which will adds a new events for luck balls entity.
-- Note: Key name (the "UniqueName") must be different and cannot be similar with other name's addition. This is purposely used for PHX.VerboseMsg and preventing
-- Duplicated addition and table reading errors.

list.Set("LuckyBallsAddition", "Give_Stunstick", function(pl)
	
	-- give something to the player. for example: Stunstick

	pl:ChatPrint("[Lucky Ball] Hello! Here is your free Stunstick! :p")
	pl:Give("weapon_stunstick")
	
end)