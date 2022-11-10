--[[

    LAST -- PROP -- STANDING
    
    Originally implemented from Prop Hunt Enhanced Plus by: Phyremaster
    https://steamcommunity.com/profiles/76561198154859523
    
    Ported as Plugin in Prop Hunt: X by: Wolvindra-Vinzuerio

]]

-- Utilities

function util.LPSgetSpread( val )
    if isnumber(val) then
        return Vector(val, val, 0)
    elseif istable(val) then
        return Vector(math.random(val[1],val[2]), math.random(val[1],val[2]), 0)
    end
    return Vector(0,0,0)
end

function util.LPSgetConValue( val )
    if isstring(val) then
        if ConVarExists( val ) then
            return GetConVar(val):GetInt()
        else
            print("[LPS] WARNING: Damage ConVar `".. val.."` was not found! Reverting to 1!")
            return 1
        end
    elseif isnumber( val ) then
        return val
    end
    return 1
end

function util.LPSgetAccurateAim( tblEntity, pos, WeaponPos, ang, maxsz )
    local eyeTrace = {}
    local aimTrace = {}
    local filter   = tblEntity
    eyeTrace  = GAMEMODE.ViewCam:CamColEnabled( pos, ang, {}, "start", "endpos", 32768/2, 32768, 32768/2, maxsz )
    eyeTrace.filter = filter
    aimTrace.filter = eyeTrace.filter
    local eyeResult = util.TraceLine(eyeTrace)  --tested: Using eyeResult.Normal will create inaccurate result after changing into smaller props.
    aimTrace.start  = WeaponPos
    aimTrace.endpos = eyeResult.HitPos
    local aimTraceResult = util.TraceLine( aimTrace )

    return aimTraceResult
end

-- End of Utilities

sound.Add(
{
    name    = "PHX.Weapon_MP5k.Single",
    channel = CHAN_WEAPON,
    volume  = 0.9,
    level   = 140,
	pitch   = {95, 105},
    sound   = "^weapons/smg2/npc_smg2_fire1.wav"
})

sound.Add(
{
    name    = "PHX.WeaponLaser.Loop",
    channel = CHAN_WEAPON,
    volume  = 0.9,
    level   = 140,
    pitch   = 100,
    sound   = "lps/laser_loop.wav"
})

if CLIENT then
	surface.CreateFont("PHX.LPS.IndicatorFont", 
	{
		font = "Roboto",
		size = 17,
		weight = 750,
		antialias = true
	})

	language.Add("ph_lps_weapon", "Prop LPS Gun")
	killicon.Add("ph_lps_weapon", "vgui/hud/ph_lps_weapon", Color(248,200,0,255))
end

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