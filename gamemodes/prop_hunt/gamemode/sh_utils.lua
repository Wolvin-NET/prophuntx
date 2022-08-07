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