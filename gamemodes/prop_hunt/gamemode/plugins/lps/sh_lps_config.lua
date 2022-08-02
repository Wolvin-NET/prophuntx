-- Obsolete: Weapon class names to choose from (if using random weapons for Last Prop Standing):
-- PHX.LPS.WEAPONS = { "weapon_357" } -- Obsolete, no longer used

function PHX.LPS:GetHexColor( color, convar, isRainbow, alpha )
    
    if isRainbow == nil then isRainbow = false end
    if alpha == nil then alpha = 255 end
    
    local ref = "[LPS WARNING] Convar `%s`%s is a valid hex code, using default color: %s"
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
        AmmoCount       = 500,  -- "lps_ammocount_airboat"
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
        TracerName 	    = "AirboatGunHeavyTracer", --??
        Force		    = 3,
        AmmoType        = "AirboatGun",
        Damage		    = 7, -- "lps_wepdamage_airboat"
    },
    
    ["shotgun"]    =  {
        Delay           = 1,
        AmmoCount       = 150, -- "lps_ammocount_shotgun"
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
        Damage		    = 6, -- "lps_wepdamage_shotgun_pelet"
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
                    local _,plmaxs = ply:GetHull() --Todo: OBBMaxs
                    local trace   = {}
                    trace          = GAMEMODE.ViewCam:CamColEnabled( ply:EyePos(), ply:EyeAngles(), trace, "start", "endpos", 32768/2, 32768, 32768/2, plmaxs.z ) --ply:GetEyeTrace()
                    trace.filter   = { ply:GetPlayerPropEntity() }
                    
                    local tr = util.TraceLine(trace)
                    
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
        AmmoCount       = 60,   -- "lps_ammocount_rocket"
        WorldModel      = Model("models/weapons/w_phx_rpg.mdl"),
        Type            = "custom",
        Reload          = true,
		
		FixAngles		= Angle(0,180,0),
        
        Function        = function( self, ply )
            
            local rpg = {}
            rpg.FireSound  = Sound("Weapon_RPG.Single")
            rpg.Damage     = 80 --PHX:GetCVar( "lps_wepdamage_rocket" ) or 80
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
            util.Effect( "ChopperMuzzleFlash", FireFX )
			
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
            
            local _,plmaxs = ply:GetHull() --Todo: OBBMaxs
            
            local trace = {}
            trace          = GAMEMODE.ViewCam:CamColEnabled( ply:EyePos(), ply:EyeAngles(), trace, "start", "endpos", 32768/2, 32768, 32768/2, plmaxs.z )
            trace.filter   = { ply:GetPlayerPropEntity() }            
            local tr = util.TraceLine(trace)
			local Forward = tr.Normal -- ply:EyeAngles():Forward()
            
            if SERVER then
                local r = ents.Create("rpg_missile")
                if (IsValid(r)) then
                    r:SetPos( ShootPos + Forward * 8 ) --( ply:GetShootPos() + Forward * 16 )
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
        Delay           = 0.1,
        AmmoCount       = -1,
        WorldModel      = Model("models/weapons/w_irifle.mdl"),
        Type            = "custom",
        Reload          = false,
        
        FixAngles       = Angle(0,180,0),
        FixPos          = Vector(0,10,0),
        
        Function        = function( self, ply )
            
            --[[ if SERVER then
                if (!ply.LPSLaserFireSound or ply.LPSLaserFireSound == nil) then
                    
                    local Recip = RecipientFilter()
                    Recip:AddAllPlayers()
                    ply.LPSLaserFireSound   = CreateSound( ply, "lps/laser_loop.wav", Recip )
                    
                end
            end ]]
        
            local Damage     = 3 --PHX:GetCVar( "lps_wepdamage_laser" ) or 3
            
            local WepEnt = ply:GetLPSWeaponEntity()
            --local ShootPos = WepEnt:GetAttachment( 1 ).Pos
            
            local _,plmaxs = ply:GetHull() --Todo: OBBMaxs
            
            local trace = {}
            trace          = GAMEMODE.ViewCam:CamColEnabled( ply:EyePos(), ply:EyeAngles(), trace, "start", "endpos", 32768/2, 32768, 32768/2, plmaxs.z )
            trace.filter   = { ply:GetPlayerPropEntity() }
            
            ply:LagCompensation(true)
            local tr = util.TraceLine(trace)
            ply:LagCompensation(false)
            
            if SERVER then
                if tr.Entity and tr.Entity:IsValid() then
                    if tr.Entity:IsPlayer() and tr.Entity:Team() == TEAM_HUNTERS and 
                    tr.Entity:Alive() and tr.Entity:Health() > 0 then
                    
                    tr.Entity:TakeDamage( Damage, ply, WepEnt )
                    end
                end
            end
            
            local HitMark = EffectData()
            HitMark:SetOrigin(tr.HitPos)
            HitMark:SetNormal(tr.HitNormal)
            util.Effect("AR2Impact", HitMark)
        end
    },
}

