function PHX.LPS:GetHexColor( color, convar, isRainbow, alpha )
    
    if isRainbow == nil then isRainbow = false end
    if alpha == nil then alpha = 255 end
    
    local ref = "[LPS WARNING] Convar `%s`%s is not a valid hex code, using default color: %s"
    local text = string.format(ref, convar, (isRainbow and " is not \"rainbow\" or" or ""), "Default Color!")
    local col = { R = 255, G = 255, B = 255 }   -- init/fallback color.
    
    if (not util.IsHexColor(color)) then print(text); return col end;
    
    -- Based on: https://gist.github.com/mattkrins/0732f603d7baa2a01963665d3ac4f07c
    color = color:gsub("#","")

    col = {
        R = tonumber("0x" .. color:sub(1,2)),
        G = tonumber("0x" .. color:sub(3,4)),
        B = tonumber("0x" .. color:sub(5,6)),
        A = alpha
    }
    
    return col
    
end

-- Laser Variable & Helper. DO NOT MODIFY!!!!
-- This is intentional for the gameplay design.
local LASERFIREDELAY = 0.1
local SafeEntityToDamage = {
    ["prop_physics"]    = true,
    ["func_breakable"]  = true,
    ["func_physbox"]    = true,
    --["prop_dynamic"]    = true, --we don't recommend activate this, but it's up to you if you want to make this prop damage-able.
}
local function LaserDoDamage(ent, pos, dmg, atk, inf )

    if ent:Health() <= dmg then

        local d = DamageInfo()
        d:SetDamage( dmg )
        d:SetAttacker( atk )
        d:SetInflictor( inf )
        d:SetDamageType( DMG_DISSOLVE )
        util.BlastDamageInfo(d, pos, 8)
    
    else
    
        ent:TakeDamage( dmg, atk, inf )
        
    end
end
if CLIENT then
    -- forcefully stop laser sound in clientside.
    function LPSStopLaserSound()
        LocalPlayer():StopSound("PHX.WeaponLaser.Loop")
        LocalPlayer():SetNWBool("LPS.LaserSoundPlayed",false)
        
        -- I know this is due to prediction from PlayerTick hook. Recalling them just to make sure it's completely stops.
        timer.Simple(LASERFIREDELAY, function() LocalPlayer():StopSound("PHX.WeaponLaser.Loop") end)
        timer.Simple(LASERFIREDELAY+0.1, function() LocalPlayer():StopSound("PHX.WeaponLaser.Loop") end)
    end
end
-- End of Laser Table & Functions Helper.

