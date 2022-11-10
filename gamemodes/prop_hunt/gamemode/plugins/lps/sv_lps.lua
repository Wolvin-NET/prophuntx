PHX.LPS.SOUND = {}
PHX.LPS.SOUND.ALERT = {}
PHX.LPS.SOUND.MUSIC = {}
PHX.LPS.SOUND.CURRENT = {}
PHX.LPS.SOUND.LASTMUSIC = {}

local strMusicTimer     = "tmr_LPSMusic"
local strAlertTimer     = "tmr_AlertSnd"
-- Allow only LPS after hunters are unblinded. Set 'true' once the hook is called.
local LPSAllowed = false

PHX.LPS.ROUND_LEFT = 1

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
    ply:SetLPSWeapon( "No Weapon" )
    if ply:IsLastStanding() then 
        ply:SetLastStanding( false )
        SetGlobalBool("LPS.InLastPropStanding", false)
    end
    
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

-- Hooks
hook.Add("Initialize", "LPS.CreateSoundHook", function()
    PHX.LPS:AddSound( "ALERT", "alert" )
    PHX.LPS:AddSound( "MUSIC", "music" )
end)

hook.Add("PlayerCanPickupWeapon", "LPS.GiveDummyWeapon", function( ply, wep )
    if ply:Team() == TEAM_PROPS and ply:Alive() and ply:IsLastStanding() and GetGlobalBool( "InRound", false ) then
        if ( ply:HasWeapon( wep:GetClass() ) ) then return false end
        if wep:GetClass() == PHX.LPS.DUMMYWEAPON then return true end
    end
end)

hook.Add("PlayerInitialSpawn", "LPS.PrepareData", function( ply )
    ResetPlayerStat( ply )
end)

-- In case an admin tries to respawn when the Event is still running, this needs to be reset as well.
hook.Add("PlayerSpawn", "LPS.ResetWeaponState", function(ply)
    ResetPlayerStat( ply )
end)
-- End of Hooks

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
    for _,ply in ipairs( player.GetAll() ) do
        ResetPlayerStat( ply )
    end
    
    StopMusic()
end)
hook.Add("PostCleanupMap", "LPS.CheckRespawnUnblind", function() LPSAllowed = false end)
hook.Add("PH_BlindTimeOver","LPS.BlindTimeOverAllow", function() LPSAllowed = true end)

local function DoPlayerCheck(ply)

    if PHX:GetCVar( "lps_enable" ) and ply:Team() == TEAM_PROPS then
        
        -- Gives delay in case hunter throws a grenade or something or 2 player prop were killed simultaneously
        timer.Simple(0.5, function()
	        if team.NumPlayers(TEAM_PROPS) >= PHX:GetCVar( "lps_mins_prop_players" ) and LPSAllowed and GAMEMODE:GetTeamAliveCounts()[TEAM_PROPS] == 1 and GAMEMODE:InRound() and (not GetGlobalBool("LPS.InLastPropStanding", false)) then
				
				local RN = GetGlobalInt( "RoundNumber", 0 )
				local XR = PHX:GetCVar( "lps_start_every_x_rounds" )
				
				if PHX:GetCVar( "lps_start_random" ) then
					if math.random(0,1) == 0 then 
						return
					end
				elseif PHX:GetCVar( "lps_start_delayed_rounds" ) then
					if PHX.LPS.ROUND_LEFT == RN then 
						PHX.LPS.ROUND_LEFT = RN + XR
						-- continue.
					else
						return
					end
				end
                
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
                        local ammo = util.LPSgetConValue( PHX.LPS.WEAPON2.DATA.AmmoCount )
                        pl:SetLPSAmmoCount( ammo )
                        pl:SetLPSWeapon( PHX.LPS.WEAPON2.NAME )
                        pl:CreateLPSWeaponEntity( PHX.LPS.WEAPON2.DATA.WorldModel, PHX.LPS.WEAPON2.DATA.FixAngles, PHX.LPS.WEAPON2.DATA.FixPos )
                        pl:SetLastStanding( true )
                        timer.Simple(0, function() pl:Give( PHX.LPS.DUMMYWEAPON ) end) -- Give the dummy weapon. We'll give it on the next frame.
                        pl:SetLPSWeaponState( LPS_WEAPON_READY )
                        
                        -- Health & Armor Options
                        if PHX:GetCVar( "lps_use_normal_health" ) then pl:SetHealthProp(100) end
                        if PHX:GetCVar( "ph_allow_armor" ) and PHX:GetCVar( "lps_use_armor" ) then pl:SetArmor(100) end
                        
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
				
				SetGlobalBool("LPS.InLastPropStanding", true) -- for Think
				hook.Call( "PHInLastPropStanding", nil, pl, PHX.LPS.WEAPON2.NAME, PHX.LPS.WEAPON2.DATA ) -- for Something you need to "hook.Add" it.

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