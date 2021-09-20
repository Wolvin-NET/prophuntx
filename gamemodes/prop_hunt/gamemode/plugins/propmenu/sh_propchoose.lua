PCR = {}
PCR.__index = PCR

PCR._VERSION = "X2Z"

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

	-- Do not attempt to translate this because this was part of Legacy Addon imported into PHX and any translation you made will only loaded once after the gamemode is loaded!
	-- I'm currently attempting to make a newer format in Prop Hunt: Zero about Plugins which is neater. So please Keep in this way!
	local ADDON_INFO = {
		name	= "Prop Menu",
		version	= PCR._VERSION,
		info	= "Prop Menu Integrated Plugin. Press [ "..  input.GetKeyName( PHX:GetCLCVar( "ph_prop_menu_key" ) ):upper() .." ] to open Prop Menu.",
		
		settings = {
			{"", "label", false, "To change bind keys, go to [Player] tab." },
			
			{"", "label", false, "Prop Menu Editor (Custom Prop Only)" },
			{"", "btn", {max = 1, textdata = {
				[1] = {"Open Custom Prop Editor (BETA)", function()
					if PHX:GetCVar( "pcr_allow_custom" ) then
						if LocalPlayer():CheckUserGroup() or LocalPlayer():IsSuperAdmin() then
							net.Start("phxpm.fb_RequestOpen_w")
							net.SendToServer()
						end
					else
						Derma_Message(
							"Warning: Custom Prop Addition (pcr_allow_custom) is set to 0.\nYou Must Enable this feature in order to edit your custom prop!\nAfter enabling this feature, a Map Change is also required!",
							"Warning",
							"OK"
						)
					end
				end} }
			}, ""},
			
			{"", "label", false, "Common Settings" },
			{"pcr_enable", "check", "SERVER", "Enable Prop Chooser feature"},
			{"pcr_allow_custom", "check", "SERVER", "(Require Map Change) Allow custom prop to be included in to list?" },
			{"pcr_enable_prop_ban", "check", "SERVER", "(Require Map Change) Do not include banned props into Prop Chooser list?" },
			{"pcr_max_use" , "slider", {min = -1, max = 20, init = 3, dec = 0, kind = "SERVER"}, "Maximum usage limit for player use this feature. -1 means unlimited usage."},
			{"pcr_limit_enable", "check", "SERVER", "(Require Map Change) Limit addition to Prop Chooser list. (see 'pcr_max_prop_list' for how many models you'll needed.)"},
			{"pcr_max_prop_list" , "slider", {min = 20, max = 2048, init = 100, dec = 0, kind = "SERVER"}, "Maximum number of props that will be listed into Prop Chooser list."},
			
			{"", "label", false, "Technical Settings" },
			{"pcr_use_ulx_menu", "check", "SERVER", "Should Prop Menu can be accessed by Console command (0) or ULX command (1)?" },
			{"pcr_delay_use" , "slider", {min = 1, max = 10, init = 2, dec = 0, kind = "SERVER"}, "Delay in seconds before player use next Props in Prop Chooser menu."},
			{"pcr_kick_invalid", "check", "SERVER", "Kick any user attempt to access Invalid Model (4x Maximum threshold)"},
			{"pcr_use_room_check", "check", "SERVER", "Use room check before player use other objects?"},
			
			{"", "label", false, "Experimental" },
			{"pcr_enable_bbox_limit", "check", "SERVER", "(Require Map Change) Check Entity BBox Limit before adding to Prop Chooser list." },
			{"pcr_bbox_max_height" , "slider", {min = 16, max = 256, init = 96, dec = 0, kind = "SERVER"}, "BBox CollissionBound Maximum Height Limit." },
			{"pcr_bbox_max_width" , "slider", {min = 16, max = 256, init = 72, dec = 0, kind = "SERVER"}, "BBox CollissionBound Maximum Width Limit." },
			
			{"", "label", false, "Players" },
			{"pcr_only_allow_certain_groups", "check", "SERVER", "Should Prop Menu can only accessed by certain groups? (e.g: Donator, etc...)" },
			{"pcr_notify_messages", "check", "SERVER", "Notify a message on how to use Prop Chooser?"},
		},
		
		client	= {}
	}
	list.Set("PHX.Plugins","Prop Chooser",ADDON_INFO)
end