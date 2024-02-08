-- Server includes
if SERVER then
	
	function PHX:CreatePlayerClip( min, max )
		local pc = ents.Create("brush_playerclip")
		
		pc.min = min
		pc.max = max
		pc.pos = pc.max - ((pc.max - pc.min) / 2)
		
		pc:SetPos(pc.pos)
		pc:Spawn()
	end
	
	local map = game.GetMap()
	if file.Exists(engine.ActiveGamemode() .. "/gamemode/config/maps/"..map..".lua", "LUA") then
		include("maps/"..map..".lua")
		PHX:VerboseMsg("[Map Config] Config map '"..map.."' has been successfully loaded.")
	end
	
	include("server/sv_devilball_additions.lua")
	include("server/sv_luckyball_additions.lua")

end
