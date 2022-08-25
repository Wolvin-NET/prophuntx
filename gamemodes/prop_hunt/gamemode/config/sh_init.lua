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
	
	local map	= game.GetMap()
	if file.Exists(engine.ActiveGamemode() .. "/gamemode/config/maps/"..map..".lua", "LUA") then
		PHX.VerboseMsg("[PHX Map Config] Adding map config of " .. map)
		include("maps/"..map..".lua")
	end
	
	include("server/sv_devilball_additions.lua")
	include("server/sv_luckyball_additions.lua")

end