PHX.LPS.WEAPON_NEW = {
    ["revolver"]    =  {
        Delay           = 1,
        AmmoCount       = "lps_ammocount_revolver", -- 120, can be number.
        WorldModel      = Model("models/weapons/w_phx_pistol.mdl"),
        ShootSound      = Sound("Weapon_357.Single"),
        Type            = "weapon",
        ViewPunch       = {
            x = {-15,-3},
            y = {-0.02,0.2}
        },
        
        FixPos          = Vector(0,8,0),
        MuzzleFx        = function( ent, pos, endpos, ang )
            local m = EffectData()
            m:SetEntity( ent )
            m:SetStart( pos )
            m:SetOrigin( endpos )
            m:SetAngles( ang )
            m:SetFlags( 7 )
            util.Effect( "MuzzleFlash", m )
        end,
        
        Num 			= 1,
        Spread	        = 0.02,
        Tracer		    = 2,
        TracerName 	    = "AR2Tracer",
        Force		    = 3,
        AmmoType        = "357",
        Damage		    = "lps_wepdamage_revolver", -- 40, can be number.
    },
    
    ["smg"]    =  {
        Delay           = 0.1,
        AmmoCount       = "lps_ammocount_smg", -- 500, can be number.
        WorldModel      = Model("models/weapons/w_phx_mp5.mdl"),
        ShootSound      = Sound("PHX.Weapon_MP5k.Single"),
        Type            = "weapon",
        ViewPunch       = {
            x = {-0.9,0.02},
            y = {-0.03,0.03}
        },
        
        FixPos          = Vector(0,8,0),
        MuzzleFx        = function( ent, pos, endpos, ang )
            local m = EffectData()
            m:SetEntity( ent )
            m:SetStart( pos )
            m:SetOrigin( endpos )
            m:SetAngles( ang )
            m:SetFlags( 1 )
            util.Effect( "MuzzleFlash", m )
        end,
        
        Num 			= 1,
        Spread 		    = {0.02,0.05},
        Tracer		    = 3,
        TracerName 	    = "Tracer",
        Force		    = 1,
        AmmoType        = "SMG1",
        Damage		    = "lps_wepdamage_smg", -- 10, can be number.
    },
    
    ["airboatgun"]    =  {
        Delay           = 0.07,
        AmmoCount       = "lps_ammocount_airboat",  -- 500
        WorldModel      = Model("models/airboatgun.mdl"),
        ShootSound      = Sound("Airboat.FireGunHeavy"),
        Type            = "weapon",
        ViewPunch       = {
            x = {-0.5,0.015},
            y = {-0.017,0.017}
        },
        
        FixPos          = Vector(0,8,0),
        MuzzleFx        = function( ent )
            local m = EffectData()
            m:SetEntity( ent )
            m:SetAttachment( 1 )
            util.Effect( "AirboatMuzzleFlash", m )
        end,
        
        Num 			= 1,
        Spread 		    = {0.015,0.025},
        Tracer		    = 2,
        TracerName 	    = "AirboatGunHeavyTracer",
        Force		    = 3,
        AmmoType        = "AirboatGun",
        Damage		    = "lps_wepdamage_airboat", -- 7
    },
    
    ["shotgun"]    =  {
        Delay           = 1,
        AmmoCount       = "lps_ammocount_shotgun", -- 150
        WorldModel      = Model("models/weapons/w_shotgun.mdl"),
        ShootSound      = Sound("Weapon_Shotgun.NPC_Single"),
        Type            = "weapon",
        ViewPunch       = {
            x = {-0.75,0.02},
            y = {-0.02,0.0215}
        },
        
        FixPos          = Vector(0,10,0),
        FixAngles       = Angle(0,180,0),
        MuzzleFx        = function( ent, pos, endpos, ang )
            local m = EffectData()
            m:SetEntity( ent )
            m:SetStart( pos )
            m:SetOrigin( endpos )
            m:SetAngles( ang )
            m:SetFlags( 7 )
            util.Effect( "MuzzleFlash", m )
        end,
        
        Num 			= 8,
        Spread 		    = 0.08716, --original: 0.05, Source SDK: 0.08716, VECTOR_CONE_10DEGREES
        Tracer		    = 1,
        TracerName 	    = "Tracer",
        Force		    = 2,
        AmmoType        = "Buckshot",
        Damage		    = "lps_wepdamage_shotgunpelet", -- 6
    },
    
    ["blaster"] = {
        Delay           = 3,
        AmmoCount       = -1,
        WorldModel      = Model("models/weapons/w_guardgun.mdl"),
        Type            = "custom",
        Reload          = true,
        FixPos          = Vector(0,10,0),
        FixAngles        = Angle(0,180,0),
        
        Function        = function( self, ply )
            
            local blaster = {}
            blaster.ShootSound  = "weapons/cguard/cguard_fire.wav"
            blaster.ChargeSound = "weapons/cguard/charging.wav"
            blaster.BoomSound   = Sound("Weapon_Mortar.Impact")
            blaster.Damage      = PHX:GetCVar( "lps_wepdamage_blaster" ) or 60
            blaster.Recoil      = 8 -- unused.
            blaster.Radius      = 200
            
            local WepEnt = ply:GetLPSWeaponEntity()
            
            local ChargeFX = EffectData()
            ChargeFX:SetEntity( WepEnt )
            ChargeFX:SetAttachment(1)
            
            --WepEnt:EmitSound( blaster.ChargeSound )
            
            local activewep = ply:GetActiveWeapon()
            if IsValid(activewep) and activewep:GetClass() == PHX.LPS.DUMMYWEAPON then
                activewep:EmitSound( blaster.ChargeSound )
            end
            
            util.Effect( "phx_blaster_charge", ChargeFX )
            
            timer.Simple(self.Delay, function()
                if IsValid(ply) and ply:Alive() and IsValid( WepEnt ) then
                    ply:SetLPSWeaponState( LPS_WEAPON_READY )
                end
            end)
            
            timer.Simple(1.35, function()
                if IsValid(ply) and ply:Alive() and IsValid( WepEnt ) then
                    -- Shoot                    
                    local tr = ply:LPSCreatePropTrace()
                    
                    local pos   = ply:EyePos()  -- ply:GetShootPos()
                    local dist  = (tr.HitPos - tr.StartPos):Length()
                    local delay = dist/8000
                    
                    local shootFX = EffectData()
                    shootFX:SetEntity( WepEnt )
                    shootFX:SetOrigin( tr.HitPos )
                    shootFX:SetAttachment(1)
                    util.Effect( "phx_blaster_fire", shootFX )
                    util.Effect( "phx_blaster_muzzle", shootFX )
                    
                    ply:ViewPunch( Angle(math.Rand(-20,20), math.Rand(-10,25), 0) )
                    
                    --WepEnt:EmitSound( blaster.ShootSound )
                    if IsValid(activewep) and activewep:GetClass() == PHX.LPS.DUMMYWEAPON then
                        activewep:EmitSound( blaster.ShootSound )
                    end
                    
                    -- Disintegrate, the boom thingy
                    timer.Simple(delay, function()
                    
                        if IsValid(ply) and ply:Alive() then 
                        
                            local boomFX = EffectData()
                            boomFX:SetOrigin( tr.HitPos )
                            boomFX:SetNormal( tr.HitNormal )
                            util.Effect( "phx_blaster_explode", boomFX )
                            
                            if SERVER then
                                local BoomPos = tr.HitPos + 3 * tr.HitNormal
                                local target = ents.Create("info_target")
                                target:SetPos( BoomPos )
                                target:SetOwner( ply )
                                target:Spawn()
                                
                                local inf = ents.Create("prop_combine_ball")
                                inf:SetKeyValue("spawnflags",1678)
                                inf:SetOwner( ply )
                                inf:Spawn()
                                
                                target:Fire("kill","",0.1)
                                inf:Fire("kill","",0.1)
                                
                                local d = DamageInfo()
                                d:SetDamage( blaster.Damage )
                                d:SetAttacker( ply )
                                d:SetInflictor( inf )
                                d:SetDamageType( DMG_DISSOLVE )
                                
                                util.BlastDamageInfo(d, BoomPos, blaster.Radius)
                                
                                target:EmitSound( blaster.BoomSound )
                            end
                        
                        end
                        
                    end)
                end
            end)
        
        end
    },
    
    ["rocket"] = {
        Delay           = 1.5,
        AmmoCount       = "lps_ammocount_rocket", -- 60
        WorldModel      = Model("models/weapons/w_phx_rpg.mdl"),
        Type            = "custom",
        Reload          = true,
		
		FixAngles		= Angle(0,180,0),
        
        Function        = function( self, ply )
            
            local rpg = {}
            rpg.FireSound  = Sound("Weapon_RPG.Single")
            rpg.Damage     = PHX:GetCVar( "lps_wepdamage_rocket" ) or 80
            if (not PHX.LPS.RPG_AttachPos) then
                -- 1 = Right, 2 = Left
                PHX.LPS.RPG_AttachPos = 1
            end
			
            local WepEnt = ply:GetLPSWeaponEntity()
			local ShootPos = WepEnt:GetAttachment( PHX.LPS.RPG_AttachPos ).Pos
            
            local FireFX = EffectData()
            FireFX:SetEntity( WepEnt )
            FireFX:SetAttachment( PHX.LPS.RPG_AttachPos )
            
            local activewep = ply:GetActiveWeapon()
            if IsValid(activewep) and activewep:GetClass() == PHX.LPS.DUMMYWEAPON then
                activewep:EmitSound( rpg.FireSound )
            end
            
            --"MuzzleFlash" don't have Data:GetAttachment apparently, instead it will always attach on attachment ID #1 and cannot be interchangable.
            --We'll use this alternative instead.
            util.Effect( "ChopperMuzzleFlash", FireFX ) --Alternatively you can use "GunshipMuzzleFlash" or "HunterMuzzleFlash" (if you have EP2 installed)
			
            timer.Simple(self.Delay, function()
                if IsValid(ply) and ply:Alive() and IsValid( WepEnt ) then
                  if ply:GetLPSAmmo() > 0 or ply:GetLPSAmmo() == -1 then
                    ply:SetLPSWeaponState( LPS_WEAPON_READY )
                  else
                    ply:SetLPSWeaponState( LPS_WEAPON_OUTOFAMMO )
                  end
                end
            end)
			
			if PHX.LPS.RPG_AttachPos == 1 then
				PHX.LPS.RPG_AttachPos = 2
			else
				PHX.LPS.RPG_AttachPos = 1
			end
            
            local tr = ply:LPSCreatePropTrace()
			local Forward = tr.Normal
            
            if SERVER then
                local r = ents.Create("rpg_missile")
                if (IsValid(r)) then
                    r:SetPos( ShootPos + Forward * 8 )
                    r:SetAngles( ply:EyeAngles() )
                    r:Spawn()
                    r:SetVelocity( Forward * 300 + Vector(0, 0, 128) )
                    r:SetSaveValue("m_flDamage", rpg.Damage)
                    r:SetOwner( ply )
                end
            end
        
        end
    },
    
    ["laser"]   = {
        Delay           = LASERFIREDELAY, -- DO NOT CHANGE!!!
        AmmoCount       = -1,
        WorldModel      = Model("models/weapons/w_irifle.mdl"),
        Type            = "custom",
        Reload          = false,
        
        FixAngles       = Angle(0,180,0),
        FixPos          = Vector(0,10,0),
        
        Function        = function( self, ply )
            
            if SERVER then
                if (!ply.LPSLaserFireSound or ply.LPSLaserFireSound == nil) then
                    
                    local Recip = RecipientFilter()
                    for _,v in pairs(player.GetAll()) do
                        if v == ply then continue end
                        Recip:AddPlayer( v )
                    end
                    ply.LPSLaserFireSound = CreateSound( ply, "lps/laser_loop.wav", Recip )
					ply.LPSLaserFireSound:SetSoundLevel( 140 )
                    
                end
            else
                -- Client will emit lopped sound instead. We'll have our local NWBool here.
                if !LocalPlayer():GetNWBool("LPS.LaserSoundPlayed",false) then
                    LocalPlayer():EmitSound("PHX.WeaponLaser.Loop")
                    LocalPlayer():SetNWBool("LPS.LaserSoundPlayed",true)
                end
            end
        
            local Damage     = PHX:GetCVar( "lps_wepdamage_laser" ) or 5
            
            local WepEnt = ply:GetLPSWeaponEntity()
            --local ShootPos = WepEnt:GetAttachment(1).Pos -- might be unused atm. I'll leave this
            
            ply:LagCompensation(true)
            local tr = ply:LPSCreatePropTrace()
            ply:LagCompensation(false)
            
            if SERVER then
                if (tr.Entity and tr.Entity:IsValid()) and
                    (SafeEntityToDamage[tr.Entity:GetClass()]) or 
                    (tr.Entity:IsPlayer() and tr.Entity:Team() == TEAM_HUNTERS and tr.Entity:Alive()) then
                    
                    LaserDoDamage(tr.Entity, tr.HitPos, Damage, ply, WepEnt )
                end
            end
            
            local M = EffectData()
            M:SetEntity( WepEnt )
            M:SetFlags( 5 )
            util.Effect( "MuzzleFlash", M )
            
            local HitMark = EffectData()
            HitMark:SetOrigin(tr.HitPos)
            HitMark:SetNormal(tr.HitNormal)
            util.Effect("AR2Impact", HitMark)
        end
    },
}

