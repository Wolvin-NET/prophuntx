function PHX.LPS:HaloColorTranslate( color )
    if color == "rainbow" then
        return false
    else
        local c = self:GetHexColor( color, "lps_halo_color", true )
        return Color(c.R, c.G, c.B)
    end
end

local ColHalo = color_white

hook.Add("PreDrawHalos", "LPS.PropHalos", function()
    if PHX:GetCVar( "lps_enable" ) and PHX:GetCVar( "lps_halo_enable" ) and PHX:GetCLCVar( "lps_cl_draw_halo" ) then
        local lpsActive = {}
        local ThroughWall = PHX:GetCVar( "lps_halo_walls" )
        
        if PHX:GetCVar( "lps_halo_color" ) == "rainbow" then
            ColHalo = Color(math.random(0, 255), math.random(0, 255), math.random(0, 255))
        else
            ColHalo = PHX.LPS:HaloColorTranslate( PHX:GetCVar( "lps_halo_color" ) )
        end
        
        for _, ply in pairs(team.GetPlayers(TEAM_PROPS)) do
            if ply:IsLastStanding() then
                table.insert( lpsActive, ply:GetPlayerPropEntity() )
            end
        end
        halo.Add(lpsActive, ColHalo, 1.2, 1.2, 1, true, ThroughWall)
    end
end)

local TRANSLATE_STATE = {
    [LPS_WEAPON_UNARMED]      = "WEAPON_STATE_UNARMED",
    [LPS_WEAPON_READY]        = "WEAPON_STATE_READY",
    [LPS_WEAPON_RELOAD]       = "WEAPON_STATE_RELOAD",
    [LPS_WEAPON_OUTOFAMMO]    = "WEAPON_STATE_OUTOFAMMO"
}
local function Translate( id )
    return PHX:FTranslate( TRANSLATE_STATE[id] )
end

local TextBox = {
    --         name | ammo | status
    Template = "%s | %s | [%s]",
    Fcolor = Color(230,230,230),
    Bcolor = Color(20,20,20,210)
}
hook.Add("HUDPaint", "LPS.WeaponHUDIndicator", function()
    if GetGlobalInt("InRound", false) and LocalPlayer():IsLastStanding() and LocalPlayer():Team() == TEAM_PROPS and LocalPlayer():Alive() then
        local WeaponName    = LocalPlayer():GetLPSWeaponName()
        local WeaponState   = LocalPlayer():GetLPSWeaponState()
        local Ammo          = LocalPlayer():GetLPSAmmo()
        
        local AmmoString = "0" -- default.
        if Ammo == -1 then
            AmmoString = PHX:FTranslate( "WEAPON_AMMO_UNLI" )
        else
            AmmoString = Ammo
        end
        local state = Translate( WeaponState )
        
        draw.WordBox( 8, ScrW()*0.5, ScrH()*0.5+32, 
            string.format(TextBox.Template, WeaponName:upper(), tostring(AmmoString), state ), "PHX.LPS.IndicatorFont", 
            TextBox.Bcolor, TextBox.Fcolor, TEXT_ALIGN_CENTER )
    end
end)

hook.Add("SetupMove", "LPS.CLShootWeapon",function(ply,mv)
    if not IsFirstTimePredicted() then return end
    if not IsValid(ply) or ply != LocalPlayer() then return end
    
    if PHX:GetCVar( "lps_enable" ) and mv:KeyDown( IN_ATTACK ) and ply:Team() == TEAM_PROPS and ply:Alive() and GetGlobalInt("InRound", false) then
        RunConsoleCommand("prop_shoot")
    end
end)