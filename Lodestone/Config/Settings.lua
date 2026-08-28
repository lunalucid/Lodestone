local _, Lodestone = ...
local L = Lodestone.L

local settings = Settings.RegisterVerticalLayoutCategory(Lodestone.name)

local function OnSettingChanged(setting, value)
	Lodestone.Settings.update()
	Lodestone.Collection.refreshWaypointList()
end

local function GetDropdownOptions(data)
	local container = Settings.CreateControlTextContainer()
	for i = 1, #data do
		local option = container:Add(data[i], data[i])
	end
	return container:GetData()
end

local SETTINGS_LABELS = {
	['navigation'] = L.SETTINGS_NAVIGATION,
	['collection'] = L.WAYPOINTS,
	['slashCommands'] = L.SLASH_COMMANDS
}
Lodestone.SETTINGS_LABELS = SETTINGS_LABELS

local FONTS = {}
for category, fonts in pairs(Lodestone.FONTS) do
	for i, font in ipairs(fonts) do
		table.insert(FONTS, font)
	end
end

local SETTINGS_CONFIG = {
	['slashCommands'] = {
		slashCommand1 = {
			name =_G['SLASH_APP_LONG1'],
			v = 'SLASH_APP_LONG',
			vKey = 'SLASH_APP_LONG',
			default = true,
			tt = string.format(L.SLASH_TT1, Lodestone.name),
			create = Settings.CreateCheckbox,
			cf = 'CheckButton',
			ct = 'UICheckButtonTemplate',
		},
		slashCommand2 = {
			name =_G['SLASH_APP_SHORT1'],
			v = 'SLASH_APP_SHORT',
			vKey = 'SLASH_APP_SHORT',
			default = true,
			tt = string.format(L.SLASH_TT1, Lodestone.name),
			create = Settings.CreateCheckbox,
			cf = 'CheckButton',
			ct = 'UICheckButtonTemplate',
		},
		slashCommand3 = {
			name =_G['SLASH_SAVE_CURRENT_WAYPOINT_LONG1'],
			v = 'SLASH_SAVE_CURRENT_WAYPOINT_LONG',
			vKey = 'SLASH_SAVE_CURRENT_WAYPOINT_LONG',
			default = true,
			tt = L.SLASH_TT2,
			create = Settings.CreateCheckbox,
			cf = 'CheckButton',
			ct = 'UICheckButtonTemplate',
		},
		slashCommand4 = {
			name =_G['SLASH_SAVE_CURRENT_WAYPOINT_SHORT1'],
			v = 'SLASH_SAVE_CURRENT_WAYPOINT_SHORT',
			vKey = 'SLASH_SAVE_CURRENT_WAYPOINT_SHORT',
			default = true,
			tt = L.SLASH_TT2,
			create = Settings.CreateCheckbox,
			cf = 'CheckButton',
			ct = 'UICheckButtonTemplate',
		},
		slashCommand5 = {
			name =_G['SLASH_NEW_WAYPOINT1'],
			v = 'SLASH_NEW_WAYPOINT',
			vKey = 'SLASH_NEW_WAYPOINT',
			default = true,
			tt = string.format(L.SLASH_TT3, _G['SLASH_NEW_WAYPOINT1']),
			create = Settings.CreateCheckbox,
			cf = 'CheckButton',
			ct = 'UICheckButtonTemplate',
		}
	},
	['navigation'] = {
		perferTomTom = {
			name = string.format(L.SETTINGS_USE_TOMTOM, Lodestone.name),
			v = 'preferTomTom',
			vKey = 'preferTomTom',
			default = false,
			tt = '',
			create = Settings.CreateCheckbox,
			cf = 'CheckButton',
			ct = 'UICheckButtonTemplate',
			condition = function() return C_AddOns.IsAddOnLoaded('TomTom') end,
			falseTip = L.SETTINGS_TOMTOM_MISSING,
			trueTip = L.SETTINGS_TOMTOM_INSTALLED,
		}
	},
	['collection'] = {
		titleFont = {
			name = L.SETTINGS_WAYPOINT_TITLE_FONT,
			v = 'titleFont',
			vKey = 'titleFont',
			default = Lodestone.lastProfile.settings.collection.titleFont,
			tt = '',
			create = Settings.CreateDropdown,
			options = function() return GetDropdownOptions(FONTS) end,
			cf = 'DropdownButton',
			ct = 'WowStyle1DropdownTemplate',
			data = FONTS
		},
		titleFontHeight = {
			name = L.SETTINGS_WAYPOINT_TITLE_FONT_HEIGHT,
			v = 'titleFontHeight',
			vKey = 'titleFontHeight',
			default = Lodestone.CONFIG.SETTINGS_WPTF_FONT_HEIGHT,
			tt = '',
			create = Settings.CreateSlider,
			options = Settings.CreateSliderOptions(12, 24, 1),
			label = true,
			unit = FONT_SIZE_TEMPLATE,
			cf = 'Slider',
			ct = 'OptionsSliderTemplate',
			data = {min = 12, max = 24, step = 1}
		}
	}
}
Lodestone.SETTINGS_CONFIG = SETTINGS_CONFIG

for categoryKey, settingDefinitions in pairs(SETTINGS_CONFIG) do
	local category = Settings.RegisterVerticalLayoutSubcategory(settings, SETTINGS_LABELS[categoryKey])
	for _, settingConfig in pairs(settingDefinitions) do
		local setting = Settings.RegisterAddOnSetting(
			category,
			settingConfig.v,
			settingConfig.vKey,
			Lodestone.lastProfile.settings[categoryKey],
			type(settingConfig.default),
			settingConfig.name,
			settingConfig.default
    )

		setting:SetValueChangedCallback(OnSettingChanged)
		local tooltip = settingConfig.tt
		local func = settingConfig.create
		local options = settingConfig.options
		local unit = settingConfig.unit
		if options then
				if settingConfig.label then
						options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right, function(value)
								if unit then
										return string.format(unit, value)
								else
										return value
								end
						end)
				end

				local initializer = func(category, setting, options, tooltip)
		else
				local initializer = func(category, setting, tooltip)
		end
	end
	Settings.RegisterAddOnCategory(category)
end

Settings.RegisterAddOnCategory(settings)

