net.Receive("PHX.ResetRotateTeams", function(len, ply)
	if ( ply:PHXIsStaff() ) then
		SetGlobalInt("RotateTeamsOffset", 0)
		ply:PHXChatInfo("GOOD", "PHX_ROTATE_TEAM_RESET")
	else
		ply:PHXChatInfo("ERROR", "PHX_ADMIN_ACCESS_ONLY", ply:Nick())
	end
end)

net.Receive("PHX.ForceResetHunterAsProp", function(len, ply)
	if ( ply:PHXIsStaff() ) then
		
		for _,hunter in ipairs(team.GetPlayers(TEAM_HUNTERS)) do
			hunter:SetForceAsProp( false )
		end
		
		for _,all in ipairs(player.GetAll()) do
			all:PHXChatInfo("NOTICE", "FORCEH2P_IS_RESET")
		end
		
	else
		ply:PHXChatInfo("ERROR", "PHX_ADMIN_ACCESS_ONLY", ply:Nick())
	end
end)

net.Receive("PHX.ForceHunterAsProp", function(len, ply)
	if ( ply:PHXIsStaff() ) then
		local hunter 	 = Player(net.ReadUInt(16))
		if !hunter or !IsValid(hunter) then
			ply:PHXChatInfo("ERROR", "FORCEH2P_PLAYER_NOT_FOUND")
		return
		end
		if hunter:Team() ~= TEAM_HUNTERS then return end -- in case, the RoundStart kinda fucked up, we need this check.
		
		local hunterName = hunter:GetName()
		local WarnText = ""

		if not hunter:IsCurrentlyForcedAsProp() then
			hunter:SetForceAsProp( true )
			WarnText    = "FORCEH2P_WILL_BE"
		else
			--What if user cancels it?
			--ply:PHXChatInfo("WARNING", "FORCEH2P_ALREADY", hunterName)
			hunter:SetForceAsProp( false )
			WarnText	= "FORCEH2P_IS_CANCELED"
		end
		
		for _, plyr in ipairs(player.GetAll()) do
			plyr:PHXChatInfo("NOTICE", WarnText, hunterName)
		end
		
	else
		ply:PHXChatInfo("ERROR", "PHX_ADMIN_ACCESS_ONLY", ply:Nick())
	end
end)

hook.Add("PH_RoundStart", "ResetHunterForceAsPropWindow", function()
	net.Start("ResetHunterForceAsPropList")
	net.Broadcast()
end)

-- Core Functions
PHX.UNSTUCK_COMMANDS = {
	["!unstuck"] = true, ["!stuck"] = true,
	["/unstuck"] = true, ["/stuck"] = true,
	["unstuck"]  = true, ["stuck"]  = true
}

hook.Add("PlayerSay", "PH_UnstuckCommand", function(pl, text)
	if PHX:GetCVar( "ph_use_unstuck" ) and PHX.UNSTUCK_COMMANDS[string.lower(text)] then
		GAMEMODE:UnstuckPlayer(pl)
		return ""
	end
end)

