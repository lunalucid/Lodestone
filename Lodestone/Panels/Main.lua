local _, Lodestone = ...

Lodestone.Main = CreateFrame('Frame', Lodestone.nameStripped .. 'Frame', UIParent, 'ButtonFrameTemplateMinimizable')
local Main = Lodestone.Main
Main:Hide()

do
  local CloseButton = Main.CloseButton or _G[Main:GetName() .. 'CloseButton']
  if CloseButton then
    CloseButton:SetScript('OnClick', function()
      if Lodestone.close then
        Lodestone.Close()
      else
        Main:Hide()
      end
    end)
  end
end

Main:SetTitle(Lodestone.name)
Main:SetPoint('CENTER')
Main:SetWidth(Lodestone.CONFIG.MAX_WIDTH)
Main:SetFrameStrata('HIGH')
Main:SetToplevel(true)
Main:SetMovable(true)
Main:EnableMouse(true)
Main:RegisterForDrag('LeftButton')

Main:SetScript('OnDragStart', function(self)
  self:StartMoving()
end)
Main:SetScript('OnDragStop', function(self)
  self:StopMovingOrSizing()
end)
Main:SetScript('OnMouseDown', function()
  Main:SetFrameLevel(Main:GetFrameLevel() + 1)
end)

Main:SetResizable(true)
Main:SetResizeBounds(Lodestone.CONFIG.MAX_WIDTH, Lodestone.CONFIG.MIN_HEIGHT, Lodestone.CONFIG.MAX_WIDTH, Lodestone.CONFIG.MAX_HEIGHT)

local ResizeButton = CreateFrame('Button', nil, Main)
ResizeButton:SetSize(16, 16)
ResizeButton:SetPoint('BOTTOMRIGHT', -6, 6)
ResizeButton:SetNormalTexture('Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up')
ResizeButton:SetPushedTexture('Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down')
ResizeButton:SetHighlightTexture('Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight')
ResizeButton:SetScript('OnMouseDown', function()
  Main:StartSizing('BOTTOMRIGHT')
end)
ResizeButton:SetScript('OnMouseUp', function()
  Main:StopMovingOrSizing()
end)

do
  local portrait = Lodestone.Main.Portrait
    or _G[Lodestone.Main:GetName() .. 'Portrait']
    or (Lodestone.Main.PortraitContainer and Lodestone.Main.PortraitContainer.Portrait)
    or (_G[Lodestone.Main:GetName() .. 'PortraitContainer'] and _G[Lodestone.Main:GetName() .. 'PortraitContainer'].Portrait)

  if portrait then
    portrait:SetTexture(Lodestone.logo)
  end
end