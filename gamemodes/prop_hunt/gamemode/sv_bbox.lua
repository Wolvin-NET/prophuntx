local CUR_MAP_DATA = {}

local function LoadOBBConfig()
	local map = game.GetMap()
	local GetData = PHX.ConfigPath .. "/obb/"..map..".txt"
	
	if !file.Exists(GetData, "DATA") then
		PHX:VerboseMsg("[OBB] No OBB Configuration found for map: "..map)
		return false
	end
	
	if file.Exists(GetData, "DATA") then
		local data = file.Read(GetData,"DATA")
		local ParsedData = util.JSONToTable(data)

		return ParsedData
	end
end

local function DoConfig()
	local data = CUR_MAP_DATA
	if !data then return end
	
	--[[
	JSON structure:
	[
		[
			"model/path/b.mdl",
			{
				"min": [0, 0, 0],
				"max": [16, 16, 72],
				"dmin": [0, 0, 0],	 -- No longer needed
				"dmax": [16, 16, 28] -- No longer needed
			}
		]
	]
	
	LUA structure:
	1:
		1: "model/path/b.mdl"
		2:
			min 	= {-0,-0,-0}
			max 	= {16,16,72}
			dmin	= {-0,-0,-0} -- no longer needed
			dmax	= {16,16,28} -- no longer needed
	]]
	
	for i=1,#data do
		local tent = ents.FindByModel(data[i][1])
		local min 	= Vector(data[i][2]["min"][1],data[i][2]["min"][2],data[i][2]["min"][3])
		local max 	= Vector(data[i][2]["max"][1],data[i][2]["max"][2],data[i][2]["max"][3])
		--[[ local dmin 	= Vector(data[i][2]["dmin"][1],data[i][2]["dmin"][2],data[i][2]["dmin"][3])
		local dmax 	= Vector(data[i][2]["dmax"][1],data[i][2]["dmax"][2],data[i][2]["dmax"][3]) ]]
		
		for _,found in pairs(tent) do
			if IsValid(found) then
				PHX:VerboseMsg( "[OBB MODIFIER] Setting up OBB Value for Entity ["..found:EntIndex().."]["..found:GetModel().."]: \n   >Hull-Vector: min "..tostring(min).." max "..tostring(max) )
				found:SetNWBool("hasCustomHull",true)
				found.m_Hull 	= {min,max}
			end
		end
	end
	
end

hook.Add("Initialize", "PHX.InitOBBModelData", function()

	if !file.Exists(PHX.ConfigPath .. "/obb","DATA") then
		file.CreateDir(PHX.ConfigPath .. "/obb")
	end

	timer.Simple(1.5, function()
		PHX:VerboseMsg("[OBB] Initializing OBB ModelData Config...")
		
		CUR_MAP_DATA = LoadOBBConfig()
		DoConfig()
	end)
end)

hook.Add("PostCleanupMap", "PHX.PostOBBModelData", function()
	if PHX:GetCVar( "ph_reload_obb_setting_everyround" ) then
		PHX:VerboseMsg("[OBB] PostCleanup OBB ModelData Config...")
		
		DoConfig()
	end
end)

concommand.Add("refresh_obb_map_setting", function(ply)

	if ( util.IsStaff( ply ) ) then

		PHX:VerboseMsg("[OBB] Refreshing OBB Model Data Modifier...")
		CUR_MAP_DATA = LoadOBBConfig()
	
		DoConfig()
		
	end

end, nil, "Force Reload PHX OBB/Collission Bound Model Data Modifier on this map.")