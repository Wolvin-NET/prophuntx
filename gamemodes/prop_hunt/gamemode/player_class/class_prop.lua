-- Create new class
local CLASS = {}


-- Some settings for the class
CLASS.DisplayName			= "Prop"
CLASS.WalkSpeed 			= 250
CLASS.CrouchedWalkSpeed 	= 0.2
CLASS.RunSpeed				= 275
CLASS.DuckSpeed				= 0.2
CLASS.DrawTeamRing			= false

-- Prevent 'mod_studio: MOVETYPE_FOLLOW with No Models error.'
CLASS.DrawViewModel			= false


-- Called by spawn and sets loadout
function CLASS:Loadout(pl)
	-- Props don't get anything
end


-- Called when player spawns with this class
function CLASS:OnSpawn(pl)
	pl:SetColor(Color(0,0,0,0))
	pl:SetCustomCollisionCheck(true)
	pl:SetupHands()
	pl:SetAvoidPlayers(true)
	pl:CrosshairEnable()
	
	-- Initial Setup during Prop choosing a props. Jump-Duck may still required somehow.
	-- do not use PHSetView!
	pl:SetViewOffset( Vector(0,0,64) )
    pl:SetViewOffsetDucked( Vector(0,0,28) )
	
	-- Prevent 'mod_studio: MOVETYPE_FOLLOW with No Models error.'
	pl:DrawViewModel( false )
    
    -- Create Prop Entity
    pl:CreatePlayerPropEntity()
	
	-- Do not allow Pitch Rotation until the prop is changing to a new prop.
	pl:EnablePropPitchRot( false )
    
    -- Set Color
    pl:PHSetColor()
	
	-- Delay start the AutoTaunt stuff
	timer.Simple(1, function()
		if IsValid(pl) and pl:Alive() then
			net.Start("AutoTauntSpawn")
			net.Send(pl)
		end
	end)
	
	pl.ph_prop.max_health = 100
end


-- Hands
function CLASS:GetHandsModel()
	return
end


-- Called when a player dies with this class
function CLASS:OnDeath(pl, attacker, dmginfo)
	pl:RemoveProp()
	-- reset the Prop Rotating State.
	pl:SendRotState(0)
    pl:PHResetView()
end


-- Register
player_class.Register("Prop", CLASS)