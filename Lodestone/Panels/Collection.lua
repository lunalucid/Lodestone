local _, Lodestone = ...
local L = Lodestone.L
local Collection = Lodestone.Collection

local YPAD = -8
local XPAD = 8

local function getTexture(mapID)
  local bg = Lodestone.SpotFrame.MAP_BACKGROUNDS[mapID] or 'classic'
  return bg
end

local contentClip = Lodestone.Content
local scrollFrame = CreateFrame('ScrollFrame', 'CollectionScrollFrame', contentClip, 'ScrollFrameTemplate')

local searchBox = CreateFrame('EditBox', nil, scrollFrame, 'SearchBoxTemplate')
searchBox:SetSize(160, 18)
searchBox:SetPoint('TOPLEFT', contentClip, 'TOPLEFT', Lodestone.CONFIG.PADDING, YPAD)
searchBox:SetAutoFocus(false)
searchBox:SetFrameLevel(contentClip:GetHighestFrameLevel() + 1)
Lodestone.SearchBox = searchBox

local sbh = searchBox:GetHeight()

local deleteAllButton = CreateFrame('Button', nil, scrollFrame)
deleteAllButton:SetNormalAtlas('common-icon-delete-disable')
deleteAllButton:SetHighlightAtlas('common-icon-delete')
deleteAllButton:SetSize(sbh, sbh)
deleteAllButton:SetPoint('RIGHT', searchBox, 'RIGHT', sbh + XPAD, 0)
Lodestone:SetTooltip(deleteAllButton, {text = L.DELETE_ALL, lines = {L.DELETE_ALL_SAVED_WAYPOINTS}})

deleteAllButton:SetScript('OnClick', function()
  StaticPopup_Show('LODESTONE_DELETE_ALL')
end)

scrollFrame:SetPoint('TOPLEFT', searchBox, 'TOPLEFT', 0, -sbh + YPAD)
scrollFrame:SetPoint('BOTTOMRIGHT', contentClip, 'BOTTOMRIGHT', -(Lodestone.CONFIG.PADDING * 3 + 4), Lodestone.CONFIG.PADDING)
scrollFrame:SetFrameLevel(contentClip:GetFrameLevel() + 1)
Lodestone.ScrollFrame = scrollFrame

local scrollChild = CreateFrame('Frame', nil, scrollFrame)
scrollFrame:SetScrollChild(scrollChild)
scrollChild:SetFrameLevel(scrollFrame:GetFrameLevel() + 1)
scrollChild:SetPoint('TOPLEFT', scrollFrame, 'TOPLEFT', 0, 0)
scrollChild:SetPoint('TOPRIGHT', scrollFrame, 'TOPRIGHT', 0, 0)
scrollChild:SetHeight(800)
Lodestone.ScrollChild = scrollChild

scrollFrame:SetScript('OnSizeChanged', function(_, width)
  scrollChild:SetWidth(width)
end)

scrollFrame:HookScript('OnShow', function()
  local width = scrollFrame:GetWidth()
  if width and width > 0 then
    scrollChild:SetWidth(width)
  end
end)

function Lodestone.Collection.updateSearchBoxInstructions(box)
  if box.Instructions then
    if box:GetText() == '' then
      box.Instructions:Show()
    else
      box.Instructions:Hide()
    end
  end
end

Lodestone.Collection.updateSearchBoxInstructions(searchBox)

searchBox:SetScript('OnTextChanged', function(self)
  Lodestone.Collection.updateSearchBoxInstructions(self)
  if Lodestone.Collection.refreshWaypointList then
    Lodestone.Collection.refreshWaypointList()
  end
end)

function Lodestone.Collection.waypointMatchesSearch(waypoint, query)
  if query == '' then
    return true
  end
  query = strlower(query)
  local name = strlower(waypoint.name or '')
  local description = strlower(waypoint.description or '')
  return name:find(query, 1, true) or description:find(query, 1, true)
end

