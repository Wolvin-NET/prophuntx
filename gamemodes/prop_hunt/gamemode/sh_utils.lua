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

function table.HasKey(tbl, keyName)
	for k,_ in SortedPairs(tbl) do
		print("looking for "..keyName)
		if k == keyName then print("found! : "..keyName) return true end
	end
	return false
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