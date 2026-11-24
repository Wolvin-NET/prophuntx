local CLASS = {}

CLASS.DisplayName			= "Hunter"
CLASS.WalkSpeed 			= 230
CLASS.CrouchedWalkSpeed 	= 0.4
CLASS.RunSpeed				= 290
CLASS.DuckSpeed				= 0.2
CLASS.DrawTeamRing			= false

function CLASS:StartLoadOut( pl )
    if !pl:Alive() then return end
	if (pl.PHXHasLoadout) then return end
	
	local override = hook.Run("PH_OnHunterLoadOut", pl)
	if (override) then return end

    pl:GiveAmmo(32, "Buckshot")
    pl:GiveAmmo(255, "SMG1")
    pl:GiveAmmo(12, "357")
    
    pl:Give("weapon_crowbar")
    pl:Give("weapon_shotgun")
    pl:Give("weapon_smg1")
    pl:Give("weapon_357")
	
    -- Give grenades if "Give Grenade near round End time" feature is disabled
	if (not PHX:GetCVar( "ph_give_grenade_near_roundend" )) then
        local numGrenade = PHX:GetCVar( "ph_smggrenadecounts" ) or 1
        pl:SetAmmo(numGrenade, "SMG1_Grenade")
    end
	
	local cl_defaultweapon = pl:GetInfo("cl_defaultweapon") 
 	 
 	if pl:HasWeapon(cl_defaultweapon) then 
 		pl:SelectWeapon(cl_defaultweapon)
	else
		if pl:HasWeapon("weapon_smg1") then pl:SelectWeapon("weapon_smg1") end
 	end
end

function CLASS:ControlPlayer( ply, isLock, TimerID )
	
    if IsValid( ply ) then
    
        if isLock and PHX:IsBlindStatus() then
            ply:Lock()
            return
        end
    
        ply:Blind(false)
        ply:UnLock()
		
        self:StartLoadOut( ply )
        
    end
end

-- Called when player spawns with this class
function CLASS:OnSpawn(pl)
	if !pl:IsValid() then return end

	pl:SetupHands()
	pl:SetCustomCollisionCheck(true)
	pl:SetAvoidPlayers(false)
	pl:CrosshairEnable()
	
    pl:PHResetView()
	pl:PHSetColor()
    
    -- Allow respawn without being blinded when the blind state is false.
	-- Also immediately give weapons.
    if !PHX:IsBlindStatus() then
		self:StartLoadOut( pl )
		pl.PHXHasLoadout = true
		return
	end
	
	local unlock_time = GetGlobalInt("unBlind_Time", 0)
	if unlock_time > 2 then
		local TimerID = "tmr.hunterUnblind:"..pl:EntIndex()
		pl.TimerBlindID = TimerID
		pl:Blind(true)
		if !pl._LoadOutUnblind then
			pl._LoadOutUnblind = function( pl ) self:StartLoadOut( pl ) end
		end
		timer.Simple(1, function() self:ControlPlayer( pl, true, TimerID ) end)
		timer.Create( TimerID, unlock_time, 1, function() 
			self:ControlPlayer( pl, false, TimerID ); 
			if IsValid(pl) then pl.PHXHasLoadout = true; end
		end )
	end
	
end


-- Hands
function CLASS:GetHandsModel()
	if !PHX:GetCVar( "ph_use_custom_plmodel" ) then
		return { model = "models/weapons/c_arms_combine.mdl", skin = 1, body = "0100000" }
	end
end

 
-- Called when a player dies with this class
function CLASS:OnDeath(pl, attacker, dmginfo)
    timer.Remove( "tmr.hunterUnblind:"..pl:EntIndex() ) -- force remove timer.
	pl.PHXHasLoadout = false
	pl.TimerBlindID = nil
	
	pl:CreateRagdoll()
    pl:Blind(false)
	pl:UnLock()
    pl:PHResetView() -- Always Reset the ViewOffset
	
	-- Spawn Devil Ball
	local pos = pl:GetPos()
	if PHX:GetCVar( "ph_enable_devil_balls" ) and GAMEMODE:InRound() then
        local dropent = ents.Create("ph_devilball")
        dropent:SetPos(Vector(pos.x, pos.y, pos.z + 16)) -- Don't spawn Devil Ball underground.
        dropent:SetAngles(Angle(0,0,0))
        dropent:Spawn()
	end
end


-- Register
player_class.Register("Hunter", CLASS)
