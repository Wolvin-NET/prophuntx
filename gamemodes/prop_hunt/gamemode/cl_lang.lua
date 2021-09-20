-- Language Addition Helper.
function PHX:AddLanguage( tbl )
	if (tbl and type(tbl) == "table" and tbl ~= nil) then
		local code = tbl.code
		local name = tbl.Name
		
		if PHX.LANGUAGES[code] ~= nil or (not table.IsEmpty(PHX.LANGUAGES[code])) then
			PHX:VerboseMsg("[PHX] It appears that Language " .. name .. " ("..code..") is already exist. Ignoring...")
		else
			PHX:VerboseMsg("[PHX] Adding External custom language from " .. name .. "(".. code ..")")
			PHX.LANGUAGES[code] = tbl
		end
	end
end

function PHX:InsertToLanguage( tbl, code )
	if (tbl and type(tbl) == "table" and tbl ~= nil) and (code and (code ~= nil or code ~= "")) then		
		PHX:VerboseMsg("[PHX] Adding External insertion language: (".. code ..")...")
		
		for STRINGCODE, TRANSLATION in pairs(tbl) do
			if (PHX.LANGUAGES[code][STRINGCODE] ~= nil) then -- don't use table.HasValue() because some values may contains table.
				PHX:VerboseMsg("[PHX] Ignoring " .. STRINGCODE .. " because it was exist in the language table.")
			else
				PHX.LANGUAGES[code][STRINGCODE] = TRANSLATION
			end
		end
	end
end

-- Let's add language from list.Get, if any.
for langName,tblLangExt in pairs(list.Get("PHX.CustomExternalLanguage")) do
	if !tblLangExt or tblLangExt == nil or table.IsEmpty(tblLangExt) then
		PHX.VerboseMsg("[PHX External Language] Ignoring " .. langName .. " because it does contains nothing.")
	else
		PHX.VerboseMsg("[PHX External Language] Adding " .. langName .."...")
		PHX:AddLanguage( tblLangExt )
	end
end

-- Let's add external language insertion, if any.
for name,tblLangIns in pairs(list.Get("PHX.LanguageInsertion")) do
	if !tblLangIns or tblLangIns == nil or table.IsEmpty(tblLangIns) then
		PHX.VerboseMsg("[PHX Insertion Language] Ignoring LangCode " .. name .. " because it does contains nothing.")
	else
		PHX.VerboseMsg("[PHX Insertion Language] Attempting to insert language: " .. name .. "...")
		
		for code,tbl in pairs(tblLangIns) do
			PHX:InsertToLanguage( tbl, code )
		end
	end
end

-- Check
if table.IsEmpty(PHX.LANGUAGES) then
	print("[PHX] Language Table: Empty... something's wrong?")
else
	print("[PHX] Language Table: OK, got " .. table.Count(PHX.LANGUAGES) .. " total lang codes.")
end

-- Normal Translation. This will output error and does not return original text from textToFind.
function PHX:Translate( textToFind, ... )
	if !textToFind then textToFind = "ERROR" end

	local args = {...}
	local lg = PHX:GetCLCVar( "ph_cl_language" )
	
	-- if this was forced by server, we'll use that instead.
	if PHX:GetCVar( "ph_use_lang" ) then
		lg = PHX:GetCVar( "ph_force_lang" )
	end
	
	local code = self.LANGUAGES[lg]
	if !code or code == nil then return "Cannot translate [" .. textToFind .. "], Language " .. lg .. " not found." end

	if args ~= nil and (not table.IsEmpty(args)) then
		if !code[textToFind] then 
			return "Error: Cannot translate, " .. textToFind .. " not found."
		else
			local NiceFormat = string.format(code[textToFind], ...)
			return NiceFormat
		end
	end
	
	if !code[textToFind] or code[textToFind] == nil then
		return "translation not found"
	end
	
	return code[textToFind]
end

-- Fallback Translate: A quick version, used to revert translation to textToFind if translation was nothing found.
-- This commonly used for VGUI or Fretta's component to avoid Informational "Not Found" texts.
-- USE THIS ONLY FOR VGUI ELEMENTS. If you want to use for Chat/Notification System, Consider use PHX:Translate() instead!
function PHX:FTranslate( textToFind, ... )
	
	local args = {...}
	local lg = PHX:GetCLCVar( "ph_cl_language" )
	
	-- if this was forced by server, we'll use that instead.
	if PHX:GetCVar( "ph_use_lang" ) then
		lg = PHX:GetCVar( "ph_force_lang" )
	end
	
	local code = self.LANGUAGES[lg]
	if !code or code == nil then
		--fallback
		return textToFind
	end
	
	if args ~= nil and (not table.IsEmpty(args)) then
		if !code[textToFind] then
			--fallback
			return textToFind
		else
			local NiceFormat = string.format(code[textToFind], ...)
			return NiceFormat
		end
	end
	
	if !code[textToFind] or code[textToFind] == nil then
		--fallback
		return textToFind
	end
	
	return code[textToFind]
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