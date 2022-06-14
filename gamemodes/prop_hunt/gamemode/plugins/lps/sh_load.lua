--[[
AddCSLuaFile("cl_")
include("sh_")

    LAST  PROP  STANDING
    
    Originally implemented from Prop Hunt: Enhanced by: [todo name]
    Ported as Plugin in Prop Hunt: X by: Wolvindra-Vinzuerio
    
    [steam URL here]

]]

sound.Add(
{
    name    = "PHX.Weapon_MP5k.Single",
    channel = CHAN_WEAPON,
    volume  = 0.9,
    level   = 140,
	pitch   = {95, 105},
    sound   = "^weapons/smg2/npc_smg1_fire1.wav"
})

AddCSLuaFile("sh_lps.lua")
AddCSLuaFile("sh_lps_player.lua")
AddCSLuaFile("sh_lps_config.lua")
AddCSLuaFile("cl_lps.lua")
include("sh_lps.lua")
include("sh_lps_player.lua")
include("sh_lps_config.lua")

if SERVER then
	include("sv_lps.lua")
else
	include("cl_lps.lua")
end