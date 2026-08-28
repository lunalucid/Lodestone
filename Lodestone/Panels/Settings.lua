local _, Lodestone = ...
local L = Lodestone.L
local Util = Lodestone.Util

local SETTING_YOFFSET = -20
local CATEGORY_YOFFSET = -35
local SETTINGS_CONFIG = Lodestone.SETTINGS_CONFIG
local PREF_CONTROL_WIDTH = 160
local PREF_SLIDER_WIDTH = 160
local FONT_HEIGHT = Lodestone.CONFIG.SETTINGS_WPTF_FONT_HEIGHT
local FONT_DROPDOWN_HEIGHT = 16

local INTERNAL_CATEGORIES = {
  'navigation',
  'collection'
}

Lodestone.Settings = CreateFrame('Frame', nil, Lodestone.Content)
Lodestone.Settings:Hide()
local settings = Lodestone.Settings
settings:SetPoint('TOPLEFT', Lodestone.Content, 'TOPLEFT', Lodestone.CONFIG.PADDING - 4, -Lodestone.CONFIG.PADDING)
settings:SetPoint('BOTTOMRIGHT', Lodestone.Content, 'BOTTOMRIGHT', -Lodestone.CONFIG.PADDING, Lodestone.CONFIG.PADDING)
settings:SetFrameLevel(Lodestone.Content:GetFrameLevel() + 1)

local title = settings:CreateFontString(nil, 'OVERLAY', 'GameFontNormalHuge')
title:SetPoint('TOP', settings, 'TOP', 0, -8)
title:SetText(SETTINGS_TITLE)

local categoryCounter = 0
local lastSetting = 1

local toSync = {}

local function sync(category, setting, config)
  if config.cf == 'CheckButton' then
    setting:SetChecked(Lodestone.lastProfile.settings[category][config.v])
    setting:SetEnabled(config.condition ~= false)

    setting:SetScript('OnClick', function(self)
      Lodestone.lastProfile.settings[category][config.v] = self:GetChecked()
      Settings.NotifyUpdate(config.vKey)
    end)

  elseif config.cf == 'DropdownButton' then
    if config.v == 'titleFont' then
      local waypointTitleFontCategoryOrder = { 'Fancy', 'Normal' }
      local randomTitle = Lodestone.Util.randomWaypointName()

      local function getFont()
        return Lodestone.lastProfile.settings.collection.titleFont
      end
      setting:SetDefaultText(getFont())
      Util.hookFontObjectColor(setting, setting.Text, getFont, FONT_DROPDOWN_HEIGHT)

      if MenuStyle1Mixin and CreateFromMixins(MenuStyle1Mixin) then
        local wptfMenuStyleMixin = CreateFromMixins(MenuStyle1Mixin)

        function wptfMenuStyleMixin:Generate()
          local background = self:AttachTexture()
          background:SetAtlas('QuestBG-Parchment')
          background:SetAllPoints()
        end
        setting.menuMixin = wptfMenuStyleMixin
      end
      local function selectTitleFont(fontName)
        Lodestone.lastProfile.settings.collection.titleFont = fontName
        setting:SetDefaultText(fontName)
        Util.applyFontObject(setting.Text, fontName, FONT_DROPDOWN_HEIGHT)
        Lodestone.Collection.refreshWaypointList()
      end
      local function addWaypointTitleFontMenuButton(parentDescription, fontName)
        local button = parentDescription:CreateButton(randomTitle, function()
          selectTitleFont(fontName)
        end)
        button:SetTooltip(function(tooltip, elementDescription)
          local tt1 = NORMAL_FONT_COLOR:WrapTextInColorCode(L.FONT)
          local tt2 = HIGHLIGHT_FONT_COLOR:WrapTextInColorCode(fontName)
          local tt = string.format('%s %s', tt1, tt2)
          GameTooltip_SetTitle(tooltip, tt)
        end)

        button:AddInitializer(function(btn, description)
          if btn.lodeFontHooked then
            Util.applyFontObject(btn.fontString, fontName, FONT_HEIGHT)
            return
          end
          btn.lodeFontHooked = true
          Util.hookFontObjectColor(btn, btn.fontString, function()
          return fontName
          end, FONT_HEIGHT)
        end)
      end
      local function InitializeMenu(owner, rootDescription)
        rootDescription:CreateTitle(L.FONT_OPTIONS)
        rootDescription:CreateDivider()

        for i = 1, #waypointTitleFontCategoryOrder do
          local categoryName = waypointTitleFontCategoryOrder[i]
          local fonts = Lodestone.FONTS[categoryName]
          if fonts then
            local submenu = rootDescription:CreateButton(categoryName)
            for f = 1, #fonts do
              addWaypointTitleFontMenuButton(submenu, fonts[f])
            end
          end
        end
      end
      setting:SetupMenu(InitializeMenu)
    end
    elseif config.cf == 'Slider' then
      setting:SetValue(Lodestone.lastProfile.settings[category][config.v])
      local valueLabel = string.format('%s_valueLabel', config.v)
      _G[valueLabel]:SetText(string.format('(' .. config.unit .. ')', setting:GetValue()))
  end
end

function Lodestone.Settings.update()
  for _, cb in ipairs(toSync) do
    sync(cb.category, cb.setting, cb.config)
  end
end

local function isInternal(key)
  for index, value in ipairs(INTERNAL_CATEGORIES) do
    if value == key then
      return true
    end
  end
  return false
end

