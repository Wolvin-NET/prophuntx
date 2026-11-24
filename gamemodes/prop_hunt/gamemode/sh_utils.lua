function util.IsHexColor( str )

    if str == nil then return false end

    if string.find( str,'^#?%x%x%x%x%x%x$') then
        return true
    end
    return false
    
end

function util.ColorToVector( tblColor )
    if istable( tblColor ) then
        return Vector( tblColor.r/255, tblColor.g/255, tblColor.b/255 )
    end
    
    return Vector( 1, 1, 1 )
end

function util.PHXQuickCompress( tbl )
    local j = util.TableToJSON( tbl )
    local c = util.Compress( j )
    
    if (c) then
        return c,c:len()
    end

    return nil,0
end

function util.PHXQuickDecompress( data )
    local j = util.Decompress( data )
    local t = util.JSONToTable( j ) or {}
    
    return t
end

-- https://stackoverflow.com/a/17120745
function table.CustomShuffle(array)
	local counter = #array

	while counter > 1 do
		local index = math.random(counter)
		array[index], array[counter] = array[counter], array[index]
		counter = counter - 1
	end
end

if SERVER then
	function util.IsStaff( ply )
		if ( (game.IsDedicated() and ply == NULL) or (ply ~= NULL and ply:PHXIsStaff()) ) then
			return true
		end
		
		return false
	end
end

if CLIENT then
    function OpenTPSAdjust()
        PHX:TPSAdjust( nil, { 
            x=GetConVar("ph_tpcam_dist"):GetInt(), 
            y=GetConVar("ph_tpcam_right"):GetInt(), 
            z=GetConVar("ph_tpcam_up"):GetInt()
        })
    end
end

-- Useful ULX Stuff
if (!ulx or ulx == nil) then
    PHX:VerboseMsg( "[ULX:Addition] ULX Is Not available to create additional PH:X features, skipping...",2)
    return
end
-- Force End Round, sadmin
local function ForceEND( calling_ply )
    if (calling_ply) and IsValid(calling_ply) then
        calling_ply:ConCommand("ph_force_end_round")
    else
        print("Forcing End Round...")
        RunConsoleCommand("ph_force_end_round","")
    end
end
local endround = ulx.command( PHX.TITLE, "ulx phforceend", ForceEND, "!phforceend" )
endround:defaultAccess( ULib.ACCESS_SUPERADMIN )
endround:help( "Force End current round" )

-- TPS Adjust
local function AdjustTPS( calling_ply )
	calling_ply:SendLua("OpenTPSAdjust()")
    calling_ply:ConCommand("xgui hide")
end
local adjtps = ulx.command( PHX.TITLE, "ulx ph3padjust", AdjustTPS, "!ph3padjust" )
adjtps:defaultAccess( ULib.ACCESS_ALL )
adjtps:help( "Adjust 3rd person view, you need to be alive Hunter in order to open setting window" )

-- Open Menu
local function OpenMenu( calling_ply )
	calling_ply:ConCommand("ph_x_menu")
end
local openmenu = ulx.command( PHX.TITLE, "ulx phmenu", OpenMenu, "!phmenu" )
openmenu:defaultAccess( ULib.ACCESS_ALL )
openmenu:help( "Open PH:X2Z Menu" )