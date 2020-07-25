-- Todo: Need a better improvement for command management...

local function doAdminStrictCheck(ply)
	if (ply:IsAdmin() or ply:CheckUserGroup()) then
		return true
	else
		return false
	end
end

local function doCommand(ply, cmd, value, identifier)
	RunConsoleCommand(cmd, value)
	PHX.VerboseMsg("[PHX ADMIN CVAR "..identifier.." NOTIFY] Command '".. cmd .. "' has changed to " .. value .. " (Player: " .. ply:Nick().. " (" ..ply:SteamID() ..") )")
end

local function doKickInvalidAccess(ply, cmd, identifier)
	game.KickID(ply:SteamID(), "PHX Illegal server command access found from: "..ply:Nick())
	PHX.VerboseMsg("[PHX ADMIN CVAR "..identifier.." NOTIFY] Player "..ply:Nick().." (".. ply:SteamID() ..") is attempting to access "..cmd..", kicked!")
end

-- man I wish lua has some-sort of switch/case .
local net_functions = {
	["CheckAdminFirst"] = function(ply)
		if ( ply and IsValid(ply) and (ply:IsAdmin() or ply:CheckUserGroup()) ) then
			net.Start("CheckAdminResult")
			net.Send(ply)
		end
	end,
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
	end
}


local function ManageNetMessages(ply, netStr, data)
	net_functions[netStr](ply, data)
end

net.Receive("CheckAdminFirst", function(len, ply)
	ManageNetMessages(ply, "CheckAdminFirst")
end)

net.Receive("SvCommandReq", function(len, ply)
	local cmd = net.ReadString()
	local valbool = net.ReadInt(2)
	
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