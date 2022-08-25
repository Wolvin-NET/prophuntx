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

local function ResetPlayerStuff(pl)
	pl.tmr_item			 	= nil
	pl.tmr_itemnotice 	 	= nil
	pl.prop_revenge_item	= nil
	pl.itemshootcount 		= 0
	pl.has_uniqueitem 		= false
	pl.has_uniqueitem_shoot = false
end

local PropRevenge = {
	{
		name	= "Flechette",
		func	= function(pl, max)
			local safefail = pl.tmr_item
			timer.Create(pl.tmr_item, 0.1, max, function()
				
				if IsValid(pl) and pl:Alive() then
					local Forward = pl:EyeAngles():Forward()
					pl:EmitSound( Sound( "NPC_Hunter.FlechetteShoot" ) )
					
					local f = ents.Create("hunter_flechette")
					if (IsValid(f)) then
						f:SetPos( pl:GetShootPos() + Forward * 32 )
						f:SetAngles( pl:EyeAngles() )
						f:Spawn()
						f:SetVelocity( Forward * 2000 )
						f:SetOwner(pl)
					end
					
					pl.itemshootcount = pl.itemshootcount + 1
					if pl.itemshootcount >= max then
						timer.Remove(pl.tmr_item)	-- immediately clear timer.
						ResetPlayerStuff(pl)
					end
				elseif !pl:Alive() then
					print("[PHX Devil Crystal] Removing Timer '" .. pl.tmr_item .. "' because player was dead!")
					timer.Remove(pl.tmr_item)
					print("[PHX Devil Crystal] Unsetting parameters on dead player.")
					ResetPlayerStuff(pl)
				else
					print("[PHX Devil Crystal] Removing Timer '" .. safefail .. "' because player was disconnected!")
					timer.Remove(safefail)
					-- ResetPlayerStuff will be invalid here.
				end
			
			end)
		end
	},
	{
		name	= "Grenade Launcher",
		func	= function(pl, _)
			if pl:Alive() then
				local Forward = pl:EyeAngles():Forward()
				pl:EmitSound( Sound( "NPC_Combine.GrenadeLaunch" ) )
				
				local g = ents.Create("grenade_ar2")
				if (IsValid(g)) then
					g:SetPos( pl:GetShootPos() + Forward * 32 )
					g:SetAngles( pl:EyeAngles() )
					g:SetMoveType( MOVETYPE_FLYGRAVITY )
					g:SetMoveCollide( MOVECOLLIDE_FLY_BOUNCE )
					g:Spawn()
					g:SetVelocity( Forward * 1000 )
					g:SetLocalAngularVelocity(Angle(math.random(-400,400),math.random(-400,400),math.random(-400,400)))
					g:SetSaveValue("m_flDamage", 75)	-- Original: sk_plr_dmg_smg1_grenade = 100. 100 is already OP!
					g:SetOwner(pl)
				end
				ResetPlayerStuff(pl)	-- keep this always called!
				
			else
				ResetPlayerStuff(pl)	-- keep this always called!
			end
		end
	},
	{
		name	= "RPG Launcher",
		func	= function(pl, _)
			if pl:Alive() then
				local Forward = pl:EyeAngles():Forward()
				pl:EmitSound( Sound( "Weapon_RPG.Single" ) )
				
				local r = ents.Create("rpg_missile")
				if (IsValid(r)) then
					r:SetPos( pl:GetShootPos() + Forward * 32 )
					r:SetAngles( pl:EyeAngles() )
					r:Spawn()
					r:SetVelocity( Forward * 300 + Vector(0, 0, 128) )
					r:SetSaveValue("m_flDamage", 75)	-- Original: sk_plr_dmg_rpg = 100. 100 is already OP!
					r:SetOwner(pl)
				end
				ResetPlayerStuff(pl)	-- keep this always called!
				
			else
				ResetPlayerStuff(pl)	-- keep this always called!
			end
		end
	},
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
		pl:AddHealthProp( rand )
		pl:ChatPrint("[Devil Crystal] You got free +"..tostring(rand).." HP for your current Prop!")
	end,
	function(pl)
		local rand
		rand = math.random(20,60)
        local allow = PHX:GetCVar( "ph_allow_armor" )
        if allow then
            pl:SetArmor(pl:Armor() + rand)
            pl:ChatPrint("[Devil Crystal] You gained armor points bonus : "..tostring(rand).."!")
        end
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
			pl:PrintCenter( "Hunters are frozen!", Color(153,217,234) )
			pl:SendLua("surface.PlaySound('prop_idbs/surface_prop_froze_hunter.wav')")
			for _,v in pairs(team.GetPlayers(TEAM_HUNTERS)) do
				if v:Alive() then
					v:Freeze(true)
					v:EmitSound(Sound("prop_idbs/govarchz_pickup.wav"))
					v:ChatPrint("[Devil Crystal] Oh no! You are temporarily frozen!")
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
		local nade = ents.Create("npc_grenade_frag")
		local pos = pl:GetPos()
		nade:SetPos(Vector( pos.x, pos.y, pos.z+8 ))
		nade:SetAngles(Angle(0,0,0))
		nade:Spawn()
		nade:Activate()
		
		nade:Fire("SetTimer","3",0)
		timer.Simple(0.1, function()
			nade:SetOwner(pl)
			nade:SetSaveValue( "m_hThrower", pl )
			nade:SetSaveValue( "m_flDamage", 90 )
		end)
		
		pl:ChatPrint("[Devil Ball] You spawned grenade! Throw this grenade at hunters!")
	end,
	function(pl, ent)
		  if !pl.has_uniqueitem then		  
			local item = math.random(1,#PropRevenge)	-- number			
			if item == 1 and !IsMounted("ep2") then
				-- Randomise again if server has no EP2 installed for Flechette.
				print("[PHX Devil Crystal] 'HL2: Episode 2' isn't mounted on this server so we can't use Flechette. Altering item...")
				item = math.random(2,#PropRevenge)
			end
			
			local name = PropRevenge[item].name
			
			pl.has_uniqueitem 	 = true
			pl.prop_revenge_item = item
			
			pl.itemshootcount 	= 0
			pl.tmr_item 		= "shootF"..pl:EntIndex()
			pl.tmr_itemnotice 	= "ld.Fnotice"..pl:EntIndex()
			
			local failsafe = pl.tmr_itemnotice
			
			local msg = "Press [RIGHT CLICK] to shoot ".. name .."!"
			
			pl:PrintMessage(HUD_PRINTCENTER, msg)
			timer.Create(pl.tmr_itemnotice, 3, 0, function()
				if IsValid(pl) and pl:Alive() then
					pl:PrintMessage(HUD_PRINTCENTER, msg)
				else
					print("[PHX Devil Crystal] Removing Timer '" .. failsafe .. "' because player was dead or disconnected!")
					timer.Remove(failsafe)
				end
			end)
			
			pl:ChatPrint("[Devil Ball] You have ".. name .." in your hand! Aim towards hunters to damage them!")
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
				if pl.ph_prop and IsValid(pl.ph_prop) then
					pl.ph_prop:DrawShadow(true)
					pl.ph_prop:SetMaterial("")
					pl.ph_cloacking = false
				end
			end)
		end
	end
}
-- Don't Edit below unless you know what you're doing.

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
		--self.getfunction = self.funclists[math.random(1, #self.funclists)]
		--self.getfunction(pl,self)
		
		local cur
		repeat
			cur = self.funclists[math.random(1, #self.funclists)]
		until cur ~= self.getfunction
		
		self.getfunction = cur
		self.getfunction(pl,self)
		
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

-- Hooks
local function ResetEverything()
	for _,v in pairs(player.GetAll()) do
		if IsValid(v) then
			v.ph_cloacking		= false
			v.ph_slowspeed		= false
			v.ph_fastspeed		= false
			
			-- force remove timer
			if v.tmr_item and v.tmr_item ~= nil then timer.Remove(v.tmr_item); v.tmr_item = nil; end
			if v.tmr_itemnotice and v.tmr_itemnotice ~= nil then timer.Remove(v.tmr_itemnotice); v.tmr_itemnotice = nil; end
			v.tmr_item				= nil
			v.tmr_itemnotice		= nil
			
			v.prop_revenge_item		= nil
			v.itemshootcount		= 0
			v.has_uniqueitem		= false
			v.has_uniqueitem_shoot	= false
			
			if v:Alive() then
				if v:Team() == TEAM_PROPS && v._OriginalWSpeed then v:SetWalkSpeed(v._OriginalWSpeed) end
				if v:Team() == TEAM_PROPS && v.ph_prop:GetMaterial() then v.ph_prop:DrawShadow(true); v.ph_prop:SetMaterial(""); end
				if v:IsFrozen() then v:Freeze(false) end
			end
		end
	end
end

-- Reset Everything and Destroy all devil crystals after Round End with Result. (New Hook)
hook.Add("PH_RoundEndResult", "PHX.DestroyDevils", function(r,rt)
	ResetEverything()
	
	timer.Simple(0.1, function()
		for _,cr in pairs(ents.FindByClass("ph_devilball")) do
			cr:ShowEffects(cr, "GlassImpact", cr:GetPos(), cr:GetPos())
			cr:Remove()
		end
	end)
end)

local function DoPropRevenge( pl, amount )
	if !pl.has_uniqueitem then return end
	if pl.has_uniqueitem_shoot then return end
	if !pl.prop_revenge_item or pl.prop_revenge_item == nil or pl.prop_revenge_item == 0 then return end
	
	local max = 1
	if !amount or amount == nil or amount < 1 then max = 1 end
	max = amount
	
	if IsValid(pl) then
		if pl.has_uniqueitem and !pl.has_uniqueitem_shoot then
			pl.has_uniqueitem_shoot = true
			timer.Remove(pl.tmr_itemnotice)
			PropRevenge[pl.prop_revenge_item].func(pl, max)
		end
	end
end

hook.Add("PlayerTick", "PHX.PlayerPropDoRevenge", function(pl, mv)
	if GAMEMODE:InRound() and pl:Alive() and pl:Team() == TEAM_PROPS and pl:KeyPressed(IN_ATTACK2) then
		if pl.prop_revenge_item and pl.prop_revenge_item ~= nil and pl.prop_revenge_item > 0 and 
			pl.has_uniqueitem and pl.has_uniqueitem ~= nil and !pl.has_uniqueitem_shoot then
			DoPropRevenge(pl, math.random(6,10))	-- 2nd argument is only for flechette.
		end
	end
end)