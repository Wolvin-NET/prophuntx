PHX.LPS.SOUND = {}
PHX.LPS.SOUND.ALERT = {}
PHX.LPS.SOUND.MUSIC = {}
PHX.LPS.SOUND.CURRENT = {}
PHX.LPS.SOUND.LASTMUSIC = {}

local strMusicTimer     = "tmr_LPSMusic"
local strAlertTimer     = "tmr_AlertSnd"
-- Allow only LPS after hunters are unblinded. Set 'true' once the hook is called.
local LPSAllowed = false

function PHX.LPS:CreateSound( ply )

    if IsValid( ply ) and ply:Alive() and ply:Team() == TEAM_PROPS then

        self:RandomizeMusic()

        local filter = RecipientFilter()
        for _,v in pairs( player.GetAll() ) do
            local listenMusic = v:GetInfoNum("lps_cl_listen_music", 0)
            if tobool(listenMusic) then
                filter:AddPlayer( v )
            end
        end
        --filter:AddAllPlayers()
        
        local snd = CreateSound( ply, self.SOUND.CURRENT.sound, filter )
        self.SOUND.CURRENT.sndObj = snd
        self.SOUND.CURRENT.Owner = ply
        snd:SetSoundLevel(0)
        snd:PlayEx(0.95,100)
        
        timer.Create( strMusicTimer, self.SOUND.CURRENT.Len + 0.2, 1, function()
            self:CreateSound( ply )
        end )
        
    end
    
end

function PHX.LPS:AddSound( tblKey, Directory )

    local files = { "wav", "mp3", "ogg" }
    
    for i=1,#files do
        for _,filename in pairs(file.Find("sound/lps/"..Directory.."/*."..files[i], "GAME")) do
            local t = {}
            t.sound    = "lps/"..Directory.."/"..filename
            if files[i] == "ogg" then
                t.Len = SoundDuration( "lps/"..Directory.."/"..filename )
            else
                t.Len = PHX:SoundDuration( "lps/"..Directory.."/"..filename )
            end
            t.filename  = filename  -- maybe unused, but just in case if you need it.
            t.ext       = files[i]  -- maybe unused, but just in case if you need it.
            table.insert(self.SOUND[tblKey], t)
            
            -- Add to Resources, if any.
            resource.AddFile("sound/lps/"..Directory.."/"..filename)
        end
    end

end

hook.Add("Initialize", "LPS.CreateSoundHook", function()
    PHX.LPS:AddSound( "ALERT", "alert" )
    PHX.LPS:AddSound( "MUSIC", "music" )
end)

function PHX.LPS:RandomizeMusic()
    self.SOUND.CURRENT = self:GetMusic()
end

