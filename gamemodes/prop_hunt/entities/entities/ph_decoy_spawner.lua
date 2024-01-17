ENT.Type = "point"
ENT.Base = "base_point"

function ENT:Initialize() 
	if (SERVER) then
		if self:HasSpawnFlags(1) then --Spawn and instantly delete on spawn
			timer.Simple(0.25, function() --Yes, spawn are bit delayed. This is safe measurements
				self:makeEntity(); self:Remove();
			end)
		end
	end
end

function ENT:KeyValue( key, value )
	if key == "spawnrandom" then
		self.SpawnRandom = tobool(value)
	elseif key == "spawnchance" then
		self.SpawnChance = tonumber(value) -- always float
	elseif key == "spawnmax" then
		self.SpawnMaximum = tonumber(value)
	elseif key == "spawnmaxtype" then
		self.SpawnMaxType = tonumber(value)
	elseif key == "takemodelfrommap" then
        self.TakeModelFromMap = tobool(value)
	elseif key == "model" then
		self.EntModel = tostring(value)
	elseif key == "entity" then
        self.EntityNameToSpawn = value
	end
end

local DontSpawn = {
	["ph_fake_prop"] = true,
	["ph_prop"] 	 = true,
}
function ENT:makeEntity()

	if not GetGlobalBool("InRound", false) then
		PHX:VerboseMsg("[Decoy Spawner] Cannot spawn Decoy because round isn't properly started!\n", 2)
		return
	end

    local SpawnToEnt = ents.FindByName( self.EntityNameToSpawn )
	
	local MaxType = self.SpawnMaxType
    local Max = math.Clamp( self.SpawnMaximum, -1, #SpawnToEnt )
	
	local Chance = self.SpawnChance
	local SpawnRandom = self.SpawnRandom
	local TakeModelFromMap = self.TakeModelFromMap
	
	local mdl = self.EntModel
    
    if (Chance and Chance > 0) and (math.random() < Chance or Chance >= 1.0) then
		if (SpawnToEnt) and !table.IsEmpty(SpawnToEnt) then
			
			if (SpawnRandom) then table.Shuffle( SpawnToEnt ) end
			
			if MaxType == 2 then
				Max = math.Round( #SpawnToEnt * Max )
			elseif MaxType <= 0 then
				Max = 0
			end
			
			if Max > 0 then Max = math.random(1, Max) end

			local count=0
			for _,targEnt in pairs( SpawnToEnt ) do
			
				count=count+1
				if Max > 0 and count == Max then break end
			
				local pos = targEnt:GetPos()
				
				-- Don't spawn if some decoys spawned near 32 units nearby
				local findEnt = ents.FindInSphere( pos, 32 )
				for _,v in ipairs(findEnt) do
					if IsValid(v) and DontSpawn[v:GetClass()] then
						PHX:VerboseMsg("[Decoy Spawner] I was trying to spawn decoy but there was prop or decoy near ".. tostring(v:GetPos())..", Surpressing!\n", 2)
						continue
					end
				end
				
				local decoy = ents.Create( "ph_fake_prop" )
				decoy:SetKeyValue( "health", tostring(math.random(5,50)) )
				decoy:SetPos( pos )
				
				decoy:Spawn()
				
				if (TakeModelFromMap) then
					decoy:TakeModelFromMap()
				else
					decoy:ChangeModel(mdl)
				end
				-- Set Pos again
				decoy:SetPos( decoy:GetPos() - Vector(0,0,decoy:OBBMins().z) )
				decoy:SetAngles( Angle(0, AngleRand().y, 0) )
				
				decoy:PhysicsInit(SOLID_BBOX) --decoy:SetSolid(SOLID_BBOX)
				decoy:SetMoveType(MOVETYPE_NONE)
				decoy:Activate()
			end
		end
	end
    
end

function ENT:AcceptInput(name, act, cal, data)
    if name == "Spawn" then
        self:makeEntity()
        return true
    elseif name == "SetSpawnChance" then
        self.SpawnChance = tonumber(data)
        return true
    elseif name == "ChangeTarget" then
        self.EntityNameToSpawn(tostring(data))
        return true
    elseif name == "SetMax" then
		self.SpawnMaximum = tonumber(data)
        return true
	elseif name == "SetMaxType" then
		self.SpawnMaxType = tonumber(data)
        return true
    end
end