function Lodestone.Settings.load()
  for categoryKey, settingDefinitions in pairs(SETTINGS_CONFIG) do
    if isInternal(categoryKey) then
      categoryCounter = categoryCounter + 1

      local categoryIdentifier = string.format('category%d', categoryCounter)
      local dummyIdentifier = string.format('dummy%d', categoryCounter)

      local category = settings:CreateFontString(categoryIdentifier, 'OVERLAY', 'GameFontNormalLarge')
      local dummy = settings:CreateFontString(dummyIdentifier, 'OVERLAY', 'GameFontNormalLarge')

      if categoryCounter == 1 then
        category:SetPoint('TOPLEFT', settings, 'TOPLEFT', 16, -title:GetHeight() + SETTING_YOFFSET)
        dummy:SetPoint('TOPRIGHT', settings, 'TOPRIGHT', -16, -title:GetHeight() + SETTING_YOFFSET)
      else
        local categoryAnchor = string.format('settingLabel%d_%d', categoryCounter - 1, lastSetting)
        local dummyAnchor = string.format('setting%d_%d', categoryCounter - 1, lastSetting)
        category:SetPoint('TOPLEFT', categoryAnchor, 'TOPLEFT', 0, CATEGORY_YOFFSET)
        dummy:SetPoint('TOPRIGHT', dummyAnchor, 'TOPRIGHT', 0, CATEGORY_YOFFSET)
      end

      category:SetText(Lodestone.SETTINGS_LABELS[categoryKey])
      dummy:SetText(' ')

      local settingCounter = 0
      for _, settingConfig in pairs(settingDefinitions) do
        settingCounter = settingCounter + 1
        lastSetting = settingCounter

        local settingLabelIdentifier = string.format('settingLabel%d_%d', categoryCounter, settingCounter)
        local settingIdentifier = string.format('setting%d_%d', categoryCounter, settingCounter)

        local label = settings:CreateFontString(settingLabelIdentifier, 'OVERLAY', 'GameFontHighlight')
        label:SetText(settingConfig.name)

        local labelAnchor = ''
        local settingAnchor = ''
        if settingCounter == 1 then
          labelAnchor = categoryIdentifier
          settingAnchor = dummyIdentifier
        else
          labelAnchor = string.format('settingLabel%d_%d', categoryCounter, settingCounter - 1)
          settingAnchor = string.format('setting%d_%d', categoryCounter, settingCounter - 1)
        end

        label:SetPoint('TOPLEFT', labelAnchor, 'BOTTOMLEFT', 0, SETTING_YOFFSET)

        local labelTip = settings:CreateFontString(nil, 'OVERLAY', 'GameFontDisableSmall')
        if settingConfig.falseTip and not settingConfig.condition then
          labelTip:SetText(string.format('(%s)', settingConfig.falseTip))
          label:SetTextColor(0.5, 0.5, 0.5)
          labelTip:SetTextColor(0.5, 0.5, 0.5)
          labelTip:SetPoint('TOPLEFT', label, 'BOTTOMLEFT', 0, -5)
        elseif settingConfig.trueTip then
          labelTip:SetText(string.format('(%s)', settingConfig.trueTip))
          labelTip:SetPoint('TOPLEFT', label, 'BOTTOMLEFT', 0, -5)
          if settingConfig.condition then
            labelTip:SetTextColor(0.6, 0.9, 0.6)
          end
        end

        local setting = CreateFrame(settingConfig.cf, settingIdentifier, settings, settingConfig.ct)
        setting:SetPoint('TOPRIGHT', settingAnchor, 'BOTTOMRIGHT', 0, SETTING_YOFFSET)

        if settingConfig.cf == 'CheckButton' then

          setting:SetScript('OnClick', function(self)
            Lodestone.lastProfile.settings[categoryKey][settingConfig.v] = self:GetChecked()
            Settings.NotifyUpdate(settingConfig.vKey)
          end)

        elseif settingConfig.cf == 'DropdownButton' then
          setting:SetWidth(PREF_CONTROL_WIDTH)
          --setting:SetHeight(FONT_DROPDOWN_HEIGHT)
          setting.Background:SetAtlas('search-select', true)

        elseif settingConfig.cf == 'Slider' then
          setting:SetWidth(PREF_SLIDER_WIDTH)
          local valueLabel = setting:CreateFontString(string.format('%s_valueLabel', settingConfig.v), 'OVERLAY', 'GameFontNormal')
          valueLabel:SetText(string.format('(%s %s)', setting:GetValue(), settingConfig.unit))
          local adjustPlacement = 48
          valueLabel:SetPoint('RIGHT', label, 'RIGHT', adjustPlacement, 0)
          setting.Low:SetText(tostring(settingConfig.data.min))
          setting.High:SetText(tostring(settingConfig.data.max))
          setting:SetMinMaxValues(settingConfig.data.min, settingConfig.data.max)
          setting:SetObeyStepOnDrag(true)
          setting:SetValueStep(settingConfig.data.step)
          setting:SetValue(settingConfig.default)

          setting:SetScript('OnValueChanged', function(self, value)
            Lodestone.lastProfile.settings[categoryKey][settingConfig.v] = value
            valueLabel:SetText(string.format('(%s %s)', setting:GetValue(), settingConfig.unit))
            Lodestone.Collection.refreshWaypointList()
            Settings.NotifyUpdate(settingConfig.vKey)
          end)
        end

        table.insert(toSync, {category = categoryKey, setting = setting, config = settingConfig})

      end
    end
  end
end

settings:HookScript('OnShow', function()
    Lodestone.Settings.update()
  end)

local footnote = settings:CreateFontString(nil, 'OVERLAY', 'GameFontHighlight')
footnote:SetPoint('BOTTOM', settings, 0, 4)
footnote:SetText(string.format(L.MORE_OPTIONS, MAINMENU_BUTTON, GAMEOPTIONS_MENU, ADDONS, Lodestone.name))

Lodestone.Settings.load()
Lodestone.Settings.update()