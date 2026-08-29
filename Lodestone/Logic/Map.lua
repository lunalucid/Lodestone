local _, Lodestone = ...
local L = Lodestone.L
Lodestone.Maps = Lodestone.Maps or {}

local HBD = LibStub('HereBeDragons-2.0')
local HBDPins = LibStub('HereBeDragons-Pins-2.0')

local PIN_TEXTURE_STRING = 'Interface\\AddOns\\%s\\Textures\\Pins\\%s.tga'

local preference = Lodestone.lastProfile.settings.pins.persistentMapPins


local function setupPinVisuals(pin, waypoint, id)
  local size = waypoint.pinSize or Lodestone.lastProfile.settings.pins.defaultMapPinSize or Lodestone.DEFAULT_WAYPOINT.pinSize
  pin:SetSize(size, size)
  pin:SetFrameStrata('HIGH')

  Lodestone:SetTooltip(pin, {
    text = waypoint.name,
    r = waypoint.nameColor and waypoint.nameColor.r or Lodestone.COLOR.MAINRGB.r,
    g = waypoint.nameColor and waypoint.nameColor.g or Lodestone.COLOR.MAINRGB.g,
    b = waypoint.nameColor and waypoint.nameColor.b or Lodestone.COLOR.MAINRGB.b,
    lines = {
      {text = waypoint.description or '', r = 1, g = 1, b = 1}
    }
  })

  pin:SetScript('OnClick', function()
    Lodestone.ActivateWaypoint(id)
  end)

  local tex = pin:CreateTexture(nil, 'OVERLAY')
  tex:SetAllPoints()
  local pinTextureString = string.format(PIN_TEXTURE_STRING, Lodestone.name, waypoint.pinTexture or Lodestone.DEFAULT_WAYPOINT.pinTexture)
  tex:SetTexture(pinTextureString)

  if waypoint.pinColorSet and waypoint.pinColor then
    tex:SetVertexColor(waypoint.pinColor.r, waypoint.pinColor.g, waypoint.pinColor.b)
  else
    if not waypoint.pinTexture then
      tex:SetVertexColor(Lodestone.COLOR.MAINRGB.r, Lodestone.COLOR.MAINRGB.g, Lodestone.COLOR.MAINRGB.b)
    end
  end
end

local function placePins()
  local waypoints = Lodestone.lastProfile.waypoints

  HBDPins:RemoveAllWorldMapIcons(Lodestone)
  HBDPins:RemoveAllMinimapIcons(Lodestone)

  for id, waypoint in pairs(waypoints) do
    if waypoint.mapId and waypoint.x and waypoint.y then

      local minimapPin = CreateFrame('Button', nil, Minimap)
      setupPinVisuals(minimapPin, waypoint, id)
      HBDPins:AddMinimapIconMap(Lodestone, minimapPin, waypoint.mapId, waypoint.x, waypoint.y, true, true)

      local worldMapPin = CreateFrame('Button', nil, UIParent)
      setupPinVisuals(worldMapPin, waypoint, id)
      HBDPins:AddWorldMapIconMap(Lodestone, worldMapPin, waypoint.mapId, waypoint.x, waypoint.y, waypoint.pinLevel or Lodestone.lastProfile.settings.pins.defaultMapPinLevel or Lodestone.DEFAULT_WAYPOINT.pinLevel)

    end
  end
end

if preference then
  placePins()
end

Lodestone.ReloadMapPins = placePins