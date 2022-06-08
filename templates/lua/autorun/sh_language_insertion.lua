
list.Set("PHX.LanguageInsertion", "Language_Something", {
	["en_us"]	= {
		["PHX_TEST_1"]	= "Hello"
	},
	["id"]	= {	-- Asume other language, like: Indonesian is Exist.
		["PHX_TEST_1"]	= "Halo Mas Bro"
	}
})

-- You can also add other single line here, let's say it's another addon.

list.Set("PHX.LanguageInsertion", "Other Language I want to insert to", {
	["en_us"]	= {
		["PHX_TEST_ALIEN"]	= "Vortigaunt ate Headcrabs"
	}
})

-- Testing, Remove this if you already test it.
if CLIENT then
concommand.Add("test_lang_insert", function(ply)
	
	print(PHX:FTranslate("PHX_TEST_1"))
	print(PHX:FTranslate("PHX_TEST_2"))
	
end)
end