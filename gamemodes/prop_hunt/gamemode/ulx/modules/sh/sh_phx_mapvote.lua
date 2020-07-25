local CATEGORY_NAME = "PHX MapVote"
------------------------------ VoteMap ------------------------------
function PHX_MapVote( calling_ply, votetime, should_cancel )
	if MapVote ~= nil then
		if not should_cancel then
			MapVote.Start(votetime, nil, nil, nil)
			ulx.fancyLogAdmin( calling_ply, "#A called a votemap!" )
		else
			MapVote.Cancel()
			ulx.fancyLogAdmin( calling_ply, "#A canceled the votemap!" )
		end
	else
		if SERVER then
			if game.IsDedicated() then
				print("[ULX MapVote] WARNING: You need at least few players to get this work!")
			else
				print("[ULX MapVote] WARNING: MapVote is Unavailable.")
			end
		end
	end
end

if !ulx then
	print("MapVote Warning: ULX is not installed!")
else
	local mapvotecmd = ulx.command( CATEGORY_NAME, "map_vote", PHX_MapVote, "!map_vote" )
	mapvotecmd:addParam{ type=ULib.cmds.NumArg, min=15, default=25, hint="time", ULib.cmds.optional, ULib.cmds.round }
	mapvotecmd:addParam{ type=ULib.cmds.BoolArg, invisible=true }
	mapvotecmd:defaultAccess( ULib.ACCESS_ADMIN )
	mapvotecmd:help( "Invokes the map vote logic" )
	mapvotecmd:setOpposite( "unmap_vote", {_, _, true}, "!unmap_vote" )
end