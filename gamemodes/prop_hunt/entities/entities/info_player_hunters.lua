ENT.Type = "point"
--[[ ENT.IsSubClass = false

function ENT:SetupDataTables()
	self:NetworkVar( "Boolean", 0, "ForSubClass" )
	self:NetworkVar( "Int", 0, "SubClassID" )
end

function ENT:KeyValue( key, value )
	if key == "isforsubclass" then
		self:SetForSubClass(value)
	elseif key == "subclassid" then
		self:SetSubClassID(value)
	else
		self:SetNetworkKeyValue(key, value)
	end
end

function ENT:IsSubClassSpawnable()
	local b = tobool( self:GetForSubClass() )
	
	return b
end ]]