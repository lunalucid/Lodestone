local _, Lodestone = ...
local L = Lodestone.L

local TABS = {
  [1] = {label = L.WAYPOINTS, getContent = function() return Lodestone.ScrollFrame end},
  [2] = {label = SETTINGS_TITLE, getContent = function() return Lodestone.Settings end}
}

local createdTabs = {}

Lodestone.MenuBar = CreateFrame('Frame', nil, Lodestone.Main)
local menuBar = Lodestone.MenuBar
menuBar:SetPoint('TOPLEFT', Lodestone.Main, 'TOPLEFT', Lodestone.CONFIG.TOP_BAR_HEIGHT, -Lodestone.CONFIG.PADDING)
menuBar:SetPoint('TOPRIGHT', Lodestone.Main, 'TOPRIGHT', -Lodestone.CONFIG.PADDING, -Lodestone.CONFIG.PADDING)
menuBar:SetHeight(Lodestone.CONFIG.TOP_BAR_HEIGHT)
menuBar:SetFrameLevel(Lodestone.Main:GetFrameLevel() + 5)

for i, tab in ipairs(TABS) do
  local tabButton = CreateFrame('Button', string.format('mainTabs%d', i), menuBar, 'PanelTopTabButtonTemplate')
  tabButton:SetID(i)
  tabButton:SetText(tab.label)
  PanelTemplates_TabResize(tabButton, 0)

  createdTabs[i] = tabButton

  if i == 1 then
    tabButton:SetPoint('BOTTOMLEFT', menuBar, 'BOTTOMLEFT')
  else
    tabButton:SetPoint('LEFT', createdTabs[i-1], 'RIGHT', -16, 0)
  end

  tabButton:SetScript('OnClick', function(self)
    PanelTemplates_SetTab(menuBar, i)
    for otherIdx = 1, #createdTabs do
      TABS[otherIdx].getContent():Hide()
    end
    tab.getContent():Show()
  end)
end

PanelTemplates_SetNumTabs(menuBar, #TABS)
PanelTemplates_SetTab(menuBar, 1)
