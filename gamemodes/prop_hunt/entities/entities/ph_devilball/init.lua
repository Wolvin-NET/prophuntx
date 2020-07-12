AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

ENT.model = Model("models/props_idbs/phenhanced/devil.mdl")

function ENT:StartTeslaSpark()
	timer.Create("DoTeslaSpark-"..self.Entity:EntIndex(),math.random(3,6),0,function()
		self:ShowEffects(self.Entity, "StunstickImpact", self.Entity:GetPos(), self.Entity:GetPos())
	end)
end

function ENT:StopTeslaSpark()
	if timer.Exists("DoTeslaSpark-"..self.Entity:EntIndex()) then
		timer.Remove("DoTeslaSpark-"..self.Entity:EntIndex())
	end
end

function ENT:Initialize()
	self.Entity:SetModel(self.model)
	self.Entity:PhysicsInit(SOLID_BBOX)
	self.Entity:SetMoveType(MOVETYPE_NONE)
	self.Entity:SetSolid(SOLID_BBOX)
	self.Entity:SetUseType(SIMPLE_USE)
	self.health = 50
	
	-- Spawn a Sprite, for an Effect.
	self.Entity.Sprite = ents.Create("env_sprite")
	self.Entity.Sprite:SetPos(self.Entity:GetPos())
	self.Entity.Sprite:SetAngles(Angle(0,0,0))
	self.Entity.Sprite:SetKeyValue("spawnflags","1")
	self.Entity.Sprite:SetKeyValue("framerate","1")
	self.Entity.Sprite:SetKeyValue("rendermode","5")
	self.Entity.Sprite:SetKeyValue("rendercolor","255 "..tostring(math.random(1,180)).." "..tostring(math.random(1,20)))
	self.Entity.Sprite:SetKeyValue("model","sprites/light_glow01.vmt")
	self.Entity.Sprite:SetKeyValue("scale","0.4")
	
	self.Entity.Sprite:Spawn()
	self.Entity.Sprite:Activate()
	
	self.Entity.Sprite:SetParent(self.Entity)
	
	self:StartTeslaSpark()
end

function ENT:OnRemove()
	self:StopTeslaSpark()
	if IsValid(self.Entity.Sprite) then
		self.Entity.Sprite:Remove()
	end
end

ENT.sounds = {
	"prop_idbs/huntep4_bc44_pickup.wav",
	"prop_idbs/zavogant_pickup.wav"
}

