-- handles special chat or notification events and or stuff.
function PHX:AddChat(msg, color)
	chat.AddText(color, msg)
end

function PHX:Notify(msg, kind, time)
	notification.AddLegacy(msg, kind, time)
end

function PHX:ChatInfo(msg, kind)
	local color = PHX.info[kind][1]
	local text  = PHX.info[kind][2]
	
	chat.AddText(color, "[PHX " .. text .." ", color_white, msg)
end

net.Receive("PHX.ChatPrint", function()
	local msg	= net.ReadString()
	local color	= net.ReadColor()
	local bShouldTranslated = net.ReadBool()
	
	local text = ""
	
	if bShouldTranslated then
		text = PHX:Translate( msg )
	else
		text = msg
	end
	
	PHX:AddChat(text, color)
end)

net.Receive("PHX.bubbleNotify", function()
	local msg	= net.ReadString()
	local kind	= net.ReadUInt(3)
	local time	= net.ReadUInt(5)
	local bShouldTranslated = net.ReadBool()
	
	if bShouldTranslated then
		PHX:Notify(PHX:Translate( msg ), kind, time)
	else
		PHX:Notify(msg, kind, time)
	end
end)

net.Receive("PHX.ChatInfo", function()
	local msg	= net.ReadString()
	local kind	= net.ReadString()
	local t 	= net.ReadTable()
	
	local text = "ERROR"
	
	PrintTable(t)
	
	if (!t["ARG1"] or t["ARG1"] == false) then
		text = PHX:Translate( msg )
	else
		local sortedArguments = {}
		for _,args in SortedPairs(t) do
			table.insert(sortedArguments, args)
		end
		
		text = PHX:Translate( msg, unpack(sortedArguments) )
	end
	
	PHX:ChatInfo(text, kind)
end)