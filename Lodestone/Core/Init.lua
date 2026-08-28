local LodestoneName
local Lodestone
LodestoneName, Lodestone = ...

Lodestone.devMode = false

Lodestone.name = LodestoneName:gsub('-', ' ')
Lodestone.nameStripped = LodestoneName:gsub(' ', '')
Lodestone.logo = 'Interface\\ICONS\\inv_misc_map02'
Lodestone.version = C_AddOns.GetAddOnMetadata(LodestoneName, 'Version')