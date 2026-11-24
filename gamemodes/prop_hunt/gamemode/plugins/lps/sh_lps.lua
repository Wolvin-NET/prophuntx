local cvar = {}

--math.randomseed(os.time())

-- Public LPS Const
LPS_WEAPON_UNARMED      = 0
LPS_WEAPON_READY        = 1
LPS_WEAPON_RELOAD       = 2
LPS_WEAPON_OUTOFAMMO    = 3
LPS_WEAPON_HOLSTER		= 4

PHX.LPS = {}
PHX.LPS._pluginname     = "lps"         -- Make sure this name is similar to the plugin folder's name. Otherwise language will not work!
PHX.LPS.WEAPON2         = {
    NAME    = "",
    DATA    = {}
}
PHX.LPS.DUMMYWEAPON     = "weapon_lps"  -- Never change this Constant. It will break the whole LPS Predictions!

cvar["lps_enable"]              = { CTYPE_BOOL,     "1",        CVAR_SERVER_ONLY, "Enable Last Prop Standing?" }
cvar["lps_weapon"]              = { CTYPE_STRING,   "random",   CVAR_SERVER_ONLY, "If set, should the weapon given by 'random' or specific. See 'lps_weapon_list' for more info." }
cvar["lps_show_weapon"]			= { CTYPE_BOOL,		"1",		CVAR_SERVER_ONLY, "Make Last Prop Standing's weapon visible or holstered" }

cvar["lps_start_random_round"]        = { CTYPE_BOOL,		"0",		CVAR_SERVER_ONLY, "Should LPS will begin Randomly? This will overrides 'lps_start_every_x_rounds' ConVar.",
function(cvarname,value)
    cvars.AddChangeCallback(cvarname, function(_,_,new)
        if tonumber(new) and tonumber(new) == 0 then
            PHX.LPS.ROUND_LEFT = GetGlobalInt("RoundNumber",0) + GetGlobalInt( "lps_start_every_x_rounds", 0 )
        end
        SetGlobalBool(cvarname, tobool(new))
    end, "phx.cvbool_"..cvarname)
end }
cvar["lps_start_delayed_rounds"] = { CTYPE_BOOL,    "0",        CVAR_SERVER_ONLY, "Should LPS Start on Every X Rounds? If so, see 'lps_start_every_x_rounds' ConVar.",
function(cvarname,value)
    cvars.AddChangeCallback(cvarname, function(_,_,new)
        if tonumber(new) and tonumber(new) == 1 then
            PHX.LPS.ROUND_LEFT = GetGlobalInt("RoundNumber",0) + GetGlobalInt( "lps_start_every_x_rounds", 0 )
        end
        SetGlobalBool(cvarname, tobool(new))
    end, "phx.cvbool_"..cvarname)
end }
cvar["lps_start_every_x_rounds"] = { CTYPE_NUMBER,  "2",        CVAR_SERVER_ONLY, "Numbers of X rounds that should make the event starts", {min = 2, max = PHX:GetCVar( "ph_rounds_per_map" ) },
function(cvarname,value)
    cvars.AddChangeCallback(cvarname, function(_,_,new)
        -- update immediately
        PHX.LPS.ROUND_LEFT = GetGlobalInt("RoundNumber",0) + tonumber(new)
        SetGlobalInt(cvarname, new)
    end, "phx.cvnum_"..cvarname)
end }

cvar["lps_use_normal_health"]   = { CTYPE_BOOL,     "0",        CVAR_SERVER_ONLY, "Should LPS Players STARTS with 100 HP? Changing to other props doesn't keep this." }
cvar["lps_use_armor"]           = { CTYPE_BOOL,     "0",        CVAR_SERVER_ONLY, "Should Give LPS Players an Armor? (Default is 100 armor points)" }
cvar["lps_allow_holster"]		= { CTYPE_BOOL,		"1",		CVAR_SERVER_ONLY, "Allow prop to holster their weapon. This also temporarily hide trails and halo effects when enabled." }

