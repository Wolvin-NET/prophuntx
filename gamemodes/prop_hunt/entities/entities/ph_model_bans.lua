ENT.Type = "point"
ENT.Base = "base_point"
ENT.KVs = {}

local StoredBanName = "BAN_"..game.GetMap()

if SERVER then
	ENT.WaitForInput = true
end

function ENT:Initialize() 
	if (SERVER) then
	
		-- Only 1 Entity per Map!
		local IsThereAnyEntLikeMe = ents.FindByClass( self.ClassName )
		local OnlyEntity = IsThereAnyEntLikeMe[1]
		
		if #IsThereAnyEntLikeMe > 0 and (OnlyEntity) and OnlyEntity ~= self then
			print("ph_model_bans: WARNING: DELETING NEWLY-CREATED ph_model_bans ENTITY, ONLY 1 ENTITY PER MAP!")
			self:Remove()
		else
			self:GetBannedList()
			if self:HasSpawnFlags(1) then self.WaitForInput=false end
			if (not self.WaitForInput) then
				self:AddBans(); self:Remove(); 
			end
		end
	end
end

function ENT:AddBans()
	if (PHX and PHX.BANNED_PROP_MODELS) then

		local CurMapBan = GAMEMODE[StoredBanName]
		if !CurMapBan then 
			GAMEMODE[StoredBanName] = {}
			CurMapBan = GAMEMODE[StoredBanName]
			CurMapBan._HasBanData = false
		end
		
		if (CurMapBan._HasBanData) then return end
		
		local BannedMdls = PHX.BANNED_PROP_MODELS
		
		for _,mdl in SortedPairs( self.KVs ) do
			if !CurMapBan[mdl] then 
				CurMapBan[mdl] = true
				if !table.HasValue( BannedMdls, mdl ) then table.insert(BannedMdls, mdl); end
			end
		end
		
		PHX:ENT_UpdateModelBan( self, self:EntIndex() )
		CurMapBan._HasBanData = true
	else
		MsgC(Color(240,72,86), "[ph_model_bans] Error: Cannot add bans info, cannot access BANNED_PROP_MODELS entry!\n")
	end
end

function ENT:RemoveBans()
	if (PHX and PHX.BANNED_PROP_MODELS) then

		local CurMapBan = GAMEMODE[StoredBanName]
		if !CurMapBan then return end
		if !CurMapBan._HasBanData then return end
		
		local BannedMdls = PHX.BANNED_PROP_MODELS
		
		for _,mdl in SortedPairs( self.KVs ) do
			if CurMapBan[mdl] then
				CurMapBan[mdl] = nil;
				table.RemoveByValue( BannedMdls, mdl )
			end
		end
		
		PHX:ENT_UpdateModelBan( self, self:EntIndex() )
		CurMapBan._HasBanData = false
	else
		MsgC(Color(240,72,86), "[ph_model_bans] Error: Cannot remove bans info, cannot access BANNED_PROP_MODELS entry!\n")
	end
end

function ENT:KeyValue( key, value )
	self.KVs[key] = value
end

function ENT:GetBannedList()
	local t={}
	for i=1,16 do
	
		local KeyVal = self.KVs["model"..i]
		if (KeyVal) then table.insert(t, KeyVal); end
		
	end
	
	self.KVs = t
end

function ENT:AcceptInput(name, act, cal, data)
    if name == "AddBans" then
        self:AddBans()
        return true
    elseif name == "RemoveBans" then
        self:RemoveBans()
        return true
    end
end