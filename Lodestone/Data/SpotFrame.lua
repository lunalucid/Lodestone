local _, Lodestone = ...
Lodestone.SpotFrame = Lodestone.SpotFrame or {}
local SpotFrame = Lodestone.SpotFrame

local QUEST_BACKGROUND_BASE = 'interface/questframe/questbackground'
local ENCOUNTER_JOURNAL_BASE = 'interface/encounterjournal/'
local CREDITS_BACKGROUND_BASE = 'interface/credits/creditsscreenbackground'
local CREDITS_SOURCE_DIM = {width = 512, height = 512}
local CREDITS_TARGET_DIM = {width = 512, height = 512}
local ACHIEVEMENT_PARCHMENT_BASE = 'interface/achievementframe/'
local ACHIEVEMENT_PARCHMENT_SOURCE_DIM = {width = 512, height = 256}
local ACHIEVEMENT_PARCHMENT_TARGET_DIM = {width = 512, height = 256}

local EXPANSION_NAMES = {
  [0] = {displayName = EXPANSION_NAME0, acro = 'wow'}, -- World of Warcraft
  [1] = {displayName = EXPANSION_NAME1, acro = 'bc'}, -- Burning Crusade
  [2] = {displayName = EXPANSION_NAME2, acro ='wotlk'}, -- Wrath of the Lich King
  [3] = {displayName = EXPANSION_NAME3, acro = 'cataclysm'}, -- Cataclysm
  [4] = {displayName = EXPANSION_NAME4, acro = 'mop'}, -- Mists of Pandaria
  [5] = {displayName = EXPANSION_NAME5, acro = 'wod'}, -- Warlords of Draenor
  [6] = {displayName = EXPANSION_NAME6, acro = 'legion'}, -- Legion
  [7] = {displayName = EXPANSION_NAME7, acro = 'bfa'}, -- Battle for Azeroth
  [8] = {displayName = EXPANSION_NAME8, acro = 'shadowlands'}, -- Shadowlands
  [9] = {displayName = EXPANSION_NAME9, acro = 'dragonflight'}, -- Dragonflight
  [10] = {displayName = EXPANSION_NAME10, acro = 'thewarwithin'}, --{acro = 'tww'}, -- The War Within
  ---@diagnostic disable-next-line: undefined-global
  [11] = {displayName = EXPANSION_NAME11, acro = 'midnight'}, -- Midnight
}

local MAP_BG_CONFIG = {
  {bg = 'classic', maps = {}},
  {bg = 'pandaria', maps = {422, 418, 379, 390, 392, 371, 433, 554, 388, 376}},
  {bg = 'wowlegion', maps = {885, 882, 830, 831, 630, 627, 628, 790, 649, 650, 634, 680, 684, 685, 646, 652, 641, 747, 715}},
  {bg = 'exilesreach', maps = {1409}},
  {bg = 'shadowlands', maps = {1550, 1961}},
  {bg = 'shadowlandscovenants', maps = {1543, 1549}},
  {bg = 'shadowlandsoribos', maps = {1670, 1671}},
  {bg = 'shadowlandsbastion', maps = {1533, 1701}},
  {bg = 'shadowlandsardenweald', maps = {1565, 1707}},
  {bg = 'shadowlandsmaldraxxus', maps = {1536, 1703}},
  {bg = 'shadowlandsrevendreth', maps = {1525, 1702}},
  {bg = 'shadowlandssecretsofthefirstones', maps = {1970}},
  {bg = 'dragonflightdragonflight', maps = {2112, 2022, 2023, 2024, 2025, 2134, 2135}},
  {bg = 'dragonflightwalkingshore', maps = {2022, 2080, 2081, 2094, 2095, 2127}},
  {bg = 'dragonflightohnplains', maps = {2023, 2239, 2093, 2129, 2149}},
  {bg = 'dragonflightazurespan', maps = {2024, 2073, 2074, 2075, 2076, 2077, 2096, 2128, 2132}},
  {bg = 'dragonflightthaldraszus', maps = {2025, 2112, 2130, 2082, 2081, 2097, 2098, 2099, 2119, 2120, 2121, 2122, 2123, 2124, 2125, 2126}},
  {bg = 'dragonflightzaralekcavern', maps = {2133, 2175}},
  {bg = 'dragonflightemeralddream', maps = {2200}},
  {bg = 'dragonflight1027', maps = {2151, 1970, 2118, 2100, 2101, 2131, 2154}},
  {bg = 'thewarwithincandle', maps = {2339, 2215}},
  {bg = 'thewarwithinfist', maps = {2248}},
  {bg = 'thewarwithinflame', maps = {2214, 2472}},
  {bg = 'thewarwithinweb', maps = {2255, 2213, 2328, 2216}},
  {bg = 'thewarwithinstorm', maps = {2369}},
  {bg = 'thewarwithinrocket', maps = {2346}},
  {bg = 'thewarwithinplanet', maps = {2371}},
  {bg = 'midnightsky', maps = {2537, 2413, 2576, 2437, 2536, 2541, 2405, 2444}},
  {bg = 'midnightlight', maps = {2393, 2424, 2395}},
  {bg = 'midnightlegacyoftheamani', maps = {}},
}

