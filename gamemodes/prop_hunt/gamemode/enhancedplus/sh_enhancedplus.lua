-- ConVars

local PHEPLUSCVAR = {}
PHEPLUSCVAR["ph_enable_unstuck"]				= { CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Toggle Enable/Disable Built-in unstuck feature. If you use an Addon, disable this." }
PHEPLUSCVAR["ph_unstuckrange"] 					= { CTYPE_NUMBER, 	"250", CVAR_SERVER_ONLY_NO_NOTIFY, "Allowed range for the unstuck process (default = 250, should be a multiple of 5)" } --This is hidden by default.
PHEPLUSCVAR["ph_disabletpunstuckinround"] 		= { CTYPE_BOOL, 	"0", CVAR_SERVER_ONLY, "Disable last-resort unstuck teleportations to spawnpoints outside of the hiding phase" }
PHEPLUSCVAR["ph_unstuck_waittime"] 				= { CTYPE_NUMBER, 	"5", CVAR_SERVER_ONLY, "How much in seconds must pass between each unstuck attempt" }

PHEPLUSCVAR["ph_originalteambalance"] 			= { CTYPE_BOOL, 	"0", CVAR_SERVER_ONLY, "Use default PH:X/E+ original auto-balancing (disables all following team-related options)", 
function(cvarname, value)
	cvars.AddChangeCallback( cvarname, function(cv, _, new)
		
		if SERVER then
			if (not tobool(new)) then
				for _,v in pairs(player.GetAll()) do
					v:PHXChatInfo("NOTICE", "FORCE_JOIN_TEAM_IS_DISABLED")
				end
				RunConsoleCommand("ph_force_join_balanced_teams", "0")
			end
		end
		
		SetGlobalBool(cvarname, tobool(new))
	end, "phx.cvbool_" .. cvarname)
end }
PHEPLUSCVAR["ph_rotateteams"] 					= { CTYPE_BOOL, 	"0", CVAR_SERVER_ONLY, "Disable shuffle mode and rotate players instead" }
PHEPLUSCVAR["ph_huntercount"] 					= { CTYPE_NUMBER, 	"0", CVAR_SERVER_ONLY, "Hunter count (0 = automatic)" }
PHEPLUSCVAR["ph_preventconsecutivehunting"] 	= { CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Prevent players from being a Hunter twice in a row (shuffle mode only)" }
PHEPLUSCVAR["ph_forcespectatorstoplay"] 		= { CTYPE_BOOL, 	"0", CVAR_SERVER_ONLY, "Force spectators to play by including them when balancing teams" }

for ConVar,data in pairs( PHEPLUSCVAR ) do
    PHX:AddCVar( data[1], ConVar, data[2], data[3], data[4], data[5] )
end

-- All Fretta Modified codes are moved here!

function GM:TeamHasEnoughPlayers( teamid )

	local PlayerCount = team.NumPlayers( teamid )

	-- Don't let them join a team if it has more players than another team
	if PHX:GetCVar( "ph_force_join_balanced_teams" ) then
	
		for id, tm in pairs( team.GetAllTeams() ) do
			if ( id > 0 && id < 1000 && team.NumPlayers( id ) < PlayerCount && team.Joinable(id) ) then return true end
		end
		
	end

	return false
	
end


function GM:GetPlayingCount(additionalPlayer)
	local playingCount = player.GetCount()

	if not PHX:GetCVar( "ph_forcespectatorstoplay" ) then
		playingCount = team.NumPlayers(TEAM_HUNTERS) + team.NumPlayers(TEAM_PROPS)
		if additionalPlayer ~= nil and not additionalPlayer:IsPlaying() then
			playingCount = playingCount + 1
		end
	end

	return playingCount
end

function GM:GetHunterCount(playerCount)
	local hunterCount = math.floor((playerCount / 3) + 0.5)

	local customHunterCount = PHX:GetCVar( "ph_huntercount" )
	if customHunterCount ~= nil and customHunterCount > 0 then
		hunterCount = math.min(playerCount - 1, customHunterCount)
	end

	return hunterCount
end

function GM:CustomTeamHasEnoughPlayers(teamid, pl)
	if PHX:GetCVar( "ph_originalteambalance" ) then
		return GAMEMODE:TeamHasEnoughPlayers(teamid)
	end

	if PHX:GetCVar( "ph_force_join_balanced_teams" ) then
		local playerCount = GAMEMODE:GetPlayingCount(pl)
		local teamPlayerCount = team.NumPlayers(teamid)
		local hunterCount = GAMEMODE:GetHunterCount(playerCount)

		if teamid == TEAM_HUNTERS then
			return hunterCount <= teamPlayerCount
		elseif teamid == TEAM_PROPS then
			return (playerCount - hunterCount) <= teamPlayerCount
		end
	end

	return false
end

function GM:PlayerCanJoinTeam(ply, teamid)
	if SERVER and not self.BaseClass:PlayerCanJoinTeam(ply, teamid) then return false end

	if GAMEMODE:CustomTeamHasEnoughPlayers(teamid, ply) then
		ply:PHXChatInfo("WARNING", "PHX_TEAM_IS_FULL")
		ply:SendLua("GAMEMODE:ShowTeam()")
		return false
	end

	return true
end