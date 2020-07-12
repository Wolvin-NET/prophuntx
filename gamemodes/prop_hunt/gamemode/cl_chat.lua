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
	
	PHX:AddChat(msg, color)
end)

net.Receive("PHX.bubbleNotify", function()
	local msg	= net.ReadString()
	local kind	= net.ReadUInt(3)
	local time	= net.ReadUInt(5)
	
	PHX:Notify(msg, kind, time)
end)

net.Receive("PHX.ChatInfo", function()
	local msg	= net.ReadString()
	local kind	= net.ReadString()
	
	PHX:ChatInfo(msg, kind)
end)