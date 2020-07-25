-- We will initialize the config stuff here


-- Shared includes
AddCSLuaFile("sh_additional_taunts.lua")
include("sh_additional_taunts.lua")


-- Server includes
if SERVER then

	include("server/sv_phkleiner_config.lua")
	include("server/sv_phhotel_config.lua")
	
	include("server/sv_devilball_additions.lua")
	include("server/sv_luckyball_additions.lua")

end
