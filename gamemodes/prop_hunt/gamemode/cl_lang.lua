-- Language Addition Helper.
function PHX:AddLanguage( tbl )
	if (tbl and type(tbl) == "table" and tbl ~= nil) then
		local code = tbl.code
		local name = tbl.Name
		
		if PHX.LANGUAGES[code] ~= nil or (not table.IsEmpty(PHX.LANGUAGES[code])) then
			PHX:VerboseMsg("[PHX] It appears that Language " .. name .. " ("..code..") is already exist. Ignoring...")
		else
			PHX:VerboseMsg("[PHX] Adding External Language " .. name .. "(".. code ..")")
			PHX.LANGUAGES[code] = tbl
		end
	end
end

function PHX:InsertToLanguage( tbl, code )
	if (tbl and type(tbl) == "table" and tbl ~= nil) and (code and (code ~= nil or code ~= "")) then		
		PHX:VerboseMsg("[PHX] Adding External insertion language code: (".. code ..")")
		
		for STRINGCODE, TRANSLATION in pairs(tbl) do
			if (PHX.LANGUAGES[code][STRINGCODE] ~= nil) then -- don't use table.HasValue() because some values may contains table.
				PHX:VerboseMsg("[PHX] Ignoring Language ID" .. STRINGCODE .. " because it was exist in the language table.")
			else
				PHX.LANGUAGES[code][STRINGCODE] = TRANSLATION
			end
		end
	end
end

local function addExtLang()
	-- Let's add language from list.Get, if any.
    for langName,tblLangExt in pairs(list.Get("PHX.CustomExternalLanguage")) do
        if !tblLangExt or tblLangExt == nil or table.IsEmpty(tblLangExt) then
            PHX.VerboseMsg("[PHX External Language] Ignoring " .. langName .. " because it contains nothing.")
        else
            PHX.VerboseMsg("[PHX External Language] Adding " .. langName .."...")
            PHX:AddLanguage( tblLangExt )
        end
    end

    -- Let's add external language insertion, if any.
    for name,tblLangIns in pairs(list.Get("PHX.LanguageInsertion")) do
        if !tblLangIns or tblLangIns == nil or table.IsEmpty(tblLangIns) then
            PHX.VerboseMsg("[PHX Insertion Language] Ignoring Language Code " .. name .. " because it contains nothing.")
        else
            PHX.VerboseMsg("[PHX Insertion Language] Adding new phrase Language ID: " .. name)            
            for code,tbl in pairs(tblLangIns) do
                PHX:InsertToLanguage( tbl, code )
            end
        end
    end

    -- Check
    if table.IsEmpty(PHX.LANGUAGES) then
        print("[PHX] Language Table: Empty. Something's wrong?")
    else
        print("[PHX] Language Table: OK! Got " .. table.Count(PHX.LANGUAGES) .. " total Language Codes.")
    end
end
hook.Add("Initialize", "PHX.AddExternalLanguage", addExtLang)
hook.Add("OnReloaded", "PHX.ReLoadExternalLang", addExtLang)

-- Normal Translation. 
-- This will output error and does not revert the original text from textToFind.
function PHX:Translate( textToFind, ... )
	if !textToFind then textToFind = "ERROR" end

	local args = {...}
	local lg = "en_us"
	
	-- if this was forced by server, we'll use that instead.
	if PHX:GetCVar( "ph_use_lang" ) then
		lg = PHX:GetCVar( "ph_force_lang" )
	else
		lg = PHX:GetCLCVar( "ph_cl_language" )
	end
	
	local code = self.LANGUAGES[lg]
	if !code or code == nil then return "Cannot translate [" .. textToFind .. "], Language code " .. lg .. " not found" end

	if args ~= nil and (not table.IsEmpty(args)) then
		if !code[textToFind] then
			return "Error: Cannot translate, " .. textToFind .. " not found"
		else
			local NiceFormat = string.format(code[textToFind], ...)
			return NiceFormat
		end
	end
	
	if !code[textToFind] or code[textToFind] == nil then
		return "Error: Translation ".. textToFind .." not found"
	end
	
	return code[textToFind]
end

