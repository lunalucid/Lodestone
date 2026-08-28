local _, Lodestone = ...
local L = Lodestone.L

local libStub = _G.LibStub
if not libStub then
  Lodestone.Error('LibStub is missing. Minimap button disabled.')
  return
end

local ldb = libStub:GetLibrary('LibDataBroker-1.1', true)
local icon = libStub:GetLibrary('LibDBIcon-1.0', true)
if not ldb or not icon then
  Lodestone.Error('LibDataBroker-1.1 or LibDBIcon-1.0 is missing. Minimap button disabled.')
  return
end

Lodestone.DataObject = Lodestone.DataObject
  or ldb:NewDataObject(Lodestone.nameStripped, {
    type = 'data source',
    text = Lodestone.name,
    icon = Lodestone.logo,
  })

Lodestone.DataObject.OnClick = function(_, button)
  if button == 'LeftButton' or button == 'RightButton' then
    Lodestone.ToggleUI()
  end
end

Lodestone.DataObject.OnTooltipShow = function(tooltip)
  tooltip:AddLine(Lodestone.name)
  tooltip:AddLine(L.LEFT_CLICK_TOGGLE, 1, 1, 1)
end

Lodestone.MinimapButton = CreateFrame('Frame')
local minimapButton = Lodestone.MinimapButton
minimapButton:RegisterEvent('ADDON_LOADED')
minimapButton:SetScript('OnEvent', function(self, _, name)
  if name ~= Lodestone.name then
    return
  end
  self:UnregisterEvent('ADDON_LOADED')
  icon:Register(Lodestone.nameStripped, Lodestone.DataObject --[[@as LibDataBroker.DataDisplay | LibDataBroker.QuickLauncher]], Lodestone.lastProfile.minimap)
end)