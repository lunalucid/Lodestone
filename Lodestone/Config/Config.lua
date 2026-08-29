local _, Lodestone = ...
local L = Lodestone.L

local DEFAULT_TOOLTIP = {
  text = '',
  r = 1,
  g = 1,
  b = 1,
  alpha = 1,
  wrapText = true,
  line = {
    text = '',
    r = 1,
    g = 1,
    b = 1,
    wrapText = true
  },
  texture = {
    file = '',
    info = {
      width = 12,
      height = 12,
      anchor = Enum.TooltipTextureAnchor.LeftTop or 0,
      region = Enum.TooltipTextureRelativeRegion.LeftLine or 0,
      verticalOffset = 0,
      margin = {left = 8, right = 8, top = 0, bottom = 1},
      texCoords = {left = 0, right = 1, top = 0, bottom = 1},
      vertexColor = {r = 1, g = 1, b = 1, a = 1}
    }
  }
}

Lodestone.DEFAULT_WAYPOINT = {
  name = L.WAYPOINT,
  description = '',
  mapId = nil,
  coords = {},
  nameColor = {},
  nameColorSet = false,
  overrideBg = false,
  selectedTexture = nil,
  selectedAtlas = nil,
  pinTexture = 'pin-1-mono',
  pinColor = {},
  pinColorSet = false,
  pinSize = Lodestone.lastProfile.settings.pins.defaultMapPinSize,
  pinLevel = Lodestone.lastProfile.settings.pins.defaultMapPinLevel
}

Lodestone.CONFIG = {
  UNFOCUS_ALPHA = 0.75,
  MAX_WIDTH = 385,
  MIN_HEIGHT = 450,
  MAX_HEIGHT = 2000,
  PADDING = 8,
  TOP_BAR_HEIGHT = 56,
  BOTTOM_BAR_HEIGHT = 20,
  HEADER_HEIGHT = 105,
  EDIT_BOX_WIDTH = 164,
  EDIT_NAME_BOX_WIDTH = 160,
  EDIT_DESC_BOX_WIDTH = 300,
  EDIT_BOX_HEIGHT = 18,
  DEFAULT_BUTTON_OFFSET = 4,
  DEFAULT_ZONE_LIGHT_ID = 15199,
  DEFAULT_SKY_TEXTURES_ID = 0,
  DEFAULT_LIGHT_DATA_ID = 6458,
  SETTINGS_WPTF_FONT_HEIGHT = 18,
  WAYPOINT_COLLECTION = {
    SPOT_FRAME_ROW_HEIGHT_MODIFIER = 5.625,
    SPOT_FRAME_INSET = 6
  },
  DEFAULT_TOOLTIP = DEFAULT_TOOLTIP
}