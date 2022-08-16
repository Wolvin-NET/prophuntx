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
    
    return c,c:len()
end

function util.PHXQuickDecompress( data )
    local j = util.Decompress( data )
    local t = util.JSONToTable( j )
    
    return t
end

-- Rarely used, from sh_config.lua, but I'll put them here anyway....
function table.KeyExists(tbl, key)
    return (tbl[key] ~= nil)
end

function table.HasKey(tbl, keyName)
	for k,_ in pairs(tbl) do
		if k == keyName then return true end
	end
	return false
end

if SERVER then
	function util.IsStaff( ply )
		if ( (game.IsDedicated() and ply == NULL) or (ply ~= NULL and ply:PHXIsStaff()) ) then
			return true
		end
		
		return false
	end
end