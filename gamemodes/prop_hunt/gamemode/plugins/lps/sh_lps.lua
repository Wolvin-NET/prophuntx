local cvar = {}

math.randomseed(os.time())

LPS_WEAPON_UNARMED      = 0
LPS_WEAPON_READY        = 1
LPS_WEAPON_RELOAD       = 2
LPS_WEAPON_OUTOFAMMO    = 3

PHX.LPS = {}
PHX.LPS._pluginname     = "lps"         -- Make sure this name is similar to the plugin folder's name. Otherwise language will not work!
PHX.LPS.WEAPON2         = {
    NAME    = "",
    DATA    = {}
}

cvar["lps_enable"]              = { CTYPE_BOOL,     "1",        CVAR_SERVER_ONLY, "Enable Last Prop Standing?" }
cvar["lps_weapon"]              = { CTYPE_STRING,   "random",   CVAR_SERVER_ONLY, "If set, should the weapon given by 'random' or specific. See 'lps_weapon_list' for more info." }
cvar["lps_show_weapon"]			= { CTYPE_BOOL,		"1",		CVAR_SERVER_ONLY, "Make Last Prop Standing's weapon visible or not" }

cvar["lps_halo_enable"]         = { CTYPE_BOOL,     "1",        CVAR_SERVER_ONLY, "Draw a halo effect around the last prop?" }
cvar["lps_halo_walls"]          = { CTYPE_BOOL,     "0",        CVAR_SERVER_ONLY, "Draw the halo effect through walls?" }
cvar["lps_halo_color"]          = { CTYPE_STRING,   "#14FA00",  CVAR_SERVER_ONLY, "Draw a halo effect of what color (\"rainbow\" or by hex code)?" }
cvar["lps_trail_enable"]        = { CTYPE_BOOL,     "1",        CVAR_SERVER_ONLY, "Draw a trail behind the last prop?" }
cvar["lps_trail_color"]         = { CTYPE_STRING,   "#FFFFFF",  CVAR_SERVER_ONLY, "Draw a trail of what color (by hex code)?" }
cvar["lps_trail_texture"]       = { CTYPE_STRING,   "trails/laser", CVAR_SERVER_ONLY, "Draw a trail with what texture?" }
cvar["lps_enable_music"]		= { CTYPE_BOOL,		"1",		CVAR_SERVER_ONLY, "Enable background music when LPS begins. Require round restart to take effect." }

cvar["lps_mins_prop_players"]   = { CTYPE_NUMBER, "2",        CVAR_SERVER_ONLY, "Minimum player counts on prop team. Minimum is 2.", {min = 2, max = game.MaxPlayers()} }

cvar["lps_ammocount_revolver"]  = { CTYPE_NUMBER, "120",    CVAR_SERVER_ONLY, "Ammo for Revolver gun given by Last Standing prop. -1 = Unlimited." }
cvar["lps_ammocount_smg"]       = { CTYPE_NUMBER, "300",    CVAR_SERVER_ONLY, "Ammo for SMG gun given by Last Standing prop. -1 = Unlimited." }

cvar["lps_wepdamage_blaster"]   = { CTYPE_NUMBER, "60",    CVAR_SERVER_ONLY, "Damage for 'Blaster' gun used by Last Standing prop.", {min=5, max=200} }
cvar["lps_wepdamage_revolver"]  = { CTYPE_NUMBER, "40",    CVAR_SERVER_ONLY, "Damage for 'Revolver' gun used by Last Standing prop.", {min=5, max=100} }
cvar["lps_wepdamage_smg"]       = { CTYPE_NUMBER, "10",    CVAR_SERVER_ONLY, "Damage for 'SMG' gun used by Last Standing prop.", {min=5, max=100} }

-- Let's create convars first
for ConVar,data in pairs( cvar ) do
    PHX:AddCVar( data[1], ConVar, data[2], data[3], data[4], data[5] ) --data[6] isn't needed.
end

-- Add Language please.
PHX:Includes("plugins/"..PHX.LPS._pluginname.."/lang", "LPS Language", true)