--[[
Base Devil Balls Functions. 
Please note that you might have to create a custom serverside lua with full of function list with list.Set into "DevilBallsAddition".
	Example:
	
	list.Set("DevilBallsAddition", "UniqueName", function(pl,ball)
		-- code...
	end)
	
Keep in note that UniqueName should be unique and different. Otherwise will cause some confusion with PHX.VerboseMsg!
]]
ENT.funclists = {
	function(pl)
		if !pl.ph_fastspeed then
			if !pl._OriginalWSpeed then pl._OriginalWSpeed = pl:GetWalkSpeed() end
			
			pl:ChatPrint("[Devil Crystal] You have super speed Power up!")
			pl:SendLua("surface.PlaySound('prop_idbs/speedup.wav')")
			pl:SetWalkSpeed( pl:GetWalkSpeed() + 100 )
			pl.ph_fastspeed = true
			pl.RevertWalk = timer.Simple(math.random(4,12), 
			function()
				pl:ChatPrint("[Devil Crystal] super speed power up exhausted...")
				pl:SendLua("surface.PlaySound('prop_idbs/generic_exhaust.wav')")
				pl:SetWalkSpeed( pl._OriginalWSpeed )
				pl.ph_fastspeed = false
			end)
		end
	end,
	function(pl)
		local rand = math.random(10,50)
		pl:SetHealth(pl:Health() + rand)
		pl.ph_prop.health = pl.ph_prop.health + rand
		pl:ChatPrint("[Devil Crystal] You got free +"..tostring(rand).." HP for your current Prop!")
	end,
	function(pl)
		local rand
		rand = math.random(20,60)
		pl:SetArmor(pl:Armor() + rand)
		pl:ChatPrint("[Devil Crystal] You gained armor points bonus : "..tostring(rand).."!")
	end,
	function(pl)
		if !pl.ph_slowspeed then
			if !pl._OriginalWSpeed then pl._OriginalWSpeed = pl:GetWalkSpeed() end
			
			pl:ChatPrint("[Devil Crystal] Uh oh, you're slowing down!")
			pl:SendLua("surface.PlaySound('prop_idbs/slowdown.wav')")
			pl:SetWalkSpeed( pl:GetWalkSpeed() - 100 )
			pl.ph_slowspeed = true
			pl.RevertWalk = timer.Simple(math.random(4,12), 
			function()
				pl:ChatPrint("[Devil Crystal] slow down power up exhausted...")
				pl:SendLua("surface.PlaySound('prop_idbs/generic_exhaust.wav')")
				pl:SetWalkSpeed( pl._OriginalWSpeed )
				pl.ph_slowspeed = false
			end)
		end
	end,
	function(pl)
		if table.Count(team.GetPlayers(TEAM_HUNTERS)) >= 3 then
			pl:ChatPrint("[Devil Crystal] Hunters are frozen!")
			pl:SendLua("surface.PlaySound('prop_idbs/surface_prop_froze_hunter.wav')")
			for _,v in pairs(team.GetPlayers(TEAM_HUNTERS)) do
				if v:Alive() then
					v:Freeze(true)
					v:EmitSound(Sound("prop_idbs/govarchz_pickup.wav"))
					v:ChatPrint("[Devil Crystal] Oops, you are temporary frozen...!")
					v.UnFrooze = timer.Simple(math.random(2,3),
					function()
						v:ChatPrint("[Devil Crystal] You are free now!")
						v:EmitSound(Sound("prop_idbs/froze_done.wav"))
						v:Freeze(false)
					end)
				end
			end
		else
			pl:ChatPrint("[Devil Crystal] It seems there are no hunters available to Froze 'em. Let it Go~")
		end
	end,
	function(pl)
		if !pl.ph_cloacking then
			pl:ChatPrint("[Devil Crystal] Cloaking...")
			pl:SendLua("surface.PlaySound('prop_idbs/cloak.wav')")
			pl.ph_prop:DrawShadow(false)
			pl.ph_prop:SetMaterial("models/effects/vol_light001")
			pl.ph_cloacking = true
			pl.RevertMaterial = timer.Simple(math.random(5,15),
			function()
				pl:ChatPrint("[Devil Crystal] cloak power up exhausted...")
				pl:SendLua("surface.PlaySound('prop_idbs/generic_exhaust.wav')")
				pl.ph_prop:DrawShadow(true)
				pl.ph_prop:SetMaterial("")
				pl.ph_cloacking = false
			end)
		end
	end
}
-- Don't Edit below unless you know what you're doing.

local function ResetEverything()
	for _,v in pairs(player.GetAll()) do
		if IsValid(v) && v:Alive() then
			v.ph_cloacking		= false
			v.ph_slowspeed		= false
			v.ph_fastspeed		= false
		
			if v:Team() == TEAM_PROPS && v._OriginalWSpeed then v:SetWalkSpeed(v._OriginalWSpeed) end
			if v:Team() == TEAM_PROPS && v.ph_prop:GetMaterial() then v.ph_prop:DrawShadow(true) v.ph_prop:SetMaterial("") end
			if v:IsFrozen() then v:Freeze(false) end
		end
	end
end
hook.Add("PH_RoundEnd", "PHX.ForceResetDevilBall", ResetEverything)

function ENT:AddMoreLuckyEvents()
	local t = list.Get("DevilBallsAddition")
	if !table.IsEmpty(t) then
		for name,tab in pairs(t) do
			PHX.VerboseMsg("[PHX: Devil Crystal] Adding new events: "..name)
			table.insert(self.funclists, tab)
		end
	else
		PHX.VerboseMsg("[PHX: Devil Crystal] There is no additional events detected, skipping...")
	end
end

ENT:AddMoreLuckyEvents()

function ENT:The_DevilDrop(pl)
	if pl:Team() == TEAM_PROPS && pl:Alive() then
		self.getfunction = table.Random(self.funclists)
		self.getfunction(pl)
		
		hook.Call("PH_OnDevilBallPickup", nil, pl)
	end
end

function ENT:Use(activator)
	if GAMEMODE:InRound() && IsValid(activator) && activator:IsPlayer() && activator:Alive() && activator:Team() == TEAM_PROPS then
		self:The_DevilDrop(activator)
		self:ShowEffects(self.Entity, "GlassImpact", self.Entity:GetPos(), self.Entity:GetPos())
		self.Entity:EmitSound(Sound(table.Random(self.sounds)),60)
		self.Entity:Remove()
	end
end

function ENT:OnTakeDamage(dmg)
	local hit = dmg:GetDamage()
	
	self.health = self.health - hit
	
	if self.health < 0 then
		self.Entity:EmitSound(Sound("physics/glass/glass_cup_break"..math.random(1,2)..".wav"))
		self:ShowEffects(self.Entity, "GlassImpact", self.Entity:GetPos(), self.Entity:GetPos())
		self.Entity:Remove()
	end
end