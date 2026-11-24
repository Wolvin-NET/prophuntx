-- Credits & Original code: https://github.com/tyrantelf/gmod-mapvote
-- This is modified as for ease use of MapVote in Prop Hunt X, to avoid users having difficulties to edit their mapvote config file instead through ConVars.

-- Default Stock Config (Fall Back). DO NOT EDIT.
PHX.MVConfigDefault = {
    MapLimit 	= 24,
    TimeLimit 	= 28,
    AllowCurrentMap = false,
	ChangeMapNoPlayer = true,
	UseULX 		= false,
    EnableCooldown = true,
    MapsBeforeRevote = 2,
    RTVPlayerCount = 3,
    MapPrefixes = {"phx_", "ph_"}
}

local MapVote = PHX.MV
MapVote.PHXConfig = {}

local convarlist = {
	{"mv_maplimit", 		"24",		CVAR_SERVER_ONLY_NO_NOTIFY, "numbers of map that shown on mapvote.", 5 },
	{"mv_timelimit",		"28",		CVAR_SERVER_ONLY, "time in second for default mapvotes time.", 10 },
	{"mv_change_when_no_player", "1", 	CVAR_SERVER_ONLY, "change the map after no players in the server?", 0, 1 },
	{"mv_allowcurmap",		"0",		CVAR_SERVER_ONLY_NO_NOTIFY, "allow current map to be voted (1/0)", 0, 1 },
	{"mv_use_ulx_votemaps", "0",		CVAR_SERVER_ONLY_NO_NOTIFY, "Use map listing from ULX Mapvote? 1 = use from ULX mapvote list (which you can whitelist them), 0 = use default maps/*.bsp directory listing.", 0, 1 },
	{"mv_cooldown",			"1",		CVAR_SERVER_ONLY, "enable cooldown for voting a map", 0, 1 },
	{"mv_mapbeforerevote",	"2", 		CVAR_SERVER_ONLY, "how many times that the map which cooldown can be shown again?", 2, 20 }, -- We will clamp max to 20 maps instead.
	{"mv_rtvcount",			"3", 		CVAR_SERVER_ONLY, "number of required players to use rtv mapvote.", 2, game.MaxPlayers() },
	{"mv_map_prefix",		"phx_,ph_",	CVAR_SERVER_ONLY_NO_NOTIFY, "Map Prefixes that will be shown under mapvote. Use the following example:\n  \"phx_,ph_\" (Dont forget to use quotation marks!)." }
}

if !ConVarExists("mv_maplimit") then
	PHX:VerboseMsg("[MapVote] ConVars initialized!")
	for _,convars in ipairs(convarlist) do
		CreateConVar(convars[1], convars[2], convars[3], convars[4], convars[5], convars[6])
	end
end

-- Todo: Purpose?
function MapVote.HasExtraVotePower(ply)
	return false
end

MapVote.CurrentMaps = {}
MapVote.Votes = {}

MapVote.Allow = false

MapVote.UPDATE_VOTE = 1
MapVote.UPDATE_WIN = 3

if SERVER then
	concommand.Add("mv_start", function(ply, _, args)
		if ( util.IsStaff( ply ) ) then
			
			if PHX:GetCVar( "ph_use_custom_mapvote_cmd" ) or PHX:GetCVar( "ph_use_custom_mapvote" ) then
				ply:ChatPrint("Custom External MapVote is enabled. You need to disable them in order to use PH:X's MapVote system.")
				return
			end
			
			local time = args[1] or MapVote.PHXConfig.TimeLimit or 28
			MapVote.PHXStart(time, nil, nil, nil)
		else
			ply:PHXChatInfo("ERROR", "MISC_ACCESSDENIED")
		end
	end, nil, "Start MapVote (without ULX)")

	concommand.Add("mv_stop", function(ply)
		if ( util.IsStaff( ply ) ) then
			
			if PHX:GetCVar( "ph_use_custom_mapvote_cmd" ) or PHX:GetCVar( "ph_use_custom_mapvote" ) then
				ply:ChatPrint("Couldn't stop PH:X MapVote because Custom External MapVote is currently enabled!")
				return
			end
		
			MapVote.PHXCancel()
		else
			ply:PHXChatInfo("ERROR", "MISC_ACCESSDENIED")
		end
	end, nil, "Stop MapVote (without ULX)")
end

-- ULX Addition
local CATEGORY_NAME = PHX.TITLE

local function PHX_MapVote( calling_ply, votetime, should_cancel )

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
				print("[MapVote:ULX] WARNING: You need at least 2 more players to get this MapVote votes work!")
			else
				print("[MapVote:ULX] WARNING: MapVote is Unavailable. You might have to change map manually!")
			end
		end
	end
end

if (!ulx or ulx == nil) then
	print("[MapVote] WARNING: ULX is not installed! Not going to add map_vote ...")
else
	local mapvotecmd = ulx.command( CATEGORY_NAME, "ulx map_vote", PHX_MapVote, "!map_vote" )
	mapvotecmd:addParam{ type=ULib.cmds.NumArg, min=15, default=25, hint="time", ULib.cmds.optional, ULib.cmds.round }
	mapvotecmd:addParam{ type=ULib.cmds.BoolArg, invisible=true }
	mapvotecmd:defaultAccess( ULib.ACCESS_ADMIN )
	mapvotecmd:help( "Invokes the map vote logic." )
	mapvotecmd:setOpposite( "ulx unmap_vote", {_, _, true}, "!unmap_vote" )
end