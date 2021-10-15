AddCSLuaFile()

DEFINE_BASECLASS( "base_anim" )

ENT.PrintName = "Prop Entity"
ENT.Author = "Wolvindra-Vinzuerio"
ENT.Information	= "A prop entity for Prop Hunt: Enhanced"
ENT.Category = ""
ENT.Editable = true
ENT.Spawnable = true
ENT.AdminOnly = false
ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:SetupDataTables() end

function ENT:Initialize()
	if SERVER then
		self:SetModel("models/player/kleiner.mdl")
		self:SetLagCompensated(true)			
		self:SetMoveType(MOVETYPE_NONE)
		self.health = 100
	else
	
	end
end

if CLIENT then
	function ENT:Draw()
		self:DrawModel()
	end
end
	
-- Prop Movement and Rotation (CLIENT)
function ENT:Think()
	if CLIENT then
		local pl = self:GetOwner()
		if IsValid(pl) && pl:Alive() && pl == LocalPlayer() then
			local me  = LocalPlayer()
			local pos = me:GetPos()
			local ang = me:GetAngles()
			local lockstate = pl:GetPlayerLockedRot()
			
			if self:GetModel() == "models/player/kleiner.mdl" || self:GetModel() == player_manager.TranslatePlayerModel(GetConVar("cl_playermodel"):GetString()) then
				self:SetPos(pos)
			else
				self:SetPos(pos - Vector(0, 0, self:OBBMins().z))
			end
			if !lockstate then self:SetAngles(Angle(0,ang.y,0)) end
		end
	end
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
			if pl:Armor() >= 10 then
				self.health = self.health - (math.Round(dmg:GetDamage()/2))
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
				
				hook.Call("PH_OnPropKilled", nil, pl, attacker)			
				pl:RemoveProp()
			end
		end
	end
	
end