AddCSLuaFile()

local player_manager = player_manager

DEFINE_BASECLASS( "base_anim" )

ENT.PrintName   = "Prop Entity"
ENT.Author      = "Wolvindra-Vinzuerio"
ENT.Information	= "A prop entity for Prop Hunt: X"
ENT.Category    = ""
ENT.Editable    = true
ENT.Spawnable   = true
ENT.AdminOnly   = false
ENT.RenderGroup = RENDERGROUP_BOTH

ENT.PropAngle   	= angle_zero
ENT.PropPosition  	= vector_origin
ENT.DefaultColor 	= Vector(1,1,1)
ENT.FallBackColor	= Vector( 62 / 255, 88 / 255, 106 / 255 ) --lua/matproxy/player_color.lua

function ENT:SetupDataTables() 
	self:NetworkVar( "Angle", 0, "RotationAngle" )
    self:NetworkVar( "Vector", 0, "EntityColor" )
	self:NetworkVar( "Bool", 0, "EntColorEnabled" )
    
    if SERVER then
        self:SetEntityColor( self.DefaultColor )
    end
    
end

function ENT:Initialize()
	if SERVER then
		self:SetModel("models/player/kleiner.mdl")
		self:SetLagCompensated(true)
		self:SetMoveType(MOVETYPE_NONE)
		self:SetEntColorEnabled( true )

		self.health = 100
	end
    
    self.DefaultColor = util.ColorToVector( team.GetColor(TEAM_PROPS) )
end

if CLIENT then
	function ENT:Draw()
		self:DrawModel()
	end
end

ENT.GetPlayerColor = function( self )

	if self:GetEntColorEnabled() then

		local state = GetGlobalBool( "ph_enable_prop_player_color" , false )
		if state then
			return self:GetEntityColor()
		else
			return self.DefaultColor
		end
		
	else
	
		return self.FallBackColor
	
	end
	
end

function ENT:CalcRotation( ply, pos, ang, bLock )
    local min       = self:OBBMins()
    local info      = ply:GetInfo("cl_playermodel")
	local rotMode   = GetGlobalBool( "ph_exp_rot_pitch", false )
    local TranslatedModel = player_manager.TranslatePlayerModel( info )
    
	local z  
    if !bLock then
		if rotMode and ply:HasPropPitchRotAllowed() then
            if ang.p >= -90 and ang.p <= 90 then self.PropAngle = ang end
            self:SetAngles( self.PropAngle )
            z = (( min.x - min.z ) * (( self.PropAngle.p < 0 and self.PropAngle.p * -1 or self.PropAngle.p) / 90 ) + min.z )
        else 
            self:SetAngles( ang )
            z = min.z
        end
        self.PropPosition = Vector( 0, 0, z );
    end
    
	local posx      = pos - self.PropPosition
    local plyModel  = string.lower( self:GetModel() )
    if (info and info ~= nil) and plyModel == "models/player/kleiner.mdl" or plyModel == TranslatedModel then
        posx = pos
    end
	
	self:SetPos( posx )
end
	
-- Prop Movement and Rotation
function ENT:Think()    
    local pl = self:GetOwner()
    if IsValid(pl) && pl:Alive() then
        local pos = pl:GetPos()
        local ang = pl:EyeAngles()
        local lockstate = pl:GetPlayerLockedRot()
        
		if GetGlobalBool( "ph_exp_rot_pitch", false ) and pl:HasPropPitchRotAllowed() then
			self:SetRotationAngle( Angle( ang.p, ang.y, 0 ) )
		else
			-- switch back to Classic "Yaw" rotation
			self:SetRotationAngle( Angle( 0, ang.y, 0 ) )
		end
        self:CalcRotation( pl, pos, self:GetRotationAngle(), lockstate )
    end
    
    if SERVER then
        self:NextThink( CurTime() )
    elseif CLIENT then
        self:SetNextClientThink( CurTime() )
    end
    return true
    
end

if SERVER then
	
	-- Transmit update
	function ENT:UpdateTransmitState()
		return TRANSMIT_ALWAYS
	end
	
	-- Main Function
	function ENT:OnTakeDamage(dmg)
		local pl = self:GetOwner()
		local attacker = dmg:GetAttacker()
		local inflictor = dmg:GetInflictor()

		-- Health
		if GAMEMODE:InRound() && IsValid(pl) && pl:Alive() && pl:IsPlayer() && attacker:IsPlayer() && pl:Team() ~= attacker:Team() && dmg:GetDamage() > 0 then
            local allow = PHX:GetCVar( "ph_allow_armor" )
			if allow and pl:Armor() >= 10 then
				self.health = self.health - (math.Round( dmg:GetDamage()/2 ))
				pl:SetArmor(pl:Armor() - 20)
			else
				self.health = self.health - dmg:GetDamage()
			end
			pl:SetHealth(self.health)
			
			if self.health <= 0 then
			
				pl:KillSilent()
				pl:SetArmor(0)
				
				if inflictor && inflictor == attacker && inflictor:IsPlayer() then
					inflictor = inflictor:GetActiveWeapon()
					if !inflictor || inflictor == NULL then inflictor = attacker end
				end
				
				net.Start( "PlayerKilledByPlayer" )
			
				net.WriteEntity( pl )
				net.WriteString( inflictor:GetClass() )
				net.WriteEntity( attacker )
			
				net.Broadcast()

		
				MsgAll(attacker:Name() .. " found and killed " .. pl:Name() .. "\n") 

				if PHX:GetCVar( "ph_freezecam" ) then
					if pl:GetNWBool("InFreezeCam", false) then
						pl:PrintMessage(HUD_PRINTCONSOLE, "!! WARNING: Something went wrong with the Freeze Camera, but it's still enabled!")
					else
						timer.Simple(0.5, function()
							if !pl:GetNWBool("InFreezeCam", false) then
								-- Play the good old Freeze Cam sound
								net.Start("PlayFreezeCamSound")
								net.Send(pl)
							
								pl:SetNWEntity("PlayerKilledByPlayerEntity", attacker)
								pl:SetNWBool("InFreezeCam", true)
								pl:SpectateEntity( attacker )
								pl:Spectate( OBS_MODE_FREEZECAM )
							end
						end)
						
						timer.Simple(4.5, function()
							if pl:GetNWBool("InFreezeCam", false) then
								pl:SetNWBool("InFreezeCam", false)
								pl:Spectate( OBS_MODE_CHASE )
								pl:SpectateEntity( nil )
							end
						end)
					end
				end
				
				attacker:AddFrags(1)
				pl:AddDeaths(1)
				attacker:SetHealth(math.Clamp(attacker:Health() + GetConVarNumber("ph_hunter_kill_bonus"), 1, 100))
                
                hook.Call("PH_OnPropKilled", nil, pl, inflictor, attacker) -- Added inflictor, due to PS2 needs it, although it doesn't.
				pl:RemoveProp()
			end
		end
	end
	
end