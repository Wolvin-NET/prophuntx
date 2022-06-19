ENT.Type = "point"
ENT.Base = "base_point"

ENT.Items = { "ph_luckyball", "ph_devilball", "ph_ultpointball" }

function ENT:Initialize() end

function ENT:SetupDataTables()
    self:NetworkVar( "Int", 0, "SpawnEntity" )
    self:NetworkVar( "Int", 1, "Amount" )
    self:NetworkVar( "String", 0, "EntityName" )
end

function ENT:KeyValue( key, value )
	if key == "spawnent" then
		self:SetSpawnEntity( value )
	elseif key == "amount" then
		self:SetAmount( value )
	elseif key == "spawnontarget" then
        self:SetEntityName( value )
    else
		self:SetNetworkKeyValue(key, value)
	end
end

function ENT:CreateBall( entToSpawn, pos, ang )
    if SERVER then
        local e = ents.Create( entToSpawn )
        e:SetPos(pos)
        e:SetAngles(ang)
        e:Spawn()
        e:Activate()
    end
end

function ENT:makeEntity()
    local entToSpawn = self.Items[ self:GetSpawnEntity() ]
    local amount = self:GetAmount()
    local SpawnOn = self:GetEntityName()
    
    local pos = self:GetPos()
    local ang = angle_zero
    
    if SpawnOn and SpawnOn ~= nil then
        local ent = ents.FindByName(SpawnOn)
        local on = ent[math.random(1, #ent)]
        
        pos = on:GetPos()
        ang = on:GetAngles()            
    end
    
    self:CreateBall( entToSpawn, pos, ang )
    if amount > 0 then
        for i=1,amount do
            self:CreateBall( entToSpawn, pos, ang )
        end
    end
    
end

function ENT:AcceptInput(name, act, cal, data)
    if name == "Spawn" then
        self:makeEntity()
        return true
    elseif name == "SetAmount" then
        self:SetAmount(tonumber(data))
        return true
    elseif name == "ChangeTarget" then
        self:SetEntityName(tostring(data))
        return true
    elseif name == "SetType" then
        self:SetSpawnEntity(tonumber(data))
        return true
    end
end