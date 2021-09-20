-- Currently, this isn't translated. Maybe in future version of PH:X, sorry everyone!

local serverContents = {}
serverContents["GAME"]	= "All Contents (Not All Players/Server will have same contents as you)"
serverContents["MOD"]	= "Garry's Mod"

hook.Add("InitPostEntity", "reqServerContent", function()
	net.Start("PCR.RequestServerGameContents")
	net.SendToServer()
end)

net.Receive("PCR.TheServerGameContents", function()
	local size = net.ReadUInt(16)
	local data = net.ReadData(size)
	
	local tblGames = util.JSONToTable(util.Decompress(data))
	
	local games = engine.GetGames()
	for _,v in pairs(games) do
		if tblGames[v.folder] and tblGames[v.folder] ~= nil then
			if !v.mounted then -- add subfix if any game contents aren't mounted by client.
				tblGames[v.folder] = v.title .. " [Not Mounted]"
			end
		end
	end
	
	for modname,title in pairs(tblGames) do
		serverContents[modname] = title
	end
end)

--[[	
-- Placeholder --
local serverContents = {
	["GAME"]		= "All Contents",
	["MOD"]			= "Garry's Mod",
	["cstrike"]		= "Counter-Strike: Source",
	["hl2"]			= "Half-Life 2",
	["ep2"]			= "Half-Life 2: Episode 2",
	["episodic"] 	= "Half-Life 2: Episode 1",
	["tf"] 			= "Team Fortress 2"
}
]]--

local thePanel = {}
thePanel.isOpen = false
net.Receive("phxpm.fb_openPM_Editor", function()

	local ply = LocalPlayer()

	if ply:CheckUserGroup() or ply:IsSuperAdmin() then

		if PHX:GetCVar( "pcr_allow_custom" ) then
			local isFor = net.ReadTable()
			thePanel = PHXPM_openFileBrowser( ply, isFor.global, isFor.sub, serverContents )
		else
			chat.AddText(Color(220,0,0), "[Prop Menu] Error: Custom Prop Addition is Disabled!")
		end
	
	end
	
end)

net.Receive("phxpm.fb_UpdateConfirmed_Editor", function()
	local isError = net.ReadBool()
	local ply = LocalPlayer()
	
	if ply:CheckUserGroup() or ply:IsSuperAdmin() then
	
	  local fail = false
	
		if isError then
			Derma_Message("Your changes hasn't been saved due to Errors.\nPlease check on your server console!", "Warning", "OK")
			fail = true
		else
			Derma_Message("Your changes and Custom Prop data has has been saved and updated successfully.", "Info", "OK")
		end

		if thePanel and thePanel.isOpen and (thePanel.frame and thePanel.frame ~= nil) and thePanel.frame:IsValid() then
			thePanel.btnApply:SetDisabled(false)
			thePanel.btnCancel:SetDisabled(false)
			thePanel.btn:SetDisabled(false)
			thePanel:updatePreview()
			
			if fail then
				thePanel.isHaventSave = true
			else
				thePanel.isHaventSave = false
			end
		end
	
	end
	
end)