local PARCHMENT_BG_CONFIG = {
  {label = 'Parchment 1', bg = '', atlas = 'questbg-parchment-accessibility'},
  {label = 'Parchment 2', bg = string.format('%sparchment', QUEST_BACKGROUND_BASE), atlas = 'questbg-parchment-accessibility2'},
  {label = 'Parchment 3', bg = string.format('%sparchment', QUEST_BACKGROUND_BASE), atlas = 'questbg-parchment-accessibility3'},
  {label = 'Parchment 4', bg = string.format('%sparchment', QUEST_BACKGROUND_BASE), atlas = 'questbg-parchment-accessibility4'},
  {label = 'Achievement 1', bg = string.format('%s%s', ACHIEVEMENT_PARCHMENT_BASE, 'ui-achievement-parchment-horizontal'), source = ACHIEVEMENT_PARCHMENT_SOURCE_DIM, target = ACHIEVEMENT_PARCHMENT_TARGET_DIM},
  {label = 'Achievement 2', bg = string.format('%s%s', ACHIEVEMENT_PARCHMENT_BASE, 'ui-achievement-parchment-horizontal-desaturated'), source = ACHIEVEMENT_PARCHMENT_SOURCE_DIM, target = ACHIEVEMENT_PARCHMENT_TARGET_DIM},
  {label = 'Guild Achievement 1', bg = string.format('%s%s', ACHIEVEMENT_PARCHMENT_BASE, 'ui-guildachievement-parchment-horizontal'), source = ACHIEVEMENT_PARCHMENT_SOURCE_DIM, target = ACHIEVEMENT_PARCHMENT_TARGET_DIM},
  {label = 'Guild Achievement 2', bg = string.format('%s%s', ACHIEVEMENT_PARCHMENT_BASE, 'ui-guildachievement-parchment-horizontal-desaturated'), source = ACHIEVEMENT_PARCHMENT_SOURCE_DIM, target = ACHIEVEMENT_PARCHMENT_TARGET_DIM},
}