if CLIENT then    

    PHX:AddCLCVar( CTYPE_BOOL, "lps_cl_listen_music", "1", true, true, "Play Background music when LPS event begin." )
    PHX:AddCLCVar( CTYPE_BOOL, "lps_cl_draw_halo",  "1", true, false, "Draw/Hide halo, even server sets it." )
    
    -- Store Settings Info
    local ADDON_INFO = {
        name    = "Last Prop Standing for PH:X",
        version = "1.2",
        info    = "Gives the last prop a chance to kill all living hunters by using weapon/ability.",
        
        settings = {
            -- Warning: This will use QTrans->FTranslate that use English fallback!
            {"",                        "label",     false,    "LPS_GENERAL_SETTINGS" },
            {"lps_enable",              "check",     "SERVER", "LPS_MENU_ENABLE" },
            {"lps_weapon",              "textentry", "SERVER", "LPS_WEAPON_SELECT" },
            {"", "btn", {
				[1] = {"LPS_BTN_WEPLIST", function()
                
                    local List = PHX.LPS.WEAPON_NEW
                    local t = table.GetKeys(List)
                
					PHX:MsgBox(
                        {"LPS_WEPLIST", "- ".. table.concat(t, "\n- ")},
                        "MISC_NOTICE",
                        "MISC_OK"
                    )
				end}
			}, ""},
            
            {"", "spacer", false,    "" },
            {"", "label", false,    "LPS_MINIMUM_PROPS_TEAM" },
            {"lps_mins_prop_players",   "slider",    {min=2,max=game.MaxPlayers(), init="DEF_CONVAR", dec=0, kind="SERVER"}, "LPS_MINIMUM_PROPS_TEAM" },
			{"lps_enable_music", 	"check", "SERVER",	"LPS_ENABLE_MUSIC"},
            
            {"", "label", false,    "LPS_APPEARANCES" },
			{"lps_show_weapon",     "check",     "SERVER", "LPS_SHOW_WEAPON"},
            {"lps_halo_enable",     "check",     "SERVER", "LPS_HALO_ENABLE"},
            {"lps_halo_walls",      "check",     "SERVER", "LPS_HALO_SEETHROUGHWALL"},
            {"lps_halo_color",      "textentry", "SERVER", "LPS_HALO_COLOUR"},
            {"lps_trail_enable",    "check",     "SERVER", "LPS_TRAILS_ENABLE"},
            {"lps_trail_color",     "textentry", "SERVER", "LPS_TRAILS_COLOUR"},
            {"lps_trail_texture",   "textentry", "SERVER", "LPS_TRAIL_TEXTURE"},
            
            {"", "label", false,    "LPS_WEAPON_SETTINGS" },
            {"lps_ammocount_revolver" , "slider", {min = -1, max = 500, init = "DEF_CONVAR", dec = 0, kind = "SERVER"}, "LPS_WEPSET_REV_AMMO"},
            {"lps_ammocount_smg" ,      "slider", {min = -1, max = 500, init = "DEF_CONVAR", dec = 0, kind = "SERVER"}, "LPS_WEPSET_SMG_AMMO"},
            {"lps_wepdamage_blaster" ,  "slider", {min = 5,  max = 200, init = "DEF_CONVAR", dec = 0, kind = "SERVER"}, "LPS_WEPSET_DAMAGE_BLAST"},
            {"lps_wepdamage_revolver" , "slider", {min = 5,  max = 100, init = "DEF_CONVAR", dec = 0, kind = "SERVER"}, "LPS_WEPSET_DAMAGE_REV"},
            {"lps_wepdamage_smg" ,      "slider", {min = 5,  max = 100, init = "DEF_CONVAR", dec = 0, kind = "SERVER"}, "LPS_WEPSET_DAMAGE_SMG"},            
        },
        
        client  = {
            {"lps_cl_listen_music", "check", "CLIENT", "LPS_PLAY_MUSIC"},
            {"lps_cl_draw_halo", "check", "CLIENT", "LPS_CL_DRAW_HALO"}
        }
    }
    
    list.Set("PHX.Plugins","Last Prop Standing",ADDON_INFO)
end