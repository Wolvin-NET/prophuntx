PCR = {}
PCR.__index = PCR

PCR._VERSION = "X2Z v2"

PCR.BannedProp = {}
PCR.CustomProp = {}

-- Add custom donator here. Lowercase only! - This will only checks if 'pcr_only_allow_certain_groups' is set to 1.
PCR.ConfigGroup = {
	["moderator"] 	= true, -- operator, developer, and stuff might need to be added here.
	["developer"] 	= true,
	["donator"] 	= true,
	["vip"]			= true,
}
function PCR:CheckUserGroup( ply )
	if self.ConfigGroup[string.lower( ply:GetUserGroup() )] or ply:IsAdmin() then
		return true
	end
	return false
end
function PCR:AddToGroup( strGroup )
	if !strGroup then return end
	
	if self.ConfigGroup[strGroup] then
		PHX.VerboseMsg("[PCR] The usergroup you entered '" .. strGroup .. "' was exist.")
	else
		self.ConfigGroup[strGroup]	= true
	end
end

if SERVER then
	hook.Add("PlayerButtonDown","PCR.PressedKey",function(ply, btn)
		if (btn == ply:GetInfoNum( "ph_prop_menu_key", 0 )) and ply:Team() == TEAM_PROPS and ply:Alive() then
			if PHX:QCVar("pcr_use_ulx_menu") then
				ply:ConCommand("ulx propmenu")
			else
				ply:ConCommand("ph_prop_menu")
			end
		end
	end)
end

if CLIENT then

	local ADDON_INFO = {
		-- name, version, info ARE NOT TRANSLATEABLE!!!
		name	= "Prop Menu", 	-- DO NOT TRANSLATE
		version	= PCR._VERSION, -- DO NOT TRANSLATE
		info	= "Prop Menu Integrated Plugin for Prop Hunt: X", -- DO NOT TRANSLATE
		
		settings = {
			{"", "label", false, "PCR_PLUG_LBL_BINDKEY" },
			
			{"", "label", false, "PCR_PLUG_LBL_EDITOR" },
			{"", "btn", {
				[1] = {"PCR_PLUG_BTN_OPEN_EDT", function()
					if PHX:GetCVar( "pcr_allow_custom" ) then
						if LocalPlayer():CheckUserGroup() or LocalPlayer():IsSuperAdmin() then
							net.Start("phxpm.fb_RequestOpen_w")
							net.SendToServer()
						end
					else
						PHX:MsgBox(
							"PCR_PLUG_WARN_MSG",
							"PCR_WINDOW_TITLE",
							"MISC_OK"
						)
					end
				end}
			}, ""},
			
			{"", "label", false, "PCR_PLUG_LBL_COMSET" },
			{"pcr_enable", "check", "SERVER", "PCR_PLUG_ENABLE"},
			{"pcr_allow_custom", "check", "SERVER", "PCR_PLUG_ALLOW_CUSTOM" },
			{"pcr_enable_prop_ban", "check", "SERVER", "PCR_PLUG_PROP_BAN" },
			{"pcr_max_use" , "slider", {min = -1, max = 20, init = "DEF_CONVAR", dec = 0, kind = "SERVER"}, "PCR_PLUG_USAGE_LIMIT"},
			{"pcr_limit_enable", "check", "SERVER", "PCR_PLUG_PROP_LIMIT"},
			--{"pcr_max_prop_list" , "slider", {min = 20, max = 2048, init = 100, dec = 0, kind = "SERVER"}, "PCR_PLUG_PROP_LIMITMAX"},
			{"pcr_max_prop_list" , "slider", {min = 20, max = 2048, dec = 0, kind = "SERVER"}, "PCR_PLUG_PROP_LIMITMAX"}, -- missing init, test
			
			{"", "label", false, "PCR_PLUG_LBL_TECHSET" },
			{"pcr_use_ulx_menu", "check", "SERVER", "PCR_PLUG_USE_ULXMENU" },
			{"pcr_delay_use" , "slider", {min = 1, max = 10, dec = 0, kind = "SERVER"}, "PCR_PLUG_USE_DELAY"}, --missing init, test
			{"pcr_kick_invalid", "check", "SERVER", "PCR_PLUG_KICK_INVALID"},
			{"pcr_use_room_check", "check", "SERVER", "PCR_PLUG_SPACE_CHECK"},
			
			{"", "label", false, "PCR_PLUG_LBL_EXPSET" },
			{"pcr_enable_bbox_limit", "check", "SERVER", "PCR_PLUG_X_BBOX" },
			{"pcr_bbox_max_height" , "slider", {min = 16, max = 256, "DEF_CONVAR", dec = 0, kind = "SERVER"}, "PCR_PLUG_X_BBOX_MAX" },
			{"pcr_bbox_max_width" , "slider", {min = 16, max = 256, "DEF_CONVAR", dec = 0, kind = "SERVER"}, "PCR_PLUG_X_BBOX_MIN" },
			
			{"", "label", false, "PCR_PLUG_LBL_PLAYERSET" },
			{"pcr_only_allow_certain_groups", "check", "SERVER", "PCR_PLUG_ONLY_GROUPS" },
			{"pcr_notify_messages", "check", "SERVER", "PCR_PLUG_NOTIFYMSG"},
		},
		
		client	= {}
	}
	list.Set("PHX.Plugins","Prop Chooser",ADDON_INFO)
end