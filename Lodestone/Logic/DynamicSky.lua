-- The feature nobody asked for c:
local _, Lodestone = ...
Lodestone.DynamicSky = Lodestone.DynamicSky or {}
local DynamicSky = Lodestone.DynamicSky

function DynamicSky.getLightTimeIndex()
  local hour, minute = GetGameTime()
  if not hour then hour, minute = 12, 0 end
  return hour * 120 + minute * 2
end

function DynamicSky.getSkyboxTimeIndex()
  local time = DynamicSky.getLightTimeIndex()
  local TIME_RANGES = {
    {index = 0, min = 1440, max = 2160},
    {index = 1, min = 720, max = 1440},
    {index = 1, min = 2160, max = 2520},
    {index = 2, min = 2520, max = 2880},
    {index = 2, min = 0, max = 720},
  }
  for i, t in ipairs(TIME_RANGES) do
    if time >= t.min and time < t.max then
      return t.index
    end
  end
end

function DynamicSky.getLightDataTime(lightParamID)
  local time = DynamicSky.getLightTimeIndex()
  local lightData = DynamicSky.LIGHT_DATA[lightParamID] or DynamicSky.LIGHT_DATA[0]
  if not lightData then return nil end

  local closestKey, closestDist = nil, math.huge
  for timeKey, entry in pairs(lightData) do
    local dist = math.abs(timeKey - time)
    if dist < closestDist then
      closestKey, closestDist = timeKey, dist
    end
  end

  return closestKey and lightData[closestKey]
end

function DynamicSky.getMapData()
  local name, _, _, _, _, _, _, mapID = GetInstanceInfo()
  local continentID = mapID
  local uiMapID = C_Map.GetBestMapForUnit('player')

  local continentData = continentID and DynamicSky.MAP_DATA[continentID]
  local mapData = continentData and uiMapID and continentData[uiMapID]

  return mapData or nil
end

function DynamicSky.getSkyGradient()
  local lightParamID = DynamicSky.getMapData() and DynamicSky.getMapData().lightParamId or 0
  local gradient = DynamicSky.getLightDataTime(lightParamID)
  return gradient
end

function DynamicSky.getSkyTextures()
  local name, _, _, _, _, _, _, mapID = GetInstanceInfo()
  local subZone = GetSubZoneText()
  local zone = GetZoneText()
  local i = DynamicSky.getSkyboxTimeIndex()
  local skyboxFileDataID = DynamicSky.getMapData() and DynamicSky.getMapData().skyboxFileDataID or Lodestone.CONFIG.DEFAULT_SKY_TEXTURES_ID
  local skyTextureItem = DynamicSky.SKY_TEXTURES[skyboxFileDataID]
  local defaultSkyTextureItem = DynamicSky.SKY_TEXTURES[Lodestone.CONFIG.DEFAULT_SKY_TEXTURES_ID]
  if not skyTextureItem then
    skyTextureItem = defaultSkyTextureItem
  end
  local selection = DynamicSky.OVERRIDES[subZone] or DynamicSky.OVERRIDES[zone] or DynamicSky.OVERRIDES[name] or skyTextureItem and (skyTextureItem[i] or skyTextureItem[0] or skyTextureItem[1] or skyTextureItem[2])
  if not selection and defaultSkyTextureItem then
    selection = defaultSkyTextureItem[i] or defaultSkyTextureItem[0] or defaultSkyTextureItem[1] or defaultSkyTextureItem[2]
  end

  if not selection then
    return nil, nil, nil
  end
  return selection.bg, selection.overlay, selection.art
end

