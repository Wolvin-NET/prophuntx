
local hudScreen = nil
local Alive = false
local Class = nil
local Team = 0
local WaitingToRespawn = false
local InRound = false
local RoundResult = 0
local RoundWinner = nil
local IsObserver = false
local ObserveMode = 0
local ObserveTarget = NULL
local InVote = false

function GM:AddHUDItem( item, pos, parent )
	hudScreen:AddItem( item, parent, pos )
end

function GM:HUDNeedsUpdate()

	if ( !IsValid( LocalPlayer() ) ) then return false end

	if ( Class != LocalPlayer():GetNWString( "Class", "Default" ) ) then return true end
	if ( Alive != LocalPlayer():Alive() ) then return true end
	if ( Team != LocalPlayer():Team() ) then return true end
	if ( WaitingToRespawn != ( (LocalPlayer():GetNWFloat( "RespawnTime", 0 ) > CurTime()) && LocalPlayer():Team() != TEAM_SPECTATOR && !LocalPlayer():Alive()) ) then return true end
	if ( InRound != GetGlobalBool( "InRound", false ) ) then return true end
	if ( RoundResult != GetGlobalInt( "RoundResult", 0 ) ) then return true end
	if ( RoundWinner != GetGlobalEntity( "RoundWinner", nil ) ) then return true end
	if ( IsObserver != LocalPlayer():IsObserver() ) then return true end
	if ( ObserveMode != LocalPlayer():GetObserverMode() ) then return true end
	if ( ObserveTarget != LocalPlayer():GetObserverTarget() ) then return true end
	if ( InVote != GAMEMODE:InGamemodeVote() ) then return true end
	
	return false
end

function GM:OnHUDUpdated()
	Class = LocalPlayer():GetNWString( "Class", "Default" )
	Alive = LocalPlayer():Alive()
	Team = LocalPlayer():Team()
	WaitingToRespawn = (LocalPlayer():GetNWFloat( "RespawnTime", 0 ) > CurTime()) && LocalPlayer():Team() != TEAM_SPECTATOR && !Alive
	InRound = GetGlobalBool( "InRound", false )
	RoundResult = GetGlobalInt( "RoundResult", 0 )
	RoundWinner = GetGlobalEntity( "RoundWinner", nil )
	IsObserver = LocalPlayer():IsObserver()
	ObserveMode = LocalPlayer():GetObserverMode()
	ObserveTarget = LocalPlayer():GetObserverTarget()
	InVote = GAMEMODE:InGamemodeVote()
end

function GM:OnHUDPaint()

end

function GM:RefreshHUD()

	if ( !GAMEMODE:HUDNeedsUpdate() ) then return end
	GAMEMODE:OnHUDUpdated()
	
	if ( IsValid( hudScreen ) ) then hudScreen:Remove() end
	hudScreen = vgui.Create( "DHudLayout" )
	
	if ( InVote ) then return end
	
	if ( RoundWinner and RoundWinner != NULL ) then
		GAMEMODE:UpdateHUD_RoundResult( RoundWinner, Alive )
	elseif ( RoundResult != 0 ) then
		GAMEMODE:UpdateHUD_RoundResult( RoundResult, Alive )
	elseif ( IsObserver ) then
		GAMEMODE:UpdateHUD_Observer( WaitingToRespawn, InRound, ObserveMode, ObserveTarget )
	elseif ( !Alive ) then
		GAMEMODE:UpdateHUD_Dead( WaitingToRespawn, InRound )
	else
		GAMEMODE:UpdateHUD_Alive( InRound )
		
		if ( GetGlobalBool( "RoundWaitForPlayers" ) && ( ( team.NumPlayers( TEAM_HUNTERS ) < 1 ) || ( team.NumPlayers( TEAM_PROPS ) < 1 ) ) ) then
			GAMEMODE:UpdateHUD_WaitForPlayers( InRound )
		end
	end
	
end

function GM:HUDPaint()

	self.BaseClass:HUDPaint()
	
	GAMEMODE:OnHUDPaint()
	GAMEMODE:RefreshHUD()
	
end

function GM:UpdateHUD_WaitForPlayers( InRound )

	if ( InRound && Alive ) then
	
		local WaitText = vgui.Create( "DHudElement" );
			WaitText:SizeToContents()
			WaitText.Think = function(self)
				self:SetText( PHX:FTranslate("HUD_WAITPLY") or "Waiting for players..." )
			end
		GAMEMODE:AddHUDItem( WaitText, 8 )
	
	end

