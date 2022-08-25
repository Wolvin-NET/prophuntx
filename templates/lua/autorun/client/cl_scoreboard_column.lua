
hook.Add("PH_AddColumnScoreboard", "Level System Dummy", function( ScoreBoard, AddScoreboardCustom )

	-- AddScoreboardCustom Callbacks:
	--[[
		string 	Name 
			Name of Column Header. e.g: "Ping"
		
		number 	intFixedWidth
			Width in pixel. Default is 24~32
		
		function Callback ( player )
			Function callback that return something.

		number UpdateRate
			Rate in seconds to update. Usually 0.5 for ping.
		
		number TeamID
			Team ID to make this appear? Default is 'nil' for both Teams.
		
		number HeaderAlign
			Text Alignment for the Header. See:https://wiki.facepunch.com/gmod/Panel:SetContentAlignment
		
		number ValueAlign
			Text Alignment for their Values. See: https://wiki.facepunch.com/gmod/Panel:SetContentAlignment
		
		string Font
			Font to be used. Default is 'nil'. "Marlett" is used for RTV.
	]]

	-- A Demontrastion of usage
	
	local f = function(ply) return "123" end
	AddScoreboardCustom( "Level", 48, f, 0.5, nil, 4, 4 )
end)

-- Another Example
hook.Add("PH_AddColumnScoreboard", "ShowAllPlayerHealthbutProp", function( ScoreBoard, AddScoreboardCustom )

	local f = function(ply)
		local hp = 100
		
		if ply:Team() == TEAM_HUNTERS then
			hp = ply:Health() -- show hunter's health instead.
		else
			hp = "X" -- don't show props health.
		end
		
		return hp
	end

	AddScoreboardCustom( "HP", 32, f, 0.25, nil, 5, 5 )
end)