local FRAME_TEXTURES_CONFIG = {
  {label = 'Kyrian Background', bg = 'interface/framegeneral/uiframekyrianbackground', atlas = 'Kyrian-NineSlice-Center', target = {width = 256, height = 256}, source = {width = 256, height = 256}},
  {label = 'Night Fae Background', bg = 'interface/framegeneral/uiframenightfaebackground', atlas = 'NightFae-NineSlice-Center', target = {width = 256, height = 256}, source = {width = 256, height = 256}},
  {label = 'Venthyr Background', bg = 'interface/framegeneral/uiframeventhyrbackground', atlas = 'Venthyr-NineSlice-Center', target = {width = 256, height = 256}, source = {width = 256, height = 256}},
  {label = 'Necrolord Background', bg = 'interface/framegeneral/uiframenecrolordbackground', atlas = 'Necrolord-NineSlice-Center', target = {width = 256, height = 256}, source = {width = 256, height = 256}},
  {label = 'Marine Background', bg = 'interface/framegeneral/uiframemarinebackground', atlas = 'UI-Frame-Marine-BackgroundTile', target = {width = 256, height = 256}, source = {width = 256, height = 256}},
  
}
local DECORATIVE_TEXTURES = {
  {label = 'Stormwind Sidewalk', bg = 660420, source = { width = 512, height = 512 }, target = { width = 512, height = 512 }},
  {label = 'Sunken Temple 1', bg = 128917, source = { width = 256, height = 256 }, target = { width = 256, height = 256 }},
  {label = 'Sunken Temple 2', bg = 130031, source = { width = 256, height = 256 }, target = { width = 256, height = 256 }},
  {label = 'Blood Elf Red Bronze', bg = 128683, source = { width = 256, height = 256 }, target = { width = 256, height = 256 }},
  {label = 'Dalaran Fountain Floor', bg = 243059, source = { width = 256, height = 256 }, target = { width = 256, height = 256 }},
  {label = 'Dalaran Prison Door', bg = 243115, source = { width = 256, height = 256 }, target = { width = 256, height = 256 }},
  {label = 'Dalaran Sewer Water', bg = 243287, source = { width = 512, height = 256 }, target = { width = 512, height = 256 }},
  {label = 'Dalaran Stained Window', bg = 1272731, source = { width = 1024, height = 1024 }, target = { width = 1024, height = 1024 }},
  {label = 'Dalaran Gold', bg = 1280530, source = { width = 256, height = 128 }, target = { width = 256, height = 128 }},
  {label = 'Dalaran Arcane Swirls', bg = 1310405, source = { width = 512, height = 512 }, target = { width = 512, height = 512 }},
  {label = 'Envelopes', bg = 1332280, source = { width = 512, height = 512 }, target = { width = 512, height = 512 }},
  {label = 'Chamber Pattern', bg = 1334035, source = { width = 512, height = 512 }, target = { width = 512, height = 512 }},
  {label = 'Trim', bg = 1487260, source = { width = 256, height = 256 }, target = { width = 256, height = 256 }},
}

local QUEST_BG_CONFIG = {
  {label = 'Pandaria', bg = 'pandaria', atlas = ''},
  {label = 'Legion', bg = 'wowlegion'},
  {label = 'Exiles Reach', bg = 'exilesreach'},
  {label = 'Shadowlands', bg = 'shadowlands'},
  ['shadowlands'] = {
    {label = 'Covenants', bg = 'covenants'},
    {label = 'Oribos', bg = 'oribos'},
    {label = 'Bastion', bg = 'bastion'},
    {label = 'Ardenweald', bg = 'ardenweald'},
    {label = 'Maldraxxus', bg = 'maldraxxus'},
    {label = 'Revendreth', bg = 'revendreth'},
    {label = 'Secrets', bg = 'secretsofthefirstones'}
  },
  ['dragonflight'] = {
    {label = 'Dragonflight', bg = 'dragonflight'},
    {label = 'Walking Shore', bg = 'walkingshore'},
    {label = 'Ohn Plains', bg = 'ohnplains'},
    {label = 'Azure Span', bg = 'azurespan'},
    {label = 'Thaldraszuz', bg = 'thaldraszus'},
    {label = 'Zaralek Cavern', bg = 'zaralekcavern'},
    {label = 'Emerald Dream', bg = 'emeralddream'},
    {label = 'Dragonflight 1027', bg = '1027'},
  },
  ['thewarwithin'] = {
    {label = 'TWW Candle', bg = 'candle'},
    {label = 'TWW Fist', bg = 'fist'},
    {label = 'TWW Flame', bg = 'flame'},
    {label = 'TWW Web', bg = 'web'},
    {label = 'TWW Storm', bg = 'storm'},
    {label = 'TWW Rocket', bg = 'rocket'},
    {label = 'TWW Planet', bg = 'planet'},
  },
  ['midnight'] = {
    {label = 'Midnight Sky', bg = 'sky'},
    {label = 'Midnight Light', bg = 'light'},
    {label = 'Legacy of the Amani', bg = 'legacyoftheamani'},
  },
  {label = 'Alliance', bg = 'hordealliance', atlas = 'QuestBG-Alliance'},
  {label = 'Legion Fall', bg = 'hordealliance', atlas = 'QuestBG-Legionfall'},
  {label = 'The Hand of Fate', bg = 'hordealliance', atlas = 'QuestBG-TheHandofFate'},
  {label = 'Horde', bg = 'hordealliance', atlas = 'QuestBG-Horde'},
}

