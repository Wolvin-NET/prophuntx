local cvar = {}

math.randomseed(os.time())

LPS_WEAPON_UNARMED      = 0
LPS_WEAPON_READY        = 1
LPS_WEAPON_RELOAD       = 2
LPS_WEAPON_OUTOFAMMO    = 3

PHX.LPS = {}
PHX.LPS._pluginname = "lps"         -- Make sure this name is similar to the plugin folder's name. Otherwise language will not work!
PHX.LPS.WEAPON      = "random"      -- intial value
PHX.LPS.WEAPON2     = {
    NAME    = "",
    DATA    = {}
}

cvar["lps_enable"]          = { CTYPE_BOOL,     "1",        CVAR_SERVER_ONLY, "Give the last prop alive a weapon?" }
cvar["lps_weapon"]          = { CTYPE_STRING,   "random",   CVAR_SERVER_ONLY, "Give which weapon (\"random\" from the config or by class name)?", 
function(cv,val)
    cvars.AddChangeCallback(cv, function(_,_,new)
        if new ~= "random" then
            PHX.LPS.WEAPON = new
        else
            PHX.LPS.WEAPON = "random"
        end
    end, "phx.cvstr_" .. cv)
end }
cvar["lps_halo_enable"]     = { CTYPE_BOOL,     "1",        CVAR_SERVER_ONLY, "Draw a halo effect around the last prop?" }
cvar["lps_halo_walls"]      = { CTYPE_BOOL,     "0",        CVAR_SERVER_ONLY, "Draw the halo effect through walls?" }
cvar["lps_halo_color"]      = { CTYPE_STRING,   "#14FA00",  CVAR_SERVER_ONLY, "Draw a halo effect of what color (\"rainbow\" or by hex code)?" }
cvar["lps_trail_enable"]    = { CTYPE_BOOL,     "1",        CVAR_SERVER_ONLY, "Draw a trail behind the last prop?" }
cvar["lps_trail_color"]     = { CTYPE_STRING,   "#FFFFFF",  CVAR_SERVER_ONLY, "Draw a trail of what color (by hex code)?" }
cvar["lps_trail_texture"]   = { CTYPE_STRING,   "trails/laser", CVAR_SERVER_ONLY, "Draw a trail with what texture?" }
cvar["lps_weapon_mode"]     = { CTYPE_BOOL,     "1",        CVAR_SERVER_ONLY, "Last Prop Standing weapon giving system: Classic Method (0) or New Method (1)" }

-- Let's create convars first
for ConVar,data in pairs( cvar ) do
    PHX:AddCVar( data[1], ConVar, data[2], data[3], data[4], data[5] ) --data[6] isn't needed.
end

-- Add Language please.
PHX:Includes("plugins/"..PHX.LPS._pluginname.."/lang", "LPS Language", true)

--[[ local f = file.Find(engine.ActiveGamemode() .. "/gamemode/plugins/".. PHX.LPS._pluginname .."/lang/*.lua", "LUA")
for _,lgfile in SortedPairs(f) do
    PHX.VerboseMsg("[LPS] [LANGUAGE] Adding Language File -> ".. lgfile)
    AddCSLuaFile("lang/" .. lgfile)
    include("lang/" .. lgfile)
end ]]

if CLIENT then
    -- Store Settings Info
    local ADDON_INFO = {
        name    = "Last Prop Standing",
        version = "1.2-PHX",
        info    = "Gives the last prop a chance to defeat all living hunters by using a weapon/ability.",
        
        settings = {
            -- Warning: This will use QTrans/FTranslate!
            {"", "label", false, "LPS_GENERAL_SETTINGS" },
            {"lps_enable", "check", "SERVER", "LPS_MENU_ENABLE"},
            {"lps_weapon", "textentry", "SERVER", "LPS_WEAPON_SELECT"},
            
            {"", "label", false, "LPS_APPEARANCES" },
            {"lps_halo_enable", "check", "SERVER", "LPS_HALO_ENABLE"},
            {"lps_halo_walls", "check", "SERVER", "LPS_HALO_SEETHROUGHWALL"},
            {"lps_halo_color", "textentry", "SERVER", "LPS_HALO_COLOUR"},
            
            {"lps_trail_enable", "check", "SERVER", "LPS_TRAILS_ENABLE"},
            {"lps_trail_color", "textentry", "SERVER", "LPS_TRAILS_COLOUR"},
            {"lps_trail_texture", "textentry", "SERVER", "LPS_TRAIL_TEXTURE"},
            
            {"lps_weapon_mode", "check", "SERVER", "LPS_MODE"}
        },
        
        client  = {} -- nope
    }
    
    list.Set("PHX.Plugins","Last Prop Standing",ADDON_INFO)
end

--[[ function lpsWeaponSetup()
	if !(GetConVar("lps_weapon"):GetString() == "random") then
        PHX.LPS.WEAPON = GetConVar("lps_weapon"):GetString()
    end
end
lpsWeaponSetup()
cvars.AddChangeCallback("lps_weapon", lpsWeaponSetup()) ]]

--[[ hook.Add("EntityFireBullets", "LastPropStandingAim", function(ply, blt)
    if ply:IsPlayer() && ply:Team() == TEAM_PROPS then
        local eyeTrace = {}
        local aimTrace = {}
        if ply.ph_prop && ply.ph_prop:IsValid() then
            eyeTrace.filter = ply.ph_prop
            aimTrace.filter = ply.ph_prop
            blt.IgnoreEntity = ply.ph_prop
        end

        local _,plyHull = ply:GetHull()
		if plyHull.z < 24 then
			eyeTrace.start = ply:EyePos() + Vector(0, 0, plyHull.z + (24-  plyHull.z))
			eyeTrace.endpos = ply:EyePos() + Vector(0, 0, plyHull.z + (24 - plyHull.z)) + ply:EyeAngles():Forward() * 56756
		elseif plyHull.z > 84 then
			eyeTrace.start = ply:EyePos() + Vector(0, 0, plyHull.z - 84)
			eyeTrace.endpos = ply:EyePos() + Vector(0, 0, plyHull.z - 84) + ply:EyeAngles():Forward() * 56956
		else
			eyeTrace.start = ply:EyePos() + Vector(0, 0, 8)
			eyeTrace.endpos = ply:EyePos() + Vector(0, 0, 8) + ply:EyeAngles():Forward() * 56756
		end
        local eyeTraceResult = util.TraceLine(eyeTrace)

        aimTrace.start = blt.Src
        aimTrace.endpos = eyeTraceResult.HitPos
        local aimTraceResult = util.TraceLine(aimTrace)

        blt.Dir = aimTraceResult.Normal
        return true
    end
end) ]]