local Player = FindMetaTable("Player")
if !Player then return end

function Player:CheckUsage()
	return self:GetNWInt("CurrentUsage", 0)
end

if SERVER then
	function Player:ResetUsage()
		self:SetNWInt("CurrentUsage", PHX:GetCVar( "pcr_max_use" ) or 0)
	end

	-- unused.
	function Player:UsageAddCount()
		local cur = self:CheckUsage()
		self:SetNWInt("CurrentUsage", cur + 1)
	end

	function Player:UsageSubstractCount()
		local cur = self:CheckUsage()
		self:SetNWInt("CurrentUsage", cur - 1)
	end

end