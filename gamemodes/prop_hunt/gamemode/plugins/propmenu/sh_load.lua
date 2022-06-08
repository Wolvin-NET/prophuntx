AddCSLuaFile("sh_propchoose.lua")
AddCSLuaFile("sh_meta.lua")
AddCSLuaFile("sh_cmd.lua")
AddCSLuaFile("cl_propchoose.lua")
AddCSLuaFile("cl_pm_fb.lua")
include("sh_propchoose.lua")
include("sh_meta.lua")
include("sh_cmd.lua")

if SERVER then
	include("sv_propchoose.lua")
	include("sv_customprop.lua")
else
	include("cl_propchoose.lua")
	include("cl_pm_fb.lua")
end