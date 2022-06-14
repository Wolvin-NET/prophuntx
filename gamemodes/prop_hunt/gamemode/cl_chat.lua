-- handles special chat or notification events and or stuff.
local printCenter = {}

printCenter.lastShownNotify = 0
printCenter.delay = 3.25	-- We'll follow PrintMessage's rule. Don't attempt to use ConVar here!
printCenter.color = color_white

function printCenter:notify_wait()
	local last 		= self.lastShownNotify
	local delayTime = last + printCenter.delay
	local curTime 	= CurTime()
	
	return delayTime > curTime
end

printCenter.Text = "placeholder"

function printCenter:SetText(str)
	if !str or str == nil then
		str = " "
	end
	
	self.Text = PHX:FTranslate( str )
end

function printCenter:SetColor( color )
	if !color or color == nil then 
		ErrorNoHalt("[PHX HUD Chat] Attempting to set color but value is nil!")
		return
	end
	
	self.color = color
end

local font = "PHX_NicePrintCenter"
local sx,sy = ScrW()*0.5,ScrH()*0.2
hook.Add("HUDPaint", "PHX.DrawCenteredText", function()
	if printCenter:notify_wait() then
		surface.SetFont(font)
		draw.DrawText( printCenter.Text, font, sx, sy, printCenter.color, TEXT_ALIGN_CENTER )
	end
end)

function PHX:CenterPrint( msg, color, showInput, inputNum )

	if !msg or msg == nil or msg == "" then return end
	if !color or color == nil then color = color_white end
	
	--if !printCenter:notify_wait() then // what if ?
		if (showInput and showInput ~= nil) and (inputNum and inputNum ~= nil) then
			printCenter:SetColor(color)
			printCenter:SetText( string.format(msg,  input.GetKeyName(inputNum):upper()) )
		else
			printCenter:SetColor(color)
			printCenter:SetText( msg )
		end
		printCenter.lastShownNotify = CurTime()
	--end

end

function PHX:AddChat(msg, color)
	chat.AddText(color, msg)
end

function PHX:Notify(msg, kind, time, snd)
	notification.AddLegacy(msg, kind, time)
	
	if ( !snd or snd == nil ) then
		surface.PlaySound("garrysmod/content_downloaded.wav")
	else
		surface.PlaySound( snd )
	end
end

function PHX:ChatInfo(msg, kind)
	local color = PHX.info[kind][1]
	local text  = PHX.info[kind][2]
	
	chat.AddText(color, "[PHX: " .. text .."] ", color_white, msg)
end

net.Receive("PHX.CenterPrint", function()
	local msg 		= net.ReadString()
	local color		= net.ReadColor()
	local bool 		= net.ReadBool()
	local inputNum 	= net.ReadInt(9)
	
	PHX:CenterPrint(msg, color, bool, inputNum)
end)

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
	local t		= net.ReadTable()
	
	local sortedArguments = {}
	local hasArg = false
	if (!t["ARG1"] or t["ARG1"] == false) then
		hasArg = false
	else
		for _,args in SortedPairs(t) do
			table.insert(sortedArguments, args)
		end
		hasArg = true
	end
	
	if bShouldTranslated then
		if hasArg then
			PHX:Notify(PHX:Translate( msg, unpack(sortedArguments) ), kind, time)
		else
			PHX:Notify(PHX:Translate( msg ), kind, time)
		end
	else
		PHX:Notify(msg, kind, time)
	end
end)

net.Receive("PHX.ChatInfo", function()
	local msg	= net.ReadString()
	local kind	= net.ReadString()
	local t 	= net.ReadTable()
	
	local text = "ERROR"
	
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