local waypointRows = {}
local rowHeight = Lodestone.ScrollChild:GetWidth() / Lodestone.CONFIG.WAYPOINT_COLLECTION.SPOT_FRAME_ROW_HEIGHT_MODIFIER -- 80
local rowSpacing = 0
local listTop = 0

local opacity = 0.8

local function clearWaypointRows()
  for _, row in ipairs(waypointRows) do
    row:Hide()
    row:SetParent(nil)
  end
  waypointRows = {}
end

local function createSpotframe(yOffset)
  local spotFrame = CreateFrame('Button', nil, scrollChild)
  spotFrame:SetPoint('TOPLEFT', scrollChild, 'TOPLEFT', 0, yOffset)
  spotFrame:SetPoint('TOPRIGHT', scrollChild, 'TOPRIGHT', 0, yOffset)
  spotFrame:SetHeight(rowHeight)
  spotFrame:SetHighlightTexture(string.format('Interface\\AddOns\\%s\\Textures\\spotFrame-highlight.tga', Lodestone.name), 'ADD')
  return spotFrame
end

local function createWaypointEntry(waypoints, id, yOffset)
  local prefs = Lodestone.lastProfile.settings.collection
  local waypoint = waypoints[id]
  local editing = false

  local spotFrame = createSpotframe(yOffset)

  spotFrame.bg = spotFrame:CreateTexture(nil, 'BACKGROUND')
  spotFrame.bg:SetAllPoints()
  local bgTexture = Lodestone.lastProfile.waypoints[id].overrideBg and Lodestone.lastProfile.waypoints[id].selectedTexture or getTexture(waypoint.mapId)
  spotFrame.bg:SetTexture(bgTexture)

  local bgData = Lodestone.SpotFrame.BACKGROUND_TEXTURE_LOOKUP[bgTexture]
  local bgAtlas = Lodestone.lastProfile.waypoints[id].selectedAtlas or nil

  local targetSize = bgData and bgData.target or nil
  local sourceSize = bgData and bgData.source or nil
  Lodestone.Collection.SetSpotFrameTexCoords(spotFrame.bg, bgAtlas, targetSize, sourceSize)

  spotFrame.bg:SetAlpha(opacity)

  local bgMask = spotFrame:CreateMaskTexture()
  bgMask:SetTexture(string.format('Interface\\AddOns\\%s\\Textures\\spotFrame-mask.tga', Lodestone.name), 'CLAMPTOBLACKADDITIVE', 'CLAMPTOBLACKADDITIVE')
  bgMask:SetAllPoints(spotFrame.bg)
  spotFrame.bg:AddMaskTexture(bgMask)

  local waypointName = Lodestone.UI.waypointName(waypoint.name, spotFrame, waypoint)
  local waypointEditButton = Lodestone.UI.waypointEditButton(spotFrame, waypointName)
  waypointEditButton.isEditing = function()
    return editing
  end
  local waypointCoordinates = Lodestone.UI.waypointCoordinates(waypoint, spotFrame, waypointEditButton)
  local waypointDescription = Lodestone.UI.waypointDescription(waypoint.description, spotFrame, waypointName)
  local waypointDeleteButton = Lodestone.UI.waypointDeleteButton(spotFrame)
  waypointDeleteButton:Hide()

  local nameEditBox = CreateFrame('EditBox', nil, spotFrame, 'InputBoxTemplate')
  nameEditBox:SetSize(Lodestone.CONFIG.EDIT_NAME_BOX_WIDTH, Lodestone.CONFIG.EDIT_BOX_HEIGHT)
  nameEditBox:SetPoint('TOPLEFT', waypointName, 'TOPLEFT', 6, 0)
  nameEditBox:SetAutoFocus(false)
  nameEditBox:SetMaxLetters(50)
  nameEditBox:Hide()

  Lodestone:SetTooltip(nameEditBox, {
    text = NAME
  })

  local editNameColor = waypoint.nameColor
  local nameColorSet = false
  local colorPickerOpen = false

  local function applyNamePreview()
    waypointName:SetText(nameEditBox:GetText())
    waypointName:Show()
    Lodestone.Util.applyFontObject(waypointName, prefs.titleFont, prefs.titleFontHeight)
    if editNameColor then
      waypointName:SetTextColor(editNameColor.r, editNameColor.g, editNameColor.b)
    end
  end

  local function applyNameEditBoxStyle()
    Lodestone.Util.applyFontObject(nameEditBox, prefs.titleFont, prefs.titleFontHeight)
    if editNameColor then
      nameEditBox:SetTextColor(editNameColor.r, editNameColor.g, editNameColor.b)
    end
  end

  nameEditBox:HookScript('OnEditFocusGained', function()
    if editing then
      applyNameEditBoxStyle()
    end
  end)

  local function getEditNameColor()
    if editNameColor then
      return editNameColor.r, editNameColor.g, editNameColor.b
    end
    return nil, nil, nil
  end

  local function setEditNameColor(r, g, b)
    nameColorSet = true
    if r == nil then
      editNameColor = nil
    else
      editNameColor = { r = r, g = g, b = b }
    end
    if colorPickerOpen then
      applyNamePreview()
    else
      applyNameEditBoxStyle()
    end
  end

  local waypointEditNameColorButton = Lodestone.UI.waypointNameEditColorButton(
    spotFrame,
    nameEditBox,
    getEditNameColor,
    setEditNameColor,
    {
      onOpen = function()
        colorPickerOpen = true
        nameEditBox:Hide()
        applyNamePreview()
      end,
      onClose = function()
        if not colorPickerOpen then
          return
        end
        colorPickerOpen = false
        if editing then
          waypointName:Hide()
          nameEditBox:Show()
          applyNameEditBoxStyle()
        end
      end,
    }
  )
  waypointEditNameColorButton:Hide()

  local descEditFrame = CreateFrame('Frame', nil, spotFrame, 'BackdropTemplate')
  descEditFrame:SetSize(Lodestone.CONFIG.EDIT_DESC_BOX_WIDTH + 7, 2 * Lodestone.CONFIG.EDIT_BOX_HEIGHT)
  descEditFrame:SetPoint('TOPLEFT', nameEditBox, 'BOTTOMLEFT', -6, -8)
  descEditFrame:SetBackdrop({
    bgFile = 'Interface\\ChatFrame\\ChatFrameBackground',
    edgeFile = 'Interface\\Tooltips\\UI-Tooltip-Border',
    edgeSize = 16,
    insets = { left = 3, right = 3, top = 3, bottom = 3 },
  })
  descEditFrame:SetBackdropColor(0, 0, 0, 0.5)
  descEditFrame:SetBackdropBorderColor(1, 1, 1, 0.4)
  descEditFrame:Hide()

  local descScrollFrame = CreateFrame('ScrollFrame', nil, descEditFrame, 'UIPanelScrollFrameTemplate')
  descScrollFrame:SetPoint('TOPLEFT', 6, -4)
  descScrollFrame:SetPoint('BOTTOMRIGHT', -6, 4)
  descScrollFrame.ScrollBar:SetShown(false)
  descScrollFrame.ScrollBar:HookScript('OnShow', function(self) self:Hide() end)

  local descEditBox = CreateFrame('EditBox', nil, descScrollFrame)
  descEditBox:SetMultiLine(true)
  descEditBox:SetFontObject(ChatFontNormal)
  descEditBox:SetAutoFocus(false)
  descEditBox:SetWidth(Lodestone.CONFIG.EDIT_DESC_BOX_WIDTH + 7)
  descScrollFrame:SetScrollChild(descEditBox)
  descEditBox:SetMaxLetters(300)

  Lodestone:SetTooltip(descEditBox, {
    text = DESCRIPTION
  })

  descEditBox:SetScript('OnCursorChanged', function(self, x, y, w, h)
    ScrollingEdit_OnCursorChanged(self, x, y, w, h)
  end)
  descEditBox:SetScript('OnUpdate', function(self, elapsed)
    ScrollingEdit_OnUpdate(self, elapsed, descScrollFrame)
  end)
  descScrollFrame:EnableMouseWheel(true)
  descScrollFrame:SetScript('OnMouseWheel', function(self, delta)
    local current = self:GetVerticalScroll()
    local max = self:GetVerticalScrollRange()
    self:SetVerticalScroll(delta > 0 and math.max(0, current - 20) or math.min(max, current + 20))
  end)

  local mapIdEditBox = CreateFrame('EditBox', nil, spotFrame, 'InputBoxTemplate')
  mapIdEditBox:SetSize(Lodestone.CONFIG.EDIT_NAME_BOX_WIDTH / 4, Lodestone.CONFIG.EDIT_BOX_HEIGHT)
  mapIdEditBox:SetPoint('LEFT', waypointEditNameColorButton, 'RIGHT', XPAD, 0)
  mapIdEditBox:SetAutoFocus(false)
  mapIdEditBox:SetMaxLetters(20)
  mapIdEditBox:SetText(waypoint.mapId or '0')
  mapIdEditBox:Hide()

  Lodestone:SetTooltip(mapIdEditBox, {
    text = 'MapID'
  })

  local coordEditBox = CreateFrame('EditBox', nil, spotFrame, 'InputBoxTemplate')
  coordEditBox:SetSize(Lodestone.CONFIG.EDIT_NAME_BOX_WIDTH / 3, Lodestone.CONFIG.EDIT_BOX_HEIGHT)
  coordEditBox:SetPoint('LEFT', mapIdEditBox, 'RIGHT', XPAD, 0)
  coordEditBox:SetAutoFocus(false)
  coordEditBox:SetMaxLetters(20)
  coordEditBox:SetText(Lodestone.Util.formatWaypointCoords({ x = waypoint.x, y = waypoint.y }))
  coordEditBox:Hide()

  Lodestone:SetTooltip(coordEditBox, {
    text = L.COORDINATES
  })

  local function exitEditMode(save)
    if save then
      Lodestone.UpdateWaypoint(id, {
        name = nameEditBox:GetText(),
        description = descEditBox:GetText(),
        mapId = tonumber(mapIdEditBox:GetText()),
        coords = coordEditBox:GetText(),
        nameColor = editNameColor,
        nameColorSet = nameColorSet
      })
    end
    if Collection.refreshWaypointList then
      Collection.refreshWaypointList()
    end
  end

  local function enterEditMode()
    editing = true
    if waypoint.nameColor then
      editNameColor = {
        r = waypoint.nameColor.r,
        g = waypoint.nameColor.g,
        b = waypoint.nameColor.b,
      }
    else
      editNameColor = nil
    end
    nameColorSet = false
    nameEditBox:SetText(waypoint.name or '')
    descEditBox:SetText(waypoint.description or '')
    waypointName:Hide()
    waypointDescription:Hide()
    waypointDeleteButton:Show()
    nameEditBox:Show()
    coordEditBox:Show()
    mapIdEditBox:Show()
    descEditFrame:Show()
    applyNameEditBoxStyle()
    waypointEditNameColorButton:Show()
    waypointEditButton:ClearAllPoints()
    waypointEditButton:SetPoint('LEFT', coordEditBox, 'RIGHT', XPAD / 2, 0)
    waypointCoordinates:Hide()
    nameEditBox:SetFocus()
    applyNameEditBoxStyle()
  end

  nameEditBox:SetScript('OnEscapePressed', function() exitEditMode(false) end)
  descEditBox:SetScript('OnEscapePressed', function() exitEditMode(false) end)
  nameEditBox:SetScript('OnEnterPressed', function() exitEditMode(true) end)
  descEditBox:SetScript('OnEnterPressed', function(self)
    if IsShiftKeyDown() then
      self:Insert('\n')
    else
      exitEditMode(true)
    end
  end)

  function spotFrame:isWaypointActive()
    if waypoint and waypoint.mapId and waypoint.x and waypoint.y then
      return Lodestone.Navigation.isWaypointActive(waypoint.mapId, waypoint.x, waypoint.y)
    end
    return false
  end

  local function deleteWaypoint()
    StaticPopup_Show('LODESTONE_DELETE_WAYPOINT', waypoint.name or L.WAYPOINT, nil, { id = id })
  end

  local function generateContextMenu(ownerRegion, rootDescription)
    rootDescription:CreateTitle(SETTINGS_TITLE)
    rootDescription:CreateButton(EDIT, enterEditMode)
    rootDescription:CreateButton(DELETE, deleteWaypoint)
    rootDescription:CreateButton(L.CHAT_WAYPOINT, function()
      Lodestone.ChatWaypoint(id)
    end)

    local pinTextureMenuButton = rootDescription:CreateButton(L.PIN_TEXTURES)
    pinTextureMenuButton:SetGridMode(MenuConstants.VerticalGridDirection, 6)
    for i in pairs(Lodestone.PIN_TEXTURE_DATA) do
      local label = Lodestone.PIN_TEXTURE_DATA[i]
      local btn = pinTextureMenuButton:CreateButton('', function()
        Lodestone.lastProfile.waypoints[id].pinTexture = Lodestone.PIN_TEXTURE_DATA[i]
        Lodestone.Collection.refreshWaypointList()
        Lodestone.ReloadMapPins()
      end)
      local buttonTexture = string.format(Lodestone.CONFIG.PIN_TEXTURE_STRING, Lodestone.name, label)
      btn:AddInitializer(function(button)

      if button.fontString then
        button.fontString:SetText('')
      end

      if button.Icon then
        button.Icon:Hide()
      end

      if not button.customIcon then

        button.customIcon = button:AttachTexture('ARTWORK')
        button.customIcon:SetSize(24, 24)
        button.customIcon:SetPoint('CENTER', button, 'CENTER', 0, 0)
      end

      button.customIcon:SetTexture(buttonTexture)
      button.customIcon:Show()

      button:SetSize(32, 32)
      end)
    end

    local function overrideBg()
      return Lodestone.lastProfile.waypoints[id].overrideBg or false
    end
    local function toggleOverrideBg()
      Lodestone.lastProfile.waypoints[id].overrideBg = not Lodestone.lastProfile.waypoints[id].overrideBg
      Collection.textureMenuButton:SetEnabled(Lodestone.lastProfile.waypoints[id].overrideBg)

      if not Lodestone.lastProfile.waypoints[id].overrideBg then
        Lodestone.Collection.refreshWaypointList()
      end
    end

    Collection.overrideBgCheck = rootDescription:CreateCheckbox(
      L.OVERRIDE_WAYPOINT_BG,
      overrideBg,
      toggleOverrideBg
    )
    Collection.textureMenuButton = rootDescription:CreateButton(L.TEXTURES)
    Collection.textureMenuButton:SetEnabled(Collection.overrideBgCheck:isSelected())

    Lodestone.Util.createSubContextMenuCategories(
      Lodestone.SpotFrame.BACKGROUND_TEXTURES,
      Collection.textureMenuButton,
      function(data)
        Lodestone.lastProfile.waypoints[id].selectedTexture = data.bg
        Lodestone.lastProfile.waypoints[id].selectedAtlas = data.atlas
        Lodestone.Collection.refreshWaypointList()
      end)
  end

  spotFrame:RegisterForClicks('LeftButtonUp', 'RightButtonUp')

  spotFrame.animGroup = spotFrame:CreateAnimationGroup()
  spotFrame.animGroup:SetLooping('BOUNCE')

  local fadeInOut = spotFrame.animGroup:CreateAnimation('Alpha')
  fadeInOut:SetFromAlpha(opacity)
  fadeInOut:SetToAlpha(0.4)
  fadeInOut:SetDuration(1)
  fadeInOut:SetOrder(1)

  local animOverlay = spotFrame:CreateTexture(nil, 'OVERLAY')
  animOverlay:SetTexture(string.format('Interface\\AddOns\\%s\\Textures\\spotFrame-active.tga', Lodestone.name))
  animOverlay:SetAllPoints()
  animOverlay:SetAlpha(0)

  spotFrame.animGroup:SetScript('OnPlay', function()
  end)
  spotFrame.animGroup:SetScript('OnFinished', function()
  end)

  function spotFrame:InitState()
    if spotFrame:isWaypointActive() then
      animOverlay:SetAlpha(1)
      spotFrame.animGroup:Play()
      Lodestone:SetTooltip(spotFrame, {
        text = L.CLICK_TO_DEACTIVATE_WAYPOINT,
        lines = {L.RIGHT_CLICK_FOR_OPTIONS}
      })
    else
      spotFrame.animGroup:Stop()
      animOverlay:SetAlpha(0)
      Lodestone:SetTooltip(spotFrame, {
        text = L.CLICK_TO_ACTIVATE_WAYPOINT,
        lines = {L.RIGHT_CLICK_FOR_OPTIONS}
      })
    end
