-- All must Lower case only!

local admins = {
	"superadmin",
	"admin",
	"owner",
	"co-owner",
	"gamemode-author", -- you can move down below or remove it, it's up to you.
}

-- Custom Groups, for Prop Menu.
local donator = {
	"donator",
	"respected",
	"vip",
}

-- Add user group after Initialize hooks.
hook.Add("Initialize", "phx.AddUserGroups", function()
	if PHX and PHX ~= nil then return end -- cancel if PHX don't exists. Remove this line if you'd like to force.
	
	-- admin
	for _,v in pairs(admins) do PHX:AddAdminGroup( v ) end
	
	-- add to prop chooser & donator prop menu.
	--[[ Uncomment this to enable this.
	for _,v in pairs(donator) do
		PCR:AddToGroup( v )
		PMDR:AddToGroup( v )
	end
	]]--
	
	timer.Simple(1, function()
		--[[ 
			Uncomment this if you want to remove 'admin' for example.
			table.RemoveByValue(PHX.SVAdmins, "admin")
		]]--
	end)
end)