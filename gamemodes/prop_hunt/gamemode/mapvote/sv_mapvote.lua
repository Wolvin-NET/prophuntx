util.AddNetworkString("RAM_MapVoteStart")
util.AddNetworkString("RAM_MapVoteUpdate")
util.AddNetworkString("RAM_MapVoteCancel")
util.AddNetworkString("RTV_Delay")

local MapVote = PHX.MV

MapVote.Continued = false
local RecentMapsFile = PHX.ConfigPath .. "/mapvote_recentmaps.txt"

net.Receive("RAM_MapVoteUpdate", function(len, ply)
    if(MapVote.Allow) then
        if(IsValid(ply)) then
            local update_type = net.ReadUInt(3)
            
            if(update_type == MapVote.UPDATE_VOTE) then
                local map_id = net.ReadUInt(32)
                
                if(MapVote.CurrentMaps[map_id]) then
                    MapVote.Votes[ply:SteamID()] = map_id
                    
                    net.Start("RAM_MapVoteUpdate")
                        net.WriteUInt(MapVote.UPDATE_VOTE, 3)
                        net.WriteEntity(ply)
                        net.WriteUInt(map_id, 32)
                    net.Broadcast()
                end
            end
        end
    end
end)

local RecentMaps = {}
if file.Exists( RecentMapsFile, "DATA" ) then
    RecentMaps = util.JSONToTable(file.Read( RecentMapsFile, "DATA" ))
else
    RecentMaps = {}
end

if ConVarExists("mv_maplimit") then
	PHX:VerboseMsg("[MapVote] Loading ConVars...")
	MapVote.PHXConfig = {
		MapLimit 		= GetConVar("mv_maplimit"):GetInt(),
		TimeLimit 		= GetConVar("mv_timelimit"):GetInt(),
		AllowCurrentMap = GetConVar("mv_allowcurmap"):GetBool(),
		ChangeMapNoPlayer = GetConVar("mv_change_when_no_player"):GetBool(),
		UseULX 			= GetConVar("mv_use_ulx_votemaps"):GetBool(),
		EnableCooldown 	= GetConVar("mv_cooldown"):GetBool(),
		MapsBeforeRevote = GetConVar("mv_mapbeforerevote"):GetInt(), --omfg it has been like, spent 8 years to realise, it was "GetBool", NOT "GetInt", damn it...
		RTVPlayerCount 	= GetConVar("mv_rtvcount"):GetInt(),
		MapPrefixes 	= string.Explode(",", GetConVar("mv_map_prefix"):GetString():lower())
	}
else
	ErrorNoHaltWithStack( "[PH: X MapVote] Warning: ConVar `mv_maplimit` DOES NOT exist! Returning to default Values!!" )
	MapVote.PHXConfig = MapVoteConfigDefault
end

local conv = {
	["mv_maplimit"]		= function(cvar,old,new)
		if new && (new != nil || new != "") then
			MapVote.PHXConfig.MapLimit = tonumber(new)
		end
	end,
	["mv_timelimit"]	= function(cvar,old,new)
		if new && (new != nil || new != "") then
			MapVote.PHXConfig.TimeLimit = tonumber(new)
		end
	end,
	["mv_allowcurmap"]	= function(cvar,old,new)
		if new && (new != nil || new != "") then
			MapVote.PHXConfig.AllowCurrentMap = tobool(new)
		end
	end,
	["mv_change_when_no_player"] = function(cvar,old,new)
		if new && (new != nil || new != "") then
			MapVote.PHXConfig.ChangeMapNoPlayer = tobool(new)
		end
	end,
	["mv_use_ulx_votemaps"] = function(cvar,old,new)
		if new && (new != nil || new != "") then
			MapVote.PHXConfig.UseULX = tobool(new)
		end
	end,
	["mv_cooldown"]		= function(cvar,old,new)
		if new && (new != nil || new != "") then
			MapVote.PHXConfig.EnableCooldown = tobool(new)
		end
	end,
	["mv_mapbeforerevote"]	= function(cvar,old,new)
		if new && (new != nil || new != "") then
			MapVote.PHXConfig.MapsBeforeRevote = tonumber(new) -- was "tobool", how the fuck that I can be so this less careful
		end
	end,
	["mv_rtvcount"]		= function(cvar,old,new)
		if new && (new != nil || new != "") then
			MapVote.PHXConfig.RTVPlayerCount = tonumber(new)
		end
	end,
	["mv_map_prefix"]	= function(cvar,old,new)
		if new && (new != nil || new != "") then
			MapVote.PHXConfig.MapPrefixes = string.Explode(",", new:lower())
		end
	end
}

