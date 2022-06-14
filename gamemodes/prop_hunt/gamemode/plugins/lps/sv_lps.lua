PHX.LPS.SOUND = {}

function PHX.LPS:CreateSound( tblKey, Directory )

    local files = { "wav", "mp3", "ogg" }
    
    for i=1,#files do
        for _,filename in pairs(file.Find("sound/lps/"..Directory.."/*."..files[i], "GAME")) do
            local sndTab = {}
            local globalSoundFilter = RecipientFilter()
            globalSoundFilter:AddAllPlayers()
            
            sndTab.sound = CreateSound(game.GetWorld(), "lps/"..Directory.."/"..filename, globalSoundFilter)
            sndTab.sound:SetSoundLevel(0)
            sndTab.type = files[i]  -- This is for PHX:SoundDuration, where ogg still doesn't supported.
            sndTab.filename = filename
            table.insert(self.SOUND[tblKey], sndTab)
            -- Add to Resources (if any)
            resource.AddFile("sound/lps/"..Directory.."/"..filename)
        end
    end
    
end

PHX.LPS.SOUND.ALERT = {}
PHX.LPS.SOUND.MUSIC = {}

hook.Add("InitPostEntity", "LPS.CreateSoundHook", function()
    PHX.LPS:CreateSound( "ALERT", "alert" )
    PHX.LPS:CreateSound( "MUSIC", "music" )
end)
 
