local _, Lodestone = ...
Lodestone.UI = Lodestone.UI or {}
local L = Lodestone.L

local activeColorPickerClose

ColorPickerFrame:HookScript('OnHide', function()
  if activeColorPickerClose then
    local onClose = activeColorPickerClose
    activeColorPickerClose = nil
    onClose()
  end
end)

function Lodestone.UI.waypointName(name, parent, waypoint)
  local prefs = Lodestone.lastProfile.settings.collection
  local nameText = parent:CreateFontString(nil, 'OVERLAY', prefs.titleFont)
  nameText:SetPoint('TOPLEFT', Lodestone.CONFIG.PADDING, -6)
  nameText:SetText(name or L.WAYPOINT)
  Lodestone.Util.applyFontObject(nameText, prefs.titleFont, prefs.titleFontHeight)
  if waypoint and waypoint.nameColor then
    nameText:SetTextColor(waypoint.nameColor.r, waypoint.nameColor.g, waypoint.nameColor.b)
  end

  return nameText
end

function Lodestone.UI.waypointCoordinates(waypoint, parent, anchor)
  local coordBox = CreateFrame('EditBox', nil, parent)
  coordBox:SetFontObject(GameFontDisableSmall)
  coordBox:SetSize(90, 16)
  coordBox:SetPoint('LEFT', anchor, 'RIGHT', Lodestone.CONFIG.PADDING)
  coordBox:SetAutoFocus(false)

  local coordsText = Lodestone.Util.formatWaypointCoords(waypoint)
  coordBox:SetText(coordsText)
  coordBox:SetCursorPosition(0)
  coordBox:SetScript('OnEditFocusGained', function(self) self:HighlightText() end)
  coordBox:SetScript('OnEscapePressed', function(self) self:ClearFocus() end)
  coordBox:SetScript('OnEnterPressed', function(self) self:ClearFocus() end)
  coordBox:SetScript('OnTextChanged', function(self, isUserInput)
    if isUserInput then
      self:SetText(coordsText)
      self:HighlightText()
    end
  end)

  Lodestone:SetTooltip(coordBox, {
    text = L.CLICK_TO_HIGHLIGHT,
    lines = {L.CTRL_C_COPY}
  })

  return coordBox
end

function Lodestone.UI.waypointDescription(text, parent, anchor)
  local descText = parent:CreateFontString(nil, 'OVERLAY', 'GameFontHighlightSmall')
  descText:SetPoint('TOPLEFT', anchor, 'BOTTOMLEFT', 0, -2)
  descText:SetJustifyH('LEFT')
  descText:SetText((text and text ~= '') and text or L.NO_DESCRIPTION)
  descText:SetWidth(parent:GetWidth())
  descText:SetHeight(parent:GetHeight() / 2)

  return descText
end

function Lodestone.UI.waypointEditButton(parent, anchor)
  local editButton = CreateFrame('Button', nil, parent)
  editButton:SetSize(24, 24)
  editButton:SetNormalTexture(418847)
  editButton:SetHighlightTexture(418847, 'ADD')
  editButton:SetPoint('LEFT', anchor, 'RIGHT', 0)

  editButton:SetScript('OnUpdate', function(self)
    if self.isEditing and self.isEditing() then
      editButton:SetNormalTexture(130750)
      editButton:SetHighlightTexture(130751)
    end
  end)

  editButton:SetScript('OnEnter', function(self)
    GameTooltip:SetOwner(self, 'ANCHOR_TOP')
    if self.isEditing and self.isEditing() then
      GameTooltip:SetText(SAVE_CHANGES, 1, 1, 1)
    else
      GameTooltip:SetText(EDIT, 1, 1, 1)
      GameTooltip:AddLine(L.EDIT_WAYPOINT_DESC)
    end
    GameTooltip:Show()
  end)

  editButton:SetScript('OnLeave', function(self)
  GameTooltip:Hide()
  end)

  return editButton
end

function Lodestone.UI.waypointNameEditColorButton(parent, anchor, getColor, setColor, hooks)
  local editNameColorButton = Lodestone.UI.iconButton(7961739, parent)
  editNameColorButton:SetPoint('LEFT', anchor, 'RIGHT', 4)
  editNameColorButton:RegisterForClicks('LeftButtonUp', 'RightButtonUp')
  hooks = hooks or {}

  local function endPickerSession()
    if activeColorPickerClose then
      activeColorPickerClose = nil
    end
    if hooks.onClose then
      hooks.onClose()
    end
  end

  Lodestone:SetTooltip(editNameColorButton, {
    text = L.WAYPOINT_NAME_COLOR,
    lines = {L.WAYPOINT_NAME_COLOR_RESET}
  })

  editNameColorButton:SetScript('OnClick', function(_, mouseButton)
    if mouseButton == 'RightButton' then
      setColor(nil, nil, nil)
      return
    end

    if hooks.onOpen then
      hooks.onOpen()
    end

    activeColorPickerClose = endPickerSession

    local startR, startG, startB = getColor()
    local pickerStartHadCustom = startR ~= nil
    if not startR then
      startR, startG, startB = Lodestone.Util.getWaypointTitleFontColor()
    end

    ColorPickerFrame:SetupColorPickerAndShow({
      r = startR,
      g = startG,
      b = startB,
      hasOpacity = false,
      swatchFunc = function()
        local r, g, b = ColorPickerFrame:GetColorRGB()
        setColor(r, g, b)
      end,
      cancelFunc = function()
        if pickerStartHadCustom then
          local r, g, b = ColorPickerFrame:GetPreviousValues()
          setColor(r, g, b)
        else
          setColor(nil, nil, nil)
        end
      end,
    })
  end)

  return editNameColorButton
end

function Lodestone.UI.waypointDeleteButton(parent, width, height)
  local deleteButton = Lodestone.UI.button({
    template = 'CANCEL',
    parent = parent,
    anchor = parent,
    point = 'BOTTOMRIGHT',
    relativePoint = 'BOTTOMRIGHT',
    x = 0,
    y = 0,
    width = width,
    height = height,
  })

  Lodestone:SetTooltip(deleteButton, {
    text = DELETE,
    lines = {L.DELETE_WAYPOINT_DESC}
  })

  return deleteButton
end