local EJ_BG_CONFIG = {
  {
    file = 'dungeonjournaltierbackgrounds1',
    source = {width = 1024, height = 1024},
    target = {with = 786, height = 425},
    atlases = {
      {label = 'Classic', atlas = 'UI-EJ-Classic'},
      {label = 'Burning Crusade', atlas = 'UI-EJ-BurningCrusade'}
    }
  },
  {
    file = 'dungeonjournaltierbackgrounds2',
    source = {width = 1024, height = 1024},
    target = {with = 786, height = 425},
    atlases = {
      {label = 'Wrath of the Lich King', atlas = 'UI-EJ-WrathoftheLichKing'},
      {label = 'Cataclysm', atlas = 'UI-EJ-Cataclysm'}
    }
  },
  {
    file = 'dungeonjournaltierbackgrounds3',
    source = {width = 1024, height = 1024},
    target = {with = 786, height = 425},
    atlases = {
      {label = 'Mists of Pandaria', atlas = 'UI-EJ-MistsofPandaria'},
      {label = 'Warlords of Draenor', atlas = 'UI-EJ-WarlordsofDraenor'}
    }
  },
  {
    file = 'dungeonjournaltierbackgrounds4',
    source = {width = 2048, height = 1024},
    target = {with = 786, height = 425},
    atlases = {
      {label = 'Legion', atlas = 'ui-ej-legion'},
      {label = 'Battle for Azeroth', atlas = 'ui-ej-battleforazeroth'},
      {label = 'Shadowlands', atlas = 'ui-ej-shadowlands'},
      {label = 'Dragonflight', atlas = 'ui-ej-dragonflight'}
    }
  },
  {
    file = 'dungeonjournaltierbackgrounds5',
    source = {width = 1024, height = 1024},
    target = {with = 786, height = 425},
    atlases = {
      {label = 'The War Within', atlas = 'ui-ej-thewarwithin'},
      {label = 'Midnight', atlas = 'ui-ej-midnight'}
    }
  },
}

local STARS_CONFG = {
 {label = 'Night', bg = 3065821, source = {width = 512, height = 512}, target = {width = 512, height = 512}},
 {label = 'Karazahn Theater', bg = 190053, source = {width = 256, height = 256}, target = {width = 256, height = 256}},
 {label = 'Netherwing', bg = 7317292, source = {width = 512, height = 512}, target = {width = 512, height = 512}},
 {label = 'Suramar', bg = 1408320, source = {width = 512, height = 512}, target = {width = 512, height = 512}},
 {label = 'Shadowmoon', bg = 896927, source = {width = 1024, height = 1024}, target = {width = 512, height = 512}},
 {label = 'Oribos', bg = 3594124, source = {width = 512, height = 512}, target = {width = 512, height = 512}},
 {label = 'Dark Portal', bg = 192923, source = {width = 256, height = 256}, target = {width = 256, height = 256}}
}

SpotFrame.MAP_BACKGROUNDS = {}

for _, entry in ipairs(MAP_BG_CONFIG) do
  for _, mapID in ipairs(entry.maps) do
    SpotFrame.MAP_BACKGROUNDS[mapID] = QUEST_BACKGROUND_BASE .. entry.bg
  end
end

SpotFrame.BACKGROUND_TEXTURES = {}

