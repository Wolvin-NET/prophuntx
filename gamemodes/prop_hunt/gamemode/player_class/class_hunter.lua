-- Create new class
local CLASS = {}


-- Some settings for the class
CLASS.DisplayName			= "Hunter"
CLASS.WalkSpeed 			= 230
CLASS.CrouchedWalkSpeed 	= 0.4
CLASS.RunSpeed				= 290
CLASS.DuckSpeed				= 0.2
CLASS.DrawTeamRing			= false


-- Called by spawn and sets loadout
function CLASS:Loadout(pl)
    pl:GiveAmmo(32, "Buckshot")
    pl:GiveAmmo(255, "SMG1")
    pl:GiveAmmo(12, "357")
    
    pl:Give("weapon_crowbar")
    pl:Give("weapon_shotgun")
    pl:Give("weapon_smg1")
	pl:Give("item_ar2_grenade")
    pl:Give("weapon_357")
	
	local cl_defaultweapon = pl:GetInfo("cl_defaultweapon") 
 	 
 	if pl:HasWeapon(cl_defaultweapon) then 
 		pl:SelectWeapon(cl_defaultweapon)
 	end 
end

-- Called when player spawns with this class
function CLASS:OnSpawn(pl)
	if !pl:IsValid() then return end

	pl:SetupHands()
	pl:SetCustomCollisionCheck(true)
	pl:SetAvoidPlayers(false)
	pl:CrosshairEnable()
	
	pl:SetViewOffset(Vector(0,0,64))
	pl:SetViewOffsetDucked(Vector(0,0,28))

	--local unlock_time = math.Clamp(PHX.CVAR.BlindTime:GetInt() - (CurTime() - GetGlobalFloat("RoundStartTime", 0)), 0, PHX.CVAR.BlindTime:GetInt())
	
	local unlock_time = GetGlobalInt("unBlind_Time", 0)
	
	local unblindfunc = function()
		if pl:IsValid() then
			pl:Blind(false)
		end
	end
	local lockfunc = function()
		if pl:IsValid() then
			pl.Lock(pl)
		end
	end
	local unlockfunc = function()
		if pl:IsValid() then
			pl.UnLock(pl)
		end
	end
	
	if unlock_time > 2 then
		pl:Blind(true)
		
		timer.Simple(unlock_time, unblindfunc)
		
		timer.Simple(2, lockfunc)
		timer.Simple(unlock_time, unlockfunc)
	end
	
end


-- Hands
function CLASS:GetHandsModel()
	if !PHX.CVAR.UseCustomModel:GetBool() then
		return { model = "models/weapons/c_arms_combine.mdl", skin = 1, body = "0100000" }
	end
end


-- Called when a player dies with this class
function CLASS:OnDeath(pl, attacker, dmginfo)
	pl:CreateRagdoll()
	pl:UnLock()
	
	-- Always Reset the ViewOffset
	pl:SetViewOffset(Vector(0,0,64))
	pl:SetViewOffsetDucked(Vector(0,0,28))
	
	-- Spawn Devil Ball
	local pos = pl:GetPos()
	if PHX.CVAR.UseDevilCrystal:GetBool() then
		if math.random() < 0.7 then --70% chance.
			local dropent = ents.Create("ph_devilball")
			dropent:SetPos(Vector(pos.x, pos.y, pos.z + 16)) -- to make sure the Devil Ball didn't fall underground.
			dropent:SetAngles(Angle(0,0,0))
			dropent:Spawn()
		end
	end
end


-- Register
player_class.Register("Hunter", CLASS)
