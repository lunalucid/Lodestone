local _, Lodestone = ...

local COLORS = {
  MAIN = 'ffe799ff',
  NOTIFICATION = 'fff8d9ff',
  DEV = 'ffffc099',
  DEV_MESSAGE = 'fffff0e0'
}

Lodestone.COLOR = {}

for name, color in pairs(COLORS) do
  Lodestone.COLOR[name] = CreateColorFromHexString(color)
end