-- Precheck when the convar is changed
for cvar,func in pairs(conv) do
	PHX:VerboseMsg("[MapVote] Adding ConVar Callbacks for: "..cvar)
	cvars.AddChangeCallback(cvar, func)
end

function PHX.CoolDownDoStuff()
    local cooldownnum = MapVote.PHXConfig.MapsBeforeRevote or 3

	if #RecentMaps > cooldownnum then
		-- Remove the rest of table to prevent map being added overgrowingly to cooldown
		-- This occurs when the convar changes in active round.
		for i=cooldownnum+1,#RecentMaps,1 do
			table.remove(RecentMaps) --last arg = #RecentMaps
		end
	end
	
    if #RecentMaps == cooldownnum then
        table.remove(RecentMaps) --last arg = #RecentMaps
    end

    local curmap = game.GetMap():lower()..".bsp"

    if not table.HasValue(RecentMaps, curmap) then
        table.insert(RecentMaps, 1, curmap)
    end

    file.Write(RecentMapsFile, util.TableToJSON(RecentMaps))
end

function MapVote.GetFromULX()

	if (ulx) then
		if (ulx.votemaps) then return ulx.votemaps end
	end
	
	print("[MapVote] WARNING: ULX is not installed! Couldn't get any list from 'votemap' data!")
	return {}

	--[[ if (!ulx or ulx == nil or !ulx.votemaps or ulx.votemaps == nil) then
		print("[!PHX] Warning: ULX is not installed, can't get any votemap information!")
		return {}
	end

	return ulx.votemaps ]]
end

