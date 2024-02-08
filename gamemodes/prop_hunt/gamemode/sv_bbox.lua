PHX.OBB_DATA = {}

local function LoadOBBConfig()
	local map = game.GetMap()
	local GetData = PHX.ConfigPath .. "/obb/"..map..".txt"
	
	if !file.Exists(GetData, "DATA") then
		PHX:VerboseMsg("[OBB] No Map Prop OBB Modifier config found for map: "..map)
		return {}
	end
	
	PHX:VerboseMsg("[OBB] Loading Map Prop OBB Modifier config for map: "..map)
	local data = file.Read(GetData,"DATA")
	local ParsedData = util.JSONToTable( data ) or {}
	
	local Act = {}
	if ParsedData and istable( ParsedData ) and !table.IsEmpty( ParsedData ) then
		for model,vecs in pairs( ParsedData ) do
			Act[model] = {
				mins = Vector( vecs.mins[1], vecs.mins[2], vecs.mins[3] ),
				maxs = Vector( vecs.maxs[1], vecs.maxs[2], vecs.maxs[3] )
			}
		end
	end

	return Act
end

function PHX:OBB_ModifyPropOBB( ent, mins, maxs )
	local model = ent:GetModel()
	local Index = ent:EntIndex()
	PHX:VerboseMsg( "[OBB:Modifier] Applying Mins/Maxs for [ID "..Index.."]["..model.."] => OBBMins["..tostring(mins).."] OBBMaxs["..tostring(maxs).."]" )
	ent.m_Hull = { mins, maxs }
	ent:SetNWBool( "hasCustomHull", true )
	ent:SetNWVector( "CustomHullMins", mins )
	ent:SetNWVector( "CustomHullMaxs", maxs )
end

local function DoConfig()
	local data = PHX.OBB_DATA
	if !data then return end
	if data and istable( data ) and table.IsEmpty( data ) then return end
	
	--[[
	
	JSON:
	{
		"model/path/b.mdl":
		{
			"mins": [-16, -16,  0],		// Z mins must NOT below 0
			"maxs": [ 16,  16, 72]
		},
		
		...
	}
	
	LUA:
	{
		["model/path/b.mdl"] = {
			mins = {-16,-16,  0}, 	-- Z mins must NOT below 0
			maxs = { 16, 16, 72},
		},
		
		...
	}
	
	]]
	
	for model,vecs in pairs( data ) do
		for _,found in ipairs( ents.FindByModel(model) ) do
			if IsValid(found) then PHX:OBB_ModifyPropOBB( found, vecs.mins, vecs.maxs ); end
		end
	end
	
end

function PHX:OBB_HasEntModded( ent )
	if !IsValid( ent ) then return end
	local mdl = ent:GetModel()
	local vecs = self.OBB_DATA[mdl]
	if (vecs) then self:OBB_ModifyPropOBB( ent, vecs.mins, vecs.maxs ); end
end

hook.Add("InitPostEntity", "PHX.InitOBBModelData", function()
	if not file.Exists(PHX.ConfigPath .. "/obb","DATA") then
		PHX:VerboseMsg("[OBB] Folder `obb/` is missing, creating new one!",2)
		file.CreateDir(PHX.ConfigPath .. "/obb")
	end

	PHX:VerboseMsg("[OBB] Initializing Map Prop OBB Modifier config...")
	PHX.OBB_DATA = LoadOBBConfig()
	DoConfig()
end)

hook.Add("PostCleanupMap", "PHX.PostOBBModelData", function()
	if PHX:GetCVar( "ph_reload_obb_setting_everyround" ) then
		PHX:VerboseMsg("[OBB] Modifying Map Props' OBB, if any...")
		DoConfig()
	end
end)

concommand.Add("refresh_obb_map_setting", function(ply)

	if ( util.IsStaff( ply ) ) then

		PHX:VerboseMsg("[OBB] Refreshing Map Prop OBB Modifier config...")
		PHX.OBB_DATA = LoadOBBConfig()
		DoConfig()
		
	end

end, nil, "Force Reload OBB/Collision Bound Model Modifier for this map, if available.")