function PHX.LPS:GetAlertSound()
    local get   = self.SOUND.ALERT[math.random(1, #self.SOUND.ALERT)]
    return get
end

function PHX.LPS:GetMusic()

    local get
    
    repeat
        get = self.SOUND.MUSIC[math.random(1, #self.SOUND.MUSIC)]
    until get ~= self.SOUND.LASTMUSIC
    
    self.SOUND.LASTMUSIC = get
    return get
end

function PHX.LPS:TrailColorTranslate( color )
    local c = self:GetHexColor( color, "lps_trail_color", false )
    return Color(c.R, c.G, c.B)
end

local function ResetPlayerStat( ply )
    ply.propLPSAmmo     = 0
    ply.propNextFire    = 0
    ply:SetLPSWeapon( "No Weapon" )
    if ply:IsLastStanding() then ply:SetLastStanding( false ) end
    
    -- In case of disconnect
    if PHX.LPS.SOUND.CURRENT and PHX.LPS.SOUND.CURRENT ~= nil and 
    PHX.LPS.SOUND.CURRENT.Owner and PHX.LPS.SOUND.CURRENT.Owner ~= nil and 
    PHX.LPS.SOUND.CURRENT.sndObj and PHX.LPS.SOUND.CURRENT.sndObj then
        if PHX.LPS.SOUND.CURRENT.Owner == ply then
            PHX.LPS.SOUND.CURRENT.sndObj:Stop()
        end
    end
    
    -- Client side indicator, they are networked.
    ply:SetLPSWeaponState( LPS_WEAPON_UNARMED )
end

hook.Add("PlayerInitialSpawn", "LPS.PrepareData", function( ply )
    ply.propNextFire    = 0
    ResetPlayerStat( ply )
end)

-- In case an admin tries to respawn when the Event is still running, this needs to be reset as well.
hook.Add("PlayerSpawn", "LPS.ResetWeaponState", function(ply)
    ResetPlayerStat( ply )
end)

local function StopMusic()

    -- Stop Music Background & Timer.
    if PHX.LPS.SOUND.CURRENT and PHX.LPS.SOUND.CURRENT ~= nil and 
        PHX.LPS.SOUND.CURRENT.sndObj and PHX.LPS.SOUND.CURRENT.sndObj ~= nil then
        PHX.LPS.SOUND.CURRENT.sndObj:Stop()
    end
    
    if timer.Exists(strAlertTimer) then timer.Remove(strAlertTimer) end
    if timer.Exists(strMusicTimer) then timer.Remove(strMusicTimer) end

end

hook.Add("PH_RoundEnd", "LPS.RER_ResetWeaponState", function()
    LPSAllowed = false
    for _,ply in pairs( player.GetAll() ) do
        ResetPlayerStat( ply )
    end
    
    StopMusic()
end)

local function getSpread( val )
    if isnumber(val) then
        return Vector(val, val, 0)
    elseif istable(val) then
        return Vector(math.random(val[1],val[2]), math.random(val[1],val[2]), 0)
    end
    
    return Vector(0,0,0)
end

local function getConValue( val )
    if isstring(val) then
        if ConVarExists( val ) then
            return GetConVar(val):GetInt()
        else
            print("[LPS] WARNING: Damage ConVar `".. val.."` was not found! Reverting to 1!")
            return 1
        end
    elseif isnumber( val ) then
        return val
    end
    
    return 1
end

local function PropFireBullet( ply, cmd, args )
    if !IsValid(ply) and ply:Team() ~= TEAM_PROPS and !ply:Alive() then return end
    if !PHX:GetCVar( "lps_enable" ) then return end
    if !ply:IsLastStanding() then return end
    if ply.propLPSAmmo == 0 then return end
    
    -- im sorry i know this is really not optimized...
    local plmins,plmaxs = ply:GetHull()
    local qt = GAMEMODE.ViewCam:CommonCamCollEnabledView( ply:EyePos(), ply:EyeAngles(), plmaxs.z )
    qt.filter = { ply:GetPlayerPropEntity() }
    local trx = util.TraceLine(qt)
    if trx.Entity and trx.Entity:IsValid() and PHX:IsUsablePropEntity( trx.Entity:GetClass() ) then
        -- don't shoot if you close to selectable props
        return
    end
    
    local name    = PHX.LPS.WEAPON2.NAME
    local wepdata = PHX.LPS.WEAPON2.DATA
    if !name or name == nil or !wepdata or wepdata == nil then return end
    
    local wepEntity = ply:GetLPSWeaponEntity()
    if !wepEntity or wepEntity == NULL then return end
    
    local wepType = wepdata.Type
    if wepType == "weapon" then
        if ( ply.propNextFire > CurTime() ) then return end
        ply.propNextFire = CurTime() + wepdata.Delay
        
        ply:SetLPSAmmoCount( ply.propLPSAmmo )
        
        local att = wepEntity:GetAttachment(1)
        local shootOrg = att.Pos
        local shootAng = ply:EyeAngles()
        local shootDir = shootAng:Forward()
        --[[]]--
        local eyeTrace = {}
        local aimTrace = {}
        local eyeTrace  = GAMEMODE.ViewCam:CamColEnabled( ply:EyePos(), shootAng, trace, "start", "endpos", 32768/2, 32768, 32768/2, plmaxs.z )
        eyeTrace.filter = { ply:GetPlayerPropEntity() }
        aimTrace.filter = { ply:GetPlayerPropEntity() }
        local eyeResult = util.TraceLine(eyeTrace)
        aimTrace.start  = shootOrg
        aimTrace.endpos = eyeResult.HitPos
        local aimTraceResult = util.TraceLine( aimTrace )
        --[[]]--
        local AmmoCount = getConValue( wepdata.AmmoCount )
        local bullet = {}
            bullet.Num          = wepdata.Num
            bullet.Src          = shootOrg
            bullet.Dir          = aimTraceResult.Normal --shootDir
            bullet.Spread       = getSpread( wepdata.Spread )
            bullet.Tracer       = wepdata.Tracer
            bullet.TracerName   = wepdata.TracerName
            bullet.Force        = wepdata.Force
            bullet.Damage       = getConValue( wepdata.Damage )
            bullet.AmmoType     = wepdata.AmmoType
            bullet.Attacker     = ply
            bullet.IgnoreEntity = ply:GetPlayerPropEntity()
            bullet.Callback = function(atk,_,cDamage)
                cDamage:SetInflictor(atk:GetLPSWeaponEntity())
            end
        wepEntity:FireBullets( bullet )
        
        local muzz = EffectData()
        muzz:SetOrigin( shootOrg )
        muzz:SetAngles( shootAng )
        muzz:SetScale( 1.2 )
        util.Effect( "MuzzleEffect", muzz )
        
        wepEntity:EmitSound( wepdata.ShootSound )
        local viewpunchAng = wepdata.ViewPunch
        ply:ViewPunch( Angle( math.random(viewpunchAng.x[1],viewpunchAng.x[2]), math.random(viewpunchAng.y[1],viewpunchAng.y[2]), 0 ) )
        
        if AmmoCount > 0 then
            ply.propLPSAmmo = ply.propLPSAmmo - 1
            ply:SetLPSAmmoCount( ply.propLPSAmmo )
        end
        
        if ply.propLPSAmmo == 0 then
            ply:SetLPSWeaponState( LPS_WEAPON_OUTOFAMMO )
        end
        
    elseif wepType == "custom" then
    
        if ( ply.propNextFire > CurTime() ) then
            if wepdata.Reload then 
                ply:SetLPSWeaponState( LPS_WEAPON_RELOAD )
                return
            else
                ply:SetLPSWeaponState( LPS_WEAPON_READY )
            end
        end
        
        ply.propNextFire = CurTime() + wepdata.Delay
        
        -- do the thing!
        wepdata:Function( ply )
        
        local AmmoCount = getConValue( wepdata.AmmoCount )
        if AmmoCount > 0 then
            ply.propLPSAmmo = ply.propLPSAmmo - 1
        end
        
        if ply.propLPSAmmo == 0 then
            ply:SetLPSWeaponState( LPS_WEAPON_OUTOFAMMO )
        end
        
    end
end
concommand.Add("prop_shoot", PropFireBullet)

hook.Add("PostCleanupMap", "LPS.CheckRespawnUnblind", function() LPSAllowed = false end)
hook.Add("PH_BlindTimeOver","LPS.BlindTimeOverAllow", function() LPSAllowed = true end)

local function DoPlayerCheck(ply)

    if PHX:GetCVar( "lps_enable" ) and ply:Team() == TEAM_PROPS then
        
        -- Gives delay in case hunter throws a grenade or something or 2 player prop were killed simultaneously
        timer.Simple(0.5, function()
	        if team.NumPlayers(TEAM_PROPS) >= PHX:GetCVar( "lps_mins_prop_players" ) and LPSAllowed and GAMEMODE:GetTeamAliveCounts()[TEAM_PROPS] == 1 and GAMEMODE:InRound() then
                
                local stand = NULL
                
                -- Clear previously played song, if any.
                StopMusic()
                
                for _, pl in pairs(team.GetPlayers(TEAM_PROPS)) do
			        if pl:Alive() and (not pl:IsLastStanding()) then
                        
                        -- Remove previously weapon attached to player, if any.
                        if pl:HasLPSWeapon() then pl:RemoveLPSWeaponEntity() end
                        
                        local SelWep = PHX:GetCVar( "lps_weapon" )
                        if SelWep == "random" then
                            PHX.LPS.WEAPON2.DATA,PHX.LPS.WEAPON2.NAME = table.Random( PHX.LPS.WEAPON_NEW )
                        else
                            local datacheck = PHX.LPS.WEAPON_NEW[ SelWep ]
                            if !datacheck or datacheck == nil then
                                print("[LPS] WARNING: Weapon data for " .. SelWep .. " was not found in table. Randomizing weapon instead!!")
                                PHX.LPS.WEAPON2.DATA,PHX.LPS.WEAPON2.NAME = table.Random( PHX.LPS.WEAPON_NEW )
                            else
                                PHX.LPS.WEAPON2.DATA = datacheck
                                PHX.LPS.WEAPON2.NAME = SelWep
                            end
                        end
                        pl.propLPSAmmo = getConValue( PHX.LPS.WEAPON2.DATA.AmmoCount )
                        
                        pl:SetLPSAmmoCount( pl.propLPSAmmo )
                        pl:SetLPSWeapon( PHX.LPS.WEAPON2.NAME )
                        pl:CreateLPSWeaponEntity( PHX.LPS.WEAPON2.DATA.WorldModel, PHX.LPS.WEAPON2.DATA.FixAngles )
                        pl:SetLastStanding( true )
                        pl:SetLPSWeaponState( LPS_WEAPON_READY )
                        
                        pl:PrintCenter( "LASTPROP_ANNOUNCE", Color(240,72,82) )
                        
                        if PHX:GetCVar("lps_trail_enable") then
                            local TrailCol = PHX.LPS:TrailColorTranslate( PHX:GetCVar( "lps_trail_color" ) )
                            local TrailTex = PHX:GetCVar( "lps_trail_texture" )
                            
                            if !file.Exists("materials/" .. TrailTex .. ".vmt", "GAME") then
                                print("Texture file for creating Trail: '" .. TrailTex .. "' was not found! Reverting back to default!!")
                                TrailTex = "trails/laser"
                            end
                            
                            pl:CreateLPSTrail( 0, TrailCol, false, 15, 1, 4, 0.125, TrailTex )
                        end
                        
                        stand = pl
			        end
                end

                for _,p in pairs(player.GetAll()) do                    
                    if p:IsLastStanding() then
                        continue
                    else
                        p:PrintCenter( "LASTPROP_ANNOUNCE_ALL", Color(180,230,30) )
                        p:PHXNotify( "LASTPROP_ANNOUNCE_ALL", "ERROR", 4, true )
                    end
                end
                
                local AlertSnd = PHX.LPS:GetAlertSound()
                local world = game.GetWorld()
                world:EmitSound( AlertSnd.sound, 0, 100, 0.8, CHAN_STATIC )
                
				if PHX:GetCVar( "lps_enable_music" ) then
					timer.Create(strAlertTimer, AlertSnd.Len, 1, function() PHX.LPS:CreateSound( stand ) end)
				end
                
            end
        end)
        
    end
end

hook.Add("PostPlayerDeath", "LPS.DoCheckDeath", function( ply )
    ResetPlayerStat( ply )
    DoPlayerCheck( ply )
end)
hook.Add("PlayerDisconnected", "LPS.DisconnectLPS", function( ply ) 
    ResetPlayerStat( ply )
    DoPlayerCheck( ply )
end)