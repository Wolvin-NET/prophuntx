util.AddNetworkString("RAM_MapVoteStart")
util.AddNetworkString("RAM_MapVoteUpdate")
util.AddNetworkString("RAM_MapVoteCancel")
util.AddNetworkString("RTV_Delay")

MapVote.Continued = false

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

if file.Exists( "mapvote/recentmaps.txt", "DATA" ) then
    recentmaps = util.JSONToTable(file.Read("mapvote/recentmaps.txt", "DATA"))
else
    recentmaps = {}
end

if ConVarExists("mv_maplimit") then
	PHX.VerboseMsg("[MapVote] Loading ConVars...")
	MapVote.Config = {
		MapLimit 		= GetConVar("mv_maplimit"):GetInt(),
		TimeLimit 		= GetConVar("mv_timelimit"):GetInt(),
		AllowCurrentMap = GetConVar("mv_allowcurmap"):GetBool(),
		EnableCooldown 	= GetConVar("mv_cooldown"):GetBool(),
		MapsBeforeRevote = GetConVar("mv_mapbeforerevote"):GetBool(),
		RTVPlayerCount 	= GetConVar("mv_rtvcount"):GetInt(),
		MapPrefixes 	= string.Explode(",", GetConVar("mv_mapprefix"):GetString():lower())
	}
else
	MapVote.Config = {}
end

local conv = {
	["mv_maplimit"]		= function(cvar,old,new)
		if new && (new != nil || new != "") then
			MapVote.Config.MapLimit = tonumber(new)
		end
	end,
	["mv_timelimit"]	= function(cvar,old,new)
		if new && (new != nil || new != "") then
			MapVote.Config.TimeLimit = tonumber(new)
		end
	end,
	["mv_allowcurmap"]	= function(cvar,old,new)
		if new && (new != nil || new != "") then
			MapVote.Config.AllowCurrentMap = tobool(new)
		end
	end,
	["mv_cooldown"]		= function(cvar,old,new)
		if new && (new != nil || new != "") then
			MapVote.Config.EnableCooldown = tobool(new)
		end
	end,
	["mv_mapbeforerevote"]	= function(cvar,old,new)
		if new && (new != nil || new != "") then
			MapVote.Config.MapsBeforeRevote = tobool(new)
		end
	end,
	["mv_rtvcount"]		= function(cvar,old,new)
		if new && (new != nil || new != "") then
			MapVote.Config.RTVPlayerCount = tonumber(new)
		end
	end,
	["mv_mapprefix"]	= function(cvar,old,new)
		if new && (new != nil || new != "") then
			MapVote.Config.MapPrefixes = string.Explode(",", new:lower())
		end
	end
}

-- Precheck when the convar is changed
for cvar,func in pairs(conv) do
	PHX.VerboseMsg("[MapVote] Adding ConVar Callbacks for: "..cvar)
	cvars.AddChangeCallback(cvar, func)
end

function CoolDownDoStuff()
    cooldownnum = MapVote.Config.MapsBeforeRevote or 3

    if table.getn(recentmaps) == cooldownnum then 
        table.remove(recentmaps)
    end

    local curmap = game.GetMap():lower()..".bsp"

    if not table.HasValue(recentmaps, curmap) then
        table.insert(recentmaps, 1, curmap)
    end

    file.Write("mapvote/recentmaps.txt", util.TableToJSON(recentmaps))
end

function MapVote.GetFromULX()
	if (ulx == nil or ulx.votemaps == nil) then
		print("[!PHX] Warning: ULX is not installed, can't get any votemap information!")
		return false
	end

	return ulx.votemaps
end

function MapVote.Start(length, current, limit, prefix)
    current = current or MapVote.Config.AllowCurrentMap or false
    length = length or MapVote.Config.TimeLimit or 28
    limit = limit or MapVote.Config.MapLimit or 24
    cooldown = MapVote.Config.EnableCooldown or true
    prefix = prefix or MapVote.Config.MapPrefixes

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
	
	if GetConVar("mv_use_ulx_votemaps"):GetBool() and (ulxmap ~= false or ulxmap ~= nil) then
		for _,map in pairs(ulxmap) do
			table.insert(maps, map..".bsp")
		end
	else
		maps = file.Find("maps/*.bsp", "GAME")
	end
    
    local vote_maps = {}
    
    local amt = 0

    for k, map in RandomPairs(maps) do
        local mapstr = map:sub(1, -5):lower()
        if(not current and game.GetMap():lower()..".bsp" == map) then continue end
        if(cooldown and table.HasValue(recentmaps, map)) then continue end

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
        
        CoolDownDoStuff()

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
        if file.Exists( "mapvote/recentmaps.txt", "DATA" ) then
            file.Delete( "mapvote/recentmaps.txt" )
        end
end )

function MapVote.Cancel()
    if MapVote.Allow then
        MapVote.Allow = false

        net.Start("RAM_MapVoteCancel")
        net.Broadcast()

        timer.Destroy("RAM_MapVote")
    end
end