cvar["lps_halo_show"]         = { CTYPE_BOOL,     "0",        CVAR_SERVER_ONLY, "Draw a halo effect around the last prop?" }
cvar["lps_halo_walls"]          = { CTYPE_BOOL,     "0",        CVAR_SERVER_ONLY, "Draw the halo effect through walls?" }
cvar["lps_halo_color"]          = { CTYPE_STRING,   "#14FA00",  CVAR_SERVER_ONLY, "Halo Effect Color (use \"rainbow\" or hex code)" }
cvar["lps_trail_show"]        = { CTYPE_BOOL,     "0",        CVAR_SERVER_ONLY, "Draw a trail behind the last prop?" }
cvar["lps_trail_color"]         = { CTYPE_STRING,   "#FFFFFF",  CVAR_SERVER_ONLY, "Trail Color (use hex code)" }
cvar["lps_trail_texture"]       = { CTYPE_STRING,   "trails/laser", CVAR_SERVER_ONLY, "Draw a trail with what texture?" }
cvar["lps_enable_music"]		= { CTYPE_BOOL,		"1",		CVAR_SERVER_ONLY, "Enable background music when LPS begins. Require round restart to take effect." }
cvar["lps_laser_color"]         = { CTYPE_STRING,   "#CC0000",  CVAR_SERVER_ONLY, "Laser Beam Color for Laser Gun (use \"rainbow\" or hex code)" }

cvar["lps_mins_prop_players"]   = { CTYPE_NUMBER,   "2",        CVAR_SERVER_ONLY, "Minimum player counts on prop team. Minimum is 2.", {min = 2, max = game.MaxPlayers()} }

cvar["lps_ammocount_revolver"]  = { CTYPE_NUMBER, "120",    CVAR_SERVER_ONLY, "Ammo for Revolver gun given by Last Standing prop. -1 = Unlimited." }
cvar["lps_ammocount_smg"]       = { CTYPE_NUMBER, "300",    CVAR_SERVER_ONLY, "Ammo for SMG gun given by Last Standing prop. -1 = Unlimited." }
cvar["lps_ammocount_airboat"]   = { CTYPE_NUMBER, "500", CVAR_SERVER_ONLY, "Ammo for Airboat Gun given by Last Standing Prop. -1 = Unlimited" }
cvar["lps_ammocount_shotgun"]   = { CTYPE_NUMBER, "150", CVAR_SERVER_ONLY, "Ammo for Shotgun given by Last Standing Prop. -1 = Unlimited" }
cvar["lps_ammocount_rocket"]    = { CTYPE_NUMBER, "30",  CVAR_SERVER_ONLY, "Ammo for RPG given by Last Standing Prop. -1 = Unlimited" }

cvar["lps_wepdamage_blaster"]   = { CTYPE_NUMBER, "60",    CVAR_SERVER_ONLY, "Damage for 'Blaster' gun used by Last Standing prop.", {min=5, max=200} }
cvar["lps_wepdamage_revolver"]  = { CTYPE_NUMBER, "40",    CVAR_SERVER_ONLY, "Damage for 'Revolver' gun used by Last Standing prop.", {min=5, max=100} }
cvar["lps_wepdamage_smg"]       = { CTYPE_NUMBER, "10",    CVAR_SERVER_ONLY, "Damage for 'SMG' gun used by Last Standing prop.", {min=5, max=100} }
cvar["lps_wepdamage_airboat"]           = { CTYPE_NUMBER, "8",    CVAR_SERVER_ONLY, "Damage for 'Airboat Gun' gun used by Last Standing prop.", {min=5, max=100} }
cvar["lps_wepdamage_shotgunpelet"]      = { CTYPE_NUMBER, "6",    CVAR_SERVER_ONLY, "Damage per 1 Pellet for 'Shotgun' gun used by Last Standing prop. The shotgun will fires 8 pellets.", {min=5, max=100} }
cvar["lps_wepdamage_rocket"]            = { CTYPE_NUMBER, "80",    CVAR_SERVER_ONLY, "Damage for 'RPG' gun used by Last Standing prop.", {min=20, max=200} }
cvar["lps_wepdamage_laser"]             = { CTYPE_NUMBER, "8",    CVAR_SERVER_ONLY, "Damage for 'Laser' in per Tick Delay used by Last Standing prop.", {min=5, max=100} }