local function generateBackgroundTextures()
  local categories = {'Basic', 'Frame Textures', 'Decorative', 'Stars', 'Professions', 'Quests', 'Encounters'}
  local expansionLevels = _G.NUM_LE_EXPANSION_LEVELS

  -- Categories
  for _, category in ipairs(categories) do
    SpotFrame.BACKGROUND_TEXTURES[category] = {}
  end

  SpotFrame.BACKGROUND_TEXTURES['Basic'] = PARCHMENT_BG_CONFIG
  SpotFrame.BACKGROUND_TEXTURES['Frame Textures'] = FRAME_TEXTURES_CONFIG
  SpotFrame.BACKGROUND_TEXTURES['Decorative'] = DECORATIVE_TEXTURES
  SpotFrame.BACKGROUND_TEXTURES['Stars'] = STARS_CONFG

  Lodestone.Util.consolidateTables(QUEST_BG_CONFIG, SpotFrame.BACKGROUND_TEXTURES['Quests'], {label = '', bg = QUEST_BACKGROUND_BASE .. '%s', atlas = ''})

  -- Professions
  local professionIds = Lodestone.GAME_DATA['Profession']
  local professions = {}
  if professionIds then
    for _, professionId in pairs(professionIds) do
      local profession = C_TradeSkillUI.GetTradeSkillDisplayName(professionId)
      table.insert(professions, profession)
    end
  end

  Lodestone.Util.consolidateTables(professions, SpotFrame.BACKGROUND_TEXTURES['Professions'], {
    label = '%s Quest',
    bg = QUEST_BACKGROUND_BASE .. 'profession' .. '%s',
    atlas = 'questbg-%s',
    source = {width = 512, height = 512},
    target = {width = 299, height = 407}
  })

  Lodestone.Util.consolidateTables(professions, SpotFrame.BACKGROUND_TEXTURES['Professions'], {
    label = '%s Art',
    bg = 'interface/professions/professionbackgroundart%s',
    atlas = 'professions-recipe-background-%s',
    source = {width = 1024, height = 1024},
    target = {width = 1024, height = 1024}
  })

  -- Encounters
  for _, ejBgEntry in ipairs(EJ_BG_CONFIG) do
    for _, at in ipairs(ejBgEntry.atlases or {}) do
      local encounterTexture = {
        label = at.label,
        bg = string.format('%s%s', ENCOUNTER_JOURNAL_BASE, ejBgEntry.file),
        atlas = at.atlas,
        source = ejBgEntry.source,
        target = ejBgEntry.target
      }
      table.insert(SpotFrame.BACKGROUND_TEXTURES['Encounters'], encounterTexture)
    end
  end

  -- Expansion related textures
  local expansions = {}
  for level = 0, expansionLevels do
    local info = GetExpansionDisplayInfo(level, 1)
    local textureKit = info and info.textureKit
    local displayName = EXPANSION_NAMES[level].displayName
    expansions[level] = {displayName = displayName, textureKit = textureKit}
  end

  for level, data in pairs(expansions) do
    local fileSuffix = EXPANSION_NAMES[level] and EXPANSION_NAMES[level].acro
    local creditsBg = {
      label = string.format('%s Credits BG', data.displayName),
      bg = string.format('%s%s%s', CREDITS_BACKGROUND_BASE, level, fileSuffix),
      atlas = string.format('creditsscreen-background-%s', level),
      source = CREDITS_SOURCE_DIM,
      target = CREDITS_TARGET_DIM
    }
    table.insert(SpotFrame.BACKGROUND_TEXTURES['Basic'], creditsBg)
  end

end

generateBackgroundTextures()

SpotFrame.BACKGROUND_TEXTURE_LOOKUP = {}

for k, v in pairs(SpotFrame.BACKGROUND_TEXTURES) do
  for _, texture in ipairs(v) do
    if texture.bg then
      SpotFrame.BACKGROUND_TEXTURE_LOOKUP[texture.bg] = texture
    end
  end
end