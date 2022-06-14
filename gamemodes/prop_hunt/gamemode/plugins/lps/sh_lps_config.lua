-- Weapon class names to choose from (if using random weapons for Last Prop Standing):
PHX.LPS.WEAPONS = { "weapon_357" }

function PHX.LPS:GetHexColor( color, convar, fallback, isRainbow )
    
    if isRainbow == nil then isRainbow = false end
    
    local ref = "[LPS WARNING] Convar `%s`%s is a valid hex code, using default color: %s"
    local text = string.format(ref, convar, (isRainbow and " is not \"rainbow\" or" or ""), fallback)
    local col = { R = 255, G = 255, B = 255 }   -- init color.
    
    local nonHex, hexLength = string.gsub(color, "[%dABCDEFabcdef]", "")
    if hexLength == 6 then
        if nonHex == "#" then
            col = {
                R = tonumber(string.sub(color, 2, 3), 16),
                G = tonumber(string.sub(color, 4, 5), 16),
                B = tonumber(string.sub(color, 6, 7), 16)
            }
        elseif nonHex == "" then
            col = {
                R = tonumber(string.sub(color, 1, 2), 16),
                G = tonumber(string.sub(color, 3, 4), 16),
                B = tonumber(string.sub(color, 5, 6), 16)
            }
        else
            col = fallback
            print( text )
        end
    else
        col = fallback
        print( text )
    end

    return col
    
end

PHX.LPS.WEAPON_NEW = {
    ["revolver"]    =  {
        Delay           = 1,
        AmmoCount       = 120,
        WorldModel      = Model("models/weapons/w_357.mdl"),
        ShootSound      = Sound("Weapon_357.Single"),
        Type            = "weapon",
        
        Num 			= 1,
        Spread	        = 0.05,
        Tracer		    = 2,
        TracerName 	    = "AR2Tracer",
        Force		    = 2.5,
        AmmoType        = "357",
        Damage		    = 40,
    },
    
    ["smg"]    =  {
        Delay           = 0.2,
        AmmoCount       = 255,
        WorldModel      = Model("models/weapons/w_smg1.mdl"),
        ShootSound      = Sound("PHX.Weapon_MP5k.Single"),
        Type            = "weapon",
        
        Num 			= 1,
        Spread 		    = {0.01,0.1},
        Tracer		    = 4,
        TracerName 	    = "Tracer",
        Force		    = 1,
        AmmoType        = "SMG1",
        Damage		    = 3,
    },
    
    ["blaster"] = {
        Delay           = 5,
        AmmoCount       = -1,
        WorldModel      = Model("models/weapons/w_guardgun.mdl"),
        Type            = "custom",
        Reload          = true,
        
        Function        = function( self, ply )
            
            local blaster = {}
            blaster.ShootSound  = "weapons/1cguard/cguard_fire.wav"
            blaster.ChargeSound = "weapons/1cguard/charging.wav"
            blaster.BoomSound   = Sound("Weapon_Mortar.Impact")
            blaster.Damage      = 10
            blaster.Recoil      = 8
            blaster.Radius      = 200
            
            local ChargeFX = EffectData()
            ChargeFX:SetEntity( ply:GetLPSWeaponEntity() )
            ChargeFX:SetAttachment(1)
            
            ply:GetLPSWeaponEntity():EmitSound( blaster.ShootSound )
            util.Effect( "phx_blaster_charge", ChargeFX )
            
            timer.Simple(1.35, function()
                if ply:Alive() then
                    -- Shoot
                    
                    local pos   = ply:GetShootPos()
                    local tr    = ply:GetEyeTrace()
                    local dist  = (tr.HitPos - pos):Length()
                    local delay = dist/8000
                    
                    tr.filter   = {}
                    table.insert( tr.filter, ents.FindByClass('ph_prop') )
                    table.insert( tr.filter, ply )
                    
                    local shootFX = EffectData()
                    shootFX:SetEntity( ply:GetLPSWeaponEntity() )
                    shootFX:SetOrigin( tr.HitPos )
                    shootFX:SetAttachment(1)
                    util.Effect( "phx_blaster_fire", shootFX)
                    util.Effect( "phx_blaster_muzzle", shootFX)
                    
                    ply:ViewPunch( Angle(math.Rand(-0.2,-0.1) * blaster.Recoil, math.Rand(-0.1,0.1) * blaster.Recoil, 0) )
                    
                    -- Disintegrate, the boom thingy
                    timer.Simple(delay, function()
                        
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
                        
                    end)
                end
            end)
        
        end
    }
    
    --[[
    -- Disabled, not fully implemented yet!
    ["laser"]   = {
        Delay           = 0.01,
        AmmoCount       = -1,
        WorldModel      = Model("models/weapons/w_rocket_launcher.mdl"),
        Type            = "custom",
        Reload          = false,
        
        Function        = function( self, ply )
            
        end
    }, 
    ]]
}