-- Laser Hook Helper
if CLIENT then
    function PHX.LPS:LaserColorTranslate()
        
        local color = PHX:GetCVar( "lps_laser_color" )
    
        if color == "rainbow" then
            return ColorRand()
        else
            local c = self:GetHexColor( color, "lps_laser_color", true )
            return Color(c.R, c.G, c.B)
        end
    end

    local LaserTexture  = Material( "trails/laser" )
    local LaserColor    = color_white
    
    -- Currently it's the only proper way to show lasers.
    -- if Anyone had better solution, please let me know!
    hook.Add("PreDrawEffects", "LPS.LaserBeamDraw", function()    
        
        if GetGlobalBool("LPS.InLastPropStanding", false) and GetGlobalBool("InRound", false) then
        
        for _,v in pairs(team.GetPlayers(TEAM_PROPS)) do
            if v:Alive() and v:IsLastStanding() and v:LPSFiringStatus() and v:GetLPSWeaponName() == "laser" then
            
                if !v:LPSCheckEntityCanShoot() then return end                
                local tr = v:LPSCreatePropTrace()
                local ent = v:GetLPSWeaponEntity()
                
                LaserColor = PHX.LPS:LaserColorTranslate()
                
                if IsValid(ent) then
                    local att = ent:GetAttachment(1)
                    local start = tr.StartPos
                    if (att) then start = att.Pos end
                    local endpos = tr.HitPos
                    
                    --cam.Start3D()
                    render.SetMaterial( LaserTexture )        
                    render.DrawBeam( start, endpos, 32, 1, 0, LaserColor )
                    --cam.End3D()
                end
                    
            end
        end
        
        end
    end)
