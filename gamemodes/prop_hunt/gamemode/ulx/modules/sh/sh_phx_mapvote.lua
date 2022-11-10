local CATEGORY_NAME = "PH:X MapVote"
------------------------------ VoteMap ------------------------------
function PHX_MapVote( calling_ply, votetime, should_cancel )

	if PHX and PHX ~= nil and (IS_PHX) then
	  if not should_cancel then
		if PHX:GetCVar( "ph_use_custom_mapvote_cmd" ) then
			ulx.fancyLogAdmin( calling_ply, "(Command) #A called a Vote Map!" )
			local c = PHX:GetCVar( "ph_custom_mv_concmd" )
			game.ConsoleCommand( c .. "\n" )
			return
		end

		if PHX:GetCVar( "ph_use_custom_mapvote" ) then
			ulx.fancyLogAdmin( calling_ply, "(Addon) #A called a Vote Map!" )
			local f = PHX:GetCVar( "ph_custom_mv_func" )
			RunString(f, "MapVote_CVAR")
			return
		end
	  end
	end
	-- Return to MapVote.

	if MapVote and MapVote ~= nil then
		if not should_cancel then
			MapVote.PHXStart(votetime, nil, nil, nil)
			ulx.fancyLogAdmin( calling_ply, "#A called a votemap!" )
		else
			MapVote.PHXCancel()
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
	mapvotecmd:help( "Invokes the map vote logic." )
	mapvotecmd:setOpposite( "ulx unmap_vote", {_, _, true}, "!unmap_vote" )
end