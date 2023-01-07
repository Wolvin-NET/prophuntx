function PHX.LPS:HaloColorTranslate()
    
    local color = PHX:GetCVar( "lps_halo_color" )

    if color == "rainbow" then
        return ColorRand()
    else
        local c = self:GetHexColor( color, "lps_halo_color", true )
        return Color(c.R, c.G, c.B)
    end
end

local ColHalo = color_white

hook.Add("PreDrawHalos", "LPS.PropHalos", function()
    if PHX:GetCVar( "lps_enable" ) and PHX:GetCVar( "lps_halo_show" ) and PHX:GetCLCVar( "lps_cl_draw_halo" ) then
        local lpsActive = {}
        local ThroughWall = PHX:GetCVar( "lps_halo_walls" )

        ColHalo = PHX.LPS:HaloColorTranslate()
        
        for _, ply in pairs(team.GetPlayers(TEAM_PROPS)) do
            if ply:IsLastStanding() and !ply:IsLPSHolstered() then
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
    [LPS_WEAPON_OUTOFAMMO]    = "WEAPON_STATE_OUTOFAMMO",
	[LPS_WEAPON_HOLSTER]	  = "WEAPON_STATE_HOLSTER"
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
    if GetGlobalBool("InRound", false) and LocalPlayer():IsLastStanding() and LocalPlayer():Team() == TEAM_PROPS and LocalPlayer():Alive() then
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
		local HolsterHelp = PHX:FTranslate( "LPS_HOLSTER_HELPER_TEXT" )
        
        draw.WordBox( 8, ScrW()*0.5, ScrH()*0.7+32,  --orig: 0.5
            string.format(TextBox.Template, WeaponName:upper(), tostring(AmmoString), state ), "PHX.LPS.IndicatorFont", 
            TextBox.Bcolor, TextBox.Fcolor, TEXT_ALIGN_CENTER )
		draw.SimpleText( HolsterHelp, "Trebuchet18", ScrW()*0.5, ScrH()*0.75+32, color_white, TEXT_ALIGN_CENTER )
    end
end)