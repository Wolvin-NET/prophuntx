local map = "ph_lttp_kakariko_b2"
PHX:VerboseMsg("[Map Config] Config for '"..map.."' has been loaded.")

local function DoConfig()
	print("[Map Config] Removing '"..map.."' sprites to prevent console from spamming!")
	for _,v in ipairs(ents.FindByClass('env_sprite')) do v:Remove(); end
end

hook.Add("PostCleanupMap", "PHX.KakarikoCleanup", DoConfig)
hook.Add("InitPostEntity", "PHX.KakarikoInit", DoConfig)