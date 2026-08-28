local _, Lodestone = ...
local DynamicSky = Lodestone.DynamicSky
local L = Lodestone.L
local HeaderApi = Lodestone.Header

local function createHeaderFrame(parent)
  local headerFrame = CreateFrame('Frame', nil, parent)
  local headerTopY = -Lodestone.MenuBar:GetHeight() - Lodestone.CONFIG.PADDING
  headerFrame:SetPoint('TOPLEFT', Lodestone.Main, 'TOPLEFT', Lodestone.CONFIG.PADDING, headerTopY)
  headerFrame:SetPoint('TOPRIGHT', Lodestone.Main, 'TOPRIGHT', -Lodestone.CONFIG.PADDING, headerTopY)
  headerFrame:SetHeight(Lodestone.CONFIG.HEADER_HEIGHT)
  headerFrame:SetClipsChildren(true)

  local bgFrame = CreateFrame('Frame', nil, headerFrame)
  bgFrame:SetAllPoints(headerFrame)
  bgFrame:SetFrameLevel(headerFrame:GetFrameLevel() + 1)

  local artFrame = CreateFrame('Frame', nil, headerFrame)
  artFrame:SetAllPoints(headerFrame)
  artFrame:SetFrameLevel(headerFrame:GetFrameLevel() + 2)
  artFrame:EnableMouse(false)

  local overlayFrame = CreateFrame('Frame', nil, headerFrame)
  overlayFrame:SetAllPoints(headerFrame)
  overlayFrame:SetFrameLevel(headerFrame:GetFrameLevel() + 3)
  overlayFrame:SetClipsChildren(true)
  overlayFrame:EnableMouse(false)

  local contentFrame = CreateFrame('Frame', nil, headerFrame)
  contentFrame:SetAllPoints(headerFrame)
  contentFrame:SetFrameLevel(headerFrame:GetFrameLevel() + 4)
  headerFrame.Content = contentFrame

  bgFrame:EnableMouse(false)

  local bgTexture = bgFrame:CreateTexture(nil, 'BACKGROUND')
  local overlayTexture1 = overlayFrame:CreateTexture(nil, 'OVERLAY')
  local overlayTexture2 = overlayFrame:CreateTexture(nil, 'OVERLAY')
  local artTexture = artFrame:CreateTexture(nil, 'ARTWORK')

  local scrollSpeed = 10
  local xOffset = 0

  local function updateOverlayPositions()
    local w = overlayFrame:GetWidth()
    if w == 0 then return end
    overlayTexture1:ClearAllPoints()
    overlayTexture1:SetPoint('TOPLEFT', overlayFrame, 'TOPLEFT', xOffset, 0)
    overlayTexture1:SetSize(w, overlayFrame:GetHeight())
    overlayTexture2:ClearAllPoints()
    overlayTexture2:SetPoint('TOPLEFT', overlayFrame, 'TOPLEFT', xOffset + w, 0)
    overlayTexture2:SetSize(w, overlayFrame:GetHeight())
  end

  local function refreshSky()
    DynamicSky.setSkyGradient(bgFrame)
    DynamicSky.setSkyTextures(bgTexture, overlayTexture1, artTexture, artFrame)

    local _, overlayData = DynamicSky.getSkyTextures()
    local overlayAlpha = overlayData and overlayData.alpha or 0.5
    local overlayrotation = overlayData and overlayData.rotate or 0

    if overlayData then
      if overlayData.blend then
        overlayTexture1:SetBlendMode(overlayData.blend)
        overlayTexture2:SetBlendMode(overlayData.blend)
      end
      overlayTexture2:SetTexture(overlayData.id)
      overlayTexture2:SetAlpha(overlayAlpha)
      overlayTexture2:SetRotation(overlayrotation)

      if overlayData.texCoord then
        overlayTexture2:SetTexCoord(unpack(overlayData.texCoord))
      else
        local vOffset = overlayData.vOffset or 0
        overlayTexture2:SetTexCoord(unpack(DynamicSky.defaultOverlayTexCoords(overlayData.size, vOffset, overlayData.bandFrac)))
      end
      overlayTexture2:Show()
    else
      overlayTexture2:Hide()
    end
    updateOverlayPositions()
  end

  Lodestone.UpdateSky = refreshSky

  overlayFrame:SetScript('OnUpdate', function(_, elapsed)
    local w = overlayFrame:GetWidth()
    if w == 0 then return end
    xOffset = xOffset - scrollSpeed * elapsed
    if xOffset <= -w then xOffset = xOffset + w end
    updateOverlayPositions()
  end)

  headerFrame:HookScript('OnSizeChanged', function()
    refreshSky()
  end)

  refreshSky()

  return headerFrame
