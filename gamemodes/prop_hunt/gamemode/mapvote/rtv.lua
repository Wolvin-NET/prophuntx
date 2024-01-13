local RTV = {}
local MapVote = PHX.MV

RTV.ChatCommands = {
	"!rtv",
	"/rtv",
	"rtv"
}

RTV.TotalVotes = 0

RTV.Wait = 60 -- The wait time in seconds. This is how long a player has to wait before voting when the map changes. 

RTV._ActualWait = CurTime() + RTV.Wait

RTV.PlayerCount = MapVote.PHXConfig.RTVPlayerCount or 3

function RTV.ChatPrint( mType, ply, bBroadcast, msg, ... )
	
	if !mType or mType == nil then mType = "PRIMARY" end
	if bBroadcast == nil then bBroadcast = false end
	
	if !bBroadcast then
		if ply and ply ~= nil and IsValid(ply) then
			ply:PHXChatInfo( mType, msg, ... )
		end
	else
		-- bBroadcast == true
		for _,v in pairs(player.GetAll()) do
			v:PHXChatInfo( mType, msg, ... )
		end
	end
	
end

function RTV.ShouldChange()
	return RTV.TotalVotes >= math.Round(player.GetCount()*0.66)
end

function RTV.RemoveVote()
	RTV.TotalVotes = math.Clamp( RTV.TotalVotes - 1, 0, math.huge )
end

function RTV.Start()
	RTV.ChatPrint( "NOTICE", nil, true, "PHXM_MV_VOTEROCKED_IMMINENT" )
	timer.Simple(4, function()
		PHX.StartMapVote()
	end)
end


function RTV.AddVote( ply )

	if RTV.CanVote( ply ) then
		RTV.TotalVotes = RTV.TotalVotes + 1
		ply.RTVoted = true
		MsgN( ply:Nick().." has voted to Rock the Vote." )
		
		RTV.ChatPrint( "NOTICE", nil, true, "PHXM_MV_VOTEROCKED_PLY_TOTAL", ply:Nick(), RTV.TotalVotes, math.Round(player.GetCount()*0.66) )
		
		if RTV.ShouldChange() then
			RTV.Start()
		end
	end

end

hook.Add( "PlayerDisconnected", "Remove RTV", function( ply )

	if ply.RTVoted then
		RTV.RemoveVote()
	end

	timer.Simple( 0.1, function()
		if (player.GetCount() < 1 && !MapVote.PHXConfig.ChangeMapNoPlayer) then 
			print("MapVote: There is no player to force change map...")
		else
			if RTV.ShouldChange() then
				local time = MapVote.PHXConfig.TimeLimit or 28
				print("MapVote: Server emptied, attempting to force change map and voting random map in "..time.." seconds!")
				RTV.Start()
			end
		end
	end )

end )

function RTV.CanVote( ply )
	local plyCount = player.GetCount()
	
	if RTV._ActualWait >= CurTime() then
		return false, "PHXM_MV_MUST_WAIT"
	end

	if GetGlobalBool( "In_Voting" ) then
		return false, "PHXM_MV_VOTEINPROG"
	end

	if ply.RTVoted then
		return false, "PHXM_MV_HAS_VOTED"
	end

	if RTV.ChangingMaps then
		return false, "PHXM_MV_ALR_IN_VOTE"
	end
	if plyCount < RTV.PlayerCount then
        return false, "PHXM_MV_NEED_MORE_PLY"
    end

	return true

end

function RTV.StartVote( ply )

	local can, err = RTV.CanVote(ply)

	if not can then
		RTV.ChatPrint( "WARNING", ply, false, err )
		return
	end

	RTV.AddVote( ply )

end

concommand.Add( "rtv_start", RTV.StartVote )

hook.Add( "PlayerSay", "RTV Chat Commands", function( ply, text )

	if table.HasValue( RTV.ChatCommands, string.lower(text) ) then
		RTV.StartVote( ply )
		return ""
	end

end )