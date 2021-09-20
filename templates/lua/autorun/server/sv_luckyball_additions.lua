-- This is a template of Lucky Balls Additions which will adds a new events for luck balls entity.
-- Note: Key name (the "UniqueName") must be different and cannot be similar with other name's addition. This is purposely used for PHX.VerboseMsg and preventing
-- Duplicated addition and table reading errors.

list.Set("LuckyBallsAddition", "Give_Stunstick", function(pl)
	
	local stick = "weapon_stunstick"
	-- give something to the player. for example: Stunstick
	if !pl:HasWeapon(stick) then
		pl:ChatPrint("[Lucky Ball] Here your free Stunstick!")
		pl:Give(stick)
	else
		pl:ChatPrint("[Lucky Ball] You already have stunstick, let me switch to it!")
		pl:SelectWeapon(stick)
	end
	
end)