-- Let's create convars first
for ConVar,data in pairs( cvar ) do
    PHX:AddCVar( data[1], ConVar, data[2], data[3], data[4], data[5], data[6] )
end

-- Add Language please.
PHX:Includes("plugins/"..PHX.LPS._pluginname.."/lang", "LPS Language", true)

if CLIENT then    

    PHX:AddCLCVar( CTYPE_BOOL, "lps_cl_listen_music", "1", true, true, "Play Background music when LPS event begin." )
    PHX:AddCLCVar( CTYPE_BOOL, "lps_cl_draw_halo",  "1", true, false, "Draw/Hide halo, even server sets it." )
    
    -- Store Settings Info
	
    local ADDON_INFO = {
        name    = "Last Prop Standing for PH:X",
        version = "1.3",
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
            {"", "label", false,    "LPS_TRIGGER_CONDITION" },
            {"lps_start_random_round", 	"check", "SERVER",	"LPS_START_RANDOM"},
            {"lps_start_delayed_rounds", 	"check", "SERVER",	"LPS_START_DELAYED"},
            {"lps_start_every_x_rounds", 	"slider", {min=2,max=PHX:GetCVar( "ph_rounds_per_map" ), dec=0, kind="SERVER"},	"LPS_START_X_ROUNDS"},
            
            {"", "label", false,    "LPS_HEALTH_ARMOR" },
            {"lps_use_normal_health",       "check", "SERVER", "LPS_SET_USEHEALTH" },
            {"lps_use_armor",               "check", "SERVER", "LPS_SET_USEARMOR" },
			{"lps_allow_holster", 			"check", "SERVER", "LPS_ALLOW_HOLSTER" },
            
            {"lps_mins_prop_players",   "slider",    {min=2,max=game.MaxPlayers(), dec=0, kind="SERVER"}, "LPS_MINIMUM_PROPS_TEAM" },            
			{"lps_enable_music", 	"check", "SERVER",	"LPS_ENABLE_MUSIC"},
            
            {"", "label", false,    "LPS_APPEARANCES" },
			{"lps_show_weapon",     "check",     "SERVER", "LPS_SHOW_WEAPON"},
            {"lps_halo_show",     "check",     "SERVER", "LPS_HALO_ENABLE"},
            {"lps_halo_walls",      "check",     "SERVER", "LPS_HALO_SEETHROUGHWALL"},
            {"lps_halo_color",      "textentry", "SERVER", "LPS_HALO_COLOUR"},
            {"lps_trail_show",    "check",     "SERVER", "LPS_TRAILS_ENABLE"},
            {"lps_trail_color",     "textentry", "SERVER", "LPS_TRAILS_COLOUR"},
            {"lps_trail_texture",   "textentry", "SERVER", "LPS_TRAIL_TEXTURE"},
            {"lps_laser_color",     "textentry", "SERVER", "LPS_LASER_COLOUR" },
            
            {"", "label", false,    "LPS_WEAPON_SETTINGS" },
            {"lps_ammocount_revolver" ,     "slider", {min = -1, max = 500, dec = 0, kind = "SERVER"}, "LPS_WEPSET_REV_AMMO"},
            {"lps_ammocount_smg" ,          "slider", {min = -1, max = 500, dec = 0, kind = "SERVER"}, "LPS_WEPSET_SMG_AMMO"},
            
            {"lps_ammocount_airboat",       "slider", {min = -1, max = 500, dec = 0, kind = "SERVER"}, "LPS_WEPSET_AIR_AMMO"},
            {"lps_ammocount_shotgun",       "slider", {min = -1, max = 500, dec = 0, kind = "SERVER"}, "LPS_WEPSET_SHOT_AMMO"},
            {"lps_ammocount_rocket",        "slider", {min = -1, max = 500, dec = 0, kind = "SERVER"}, "LPS_WEPSET_RPG_AMMO"},
            
            {"", "label", false,    "LPS_WEAPON_DMG_SETTINGS" },
            {"lps_wepdamage_blaster" ,      "slider", {min = 5,  max = 200, dec = 0, kind = "SERVER"}, "LPS_WEPSET_DAMAGE_BLAST"},
            {"lps_wepdamage_revolver" ,     "slider", {min = 5,  max = 100, dec = 0, kind = "SERVER"}, "LPS_WEPSET_DAMAGE_REV"},
            {"lps_wepdamage_smg" ,          "slider", {min = 5,  max = 100, dec = 0, kind = "SERVER"}, "LPS_WEPSET_DAMAGE_SMG"},
            
            {"lps_wepdamage_airboat",       "slider", {min = 5,  max = 100, dec = 0, kind = "SERVER"}, "LPS_WEPSET_DAMAGE_AIR"},
            {"lps_wepdamage_shotgunpelet",  "slider", {min = 5,  max = 100, dec = 0, kind = "SERVER"}, "LPS_WEPSET_DAMAGE_SHOT"},
            {"lps_wepdamage_rocket",        "slider", {min = 5,  max = 200, dec = 0, kind = "SERVER"}, "LPS_WEPSET_DAMAGE_RPG"},
            {"lps_wepdamage_laser",         "slider", {min = 5,  max = 100, dec = 0, kind = "SERVER"}, "LPS_WEPSET_DAMAGE_LASER"},
            
        },
        
        client  = {
            {"lps_cl_listen_music", "check", "CLIENT", "LPS_PLAY_MUSIC"},
            {"lps_cl_draw_halo", "check", "CLIENT", "LPS_CL_DRAW_HALO"}
        }
    }
    
    list.Set("PHX.Plugins","Last Prop Standing",ADDON_INFO)