end

function GM:UpdateHUD_RoundResult( RoundResult, Alive )

	local txt = GetGlobalString( "RRText" )
	
	--hax
	local propTeam = GetGlobalInt( "RoundResult", 0 )
	
	-- doesn't required but we'll keep this.
	if ( type( RoundResult ) == "number" ) && ( team.GetAllTeams()[ RoundResult ] && txt == "" ) then
		local TeamName = team.GetName( RoundResult )
		if ( TeamName ) then txt = TeamName .. " Wins!" end
	elseif ( type( RoundResult ) == "Player" && IsValid( RoundResult ) && txt == "" ) then
		txt = RoundResult:Name() .. " Wins!"
	end

	local RespawnText = vgui.Create( "DHudElement" );
		RespawnText:SizeToContents()
		RespawnText:SetText( PHX:FTranslate(txt, PHX:TranslateName(propTeam)) or txt )
		--RespawnText:SetText( PHX:FTranslate(txt, team.GetName(propTeam)) or txt )
	GAMEMODE:AddHUDItem( RespawnText, 8 )

end

function GM:UpdateHUD_Observer( bWaitingToSpawn, InRound, ObserveMode, ObserveTarget )

	local lbl = nil
	local txt = nil
	local col = Color( 255, 255, 255 );

	if ( IsValid( ObserveTarget ) && ObserveTarget:IsPlayer() && ObserveTarget != LocalPlayer() && ObserveMode != OBS_MODE_ROAMING ) then
		lbl = PHX:FTranslate("HUD_SPECTATING") or "SPECTATING"
		txt = ObserveTarget:Nick()
		col = team.GetColor( ObserveTarget:Team() );
	end
	
	if ( ObserveMode == OBS_MODE_DEATHCAM || ObserveMode == OBS_MODE_FREEZECAM ) then
		txt = PHX:FTranslate("HUD_YOUDIED") or "You Died!"
	end
	
	if ( txt ) then
		local txtLabel = vgui.Create( "DHudElement" );
		txtLabel:SetText( txt )
		if ( lbl ) then txtLabel:SetLabel( lbl ) end
		txtLabel:SetTextColor( col )
		
		GAMEMODE:AddHUDItem( txtLabel, 2 )		
	end

	
	GAMEMODE:UpdateHUD_Dead( bWaitingToSpawn, InRound )

end

