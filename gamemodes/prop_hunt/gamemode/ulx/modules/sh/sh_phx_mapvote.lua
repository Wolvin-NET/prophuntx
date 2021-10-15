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
			if game.IsDedicated() then -- if mapvote not installed, give a warning in server console:
				print("[ULX MapVote] WARNING: You need at least 2 more players to get this MapVote votes work!")
			else
				print("[ULX MapVote] WARNING: MapVote is Unavailable. You might have to change map manually!")
			end
		end
	end
end

if (!ulx or ulx == nil) then
	print("[PHX MapVote] WARNING: ULX is not installed! Not going to add map_vote ...")
else
	local mapvotecmd = ulx.command( CATEGORY_NAME, "ulx map_vote", PHX_MapVote, "!map_vote" )
	mapvotecmd:addParam{ type=ULib.cmds.NumArg, min=15, default=25, hint="time", ULib.cmds.optional, ULib.cmds.round }
	mapvotecmd:addParam{ type=ULib.cmds.BoolArg, invisible=true }
	mapvotecmd:defaultAccess( ULib.ACCESS_ADMIN )
	mapvotecmd:help( "Invokes the map vote logic" )
	mapvotecmd:setOpposite( "ulx unmap_vote", {_, _, true}, "!unmap_vote" )
end