-- Fallback Translate
-- Any language code that does not exist will return into english as fallback.
-- If Language ID of textToFind was not found, it would revert whatever the text that provided in textToFind argument.
-- Compared to PHX:Translate(), this does not output "error text".
-- Used internally with QTrans:()
function PHX:FTranslate( textToFind, ... )
	
	local args = {...}
	local lg = "en_us"
    local fallback = self.LANGUAGES["en_us"]
	
	-- if this was forced by server, we'll use that instead.
	if PHX:GetCVar( "ph_use_lang" ) then
		lg = PHX:GetCVar( "ph_force_lang" )
	else
		lg = PHX:GetCLCVar( "ph_cl_language" )
	end
	
	local code = self.LANGUAGES[lg]
	if !code or code == nil then
		--Fallback
		code = fallback
	end
	
	if args ~= nil and (not table.IsEmpty(args)) then
		if !code[textToFind] then
			-- Revert
            if !fallback[textToFind] or fallback[textToFind] == nil then
                return textToFind
            else
                --Fallback
				local NiceFallback = string.format(fallback[textToFind], ...)
                return NiceFallback
            end
		else
			local NiceFormat = string.format(code[textToFind], ...)
			return NiceFormat
		end
	end
	
	if !code[textToFind] or code[textToFind] == nil then
		--Revert
		if !fallback[textToFind] or fallback[textToFind] == nil then
            return textToFind
        else
            --Fallback
            return fallback[textToFind]
        end
	end
	
	return code[textToFind]
    
end

-- used internally in `cl_menutypes.lua` and some other user interface elements
-- should not be used elsewhere.
function PHX:QTrans( data )

	if istable(data) then
		local text = data[1]
		return PHX:FTranslate( text, unpack(data, 2) ) -- we take 2nd index and onwards from table and become varargs
	elseif isstring(data) then
		return PHX:FTranslate( data )
	else
		return "!ERROR_NOT_STRING_OR_TABLE"
	end

end

-- Usage: tblKey = String
--[[
	Example: if there is something in your language that contains:
	
	LANG.RANDOM_DEATHNOTICE_MESSAGE = { ... } 
	
	then it should capture a value from:
	
	PHX.LANGUAGES[<lang code>]["RANDOM_DEATHNOTICE_MESSAGE"]
	
	Therefore, you should only call:
	
	PHX:GetRandomTranslated( "RANDOM_DEATHNOTICE_MESSAGE" )
]]
function PHX:GetRandomTranslated( tblKey )

	if type(tblKey) ~= "string" then return "Argument must contain string only!" end
	if !tblKey then return "Cannot find specified table key: "..tblKey end

	local lg = PHX:GetCLCVar( "ph_cl_language" )
	
	-- if this was forced by server, we'll use that instead.
	if PHX:GetCVar( "ph_use_lang" ) then
		lg = PHX:GetCVar( "ph_force_lang" )
	end
	
	local code = self.LANGUAGES[lg]
	if !code or code == nil then return "Cannot find random table [" .. tblKey .. "], Language " .. lg .. " not found." end
	
	local tbl = code[tblKey]
	if !tbl then return "cannot find "..tblKey.." table." end
	
	if type(tbl) == "table" then
		local result = table.Random( tbl )
		return result
	else
		return "cannot get translation because table argument is not a table value."
	end
end

function PHX:MsgBox( strText, strTitle, strButton )
	strText 	= self:QTrans( strText )
	strTitle 	= self:QTrans( strTitle )
	strButton 	= self:QTrans( strButton )
	
	Derma_Message( strText, strTitle, strButton )
end

-- This is hideous
function PHX:MsgBox_Query( body, title, b1, f1, b2, f2, b3, f3, b4, f4 )
	
	body 	= self:QTrans( body )
	title 	= self:QTrans( title )
	b1      = self:QTrans( b1 ) -- required!
    
    if b2 and b2 ~= nil then b2	= self:QTrans( b2 ) end
    if b3 and b3 ~= nil then b3	= self:QTrans( b3 ) end
    if b4 and b4 ~= nil then b4	= self:QTrans( b4 ) end
	
	Derma_Query( body, title, b1, f1, b2, f2, b3, f3, b4, f4 )
	
end

-- Tester utility console command
local function TestTranslation( ply, strCmd, tArgs )
    if table.IsEmpty(tArgs) then
        print("Usage: " .. strCmd .." \"LANGUAGE_ID_TO_TEST\" \"<other arg>\" - always use quote marks!")
    else
        local LangID = tostring(tArgs[1])
        print( PHX:Translate(LangID, unpack(tArgs, 2)) )
    end
end
local function TestRandomTranslation(ply, strCmd, tArgs)
    if table.IsEmpty(tArgs) then
        print("Usage: " .. strCmd .." \"LANGUAGE_ID_TO_TEST\" \"<other arg>\" - always use quote marks!")
    else
        local LangID = tostring(tArgs[1])
        print( PHX:GetRandomTranslated(LangID, unpack(tArgs, 2)) )
    end
end
concommand.Add("phx_test_translate", TestTranslation, nil, "Language to test: Arg1 always translation ID, ArgN = VarArgs in strings only.")
concommand.Add("phx_test_random_translate", TestRandomTranslation, nil, "Language to test 'random translation': Arg1 always translation ID, ArgN = VarArgs in strings only.")
