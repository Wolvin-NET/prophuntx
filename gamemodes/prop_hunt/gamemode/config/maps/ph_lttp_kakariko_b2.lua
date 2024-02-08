local map = game.GetMap()
local hookname="PHX.MapConfig_"..map

local function DoMapConfig()
	print("[Map Config] Removing '"..map.."' sprites to prevent console from spamming!")
	for _,v in ipairs(ents.FindByClass('env_sprite')) do v:Remove(); end
end

hook.Add("PostCleanupMap", hookname, DoMapConfig)
hook.Add("InitPostEntity", hookname, DoMapConfig)