end

-- TODO HELP WANTED: Does GM:SetupMove is better or should I use GM:Move instead?
hook.Add("PlayerTick", "LPS.LaserSoundControl", function( ply, mv )
    if not IsFirstTimePredicted() then return end
    if not IsValid(ply) then return end

    if (PHX:GetCVar( "lps_enable" ) and
        ply:Team() == TEAM_PROPS and ply:IsLastStanding() and ply:Alive() and !ply:InVehicle() and
        ply:GetLPSWeaponName() == "laser" and GetGlobalBool("LPS.InLastPropStanding", false) and GetGlobalBool("InRound", false)) then
        
        if SERVER then
        
          if (ply.LPSLaserFireSound and ply.LPSLaserFireSound ~= nil) then
            if !ply:LPSFiringStatus() or !ply:LPSCheckEntityCanShoot() then 
                ply.LPSLaserFireSound:Stop()
            else 
                ply.LPSLaserFireSound:PlayEx(0.95,100)
            end
          end
          
        else
        
            if ply == LocalPlayer() and (!ply:LPSFiringStatus() or !ply:LPSCheckEntityCanShoot()) then
                if ply:GetNWBool("LPS.LaserSoundPlayed",false) then
                    ply:SetNWBool("LPS.LaserSoundPlayed",false)
                    ply:StopSound("PHX.WeaponLaser.Loop")
                end
            end
            
        end
        
    end
end)

