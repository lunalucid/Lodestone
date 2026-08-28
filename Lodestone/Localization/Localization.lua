local _, Lodestone = ...
Lodestone.Localization = Lodestone.Localization or {}
Lodestone.L = Lodestone.L or {}
local L = Lodestone.L

local LOCALES = {'enUS', 'deDE', 'frFR', 'esES', 'ptBR', 'ruRU', 'zhCN', 'zhTW', 'koKR'}

local localeStrings = {}

for _, locale in ipairs(LOCALES) do
  localeStrings[locale] = Lodestone.Localization[locale]
end

local locale = GetLocale()
local base = localeStrings.enUS
local override = localeStrings[locale]
if not override and locale == 'esMX' then
  override = localeStrings.esES
end
override = override or {}

for key, value in pairs(base) do
  L[key] = override[key] or value
end
