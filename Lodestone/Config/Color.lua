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

Lodestone.COLOR.MAINRGB = { r = 0.9058823529411765, g = 0.6, b = 1}
