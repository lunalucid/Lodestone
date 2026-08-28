local _, Lodestone = ...

Lodestone.Content = CreateFrame('Frame', nil, Lodestone.Main)
local contentClip = Lodestone.Content

contentClip:SetPoint('TOPLEFT', Lodestone.Main, 'TOPLEFT', Lodestone.CONFIG.PADDING, -(Lodestone.CONFIG.PADDING + Lodestone.CONFIG.TOP_BAR_HEIGHT + Lodestone.CONFIG.HEADER_HEIGHT))
contentClip:SetPoint('BOTTOMRIGHT', Lodestone.Main, 'BOTTOMRIGHT', (-Lodestone.CONFIG.PADDING - 1), (Lodestone.CONFIG.PADDING + Lodestone.CONFIG.BOTTOM_BAR_HEIGHT))
contentClip:SetClipsChildren(true)
contentClip:SetFrameLevel(Lodestone.Main:GetFrameLevel() + 5)

local contentBg = contentClip:CreateTexture(nil, 'BACKGROUND')

contentBg:SetAtlas('questbg-parchment', true)
contentBg:SetAllPoints()
contentBg:SetAlpha(0.75)
Lodestone.ContentBg = contentBg