function GM:TeleportPlayerToClosestSpawnpoint(pl)
	local playerPos = pl:GetPos()
	local closestPos = nil

	local trace = {}
	trace.filter = {pl, pl.ph_prop}
	local x,y,z = pl.ph_prop:GetPropSize()
	trace.maxs = Vector(x, y, z)
	trace.mins = Vector(-x, -y, 0)
	trace.mask = MASK_PLAYERSOLID

	local sortedSpawnpoints = {}
	for _, spawnpoint in pairs(ents.FindByClass(navmesh.GetPlayerSpawnName())) do
		local pos = spawnpoint:GetPos()
		sortedSpawnpoints[pos:DistToSqr(playerPos)] = pos
	end

	local firstPos, rescuePos = nil, nil
	if sortedSpawnpoints and sortedSpawnpoints ~= nil then
		for dist, pos in SortedPairs(sortedSpawnpoints) do
			if rescuePos == nil then rescuePos = pos end

			if firstPos == nil then
				local x, y, z = (pos - playerPos):Unpack()
				local sum = math.abs(x) + math.abs(y) + math.abs(z)
				if sum > 50 then
					firstPos = pos
				end
			end

			if closestPos == nil then
				for i=1,5,1 do
					if closestPos == nil then
						trace.start = pos
						trace.endpos = pos
						if not util.TraceHull(trace).Hit then
							closestPos = pos
						else
							pos = pos + Vector(0, 0, 5)
						end
					end
				end
			end
		end
	end

	if closestPos ~= nil then
		pl:SetPos(closestPos + Vector(0, 0, 100))
	else
		if firstPos ~= nil then
			pl:SetPos(firstPos)
			pl:PHXChatInfo("ERROR", "UNSTUCK_BAD_SPAWNPOINT")
		elseif rescuePos ~= nil then
			pl:SetPos(rescuePos)
			pl:PHXChatInfo("ERROR", "UNSTUCK_RESCUE_SPAWNPOINT")
		else
			pl:SetPos(Vector(0, 0, 0))
			pl:PHXChatInfo("ERROR", "UNSTUCK_NO_SPAWNPOINTS")
		end

		-- Could cause crash if trying to unstuck from this scope. Let the player handles it.
		pl:SetVar("unstuckRecently", false)
	end
end

function GM:PosOnGround(pl)
	local traceResult = pl:TraceLineFromPlayer(pl:GetPos() - Vector(0, 0, 200))
	return traceResult.HitPos
end

function GM:UnstuckPlayer(pl)
	if (not PHX:GetCVar( "ph_use_unstuck" )) then return end

	if pl:Team() ~= TEAM_PROPS then return end
	
	if pl:GetVar("unstuckRecently", false) then
		pl:PHXChatInfo("NOTICE", "UNSTUCK_PLEASE_WAIT", PHX:GetCVar( "ph_unstuck_waittime" ))
		return
	end

	pl:SetVar("unstuckRecently", true)
	local unstuckWaitTime = PHX:GetCVar( "ph_unstuck_waittime" )
	timer.Simple(unstuckWaitTime, function() pl:SetVar("unstuckRecently", false) end)

	if not pl:IsOnGround() then
		local pos = pl:GetPos()
		local origZ = pos.z

		timer.Simple(0.2, function()
			local newZ = pl:GetPos().z
			if math.abs(origZ - newZ) > 0.1 then
				pl:PHXChatInfo("NOTICE", "UNSTUCK_NOT_STUCK_JITTER")
			else
				local x,y,z = pl.ph_prop:GetPropSize()
				if pl:CheckHull(x, y, z) then
					local PosTry = pl:GetPos() + Vector(0, 0, 200)
					local traceUp = pl:TraceLineFromPlayer(PosTry)
					local traceUpHull = pl:TraceLineFromPlayer(PosTry, true)
					
					local contents = bit.bor( traceUp.Contents, traceUpHull.Contents )
					
					if traceUp.HitSky or traceUpHull.HitSky then
						GAMEMODE:TryNormalUnstuck(pl)
						
						--Wolvin: bit shifting is a nightmare for me. We'll do a double check for Clip Brushes.
					elseif bit.band( contents, CONTENTS_PLAYERCLIP ) == CONTENTS_PLAYERCLIP or
						bit.band( util.PointContents( pl:GetPos() ), CONTENTS_PLAYERCLIP ) == CONTENTS_PLAYERCLIP then
						-- Wolvin: Reason why we need to use PLAYERCLIP check here is because we need to make sure 
						-- Player didn't go outside of the map due to clip brushes.
						-- Clip Brushes often so thin, or medium sized below 16 source units so there will be a 
						-- chance that player will get outside of the map. A solution is teleport to cloesest spawn point.
						pl:PHXChatInfo("ERROR", "UNSTUCK_CANNOT_FIND_SPOT")
						GAMEMODE:TeleportPlayerToClosestSpawnpoint(pl)
						pl:SetPos(GAMEMODE:PosOnGround(pl) + Vector(0, 0, 20))
					else
						pl:SetPos(pos + Vector(0, 0, 20))
						pl:PHXChatInfo("GOOD", "UNSTUCK_YOURE_UNSTUCK")
					end
				else
					GAMEMODE:TryNormalUnstuck(pl)
				end
			end
		end)
	else
		GAMEMODE:TryNormalUnstuck(pl)
	end