end

  spotFrame:InitState()

  spotFrame:SetScript('OnClick', function(self, button)
    if editing then
      return
    end
    if button == 'LeftButton' then
      if self:isWaypointActive() then
        Lodestone.ClearWaypoint(true)
        spotFrame:InitState()
      else
        Lodestone.ActivateWaypoint(id)
        spotFrame:InitState()
      end
    elseif button == 'RightButton' then
      MenuUtil.CreateContextMenu(self, generateContextMenu)
    end
  end)

  waypointDeleteButton:SetScript('OnClick', deleteWaypoint)

  waypointEditButton:SetScript('OnClick', function()
    if editing then
      exitEditMode(true)
    else
      enterEditMode()
    end
  end)

  waypointRows[#waypointRows + 1] = spotFrame

end

Collection.refreshWaypointList = function()
  clearWaypointRows()
  local waypoints = Lodestone.GetWaypoints()
  local searchQuery = strtrim(searchBox:GetText() or '')
  local ids = {}
  for id, waypoint in pairs(waypoints) do
    if Collection.waypointMatchesSearch(waypoint, searchQuery) then
      table.insert(ids, id)
    end
  end
  table.sort(ids)

  local yOffset = listTop

  for _, id in ipairs(ids) do
    createWaypointEntry(waypoints, id, yOffset)
    yOffset = yOffset - rowHeight - rowSpacing
  end

  local newWaypointButton = createSpotframe(yOffset)
  local f = Lodestone.lastProfile.settings.collection.titleFont
  local fh = Lodestone.lastProfile.settings.collection.titleFontHeight
  local newWaypointButtonText = newWaypointButton:CreateFontString(nil, 'OVERLAY', f)
  newWaypointButtonText:SetFontHeight(fh)
  newWaypointButtonText:SetAllPoints(newWaypointButton)
  newWaypointButtonText:SetText(L.NEW_WAYPOINT)
  newWaypointButtonText:SetJustifyH('CENTER')
  newWaypointButtonText:Hide()

  newWaypointButton:SetScript('OnEnter', function()
    newWaypointButtonText:Show()
  end)
  newWaypointButton:SetScript('OnLeave', function()
    newWaypointButtonText:Hide()
  end)

  newWaypointButton:SetScript('OnClick', function()
    -- Lodestone.SaveWaypoint(0, 0, 0, L.NEW_WAYPOINT)
    local mapId, x, y = Lodestone.GetPlayerPosition()
    Lodestone.SaveWaypoint(mapId, x, y, Lodestone.CurrentPosName or L.WAYPOINT)

  end)

  yOffset = yOffset - rowHeight - rowSpacing
  waypointRows[#waypointRows + 1] = newWaypointButton

  scrollChild:SetHeight(math.max(400, -yOffset + 20))
end
Lodestone.UpdateWaypointList = Collection.refreshWaypointList
Collection.refreshWaypointList()