function GM:UpdateHUD_Dead( bWaitingToSpawn, InRound )

	if ( !InRound && GAMEMODE.RoundBased ) then
	
		local RespawnText = vgui.Create( "DHudElement" );
			RespawnText:SizeToContents()
			RespawnText:SetText( "Waiting for round start" )
		GAMEMODE:AddHUDItem( RespawnText, 8 )
		return
		
	end

	if ( bWaitingToSpawn ) then

		local RespawnTimer = vgui.Create( "DHudCountdown" );
			RespawnTimer:SizeToContents()
			RespawnTimer:SetValueFunction( function() return LocalPlayer():GetNWFloat( "RespawnTime", 0 ) end )
			RespawnTimer:SetLabel( "SPAWN IN" )
		GAMEMODE:AddHUDItem( RespawnTimer, 8 )
		return

	end
	
	--[[
	if ( InRound ) then
	
		local RoundTimer = vgui.Create( "DHudCountdown" );
			RoundTimer:SizeToContents()
			RoundTimer:SetValueFunction( function() 
											if ( GetGlobalFloat( "RoundStartTime", 0 ) > CurTime() ) then return GetGlobalFloat( "RoundStartTime", 0 )  end 
											return GetGlobalFloat( "RoundEndTime" ) end )
			RoundTimer:SetLabel( "TIME" )
		GAMEMODE:AddHUDItem( RoundTimer, 8 )
		return
	
	end
	]]--
	
	local Bar = vgui.Create( "DHudBar" )
	GAMEMODE:AddHUDItem( Bar, 8 )
	
	-- This should show on dead players too	
	
	if ( InRound ) then 
	
		local TeamIndicator_Name_AddString = PHX:FTranslate("HUD_DEAD") or "(DEAD) "
		local phxTeamText = PHX:TranslateName( LocalPlayer():Team() )
		if ( LocalPlayer():Team() == TEAM_SPECTATOR ) then TeamIndicator_Name_AddString = "" end
	
		local TeamIndicator = vgui.Create( "DHudUpdater" );
			TeamIndicator:SizeToContents()
			TeamIndicator:SetValueFunction( function() 
												--return TeamIndicator_Name_AddString..""..team.GetName( LocalPlayer():Team() )
												return TeamIndicator_Name_AddString .. phxTeamText
											end )
			TeamIndicator:SetColorFunction( function() 
												return team.GetColor( LocalPlayer():Team() )
											end )
			TeamIndicator:SetFont( "HudSelectionText" )
		Bar:AddItem( TeamIndicator )
	
		local RoundNumber = vgui.Create( "DHudUpdater" );
			RoundNumber:SizeToContents()
			RoundNumber:SetValueFunction( function() return GetGlobalInt( "RoundNumber", 0 ) end )
			RoundNumber:SetLabel( PHX:FTranslate("HUD_ROUND") or "ROUND" )
		Bar:AddItem( RoundNumber )
		
		local RoundTimer = vgui.Create( "DHudCountdown" );
			RoundTimer:SizeToContents()
			RoundTimer:SetValueFunction( function() 
											if ( GetGlobalFloat( "RoundStartTime", 0 ) > CurTime() ) then return GetGlobalFloat( "RoundStartTime", 0 )  end 
											return GetGlobalFloat( "RoundEndTime" ) end )
			RoundTimer:SetLabel( PHX:FTranslate("HUD_TIME") or "TIME" )
		Bar:AddItem( RoundTimer )

	end
	
	if ( Team != TEAM_SPECTATOR && !Alive && !GAMEMODE.RoundBased ) then
	
		local RespawnText = vgui.Create( "DHudElement" );
			RespawnText:SizeToContents()
			RespawnText:SetText( "Press Fire to Spawn" )
		GAMEMODE:AddHUDItem( RespawnText, 8 )
		
	end

end

function GM:UpdateHUD_Alive( InRound )

	if ( GAMEMODE.RoundBased || GAMEMODE.TeamBased ) then
	
		local Bar = vgui.Create( "DHudBar" )
		GAMEMODE:AddHUDItem( Bar, 2 )

		if ( GAMEMODE.TeamBased && GAMEMODE.ShowTeamName ) then
		
			local TeamIndicator = vgui.Create( "DHudUpdater" );
				TeamIndicator:SizeToContents()
				TeamIndicator:SetValueFunction( function() 
													--return team.GetName( LocalPlayer():Team() )
													return PHX:TranslateName( LocalPlayer():Team() )
												end )
				TeamIndicator:SetColorFunction( function() 
													return team.GetColor( LocalPlayer():Team() )
												end )
				TeamIndicator:SetFont( "HudSelectionText" )
			Bar:AddItem( TeamIndicator )
			
		end
		
		if ( GAMEMODE.RoundBased ) then 
		
			local RoundNumber = vgui.Create( "DHudUpdater" );
				RoundNumber:SizeToContents()
				RoundNumber:SetValueFunction( function() return GetGlobalInt( "RoundNumber", 0 ) end )
				RoundNumber:SetLabel( PHX:FTranslate("HUD_ROUND") or "ROUND" )
			Bar:AddItem( RoundNumber )
			
			local RoundTimer = vgui.Create( "DHudCountdown" );
				RoundTimer:SizeToContents()
				RoundTimer:SetValueFunction( function() 
												if ( GetGlobalFloat( "RoundStartTime", 0 ) > CurTime() ) then return GetGlobalFloat( "RoundStartTime", 0 )  end 
												return GetGlobalFloat( "RoundEndTime" ) end )
				RoundTimer:SetLabel( PHX:FTranslate("HUD_TIME") or "TIME" )
			Bar:AddItem( RoundTimer )

		end
		
	end

end

--[[
	this thing is obsolete/depcretaed. Sorry!

function GM:UpdateHUD_AddedTime( iTimeAdded )
	// to do or to override, your choice
end
usermessage.Hook( "RoundAddedTime", function( um ) if( GAMEMODE && um ) then GAMEMODE:UpdateHUD_AddedTime( um:ReadFloat() ) end end )
]]--