-- Laser Hook Helper
if CLIENT then
    local LaserTexture  = Material( "trails/laser" )
    local LaserColor    = Color( 250, 0, 0, 255 )
    
    -- Currently it's the only proper way to show laser
    -- if Anyone had better solution, please let me know!
    hook.Add("RenderScreenspaceEffects", "LPS.LaserBeamDraw", function()    
        for _,v in pairs(team.GetPlayers(TEAM_PROPS)) do
            if v:Alive() and v:IsLastStanding() and GetGlobalInt("InRound", false) then
                if v:LPSFiringStatus() then                    
                    local _,plmaxs = v:GetHull()
                    local trace = GAMEMODE.ViewCam:CamColEnabled( v:EyePos(), v:EyeAngles(), {}, "start", "endpos", 32768/2, 32768, 32768/2, plmaxs.z )
                    trace.filter = v:GetPlayerPropEntity()
                    local tr = util.TraceLine(trace)
                    
                    local ent = v:GetLPSWeaponEntity()
                    if IsValid(ent) then
                        local att = ent:GetAttachment(1)
                        local start = tr.StartPos
                        if (att) then start = att.Pos end
                        local endpos = tr.HitPos
                        
                        cam.Start3D()
                            render.SetMaterial( LaserTexture )        
                            render.DrawBeam( start, endpos, 32, 1, 0, LaserColor )
                        cam.End3D()
                    end
                end
            end
        end
    end)
end

--[[ if SERVER then
    hook.Add("PlayerTick", "LPS.LaserSoundControl", function( ply, mv )
        if (PHX:GetCVar( "lps_enable" ) and (ply.LPSLaserFireSound and ply.LPSLaserFireSound ~= nil) and
            ply:Team() == TEAM_PROPS and ply:IsLastStanding() and ply:Alive() and GetGlobalInt("InRound", false) and !ply:InVehicle()) then
            if !ply:LPSIsAllowedToFire() then
                ply.LPSLaserFireSound:Stop()
            else
                ply.LPSLaserFireSound:Play()
            end
        end
    end)

    local function ClearLPSFireSound( ply )
        if ply.LPSLaserFireSound and ply.LPSLaserFireSound ~= nil then
            ply.LPSLaserFireSound:Stop()
        end
        ply.LPSLaserFireSound = nil
    end

    hook.Add("PostPlayerDeath", "LPS.LaserSoundControl.Death", ClearLPSFireSound)
    hook.Add("PlayerSpawn", "LPS.LaserSoundControl.Spawn", ClearLPSFireSound)
end ]]
-- End of Laser Hook Helper

hook.Add("Initialize", "LPS.Init_or_ExternalWeaponEntry", function()
    --[[
        Usage: list.Set("LPS.XCustomWeapon", "weapon name", { < LPS bullet structure > })
    ]]
    for name,data in pairs(list.Get("LPS.XCustomWeapon")) do
        if (!data or data == nil) or table.IsEmpty(data) then
            PHX.VerboseMsg("[LPS] Weapon data entry of [".. name .."] is empty! Skipping...")
        else
            PHX.VerboseMsg("[LPS] Adding custom weapon entry of: " .. name)
            PHX.LPS.WEAPON_NEW[name] = data
        end
    end
end)

concommand.Add("lps_weapon_list", function(ply)
    if (game.IsDedicated() and ply == NULL) or ply:CheckUserGroup() or ply:IsAdmin() or ply:IsSuperAdmin() then
		local weps = table.GetKeys( PHX.LPS.WEAPON_NEW )
		print("[PHX LPS] Showing all available LPS weapons:")
		for _,v in pairs(weps) do
			print("- name: ".. v .. ", type: ".. PHX.LPS.WEAPON_NEW[v].Type)
		end	
	else
        print("[PHX LPS] Sorry, you can't access this command.")
    end
end, nil, "List Weapon Info for Last Prop Standing.")