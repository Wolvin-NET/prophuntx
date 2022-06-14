function PHX.LPS:HaloColorTranslate( color )
    if color == "rainbow" then
        return false
    else
        return self:GetHexColor( color, "lps_halo_color", "#14FA00", true )
    end
end

hook.Add("PreDrawHalos", "LastPropStandingHalo", function()
    if PHX:GetCVar( "lps_enable" ) and PHX:GetCVar( "lps_halo_enable" ) then
        local lpsActive = {}
        local ThroughWall = PHX:GetCVar( "lps_halo_walls" )
        for _, ply in pairs(team.GetPlayers(TEAM_PROPS)) do
            if ply:IsLastStanding() then
                table.insert( lpsActive, ply.ph_prop )
            end
        end
	    
        local ColHalo = color_white
        
        if PHX:GetCVar( "lps_halo_color" ) == "rainbow" then
            ColHalo = Color(math.random(0, 255), math.random(0, 255), math.random(0, 255))  -- should be randomized, right ?
        else
            ColHalo = PHX.LPS:HaloColorTranslate( PHX:GetCVar( "lps_halo_color" ) )
        end
        
        halo.Add(lpsActive, ColHalo, 1.2, 1.2, 1, true, ThroughWall)
    end
end)

hook.Add("KeyPress", "LPS.CLShootWeapon",function(ply,key)
    if not IsFirstTimePredicted() then return end
    if not IsValid(ply) or ply != LocalPlayer() then return end
    
    if PHX:GetCVar( "lps_enable" ) and key == IN_ATTACK and ply:Team() == TEAM_PROPS and ply:Alive() and GetGlobalInt("InRound", false) then
        timer.Simple(0.05, function() RunConsoleCommand("prop_shoot") end)
    end
end)