if SERVER then
    local function ClearLPSFireSound( ply )
	
        -- Force clear laser fire sound.		
        if ply:Team() == TEAM_PROPS and (ply.LPSLaserFireSound and ply.LPSLaserFireSound ~= nil) then
            ply.LPSLaserFireSound:Stop()
            ply.LPSLaserFireSound = nil
        end
        
    end

    hook.Add("PostPlayerDeath", "LPS.LaserSoundControl.Death", ClearLPSFireSound)
    hook.Add("PlayerDisconnected", "LPS.LaserSoundControl.Disconnect", ClearLPSFireSound)
    hook.Add("PH_RoundEnd", "LPS.LaserSoundControl.RoundEnd", function()
        for _,ply in pairs( team.GetPlayers(TEAM_PROPS) ) do
            ClearLPSFireSound( ply )
            timer.Simple(0, function() 
                ply:SetNWBool( "LPS.LaserSoundPlayed", false )
                ply:SendLua("LPSStopLaserSound()") 
            end)
        end
    end)

end
-- End of Laser Hook Helper

hook.Add("Initialize", "LPS.Init_or_ExternalWeaponEntry", function()
    --[[
        Usage: list.Set("LPS.XCustomWeapon", "weapon name", { < LPS bullet structure > })
    ]]
    for name,data in pairs(list.Get("LPS.XCustomWeapon")) do
        if (!data or data == nil) or (istable(data) and table.IsEmpty(data)) then
            PHX.VerboseMsg("[LPS] Weapon data entry of [".. name .."] is empty! Skipping...")
		elseif (PHX.LPS.WEAPON_NEW[name]) ~= nil then
			PHX.VerboseMsg("[LPS] Found Duplication of Weapon data entry: [".. name .."], Rejecting!")
        else
            PHX.VerboseMsg("[LPS] Adding custom weapon entry of: " .. name)
            PHX.LPS.WEAPON_NEW[name] = data
        end
    end
end)

concommand.Add("lps_weapon_list", function(ply)
    if (SERVER and util.IsStaff( ply )) or (CLIENT and ply:PHXIsStaff()) then
		local weps = table.GetKeys( PHX.LPS.WEAPON_NEW )
		print("[PHX LPS] Showing all available LPS weapons:")
		for _,v in pairs(weps) do
			print("- name: ".. v .. ", type: ".. PHX.LPS.WEAPON_NEW[v].Type)
		end	
	else
        print("[PHX LPS] Sorry, you can't access this command.")
    end
end, nil, "List Weapon Info for Last Prop Standing.")