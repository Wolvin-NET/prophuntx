-- ALWAYS USE INITIALIZE HOOK OR ELSE YOUR BANS WILL NOT WORK!

-- Make this always available on Shared. You can, however, silently adds this for Server-Side only (by using 'if SERVER then' statement).
-- Prop Menu will indicate as 'Red Icon' on Prop List. Indicating that the prop is banned.
-- Putting on Server-Side means silently hide the banned models, and thus will not mark as 'Red Icon' under Prop Menu.
hook.Add("Initialize", "testAddPropBan", function()
	if PHX and PHX ~= nil then
		table.insert( PHX.BANNED_PROP_MODELS, "models/props_lab/huladoll.mdl" )
	end
end)