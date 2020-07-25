
function GM:ShowHelp()

	--if ( !IsValid( Help ) ) then
	
		local Help = vgui.CreateFromTable( vgui_Splash )
		Help:SetHeaderText( GAMEMODE.Name or "Untitled Gamemode" )
		Help:SetForHelp( "HELP_F1" )
		-- Help:SetHoverText( GAMEMODE.Help or "No Help Avaliable" );
		-- Help:SetHoverText( "" );
		
		Help.lblFooterText.Think = function( panel ) 
										local tl = GAMEMODE:GetGameTimeLeft()
										if ( tl == -1 ) then return end
										if( GetGlobalBool( "IsEndOfGame", false ) ) then panel:SetText( "Game has ended..." ) return end
										if( GAMEMODE.RoundBased && CurTime() > GAMEMODE:GetTimeLimit() ) then panel:SetText( PHX:FTranslate("MISC_GAMEEND") or "Game will end after this round" ) return end
										
										local timeLeft = PHX:FTranslate("MISC_TIMELEFT", util.ToMinutesSeconds( tl )) or "Time Left: " .. util.ToMinutesSeconds( tl )
										
										panel:SetText( timeLeft )
									end

		if ( GetConVar( "fretta_voting" ):GetInt() ~= 0 ) then
			local btn = Help:AddSelectButton( PHX:FTranslate("DERMA_RTV") or "Vote For Change", function() RunConsoleCommand( "say", "rtv" ) end )
			btn.m_colBackground = Color( 255, 200, 100 )
			btn:SetDisabled( LocalPlayer():GetNWBool( "WantsVote" ) ) 
		end
		
		-- Internal Select buttons.
		local btnadd = Help:AddSelectButton(PHX:FTranslate("DERMA_PHMENU") or "Prop Hunt Menu", function()
			LocalPlayer():ConCommand("ph_x_menu")
		end)
		btnadd.m_colBackground = Color(255,128,40)
		
		-- Add a hook if you want to make another custom buttons by calling PH_AddSplashHelpButton.
		hook.Call("PH_AddSplashHelpButton", nil, Help)
		
		if ( GAMEMODE.TeamBased ) then
			local btn = Help:AddSelectButton( PHX:FTranslate("DERMA_CHANGETEAM") or "Change Team", function() GAMEMODE:ShowTeam() end )
			btn.m_colBackground = Color( 120, 255, 100 )
		end
		
		if ( !GAMEMODE.TeamBased && GAMEMODE.AllowSpectating ) then
		
			if ( LocalPlayer():Team() == TEAM_SPECTATOR ) then
			
				local btn = Help:AddSelectButton( "Join Game", function() RunConsoleCommand( "changeteam", TEAM_UNASSIGNED ) end )
				btn.m_colBackground = Color( 120, 255, 100 )
			
			else
		
				local btn = Help:AddSelectButton( "Spectate", function() RunConsoleCommand( "changeteam", TEAM_SPECTATOR ) end )
				btn.m_colBackground = Color( 200, 200, 200 )
				
			end
		end
		
		if ( IsValid( LocalPlayer() ) ) then
		
			local TeamID = LocalPlayer():Team()
			local Classes = team.GetClass( TeamID )
			if ( Classes && #Classes > 1 ) then
				local btn = Help:AddSelectButton( "Change Class", function() GAMEMODE:ShowClassChooser( LocalPlayer():Team() ) end )
				btn.m_colBackground = Color( 120, 255, 100 )
			end
		
		end
				
		Help:AddCancelButton()
		
		if ( GAMEMODE.SelectModel ) then
		
			local function CreateModelPanel()
							
				local pnl = vgui.Create( "DGrid" )
			
				pnl:SetCols( 6 )
				pnl:SetColWide( 66 )
				pnl:SetRowHeight( 66 )
			
				for name, model in pairs( list.Get( "PlayerOptionsModel" ) ) do
					
					local icon = vgui.Create( "SpawnIcon" )
					icon.DoClick = function() surface.PlaySound( "ui/buttonclickrelease.wav" ) RunConsoleCommand( "cl_playermodel", name ) end
					icon.PaintOver = function() if ( GetConVarString( "cl_playermodel" ) == name ) then surface.SetDrawColor( Color( 255, 210 + math.sin(RealTime()*10)*40, 0 ) ) surface.DrawOutlinedRect( 4, 4, icon:GetWide()-8, icon:GetTall()-8 ) surface.DrawOutlinedRect( 3, 3, icon:GetWide()-6, icon:GetTall()-6 ) end end
					icon:SetModel( model )
					icon:SetSize( 64, 64 )
					icon:SetTooltip( name )
						
					pnl:AddItem( icon )
					
				end
				
				return pnl
				
			end
			
			Help:AddPanelButton( "icon16/user.png", "Choose Player Model", CreateModelPanel )
		
		end
		
		if ( GAMEMODE.SelectColor ) then
		
			local function CreateColorPanel()
							
				local pnl = vgui.Create( "DGrid" )
			
				pnl:SetCols( 10 )
				pnl:SetColWide( 36 )
				pnl:SetRowHeight( 128 )
			
				for name, colr in pairs( list.Get( "PlayerColours" ) ) do
					
					local icon = vgui.Create( "DButton" )
					icon:SetText( "" )
					icon.DoClick = function() surface.PlaySound( "ui/buttonclickrelease.wav" ) RunConsoleCommand( "cl_playercolor", name ) end
					icon.Paint = function() surface.SetDrawColor( colr ) icon:DrawFilledRect() end
					icon.PaintOver = function() if ( GetConVarString( "cl_playercolor" ) == name ) then surface.SetDrawColor( Color( 255, 210 + math.sin(RealTime()*10)*40, 0 ) ) surface.DrawOutlinedRect( 4, 4, icon:GetWide()-8, icon:GetTall()-8 ) surface.DrawOutlinedRect( 3, 3, icon:GetWide()-6, icon:GetTall()-6 ) end end
					icon:SetSize( 32, 128 )
					icon:SetTooltip( name )
						
					pnl:AddItem( icon )
					
				end
				
				return pnl
				
			end
			
			Help:AddPanelButton( "icon16/application_view_tile.png", "Choose Player Color", CreateColorPanel )
			
		end

	-- end
	
	Help:MakePopup()
	Help:NoFadeIn()
	
end
