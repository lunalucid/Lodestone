local _, Lodestone = ...
Lodestone.UI = Lodestone.UI or {}

---@class LabeledInputOpts
---@field label string
---@field defaultText? string
---@field maxLetters? number
---@field parent Frame
---@field width? number
---@field height? number
---@field labelPosition? 'top'|'left'
---@field position? table
---@field multiline? boolean
---@field numLines? number

---@param opts LabeledInputOpts
---@return Frame container, table input, FontString label
function Lodestone.UI.labeledInput(opts)
  local width = opts.width or Lodestone.CONFIG.EDIT_BOX_WIDTH
  local container = CreateFrame('Frame', nil, opts.parent)

  local label = container:CreateFontString(nil, 'ARTWORK', 'GameFontNormal')
  label:SetText(opts.label)

  local input
  local inputFrame
  local MULTILINE_LEFT_ALIGN = -6

  if opts.multiline then
    local frameWidth = width - MULTILINE_LEFT_ALIGN + 1
    local visibleHeight = opts.height or (opts.numLines or 2) * Lodestone.CONFIG.EDIT_BOX_HEIGHT

    inputFrame = CreateFrame('Frame', nil, container, 'BackdropTemplate')
    inputFrame:SetSize(frameWidth, visibleHeight)
    inputFrame:SetBackdrop({
      bgFile = 'Interface\\ChatFrame\\ChatFrameBackground',
      edgeFile = 'Interface\\Tooltips\\UI-Tooltip-Border',
      edgeSize = 16,
      insets = { left = 3, right = 3, top = 3, bottom = 3 },
    })
    inputFrame:SetBackdropColor(0, 0, 0, 0.5)
    inputFrame:SetBackdropBorderColor(1, 1, 1, 0.4)

    local scrollFrame = CreateFrame('ScrollFrame', nil, inputFrame, 'UIPanelScrollFrameTemplate')
    scrollFrame:SetPoint('TOPLEFT', 6, -4)
    scrollFrame:SetPoint('BOTTOMRIGHT', -6, 4)
    scrollFrame.ScrollBar:SetShown(false)
    scrollFrame.ScrollBar:HookScript('OnShow', function(self) self:Hide() end)

    input = CreateFrame('EditBox', nil, scrollFrame)
    input:SetMultiLine(true)
    input:SetFontObject(ChatFontNormal)
    input:SetAutoFocus(false)
    input:SetWidth(frameWidth)
    scrollFrame:SetScrollChild(input)

    input:SetScript('OnCursorChanged', function(self, x, y, w, h)
      ScrollingEdit_OnCursorChanged(self, x, y, w, h)
    end)
    input:SetScript('OnUpdate', function(self, elapsed)
      ScrollingEdit_OnUpdate(self, elapsed, scrollFrame)
    end)
    scrollFrame:EnableMouseWheel(true)
    scrollFrame:SetScript('OnMouseWheel', function(self, delta)
      local current = self:GetVerticalScroll()
      local max = self:GetVerticalScrollRange()
      self:SetVerticalScroll(delta > 0 and math.max(0, current - 20) or math.min(max, current + 20))
    end)
  else
    input = CreateFrame('EditBox', nil, container, 'InputBoxTemplate')
    inputFrame = input
    input:SetAutoFocus(false)
    input:SetWidth(width)
    input:SetHeight(opts.height or 24)
  end

  input:SetMaxLetters(opts.maxLetters or 50)
  input:SetText(opts.defaultText or '')

  if opts.labelPosition == 'left' then
    label:SetPoint('LEFT', container, 'LEFT', 0, 0)
    inputFrame:SetPoint('LEFT', label, 'RIGHT', 0, 0)
    container:SetSize(width + label:GetStringWidth() + 8, inputFrame:GetHeight())
  else
    label:SetPoint('TOPLEFT', container, 'TOPLEFT', 0, 0)
    inputFrame:SetPoint('TOPLEFT', label, 'BOTTOMLEFT', opts.multiline and MULTILINE_LEFT_ALIGN or 0, -4)
    container:SetSize(width, inputFrame:GetHeight() + label:GetStringHeight() + 4)
  end

  if not opts.position then
    container:SetPoint('TOPLEFT', opts.parent, 'TOPLEFT', 0, 0)
  end
  container:SetPoint(
    opts.position.point or 'TOPLEFT',
    opts.position.relativeTo or opts.parent,
    opts.position.relativePoint or opts.position.point or 'TOPLEFT',
    opts.position.x or 0,
    opts.position.y or 0
  )

  container:SetFrameLevel(opts.parent:GetFrameLevel() + 5)

  return container, input, label
end