function DynamicSky.setSkyGradient(backdropParent)
  local lightConfig = DynamicSky.getSkyGradient()
  if backdropParent.dynamicSkyStrips then
    for _, tex in ipairs(backdropParent.dynamicSkyStrips) do
      tex:Hide()
      tex:SetParent(nil)
    end
    backdropParent.dynamicSkyStrips = nil
  end

  if not lightConfig then
    return
  end

  local bands = {
    { from = 'top',    to = 'midTop', heightPct = 0.18 },
    { from = 'midTop', to = 'mid',    heightPct = 0.32 },
    { from = 'mid',    to = 'low',    heightPct = 0.30 },
    { from = 'low',    to = 'bottom', heightPct = 0.20 },
  }

  backdropParent.dynamicSkyStrips = {}

  local parentHeight = backdropParent:GetHeight()
  local y = 0
  for i, band in ipairs(bands) do
      local tex = backdropParent:CreateTexture(nil, 'BACKGROUND')
      tex:SetDrawLayer('BACKGROUND', -(#bands + i))
      tex:SetPoint('TOPLEFT', backdropParent, 'TOPLEFT', 0, -y)
      tex:SetPoint('TOPRIGHT', backdropParent, 'TOPRIGHT', 0, -y)
      tex:SetHeight(parentHeight * band.heightPct)

      tex:SetTexture('Interface/Buttons/WHITE8x8')
      local r1, g1, b1 = Lodestone.Util.hexToRGB(lightConfig[band.to])
      local r2, g2, b2 = Lodestone.Util.hexToRGB(lightConfig[band.from])
      tex:SetGradient('VERTICAL', CreateColor(r1, g1, b1, 1), CreateColor(r2, g2, b2, 1))

      table.insert(backdropParent.dynamicSkyStrips, tex)
      y = y + tex:GetHeight()
  end
end

local function getArtLayers(art)
  if not art then return nil end
  if art.id then return { art } end
  if art[1] then return art end
  return nil
end

local function applyArtLayer(artTexture, art, parent)
  if not art or not art.id then
    artTexture:Hide()
    return
  end

  artTexture:SetTexture(art.id)
  if art.texCoord then
    local width = art.size and art.size[1] or Lodestone.CONFIG.HEADER_HEIGHT
    artTexture:SetSize(width, Lodestone.CONFIG.HEADER_HEIGHT)
    artTexture:SetTexCoord(unpack(art.texCoord))
  elseif art.size and art.size[1] and art.size[2] then
    local vOffset = art.vOffset or 0
    local bandFrac = art.bandFrac or (Lodestone.CONFIG.HEADER_HEIGHT / art.size[2])
    if bandFrac >= 1 then
      artTexture:SetSize(art.size[1], art.size[2])
      artTexture:SetTexCoord(0, 1, 0, 1)
    else
      artTexture:SetSize(art.size[1], Lodestone.CONFIG.HEADER_HEIGHT)
      artTexture:SetTexCoord(unpack(DynamicSky.defaultArtTexCoords(art.size, vOffset, bandFrac)))
    end
  else
    artTexture:SetSize(Lodestone.CONFIG.HEADER_HEIGHT, Lodestone.CONFIG.HEADER_HEIGHT)
    artTexture:SetTexCoord(0, 1, 0, 1)
  end

  artTexture:SetAlpha(art.alpha or 1)
  artTexture:ClearAllPoints()
  artTexture:SetPoint('TOPRIGHT', parent, 'TOPRIGHT', 0, 0)
  artTexture:SetBlendMode(art.blend or 'BLEND')
  artTexture:Show()
end

local function hideExtraArtLayers(parent, fromIndex)
  if not parent.dynamicSkyArtLayers then return end
  for i = fromIndex, #parent.dynamicSkyArtLayers do
    parent.dynamicSkyArtLayers[i]:Hide()
  end
end

function DynamicSky.setSkyTextures(bgTexture, overlayTexture, artTexture, parent)
  local bg, overlay, art = DynamicSky.getSkyTextures()
  if not bg and not overlay and not art then
    bgTexture:Hide()
    overlayTexture:Hide()
    artTexture:Hide()
    hideExtraArtLayers(parent, 1)
    return
  end

  if bg then
    bgTexture:SetTexture(bg.id)
    bgTexture:SetSnapToPixelGrid(false)
    bgTexture:SetTexelSnappingBias(0)
    if bg.texCoord then
      bgTexture:SetTexCoord(unpack(bg.texCoord))
    else
      local vOffset = bg.vOffset or 0
      bgTexture:SetTexCoord(unpack(DynamicSky.defaultBgTexCoords(bg.size, vOffset, bg.bandFrac)))
    end
    bgTexture:SetDrawLayer('ARTWORK', 0)
    bgTexture:SetAllPoints()
    bgTexture:Show()
  else
    bgTexture:Hide()
  end

  if overlay then
    overlayTexture:SetTexture(overlay.id)
    overlayTexture:SetAlpha(overlay.alpha or 0.65)
    if overlay.texCoord then
      overlayTexture:SetTexCoord(unpack(overlay.texCoord))
    else
      local vOffset = overlay.vOffset or 0
      overlayTexture:SetTexCoord(unpack(DynamicSky.defaultOverlayTexCoords(overlay.size, vOffset, overlay.bandFrac)))
    end
    overlayTexture:SetRotation(overlay.rotate or 0)
    overlayTexture:Show()
  else
    overlayTexture:Hide()
  end

  if art then
    local artLayers = getArtLayers(art)
    if not artLayers or #artLayers == 0 then
      artTexture:Hide()
      hideExtraArtLayers(parent, 1)
    else
      applyArtLayer(artTexture, artLayers[1], parent)

      parent.dynamicSkyArtLayers = parent.dynamicSkyArtLayers or {}
      for i = 2, #artLayers do
        local extraTex = parent.dynamicSkyArtLayers[i - 1]
        if not extraTex then
          extraTex = parent:CreateTexture(nil, 'ARTWORK')
          extraTex:SetDrawLayer('ARTWORK', i - 1)
          parent.dynamicSkyArtLayers[i - 1] = extraTex
        end
        applyArtLayer(extraTex, artLayers[i], parent)
      end
      hideExtraArtLayers(parent, #artLayers)
    end
  else
    artTexture:Hide()
    hideExtraArtLayers(parent, 1)
  end
end

function DynamicSky.defaultBandFrac(size)
  if not size or not size[1] or not size[2] or size[2] == 0 then
    return Lodestone.CONFIG.HEADER_HEIGHT / Lodestone.CONFIG.MAX_WIDTH
  end
  return (size[1] * Lodestone.CONFIG.HEADER_HEIGHT) / (size[2] * Lodestone.CONFIG.MAX_WIDTH)
end

local function verticalSliceTexCoords(vOffset, bandFrac)
  vOffset = vOffset or 0
  if bandFrac >= 1 then
    return {0, 1, vOffset, 1 + vOffset}
  end
  local half = bandFrac / 2
  return {0, 1, (0.5 - half) + vOffset, (0.5 + half) + vOffset}
end

function DynamicSky.defaultBgTexCoords(size, vOffset, bandFrac)
  bandFrac = bandFrac or DynamicSky.defaultBandFrac(size)
  return verticalSliceTexCoords(vOffset, bandFrac)
end

function DynamicSky.defaultArtTexCoords(size, vOffset, bandFrac)
  bandFrac = bandFrac or (Lodestone.CONFIG.HEADER_HEIGHT / size[2])
  return verticalSliceTexCoords(vOffset, bandFrac)
end

function DynamicSky.defaultOverlayTexCoords(size, vOffset, bandFrac)
  bandFrac = bandFrac or DynamicSky.defaultBandFrac(size)
  return verticalSliceTexCoords(vOffset, bandFrac)
end