end

function GM:TryNormalUnstuck(pl)
	local hullCheckHeight = 10

	local initialPos = GAMEMODE:PosOnGround(pl)
	
	local unstuckrange = PHX:GetCVar( "ph_unstuckrange" )

	local trace = {}
	trace.filter = {pl, pl.ph_prop}
	local x,y,z = pl.ph_prop:GetPropSize()
	trace.maxs = Vector(x, x, z)
	trace.mins = Vector(-x, -x, 0)
	trace.start = initialPos
	trace.endpos = initialPos
	trace.mask = MASK_PLAYERSOLID

	local traceResult = util.TraceHull(trace)
	if not traceResult.Hit then -- Not Stuck
		pl:PHXChatInfo("ERROR", "UNSTUCK_NOT_STUCK_TOOBAD")
		trace.endpos = initialPos - Vector(0, 0, 50)
		local hitPos = util.TraceLine(trace).HitPos

		if hitPos ~= initialPos then
			pl:SetPos(traceResult.HitPos) -- + Vector(0, 0, 20)
		end

		return
	end

	local tries = 0
	local nogroundBackups = {}
	for dist=5,unstuckrange,5 do
		for rot=5,360,5 do
			local vec = Vector(dist, 0, hullCheckHeight)
			vec:Rotate(Angle(0, rot, 0))
			local target = vec + initialPos

			trace.start = target
			trace.endpos = target

			local traceResult = util.TraceHull(trace)
			if not traceResult.Hit then
				local correctedTarget = target - Vector(0, 0, hullCheckHeight)
				pl:SetPos(correctedTarget)
				if pl:IsOnGround() then
					pl:PHXChatInfo("GOOD", "UNSTUCK_YOURE_UNSTUCK")
					return
				else
					if tries == 10 then
						pl:SetPos(nogroundBackups[1])
						pl:PHXChatInfo("GOOD", "UNSTUCK_YOURE_UNSTUCK")
						return
					end
					tries = tries + 1
					table.insert(nogroundBackups, correctedTarget)
				end
			end
		end
	end

	if #nogroundBackups > 0 then
		pl:SetPos(nogroundBackups[1])
		pl:PHXChatInfo("GOOD", "UNSTUCK_YOURE_UNSTUCK")
		return
	end

	pl:PHXChatInfo("ERROR", "UNSTUCK_CANNOT_FIND_SPOT")

	--[[ Commented for reference, just in case if something's broken.
	if PHX:GetCVar( "ph_disabletpunstuckinround" ) then
		local blindlock_time_left = (PHX:GetCVar( "ph_hunter_blindlock_time" ) - (CurTime() - GetGlobalFloat("RoundStartTime", 0))) + 1
		if blindlock_time_left < 1 then -- hunters have been released
			pl:PHXChatInfo("WARNING", "UNSTUCK_SPAWNPOINTS_DISABLED")
			return
		end
	end
	]]
	
	if PHX:GetCVar( "ph_disabletpunstuckinround" ) then
		if !PHX:IsBlindStatus() then -- same as above, don't allow when hunter is released
			pl:PHXChatInfo("WARNING", "UNSTUCK_SPAWNPOINTS_DISABLED")
			return
		end
	end

	GAMEMODE:TeleportPlayerToClosestSpawnpoint(pl)
	pl:SetPos(GAMEMODE:PosOnGround(pl) + Vector(0, 0, 20))
end

