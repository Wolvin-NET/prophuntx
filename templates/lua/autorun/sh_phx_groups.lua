
local admins = { -- use this to temporarily store admin groups without saving it. This will also have the "Admin Group Access" option.
	-- For control whose can access "Admin Settings", or set "Mute-able Groups", heads to F1 -> Prop Hunt Menu -> [ Group & Access Option ]
	-- Warning: Case Sensitive
	["superadmin"]		= true,
	["admin"]			= true,
	["owner"]			= true,
	["Co-Owner"]		= true,
	["Gamemode-Author"]	= true	-- you can move down below or remove it, it's up to you.
}

-- Custom Groups, for Prop Menu.
local donator = {
	-- Warning: lower case only!
	"donator",
	"respected",
	"vip",
}

-- Add user group after Initialize hooks.
hook.Add("Initialize", "phx.AddUserGroups", function()
	timer.Simple(1, function()
		
		if !PHX or PHX == nil then return end -- cancel if PHX don't exists. Remove this line if you'd like to force.
		if !PHX.SVAdmins or PHX.SVAdmins == nil then return end
	
		-- admin
		for k,v in pairs(admins) do PHX:AddAdminGroup( k ) end
		
		if !PCR or PCR == nil then return end -- cancel if Prop Menu don't exists.
		
		-- add to prop chooser & donator prop menu.
		for _,v in pairs(donator) do
			PCR:AddToGroup( v )
			
			-- if Donator Prop Menu installed, uncomment this:
			-- PMDR:AddToGroup( v )
		end
	end)
end)