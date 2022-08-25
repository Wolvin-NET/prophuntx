-- User Management
function PHX:ManageGroupInfo( bLoadSave, bUseNet, stblKey, fileName, netName )

	if !stblKey or stblKey == nil or
		!fileName or fileName == nil then
			ErrorNoHalt( "Table Key and File Name is required!" )
			return
	end

	local data = nil
	local cfg = PHX.ConfigPath .. "/"..fileName..".txt"
	
	if !file.Exists( cfg, "DATA" ) or file.Size( cfg, "DATA" ) <= 0 then
		file.Write( cfg, util.TableToJSON( self[stblKey], true ) )
	end
	
	if (bLoadSave) then -- load the file
		local f = file.Read( cfg, "DATA" )
		local t = util.JSONToTable(f)
		
		if t and t ~= nil then
			
			data = t
			
			if (bUseNet) then
			
				if netName or netName ~= nil then
			
					local c = util.Compress(f)
					local len = c:len()
					
					net.Start( netName )
					  net.WriteUInt(len,16)
					  net.WriteData(c,len)
					net.Broadcast()
					
				else
				
					ErrorNoHalt( "sv_admin.lua -> 'netName' is empty or invalid. Not pooling any network messages!" )
					
				end
			end
			
			self[stblKey] = data
		end
		
		return data
	end
	
	-- Save to file.
	local s = util.TableToJSON( self[stblKey], true )
	file.Write( cfg, s )
	
	if !file.Exists( cfg, "DATA" ) or file.Size( cfg, "DATA" ) <= 0 then
		print("[PHX] Error Saving configuration file: ".. cfg .." - File was not saved or file size is 0. Are you sure that '/garrysmod/data' directory is Writeable?")
		return 0
	end
	
	return 1
	
end

-- Admin Group Access
net.Receive("PHX.CLAdminGroupInfo", function( l, ply )
	if ( ply:PHXIsStaff() ) then
		
		local byte = net.ReadUInt(16)
		local data = net.ReadData(byte)
		
		local t = util.PHXQuickDecompress( data )
		
		if t and t ~= nil and istable(t) then
		
			--Replacing
			PHX.SVAdmins = t
			local result = PHX:ManageGroupInfo( false, false, "SVAdmins", "admins", "PHX.AdminGroupInfo" )
			if result == 1 then
				ply:PHXChatInfo("GOOD", "PHXM_ADMIN_ACCCFG_SUCC")
				--Update
				PHX:ManageGroupInfo( true, true, "SVAdmins", "admins", "PHX.AdminGroupInfo" )
			else
				ply:PHXChatInfo("ERROR", "PHXM_ADMIN_ACCCFG_FAIL")
			end
			
		end
		
	end
end)

-- Mute Group Control
net.Receive("PHX.CLMutedGroupInfo", function( l, ply )
	if ( ply:PHXIsStaff() ) then
		
		local byte = net.ReadUInt(16)
		local data = net.ReadData(byte)
		
		local t = util.PHXQuickDecompress( data )
		
		if t and t ~= nil and istable(t) then
		
			--Replacing
			PHX.IgnoreMutedUserGroup = t
			local result = PHX:ManageGroupInfo( false, false, "IgnoreMutedUserGroup", "muted_groups", "PHX.MutedGroupInfo" )
			if result == 1 then
				ply:PHXChatInfo("GOOD", "PHXM_ADMIN_MUTCFG_SUCC")
				--Update
				PHX:ManageGroupInfo( true, true, "IgnoreMutedUserGroup", "muted_groups", "PHX.MutedGroupInfo" )
			else
				ply:PHXChatInfo("ERROR", "PHXM_ADMIN_MUTCFG_FAIL")
			end
			
		end
		
	end
end)


-- Todo: Need a better improvement for command management...
local function doAdminStrictCheck(ply)
	if ( ply:PHXIsStaff() ) then
		return true
	end
		
	return false
end

local function doCommand(ply, cmd, value, identifier)
	-- Bug: Float value, if you exceed less than 0.0001, will prints out "1e-05". I'm not sure if this valid value.
	-- Also, while it will be printed like that, util.NiceFloat might help but it only cuts to 1e-07 (0.0000001)
	RunConsoleCommand(cmd, tostring(value))	-- convert evertyhing into string because GetGlobalBool and other value don't like actual data type, they'll think as failed value. (e.g: GetGlobalBool 0 = ignored.)
	PHX.VerboseMsg("[PHX ADMIN CVAR "..identifier.." NOTIFY] Command '".. cmd .. "' has changed to " .. value .. " (Player: " .. ply:Nick().. " (" ..ply:SteamID() ..") )")
end