-- Moved from Fretta to This file.
function GM:CheckTeamBalanceCustom()
	local plyrTable = player.GetAll()

	if not PHX:GetCVar( "ph_forcespectatorstoplay" ) then
		plyrTable = team.GetPlayers(TEAM_HUNTERS)
		table.Add(plyrTable, team.GetPlayers(TEAM_PROPS))
	end

	local plyrCount = #plyrTable
	local hunterCount = GAMEMODE:GetHunterCount(plyrCount)

	if PHX:GetCVar( "ph_rotateteams" ) then
		local offset = GetGlobalInt("RotateTeamsOffset", 1)
		SetGlobalInt("RotateTeamsOffset", offset + 1)
		offset = offset % plyrCount
		local max = hunterCount + offset

		for ix, plyr in ipairs(plyrTable) do
			if (ix >= (1 + offset) and ix <= max) or (max > plyrCount and ix <= max - plyrCount) then
				plyr:SetTeam(TEAM_HUNTERS)
			else
				plyr:SetTeam(TEAM_PROPS)
			end
		end
	else
		math.randomseed(os.time())
		for ix = 1, 5 do math.random() end 
		for ix = 1, math.random(2, 5) do table.CustomShuffle(plyrTable) end 

		if PHX:GetCVar( "ph_preventconsecutivehunting" ) then

			local teamContainingHunters = TEAM_HUNTERS

			if PHX:GetCVar( "ph_swap_teams_every_round" ) then
				teamContainingHunters = TEAM_PROPS
			end

			for _, pl in pairs(team.GetPlayers(teamContainingHunters)) do
				pl:SetForceAsProp( true )
			end
		end

		for ix = 1, #plyrTable do
			local plyr = table.remove(plyrTable, math.random(#plyrTable))

			if ix <= hunterCount then
				if plyr:IsCurrentlyForcedAsProp() then
					plyr:SetTeam(TEAM_PROPS)
					hunterCount = hunterCount + 1
				else
					plyr:SetTeam(TEAM_HUNTERS)
				end
			else
				plyr:SetTeam(TEAM_PROPS)
			end

			plyr:SetForceAsProp( false )
		end
	end
end

function GM:CheckTeamBalance( bDontKillPlayer )

	local highest

	for id, tm in pairs( team.GetAllTeams() ) do
		if ( id > 0 && id < 1000 && team.Joinable( id ) ) then
			if ( !highest || team.NumPlayers( id ) > team.NumPlayers( highest ) ) then
			
				highest = id
			
			end
		end
	end

	if not highest then return end

	for id, tm in pairs( team.GetAllTeams() ) do
		if ( id ~= highest and id > 0 && id < 1000 && team.Joinable( id ) ) then
			if team.NumPlayers( id ) < team.NumPlayers( highest ) then
				while team.NumPlayers( id ) < team.NumPlayers( highest ) - 1 do
				
					local ply = GAMEMODE:FindLeastCommittedPlayerOnTeam( highest )
					
					if !bDontKillPlayer then ply:Kill() end
					-- :SetTeam() bug where ply.PHXHasLoadout still true, OnPreRoundRestart will handles it.
					ply:SetTeam( id )
					PHX:VerboseMsg( "[TeamBalance] Player "..ply:Nick().." was swapped by team balance." )
					
					for _, listener in ipairs(player.GetAll()) do
						if listener == ply then
							listener:PHXChatInfo("NOTICE", "CHAT_SWAPBALANCEYOU")
						else
							listener:PHXChatInfo("NOTICE", "CHAT_SWAPBALANCE", ply:Name(), PHX:TranslateName( id, ply ))
						end
					end
					
				end
			end
		end
	end
	
end

function GM:AutoTeam(pl)
	if not (GAMEMODE.AllowAutoTeam and GAMEMODE.TeamBased) then return end
	
	-- override bot
	if pl:IsBot() then 
		GAMEMODE:PlayerRequestTeam(pl, team.BestAutoJoinTeam())
		return
	end
	
	if PHX:GetCVar( "ph_team_balance_classic" ) then
		GAMEMODE:PlayerRequestTeam(pl, team.BestAutoJoinTeam())
	else
		local playerCount = GAMEMODE:GetPlayingCount(pl)
		local hunterCount = GAMEMODE:GetHunterCount(playerCount)

		if hunterCount > team.NumPlayers(TEAM_HUNTERS) then
			GAMEMODE:PlayerRequestTeam(pl, TEAM_HUNTERS)
		elseif (playerCount - hunterCount) > team.NumPlayers(TEAM_PROPS) then
			GAMEMODE:PlayerRequestTeam(pl, TEAM_PROPS)
		else
			GAMEMODE:PlayerRequestTeam(pl, TEAM_UNASSIGNED)
		end
	end

end