function PHX.LPS:MusicRecursion()
	if self.SOUND.NEXT ~= {} then
		self.SOUND.CURRENT = self.SOUND.NEXT
		self.SOUND.CURRENT.sound:Play()

		repeat
			self.SOUND.NEXT = self.SOUND.MUSIC[math.random(#self.SOUND.MUSIC)]
		until self.SOUND.NEXT ~= self.SOUND.CURRENT || #self.SOUND.MUSIC <= 1

        -- Warning: SoundDuration is broken when they're hosted on linux/macos, so we'll have to use replacement.
        if self.SOUND.CURRENT.type == "ogg" then
            timer.Simple(SoundDuration("lps/music/" .. self.SOUND.CURRENT.filename), function() self:MusicRecursion() end)
        else
            -- bug: does not return anything
            timer.Simple(PHX:SoundDuration("lps/music/" .. self.SOUND.CURRENT.filename), function() self:MusicRecursion() end)
        end
	end
end

hook.Add("PH_RoundEnd", "LastPropStandingStopSounds", function()
    if PHX.LPS.SOUND.CURRENT and PHX.LPS.SOUND.CURRENT ~= nil then
        PHX.LPS.SOUND.CURRENT.sound:Stop()
        PHX.LPS.SOUND.NEXT = {}
        PHX.LPS.SOUND.CURRENT = {}
    end
end)

function PHX.LPS:TrailColorTranslate( color )
    return self:GetHexColor( color, "lps_trail_color", "#FFFFFF", false )
end

--[[ function lpsSetup()
    if GetConVar("lps_enable"):GetBool() then
        GM.NoPlayerPlayerDamage = false
    else
        GM.NoPlayerPlayerDamage = true
    end
end
lpsSetup()
cvars.AddChangeCallback("lps_enable", lpsSetup()) ]]

hook.Add("PlayerCanPickupWeapon", "LastPropStandingWeaponPickup", function(ply, ent)
    if PHX:GetCVar( "lps_enable" ) and PHX:GetCVar( "lps_weapon_mode" ) == 0 and
        ply:Team() == TEAM_PROPS and 
        GAMEMODE:GetTeamAliveCounts()[TEAM_PROPS] == 1 and 
        ent:GetClass() == PHX.LPS.WEAPON then
		return true
	end
end)

--[[ hook.Add("EntityTakeDamage", "LastPropStandingNoHunterSelfExplode", function(ent, dmginfo)
    if GAMEMODE:InRound() && ent && ent:IsPlayer() && ent:Alive() && ent:Team() == TEAM_HUNTERS && dmginfo:GetAttacker() && dmginfo:GetAttacker():IsPlayer() && dmginfo:GetAttacker():Team() == TEAM_HUNTERS && dmginfo:IsExplosionDamage() then
        return true
    end
end) ]]

--[[ hook.Add("WeaponEquip", "LastPropStandingNoHands", function(wep, ply)
	if PHX:GetCVar( "lps_enable" ) and PHX:GetCVar( "lps_weapon_mode" ) == 0 and ply:Team() == TEAM_PROPS and ply:Alive() then
        ply:GetHands():SetNoDraw( true )    -- don't remove, but just don't draw it.
    end
end) ]]

hook.Add("PlayerInitialSpawn", "LPS.PrepareData", function( ply )
    ply.propNextFire    = 0
    ply.propLPSAmmo     = 0
end)

hook.Add("PlayerSpawn", "LPS.ResetWeaponState", function(ply)
    ply:SetLPSWeaponState( LPS_WEAPON_UNARMED ) -- always reset no matter what.
end)

local function getSpread( val )
    if isnumber(val) then
        return Vector(val, val, 0)
    elseif istable(val) then
        return Vector(math.random(val[1],val[2]), math.random(val[1],val[2]), 0)
    end
    
    return Vector(0,0,0)
end

local function getDamage( val )
    if isstring(val) then
        return GetConVar(val):GetInt()
    elseif isnumber( val ) then
        return val
    end
    
    return 0
end
-- wont shoot?
local function PropFireBullet( ply, cmd, args )
    --if not (IsValid(ply) and not #args == 1) then return end
    if !IsValid(ply) then return end
    if !PHX:GetCVar( "lps_enable" ) then return end
    if !ply:IsLastStanding() then return end
    if ply.propLPSAmmo < 1 then return end
    
    local wepEntity = ply:GetLPSWeaponEntity()
    
    if not wepEntity or wepEntity == NULL then return end
    --local state = tobool(args[1])
    
    local name    = PHX.LPS.WEAPON2.NAME
    local wepdata = PHX.LPS.WEAPON2.DATA
    
    if !name or name == nil or !wepdata or wepdata == nil then
        return
    end
    
    local wepType = wepdata.Type
    
    if wepType == "weapon" then
        if ( ply.propNextFire > CurTime() ) then return end
        
        ply.propNextFire = CurTime() + wepdata.Delay
        
        local att = wepEntity:GetAttachment(1)
        local shootOrg = att.Pos
        local shootAng = ply:EyeAngles()
        local shootDir = shootAng:Forward()
        
        local bullet = {}
            bullet.Num          = wepdata.Num
            bullet.Src          = shootOrg
            bullet.Dir          = shootDir
            bullet.Spread       = getSpread( wepdata.Spread )
            bullet.Tracer       = wepdata.Tracer
            bullet.TracerName   = wepdata.TracerName
            bullet.Force        = wepdata.Force
            bullet.Damage       = wepdata.Damage
            bullet.AmmoType     = wepdata.AmmoType
            bullet.Attacker     = ply
            bullet.IgnoreEntity = ply:GetPlayerPropEntity()
        wepEntity:FireBullets( bullet )
        
        local muzz = EffectData()
        muzz:SetOrigin( shootOrg )
        muzz:SetAngles( shootAng )
        muzz:SetScale( 1.2 )
        util.Effect( "MuzzleEffect", muzz )
        
        wepEntity:EmitSound( wepdata.ShootSound )
        
        if wepdata.AmmoCount > 0 then
            ply.propLPSAmmo = ply.propLPSAmmo - 1
        end
        
    elseif wepType == "custom" then
    
        if ( ply.propNextFire > CurTime() ) then
            if wepdata.Reload then ply:SetLPSWeaponState( LPS_WEAPON_RELOAD ) end
            return
        end
        
        ply.propNextFire = CurTime() + wepdata.Delay
        if wepdata.Reload then ply:SetLPSWeaponState( LPS_WEAPON_READY ) end
        
        -- do the thing!
        wepdata:Function( ply )
        
        if wepdata.AmmoCount > 0 then
            ply.propLPSAmmo = ply.propLPSAmmo - 1
        end
        
        if wepdata.Reload and wepdata.AmmoCount == 0 then
            ply:SetLPSWeaponState( LPS_WEAPON_OUTOFAMMO )
        end
        
    end
    
    
    
end
concommand.Add("prop_shoot", PropFireBullet)

local function RemoveTrail( ply )
    if ply.lps_trail && ply.lps_trail ~= nil then
        ply:RemoveLPSTrail()
    end
    -- ply:RemoveLPSWeaponEntity() -- probably wont be needed, because DeleteOnRemove() is already handled.
    if ply:IsLastStanding() then
        ply:SetLastStanding( false )
    end
    
    ply.propLPSAmmo = 0
end

local function DoPlayerCheck(ply)

    if PHX:GetCVar( "lps_enable" ) and  ply:Team() == TEAM_PROPS then
        
        -- We'll follow from fretta rule, so we use 0.2 for safety check
        timer.Simple(0.2, function()
	        if GAMEMODE:GetTeamAliveCounts()[TEAM_PROPS] == 1 then
                
                for _, pl in pairs(team.GetPlayers(TEAM_PROPS)) do
			        if pl:Alive() then
                        
                        if GetConVar("lps_trail_enable"):GetBool() then
                            local TrailCol = PHX.LPS:TrailColorTranslate( PHX:GetCVar( "lps_trail_color" ) )
                            local TrailTex = PHX:GetCVar( "lps_trail_texture" )
                            
                            pl:CreateLPSTrail( 0, TrailCol, false, 15, 1, 4, 0.125, TrailTex )
                        end
                        
                        --[[ if PHX:GetCVar( "lps_weapon_mode" ) == 1 then
                            PHX.LPS.WEAPON2.NAME,PHX.LPS.WEAPON2.DATA = table.Random( PHX.LPS.WEAPON_NEW )
                            pl.propLPSAmmo = PHX.LPS.WEAPON2.DATA.AmmoCount
                            pl:CreateLPSWeaponEntity( PHX.LPS.WEAPON2.DATA.WorldModel )
                        else
                            if PHX:GetCVar( "lps_weapon" ) == "random" then
                                PHX.LPS.WEAPON = PHX.LPS.WEAPONS[math.random(#PHX.LPS.WEAPONS)]
                            end
                            pl:GetHands():SetNoDraw( true )
                            pl:Give(PHX.LPS.WEAPON)
                            pl:GiveAmmo(120, pl:GetActiveWeapon():GetPrimaryAmmoType(), true)
                        end ]]
                        
                        PHX.LPS.WEAPON2.DATA,PHX.LPS.WEAPON2.NAME = table.Random( PHX.LPS.WEAPON_NEW )
                        pl.propLPSAmmo = PHX.LPS.WEAPON2.DATA.AmmoCount
                        pl:SetLPSWeapon( PHX.LPS.WEAPON2.NAME )
                        pl:CreateLPSWeaponEntity( PHX.LPS.WEAPON2.DATA.WorldModel )
                        pl:SetLastStanding( true )
                        
                        pl:PrintCenter( "LASTPROP_ANNOUNCE", Color(240,72,82) )
                        
						PHX.LPS.SOUND.CURRENT = PHX.LPS.SOUND.ALERT[math.random(#PHX.LPS.SOUND.ALERT)]
						PHX.LPS.SOUND.CURRENT.sound:Play()

						repeat
							PHX.LPS.SOUND.NEXT = PHX.LPS.SOUND.MUSIC[math.random(#PHX.LPS.SOUND.MUSIC)]
						until PHX.LPS.SOUND.NEXT ~= PHX.LPS.SOUND.CURRENT || #PHX.LPS.SOUND.MUSIC <= 1
						timer.Simple(SoundDuration("lps/alert/" .. PHX.LPS.SOUND.CURRENT.filename), function() PHX.LPS:MusicRecursion() end)
						
                        return
			        end
                end
	        
            end
        end)
        
    end
end

hook.Add("PostPlayerDeath", "DeathLastPropStandingTest", function( pl )
    RemoveTrail( pl )
    DoPlayerCheck( pl )
end)
hook.Add("PlayerDisconnected", "DisconnectLastPropStandingTest", function( ply ) RemoveTrail( ply ) end)