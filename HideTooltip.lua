
local HideTooltip = CreateFrame('Frame', nil, UIParent)
local combat = false

HideTooltip:SetScript('OnEvent', function()
	combat = (event == "PLAYER_REGEN_DISABLED") or false;
end)

GameTooltip:SetScript('OnShow', function()	
	if IsShiftKeyDown() or not combat then 
		GameTooltip:Show()
	else 
		GameTooltip:Hide()
	end	
end)

--[[ -- does not work on bag items, is it safer? 
HideTooltip:SetScript('OnUpdate', function()
	if IsShiftKeyDown() or not combat then 
		GameTooltip:SetAlpha(1)
	else 
		GameTooltip:SetAlpha(0)
	end	
end)
]]--

HideTooltip:RegisterEvent("PLAYER_REGEN_DISABLED")
HideTooltip:RegisterEvent("PLAYER_REGEN_ENABLED")