end

local headerFrame = createHeaderFrame(Lodestone.Main)

for key, value in pairs(HeaderApi) do
  if type(value) == 'function' and headerFrame[key] == nil then
    headerFrame[key] = value
  end
end

Lodestone.Header = headerFrame

local TEXT2HEIGHT = 18
local YPAD = -20

local headerText = CreateFrame('Frame', 'headerText', headerFrame)
headerText:SetAllPoints(headerFrame)
headerText:SetFrameLevel(headerFrame:GetHighestFrameLevel() + 1)

local text1 = headerText:CreateFontString('headerText1', 'OVERLAY', 'ZoneTextFont')
text1:SetPoint('LEFT', headerFrame, 'LEFT', 0, 0)
text1:SetPoint('RIGHT', headerFrame, 'RIGHT', 0, 0)
text1:SetText('')
local defR, defG, defB, defA = text1:GetTextColor()

local text2 = headerText:CreateFontString('headerText2', 'OVERLAY', 'QuestMapRewardsFont')
text2:SetPoint('BOTTOMLEFT', text1, 'BOTTOMLEFT', 0, YPAD)
text2:SetPoint('BOTTOMRIGHT', text1, 'BOTTOMRIGHT', 0, YPAD)
text2:SetFontHeight(TEXT2HEIGHT)
text2:SetText('')

local text3 = headerText:CreateFontString('headerText3', 'OVERLAY', 'GameFontDisableSmall')
text3:SetPoint('BOTTOMLEFT', text2, 'BOTTOMLEFT', 0, YPAD/2)
text3:SetPoint('BOTTOMRIGHT', text2, 'BOTTOMRIGHT', 0, YPAD/2)
text3:SetText('')

local coordinatesText = headerText:CreateFontString('headerCoordinates', 'OVERLAY', 'NumberFont_GameNormal')
coordinatesText:SetPoint('TOP', headerFrame, 'TOP', 0, -2)
coordinatesText:SetText('')

function Lodestone:UpdateHeaderText()
  local name, type, _, _, _, _, _, _, _ = GetInstanceInfo()
  local zone = GetZoneText()
  local subZone = GetSubZoneText()
  local firstText = subZone or zone or name
  if subZone and subZone ~= '' then
    firstText = subZone
  elseif zone and zone ~= '' then
    firstText = zone
  else
    firstText = name
  end

  Lodestone.CurrentPosName = firstText

  text1:SetText(firstText)

  if subZone ~= '' then
    text2:SetText(zone)
  else
    text2:SetText('')
  end

  if type ~= 'none' then
    text3:SetText(string.format('(%s)', type))
  else
    text3:SetText('')
  end

end

local elapsed = 0
local interval = 0.25

headerText:SetScript('OnUpdate', function(self, e)
  elapsed = elapsed + e
  if elapsed >= interval then
    local mapId, x, y = Lodestone.GetPlayerPosition()
    local formattedCoords = Lodestone.Util.formatWaypointCoords({mapId = mapId, x = x, y = y})
    coordinatesText:SetText(formattedCoords)
    elapsed = 0
  end
end)

Lodestone:SetTooltip(headerText, {
  text = L.SLASH_TT2,
  lines = {L.CLICK_TO_SAVE}
})

headerText:HookScript('OnEnter', function(self)
  text1:SetTextColor(0.906, 0.6, 1, 1)
end)

headerText:HookScript('OnLeave', function(self)
  text1:SetTextColor(defR, defG, defB, defA)
end)

headerText:SetScript('OnMouseUp', function(self)
  local mapId, x, y = Lodestone.GetPlayerPosition()
  Lodestone.SaveWaypoint(mapId, x, y, Lodestone.CurrentPosName or L.WAYPOINT)
end)

Lodestone:UpdateHeaderText()