end

-- How about PlayerTick ?
hook.Add("SetupMove", "LPS.CLShootWeapon",function( ply, mv ) --Move ?
    if not IsFirstTimePredicted() then return end
    if not IsValid(ply) then return end
    if CLIENT then
        if ply != LocalPlayer() then return end
    end
    
    -- make sure 3 of these entities are exists!
    local wepEnt    = ply:GetLPSWeaponEntity()
    local hasWeapon = ply:HasWeapon( PHX.LPS.DUMMYWEAPON )
    local ActiveWep = ply:GetActiveWeapon()
    
    if PHX:GetCVar( "lps_enable" ) and IsValid(wepEnt) and 
        hasWeapon and ActiveWep:GetClass() == PHX.LPS.DUMMYWEAPON and
        ply:Team() == TEAM_PROPS and ply:IsLastStanding() and ply:Alive() and GetGlobalBool("InRound", false) then
		
		if mv:KeyPressed( IN_ATTACK2 ) and ply:LPSHolsterTime() <= CurTime() then
		
			if ( ply:GetLPSWeaponState() == LPS_WEAPON_RELOAD ) then return end
			--if ( ply:LPSNextFireDelay()+0.1 > CurTime() ) then return end
		
			if !ply:IsLPSHolstered() then
				ply:SetLPSWeaponState( LPS_WEAPON_HOLSTER )
				ply:LPSFiringState( false )
				
				if SERVER and IsValid( ply.lpstrail ) then
					ply.lpstrail:SetNoDraw( true )
				end
				
				if CLIENT then
					surface.PlaySound( "weapons/smg1/switch_single.wav" )
				end
				
			elseif ply:IsLPSHolstered() then
				if ply:GetLPSAmmo() == 0 then
					ply:SetLPSWeaponState( LPS_WEAPON_OUTOFAMMO )
				else
					ply:SetLPSWeaponState( LPS_WEAPON_READY )
				end
				
				if SERVER and IsValid( ply.lpstrail ) then
					ply.lpstrail:SetNoDraw( false )
				end
				
				if CLIENT then
					surface.PlaySound( "weapons/smg1/switch_burst.wav" )
				end
			end
			
			ply:SetLPSHolsterDelay()
			
		end
        
        if mv:KeyDown( IN_ATTACK ) and !ply:IsLPSHolstered() then
            ply:LPSShootBullets()
            ply:LPSFiringState( true )  -- used for Lasers or any weapons that uses Think function.
        else
            ply:LPSFiringState( false ) -- used for Lasers or any weapons that uses Think function.
        end
    end
end)