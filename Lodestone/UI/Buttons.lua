local _, Lodestone = ...
Lodestone.UI = Lodestone.UI or {}

---@class ButtonOpts
---@field template 'CANCEL'|nil
---@field parent Frame
---@field anchor? Frame
---@field point? FramePoint
---@field relativePoint? FramePoint
---@field x? number
---@field y? number
---@field width? number
---@field height? number
---@field text? string

---@param opts ButtonOpts
function Lodestone.UI.button(opts)
  local COORDS = {0.08, 0.92, 0.08, 0.92}
  local TEMPLATES = {
    CANCEL = {130722, 130720, 130721, nil},
  }
  local buttonType = TEMPLATES[opts.template] or TEMPLATES.CANCEL
  local newButton = CreateFrame('Button', nil, opts.parent)
  newButton:SetSize(opts.width or 24, opts.height or 24)
  newButton:SetNormalTexture(buttonType[1])

  if (buttonType[2]) then
    newButton:SetPushedTexture(buttonType[2])
  end
  if (buttonType[3]) then
    newButton:SetHighlightTexture(buttonType[3], 'ADD')
  end
  if (buttonType[4]) then
    newButton:SetDisabledTexture(buttonType[4])
  end
  newButton:GetNormalTexture():SetTexCoord(unpack(COORDS))

  newButton:SetPoint(
    opts.point or 'TOPLEFT',
    opts.anchor or opts.parent,
    opts.relativePoint or nil,
    opts.x or nil,
    opts.y or nil
  )

  return newButton
end

---@class PanelButtonOpts
---@field text string
---@field parent Frame
---@field anchor? Frame defaults to parent
---@field point? FramePoint defaults to 'TOPLEFT'
---@field relativePoint? FramePoint defaults to 'RIGHT'
---@field x? number defaults to CONFIG.defaultButtonOffset
---@field y? number defaults to 0
---@field width? number defaults to 140
---@field height? number defaults to 24

---@param opts PanelButtonOpts
---@return table|Button|UIPanelButtonTemplate
function Lodestone.UI.panelButton(opts)
  local parent = opts.parent
  local btn = CreateFrame('Button', nil, parent, 'UIPanelButtonTemplate')
  btn:SetSize(opts.width or 140, opts.height or 24)
  btn:SetPoint(
    opts.point or 'TOPLEFT',
    opts.anchor or parent,
    opts.relativePoint or 'RIGHT',
    opts.x or Lodestone.CONFIG.DEFAULT_BUTTON_OFFSET,
    opts.y or 0
  )
  btn:SetText(opts.text)
  return btn
end

---@param type 'HELP'|nil Micro button type.
---@param parent Frame Parent frame.
---@return Button
function Lodestone.UI.microButton(type, parent, anchor)
  local COORDS = {0, 1, 0.359, 1}
  local TYPES = {
    HELP = {130794, 130793, 130795, 130792},
  }
  local microButtonType = TYPES[type] or TYPES.HELP
  local newButton = CreateFrame('Button', nil, parent)
  newButton:SetSize(32, 41)
  newButton:SetNormalTexture(microButtonType[1])

  if microButtonType[2] then
    newButton:SetPushedTexture(microButtonType[2])
    local pushedTexture = newButton:GetPushedTexture()
    pushedTexture:SetTexCoord(unpack(COORDS))
  end

  if microButtonType[3] then
    newButton:SetHighlightTexture(microButtonType[3], 'BLEND')
    local highlightTexture = newButton:GetHighlightTexture()
    highlightTexture:SetTexCoord(unpack(COORDS))
  end

  if microButtonType[4] then
    newButton:SetDisabledTexture(microButtonType[4])
    local disabledTexture = newButton:GetDisabledTexture()
    disabledTexture:SetTexCoord(unpack(COORDS))
  end

  newButton:GetNormalTexture():SetTexCoord(unpack(COORDS))
  newButton:SetPoint('TOPLEFT', parent, 'LEFT', anchor)
  return newButton
end

---@param parent Frame Parent frame.
---@param framePoint ScriptRegionResizing
---@return Button
function Lodestone.UI.squareButton(parent, framePoint)
  local newButton = CreateFrame('Button', nil, parent)
  newButton:SetSize(24, 24)
  local icon = newButton:CreateTexture(nil, 'OVERLAY', nil, 2)
  icon:SetTexture(851903)
  icon:SetAllPoints(newButton)

  newButton:SetNormalTexture(796424)
  newButton:GetNormalTexture():SetTexCoord(0.08, 0.92, 0.08, 0.92)
  newButton:SetPushedTexture(796423)
  newButton:SetHighlightTexture(130757, 'ADD')
  newButton:SetDisabledTexture(896467)
  newButton:SetPoint(unpack(framePoint))

  return newButton
end

---@param texture number Texture ID.
---@param parent Frame Parent frame.
---@param width? number
---@param height? number
---@return Button
function Lodestone.UI.iconButton(texture, parent, width, height)
  local newButton = CreateFrame('Button', nil, parent)
  newButton:SetSize(width or 24, height or 24)
  newButton:SetNormalTexture(texture)
  newButton:SetHighlightTexture(texture, 'ADD')
  return newButton
end

function Lodestone.UI.checkButton(parent, anchor, xOffset, yOffset)
    local newCheckButton = CreateFrame('Button', nil, parent, 'UICheckButtonTemplate')
    newCheckButton:SetPoint('LEFT', anchor, 'RIGHT', xOffset or 4, yOffset or 0)
    return newCheckButton
end

function Lodestone.UI.smallButton(text, parent, width, height)
  local newButton = CreateFrame('Button', nil, parent, 'UIPanelButtonTemplate')
  newButton:SetSize(width or 64, height or 18)
  newButton:SetText(text)
  return newButton
end