-- Original: MapVote.Start
function MapVote.PHXStart(length, current, limit, prefix)

	if (not PHX:GetCVar( "ph_enable_mapvote" )) then
		MsgAll("PH:X MapVote is disabled!\n")
		for _,v in pairs(player.GetAll()) do
			v:ChatPrint("Warning: MapVote is disabled.")
		end
		return
	end

    current 	= current or MapVote.PHXConfig.AllowCurrentMap or false
    length 		= length or MapVote.PHXConfig.TimeLimit or 28
    limit 		= limit or MapVote.PHXConfig.MapLimit or 24
    prefix 		= prefix or MapVote.PHXConfig.MapPrefixes
    
	local cooldown 	= MapVote.PHXConfig.EnableCooldown or (!MapVote.PHXConfig.EnableCooldown and true)

    local is_expression = false
	local ulxmap = MapVote.GetFromULX()
	
    if not prefix then
        local info = file.Read(GAMEMODE.Folder.."/"..GAMEMODE.FolderName..".txt", "GAME")

        if(info) then
            local info = util.KeyValuesToTable(info)
            prefix = info.maps
        else
            error("MapVote Prefix can not be loaded from gamemode")
        end

        is_expression = true
    else
        if prefix and type(prefix) ~= "table" then
            prefix = {prefix}
        end
    end
    
	local maps = {}
	
	if (MapVote.PHXConfig.UseULX) and istable(ulxmap) and !table.IsEmpty(ulxmap) then
		for _,map in pairs(ulxmap) do table.insert(maps, map..".bsp"); end
	else
		maps = file.Find("maps/*.bsp", "GAME")
	end
    
    local vote_maps = {}
    
    local amt = 0

    for k, map in RandomPairs(maps) do
        local mapstr = map:sub(1, -5):lower()
        if(not current and game.GetMap():lower()..".bsp" == map) then continue end
        if(cooldown and table.HasValue(RecentMaps, map)) then continue end

        if is_expression then
            if(string.find(map, prefix)) then -- This might work (from gamemode.txt)
                vote_maps[#vote_maps + 1] = map:sub(1, -5)
                amt = amt + 1
            end
        else
            for k, v in pairs(prefix) do
                if string.find(map, "^"..v) then
                    vote_maps[#vote_maps + 1] = map:sub(1, -5)
                    amt = amt + 1
                    break
                end
            end
        end
        
        if(limit and amt >= limit) then break end
    end
    
    net.Start("RAM_MapVoteStart")
        net.WriteUInt(#vote_maps, 32)
        
        for i = 1, #vote_maps do
            net.WriteString(vote_maps[i])
        end
        
        net.WriteUInt(length, 32)
    net.Broadcast()
    
    MapVote.Allow = true
    MapVote.CurrentMaps = vote_maps
    MapVote.Votes = {}
    
    timer.Create("RAM_MapVote", length, 1, function()
        MapVote.Allow = false
        local map_results = {}
        
        for k, v in pairs(MapVote.Votes) do
            if(not map_results[v]) then
                map_results[v] = 0
            end
            
            for k2, v2 in pairs(player.GetAll()) do
                if(v2:SteamID() == k) then
                    if(MapVote.HasExtraVotePower(v2)) then
                        map_results[v] = map_results[v] + 2
                    else
                        map_results[v] = map_results[v] + 1
                    end
                end
            end
            
        end
        
        PHX.CoolDownDoStuff()

        local winner = table.GetWinningKey(map_results) or 1
        
        net.Start("RAM_MapVoteUpdate")
            net.WriteUInt(MapVote.UPDATE_WIN, 3)
            
            net.WriteUInt(winner, 32)
        net.Broadcast()
        
        local map = MapVote.CurrentMaps[winner]

        timer.Simple(4, function()
            hook.Run("MapVoteChange", map)
            RunConsoleCommand("changelevel", map)
        end)
    end)
end

hook.Add( "Shutdown", "RemoveRecentMaps", function()
        if file.Exists( RecentMapsFile, "DATA" ) then
            file.Delete( RecentMapsFile )
        end
end )

-- Original: MapVote.Cancel()
function MapVote.PHXCancel()

	if (not PHX:GetCVar( "ph_enable_mapvote" )) then
		MsgAll("PH:X MapVote is disabled.\n")
		return
	end

    if MapVote.Allow then
        MapVote.Allow = false

        net.Start("RAM_MapVoteCancel")
        net.Broadcast()

        timer.Destroy("RAM_MapVote")
    end
end

function PHX.StartMapVote()
	
	if PHX:GetCVar( "ph_use_custom_mapvote_cmd" ) then	-- Overrides the function mode below.
		local c = PHX:GetCVar( "ph_custom_mv_concmd" )
		game.ConsoleCommand( c .. "\n" )
		return
	end

	if PHX:GetCVar( "ph_use_custom_mapvote" ) then
		local f = PHX:GetCVar( "ph_custom_mv_func" )
		RunString(f, "MapVote_CVAR")
		return
	end
	
	if (not PHX:GetCVar( "ph_enable_mapvote" )) then
		local result = hook.Call( "PH_OverrideMapVote", nil )
        if (result) then
		    MsgAll("PH:X MapVote is disabled. Calling Map Vote Overrides Hook... \n")
		    return
        else
            MsgAll("WARNING: Detected no external Map Votes Call from [PH_OverrideMapVote] hook, Falling back! (Did you forget to `return true`?)\n")
        end
	end
	
	MapVote.PHXStart()

end