local function doKickInvalidAccess(ply, cmd, identifier)
	if GetConVar("ph_kick_non_admin_access"):GetBool() then
		game.KickID(ply:SteamID(), "[PH:X - NOT ADMIN] Illegal server command access found from: "..ply:Nick())
	else
		ply:PHXChatInfo( "ERROR", "PHX_ADMIN_ACCESS_ONLY", ply:Nick() )
	end
	PHX.VerboseMsg("[PHX ADMIN CVAR "..identifier.." NOTIFY] Player "..ply:Nick().." (".. ply:SteamID() ..") is attempting to access "..cmd.."!")
end

-- man I wish lua has some-sort of switch/case .
local net_functions = {
	["SvCommandReq"] = function(ply, data)
		local cmd = data[1]
		local valbool = data[2]
		
		if doAdminStrictCheck(ply) then
			doCommand(ply, cmd, math.Round(valbool), "" )
		else
			doKickInvalidAccess(ply, cmd, "")
		end
	end,
	["SvCommandSliderReq"] = function(ply, data)
		local cmd,val = data[1],data[2]
		
		if doAdminStrictCheck(ply) then
			doCommand(ply, cmd, val, "SLIDER")
		else
			doKickInvalidAccess(ply, cmd, "SLIDER")
		end
	end,
	["SendTauntStateCmd"] = function(ply, data)
		local val = data[1]
		if doAdminStrictCheck(ply) then
			doCommand(ply, "ph_custom_taunt_mode", val, "TAUNTMODE")
		else
			doKickInvalidAccess(ply, "ph_custom_taunt_mode", "TAUNTMODE")
		end
	end,
	["PHXPickupCmdState"] = function(ply, data)
		local mode = data[1]
		if doAdminStrictCheck(ply) then
			doCommand(ply, "ph_allow_pickup_object", mode, "PICKUPMODE")
		else
			doKickInvalidAccess(ply, "ph_allow_pickup_object", "PICKUPMODE")
		end
	end,
	["SvCommandLang"] = function(ply, data)
		local lang = data[1]
		local cmd  = data[2]
		
		local l = PHX.LANGUAGES
		
		if (l[lang] == nil or table.IsEmpty(l[lang])) then
			ply:PHXChatPrint("Error: Language " .. lang .. " could not be found in Language Table.", Color(220,30,30))
			return
		end
		
		if doAdminStrictCheck(ply) then
			doCommand(ply, cmd, lang, "LANGSETTINGS")
		else
			doKickInvalidAccess(ply, cmd, "LANGSETTINGS")
		end
	end,
	["SvCommandTextEntry"] = function(ply, data)
		local val = data[1]
		local cmd = data[2]
		
		if doAdminStrictCheck(ply) then
			doCommand(ply, cmd, val, "TEXTENTRY")
		else
			doKickInvalidAccess(ply, cmd, "TEXTENTRY")
		end
	end,
    ["SvCheckboxReq"] = function(ply, data)
		local cmd       = data[1]
		local val       = data[2]
		
		if doAdminStrictCheck(ply) then
			doCommand(ply, cmd, val, "CHECKBOX" )
		else
			doKickInvalidAccess(ply, cmd, "CHECKBOX")
		end
	end,
}


local function ManageNetMessages(ply, netStr, data)
	net_functions[netStr](ply, data)
end

net.Receive("SvCommandReq", function(len, ply)
	local cmd = net.ReadString()
	local valbool = net.ReadString()
	
	ManageNetMessages(ply, "SvCommandReq", {cmd, valbool})
end)

net.Receive("SvCommandSliderReq", function(len, ply)
	local cmd = net.ReadString()
	local bool = net.ReadBool()
	local val
	if bool then val = net.ReadFloat() else val = net.ReadInt(16) end
	
	ManageNetMessages(ply, "SvCommandSliderReq", {cmd, val})
end)

net.Receive("SendTauntStateCmd", function(len, ply)
	local cmdval = net.ReadString()
	
	ManageNetMessages(ply, "SendTauntStateCmd", {cmdval})
end)

net.Receive("PHXPickupCmdState", function(len, ply)
	local mode = net.ReadUInt(3)
	
	ManageNetMessages(ply, "PHXPickupCmdState", {mode})
end)

net.Receive("SvCommandLang", function(len, ply)
	local lang	= net.ReadString()
	local cmd	= net.ReadString()
	
	ManageNetMessages(ply, "SvCommandLang", {lang, cmd})
end)

net.Receive("SvCommandTextEntry", function(len, ply)
	
	local value = net.ReadString()
	local cmd	= net.ReadString()
	
	ManageNetMessages(ply, "SvCommandTextEntry", {value, cmd})
	
end)
net.Receive("SvCheckboxReq", function(len, ply)
	local cmd       = net.ReadString()
	local val       = net.ReadString()
	
	ManageNetMessages(ply, "SvCheckboxReq", {cmd, val})
end)