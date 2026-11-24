concommand.Add( "pcr_debug_model_list",function( ply )
	if ( (game.IsDedicated() and ply == NULL) ) then
		PrintTable(PCR.PropList)
	else
		if ( ply:PHXIsStaff() ) then
			ply:ChatPrint("[Prop Menu] Check on your Console!")
			PrintTable(PCR.PropList)
		else
			ply:ChatPrint("[Prop Menu] Sorry, you can not use this command.")
		end
	end
end)

if CLIENT then
	concommand.Add("pcr_help", function()
		PCR.openTutorialWindow()
	end)
end

-- ULX
local CATEGORY_NAME = PHX.TITLE
local function PHX_PropMenu( calling_ply )
	if PCR and PCR ~= nil then		  
		if PHX:QCVar( "pcr_use_ulx_menu" ) then
			calling_ply:SendLua("PCR:OpenPropMenu()")
		else
		    local btn = calling_ply:GetInfoNum( "ph_prop_menu_key", 0 )
			calling_ply:PHXChatInfo("NOTICE", "PCR_CMD_ULX_DISABLED", btn)
		end
	end
end

if (!ulx or ulx == nil) then
	print("[Prop Menu:ULX] WARNING: ULX is not installed! Not going to add propmenu ...")
else
	local cmd = ulx.command( CATEGORY_NAME, "ulx propmenu", PHX_PropMenu, "!propmenu" )
	cmd:defaultAccess( ULib.ACCESS_ALL )
	cmd:help( "Open PHX Prop Menu" )
end