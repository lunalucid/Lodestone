local _, Lodestone = ...
Lodestone.DynamicSky = Lodestone.DynamicSky or {}
local DynamicSky = Lodestone.DynamicSky

--[[
  Consolidated data from UiMap, UiMapAssignment, ZoneLight, Light, Light Params, LightSkybox data tables
]]

DynamicSky.MAP_DATA = {
  [1] = {
    [1] = { ------------------ Durotar
      lightParamId = 5985,
      skyboxFileDataID = nil,
      normalizedName = 'durotar',
    },
    [2] = { ------------------ Burning Blade Coven
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'burningbladecoven',
    },
    [3] = { ------------------ Tiragarde Keep
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'tiragardekeep',
    },
    [4] = { ------------------ Tiragarde Keep
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'tiragardekeep',
    },
    [5] = { ------------------ Skull Rock
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'skullrock',
    },
    [6] = { ------------------ Dustwind Cave
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'dustwindcave',
    },
    [7] = { ------------------ Mulgore
      lightParamId = 5967,
      skyboxFileDataID = nil,
      normalizedName = 'mulgore',
    },
    [8] = { ------------------ Palemane Rock
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'palemanerock',
    },
    [9] = { ------------------ The Venture Co. Mine
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theventurecomine',
    },
    [10] = { ----------------- Northern Barrens
      lightParamId = 5944,
      skyboxFileDataID = nil,
      normalizedName = 'northernbarrens',
    },
    [11] = { ----------------- Wailing Caverns
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'wailingcaverns',
    },
    [12] = { ----------------- Kalimdor
      lightParamId = nil,
      skyboxFileDataID = 395900, -- Retrieval method: fuzzy name match -> worldkalimdorhyjalsmokehyjalsmokeclouds | world\kalimdor\hyjal\passivedoodads\smoke\hyjal_smokeclouds.mdx
      normalizedName = 'kalimdor',
    },
    [57] = { ----------------- Teldrassil
      lightParamId = 6023,
      skyboxFileDataID = nil,
      normalizedName = 'teldrassil',
    },
    [58] = { ----------------- Shadowthread Cave
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'shadowthreadcave',
    },
    [59] = { ----------------- Fel Rock
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'felrock',
    },
    [60] = { ----------------- Ban'ethil Barrow Den
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'banethilbarrowden',
    },
    [61] = { ----------------- Ban'ethil Barrow Den
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'banethilbarrowden',
    },
    [62] = { ----------------- Darkshore
      lightParamId = 5948,
      skyboxFileDataID = nil,
      normalizedName = 'darkshore',
    },
    [63] = { ----------------- Ashenvale
      lightParamId = 5951,
      skyboxFileDataID = nil,
      normalizedName = 'ashenvale',
    },
    [64] = { ----------------- Thousand Needles
      lightParamId = 5999,
      skyboxFileDataID = nil,
      normalizedName = 'thousandneedles',
    },
    [65] = { ----------------- Stonetalon Mountains
      lightParamId = 5970,
      skyboxFileDataID = nil,
      normalizedName = 'stonetalonmountains',
    },
    [66] = { ----------------- Desolace
      lightParamId = 5982,
      skyboxFileDataID = nil,
      normalizedName = 'desolace',
    },
    [67] = { ----------------- Maraudon
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'maraudon',
    },
    [68] = { ----------------- Maraudon
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'maraudon',
    },
    [69] = { ----------------- Feralas
      lightParamId = 5991,
      skyboxFileDataID = nil,
      normalizedName = 'feralas',
    },
    [70] = { ----------------- Dustwallow Marsh
      lightParamId = 5973,
      skyboxFileDataID = nil,
      normalizedName = 'dustwallowmarsh',
      alias = 'duskwallow',
    },
    [71] = { ----------------- Tanaris
      lightParamId = 6015,
      skyboxFileDataID = nil,
      normalizedName = 'tanaris',
    },
    [72] = { ----------------- The Noxious Lair
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thenoxiouslair',
    },
    [73] = { ----------------- The Gaping Chasm
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thegapingchasm',
    },
    [74] = { ----------------- Caverns of Time
      lightParamId = nil,
      skyboxFileDataID = 130482, -- Retrieval method: fuzzy name match -> cavernsoftimesky | environments\stars\cavernsoftimesky.mdx
      normalizedName = 'cavernsoftime',
    },
    [75] = { ----------------- Caverns of Time
      lightParamId = nil,
      skyboxFileDataID = 130482, -- Retrieval method: fuzzy name match -> cavernsoftimesky | environments\stars\cavernsoftimesky.mdx
      normalizedName = 'cavernsoftime',
    },
    [76] = { ----------------- Azshara
      lightParamId = 5952,
      skyboxFileDataID = nil,
      normalizedName = 'azshara',
    },
    [77] = { ----------------- Felwood
      lightParamId = 5950,
      skyboxFileDataID = nil,
      normalizedName = 'felwood',
    },
    [78] = { ----------------- Un'Goro Crater
      lightParamId = 6009,
      skyboxFileDataID = nil,
      normalizedName = 'ungorocrater',
    },
    [79] = { ----------------- The Slithering Scar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theslitheringscar',
    },
    [80] = { ----------------- Moonglade
      lightParamId = 5946,
      skyboxFileDataID = nil,
      normalizedName = 'moonglade',
    },
    [81] = { ----------------- Silithus
      lightParamId = 6017,
      skyboxFileDataID = nil,
      normalizedName = 'silithus',
    },
    [82] = { ----------------- Twilight's Run
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'twilightsrun',
    },
    [83] = { ----------------- Winterspring
      lightParamId = 5945,
      skyboxFileDataID = nil,
      normalizedName = 'winterspring',
    },
    [85] = { ----------------- Orgrimmar
      lightParamId = 6033,
      skyboxFileDataID = nil,
      normalizedName = 'orgrimmar',
      alias = 'durotarorg',
    },
    [86] = { ----------------- Orgrimmar
      lightParamId = 6033,
      skyboxFileDataID = nil,
      normalizedName = 'orgrimmar',
      alias = 'durotarorg',
    },
    [88] = { ----------------- Thunder Bluff
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thunderbluff',
    },
    [89] = { ----------------- Darnassus
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'darnassus',
    },
    [198] = { ---------------- Mount Hyjal
      lightParamId = 899,
      skyboxFileDataID = 1613006, -- Retrieval method: skyboxId (128) -> hyjallayerm | Environments\Stars\Hyjal_SkyBox_Layer01.m2
      normalizedName = 'mounthyjal',
    },
    [199] = { ---------------- Southern Barrens
      lightParamId = 5944,
      skyboxFileDataID = nil,
      normalizedName = 'southernbarrens',
    },
    [249] = { ---------------- Uldum
      lightParamId = 893,
      skyboxFileDataID = 375466, -- Retrieval method: skyboxId (150) -> uldumsky | environments\stars\uldum_sky01.mdx
      normalizedName = 'uldum',
    },
    [327] = { ---------------- Ahn'Qiraj: The Fallen Kingdom
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ahnqirajthefallenkingdom',
    },
    [460] = { ---------------- Shadowglen
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'shadowglen',
    },
    [461] = { ---------------- Valley of Trials
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'valleyoftrials',
    },
    [462] = { ---------------- Camp Narache
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'campnarache',
    },
    [463] = { ---------------- Echo Isles
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'echoisles',
    },
    [464] = { ---------------- Spitescale Cavern
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'spitescalecavern',
    },
    [947] = { ---------------- Azeroth
      lightParamId = nil,
      skyboxFileDataID = 527828, -- Retrieval method: fuzzy name match -> fallofazeroth | environments\stars\fallofazeroth01.mdx
      normalizedName = 'azeroth',
    },
    [986] = { ---------------- Kalimdor
      lightParamId = nil,
      skyboxFileDataID = 395900, -- Retrieval method: fuzzy name match -> worldkalimdorhyjalsmokehyjalsmokeclouds | world\kalimdor\hyjal\passivedoodads\smoke\hyjal_smokeclouds.mdx
      normalizedName = 'kalimdor',
    },
    [1209] = { --------------- Kalimdor
      lightParamId = nil,
      skyboxFileDataID = 395900, -- Retrieval method: fuzzy name match -> worldkalimdorhyjalsmokehyjalsmokeclouds | world\kalimdor\hyjal\passivedoodads\smoke\hyjal_smokeclouds.mdx
      normalizedName = 'kalimdor',
    },
    [1305] = { --------------- Durotar
      lightParamId = 5985,
      skyboxFileDataID = nil,
      normalizedName = 'durotar',
    },
    [1306] = { --------------- Mulgore
      lightParamId = 5967,
      skyboxFileDataID = nil,
      normalizedName = 'mulgore',
    },
    [1307] = { --------------- Northern Barrens
      lightParamId = 5944,
      skyboxFileDataID = nil,
      normalizedName = 'northernbarrens',
    },
    [1308] = { --------------- Teldrassil
      lightParamId = 6023,
      skyboxFileDataID = nil,
      normalizedName = 'teldrassil',
    },
    [1309] = { --------------- Darkshore
      lightParamId = 5948,
      skyboxFileDataID = nil,
      normalizedName = 'darkshore',
    },
    [1310] = { --------------- Ashenvale
      lightParamId = 5951,
      skyboxFileDataID = nil,
      normalizedName = 'ashenvale',
    },
    [1311] = { --------------- Thousand Needles
      lightParamId = 5999,
      skyboxFileDataID = nil,
      normalizedName = 'thousandneedles',
    },
    [1312] = { --------------- Stonetalon Mountains
      lightParamId = 5970,
      skyboxFileDataID = nil,
      normalizedName = 'stonetalonmountains',
    },
    [1313] = { --------------- Desolace
      lightParamId = 5982,
      skyboxFileDataID = nil,
      normalizedName = 'desolace',
    },
    [1314] = { --------------- Feralas
      lightParamId = 5991,
      skyboxFileDataID = nil,
      normalizedName = 'feralas',
    },
    [1315] = { --------------- Dustwallow Marsh
      lightParamId = 5973,
      skyboxFileDataID = nil,
      normalizedName = 'dustwallowmarsh',
      alias = 'duskwallow',
    },
    [1316] = { --------------- Tanaris
      lightParamId = 6015,
      skyboxFileDataID = nil,
      normalizedName = 'tanaris',
    },
    [1317] = { --------------- Azshara
      lightParamId = 5952,
      skyboxFileDataID = nil,
      normalizedName = 'azshara',
    },
    [1318] = { --------------- Felwood
      lightParamId = 5950,
      skyboxFileDataID = nil,
      normalizedName = 'felwood',
    },
    [1319] = { --------------- Un'Goro Crater
      lightParamId = 6009,
      skyboxFileDataID = nil,
      normalizedName = 'ungorocrater',
    },
    [1320] = { --------------- Moonglade
      lightParamId = 5946,
      skyboxFileDataID = nil,
      normalizedName = 'moonglade',
    },
    [1321] = { --------------- Silithus
      lightParamId = 6017,
      skyboxFileDataID = nil,
      normalizedName = 'silithus',
    },
    [1322] = { --------------- Winterspring
      lightParamId = 5945,
      skyboxFileDataID = nil,
      normalizedName = 'winterspring',
    },
    [1323] = { --------------- Thunder Bluff
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thunderbluff',
    },
    [1324] = { --------------- Darnassus
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'darnassus',
    },
    [1328] = { --------------- Mount Hyjal
      lightParamId = 899,
      skyboxFileDataID = 1613006, -- Retrieval method: skyboxId (128) -> hyjallayerm | Environments\Stars\Hyjal_SkyBox_Layer01.m2
      normalizedName = 'mounthyjal',
    },
    [1329] = { --------------- Southern Barrens
      lightParamId = 5944,
      skyboxFileDataID = nil,
      normalizedName = 'southernbarrens',
    },
    [1330] = { --------------- Uldum
      lightParamId = 893,
      skyboxFileDataID = 375466, -- Retrieval method: skyboxId (150) -> uldumsky | environments\stars\uldum_sky01.mdx
      normalizedName = 'uldum',
    },
    [1527] = { --------------- Uldum
      lightParamId = 893,
      skyboxFileDataID = 375466, -- Retrieval method: skyboxId (150) -> uldumsky | environments\stars\uldum_sky01.mdx
      normalizedName = 'uldum',
    },
    [1534] = { --------------- Orgrimmar
      lightParamId = 6033,
      skyboxFileDataID = nil,
      normalizedName = 'orgrimmar',
      alias = 'durotarorg',
    },
    [1535] = { --------------- Durotar
      lightParamId = 5985,
      skyboxFileDataID = nil,
      normalizedName = 'durotar',
    },
  },
  [0] = {
    [13] = { ----------------- Eastern Kingdoms
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'easternkingdoms',
    },
    [14] = { ----------------- Arathi Highlands
      lightParamId = 30,
      skyboxFileDataID = nil,
      normalizedName = 'arathihighlands',
    },
    [15] = { ----------------- Badlands
      lightParamId = 28,
      skyboxFileDataID = nil,
      normalizedName = 'badlands',
    },
    [16] = { ----------------- Uldaman
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'uldaman',
    },
    [17] = { ----------------- Blasted Lands
      lightParamId = 21,
      skyboxFileDataID = nil,
      normalizedName = 'blastedlands',
    },
    [18] = { ----------------- Tirisfal Glades
      lightParamId = 6060,
      skyboxFileDataID = nil,
      normalizedName = 'tirisfalglades',
    },
    [19] = { ----------------- Scarlet Monastery Entrance
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'scarletmonasteryentrance',
    },
    [20] = { ----------------- Keeper's Rest
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'keepersrest',
    },
    [21] = { ----------------- Silverpine Forest
      lightParamId = 6064,
      skyboxFileDataID = nil,
      normalizedName = 'silverpineforest',
    },
    [22] = { ----------------- Western Plaguelands
      lightParamId = 6068,
      skyboxFileDataID = nil,
      normalizedName = 'westernplaguelands',
    },
    [23] = { ----------------- Eastern Plaguelands
      lightParamId = 6068,
      skyboxFileDataID = nil,
      normalizedName = 'easternplaguelands',
    },
    [24] = { ----------------- Light's Hope Chapel
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'lightshopechapel',
    },
    [25] = { ----------------- Hillsbrad Foothills
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'hillsbradfoothills',
    },
    [26] = { ----------------- The Hinterlands
      lightParamId = 6054,
      skyboxFileDataID = nil,
      normalizedName = 'thehinterlands',
    },
    [27] = { ----------------- Dun Morogh
      lightParamId = 5974,
      skyboxFileDataID = nil,
      normalizedName = 'dunmorogh',
    },
    [28] = { ----------------- Coldridge Pass
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'coldridgepass',
    },
    [29] = { ----------------- The Grizzled Den
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thegrizzledden',
    },
    [30] = { ----------------- New Tinkertown
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'newtinkertown',
    },
    [31] = { ----------------- Gol'Bolar Quarry
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'golbolarquarry',
    },
    [32] = { ----------------- Searing Gorge
      lightParamId = 77,
      skyboxFileDataID = nil,
      normalizedName = 'searinggorge',
    },
    [33] = { ----------------- Blackrock Mountain
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackrockmountain',
    },
    [34] = { ----------------- Blackrock Mountain
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackrockmountain',
    },
    [35] = { ----------------- Blackrock Mountain
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackrockmountain',
    },
    [36] = { ----------------- Burning Steppes
      lightParamId = 23,
      skyboxFileDataID = nil,
      normalizedName = 'burningsteppes',
    },
    [37] = { ----------------- Elwynn Forest
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'elwynnforest',
    },
    [38] = { ----------------- Fargodeep Mine
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'fargodeepmine',
    },
    [39] = { ----------------- Fargodeep Mine
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'fargodeepmine',
    },
    [40] = { ----------------- Jasperlode Mine
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'jasperlodemine',
    },
    [41] = { ----------------- Dalaran
      lightParamId = nil,
      skyboxFileDataID = 235302, -- Retrieval method: fuzzy name match -> dalaran | ENVIRONMENTS\Stars\DalaranSkyBox.mdx
      normalizedName = 'dalaran',
    },
    [42] = { ----------------- Deadwind Pass
      lightParamId = 19,
      skyboxFileDataID = nil,
      normalizedName = 'deadwindpass',
    },
    [43] = { ----------------- The Master's Cellar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'themasterscellar',
    },
    [44] = { ----------------- The Master's Cellar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'themasterscellar',
    },
    [45] = { ----------------- The Master's Cellar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'themasterscellar',
    },
    [46] = { ----------------- Karazhan Catacombs
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'karazhancatacombs',
    },
    [47] = { ----------------- Duskwood
      lightParamId = 14,
      skyboxFileDataID = nil,
      normalizedName = 'duskwood',
    },
    [48] = { ----------------- Loch Modan
      lightParamId = 38,
      skyboxFileDataID = nil,
      normalizedName = 'lochmodan',
    },
    [49] = { ----------------- Redridge Mountains
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'redridgemountains',
    },
    [50] = { ----------------- Northern Stranglethorn
      lightParamId = 26,
      skyboxFileDataID = nil,
      normalizedName = 'northernstranglethorn',
    },
    [51] = { ----------------- Swamp of Sorrows
      lightParamId = 16,
      skyboxFileDataID = nil,
      normalizedName = 'swampofsorrows',
    },
    [52] = { ----------------- Westfall
      lightParamId = 17,
      skyboxFileDataID = nil,
      normalizedName = 'westfall',
    },
    [53] = { ----------------- Gold Coast Quarry
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'goldcoastquarry',
    },
    [54] = { ----------------- Jangolode Mine
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'jangolodemine',
    },
    [55] = { ----------------- The Deadmines
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thedeadmines',
    },
    [56] = { ----------------- Wetlands
      lightParamId = 29,
      skyboxFileDataID = nil,
      normalizedName = 'wetlands',
    },
    [84] = { ----------------- Stormwind City
      lightParamId = 6080,
      skyboxFileDataID = nil,
      normalizedName = 'stormwindcity',
    },
    [87] = { ----------------- Ironforge
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ironforge',
    },
    [90] = { ----------------- Undercity
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'undercity',
    },
    [201] = { ---------------- Kelp'thar Forest
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'kelptharforest',
    },
    [203] = { ---------------- Vashj'ir
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'vashjir',
    },
    [204] = { ---------------- Abyssal Depths
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'abyssaldepths',
    },
    [205] = { ---------------- Shimmering Expanse
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'shimmeringexpanse',
    },
    [210] = { ---------------- The Cape of Stranglethorn
      lightParamId = 26,
      skyboxFileDataID = nil,
      normalizedName = 'thecapeofstranglethorn',
    },
    [217] = { ---------------- Ruins of Gilneas
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ruinsofgilneas',
    },
    [218] = { ---------------- Ruins of Gilneas City
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ruinsofgilneascity',
    },
    [224] = { ---------------- Stranglethorn Vale
      lightParamId = 26,
      skyboxFileDataID = nil,
      normalizedName = 'stranglethornvale',
    },
    [241] = { ---------------- Twilight Highlands
      lightParamId = 903,
      skyboxFileDataID = 451101, -- Retrieval method: skyboxId (165) -> twilighthighlandssky | environments\stars\twilighthighlandssky2.mdx
      normalizedName = 'twilighthighlands',
    },
    [425] = { ---------------- Northshire
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'northshire',
    },
    [426] = { ---------------- Echo Ridge Mine
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'echoridgemine',
    },
    [427] = { ---------------- Coldridge Valley
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'coldridgevalley',
    },
    [428] = { ---------------- Frostmane Hovel
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'frostmanehovel',
    },
    [465] = { ---------------- Deathknell
      lightParamId = nil,
      skyboxFileDataID = 235313, -- Retrieval method: fuzzy name match -> death | ENVIRONMENTS\Stars\DeathSkybox.mdx
      normalizedName = 'deathknell',
    },
    [466] = { ---------------- Night Web's Hollow
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'nightwebshollow',
    },
    [469] = { ---------------- New Tinkertown
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'newtinkertown',
    },
    [470] = { ---------------- Frostmane Hold
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'frostmanehold',
    },
    [947] = { ---------------- Azeroth
      lightParamId = nil,
      skyboxFileDataID = 527828, -- Retrieval method: fuzzy name match -> fallofazeroth | environments\stars\fallofazeroth01.mdx
      normalizedName = 'azeroth',
    },
    [985] = { ---------------- Eastern Kingdoms
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'easternkingdoms',
    },
    [1030] = { --------------- Greymane Manor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'greymanemanor',
    },
    [1031] = { --------------- Greymane Manor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'greymanemanor',
    },
    [1208] = { --------------- Eastern Kingdoms
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'easternkingdoms',
    },
    [1244] = { --------------- Arathi Highlands
      lightParamId = 30,
      skyboxFileDataID = nil,
      normalizedName = 'arathihighlands',
    },
    [1245] = { --------------- Badlands
      lightParamId = 28,
      skyboxFileDataID = nil,
      normalizedName = 'badlands',
    },
    [1246] = { --------------- Blasted Lands
      lightParamId = 21,
      skyboxFileDataID = nil,
      normalizedName = 'blastedlands',
    },
    [1247] = { --------------- Tirisfal Glades
      lightParamId = 6060,
      skyboxFileDataID = nil,
      normalizedName = 'tirisfalglades',
    },
    [1248] = { --------------- Silverpine Forest
      lightParamId = 6064,
      skyboxFileDataID = nil,
      normalizedName = 'silverpineforest',
    },
    [1249] = { --------------- Western Plaguelands
      lightParamId = 6068,
      skyboxFileDataID = nil,
      normalizedName = 'westernplaguelands',
    },
    [1250] = { --------------- Eastern Plaguelands
      lightParamId = 6068,
      skyboxFileDataID = nil,
      normalizedName = 'easternplaguelands',
    },
    [1251] = { --------------- Hillsbrad Foothills
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'hillsbradfoothills',
    },
    [1252] = { --------------- The Hinterlands
      lightParamId = 6054,
      skyboxFileDataID = nil,
      normalizedName = 'thehinterlands',
    },
    [1253] = { --------------- Dun Morogh
      lightParamId = 5974,
      skyboxFileDataID = nil,
      normalizedName = 'dunmorogh',
    },
    [1254] = { --------------- Searing Gorge
      lightParamId = 77,
      skyboxFileDataID = nil,
      normalizedName = 'searinggorge',
    },
    [1255] = { --------------- Burning Steppes
      lightParamId = 23,
      skyboxFileDataID = nil,
      normalizedName = 'burningsteppes',
    },
    [1256] = { --------------- Elwynn Forest
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'elwynnforest',
    },
    [1257] = { --------------- Deadwind Pass
      lightParamId = 19,
      skyboxFileDataID = nil,
      normalizedName = 'deadwindpass',
    },
    [1258] = { --------------- Duskwood
      lightParamId = 14,
      skyboxFileDataID = nil,
      normalizedName = 'duskwood',
    },
    [1259] = { --------------- Loch Modan
      lightParamId = 38,
      skyboxFileDataID = nil,
      normalizedName = 'lochmodan',
    },
    [1260] = { --------------- Redridge Mountains
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'redridgemountains',
    },
    [1261] = { --------------- Swamp of Sorrows
      lightParamId = 16,
      skyboxFileDataID = nil,
      normalizedName = 'swampofsorrows',
    },
    [1262] = { --------------- Westfall
      lightParamId = 17,
      skyboxFileDataID = nil,
      normalizedName = 'westfall',
    },
    [1263] = { --------------- Wetlands
      lightParamId = 29,
      skyboxFileDataID = nil,
      normalizedName = 'wetlands',
    },
    [1264] = { --------------- Stormwind City
      lightParamId = 6080,
      skyboxFileDataID = nil,
      normalizedName = 'stormwindcity',
    },
    [1265] = { --------------- Ironforge
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ironforge',
    },
    [1266] = { --------------- Undercity
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'undercity',
    },
    [1272] = { --------------- Vashj'ir
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'vashjir',
    },
    [1273] = { --------------- Ruins of Gilneas
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ruinsofgilneas',
    },
    [1274] = { --------------- Stranglethorn Vale
      lightParamId = 26,
      skyboxFileDataID = nil,
      normalizedName = 'stranglethornvale',
    },
    [1275] = { --------------- Twilight Highlands
      lightParamId = 903,
      skyboxFileDataID = 451101, -- Retrieval method: skyboxId (165) -> twilighthighlandssky | environments\stars\twilighthighlandssky2.mdx
      normalizedName = 'twilighthighlands',
    },
    [1361] = { --------------- OldIronforge
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'oldironforge',
    },
    [2393] = { --------------- Silvermoon City
      lightParamId = 6806,
      skyboxFileDataID = 7299767, -- Retrieval method: skyboxId (691) -> esw eversong sky | 12ESW Eversong Sky
      normalizedName = 'silvermooncity',
      alias = 'silvermoonstage1defaultlight',
    },
    [2395] = { --------------- Eversong Woods
      lightParamId = 6547,
      skyboxFileDataID = 7148610, -- Retrieval method: skyboxId (681) -> eswwindrunnersky | 12ESW_WindrunnerSky
      normalizedName = 'eversongwoods',
      alias = 'esw',
    },
    [2424] = { --------------- Isle of Quel'Danas
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'isleofqueldanas',
    },
    [2437] = { --------------- Zul'Aman
      lightParamId = 6649,
      skyboxFileDataID = 7148610, -- Retrieval method: skyboxId (681) -> eswwindrunnersky | 12ESW_WindrunnerSky
      normalizedName = 'zulaman',
    },
    [2481] = { --------------- Eastern Kingdoms
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'easternkingdoms',
    },
    [2536] = { --------------- Atal'Aman
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'atalaman',
    },
    [2537] = { --------------- Quel'Thalas
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'quelthalas',
    },
    [2561] = { --------------- Quel'Thalas
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'quelthalas',
    },
    [2567] = { --------------- Eversong Woods
      lightParamId = 6547,
      skyboxFileDataID = 7148610, -- Retrieval method: skyboxId (681) -> eswwindrunnersky | 12ESW_WindrunnerSky
      normalizedName = 'eversongwoods',
      alias = 'esw',
    },
    [2568] = { --------------- Zul'Aman
      lightParamId = 6649,
      skyboxFileDataID = 7148610, -- Retrieval method: skyboxId (681) -> eswwindrunnersky | 12ESW_WindrunnerSky
      normalizedName = 'zulaman',
    },
    [2569] = { --------------- Isle of Quel'Danas
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'isleofqueldanas',
    },
    [2579] = { --------------- Wartha'nan Crypts
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'warthanancrypts',
    },
    [2580] = { --------------- Loaknit Den
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'loaknitden',
    },
    [2583] = { --------------- Wit'Kalar Crypt
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'witkalarcrypt',
    },
    [2584] = { --------------- Revantusk Sedge
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'revantusksedge',
    },
    [2649] = { --------------- The Lycaneum
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thelycaneum',
    },
  },
  [30] = {
    [91] = { ----------------- Alterac Valley
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'alteracvalley',
    },
  },
  [489] = {
    [92] = { ----------------- Warsong Gulch
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'warsonggulch',
    },
  },
  [529] = {
    [93] = { ----------------- Arathi Basin
      lightParamId = nil,
      skyboxFileDataID = 1537289, -- Retrieval method: fuzzy name match -> arathibasinwintersky | environments\stars\arathibasin_wintersky01.mdx
      normalizedName = 'arathibasin',
    },
  },
  [530] = {
    [94] = { ----------------- Eversong Woods
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'eversongwoods',
    },
    [95] = { ----------------- Ghostlands
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ghostlands',
    },
    [96] = { ----------------- Amani Catacombs
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'amanicatacombs',
    },
    [97] = { ----------------- Azuremyst Isle
      lightParamId = 6027,
      skyboxFileDataID = nil,
      normalizedName = 'azuremystisle',
    },
    [98] = { ----------------- Tides' Hollow
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'tideshollow',
    },
    [99] = { ----------------- Stillpine Hold
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'stillpinehold',
    },
    [100] = { ---------------- Hellfire Peninsula
      lightParamId = 384,
      skyboxFileDataID = 130525, -- Retrieval method: skyboxId (7) -> hellfire | Environments\Stars\HellfireSkyBox.mdx
      normalizedName = 'hellfirepeninsula',
    },
    [101] = { ---------------- Outland
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'outland',
    },
    [102] = { ---------------- Zangarmarsh
      lightParamId = 432,
      skyboxFileDataID = nil,
      normalizedName = 'zangarmarsh',
    },
    [103] = { ---------------- The Exodar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theexodar',
    },
    [104] = { ---------------- Shadowmoon Valley
      lightParamId = 513,
      skyboxFileDataID = 130623, -- Retrieval method: skyboxId (9) -> shadowmoon | environments\stars\shadowmoonskybox.mdx
      normalizedName = 'shadowmoonvalley',
    },
    [105] = { ---------------- Blade's Edge Mountains
      lightParamId = 438,
      skyboxFileDataID = 130476, -- Retrieval method: skyboxId (11) -> bladesedge | Environments\Stars\BladesEdgeSkyBox.mdx
      normalizedName = 'bladesedgemountains',
    },
    [106] = { ---------------- Bloodmyst Isle
      lightParamId = 6031,
      skyboxFileDataID = nil,
      normalizedName = 'bloodmystisle',
    },
    [107] = { ---------------- Nagrand
      lightParamId = 396,
      skyboxFileDataID = 130575, -- Retrieval method: skyboxId (12) -> nagrand | environments\stars\nagrandskybox.mdx
      normalizedName = 'nagrand',
    },
    [108] = { ---------------- Terokkar Forest
      lightParamId = 435,
      skyboxFileDataID = nil,
      normalizedName = 'terokkarforest',
    },
    [109] = { ---------------- Netherstorm
      lightParamId = 508,
      skyboxFileDataID = 130593, -- Retrieval method: skyboxId (10) -> netherstorm | environments\stars\netherstormskybox.mdx
      normalizedName = 'netherstorm',
    },
    [110] = { ---------------- Silvermoon City
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'silvermooncity',
    },
    [111] = { ---------------- Shattrath City
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'shattrathcity',
    },
    [122] = { ---------------- Isle of Quel'Danas
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'isleofqueldanas',
    },
    [467] = { ---------------- Sunstrider Isle
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sunstriderisle',
    },
    [468] = { ---------------- Ammen Vale
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ammenvale',
    },
    [12] = { ----------------- Kalimdor
      lightParamId = nil,
      skyboxFileDataID = 395900, -- Retrieval method: fuzzy name match -> worldkalimdorhyjalsmokehyjalsmokeclouds | world\kalimdor\hyjal\passivedoodads\smoke\hyjal_smokeclouds.mdx
      normalizedName = 'kalimdor',
    },
    [13] = { ----------------- Eastern Kingdoms
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'easternkingdoms',
    },
    [987] = { ---------------- Outland
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'outland',
    },
    [985] = { ---------------- Eastern Kingdoms
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'easternkingdoms',
    },
    [986] = { ---------------- Kalimdor
      lightParamId = nil,
      skyboxFileDataID = 395900, -- Retrieval method: fuzzy name match -> worldkalimdorhyjalsmokehyjalsmokeclouds | world\kalimdor\hyjal\passivedoodads\smoke\hyjal_smokeclouds.mdx
      normalizedName = 'kalimdor',
    },
    [1208] = { --------------- Eastern Kingdoms
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'easternkingdoms',
    },
    [1209] = { --------------- Kalimdor
      lightParamId = nil,
      skyboxFileDataID = 395900, -- Retrieval method: fuzzy name match -> worldkalimdorhyjalsmokehyjalsmokeclouds | world\kalimdor\hyjal\passivedoodads\smoke\hyjal_smokeclouds.mdx
      normalizedName = 'kalimdor',
    },
    [1267] = { --------------- Eversong Woods
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'eversongwoods',
    },
    [1268] = { --------------- Ghostlands
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ghostlands',
    },
    [1269] = { --------------- Silvermoon City
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'silvermooncity',
    },
    [1270] = { --------------- Isle of Quel'Danas
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'isleofqueldanas',
    },
    [1325] = { --------------- Azuremyst Isle
      lightParamId = 6027,
      skyboxFileDataID = nil,
      normalizedName = 'azuremystisle',
    },
    [1326] = { --------------- The Exodar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theexodar',
    },
    [1327] = { --------------- Bloodmyst Isle
      lightParamId = 6031,
      skyboxFileDataID = nil,
      normalizedName = 'bloodmystisle',
    },
    [947] = { ---------------- Azeroth
      lightParamId = nil,
      skyboxFileDataID = 527828, -- Retrieval method: fuzzy name match -> fallofazeroth | environments\stars\fallofazeroth01.mdx
      normalizedName = 'azeroth',
    },
    [1467] = { --------------- Outland
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'outland',
    },
  },
  [566] = {
    [112] = { ---------------- Eye of the Storm
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'eyeofthestorm',
    },
  },
  [571] = {
    [113] = { ---------------- Northrend
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'northrend',
    },
    [114] = { ---------------- Borean Tundra
      lightParamId = 616,
      skyboxFileDataID = 235281, -- Retrieval method: skyboxId (88) -> auroraorange | ENVIRONMENTS\Stars\AuroraOrange.mdx
      normalizedName = 'boreantundra',
    },
    [115] = { ---------------- Dragonblight
      lightParamId = 792,
      skyboxFileDataID = 235282, -- Retrieval method: skyboxId (58) -> aurorayellowgreen | ENVIRONMENTS\Stars\AuroraYellowGreen.mdx
      normalizedName = 'dragonblight',
    },
    [116] = { ---------------- Grizzly Hills
      lightParamId = 672,
      skyboxFileDataID = 235281, -- Retrieval method: skyboxId (64) -> auroraorange | ENVIRONMENTS\Stars\AuroraOrange.mdx
      normalizedName = 'grizzlyhills',
    },
    [117] = { ---------------- Howling Fjord
      lightParamId = 589,
      skyboxFileDataID = 235282, -- Retrieval method: skyboxId (66) -> aurorayellowgreen | ENVIRONMENTS\Stars\AuroraYellowGreen.mdx
      normalizedName = 'howlingfjord',
    },
    [118] = { ---------------- Icecrown
      lightParamId = 748,
      skyboxFileDataID = 130552, -- Retrieval method: skyboxId (137) -> icecrownsky | Environments\Stars\IceCrownSky.mdx
      normalizedName = 'icecrown',
    },
    [119] = { ---------------- Sholazar Basin
      lightParamId = 789,
      skyboxFileDataID = 235282, -- Retrieval method: skyboxId (56) -> aurorayellowgreen | ENVIRONMENTS\Stars\AuroraYellowGreen.mdx
      normalizedName = 'sholazarbasin',
    },
    [120] = { ---------------- The Storm Peaks
      lightParamId = 810,
      skyboxFileDataID = 1613362, -- Retrieval method: skyboxId (116) -> stormpeaksskyculduarlayerm | Environments\Stars\StormPeaks_SkyC_Ulduar_Layer01.m2
      normalizedName = 'thestormpeaks',
    },
    [121] = { ---------------- Zul'Drak
      lightParamId = 683,
      skyboxFileDataID = 130645, -- Retrieval method: skyboxId (113) -> zuldrakskya | ENVIRONMENTS\Stars\ZulDrakSkyA.mdx
      normalizedName = 'zuldrak',
    },
    [123] = { ---------------- Wintergrasp
      lightParamId = 6562,
      skyboxFileDataID = 235383, -- Retrieval method: skyboxId (52) -> wintergraspsmokysky | ENVIRONMENTS\Stars\WintergraspSmokySky.mdx
      normalizedName = 'wintergrasp',
    },
    [125] = { ---------------- Dalaran
      lightParamId = nil,
      skyboxFileDataID = 235302, -- Retrieval method: fuzzy name match -> dalaran | ENVIRONMENTS\Stars\DalaranSkyBox.mdx
      normalizedName = 'dalaran',
    },
    [126] = { ---------------- Dalaran
      lightParamId = nil,
      skyboxFileDataID = 235302, -- Retrieval method: fuzzy name match -> dalaran | ENVIRONMENTS\Stars\DalaranSkyBox.mdx
      normalizedName = 'dalaran',
    },
    [127] = { ---------------- Crystalsong Forest
      lightParamId = 765,
      skyboxFileDataID = nil,
      normalizedName = 'crystalsongforest',
    },
    [170] = { ---------------- Hrothgar's Landing
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'hrothgarslanding',
    },
    [947] = { ---------------- Azeroth
      lightParamId = nil,
      skyboxFileDataID = 527828, -- Retrieval method: fuzzy name match -> fallofazeroth | environments\stars\fallofazeroth01.mdx
      normalizedName = 'azeroth',
    },
    [988] = { ---------------- Northrend
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'northrend',
    },
    [1384] = { --------------- Northrend
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'northrend',
    },
    [1396] = { --------------- Borean Tundra
      lightParamId = 616,
      skyboxFileDataID = 235281, -- Retrieval method: skyboxId (88) -> auroraorange | ENVIRONMENTS\Stars\AuroraOrange.mdx
      normalizedName = 'boreantundra',
    },
    [1397] = { --------------- Dragonblight
      lightParamId = 792,
      skyboxFileDataID = 235282, -- Retrieval method: skyboxId (58) -> aurorayellowgreen | ENVIRONMENTS\Stars\AuroraYellowGreen.mdx
      normalizedName = 'dragonblight',
    },
    [1398] = { --------------- Grizzly Hills
      lightParamId = 672,
      skyboxFileDataID = 235281, -- Retrieval method: skyboxId (64) -> auroraorange | ENVIRONMENTS\Stars\AuroraOrange.mdx
      normalizedName = 'grizzlyhills',
    },
    [1399] = { --------------- Howling Fjord
      lightParamId = 589,
      skyboxFileDataID = 235282, -- Retrieval method: skyboxId (66) -> aurorayellowgreen | ENVIRONMENTS\Stars\AuroraYellowGreen.mdx
      normalizedName = 'howlingfjord',
    },
    [1400] = { --------------- Icecrown
      lightParamId = 748,
      skyboxFileDataID = 130552, -- Retrieval method: skyboxId (137) -> icecrownsky | Environments\Stars\IceCrownSky.mdx
      normalizedName = 'icecrown',
    },
    [1401] = { --------------- Sholazar Basin
      lightParamId = 789,
      skyboxFileDataID = 235282, -- Retrieval method: skyboxId (56) -> aurorayellowgreen | ENVIRONMENTS\Stars\AuroraYellowGreen.mdx
      normalizedName = 'sholazarbasin',
    },
    [1402] = { --------------- The Storm Peaks
      lightParamId = 810,
      skyboxFileDataID = 1613362, -- Retrieval method: skyboxId (116) -> stormpeaksskyculduarlayerm | Environments\Stars\StormPeaks_SkyC_Ulduar_Layer01.m2
      normalizedName = 'thestormpeaks',
    },
    [1403] = { --------------- Zul'Drak
      lightParamId = 683,
      skyboxFileDataID = 130645, -- Retrieval method: skyboxId (113) -> zuldrakskya | ENVIRONMENTS\Stars\ZulDrakSkyA.mdx
      normalizedName = 'zuldrak',
    },
    [1404] = { --------------- Wintergrasp
      lightParamId = 6562,
      skyboxFileDataID = 235383, -- Retrieval method: skyboxId (52) -> wintergraspsmokysky | ENVIRONMENTS\Stars\WintergraspSmokySky.mdx
      normalizedName = 'wintergrasp',
    },
    [1405] = { --------------- Crystalsong Forest
      lightParamId = 765,
      skyboxFileDataID = nil,
      normalizedName = 'crystalsongforest',
    },
    [1406] = { --------------- Hrothgar's Landing
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'hrothgarslanding',
    },
  },
  [609] = {
    [124] = { ---------------- Plaguelands: The Scarlet Enclave
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'plaguelandsthescarletenclave',
    },
  },
  [607] = {
    [128] = { ---------------- Strand of the Ancients
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'strandoftheancients',
    },
  },
  [576] = {
    [129] = { ---------------- The Nexus
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thenexus',
    },
  },
  [595] = {
    [130] = { ---------------- The Culling of Stratholme
      lightParamId = nil,
      skyboxFileDataID = 130636, -- Retrieval method: fuzzy name match -> stratholme | Environments\Stars\StratholmeSkybox.mdx
      normalizedName = 'thecullingofstratholme',
    },
    [131] = { ---------------- The Culling of Stratholme
      lightParamId = nil,
      skyboxFileDataID = 130636, -- Retrieval method: fuzzy name match -> stratholme | Environments\Stars\StratholmeSkybox.mdx
      normalizedName = 'thecullingofstratholme',
    },
  },
  [619] = {
    [132] = { ---------------- Ahn'kahet: The Old Kingdom
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ahnkahettheoldkingdom',
    },
  },
  [574] = {
    [133] = { ---------------- Utgarde Keep
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'utgardekeep',
    },
    [134] = { ---------------- Utgarde Keep
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'utgardekeep',
    },
    [135] = { ---------------- Utgarde Keep
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'utgardekeep',
    },
  },
  [575] = {
    [136] = { ---------------- Utgarde Pinnacle
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'utgardepinnacle',
    },
    [137] = { ---------------- Utgarde Pinnacle
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'utgardepinnacle',
    },
  },
  [602] = {
    [138] = { ---------------- Halls of Lightning
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'hallsoflightning',
    },
    [139] = { ---------------- Halls of Lightning
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'hallsoflightning',
    },
  },
  [599] = {
    [140] = { ---------------- Halls of Stone
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'hallsofstone',
    },
  },
  [616] = {
    [141] = { ---------------- The Eye of Eternity
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theeyeofeternity',
    },
  },
  [578] = {
    [142] = { ---------------- The Oculus
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theoculus',
    },
    [143] = { ---------------- The Oculus
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theoculus',
    },
    [144] = { ---------------- The Oculus
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theoculus',
    },
    [145] = { ---------------- The Oculus
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theoculus',
    },
    [146] = { ---------------- The Oculus
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theoculus',
    },
  },
  [603] = {
    [147] = { ---------------- Ulduar
      lightParamId = nil,
      skyboxFileDataID = 1613362, -- Retrieval method: fuzzy name match -> stormpeaksskyculduarlayerm | Environments\Stars\StormPeaks_SkyC_Ulduar_Layer01.m2
      normalizedName = 'ulduar',
    },
    [148] = { ---------------- Ulduar
      lightParamId = nil,
      skyboxFileDataID = 1613362, -- Retrieval method: fuzzy name match -> stormpeaksskyculduarlayerm | Environments\Stars\StormPeaks_SkyC_Ulduar_Layer01.m2
      normalizedName = 'ulduar',
    },
    [149] = { ---------------- Ulduar
      lightParamId = nil,
      skyboxFileDataID = 1613362, -- Retrieval method: fuzzy name match -> stormpeaksskyculduarlayerm | Environments\Stars\StormPeaks_SkyC_Ulduar_Layer01.m2
      normalizedName = 'ulduar',
    },
    [150] = { ---------------- Ulduar
      lightParamId = nil,
      skyboxFileDataID = 1613362, -- Retrieval method: fuzzy name match -> stormpeaksskyculduarlayerm | Environments\Stars\StormPeaks_SkyC_Ulduar_Layer01.m2
      normalizedName = 'ulduar',
    },
    [151] = { ---------------- Ulduar
      lightParamId = nil,
      skyboxFileDataID = 1613362, -- Retrieval method: fuzzy name match -> stormpeaksskyculduarlayerm | Environments\Stars\StormPeaks_SkyC_Ulduar_Layer01.m2
      normalizedName = 'ulduar',
    },
    [152] = { ---------------- Ulduar
      lightParamId = nil,
      skyboxFileDataID = 1613362, -- Retrieval method: fuzzy name match -> stormpeaksskyculduarlayerm | Environments\Stars\StormPeaks_SkyC_Ulduar_Layer01.m2
      normalizedName = 'ulduar',
    },
  },
  [604] = {
    [153] = { ---------------- Gundrak
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'gundrak',
    },
    [154] = { ---------------- Gundrak
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'gundrak',
    },
  },
  [615] = {
    [155] = { ---------------- The Obsidian Sanctum
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theobsidiansanctum',
    },
  },
  [624] = {
    [156] = { ---------------- Vault of Archavon
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'vaultofarchavon',
    },
  },
  [601] = {
    [157] = { ---------------- Azjol-Nerub
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'azjolnerub',
    },
    [158] = { ---------------- Azjol-Nerub
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'azjolnerub',
    },
    [159] = { ---------------- Azjol-Nerub
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'azjolnerub',
    },
  },
  [600] = {
    [160] = { ---------------- Drak'Tharon Keep
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'draktharonkeep',
    },
    [161] = { ---------------- Drak'Tharon Keep
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'draktharonkeep',
    },
  },
  [533] = {
    [162] = { ---------------- Naxxramas
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'naxxramas',
    },
    [163] = { ---------------- Naxxramas
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'naxxramas',
    },
    [164] = { ---------------- Naxxramas
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'naxxramas',
    },
    [165] = { ---------------- Naxxramas
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'naxxramas',
    },
    [166] = { ---------------- Naxxramas
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'naxxramas',
    },
    [167] = { ---------------- Naxxramas
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'naxxramas',
    },
  },
  [608] = {
    [168] = { ---------------- The Violet Hold
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theviolethold',
    },
  },
  [628] = {
    [169] = { ---------------- Isle of Conquest
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'isleofconquest',
    },
  },
  [650] = {
    [171] = { ---------------- Trial of the Champion
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'trialofthechampion',
    },
  },
  [649] = {
    [172] = { ---------------- Trial of the Crusader
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'trialofthecrusader',
    },
    [173] = { ---------------- Trial of the Crusader
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'trialofthecrusader',
    },
  },
  [648] = {
    [174] = { ---------------- The Lost Isles
      lightParamId = nil,
      skyboxFileDataID = 321486, -- Retrieval method: fuzzy name match -> lostisle | Environments\Stars\LostIsleSkyBox.mdx
      normalizedName = 'thelostisles',
    },
    [175] = { ---------------- Kaja'mite Cavern
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'kajamitecavern',
    },
    [176] = { ---------------- Volcanoth's Lair
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'volcanothslair',
    },
    [177] = { ---------------- Gallywix Labor Mine
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'gallywixlabormine',
    },
    [178] = { ---------------- Gallywix Labor Mine
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'gallywixlabormine',
    },
    [194] = { ---------------- Kezan
      lightParamId = nil,
      skyboxFileDataID = 332833, -- Retrieval method: fuzzy name match -> kezan | Environments\Stars\KezanSkyBox.mdx
      normalizedName = 'kezan',
    },
    [195] = { ---------------- Kaja'mine
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'kajamine',
    },
    [196] = { ---------------- Kaja'mine
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'kajamine',
    },
    [197] = { ---------------- Kaja'mine
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'kajamine',
    },
  },
  [654] = {
    [179] = { ---------------- Gilneas
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'gilneas',
    },
    [180] = { ---------------- Emberstone Mine
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'emberstonemine',
    },
    [181] = { ---------------- Greymane Manor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'greymanemanor',
    },
    [182] = { ---------------- Greymane Manor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'greymanemanor',
    },
    [202] = { ---------------- Gilneas City
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'gilneascity',
    },
    [1271] = { --------------- Gilneas
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'gilneas',
    },
  },
  [632] = {
    [183] = { ---------------- The Forge of Souls
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theforgeofsouls',
    },
  },
  [658] = {
    [184] = { ---------------- Pit of Saron
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'pitofsaron',
    },
  },
  [668] = {
    [185] = { ---------------- Halls of Reflection
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'hallsofreflection',
    },
  },
  [631] = {
    [186] = { ---------------- Icecrown Citadel
      lightParamId = nil,
      skyboxFileDataID = 130551, -- Retrieval method: fuzzy name match -> icecrowncitadelsky | environments\stars\icecrowncitadelsky.mdx
      normalizedName = 'icecrowncitadel',
    },
    [187] = { ---------------- Icecrown Citadel
      lightParamId = nil,
      skyboxFileDataID = 130551, -- Retrieval method: fuzzy name match -> icecrowncitadelsky | environments\stars\icecrowncitadelsky.mdx
      normalizedName = 'icecrowncitadel',
    },
    [188] = { ---------------- Icecrown Citadel
      lightParamId = nil,
      skyboxFileDataID = 130551, -- Retrieval method: fuzzy name match -> icecrowncitadelsky | environments\stars\icecrowncitadelsky.mdx
      normalizedName = 'icecrowncitadel',
    },
    [189] = { ---------------- Icecrown Citadel
      lightParamId = nil,
      skyboxFileDataID = 130551, -- Retrieval method: fuzzy name match -> icecrowncitadelsky | environments\stars\icecrowncitadelsky.mdx
      normalizedName = 'icecrowncitadel',
    },
    [190] = { ---------------- Icecrown Citadel
      lightParamId = nil,
      skyboxFileDataID = 130551, -- Retrieval method: fuzzy name match -> icecrowncitadelsky | environments\stars\icecrowncitadelsky.mdx
      normalizedName = 'icecrowncitadel',
    },
    [191] = { ---------------- Icecrown Citadel
      lightParamId = nil,
      skyboxFileDataID = 130551, -- Retrieval method: fuzzy name match -> icecrowncitadelsky | environments\stars\icecrowncitadelsky.mdx
      normalizedName = 'icecrowncitadel',
    },
    [192] = { ---------------- Icecrown Citadel
      lightParamId = nil,
      skyboxFileDataID = 130551, -- Retrieval method: fuzzy name match -> icecrowncitadelsky | environments\stars\icecrowncitadelsky.mdx
      normalizedName = 'icecrowncitadel',
    },
    [193] = { ---------------- Icecrown Citadel
      lightParamId = nil,
      skyboxFileDataID = 130551, -- Retrieval method: fuzzy name match -> icecrowncitadelsky | environments\stars\icecrowncitadelsky.mdx
      normalizedName = 'icecrowncitadel',
    },
  },
  [724] = {
    [200] = { ---------------- The Ruby Sanctum
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'therubysanctum',
    },
  },
  [726] = {
    [206] = { ---------------- Twin Peaks
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'twinpeaks',
    },
  },
  [646] = {
    [207] = { ---------------- Deepholm
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'deepholm',
    },
    [208] = { ---------------- Twilight Depths
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'twilightdepths',
    },
    [209] = { ---------------- Twilight Depths
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'twilightdepths',
    },
  },
  [389] = {
    [213] = { ---------------- Ragefire Chasm
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ragefirechasm',
    },
  },
  [209] = {
    [219] = { ---------------- Zul'Farrak
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'zulfarrak',
    },
  },
  [109] = {
    [220] = { ---------------- The Temple of Atal'Hakkar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thetempleofatalhakkar',
    },
  },
  [48] = {
    [221] = { ---------------- Blackfathom Deeps
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackfathomdeeps',
    },
    [222] = { ---------------- Blackfathom Deeps
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackfathomdeeps',
    },
    [223] = { ---------------- Blackfathom Deeps
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackfathomdeeps',
    },
  },
  [34] = {
    [225] = { ---------------- The Stockade
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thestockade',
    },
  },
  [90] = {
    [226] = { ---------------- Gnomeregan
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'gnomeregan',
    },
    [227] = { ---------------- Gnomeregan
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'gnomeregan',
    },
    [228] = { ---------------- Gnomeregan
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'gnomeregan',
    },
    [229] = { ---------------- Gnomeregan
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'gnomeregan',
    },
  },
  [70] = {
    [230] = { ---------------- Uldaman
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'uldaman',
    },
    [231] = { ---------------- Uldaman
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'uldaman',
    },
  },
  [409] = {
    [232] = { ---------------- Molten Core
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'moltencore',
    },
  },
  [309] = {
    [233] = { ---------------- Zul'Gurub
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'zulgurub',
    },
  },
  [429] = {
    [234] = { ---------------- Dire Maul
      lightParamId = nil,
      skyboxFileDataID = 130497, -- Retrieval method: fuzzy name match -> diremaul | Environments\Stars\DireMaulSkyBox.mdx
      normalizedName = 'diremaul',
    },
    [235] = { ---------------- Dire Maul
      lightParamId = nil,
      skyboxFileDataID = 130497, -- Retrieval method: fuzzy name match -> diremaul | Environments\Stars\DireMaulSkyBox.mdx
      normalizedName = 'diremaul',
    },
    [236] = { ---------------- Dire Maul
      lightParamId = nil,
      skyboxFileDataID = 130497, -- Retrieval method: fuzzy name match -> diremaul | Environments\Stars\DireMaulSkyBox.mdx
      normalizedName = 'diremaul',
    },
    [237] = { ---------------- Dire Maul
      lightParamId = nil,
      skyboxFileDataID = 130497, -- Retrieval method: fuzzy name match -> diremaul | Environments\Stars\DireMaulSkyBox.mdx
      normalizedName = 'diremaul',
    },
    [238] = { ---------------- Dire Maul
      lightParamId = nil,
      skyboxFileDataID = 130497, -- Retrieval method: fuzzy name match -> diremaul | Environments\Stars\DireMaulSkyBox.mdx
      normalizedName = 'diremaul',
    },
    [239] = { ---------------- Dire Maul
      lightParamId = nil,
      skyboxFileDataID = 130497, -- Retrieval method: fuzzy name match -> diremaul | Environments\Stars\DireMaulSkyBox.mdx
      normalizedName = 'diremaul',
    },
    [240] = { ---------------- Dire Maul
      lightParamId = nil,
      skyboxFileDataID = 130497, -- Retrieval method: fuzzy name match -> diremaul | Environments\Stars\DireMaulSkyBox.mdx
      normalizedName = 'diremaul',
    },
  },
  [230] = {
    [242] = { ---------------- Blackrock Depths
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackrockdepths',
    },
    [243] = { ---------------- Blackrock Depths
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackrockdepths',
    },
  },
  [732] = {
    [244] = { ---------------- Tol Barad
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'tolbarad',
    },
    [245] = { ---------------- Tol Barad Peninsula
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'tolbaradpeninsula',
    },
    [13] = { ----------------- Eastern Kingdoms
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'easternkingdoms',
    },
    [985] = { ---------------- Eastern Kingdoms
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'easternkingdoms',
    },
    [1208] = { --------------- Eastern Kingdoms
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'easternkingdoms',
    },
    [1276] = { --------------- Tol Barad
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'tolbarad',
    },
    [1277] = { --------------- Tol Barad Peninsula
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'tolbaradpeninsula',
    },
    [2481] = { --------------- Eastern Kingdoms
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'easternkingdoms',
    },
  },
  [540] = {
    [246] = { ---------------- The Shattered Halls
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theshatteredhalls',
    },
  },
  [509] = {
    [247] = { ---------------- Ruins of Ahn'Qiraj
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ruinsofahnqiraj',
    },
  },
  [249] = {
    [248] = { ---------------- Onyxia's Lair
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'onyxiaslair',
    },
  },
  [229] = {
    [250] = { ---------------- Blackrock Spire
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackrockspire',
    },
    [251] = { ---------------- Blackrock Spire
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackrockspire',
    },
    [252] = { ---------------- Blackrock Spire
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackrockspire',
    },
    [253] = { ---------------- Blackrock Spire
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackrockspire',
    },
    [254] = { ---------------- Blackrock Spire
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackrockspire',
    },
    [255] = { ---------------- Blackrock Spire
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackrockspire',
    },
  },
  [558] = {
    [256] = { ---------------- Auchenai Crypts
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'auchenaicrypts',
    },
    [257] = { ---------------- Auchenai Crypts
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'auchenaicrypts',
    },
  },
  [556] = {
    [258] = { ---------------- Sethekk Halls
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sethekkhalls',
    },
    [259] = { ---------------- Sethekk Halls
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sethekkhalls',
    },
  },
  [555] = {
    [260] = { ---------------- Shadow Labyrinth
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'shadowlabyrinth',
    },
  },
  [542] = {
    [261] = { ---------------- The Blood Furnace
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thebloodfurnace',
    },
  },
  [546] = {
    [262] = { ---------------- The Underbog
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theunderbog',
    },
  },
  [545] = {
    [263] = { ---------------- The Steamvault
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thesteamvault',
    },
    [264] = { ---------------- The Steamvault
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thesteamvault',
    },
  },
  [547] = {
    [265] = { ---------------- The Slave Pens
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theslavepens',
    },
  },
  [553] = {
    [266] = { ---------------- The Botanica
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thebotanica',
    },
  },
  [554] = {
    [267] = { ---------------- The Mechanar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'themechanar',
    },
    [268] = { ---------------- The Mechanar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'themechanar',
    },
  },
  [552] = {
    [269] = { ---------------- The Arcatraz
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thearcatraz',
    },
    [270] = { ---------------- The Arcatraz
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thearcatraz',
    },
    [271] = { ---------------- The Arcatraz
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thearcatraz',
    },
  },
  [557] = {
    [272] = { ---------------- Mana-Tombs
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'manatombs',
    },
  },
  [269] = {
    [273] = { ---------------- The Black Morass
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theblackmorass',
    },
  },
  [560] = {
    [274] = { ---------------- Old Hillsbrad Foothills
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'oldhillsbradfoothills',
    },
  },
  [761] = {
    [275] = { ---------------- The Battle for Gilneas
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thebattleforgilneas',
    },
  },
  [730] = {
    [276] = { ---------------- The Maelstrom
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'themaelstrom',
    },
  },
  [755] = {
    [277] = { ---------------- Lost City of the Tol'vir
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'lostcityofthetolvir',
    },
  },
  [43] = {
    [279] = { ---------------- Wailing Caverns
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'wailingcaverns',
    },
  },
  [349] = {
    [280] = { ---------------- Maraudon
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'maraudon',
    },
    [281] = { ---------------- Maraudon
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'maraudon',
    },
  },
  [757] = {
    [282] = { ---------------- Baradin Hold
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'baradinhold',
    },
  },
  [645] = {
    [283] = { ---------------- Blackrock Caverns
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackrockcaverns',
    },
    [284] = { ---------------- Blackrock Caverns
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackrockcaverns',
    },
  },
  [669] = {
    [285] = { ---------------- Blackwing Descent
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackwingdescent',
    },
    [286] = { ---------------- Blackwing Descent
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackwingdescent',
    },
  },
  [469] = {
    [287] = { ---------------- Blackwing Lair
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackwinglair',
    },
    [288] = { ---------------- Blackwing Lair
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackwinglair',
    },
    [289] = { ---------------- Blackwing Lair
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackwinglair',
    },
    [290] = { ---------------- Blackwing Lair
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackwinglair',
    },
  },
  [36] = {
    [291] = { ---------------- The Deadmines
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thedeadmines',
    },
    [292] = { ---------------- The Deadmines
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thedeadmines',
    },
  },
  [670] = {
    [293] = { ---------------- Grim Batol
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'grimbatol',
    },
  },
  [671] = {
    [294] = { ---------------- The Bastion of Twilight
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thebastionoftwilight',
    },
    [295] = { ---------------- The Bastion of Twilight
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thebastionoftwilight',
    },
    [296] = { ---------------- The Bastion of Twilight
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thebastionoftwilight',
    },
  },
  [644] = {
    [297] = { ---------------- Halls of Origination
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'hallsoforigination',
    },
    [298] = { ---------------- Halls of Origination
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'hallsoforigination',
    },
    [299] = { ---------------- Halls of Origination
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'hallsoforigination',
    },
  },
  [129] = {
    [300] = { ---------------- Razorfen Downs
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'razorfendowns',
    },
  },
  [47] = {
    [301] = { ---------------- Razorfen Kraul
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'razorfenkraul',
    },
  },
  [189] = {
    [302] = { ---------------- Scarlet Monastery
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'scarletmonastery',
    },
    [303] = { ---------------- Scarlet Monastery
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'scarletmonastery',
    },
    [304] = { ---------------- Scarlet Monastery
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'scarletmonastery',
    },
    [305] = { ---------------- Scarlet Monastery
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'scarletmonastery',
    },
  },
  [289] = {
    [306] = { ---------------- Legacy of Scholomance
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'legacyofscholomance',
    },
    [307] = { ---------------- Legacy of Scholomance
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'legacyofscholomance',
    },
    [308] = { ---------------- Legacy of Scholomance
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'legacyofscholomance',
    },
    [309] = { ---------------- Legacy of Scholomance
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'legacyofscholomance',
    },
  },
  [33] = {
    [310] = { ---------------- Shadowfang Keep
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'shadowfangkeep',
    },
    [311] = { ---------------- Shadowfang Keep
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'shadowfangkeep',
    },
    [312] = { ---------------- Shadowfang Keep
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'shadowfangkeep',
    },
    [313] = { ---------------- Shadowfang Keep
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'shadowfangkeep',
    },
    [314] = { ---------------- Shadowfang Keep
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'shadowfangkeep',
    },
    [315] = { ---------------- Shadowfang Keep
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'shadowfangkeep',
    },
    [316] = { ---------------- Shadowfang Keep
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'shadowfangkeep',
    },
  },
  [329] = {
    [317] = { ---------------- Stratholme
      lightParamId = nil,
      skyboxFileDataID = 130636, -- Retrieval method: fuzzy name match -> stratholme | Environments\Stars\StratholmeSkybox.mdx
      normalizedName = 'stratholme',
    },
    [318] = { ---------------- Stratholme
      lightParamId = nil,
      skyboxFileDataID = 130636, -- Retrieval method: fuzzy name match -> stratholme | Environments\Stars\StratholmeSkybox.mdx
      normalizedName = 'stratholme',
    },
  },
  [531] = {
    [319] = { ---------------- Ahn'Qiraj
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ahnqiraj',
    },
    [320] = { ---------------- Ahn'Qiraj
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ahnqiraj',
    },
    [321] = { ---------------- Ahn'Qiraj
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ahnqiraj',
    },
  },
  [643] = {
    [322] = { ---------------- Throne of the Tides
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'throneofthetides',
    },
    [323] = { ---------------- Throne of the Tides
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'throneofthetides',
    },
  },
  [725] = {
    [324] = { ---------------- The Stonecore
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thestonecore',
    },
  },
  [657] = {
    [325] = { ---------------- The Vortex Pinnacle
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thevortexpinnacle',
    },
  },
  [754] = {
    [328] = { ---------------- Throne of the Four Winds
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'throneofthefourwinds',
    },
  },
  [534] = {
    [329] = { ---------------- Hyjal Summit
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'hyjalsummit',
    },
  },
  [565] = {
    [330] = { ---------------- Gruul's Lair
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'gruulslair',
    },
  },
  [544] = {
    [331] = { ---------------- Magtheridon's Lair
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'magtheridonslair',
    },
  },
  [548] = {
    [332] = { ---------------- Serpentshrine Cavern
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'serpentshrinecavern',
    },
  },
  [568] = {
    [333] = { ---------------- Zul'Aman
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'zulaman',
    },
  },
  [550] = {
    [334] = { ---------------- Tempest Keep
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'tempestkeep',
    },
  },
  [580] = {
    [335] = { ---------------- Sunwell Plateau
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sunwellplateau',
    },
    [336] = { ---------------- Sunwell Plateau
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sunwellplateau',
    },
  },
  [859] = {
    [337] = { ---------------- Zul'Gurub
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'zulgurub',
    },
  },
  [861] = {
    [338] = { ---------------- Molten Front
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'moltenfront',
    },
  },
  [564] = {
    [339] = { ---------------- Black Temple
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blacktemple',
    },
    [340] = { ---------------- Black Temple
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blacktemple',
    },
    [341] = { ---------------- Black Temple
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blacktemple',
    },
    [342] = { ---------------- Black Temple
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blacktemple',
    },
    [343] = { ---------------- Black Temple
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blacktemple',
    },
    [344] = { ---------------- Black Temple
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blacktemple',
    },
    [345] = { ---------------- Black Temple
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blacktemple',
    },
    [346] = { ---------------- Black Temple
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blacktemple',
    },
  },
  [543] = {
    [347] = { ---------------- Hellfire Ramparts
      lightParamId = nil,
      skyboxFileDataID = 130525, -- Retrieval method: fuzzy name match -> hellfire | Environments\Stars\HellfireSkyBox.mdx
      normalizedName = 'hellfireramparts',
    },
  },
  [585] = {
    [348] = { ---------------- Magisters' Terrace
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'magistersterrace',
    },
    [349] = { ---------------- Magisters' Terrace
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'magistersterrace',
    },
  },
  [532] = {
    [350] = { ---------------- Karazhan
      lightParamId = nil,
      skyboxFileDataID = 1522824, -- Retrieval method: fuzzy name match -> legioninvasionkarazhansky | environments\stars\legioninvasion_karazhansky.mdx
      normalizedName = 'karazhan',
    },
    [351] = { ---------------- Karazhan
      lightParamId = nil,
      skyboxFileDataID = 1522824, -- Retrieval method: fuzzy name match -> legioninvasionkarazhansky | environments\stars\legioninvasion_karazhansky.mdx
      normalizedName = 'karazhan',
    },
    [352] = { ---------------- Karazhan
      lightParamId = nil,
      skyboxFileDataID = 1522824, -- Retrieval method: fuzzy name match -> legioninvasionkarazhansky | environments\stars\legioninvasion_karazhansky.mdx
      normalizedName = 'karazhan',
    },
    [353] = { ---------------- Karazhan
      lightParamId = nil,
      skyboxFileDataID = 1522824, -- Retrieval method: fuzzy name match -> legioninvasionkarazhansky | environments\stars\legioninvasion_karazhansky.mdx
      normalizedName = 'karazhan',
    },
    [354] = { ---------------- Karazhan
      lightParamId = nil,
      skyboxFileDataID = 1522824, -- Retrieval method: fuzzy name match -> legioninvasionkarazhansky | environments\stars\legioninvasion_karazhansky.mdx
      normalizedName = 'karazhan',
    },
    [355] = { ---------------- Karazhan
      lightParamId = nil,
      skyboxFileDataID = 1522824, -- Retrieval method: fuzzy name match -> legioninvasionkarazhansky | environments\stars\legioninvasion_karazhansky.mdx
      normalizedName = 'karazhan',
    },
    [356] = { ---------------- Karazhan
      lightParamId = nil,
      skyboxFileDataID = 1522824, -- Retrieval method: fuzzy name match -> legioninvasionkarazhansky | environments\stars\legioninvasion_karazhansky.mdx
      normalizedName = 'karazhan',
    },
    [357] = { ---------------- Karazhan
      lightParamId = nil,
      skyboxFileDataID = 1522824, -- Retrieval method: fuzzy name match -> legioninvasionkarazhansky | environments\stars\legioninvasion_karazhansky.mdx
      normalizedName = 'karazhan',
    },
    [358] = { ---------------- Karazhan
      lightParamId = nil,
      skyboxFileDataID = 1522824, -- Retrieval method: fuzzy name match -> legioninvasionkarazhansky | environments\stars\legioninvasion_karazhansky.mdx
      normalizedName = 'karazhan',
    },
    [359] = { ---------------- Karazhan
      lightParamId = nil,
      skyboxFileDataID = 1522824, -- Retrieval method: fuzzy name match -> legioninvasionkarazhansky | environments\stars\legioninvasion_karazhansky.mdx
      normalizedName = 'karazhan',
    },
    [360] = { ---------------- Karazhan
      lightParamId = nil,
      skyboxFileDataID = 1522824, -- Retrieval method: fuzzy name match -> legioninvasionkarazhansky | environments\stars\legioninvasion_karazhansky.mdx
      normalizedName = 'karazhan',
    },
    [361] = { ---------------- Karazhan
      lightParamId = nil,
      skyboxFileDataID = 1522824, -- Retrieval method: fuzzy name match -> legioninvasionkarazhansky | environments\stars\legioninvasion_karazhansky.mdx
      normalizedName = 'karazhan',
    },
    [362] = { ---------------- Karazhan
      lightParamId = nil,
      skyboxFileDataID = 1522824, -- Retrieval method: fuzzy name match -> legioninvasionkarazhansky | environments\stars\legioninvasion_karazhansky.mdx
      normalizedName = 'karazhan',
    },
    [363] = { ---------------- Karazhan
      lightParamId = nil,
      skyboxFileDataID = 1522824, -- Retrieval method: fuzzy name match -> legioninvasionkarazhansky | environments\stars\legioninvasion_karazhansky.mdx
      normalizedName = 'karazhan',
    },
    [364] = { ---------------- Karazhan
      lightParamId = nil,
      skyboxFileDataID = 1522824, -- Retrieval method: fuzzy name match -> legioninvasionkarazhansky | environments\stars\legioninvasion_karazhansky.mdx
      normalizedName = 'karazhan',
    },
    [365] = { ---------------- Karazhan
      lightParamId = nil,
      skyboxFileDataID = 1522824, -- Retrieval method: fuzzy name match -> legioninvasionkarazhansky | environments\stars\legioninvasion_karazhansky.mdx
      normalizedName = 'karazhan',
    },
    [366] = { ---------------- Karazhan
      lightParamId = nil,
      skyboxFileDataID = 1522824, -- Retrieval method: fuzzy name match -> legioninvasionkarazhansky | environments\stars\legioninvasion_karazhansky.mdx
      normalizedName = 'karazhan',
    },
  },
  [720] = {
    [367] = { ---------------- Firelands
      lightParamId = 3042,
      skyboxFileDataID = 512948, -- Retrieval method: skyboxId (132) -> firelandssky | environments\stars\firelandssky01.mdx
      normalizedName = 'firelands',
    },
    [369] = { ---------------- Firelands
      lightParamId = 3042,
      skyboxFileDataID = 512948, -- Retrieval method: skyboxId (132) -> firelandssky | environments\stars\firelandssky01.mdx
      normalizedName = 'firelands',
    },
    [368] = { ---------------- Firelands
      lightParamId = 3042,
      skyboxFileDataID = 512948, -- Retrieval method: skyboxId (132) -> firelandssky | environments\stars\firelandssky01.mdx
      normalizedName = 'firelands',
    },
  },
  [951] = {
    [370] = { ---------------- The Nexus
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thenexus',
    },
  },
  [870] = {
    [371] = { ---------------- The Jade Forest
      lightParamId = 1106,
      skyboxFileDataID = 533473, -- Retrieval method: skyboxId (184) -> jadeforestsky | environments\stars\jadeforestsky01.mdx
      normalizedName = 'thejadeforest',
    },
    [372] = { ---------------- Greenstone Quarry
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'greenstonequarry',
    },
    [373] = { ---------------- Greenstone Quarry
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'greenstonequarry',
    },
    [374] = { ---------------- The Widow's Wail
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thewidowswail',
    },
    [375] = { ---------------- Oona Kagu
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'oonakagu',
    },
    [376] = { ---------------- Valley of the Four Winds
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'valleyofthefourwinds',
    },
    [377] = { ---------------- Cavern of Endless Echoes
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'cavernofendlessechoes',
    },
    [379] = { ---------------- Kun-Lai Summit
      lightParamId = 776,
      skyboxFileDataID = 603491, -- Retrieval method: skyboxId (212) -> kunlaiskymountain | environments\stars\kunlaiskymountain01.mdx
      normalizedName = 'kunlaisummit',
    },
    [380] = { ---------------- Howlingwind Cavern
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'howlingwindcavern',
    },
    [381] = { ---------------- Pranksters' Hollow
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'prankstershollow',
    },
    [382] = { ---------------- Knucklethump Hole
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'knucklethumphole',
    },
    [383] = { ---------------- The Deeper
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thedeeper',
    },
    [384] = { ---------------- The Deeper
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thedeeper',
    },
    [385] = { ---------------- Tomb of Conquerors
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'tombofconquerors',
    },
    [386] = { ---------------- Ruins of Korune
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ruinsofkorune',
    },
    [387] = { ---------------- Ruins of Korune
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ruinsofkorune',
    },
    [388] = { ---------------- Townlong Steppes
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'townlongsteppes',
    },
    [389] = { ---------------- Niuzao Temple
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'niuzaotemple',
    },
    [390] = { ---------------- Vale of Eternal Blossoms
      lightParamId = 1117,
      skyboxFileDataID = 1607565, -- Retrieval method: skyboxId (209) -> valleyeternalskylayerm | Environments\Stars\ValleyEternalSky01_Layer01.m2
      normalizedName = 'valeofeternalblossoms',
    },
    [391] = { ---------------- Shrine of Two Moons
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'shrineoftwomoons',
    },
    [392] = { ---------------- Shrine of Two Moons
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'shrineoftwomoons',
    },
    [393] = { ---------------- Shrine of Seven Stars
      lightParamId = nil,
      skyboxFileDataID = 130629, -- Retrieval method: fuzzy name match -> stars  combine with procedural | environments\stars\stars.mdx - combine with procedural
      normalizedName = 'shrineofsevenstars',
    },
    [394] = { ---------------- Shrine of Seven Stars
      lightParamId = nil,
      skyboxFileDataID = 130629, -- Retrieval method: fuzzy name match -> stars  combine with procedural | environments\stars\stars.mdx - combine with procedural
      normalizedName = 'shrineofsevenstars',
    },
    [395] = { ---------------- Guo-Lai Halls
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'guolaihalls',
    },
    [396] = { ---------------- Guo-Lai Halls
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'guolaihalls',
    },
    [418] = { ---------------- Krasarang Wilds
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'krasarangwilds',
    },
    [419] = { ---------------- Ruins of Ogudei
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ruinsofogudei',
    },
    [420] = { ---------------- Ruins of Ogudei
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ruinsofogudei',
    },
    [421] = { ---------------- Ruins of Ogudei
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ruinsofogudei',
    },
    [422] = { ---------------- Dread Wastes
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'dreadwastes',
    },
    [424] = { ---------------- Pandaria
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'pandaria',
    },
    [433] = { ---------------- The Veiled Stair
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theveiledstair',
    },
    [434] = { ---------------- The Ancient Passage
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theancientpassage',
    },
    [507] = { ---------------- Isle of Giants
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'isleofgiants',
    },
    [554] = { ---------------- Timeless Isle
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'timelessisle',
    },
    [555] = { ---------------- Cavern of Lost Spirits
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'cavernoflostspirits',
    },
    [947] = { ---------------- Azeroth
      lightParamId = nil,
      skyboxFileDataID = 527828, -- Retrieval method: fuzzy name match -> fallofazeroth | environments\stars\fallofazeroth01.mdx
      normalizedName = 'azeroth',
    },
    [989] = { ---------------- Pandaria
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'pandaria',
    },
    [1530] = { --------------- Vale of Eternal Blossoms
      lightParamId = 1117,
      skyboxFileDataID = 1607565, -- Retrieval method: skyboxId (209) -> valleyeternalskylayerm | Environments\Stars\ValleyEternalSky01_Layer01.m2
      normalizedName = 'valeofeternalblossoms',
    },
    [1579] = { --------------- Pools Of Power
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'poolsofpower',
    },
    [1923] = { --------------- Pandaria
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'pandaria',
    },
  },
  [860] = {
    [378] = { ---------------- The Wandering Isle
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thewanderingisle',
    },
  },
  [968] = {
    [397] = { ---------------- Eye of the Storm
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'eyeofthestorm',
    },
  },
  [939] = {
    [398] = { ---------------- Well of Eternity
      lightParamId = nil,
      skyboxFileDataID = 537118, -- Retrieval method: fuzzy name match -> woe fog blend | WoE Fog Blend
      normalizedName = 'wellofeternity',
    },
  },
  [940] = {
    [399] = { ---------------- Hour of Twilight
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'houroftwilight',
    },
    [400] = { ---------------- Hour of Twilight
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'houroftwilight',
    },
  },
  [938] = {
    [401] = { ---------------- End Time
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'endtime',
    },
    [402] = { ---------------- End Time
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'endtime',
    },
    [403] = { ---------------- End Time
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'endtime',
    },
    [404] = { ---------------- End Time
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'endtime',
    },
    [405] = { ---------------- End Time
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'endtime',
    },
    [406] = { ---------------- End Time
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'endtime',
    },
  },
  [974] = {
    [407] = { ---------------- Darkmoon Island
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'darkmoonisland',
    },
    [408] = { ---------------- Darkmoon Island
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'darkmoonisland',
    },
  },
  [967] = {
    [409] = { ---------------- Dragon Soul
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'dragonsoul',
    },
    [410] = { ---------------- Dragon Soul
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'dragonsoul',
    },
    [411] = { ---------------- Dragon Soul
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'dragonsoul',
    },
    [412] = { ---------------- Dragon Soul
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'dragonsoul',
    },
    [413] = { ---------------- Dragon Soul
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'dragonsoul',
    },
    [414] = { ---------------- Dragon Soul
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'dragonsoul',
    },
    [415] = { ---------------- Dragon Soul
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'dragonsoul',
    },
  },
  [999] = {
    [416] = { ---------------- Dustwallow Marsh
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'dustwallowmarsh',
    },
  },
  [998] = {
    [417] = { ---------------- Temple of Kotmogu
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'templeofkotmogu',
    },
  },
  [1062] = {
    [419] = { ---------------- Ruins of Ogudei
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ruinsofogudei',
    },
    [420] = { ---------------- Ruins of Ogudei
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ruinsofogudei',
    },
    [421] = { ---------------- Ruins of Ogudei
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ruinsofogudei',
    },
  },
  [727] = {
    [423] = { ---------------- Silvershard Mines
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'silvershardmines',
    },
  },
  [960] = {
    [429] = { ---------------- Temple of the Jade Serpent
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'templeofthejadeserpent',
    },
    [430] = { ---------------- Temple of the Jade Serpent
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'templeofthejadeserpent',
    },
  },
  [1001] = {
    [431] = { ---------------- Scarlet Halls
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'scarlethalls',
    },
    [432] = { ---------------- Scarlet Halls
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'scarlethalls',
    },
  },
  [962] = {
    [437] = { ---------------- Gate of the Setting Sun
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'gateofthesettingsun',
    },
    [438] = { ---------------- Gate of the Setting Sun
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'gateofthesettingsun',
    },
  },
  [961] = {
    [439] = { ---------------- Stormstout Brewery
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'stormstoutbrewery',
    },
    [440] = { ---------------- Stormstout Brewery
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'stormstoutbrewery',
    },
    [441] = { ---------------- Stormstout Brewery
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'stormstoutbrewery',
    },
    [442] = { ---------------- Stormstout Brewery
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'stormstoutbrewery',
    },
  },
  [959] = {
    [443] = { ---------------- Shado-Pan Monastery
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'shadopanmonastery',
    },
    [444] = { ---------------- Shado-Pan Monastery
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'shadopanmonastery',
    },
    [445] = { ---------------- Shado-Pan Monastery
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'shadopanmonastery',
    },
    [446] = { ---------------- Shado-Pan Monastery
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'shadopanmonastery',
    },
  },
  [1005] = {
    [447] = { ---------------- A Brewing Storm
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'abrewingstorm',
    },
  },
  [1024] = {
    [448] = { ---------------- The Jade Forest
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thejadeforest',
    },
  },
  [1035] = {
    [449] = { ---------------- Temple of Kotmogu
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'templeofkotmogu',
    },
  },
  [1048] = {
    [450] = { ---------------- Unga Ingoo
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ungaingoo',
    },
  },
  [1050] = {
    [451] = { ---------------- Assault on Zan'vess
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'assaultonzanvess',
    },
  },
  [1051] = {
    [452] = { ---------------- Brewmoon Festival
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'brewmoonfestival',
    },
  },
  [994] = {
    [453] = { ---------------- Mogu'shan Palace
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'mogushanpalace',
    },
    [454] = { ---------------- Mogu'shan Palace
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'mogushanpalace',
    },
    [455] = { ---------------- Mogu'shan Palace
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'mogushanpalace',
    },
  },
  [996] = {
    [456] = { ---------------- Terrace of Endless Spring
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'terraceofendlessspring',
    },
  },
  [1011] = {
    [457] = { ---------------- Siege of Niuzao Temple
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'siegeofniuzaotemple',
    },
    [458] = { ---------------- Siege of Niuzao Temple
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'siegeofniuzaotemple',
    },
    [459] = { ---------------- Siege of Niuzao Temple
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'siegeofniuzaotemple',
    },
  },
  [1008] = {
    [471] = { ---------------- Mogu'shan Vaults
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'mogushanvaults',
    },
    [472] = { ---------------- Mogu'shan Vaults
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'mogushanvaults',
    },
    [473] = { ---------------- Mogu'shan Vaults
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'mogushanvaults',
    },
  },
  [1009] = {
    [474] = { ---------------- Heart of Fear
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'heartoffear',
    },
    [475] = { ---------------- Heart of Fear
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'heartoffear',
    },
  },
  [1007] = {
    [476] = { ---------------- Scholomance
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'scholomance',
    },
    [477] = { ---------------- Scholomance
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'scholomance',
    },
    [478] = { ---------------- Scholomance
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'scholomance',
    },
    [479] = { ---------------- Scholomance
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'scholomance',
    },
  },
  [1148] = {
    [480] = { ---------------- Proving Grounds
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'provinggrounds',
    },
  },
  [1030] = {
    [481] = { ---------------- Crypt of Forgotten Kings
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'cryptofforgottenkings',
    },
    [482] = { ---------------- Crypt of Forgotten Kings
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'cryptofforgottenkings',
    },
  },
  [1000] = {
    [483] = { ---------------- Dustwallow Marsh
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'dustwallowmarsh',
    },
  },
  [1103] = {
    [486] = { ---------------- Krasarang Wilds
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'krasarangwilds',
    },
  },
  [1104] = {
    [487] = { ---------------- A Little Patience
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'alittlepatience',
    },
  },
  [1095] = {
    [488] = { ---------------- Dagger in the Dark
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'daggerinthedark',
    },
    [489] = { ---------------- Dagger in the Dark
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'daggerinthedark',
    },
  },
  [1112] = {
    [490] = { ---------------- Black Temple
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blacktemple',
    },
    [491] = { ---------------- Black Temple
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blacktemple',
    },
    [492] = { ---------------- Black Temple
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blacktemple',
    },
    [493] = { ---------------- Black Temple
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blacktemple',
    },
    [494] = { ---------------- Black Temple
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blacktemple',
    },
    [495] = { ---------------- Black Temple
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blacktemple',
    },
    [496] = { ---------------- Black Temple
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blacktemple',
    },
    [497] = { ---------------- Black Temple
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blacktemple',
    },
  },
  [1102] = {
    [498] = { ---------------- Krasarang Wilds
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'krasarangwilds',
    },
  },
  [369] = {
    [499] = { ---------------- Deeprun Tram
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'deepruntram',
    },
    [500] = { ---------------- Deeprun Tram
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'deepruntram',
    },
  },
  [1106] = {
    [501] = { ---------------- Dalaran
      lightParamId = nil,
      skyboxFileDataID = 235302, -- Retrieval method: fuzzy name match -> dalaran | ENVIRONMENTS\Stars\DalaranSkyBox.mdx
      normalizedName = 'dalaran',
    },
    [502] = { ---------------- Dalaran
      lightParamId = nil,
      skyboxFileDataID = 235302, -- Retrieval method: fuzzy name match -> dalaran | ENVIRONMENTS\Stars\DalaranSkyBox.mdx
      normalizedName = 'dalaran',
    },
  },
  [1043] = {
    [503] = { ---------------- Brawl'gar Arena
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'brawlgararena',
    },
  },
  [1064] = {
    [504] = { ---------------- Isle of Thunder
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'isleofthunder',
    },
    [505] = { ---------------- Lightning Vein Mine
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'lightningveinmine',
    },
    [506] = { ---------------- The Swollen Vault
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theswollenvault',
    },
    [424] = { ---------------- Pandaria
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'pandaria',
    },
    [989] = { ---------------- Pandaria
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'pandaria',
    },
    [1923] = { --------------- Pandaria
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'pandaria',
    },
  },
  [1098] = {
    [508] = { ---------------- Throne of Thunder
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'throneofthunder',
    },
    [509] = { ---------------- Throne of Thunder
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'throneofthunder',
    },
    [510] = { ---------------- Throne of Thunder
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'throneofthunder',
    },
    [511] = { ---------------- Throne of Thunder
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'throneofthunder',
    },
    [512] = { ---------------- Throne of Thunder
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'throneofthunder',
    },
    [513] = { ---------------- Throne of Thunder
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'throneofthunder',
    },
    [514] = { ---------------- Throne of Thunder
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'throneofthunder',
    },
    [515] = { ---------------- Throne of Thunder
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'throneofthunder',
    },
  },
  [1126] = {
    [516] = { ---------------- Isle of Thunder
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'isleofthunder',
    },
    [517] = { ---------------- Lightning Vein Mine
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'lightningveinmine',
    },
  },
  [1135] = {
    [518] = { ---------------- Thunder King's Citadel
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thunderkingscitadel',
    },
  },
  [1105] = {
    [519] = { ---------------- Deepwind Gorge
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'deepwindgorge',
    },
  },
  [1144] = {
    [520] = { ---------------- Vale of Eternal Blossoms
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'valeofeternalblossoms',
    },
    [521] = { ---------------- Vale of Eternal Blossoms
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'valeofeternalblossoms',
    },
  },
  [1131] = {
    [522] = { ---------------- The Secrets of Ragefire
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thesecretsofragefire',
    },
  },
  [1130] = {
    [523] = { ---------------- Dun Morogh
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'dunmorogh',
    },
  },
  [1099] = {
    [524] = { ---------------- Battle on the High Seas
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'battleonthehighseas',
    },
  },
  [1116] = {
    [525] = { ---------------- Frostfire Ridge
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'frostfireridge',
    },
    [526] = { ---------------- Turgall's Den
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'turgallsden',
    },
    [527] = { ---------------- Turgall's Den
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'turgallsden',
    },
    [528] = { ---------------- Turgall's Den
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'turgallsden',
    },
    [529] = { ---------------- Turgall's Den
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'turgallsden',
    },
    [530] = { ---------------- Grom'gar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'gromgar',
    },
    [531] = { ---------------- Grulloc's Grotto
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'grullocsgrotto',
    },
    [532] = { ---------------- Grulloc's Grotto
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'grullocsgrotto',
    },
    [533] = { ---------------- Snowfall Alcove
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'snowfallalcove',
    },
    [534] = { ---------------- Tanaan Jungle
      lightParamId = 3072,
      skyboxFileDataID = 1116024, -- Retrieval method: skyboxId (290) -> tanaanpatchjunglesky | environments\stars\tanaan_patch_junglesky01.mdx
      normalizedName = 'tanaanjungle',
    },
    [535] = { ---------------- Talador
      lightParamId = 1886,
      skyboxFileDataID = 849101, -- Retrieval method: skyboxId (237) -> taladorsky | environments\stars\talador_sky01.mdx
      normalizedName = 'talador',
    },
    [536] = { ---------------- Tomb of Lights
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'tomboflights',
    },
    [537] = { ---------------- Tomb of Souls
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'tombofsouls',
    },
    [538] = { ---------------- The Breached Ossuary
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thebreachedossuary',
    },
    [539] = { ---------------- Shadowmoon Valley
      lightParamId = 1938,
      skyboxFileDataID = 798530, -- Retrieval method: skyboxId (232) -> shadowmoonsky | environments\stars\shadowmoon_sky01.mdx
      normalizedName = 'shadowmoonvalley',
    },
    [540] = { ---------------- Bloodthorn Cave
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'bloodthorncave',
    },
    [541] = { ---------------- Den of Secrets
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'denofsecrets',
    },
    [542] = { ---------------- Spires of Arak
      lightParamId = 1718,
      skyboxFileDataID = 982341, -- Retrieval method: skyboxId (262) -> spiresofarraksky | environments\stars\spiresofarrak_sky01.mdx
      normalizedName = 'spiresofarak',
    },
    [543] = { ---------------- Gorgrond
      lightParamId = 1860,
      skyboxFileDataID = 987192, -- Retrieval method: skyboxId (266) -> gorgronddrysky | environments\stars\gorgronddry_sky01.mdx
      normalizedName = 'gorgrond',
    },
    [544] = { ---------------- Moira's Reach
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'moirasreach',
    },
    [545] = { ---------------- Moira's Reach
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'moirasreach',
    },
    [546] = { ---------------- Fissure of Fury
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'fissureoffury',
    },
    [547] = { ---------------- Fissure of Fury
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'fissureoffury',
    },
    [548] = { ---------------- Cragplume Cauldron
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'cragplumecauldron',
    },
    [549] = { ---------------- Cragplume Cauldron
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'cragplumecauldron',
    },
    [550] = { ---------------- Nagrand
      lightParamId = 1800,
      skyboxFileDataID = 960027, -- Retrieval method: skyboxId (253) -> nagrandsky | environments\stars\nagrand_sky01.mdx
      normalizedName = 'nagrand',
    },
    [551] = { ---------------- The Masters' Cavern
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'themasterscavern',
    },
    [552] = { ---------------- Stonecrag Gorge
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'stonecraggorge',
    },
    [553] = { ---------------- Oshu'gun
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'oshugun',
    },
    [572] = { ---------------- Draenor
      lightParamId = nil,
      skyboxFileDataID = 1084862, -- Retrieval method: fuzzy name match -> draenorcloudysky | environments\stars\draenor_cloudysky01.mdx
      normalizedName = 'draenor',
    },
    [579] = { ---------------- Lunarfall Excavation
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'lunarfallexcavation',
    },
    [580] = { ---------------- Lunarfall Excavation
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'lunarfallexcavation',
    },
    [581] = { ---------------- Lunarfall Excavation
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'lunarfallexcavation',
    },
    [582] = { ---------------- Lunarfall
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'lunarfall',
    },
    [585] = { ---------------- Frostwall Mine
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'frostwallmine',
    },
    [586] = { ---------------- Frostwall Mine
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'frostwallmine',
    },
    [587] = { ---------------- Frostwall Mine
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'frostwallmine',
    },
    [588] = { ---------------- Ashran
      lightParamId = 1944,
      skyboxFileDataID = 1065384, -- Retrieval method: skyboxId (280) -> ashransky | environments\stars\ashran_sky01.mdx
      normalizedName = 'ashran',
    },
    [589] = { ---------------- Ashran Mine
      lightParamId = 1944,
      skyboxFileDataID = 1065384, -- Retrieval method: skyboxId (280) -> ashransky | environments\stars\ashran_sky01.mdx
      normalizedName = 'ashranmine',
    },
    [590] = { ---------------- Frostwall
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'frostwall',
    },
    [622] = { ---------------- Stormshield
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'stormshield',
    },
    [624] = { ---------------- Warspear
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'warspear',
    },
    [990] = { ---------------- Draenor
      lightParamId = nil,
      skyboxFileDataID = 1084862, -- Retrieval method: fuzzy name match -> draenorcloudysky | environments\stars\draenor_cloudysky01.mdx
      normalizedName = 'draenor',
    },
    [1922] = { --------------- Draenor
      lightParamId = nil,
      skyboxFileDataID = 1084862, -- Retrieval method: fuzzy name match -> draenorcloudysky | environments\stars\draenor_cloudysky01.mdx
      normalizedName = 'draenor',
    },
  },
  [1136] = {
    [556] = { ---------------- Siege of Orgrimmar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'siegeoforgrimmar',
    },
    [557] = { ---------------- Siege of Orgrimmar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'siegeoforgrimmar',
    },
    [558] = { ---------------- Siege of Orgrimmar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'siegeoforgrimmar',
    },
    [561] = { ---------------- Siege of Orgrimmar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'siegeoforgrimmar',
    },
    [562] = { ---------------- Siege of Orgrimmar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'siegeoforgrimmar',
    },
    [563] = { ---------------- Siege of Orgrimmar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'siegeoforgrimmar',
    },
    [564] = { ---------------- Siege of Orgrimmar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'siegeoforgrimmar',
    },
    [565] = { ---------------- Siege of Orgrimmar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'siegeoforgrimmar',
    },
    [566] = { ---------------- Siege of Orgrimmar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'siegeoforgrimmar',
    },
    [567] = { ---------------- Siege of Orgrimmar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'siegeoforgrimmar',
    },
    [568] = { ---------------- Siege of Orgrimmar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'siegeoforgrimmar',
    },
    [569] = { ---------------- Siege of Orgrimmar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'siegeoforgrimmar',
    },
    [570] = { ---------------- Siege of Orgrimmar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'siegeoforgrimmar',
    },
    [559] = { ---------------- Siege of Orgrimmar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'siegeoforgrimmar',
    },
    [560] = { ---------------- Siege of Orgrimmar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'siegeoforgrimmar',
    },
  },
  [1161] = {
    [571] = { ---------------- Celestial Tournament
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'celestialtournament',
    },
  },
  [1175] = {
    [573] = { ---------------- Bloodmaul Slag Mines
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'bloodmaulslagmines',
    },
  },
  [1176] = {
    [574] = { ---------------- Shadowmoon Burial Grounds
      lightParamId = nil,
      skyboxFileDataID = 130623, -- Retrieval method: fuzzy name match -> shadowmoon | environments\stars\shadowmoonskybox.mdx
      normalizedName = 'shadowmoonburialgrounds',
    },
    [575] = { ---------------- Shadowmoon Burial Grounds
      lightParamId = nil,
      skyboxFileDataID = 130623, -- Retrieval method: fuzzy name match -> shadowmoon | environments\stars\shadowmoonskybox.mdx
      normalizedName = 'shadowmoonburialgrounds',
    },
    [576] = { ---------------- Shadowmoon Burial Grounds
      lightParamId = nil,
      skyboxFileDataID = 130623, -- Retrieval method: fuzzy name match -> shadowmoon | environments\stars\shadowmoonskybox.mdx
      normalizedName = 'shadowmoonburialgrounds',
    },
  },
  [1265] = {
    [577] = { ---------------- Tanaan Jungle
      lightParamId = 2106,
      skyboxFileDataID = 1112625, -- Retrieval method: skyboxId (291) -> tanaanpatchsky | environments\stars\tanaan_patch_sky01.mdx
      normalizedName = 'tanaanjungle',
    },
    [578] = { ---------------- Umbral Halls
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'umbralhalls',
    },
  },
  [1182] = {
    [593] = { ---------------- Auchindoun
      lightParamId = nil,
      skyboxFileDataID = 979849, -- Retrieval method: fuzzy name match -> auchindounfinalesky | environments\stars\auchindoun_finale_sky.mdx
      normalizedName = 'auchindoun',
    },
  },
  [1207] = {
    [594] = { ---------------- Shattrath City
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'shattrathcity',
    },
  },
  [1195] = {
    [595] = { ---------------- Iron Docks
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'irondocks',
    },
  },
  [1205] = {
    [596] = { ---------------- Blackrock Foundry
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackrockfoundry',
    },
    [597] = { ---------------- Blackrock Foundry
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackrockfoundry',
    },
    [598] = { ---------------- Blackrock Foundry
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackrockfoundry',
    },
    [599] = { ---------------- Blackrock Foundry
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackrockfoundry',
    },
    [600] = { ---------------- Blackrock Foundry
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackrockfoundry',
    },
  },
  [1209] = {
    [601] = { ---------------- Skyreach
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'skyreach',
    },
    [602] = { ---------------- Skyreach
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'skyreach',
    },
  },
  [1208] = {
    [606] = { ---------------- Grimrail Depot
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'grimraildepot',
    },
    [607] = { ---------------- Grimrail Depot
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'grimraildepot',
    },
    [608] = { ---------------- Grimrail Depot
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'grimraildepot',
    },
    [572] = { ---------------- Draenor
      lightParamId = nil,
      skyboxFileDataID = 1084862, -- Retrieval method: fuzzy name match -> draenorcloudysky | environments\stars\draenor_cloudysky01.mdx
      normalizedName = 'draenor',
    },
    [609] = { ---------------- Grimrail Depot
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'grimraildepot',
    },
  },
  [1228] = {
    [610] = { ---------------- Highmaul
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'highmaul',
    },
    [611] = { ---------------- Highmaul
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'highmaul',
    },
    [612] = { ---------------- Highmaul
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'highmaul',
    },
    [613] = { ---------------- Highmaul
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'highmaul',
    },
    [614] = { ---------------- Highmaul
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'highmaul',
    },
    [615] = { ---------------- Highmaul
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'highmaul',
    },
  },
  [1358] = {
    [616] = { ---------------- Upper Blackrock Spire
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'upperblackrockspire',
    },
    [617] = { ---------------- Upper Blackrock Spire
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'upperblackrockspire',
    },
    [618] = { ---------------- Upper Blackrock Spire
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'upperblackrockspire',
    },
  },
  [1279] = {
    [620] = { ---------------- The Everbloom
      lightParamId = 1892,
      skyboxFileDataID = 987153, -- Retrieval method: skyboxId (265) -> gorgrondsky | environments\stars\gorgrond_sky01.mdx
      normalizedName = 'theeverbloom',
    },
    [621] = { ---------------- The Everbloom
      lightParamId = 1892,
      skyboxFileDataID = 987153, -- Retrieval method: skyboxId (265) -> gorgrondsky | environments\stars\gorgrond_sky01.mdx
      normalizedName = 'theeverbloom',
    },
  },
  [1280] = {
    [623] = { ---------------- Hillsbrad Foothills (Southshore vs. Tarren Mill)
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'hillsbradfoothillssouthshorevstarrenmill',
    },
  },
  [1220] = {
    [626] = { ---------------- Dalaran
      lightParamId = nil,
      skyboxFileDataID = 235302, -- Retrieval method: fuzzy name match -> dalaran | ENVIRONMENTS\Stars\DalaranSkyBox.mdx
      normalizedName = 'dalaran',
    },
    [627] = { ---------------- Dalaran
      lightParamId = nil,
      skyboxFileDataID = 235302, -- Retrieval method: fuzzy name match -> dalaran | ENVIRONMENTS\Stars\DalaranSkyBox.mdx
      normalizedName = 'dalaran',
    },
    [628] = { ---------------- Dalaran
      lightParamId = nil,
      skyboxFileDataID = 235302, -- Retrieval method: fuzzy name match -> dalaran | ENVIRONMENTS\Stars\DalaranSkyBox.mdx
      normalizedName = 'dalaran',
    },
    [629] = { ---------------- Dalaran
      lightParamId = nil,
      skyboxFileDataID = 235302, -- Retrieval method: fuzzy name match -> dalaran | ENVIRONMENTS\Stars\DalaranSkyBox.mdx
      normalizedName = 'dalaran',
    },
    [630] = { ---------------- Azsuna
      lightParamId = 2089,
      skyboxFileDataID = 1112994, -- Retrieval method: skyboxId (289) -> azsunasky | environments\stars\azsuna_sky01.mdx
      normalizedName = 'azsuna',
    },
    [631] = { ---------------- Nar'thalas Academy
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'narthalasacademy',
    },
    [632] = { ---------------- Oceanus Cove
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'oceanuscove',
    },
    [633] = { ---------------- Temple of a Thousand Lights
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'templeofathousandlights',
    },
    [634] = { ---------------- Stormheim
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'stormheim',
    },
    [635] = { ---------------- Shield's Rest
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'shieldsrest',
    },
    [636] = { ---------------- Stormscale Cavern
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'stormscalecavern',
    },
    [637] = { ---------------- Thorignir Refuge
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thorignirrefuge',
    },
    [638] = { ---------------- Thorignir Refuge
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thorignirrefuge',
    },
    [639] = { ---------------- Aggramar's Vault
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'aggramarsvault',
    },
    [640] = { ---------------- Vault of Eyir
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'vaultofeyir',
    },
    [641] = { ---------------- Val'sharah
      lightParamId = 3064,
      skyboxFileDataID = 1368570, -- Retrieval method: skyboxId (311) -> valsharahskyenchanted | environments\stars\valsharah_sky01_enchanted.mdx
      normalizedName = 'valsharah',
    },
    [642] = { ---------------- Darkpens
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'darkpens',
    },
    [643] = { ---------------- Sleeper's Barrow
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sleepersbarrow',
    },
    [644] = { ---------------- Sleeper's Barrow
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sleepersbarrow',
    },
    [646] = { ---------------- Broken Shore
      lightParamId = 3201,
      skyboxFileDataID = 1243612, -- Retrieval method: skyboxId (308) -> brokenshoreskyfel | environments\stars\brokenshore_sky_fel01.mdx
      normalizedName = 'brokenshore',
    },
    [647] = { ---------------- Acherus: The Ebon Hold
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'acherustheebonhold',
    },
    [648] = { ---------------- Acherus: The Ebon Hold
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'acherustheebonhold',
    },
    [650] = { ---------------- Highmountain
      lightParamId = 2077,
      skyboxFileDataID = 1612982, -- Retrieval method: skyboxId (331) -> placeholder empty   morgan test | PLACEHOLDER Empty Skybox - Morgan Test
      normalizedName = 'highmountain',
    },
    [651] = { ---------------- Bitestone Enclave
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'bitestoneenclave',
    },
    [652] = { ---------------- Thunder Totem
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thundertotem',
    },
    [653] = { ---------------- Cave of the Blood Trial
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'caveofthebloodtrial',
    },
    [654] = { ---------------- Mucksnout Den
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'mucksnoutden',
    },
    [655] = { ---------------- Lifespring Cavern
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'lifespringcavern',
    },
    [656] = { ---------------- Lifespring Cavern
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'lifespringcavern',
    },
    [657] = { ---------------- Path of Huln
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'pathofhuln',
    },
    [658] = { ---------------- Path of Huln
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'pathofhuln',
    },
    [659] = { ---------------- Stonedark Grotto
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'stonedarkgrotto',
    },
    [660] = { ---------------- Feltotem Caverns
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'feltotemcaverns',
    },
    [680] = { ---------------- Suramar
      lightParamId = 3096,
      skyboxFileDataID = 1138059, -- Retrieval method: skyboxId (301) -> xp island jorundall fog blend | 8XP Island Jorundall Fog Blend
      normalizedName = 'suramar',
    },
    [681] = { ---------------- The Arcway Vaults
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thearcwayvaults',
    },
    [682] = { ---------------- Felsoul Hold
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'felsoulhold',
    },
    [683] = { ---------------- The Arcway Vaults
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thearcwayvaults',
    },
    [684] = { ---------------- Shattered Locus
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'shatteredlocus',
    },
    [685] = { ---------------- Shattered Locus
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'shatteredlocus',
    },
    [686] = { ---------------- Elor'shan
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'elorshan',
    },
    [687] = { ---------------- Kel'balor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'kelbalor',
    },
    [688] = { ---------------- Ley Station Anora
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'leystationanora',
    },
    [689] = { ---------------- Ley Station Moonfall
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'leystationmoonfall',
    },
    [690] = { ---------------- Ley Station Aethenar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'leystationaethenar',
    },
    [691] = { ---------------- Nyell's Workshop
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'nyellsworkshop',
    },
    [692] = { ---------------- Falanaar Arcway
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'falanaararcway',
    },
    [693] = { ---------------- Falanaar Arcway
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'falanaararcway',
    },
    [739] = { ---------------- Trueshot Lodge
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'trueshotlodge',
    },
    [747] = { ---------------- The Dreamgrove
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thedreamgrove',
    },
    [750] = { ---------------- Thunder Totem
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thundertotem',
    },
    [790] = { ---------------- Eye of Azshara
      lightParamId = 2089,
      skyboxFileDataID = 1112994, -- Retrieval method: skyboxId (289) -> azsunasky | environments\stars\azsuna_sky01.mdx
      normalizedName = 'eyeofazshara',
    },
    [947] = { ---------------- Azeroth
      lightParamId = nil,
      skyboxFileDataID = 527828, -- Retrieval method: fuzzy name match -> fallofazeroth | environments\stars\fallofazeroth01.mdx
      normalizedName = 'azeroth',
    },
    [993] = { ---------------- Broken Isles
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'brokenisles',
    },
    [619] = { ---------------- Broken Isles
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'brokenisles',
    },
    [1187] = { --------------- Azsuna
      lightParamId = 2089,
      skyboxFileDataID = 1112994, -- Retrieval method: skyboxId (289) -> azsunasky | environments\stars\azsuna_sky01.mdx
      normalizedName = 'azsuna',
    },
    [1188] = { --------------- Val'sharah
      lightParamId = 3064,
      skyboxFileDataID = 1368570, -- Retrieval method: skyboxId (311) -> valsharahskyenchanted | environments\stars\valsharah_sky01_enchanted.mdx
      normalizedName = 'valsharah',
    },
    [1189] = { --------------- Highmountain
      lightParamId = 2077,
      skyboxFileDataID = 1612982, -- Retrieval method: skyboxId (331) -> placeholder empty   morgan test | PLACEHOLDER Empty Skybox - Morgan Test
      normalizedName = 'highmountain',
    },
    [1190] = { --------------- Stormheim
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'stormheim',
    },
    [1191] = { --------------- Suramar
      lightParamId = 3096,
      skyboxFileDataID = 1138059, -- Retrieval method: skyboxId (301) -> xp island jorundall fog blend | 8XP Island Jorundall Fog Blend
      normalizedName = 'suramar',
    },
    [1192] = { --------------- Broken Shore
      lightParamId = 3201,
      skyboxFileDataID = 1243612, -- Retrieval method: skyboxId (308) -> brokenshoreskyfel | environments\stars\brokenshore_sky_fel01.mdx
      normalizedName = 'brokenshore',
    },
    [2558] = { --------------- Derelict Legion Vessel
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'derelictlegionvessel',
    },
    [2557] = { --------------- Derelict Legion Vessel
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'derelictlegionvessel',
    },
  },
  [1462] = {
    [645] = { ---------------- Twisting Nether
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'twistingnether',
    },
  },
  [1463] = {
    [649] = { ---------------- Helheim
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'helheim',
    },
  },
  [1448] = {
    [661] = { ---------------- Hellfire Citadel
      lightParamId = 2112,
      skyboxFileDataID = 1119855, -- Retrieval method: skyboxId (292) -> tanaanpatchraidsky | environments\stars\tanaan_patch_raidsky01.mdx
      normalizedName = 'hellfirecitadel',
    },
    [662] = { ---------------- Hellfire Citadel
      lightParamId = 2112,
      skyboxFileDataID = 1119855, -- Retrieval method: skyboxId (292) -> tanaanpatchraidsky | environments\stars\tanaan_patch_raidsky01.mdx
      normalizedName = 'hellfirecitadel',
    },
    [663] = { ---------------- Hellfire Citadel
      lightParamId = 2112,
      skyboxFileDataID = 1119855, -- Retrieval method: skyboxId (292) -> tanaanpatchraidsky | environments\stars\tanaan_patch_raidsky01.mdx
      normalizedName = 'hellfirecitadel',
    },
    [664] = { ---------------- Hellfire Citadel
      lightParamId = 2112,
      skyboxFileDataID = 1119855, -- Retrieval method: skyboxId (292) -> tanaanpatchraidsky | environments\stars\tanaan_patch_raidsky01.mdx
      normalizedName = 'hellfirecitadel',
    },
    [665] = { ---------------- Hellfire Citadel
      lightParamId = 2112,
      skyboxFileDataID = 1119855, -- Retrieval method: skyboxId (292) -> tanaanpatchraidsky | environments\stars\tanaan_patch_raidsky01.mdx
      normalizedName = 'hellfirecitadel',
    },
    [666] = { ---------------- Hellfire Citadel
      lightParamId = 2112,
      skyboxFileDataID = 1119855, -- Retrieval method: skyboxId (292) -> tanaanpatchraidsky | environments\stars\tanaan_patch_raidsky01.mdx
      normalizedName = 'hellfirecitadel',
    },
    [667] = { ---------------- Hellfire Citadel
      lightParamId = 2112,
      skyboxFileDataID = 1119855, -- Retrieval method: skyboxId (292) -> tanaanpatchraidsky | environments\stars\tanaan_patch_raidsky01.mdx
      normalizedName = 'hellfirecitadel',
    },
    [668] = { ---------------- Hellfire Citadel
      lightParamId = 2112,
      skyboxFileDataID = 1119855, -- Retrieval method: skyboxId (292) -> tanaanpatchraidsky | environments\stars\tanaan_patch_raidsky01.mdx
      normalizedName = 'hellfirecitadel',
    },
    [669] = { ---------------- Hellfire Citadel
      lightParamId = 2112,
      skyboxFileDataID = 1119855, -- Retrieval method: skyboxId (292) -> tanaanpatchraidsky | environments\stars\tanaan_patch_raidsky01.mdx
      normalizedName = 'hellfirecitadel',
    },
    [670] = { ---------------- Hellfire Citadel
      lightParamId = 2112,
      skyboxFileDataID = 1119855, -- Retrieval method: skyboxId (292) -> tanaanpatchraidsky | environments\stars\tanaan_patch_raidsky01.mdx
      normalizedName = 'hellfirecitadel',
    },
  },
  [1475] = {
    [671] = { ---------------- The Cove of Nashal
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thecoveofnashal',
    },
  },
  [1481] = {
    [672] = { ---------------- Mardum, the Shattered Abyss
      lightParamId = 3079,
      skyboxFileDataID = 1251276, -- Retrieval method: skyboxId (315) -> mardumnether | environments\stars\Mardum_NetherSkyBox01.mdx
      normalizedName = 'mardumtheshatteredabyss',
    },
    [673] = { ---------------- Cryptic Hollow
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'cryptichollow',
    },
    [674] = { ---------------- Soul Engine
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'soulengine',
    },
    [675] = { ---------------- Soul Engine
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'soulengine',
    },
  },
  [1500] = {
    [676] = { ---------------- Broken Shore
      lightParamId = nil,
      skyboxFileDataID = 1243612, -- Retrieval method: fuzzy name match -> brokenshoreskyfel | environments\stars\brokenshore_sky_fel01.mdx
      normalizedName = 'brokenshore',
    },
  },
  [1468] = {
    [677] = { ---------------- Vault of the Wardens
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'vaultofthewardens',
    },
    [678] = { ---------------- Vault of the Wardens
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'vaultofthewardens',
    },
    [679] = { ---------------- Vault of the Wardens
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'vaultofthewardens',
    },
  },
  [1511] = {
    [694] = { ---------------- Helmouth Shallows
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'helmouthshallows',
    },
  },
  [1479] = {
    [695] = { ---------------- Skyhold
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'skyhold',
    },
  },
  [1495] = {
    [696] = { ---------------- Stormheim
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'stormheim',
    },
  },
  [1515] = {
    [697] = { ---------------- Azshara
      lightParamId = nil,
      skyboxFileDataID = 1365500, -- Retrieval method: fuzzy name match -> eyeofazsharasky | environments\stars\eyeofazshara_sky01.mdx
      normalizedName = 'azshara',
    },
  },
  [1480] = {
    [698] = { ---------------- Icecrown Citadel
      lightParamId = nil,
      skyboxFileDataID = 130551, -- Retrieval method: fuzzy name match -> icecrowncitadelsky | environments\stars\icecrowncitadelsky.mdx
      normalizedName = 'icecrowncitadel',
    },
    [699] = { ---------------- Icecrown Citadel
      lightParamId = nil,
      skyboxFileDataID = 130551, -- Retrieval method: fuzzy name match -> icecrowncitadelsky | environments\stars\icecrowncitadelsky.mdx
      normalizedName = 'icecrowncitadel',
    },
    [700] = { ---------------- Icecrown Citadel
      lightParamId = nil,
      skyboxFileDataID = 130551, -- Retrieval method: fuzzy name match -> icecrowncitadelsky | environments\stars\icecrowncitadelsky.mdx
      normalizedName = 'icecrowncitadel',
    },
    [701] = { ---------------- Icecrown Citadel
      lightParamId = nil,
      skyboxFileDataID = 130551, -- Retrieval method: fuzzy name match -> icecrowncitadelsky | environments\stars\icecrowncitadelsky.mdx
      normalizedName = 'icecrowncitadel',
    },
  },
  [1512] = {
    [702] = { ---------------- Netherlight Temple
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'netherlighttemple',
    },
  },
  [1477] = {
    [703] = { ---------------- Halls of Valor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'hallsofvalor',
    },
    [704] = { ---------------- Halls of Valor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'hallsofvalor',
    },
    [705] = { ---------------- Halls of Valor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'hallsofvalor',
    },
  },
  [1492] = {
    [706] = { ---------------- Helmouth Cliffs
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'helmouthcliffs',
    },
    [707] = { ---------------- Helmouth Cliffs
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'helmouthcliffs',
    },
    [708] = { ---------------- Helmouth Cliffs
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'helmouthcliffs',
    },
  },
  [1514] = {
    [709] = { ---------------- The Wandering Isle
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thewanderingisle',
    },
  },
  [1493] = {
    [710] = { ---------------- Vault of the Wardens
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'vaultofthewardens',
    },
    [711] = { ---------------- Vault of the Wardens
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'vaultofthewardens',
    },
    [712] = { ---------------- Vault of the Wardens
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'vaultofthewardens',
    },
  },
  [1456] = {
    [713] = { ---------------- Eye of Azshara
      lightParamId = nil,
      skyboxFileDataID = 1365500, -- Retrieval method: fuzzy name match -> eyeofazsharasky | environments\stars\eyeofazshara_sky01.mdx
      normalizedName = 'eyeofazshara',
    },
  },
  [1489] = {
    [714] = { ---------------- Niskara
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'niskara',
    },
  },
  [1540] = {
    [715] = { ---------------- Emerald Dreamway
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'emeralddreamway',
    },
  },
  [1528] = {
    [716] = { ---------------- Skywall
      lightParamId = nil,
      skyboxFileDataID = 366242, -- Retrieval method: fuzzy name match -> timewaystest | TimeWays_Test
      normalizedName = 'skywall',
    },
  },
  [1107] = {
    [717] = { ---------------- Dreadscar Rift
      lightParamId = nil,
      skyboxFileDataID = 1452745, -- Retrieval method: fuzzy name match -> dreadscarriftsky | environments\stars\dreadscarrift_sky01.mdx
      normalizedName = 'dreadscarrift',
    },
  },
  [1522] = {
    [718] = { ---------------- Dreadscar Rift
      lightParamId = nil,
      skyboxFileDataID = 1452745, -- Retrieval method: fuzzy name match -> dreadscarriftsky | environments\stars\dreadscarrift_sky01.mdx
      normalizedName = 'dreadscarrift',
    },
  },
  [1519] = {
    [719] = { ---------------- Mardum, the Shattered Abyss
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'mardumtheshatteredabyss',
    },
    [720] = { ---------------- Mardum, the Shattered Abyss
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'mardumtheshatteredabyss',
    },
    [721] = { ---------------- Mardum, the Shattered Abyss
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'mardumtheshatteredabyss',
    },
  },
  [1494] = {
    [723] = { ---------------- The Violet Hold
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theviolethold',
    },
  },
  [1572] = {
    [725] = { ---------------- The Maelstrom
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'themaelstrom',
    },
  },
  [1469] = {
    [726] = { ---------------- The Maelstrom
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'themaelstrom',
    },
  },
  [1541] = {
    [728] = { ---------------- Terrace of Endless Spring
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'terraceofendlessspring',
    },
  },
  [1503] = {
    [729] = { ---------------- Crumbling Depths
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'crumblingdepths',
    },
  },
  [1458] = {
    [731] = { ---------------- Neltharion's Lair
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'neltharionslair',
    },
  },
  [1544] = {
    [732] = { ---------------- Violet Hold
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'violethold',
    },
  },
  [1466] = {
    [733] = { ---------------- Darkheart Thicket
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'darkheartthicket',
    },
  },
  [1513] = {
    [734] = { ---------------- Hall of the Guardian
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'halloftheguardian',
    },
    [735] = { ---------------- Hall of the Guardian
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'halloftheguardian',
    },
  },
  [1583] = {
    [736] = { ---------------- The Beyond
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thebeyond',
    },
  },
  [1602] = {
    [737] = { ---------------- The Vortex Pinnacle
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thevortexpinnacle',
    },
  },
  [1605] = {
    [738] = { ---------------- Firelands
      lightParamId = nil,
      skyboxFileDataID = 512948, -- Retrieval method: fuzzy name match -> firelandssky | environments\stars\firelandssky01.mdx
      normalizedName = 'firelands',
    },
  },
  [1607] = {
    [740] = { ---------------- Shadowgore Citadel
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'shadowgorecitadel',
    },
    [741] = { ---------------- Shadowgore Citadel
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'shadowgorecitadel',
    },
  },
  [1600] = {
    [742] = { ---------------- Abyssal Maw
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'abyssalmaw',
    },
    [743] = { ---------------- Abyssal Maw
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'abyssalmaw',
    },
  },
  [1579] = {
    [744] = { ---------------- Ulduar
      lightParamId = nil,
      skyboxFileDataID = 1613362, -- Retrieval method: fuzzy name match -> stormpeaksskyculduarlayerm | Environments\Stars\StormPeaks_SkyC_Ulduar_Layer01.m2
      normalizedName = 'ulduar',
    },
    [745] = { ---------------- Ulduar
      lightParamId = nil,
      skyboxFileDataID = 1613362, -- Retrieval method: fuzzy name match -> stormpeaksskyculduarlayerm | Environments\Stars\StormPeaks_SkyC_Ulduar_Layer01.m2
      normalizedName = 'ulduar',
    },
    [746] = { ---------------- Ulduar
      lightParamId = nil,
      skyboxFileDataID = 1613362, -- Retrieval method: fuzzy name match -> stormpeaksskyculduarlayerm | Environments\Stars\StormPeaks_SkyC_Ulduar_Layer01.m2
      normalizedName = 'ulduar',
    },
  },
  [1604] = {
    [748] = { ---------------- Niskara
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'niskara',
    },
  },
  [1516] = {
    [749] = { ---------------- The Arcway
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thearcway',
    },
  },
  [1501] = {
    [751] = { ---------------- Black Rook Hold
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackrookhold',
    },
    [752] = { ---------------- Black Rook Hold
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackrookhold',
    },
    [753] = { ---------------- Black Rook Hold
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackrookhold',
    },
    [754] = { ---------------- Black Rook Hold
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackrookhold',
    },
    [755] = { ---------------- Black Rook Hold
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackrookhold',
    },
    [756] = { ---------------- Black Rook Hold
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackrookhold',
    },
  },
  [1536] = {
    [757] = { ---------------- Ursoc's Lair
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ursocslair',
    },
  },
  [1553] = {
    [758] = { ---------------- Gloaming Reef
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'gloamingreef',
    },
  },
  [1621] = {
    [759] = { ---------------- Black Temple
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blacktemple',
    },
  },
  [1608] = {
    [760] = { ---------------- Malorne's Nightmare
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'malornesnightmare',
    },
  },
  [1571] = {
    [761] = { ---------------- Court of Stars
      lightParamId = nil,
      skyboxFileDataID = 130629, -- Retrieval method: fuzzy name match -> stars  combine with procedural | environments\stars\stars.mdx - combine with procedural
      normalizedName = 'courtofstars',
    },
    [762] = { ---------------- Court of Stars
      lightParamId = nil,
      skyboxFileDataID = 130629, -- Retrieval method: fuzzy name match -> stars  combine with procedural | environments\stars\stars.mdx - combine with procedural
      normalizedName = 'courtofstars',
    },
    [763] = { ---------------- Court of Stars
      lightParamId = nil,
      skyboxFileDataID = 130629, -- Retrieval method: fuzzy name match -> stars  combine with procedural | environments\stars\stars.mdx - combine with procedural
      normalizedName = 'courtofstars',
    },
  },
  [1530] = {
    [764] = { ---------------- The Nighthold
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thenighthold',
    },
    [765] = { ---------------- The Nighthold
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thenighthold',
    },
    [766] = { ---------------- The Nighthold
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thenighthold',
    },
    [767] = { ---------------- The Nighthold
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thenighthold',
    },
    [768] = { ---------------- The Nighthold
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thenighthold',
    },
    [769] = { ---------------- The Nighthold
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thenighthold',
    },
    [770] = { ---------------- The Nighthold
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thenighthold',
    },
    [771] = { ---------------- The Nighthold
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thenighthold',
    },
    [772] = { ---------------- The Nighthold
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thenighthold',
    },
  },
  [1630] = {
    [773] = { ---------------- Tol Barad
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'tolbarad',
    },
    [774] = { ---------------- Tol Barad
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'tolbarad',
    },
  },
  [1624] = {
    [775] = { ---------------- The Exodar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theexodar',
    },
    [776] = { ---------------- Azuremyst Isle
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'azuremystisle',
    },
    [1331] = { --------------- The Exodar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theexodar',
    },
  },
  [1520] = {
    [777] = { ---------------- The Emerald Nightmare
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theemeraldnightmare',
    },
    [778] = { ---------------- The Emerald Nightmare
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theemeraldnightmare',
    },
    [779] = { ---------------- The Emerald Nightmare
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theemeraldnightmare',
    },
    [780] = { ---------------- The Emerald Nightmare
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theemeraldnightmare',
    },
    [781] = { ---------------- The Emerald Nightmare
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theemeraldnightmare',
    },
    [787] = { ---------------- The Emerald Nightmare
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theemeraldnightmare',
    },
    [782] = { ---------------- The Emerald Nightmare
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theemeraldnightmare',
    },
    [783] = { ---------------- The Emerald Nightmare
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theemeraldnightmare',
    },
    [784] = { ---------------- The Emerald Nightmare
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theemeraldnightmare',
    },
    [785] = { ---------------- The Emerald Nightmare
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theemeraldnightmare',
    },
    [786] = { ---------------- The Emerald Nightmare
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theemeraldnightmare',
    },
    [788] = { ---------------- The Emerald Nightmare
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theemeraldnightmare',
    },
    [789] = { ---------------- The Emerald Nightmare
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theemeraldnightmare',
    },
  },
  [1625] = {
    [791] = { ---------------- Temple of the Jade Serpent
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'templeofthejadeserpent',
    },
    [792] = { ---------------- Temple of the Jade Serpent
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'templeofthejadeserpent',
    },
  },
  [1646] = {
    [793] = { ---------------- Black Rook Hold
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackrookhold',
    },
  },
  [1529] = {
    [794] = { ---------------- Karazhan
      lightParamId = nil,
      skyboxFileDataID = 1522824, -- Retrieval method: fuzzy name match -> legioninvasionkarazhansky | environments\stars\legioninvasion_karazhansky.mdx
      normalizedName = 'karazhan',
    },
    [795] = { ---------------- Karazhan
      lightParamId = nil,
      skyboxFileDataID = 1522824, -- Retrieval method: fuzzy name match -> legioninvasionkarazhansky | environments\stars\legioninvasion_karazhansky.mdx
      normalizedName = 'karazhan',
    },
    [796] = { ---------------- Karazhan
      lightParamId = nil,
      skyboxFileDataID = 1522824, -- Retrieval method: fuzzy name match -> legioninvasionkarazhansky | environments\stars\legioninvasion_karazhansky.mdx
      normalizedName = 'karazhan',
    },
    [797] = { ---------------- Karazhan
      lightParamId = nil,
      skyboxFileDataID = 1522824, -- Retrieval method: fuzzy name match -> legioninvasionkarazhansky | environments\stars\legioninvasion_karazhansky.mdx
      normalizedName = 'karazhan',
    },
  },
  [1632] = {
    [798] = { ---------------- The Arcway
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thearcway',
    },
  },
  [1623] = {
    [799] = { ---------------- The Oculus
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theoculus',
    },
    [800] = { ---------------- The Oculus
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theoculus',
    },
    [801] = { ---------------- The Oculus
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theoculus',
    },
    [802] = { ---------------- The Oculus
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theoculus',
    },
    [803] = { ---------------- The Oculus
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theoculus',
    },
  },
  [1618] = {
    [804] = { ---------------- Scarlet Monastery
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'scarletmonastery',
    },
    [805] = { ---------------- Scarlet Monastery
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'scarletmonastery',
    },
  },
  [1648] = {
    [806] = { ---------------- Trial of Valor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'trialofvalor',
    },
    [807] = { ---------------- Trial of Valor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'trialofvalor',
    },
    [808] = { ---------------- Trial of Valor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'trialofvalor',
    },
  },
  [1651] = {
    [809] = { ---------------- Karazhan
      lightParamId = nil,
      skyboxFileDataID = 1522824, -- Retrieval method: fuzzy name match -> legioninvasionkarazhansky | environments\stars\legioninvasion_karazhansky.mdx
      normalizedName = 'karazhan',
    },
    [810] = { ---------------- Karazhan
      lightParamId = nil,
      skyboxFileDataID = 1522824, -- Retrieval method: fuzzy name match -> legioninvasionkarazhansky | environments\stars\legioninvasion_karazhansky.mdx
      normalizedName = 'karazhan',
    },
    [811] = { ---------------- Karazhan
      lightParamId = nil,
      skyboxFileDataID = 1522824, -- Retrieval method: fuzzy name match -> legioninvasionkarazhansky | environments\stars\legioninvasion_karazhansky.mdx
      normalizedName = 'karazhan',
    },
    [812] = { ---------------- Karazhan
      lightParamId = nil,
      skyboxFileDataID = 1522824, -- Retrieval method: fuzzy name match -> legioninvasionkarazhansky | environments\stars\legioninvasion_karazhansky.mdx
      normalizedName = 'karazhan',
    },
    [813] = { ---------------- Karazhan
      lightParamId = nil,
      skyboxFileDataID = 1522824, -- Retrieval method: fuzzy name match -> legioninvasionkarazhansky | environments\stars\legioninvasion_karazhansky.mdx
      normalizedName = 'karazhan',
    },
    [814] = { ---------------- Karazhan
      lightParamId = nil,
      skyboxFileDataID = 1522824, -- Retrieval method: fuzzy name match -> legioninvasionkarazhansky | environments\stars\legioninvasion_karazhansky.mdx
      normalizedName = 'karazhan',
    },
    [815] = { ---------------- Karazhan
      lightParamId = nil,
      skyboxFileDataID = 1522824, -- Retrieval method: fuzzy name match -> legioninvasionkarazhansky | environments\stars\legioninvasion_karazhansky.mdx
      normalizedName = 'karazhan',
    },
    [816] = { ---------------- Karazhan
      lightParamId = nil,
      skyboxFileDataID = 1522824, -- Retrieval method: fuzzy name match -> legioninvasionkarazhansky | environments\stars\legioninvasion_karazhansky.mdx
      normalizedName = 'karazhan',
    },
    [817] = { ---------------- Karazhan
      lightParamId = nil,
      skyboxFileDataID = 1522824, -- Retrieval method: fuzzy name match -> legioninvasionkarazhansky | environments\stars\legioninvasion_karazhansky.mdx
      normalizedName = 'karazhan',
    },
    [818] = { ---------------- Karazhan
      lightParamId = nil,
      skyboxFileDataID = 1522824, -- Retrieval method: fuzzy name match -> legioninvasionkarazhansky | environments\stars\legioninvasion_karazhansky.mdx
      normalizedName = 'karazhan',
    },
    [819] = { ---------------- Karazhan
      lightParamId = nil,
      skyboxFileDataID = 1522824, -- Retrieval method: fuzzy name match -> legioninvasionkarazhansky | environments\stars\legioninvasion_karazhansky.mdx
      normalizedName = 'karazhan',
    },
    [820] = { ---------------- Karazhan
      lightParamId = nil,
      skyboxFileDataID = 1522824, -- Retrieval method: fuzzy name match -> legioninvasionkarazhansky | environments\stars\legioninvasion_karazhansky.mdx
      normalizedName = 'karazhan',
    },
    [821] = { ---------------- Karazhan
      lightParamId = nil,
      skyboxFileDataID = 1522824, -- Retrieval method: fuzzy name match -> legioninvasionkarazhansky | environments\stars\legioninvasion_karazhansky.mdx
      normalizedName = 'karazhan',
    },
    [822] = { ---------------- Karazhan
      lightParamId = nil,
      skyboxFileDataID = 1522824, -- Retrieval method: fuzzy name match -> legioninvasionkarazhansky | environments\stars\legioninvasion_karazhansky.mdx
      normalizedName = 'karazhan',
    },
  },
  [1692] = {
    [823] = { ---------------- Pit of Saron
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'pitofsaron',
    },
  },
  [1645] = {
    [824] = { ---------------- Islands
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'islands',
    },
  },
  [1687] = {
    [825] = { ---------------- Wailing Caverns
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'wailingcaverns',
    },
  },
  [1702] = {
    [826] = { ---------------- Cave of the Bloodtotem
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'caveofthebloodtotem',
    },
  },
  [1708] = {
    [827] = { ---------------- Stratholme
      lightParamId = nil,
      skyboxFileDataID = 130636, -- Retrieval method: fuzzy name match -> stratholme | Environments\Stars\StratholmeSkybox.mdx
      normalizedName = 'stratholme',
    },
  },
  [1689] = {
    [828] = { ---------------- The Eye of Eternity
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theeyeofeternity',
    },
  },
  [1714] = {
    [829] = { ---------------- Halls of Valor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'hallsofvalor',
    },
  },
  [1669] = {
    [830] = { ---------------- Krokuun
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'krokuun',
    },
    [831] = { ---------------- The Vindicaar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thevindicaar',
    },
    [832] = { ---------------- The Vindicaar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thevindicaar',
    },
    [833] = { ---------------- Nath'raxas Spire
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'nathraxasspire',
    },
    [882] = { ---------------- Eredath
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'eredath',
    },
    [883] = { ---------------- The Vindicaar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thevindicaar',
    },
    [884] = { ---------------- The Vindicaar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thevindicaar',
    },
    [885] = { ---------------- Antoran Wastes
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'antoranwastes',
    },
    [886] = { ---------------- The Vindicaar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thevindicaar',
    },
    [887] = { ---------------- The Vindicaar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thevindicaar',
    },
    [994] = { ---------------- Argus
      lightParamId = 2901,
      skyboxFileDataID = 1518353, -- Retrieval method: skyboxId (370) -> voidstorm test | Voidstorm Test
      normalizedName = 'argus',
    },
  },
  [1723] = {
    [834] = { ---------------- Coldridge Valley
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'coldridgevalley',
    },
  },
  [1688] = {
    [835] = { ---------------- The Deadmines
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thedeadmines',
    },
    [836] = { ---------------- The Deadmines
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thedeadmines',
    },
  },
  [1681] = {
    [837] = { ---------------- Arathi Basin
      lightParamId = nil,
      skyboxFileDataID = 1537289, -- Retrieval method: fuzzy name match -> arathibasinwintersky | environments\stars\arathibasin_wintersky01.mdx
      normalizedName = 'arathibasin',
    },
  },
  [1715] = {
    [838] = { ---------------- Battle for Blackrock Mountain
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'battleforblackrockmountain',
    },
  },
  [1580] = {
    [839] = { ---------------- The Maelstrom
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'themaelstrom',
    },
  },
  [1694] = {
    [840] = { ---------------- Gnomeregan
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'gnomeregan',
    },
    [841] = { ---------------- Gnomeregan
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'gnomeregan',
    },
    [842] = { ---------------- Gnomeregan
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'gnomeregan',
    },
  },
  [1170] = {
    [843] = { ---------------- Shado-Pan Showdown
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'shadopanshowdown',
    },
  },
  [1686] = {
    [844] = { ---------------- Arathi Basin
      lightParamId = nil,
      skyboxFileDataID = 1537289, -- Retrieval method: fuzzy name match -> arathibasinwintersky | environments\stars\arathibasin_wintersky01.mdx
      normalizedName = 'arathibasin',
    },
  },
  [1677] = {
    [845] = { ---------------- Cathedral of Eternal Night
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'cathedralofeternalnight',
    },
    [846] = { ---------------- Cathedral of Eternal Night
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'cathedralofeternalnight',
    },
    [847] = { ---------------- Cathedral of Eternal Night
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'cathedralofeternalnight',
    },
    [848] = { ---------------- Cathedral of Eternal Night
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'cathedralofeternalnight',
    },
    [849] = { ---------------- Cathedral of Eternal Night
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'cathedralofeternalnight',
    },
  },
  [1676] = {
    [850] = { ---------------- Tomb of Sargeras
      lightParamId = nil,
      skyboxFileDataID = 1598213, -- Retrieval method: fuzzy name match -> dutombofsargeraskiljaedenm | Environments\Stars\7DU_TombOfSargeras_KiljaedenSkyBox01.m2
      normalizedName = 'tombofsargeras',
    },
    [851] = { ---------------- Tomb of Sargeras
      lightParamId = nil,
      skyboxFileDataID = 1598213, -- Retrieval method: fuzzy name match -> dutombofsargeraskiljaedenm | Environments\Stars\7DU_TombOfSargeras_KiljaedenSkyBox01.m2
      normalizedName = 'tombofsargeras',
    },
    [852] = { ---------------- Tomb of Sargeras
      lightParamId = nil,
      skyboxFileDataID = 1598213, -- Retrieval method: fuzzy name match -> dutombofsargeraskiljaedenm | Environments\Stars\7DU_TombOfSargeras_KiljaedenSkyBox01.m2
      normalizedName = 'tombofsargeras',
    },
    [853] = { ---------------- Tomb of Sargeras
      lightParamId = nil,
      skyboxFileDataID = 1598213, -- Retrieval method: fuzzy name match -> dutombofsargeraskiljaedenm | Environments\Stars\7DU_TombOfSargeras_KiljaedenSkyBox01.m2
      normalizedName = 'tombofsargeras',
    },
    [854] = { ---------------- Tomb of Sargeras
      lightParamId = nil,
      skyboxFileDataID = 1598213, -- Retrieval method: fuzzy name match -> dutombofsargeraskiljaedenm | Environments\Stars\7DU_TombOfSargeras_KiljaedenSkyBox01.m2
      normalizedName = 'tombofsargeras',
    },
    [855] = { ---------------- Tomb of Sargeras
      lightParamId = nil,
      skyboxFileDataID = 1598213, -- Retrieval method: fuzzy name match -> dutombofsargeraskiljaedenm | Environments\Stars\7DU_TombOfSargeras_KiljaedenSkyBox01.m2
      normalizedName = 'tombofsargeras',
    },
    [856] = { ---------------- Tomb of Sargeras
      lightParamId = nil,
      skyboxFileDataID = 1598213, -- Retrieval method: fuzzy name match -> dutombofsargeraskiljaedenm | Environments\Stars\7DU_TombOfSargeras_KiljaedenSkyBox01.m2
      normalizedName = 'tombofsargeras',
    },
  },
  [1734] = {
    [857] = { ---------------- Throne of the Four Winds
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'throneofthefourwinds',
    },
  },
  [1666] = {
    [858] = { ---------------- Assault on Broken Shore
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'assaultonbrokenshore',
    },
  },
  [1740] = {
    [859] = { ---------------- Warsong Gulch
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'warsonggulch',
    },
  },
  [1736] = {
    [860] = { ---------------- The Ruby Sanctum
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'therubysanctum',
    },
  },
  [1732] = {
    [861] = { ---------------- Mardum, the Shattered Abyss
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'mardumtheshatteredabyss',
    },
  },
  [1642] = {
    [862] = { ---------------- Zuldazar
      lightParamId = nil,
      skyboxFileDataID = 1721776, -- Retrieval method: fuzzy name match -> zul zuldazar dungeon city of gold | 8ZUL Zuldazar Dungeon City Of Gold 
      normalizedName = 'zuldazar',
    },
    [863] = { ---------------- Nazmir
      lightParamId = 3183,
      skyboxFileDataID = nil,
      normalizedName = 'nazmir',
    },
    [864] = { ---------------- Vol'dun
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'voldun',
    },
    [875] = { ---------------- Zandalar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'zandalar',
    },
    [991] = { ---------------- Zandalar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'zandalar',
    },
    [1009] = { --------------- Atul'Aman
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'atulaman',
    },
    [1011] = { --------------- Zandalar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'zandalar',
    },
    [947] = { ---------------- Azeroth
      lightParamId = nil,
      skyboxFileDataID = 527828, -- Retrieval method: fuzzy name match -> fallofazeroth | environments\stars\fallofazeroth01.mdx
      normalizedName = 'azeroth',
    },
    [1163] = { --------------- Dazar'alor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'dazaralor',
    },
    [1164] = { --------------- Dazar'alor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'dazaralor',
    },
    [1165] = { --------------- Dazar'alor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'dazaralor',
    },
    [1166] = { --------------- Zanchul
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'zanchul',
    },
    [1167] = { --------------- Zanchul
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'zanchul',
    },
    [1173] = { --------------- Rastakhan's Might
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'rastakhansmight',
    },
    [1174] = { --------------- Rastakhan's Might
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'rastakhansmight',
    },
    [1176] = { --------------- Breath Of Pa'ku
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'breathofpaku',
    },
    [1177] = { --------------- Breath Of Pa'ku
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'breathofpaku',
    },
    [1193] = { --------------- Zuldazar
      lightParamId = nil,
      skyboxFileDataID = 1721776, -- Retrieval method: fuzzy name match -> zul zuldazar dungeon city of gold | 8ZUL Zuldazar Dungeon City Of Gold 
      normalizedName = 'zuldazar',
    },
    [1194] = { --------------- Nazmir
      lightParamId = 3183,
      skyboxFileDataID = nil,
      normalizedName = 'nazmir',
    },
    [1195] = { --------------- Vol'dun
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'voldun',
    },
  },
  [1707] = {
    [865] = { ---------------- Stormheim
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'stormheim',
    },
    [866] = { ---------------- Stormheim
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'stormheim',
    },
  },
  [1705] = {
    [867] = { ---------------- Azsuna
      lightParamId = nil,
      skyboxFileDataID = 454481, -- Retrieval method: fuzzy name match -> xp sirens isle storm | 11XP Sirens Isle Storm
      normalizedName = 'azsuna',
    },
  },
  [1704] = {
    [868] = { ---------------- Val'sharah
      lightParamId = nil,
      skyboxFileDataID = 1368570, -- Retrieval method: fuzzy name match -> valsharahskyenchanted | environments\stars\valsharah_sky01_enchanted.mdx
      normalizedName = 'valsharah',
    },
  },
  [1706] = {
    [869] = { ---------------- Highmountain
      lightParamId = nil,
      skyboxFileDataID = 1612982, -- Retrieval method: fuzzy name match -> placeholder empty   morgan test | PLACEHOLDER Empty Skybox - Morgan Test
      normalizedName = 'highmountain',
    },
    [870] = { ---------------- Highmountain
      lightParamId = nil,
      skyboxFileDataID = 1612982, -- Retrieval method: fuzzy name match -> placeholder empty   morgan test | PLACEHOLDER Empty Skybox - Morgan Test
      normalizedName = 'highmountain',
    },
  },
  [1738] = {
    [871] = { ---------------- The Lost Glacier
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thelostglacier',
    },
  },
  [1693] = {
    [872] = { ---------------- Stormstout Brewery
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'stormstoutbrewery',
    },
    [873] = { ---------------- Stormstout Brewery
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'stormstoutbrewery',
    },
    [874] = { ---------------- Stormstout Brewery
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'stormstoutbrewery',
    },
  },
  [1643] = {
    [876] = { ---------------- Kul Tiras
      lightParamId = 3535,
      skyboxFileDataID = 1937257, -- Retrieval method: skyboxId (422) -> kulsky | 8KUL_Sky01
      normalizedName = 'kultiras',
    },
    [895] = { ---------------- Tiragarde Sound
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'tiragardesound',
    },
    [896] = { ---------------- Drustvar
      lightParamId = 3640,
      skyboxFileDataID = 1965366, -- Retrieval method: skyboxId (424) -> dru western  | 8DRU Western Skybox
      normalizedName = 'drustvar',
    },
    [942] = { ---------------- Stormsong Valley
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'stormsongvalley',
    },
    [992] = { ---------------- Kul Tiras
      lightParamId = 3535,
      skyboxFileDataID = 1937257, -- Retrieval method: skyboxId (422) -> kulsky | 8KUL_Sky01
      normalizedName = 'kultiras',
    },
    [1014] = { --------------- Kul Tiras
      lightParamId = 3535,
      skyboxFileDataID = 1937257, -- Retrieval method: skyboxId (422) -> kulsky | 8KUL_Sky01
      normalizedName = 'kultiras',
    },
    [1161] = { --------------- Boralus
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'boralus',
    },
    [1169] = { --------------- Tol Dagor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'toldagor',
    },
    [1171] = { --------------- Gol Thovas
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'golthovas',
    },
    [1172] = { --------------- Gol Thovas
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'golthovas',
    },
    [1179] = { --------------- Abyssal Melody
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'abyssalmelody',
    },
    [1180] = { --------------- Abyssal Melody
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'abyssalmelody',
    },
    [1182] = { --------------- Saltstone Mine
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'saltstonemine',
    },
    [1183] = { --------------- Thornheart
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thornheart',
    },
    [1184] = { --------------- Winterchill Mine
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'winterchillmine',
    },
    [1185] = { --------------- Winterchill Mine
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'winterchillmine',
    },
    [1196] = { --------------- Tiragarde Sound
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'tiragardesound',
    },
    [1197] = { --------------- Drustvar
      lightParamId = 3640,
      skyboxFileDataID = 1965366, -- Retrieval method: skyboxId (424) -> dru western  | 8DRU Western Skybox
      normalizedName = 'drustvar',
    },
    [1198] = { --------------- Stormsong Valley
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'stormsongvalley',
    },
    [947] = { ---------------- Azeroth
      lightParamId = nil,
      skyboxFileDataID = 527828, -- Retrieval method: fuzzy name match -> fallofazeroth | environments\stars\fallofazeroth01.mdx
      normalizedName = 'azeroth',
    },
    [1462] = { --------------- Mechagon Island
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'mechagonisland',
    },
    [1522] = { --------------- Crumbling Cavern
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'crumblingcavern',
    },
  },
  [1728] = {
    [877] = { ---------------- Fields of the Eternal Hunt
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'fieldsoftheeternalhunt',
    },
  },
  [1523] = {
    [879] = { ---------------- Mardum, the Shattered Abyss
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'mardumtheshatteredabyss',
    },
    [880] = { ---------------- Mardum, the Shattered Abyss
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'mardumtheshatteredabyss',
    },
    [672] = { ---------------- Mardum, the Shattered Abyss
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'mardumtheshatteredabyss',
    },
  },
  [1729] = {
    [881] = { ---------------- The Eye of Eternity
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theeyeofeternity',
    },
  },
  [1733] = {
    [888] = { ---------------- Hall of Communion
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'hallofcommunion',
    },
  },
  [1746] = {
    [889] = { ---------------- Arcatraz
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'arcatraz',
    },
    [890] = { ---------------- Arcatraz
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'arcatraz',
    },
  },
  [1750] = {
    [891] = { ---------------- Azuremyst Isle
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'azuremystisle',
    },
    [892] = { ---------------- Azuremyst Isle
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'azuremystisle',
    },
    [893] = { ---------------- Azuremyst Isle
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'azuremystisle',
    },
    [894] = { ---------------- Azuremyst Isle
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'azuremystisle',
    },
  },
  [1756] = {
    [897] = { ---------------- The Deaths of Chromie
      lightParamId = nil,
      skyboxFileDataID = 235313, -- Retrieval method: fuzzy name match -> death | ENVIRONMENTS\Stars\DeathSkybox.mdx
      normalizedName = 'thedeathsofchromie',
    },
    [898] = { ---------------- The Deaths of Chromie
      lightParamId = nil,
      skyboxFileDataID = 235313, -- Retrieval method: fuzzy name match -> death | ENVIRONMENTS\Stars\DeathSkybox.mdx
      normalizedName = 'thedeathsofchromie',
    },
    [902] = { ---------------- The Deaths of Chromie
      lightParamId = nil,
      skyboxFileDataID = 235313, -- Retrieval method: fuzzy name match -> death | ENVIRONMENTS\Stars\DeathSkybox.mdx
      normalizedName = 'thedeathsofchromie',
    },
    [899] = { ---------------- The Deaths of Chromie
      lightParamId = nil,
      skyboxFileDataID = 235313, -- Retrieval method: fuzzy name match -> death | ENVIRONMENTS\Stars\DeathSkybox.mdx
      normalizedName = 'thedeathsofchromie',
    },
    [900] = { ---------------- The Deaths of Chromie
      lightParamId = nil,
      skyboxFileDataID = 235313, -- Retrieval method: fuzzy name match -> death | ENVIRONMENTS\Stars\DeathSkybox.mdx
      normalizedName = 'thedeathsofchromie',
    },
    [901] = { ---------------- The Deaths of Chromie
      lightParamId = nil,
      skyboxFileDataID = 235313, -- Retrieval method: fuzzy name match -> death | ENVIRONMENTS\Stars\DeathSkybox.mdx
      normalizedName = 'thedeathsofchromie',
    },
  },
  [1753] = {
    [903] = { ---------------- The Seat of the Triumvirate
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theseatofthetriumvirate',
    },
  },
  [1782] = {
    [904] = { ---------------- Silithus Brawl
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'silithusbrawl',
    },
  },
  [1804] = {
    [906] = { ---------------- Arathi Highlands
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'arathihighlands',
    },
  },
  [1803] = {
    [907] = { ---------------- Seething Shore
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'seethingshore',
    },
  },
  [1760] = {
    [908] = { ---------------- Ruins of Lordaeron
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ruinsoflordaeron',
    },
    [998] = { ---------------- Undercity
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'undercity',
    },
  },
  [1712] = {
    [909] = { ---------------- Antorus, the Burning Throne
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'antorustheburningthrone',
    },
    [910] = { ---------------- Antorus, the Burning Throne
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'antorustheburningthrone',
    },
    [911] = { ---------------- Antorus, the Burning Throne
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'antorustheburningthrone',
    },
    [912] = { ---------------- Antorus, the Burning Throne
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'antorustheburningthrone',
    },
    [913] = { ---------------- Antorus, the Burning Throne
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'antorustheburningthrone',
    },
    [914] = { ---------------- Antorus, the Burning Throne
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'antorustheburningthrone',
    },
    [915] = { ---------------- Antorus, the Burning Throne
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'antorustheburningthrone',
    },
    [916] = { ---------------- Antorus, the Burning Throne
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'antorustheburningthrone',
    },
    [917] = { ---------------- Antorus, the Burning Throne
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'antorustheburningthrone',
    },
    [918] = { ---------------- Antorus, the Burning Throne
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'antorustheburningthrone',
    },
    [919] = { ---------------- Antorus, the Burning Throne
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'antorustheburningthrone',
    },
    [920] = { ---------------- Antorus, the Burning Throne
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'antorustheburningthrone',
    },
  },
  [1779] = {
    [921] = { ---------------- Invasion Point: Aurinor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'invasionpointaurinor',
    },
    [922] = { ---------------- Invasion Point: Bonich
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'invasionpointbonich',
    },
    [923] = { ---------------- Invasion Point: Cen'gar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'invasionpointcengar',
    },
    [924] = { ---------------- Invasion Point: Naigtal
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'invasionpointnaigtal',
    },
    [925] = { ---------------- Invasion Point: Sangua
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'invasionpointsangua',
    },
    [926] = { ---------------- Invasion Point: Val
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'invasionpointval',
    },
    [927] = { ---------------- Greater Invasion Point: Pit Lord Vilemus
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'greaterinvasionpointpitlordvilemus',
    },
    [928] = { ---------------- Greater Invasion Point: Mistress Alluradel
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'greaterinvasionpointmistressalluradel',
    },
    [929] = { ---------------- Greater Invasion Point: Matron Folnuna
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'greaterinvasionpointmatronfolnuna',
    },
    [930] = { ---------------- Greater Invasion Point: Inquisitor Meto
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'greaterinvasionpointinquisitormeto',
    },
    [931] = { ---------------- Greater Invasion Point: Sotanathor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'greaterinvasionpointsotanathor',
    },
    [932] = { ---------------- Greater Invasion Point: Occularus
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'greaterinvasionpointoccularus',
    },
  },
  [1774] = {
    [933] = { ---------------- Forge of Aeons
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'forgeofaeons',
    },
  },
  [1763] = {
    [934] = { ---------------- Atal'Dazar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ataldazar',
    },
    [935] = { ---------------- Atal'Dazar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ataldazar',
    },
  },
  [1754] = {
    [936] = { ---------------- Freehold
      lightParamId = 3586,
      skyboxFileDataID = 1777090, -- Retrieval method: skyboxId (414) -> kul freehold  | 8KUL Freehold Skybox
      normalizedName = 'freehold',
    },
  },
  [1780] = {
    [938] = { ---------------- Gilneas Island
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'gilneasisland',
    },
    [939] = { ---------------- Tropical Isle 8.0
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'tropicalisle8',
    },
  },
  [1860] = {
    [940] = { ---------------- The Vindicaar
      lightParamId = 3638,
      skyboxFileDataID = 1847083, -- Retrieval method: skyboxId (418) -> vindicaar  | Vindicaar Skybox 01
      normalizedName = 'thevindicaar',
    },
    [941] = { ---------------- The Vindicaar
      lightParamId = 3638,
      skyboxFileDataID = 1847083, -- Retrieval method: skyboxId (418) -> vindicaar  | Vindicaar Skybox 01
      normalizedName = 'thevindicaar',
    },
  },
  [1876] = {
    [943] = { ---------------- Arathi Highlands
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'arathihighlands',
    },
  },
  [2444] = {
    [947] = { ---------------- Azeroth
      lightParamId = nil,
      skyboxFileDataID = 527828, -- Retrieval method: fuzzy name match -> fallofazeroth | environments\stars\fallofazeroth01.mdx
      normalizedName = 'azeroth',
    },
    [1978] = { --------------- Dragon Isles
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'dragonisles',
    },
    [2022] = { --------------- The Waking Shores
      lightParamId = 5605,
      skyboxFileDataID = 4094170, -- Retrieval method: skyboxId (618) -> raid test | 10.2 RAID TEST
      normalizedName = 'thewakingshores',
    },
    [2023] = { --------------- Ohn'ahran Plains
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ohnahranplains',
    },
    [2024] = { --------------- The Azure Span
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theazurespan',
    },
    [2025] = { --------------- Thaldraszus
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thaldraszus',
    },
    [2057] = { --------------- Dragon Isles
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'dragonisles',
    },
    [2063] = { --------------- Dragon Isles
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'dragonisles',
    },
    [2101] = { --------------- The Support Creche
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thesupportcreche',
    },
    [2102] = { --------------- The War Creche
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thewarcreche',
    },
    [2112] = { --------------- Valdrakken
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'valdrakken',
    },
    [2127] = { --------------- The Waking Shores
      lightParamId = 5605,
      skyboxFileDataID = 4094170, -- Retrieval method: skyboxId (618) -> raid test | 10.2 RAID TEST
      normalizedName = 'thewakingshores',
    },
    [2128] = { --------------- The Azure Span
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theazurespan',
    },
    [2129] = { --------------- Ohn'ahran Plains
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ohnahranplains',
    },
    [2130] = { --------------- Thaldraszus
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thaldraszus',
    },
    [2132] = { --------------- The Azure Span
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theazurespan',
    },
    [2134] = { --------------- Valdrakken
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'valdrakken',
    },
    [2100] = { --------------- The Siege Creche
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thesiegecreche',
    },
    [2150] = { --------------- Dragonskull Island
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'dragonskullisland',
    },
    [2151] = { --------------- The Forbidden Reach
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theforbiddenreach',
    },
    [2154] = { --------------- Froststone Vault
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'froststonevault',
    },
    [2199] = { --------------- Tyrhold Reservoir
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'tyrholdreservoir',
    },
    [2239] = { --------------- Amirdrassil
      lightParamId = 6330,
      skyboxFileDataID = 5333222, -- Retrieval method: skyboxId (649) -> emd zone  | 10EMD Zone Skybox
      normalizedName = 'amirdrassil',
    },
    [2262] = { --------------- Traitor's Rest
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'traitorsrest',
    },
    [2268] = { --------------- Amirdrassil
      lightParamId = 6330,
      skyboxFileDataID = 5333222, -- Retrieval method: skyboxId (649) -> emd zone  | 10EMD Zone Skybox
      normalizedName = 'amirdrassil',
    },
  },
  [1865] = {
    [971] = { ---------------- Telogrus Rift
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'telogrusrift',
    },
  },
  [1622] = {
    [972] = { ---------------- Telogrus Rift
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'telogrusrift',
    },
  },
  [1840] = {
    [973] = { ---------------- The Sunwell
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thesunwell',
    },
  },
  [1771] = {
    [974] = { ---------------- Tol Dagor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'toldagor',
    },
    [975] = { ---------------- Tol Dagor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'toldagor',
    },
    [976] = { ---------------- Tol Dagor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'toldagor',
    },
    [977] = { ---------------- Tol Dagor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'toldagor',
    },
    [978] = { ---------------- Tol Dagor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'toldagor',
    },
    [979] = { ---------------- Tol Dagor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'toldagor',
    },
    [980] = { ---------------- Tol Dagor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'toldagor',
    },
  },
  [1813] = {
    [981] = { ---------------- Un'gol Ruins
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ungolruins',
    },
  },
  [1599] = {
    [12] = { ----------------- Kalimdor
      lightParamId = nil,
      skyboxFileDataID = 395900, -- Retrieval method: fuzzy name match -> worldkalimdorhyjalsmokehyjalsmokeclouds | world\kalimdor\hyjal\passivedoodads\smoke\hyjal_smokeclouds.mdx
      normalizedName = 'kalimdor',
    },
  },
  [1014] = {
    [424] = { ---------------- Pandaria
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'pandaria',
    },
    [1923] = { --------------- Pandaria
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'pandaria',
    },
  },
  [1031] = {
    [480] = { ---------------- Proving Grounds
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'provinggrounds',
    },
  },
  [1460] = {
    [619] = { ---------------- Broken Isles
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'brokenisles',
    },
  },
  [1545] = {
    [619] = { ---------------- Broken Isles
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'brokenisles',
    },
  },
  [1498] = {
    [619] = { ---------------- Broken Isles
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'brokenisles',
    },
  },
  [1609] = {
    [113] = { ---------------- Northrend
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'northrend',
    },
    [1384] = { --------------- Northrend
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'northrend',
    },
  },
  [1629] = {
    [702] = { ---------------- Netherlight Temple
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'netherlighttemple',
    },
  },
  [1762] = {
    [1004] = { --------------- Kings' Rest
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'kingsrest',
    },
  },
  [1594] = {
    [1010] = { --------------- The MOTHERLODE!!
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'themotherlode',
    },
  },
  [1904] = {
    [1012] = { --------------- Stormwind City
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'stormwindcity',
    },
    [1013] = { --------------- The Stockade
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thestockade',
    },
  },
  [1862] = {
    [1015] = { --------------- Waycrest Manor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'waycrestmanor',
    },
    [1016] = { --------------- Waycrest Manor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'waycrestmanor',
    },
    [1017] = { --------------- Waycrest Manor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'waycrestmanor',
    },
    [1018] = { --------------- Waycrest Manor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'waycrestmanor',
    },
    [1029] = { --------------- Waycrest Manor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'waycrestmanor',
    },
  },
  [1929] = {
    [1021] = { --------------- Chamber of Heart
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'chamberofheart',
    },
  },
  [1955] = {
    [1022] = { --------------- Uncharted Island
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'unchartedisland',
    },
  },
  [1898] = {
    [1032] = { --------------- Skittering Hollow
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'skitteringhollow',
    },
  },
  [1892] = {
    [1033] = { --------------- The Rotting Mire
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'therottingmire',
    },
  },
  [1882] = {
    [1034] = { --------------- Verdant Wilds
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'verdantwilds',
    },
  },
  [1897] = {
    [1035] = { --------------- Molten Cay
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'moltencay',
    },
  },
  [1893] = {
    [1036] = { --------------- The Dread Chain
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thedreadchain',
    },
  },
  [1883] = {
    [1037] = { --------------- Whispering Reef
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'whisperingreef',
    },
  },
  [1877] = {
    [1038] = { --------------- Temple of Sethraliss
      lightParamId = 2942,
      skyboxFileDataID = 1513195, -- Retrieval method: skyboxId (364) -> dur sky test | 12 DUR Sky Test
      normalizedName = 'templeofsethraliss',
    },
    [1043] = { --------------- Temple of Sethraliss
      lightParamId = 2942,
      skyboxFileDataID = 1513195, -- Retrieval method: skyboxId (364) -> dur sky test | 12 DUR Sky Test
      normalizedName = 'templeofsethraliss',
    },
  },
  [1864] = {
    [1039] = { --------------- Shrine of the Storm
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'shrineofthestorm',
    },
    [1040] = { --------------- Shrine of the Storm
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'shrineofthestorm',
    },
  },
  [1841] = {
    [1041] = { --------------- The Underrot
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theunderrot',
    },
    [1042] = { --------------- The Underrot
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theunderrot',
    },
  },
  [1943] = {
    [1044] = { --------------- Arathi Highlands
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'arathihighlands',
    },
  },
  [1944] = {
    [1045] = { --------------- Thros, The Blighted Lands
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'throstheblightedlands',
    },
  },
  [1861] = {
    [1148] = { --------------- Uldir
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'uldir',
    },
    [1149] = { --------------- Uldir
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'uldir',
    },
    [1150] = { --------------- Uldir
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'uldir',
    },
    [1151] = { --------------- Uldir
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'uldir',
    },
    [1152] = { --------------- Uldir
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'uldir',
    },
    [1153] = { --------------- Uldir
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'uldir',
    },
    [1154] = { --------------- Uldir
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'uldir',
    },
    [1155] = { --------------- Uldir
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'uldir',
    },
  },
  [-1] = {
    [1148] = { --------------- Uldir
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'uldir',
    },
    [1149] = { --------------- Uldir
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'uldir',
    },
    [1408] = { --------------- Ashran
      lightParamId = nil,
      skyboxFileDataID = 841279, -- Retrieval method: fuzzy name match -> ashrandsky | environments\stars\ashrand_sky01.mdx
      normalizedName = 'ashran',
    },
    [2147] = { --------------- Azeroth
      lightParamId = nil,
      skyboxFileDataID = 527828, -- Retrieval method: fuzzy name match -> fallofazeroth | environments\stars\fallofazeroth01.mdx
      normalizedName = 'azeroth',
    },
    [2311] = { --------------- 11.0 -  Hallowfall - [Spreading the Light]- Disabled
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = '110hallowfallspreadingthelightdisabled',
    },
  },
  [1954] = {
    [1156] = { --------------- The Great Sea
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thegreatsea',
    },
  },
  [2066] = {
    [1157] = { --------------- The Great Sea
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thegreatsea',
    },
  },
  [1932] = {
    [1159] = { --------------- Blackrock Depths
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackrockdepths',
    },
    [1160] = { --------------- Blackrock Depths
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackrockdepths',
    },
  },
  [1822] = {
    [1162] = { --------------- Siege of Boralus
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'siegeofboralus',
    },
  },
  [1917] = {
    [1170] = { --------------- Gorgrond - Mag'har Scenario
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'gorgrondmagharscenario',
    },
  },
  [1906] = {
    [1181] = { --------------- Zuldazar
      lightParamId = nil,
      skyboxFileDataID = 1721776, -- Retrieval method: fuzzy name match -> zul zuldazar dungeon city of gold | 8ZUL Zuldazar Dungeon City Of Gold 
      normalizedName = 'zuldazar',
    },
  },
  [1157] = {
    [376] = { ---------------- Valley of the Four Winds
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'valleyofthefourwinds',
    },
  },
  [2081] = {
    [1186] = { --------------- Blackrock Depths
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackrockdepths',
    },
  },
  [2105] = {
    [1203] = { --------------- Darkshore
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'darkshore',
    },
  },
  [2111] = {
    [1332] = { --------------- Darkshore
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'darkshore',
    },
  },
  [2129] = {
    [1333] = { --------------- Darkshore
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'darkshore',
    },
  },
  [2118] = {
    [1334] = { --------------- Wintergrasp
      lightParamId = nil,
      skyboxFileDataID = 235383, -- Retrieval method: fuzzy name match -> wintergraspsmokysky | ENVIRONMENTS\Stars\WintergraspSmokySky.mdx
      normalizedName = 'wintergrasp',
    },
  },
  [1691] = {
    [1335] = { --------------- Cooking: Impossible
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'cookingimpossible',
    },
  },
  [1814] = {
    [1336] = { --------------- Havenswood
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'havenswood',
    },
  },
  [1879] = {
    [1337] = { --------------- Jorundall
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'jorundall',
    },
  },
  [2115] = {
    [1338] = { --------------- Darkshore
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'darkshore',
    },
  },
  [2106] = {
    [1339] = { --------------- Warsong Gulch
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'warsonggulch',
    },
  },
  [2096] = {
    [1345] = { --------------- Crucible of Storms
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'crucibleofstorms',
    },
    [1346] = { --------------- Crucible of Storms
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'crucibleofstorms',
    },
  },
  [2125] = {
    [1347] = { --------------- Zandalari Treasury
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'zandalaritreasury',
    },
    [1348] = { --------------- Zandalari Treasury
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'zandalaritreasury',
    },
  },
  [2134] = {
    [1349] = { --------------- Tol Dagor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'toldagor',
    },
    [1350] = { --------------- Tol Dagor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'toldagor',
    },
    [1351] = { --------------- Tol Dagor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'toldagor',
    },
  },
  [2070] = {
    [1352] = { --------------- Battle of Dazar'alor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'battleofdazaralor',
    },
    [1353] = { --------------- Battle of Dazar'alor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'battleofdazaralor',
    },
    [1354] = { --------------- Battle of Dazar'alor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'battleofdazaralor',
    },
    [1357] = { --------------- Battle of Dazar'alor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'battleofdazaralor',
    },
    [1358] = { --------------- Battle of Dazar'alor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'battleofdazaralor',
    },
    [1364] = { --------------- Battle of Dazar'alor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'battleofdazaralor',
    },
    [1356] = { --------------- Battle of Dazar'alor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'battleofdazaralor',
    },
    [1367] = { --------------- Battle of Dazar'alor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'battleofdazaralor',
    },
  },
  [1718] = {
    [1355] = { --------------- Nazjatar
      lightParamId = 4160,
      skyboxFileDataID = 2903975, -- Retrieval method: skyboxId (565) -> nzj naga caverns sky | 8NZJ Naga Caverns Sky
      normalizedName = 'nazjatar',
    },
    [1499] = { --------------- Zin-Azshari
      lightParamId = 3986,
      skyboxFileDataID = 2905412, -- Retrieval method: skyboxId (567) -> nzj zin azshari | 8NZJ Zin Azshari
      normalizedName = 'zinazshari',
    },
    [1500] = {
      lightParamId = 3994,
      skyboxFileDataID = nil,
      normalizedName = 'nil',
    },
    [1504] = { --------------- Nazjatar
      lightParamId = 4160,
      skyboxFileDataID = 2903975, -- Retrieval method: skyboxId (565) -> nzj naga caverns sky | 8NZJ Naga Caverns Sky
      normalizedName = 'nazjatar',
    },
    [1528] = { --------------- Nazjatar
      lightParamId = 4160,
      skyboxFileDataID = 2903975, -- Retrieval method: skyboxId (565) -> nzj naga caverns sky | 8NZJ Naga Caverns Sky
      normalizedName = 'nazjatar',
    },
    [1524] = {
      lightParamId = 3994,
      skyboxFileDataID = nil,
      normalizedName = 'nil',
    },
  },
  [2147] = {
    [1360] = { --------------- Icecrown Citadel
      lightParamId = nil,
      skyboxFileDataID = 130551, -- Retrieval method: fuzzy name match -> icecrowncitadelsky | environments\stars\icecrowncitadelsky.mdx
      normalizedName = 'icecrowncitadel',
    },
    [1359] = { --------------- Icecrown Citadel
      lightParamId = nil,
      skyboxFileDataID = 130551, -- Retrieval method: fuzzy name match -> icecrowncitadelsky | environments\stars\icecrowncitadelsky.mdx
      normalizedName = 'icecrowncitadel',
    },
    [1681] = { --------------- Icecrown Citadel
      lightParamId = nil,
      skyboxFileDataID = 130551, -- Retrieval method: fuzzy name match -> icecrowncitadelsky | environments\stars\icecrowncitadelsky.mdx
      normalizedName = 'icecrowncitadel',
    },
    [1682] = { --------------- Icecrown Citadel
      lightParamId = nil,
      skyboxFileDataID = 130551, -- Retrieval method: fuzzy name match -> icecrowncitadelsky | environments\stars\icecrowncitadelsky.mdx
      normalizedName = 'icecrowncitadel',
    },
  },
  [2123] = {
    [1362] = { --------------- Shrine of the Storm
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'shrineofthestorm',
    },
    [1363] = { --------------- Crucible of Storms
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'crucibleofstorms',
    },
  },
  [2107] = {
    [1366] = { --------------- Arathi Basin
      lightParamId = nil,
      skyboxFileDataID = 1537289, -- Retrieval method: fuzzy name match -> arathibasinwintersky | environments\stars\arathibasin_wintersky01.mdx
      normalizedName = 'arathibasin',
    },
  },
  [2163] = {
    [1371] = { --------------- GnomereganA
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'gnomeregana',
    },
    [1372] = { --------------- GnomereganB
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'gnomereganb',
    },
    [1374] = { --------------- GnomereganD
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'gnomeregand',
    },
    [1380] = { --------------- GnomereganC
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'gnomereganc',
    },
  },
  [2155] = {
    [1375] = { --------------- Halls of Stone
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'hallsofstone',
    },
  },
  [2156] = {
    [1379] = { --------------- 8.3 Visions of N'Zoth - Prototype
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = '83visionsofnzothprototype',
    },
  },
  [2169] = {
    [1381] = { --------------- Uldir
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'uldir',
    },
    [1382] = { --------------- Uldir
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'uldir',
    },
  },
  [2177] = {
    [1383] = { --------------- Arathi Basin
      lightParamId = nil,
      skyboxFileDataID = 1537289, -- Retrieval method: fuzzy name match -> arathibasinwintersky | environments\stars\arathibasin_wintersky01.mdx
      normalizedName = 'arathibasin',
    },
  },
  [2178] = {
    [1407] = { --------------- Prison of Ink
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'prisonofink',
    },
  },
  [2175] = {
    [1409] = { --------------- Exile's Reach
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'exilesreach',
    },
    [1726] = { --------------- The North Sea
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thenorthsea',
    },
    [1727] = { --------------- The North Sea
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thenorthsea',
    },
  },
  [2174] = {
    [1465] = { --------------- Scarlet Halls
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'scarlethalls',
    },
  },
  [2180] = {
    [1468] = { --------------- The Dreamgrove
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thedreamgrove',
    },
  },
  [2212] = {
    [1469] = { --------------- Vision of Orgrimmar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'visionoforgrimmar',
    },
  },
  [2213] = {
    [1470] = { --------------- Vision of Stormwind
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'visionofstormwind',
    },
  },
  [2209] = {
    [1471] = { --------------- Emerald Dreamway
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'emeralddreamway',
    },
    [1475] = { --------------- The Emerald Dream
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theemeralddream',
    },
  },
  [2207] = {
    [1472] = { --------------- The Dragon's Spine
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thedragonsspine',
    },
  },
  [2215] = {
    [1473] = { --------------- Chamber of Heart
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'chamberofheart',
    },
  },
  [2214] = {
    [1474] = { --------------- The Maelstrom - Heart of Azeroth
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'themaelstromheartofazeroth',
    },
  },
  [2208] = {
    [1476] = { --------------- Twilight Highlands
      lightParamId = nil,
      skyboxFileDataID = 392407, -- Retrieval method: fuzzy name match -> twilighthighlandssky | environments\stars\twilighthighlandssky.mdx
      normalizedName = 'twilighthighlands',
    },
  },
  [1191] = {
    [1478] = { --------------- Ashran
      lightParamId = nil,
      skyboxFileDataID = 841279, -- Retrieval method: fuzzy name match -> ashrandsky | environments\stars\ashrand_sky01.mdx
      normalizedName = 'ashran',
    },
  },
  [2210] = {
    [1479] = { --------------- Baine Rescue
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'bainerescue',
    },
  },
  [2097] = {
    [1490] = { --------------- Mechagon
      lightParamId = 4133,
      skyboxFileDataID = nil,
      normalizedName = 'mechagon',
    },
    [1491] = { --------------- Mechagon
      lightParamId = 4133,
      skyboxFileDataID = nil,
      normalizedName = 'mechagon',
    },
    [1493] = { --------------- Mechagon
      lightParamId = 4133,
      skyboxFileDataID = nil,
      normalizedName = 'mechagon',
    },
    [1494] = { --------------- Mechagon
      lightParamId = 4133,
      skyboxFileDataID = nil,
      normalizedName = 'mechagon',
    },
    [1497] = { --------------- Mechagon
      lightParamId = 4133,
      skyboxFileDataID = nil,
      normalizedName = 'mechagon',
    },
  },
  [2124] = {
    [1501] = { --------------- Crestfall
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'crestfall',
    },
  },
  [1907] = {
    [1502] = { --------------- Snowblossom Village
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'snowblossomvillage',
    },
  },
  [2179] = {
    [1505] = { --------------- Stratholme
      lightParamId = nil,
      skyboxFileDataID = 130636, -- Retrieval method: fuzzy name match -> stratholme | Environments\Stars\StratholmeSkybox.mdx
      normalizedName = 'stratholme',
    },
  },
  [2164] = {
    [1512] = { --------------- The Eternal Palace
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theeternalpalace',
    },
    [1513] = { --------------- The Eternal Palace
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theeternalpalace',
    },
    [1514] = { --------------- The Eternal Palace
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theeternalpalace',
    },
    [1515] = { --------------- The Eternal Palace
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theeternalpalace',
    },
    [1516] = { --------------- The Eternal Palace
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theeternalpalace',
    },
    [1517] = { --------------- The Eternal Palace
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theeternalpalace',
    },
    [1518] = { --------------- The Eternal Palace
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theeternalpalace',
    },
    [1519] = { --------------- The Eternal Palace
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theeternalpalace',
    },
    [1520] = { --------------- The Eternal Palace
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theeternalpalace',
    },
  },
  [2232] = {
    [1521] = { --------------- Karazhan Catacombs
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'karazhancatacombs',
    },
  },
  [2222] = {
    [1525] = { --------------- Revendreth
      lightParamId = 4407,
      skyboxFileDataID = nil,
      normalizedName = 'revendreth',
    },
    [1533] = { --------------- Bastion
      lightParamId = 4319,
      skyboxFileDataID = 3087787, -- Retrieval method: skyboxId (574) -> pln bastion sky | 9PLN Bastion Sky
      normalizedName = 'bastion',
    },
    [1536] = { --------------- Maldraxxus
      lightParamId = 4824,
      skyboxFileDataID = 3152583, -- Retrieval method: skyboxId (576) -> mal plaguefall | 9MAL Plaguefall 
      normalizedName = 'maldraxxus',
    },
    [1543] = { --------------- The Maw
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'themaw',
    },
    [1550] = { --------------- The Shadowlands
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theshadowlands',
    },
    [1565] = { --------------- Ardenweald
      lightParamId = 4365,
      skyboxFileDataID = 3065764, -- Retrieval method: skyboxId (571) -> ardsky | 9ARD_MainSky
      normalizedName = 'ardenweald',
    },
    [1569] = { --------------- Bastion
      lightParamId = 4319,
      skyboxFileDataID = 3087787, -- Retrieval method: skyboxId (574) -> pln bastion sky | 9PLN Bastion Sky
      normalizedName = 'bastion',
    },
    [1643] = { --------------- Ardenweald
      lightParamId = 4365,
      skyboxFileDataID = 3065764, -- Retrieval method: skyboxId (571) -> ardsky | 9ARD_MainSky
      normalizedName = 'ardenweald',
    },
    [1647] = { --------------- The Shadowlands
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theshadowlands',
    },
    [1649] = { --------------- Etheric Vault
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ethericvault',
    },
    [1650] = { --------------- Sightless Hold
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sightlesshold',
    },
    [1651] = { --------------- Molten Forge
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'moltenforge',
    },
    [1652] = { --------------- Vault of Souls
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'vaultofsouls',
    },
    [1670] = { --------------- Oribos
      lightParamId = 4958,
      skyboxFileDataID = 3208911, -- Retrieval method: skyboxId (598) -> ori  sky | 9ORI Main Sky
      normalizedName = 'oribos',
    },
    [1672] = { --------------- Oribos
      lightParamId = 4958,
      skyboxFileDataID = 3208911, -- Retrieval method: skyboxId (598) -> ori  sky | 9ORI Main Sky
      normalizedName = 'oribos',
    },
    [1673] = { --------------- Oribos
      lightParamId = 4958,
      skyboxFileDataID = 3208911, -- Retrieval method: skyboxId (598) -> ori  sky | 9ORI Main Sky
      normalizedName = 'oribos',
    },
    [1690] = { --------------- Aspirant's Quarters
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'aspirantsquarters',
    },
    [1698] = { --------------- Seat of the Primus
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'seatoftheprimus',
    },
    [1699] = { --------------- Sinfall
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sinfall',
    },
    [1701] = { --------------- Heart of the Forest
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'heartoftheforest',
    },
    [1702] = { --------------- Heart of the Forest
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'heartoftheforest',
    },
    [1703] = { --------------- Heart of the Forest
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'heartoftheforest',
    },
    [1700] = { --------------- Sinfall
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sinfall',
    },
    [1707] = { --------------- Elysian Hold
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'elysianhold',
    },
    [1708] = { --------------- Elysian Hold
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'elysianhold',
    },
    [1713] = { --------------- Path of Wisdom
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'pathofwisdom',
    },
    [1671] = { --------------- Oribos
      lightParamId = 4958,
      skyboxFileDataID = 3208911, -- Retrieval method: skyboxId (598) -> ori  sky | 9ORI Main Sky
      normalizedName = 'oribos',
    },
    [1738] = { --------------- Revendreth
      lightParamId = 4407,
      skyboxFileDataID = nil,
      normalizedName = 'revendreth',
    },
    [1734] = { --------------- Revendreth
      lightParamId = 4407,
      skyboxFileDataID = nil,
      normalizedName = 'revendreth',
    },
    [1739] = { --------------- Ardenweald
      lightParamId = 4365,
      skyboxFileDataID = 3065764, -- Retrieval method: skyboxId (571) -> ardsky | 9ARD_MainSky
      normalizedName = 'ardenweald',
    },
    [1740] = { --------------- Ardenweald
      lightParamId = 4365,
      skyboxFileDataID = 3065764, -- Retrieval method: skyboxId (571) -> ardsky | 9ARD_MainSky
      normalizedName = 'ardenweald',
    },
    [1741] = { --------------- Maldraxxus
      lightParamId = 4824,
      skyboxFileDataID = 3152583, -- Retrieval method: skyboxId (576) -> mal plaguefall | 9MAL Plaguefall 
      normalizedName = 'maldraxxus',
    },
    [1742] = { --------------- Revendreth
      lightParamId = 4407,
      skyboxFileDataID = nil,
      normalizedName = 'revendreth',
    },
    [1813] = { --------------- Bastion
      lightParamId = 4319,
      skyboxFileDataID = 3087787, -- Retrieval method: skyboxId (574) -> pln bastion sky | 9PLN Bastion Sky
      normalizedName = 'bastion',
    },
    [1814] = { --------------- Maldraxxus
      lightParamId = 4824,
      skyboxFileDataID = 3152583, -- Retrieval method: skyboxId (576) -> mal plaguefall | 9MAL Plaguefall 
      normalizedName = 'maldraxxus',
    },
    [1819] = { --------------- Fungal Terminus
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'fungalterminus',
    },
    [1820] = { --------------- Pit of Anguish
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'pitofanguish',
    },
    [1821] = { --------------- Pit of Anguish
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'pitofanguish',
    },
    [1822] = { --------------- Extractor's Sanatorium
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'extractorssanatorium',
    },
    [1823] = { --------------- Altar of Domination
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'altarofdomination',
    },
    [1824] = { --------------- Matriarch's Den
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'matriarchsden',
    },
    [1825] = { --------------- The Root Cellar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'therootcellar',
    },
    [1827] = { --------------- The Root Cellar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'therootcellar',
    },
    [1816] = { --------------- Claw's Edge
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'clawsedge',
    },
    [1829] = {
      lightParamId = 4319,
      skyboxFileDataID = 3087787, -- Retrieval method: skyboxId (574) -> pln bastion sky | 9PLN Bastion Sky
      normalizedName = 'nil',
    },
    [1818] = { --------------- Tirna Vaal
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'tirnavaal',
    },
    [1826] = { --------------- The Root Cellar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'therootcellar',
    },
    [1714] = { --------------- Third Chamber of Kalliope
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thirdchamberofkalliope',
    },
    [1961] = { --------------- Korthia
      lightParamId = 5243,
      skyboxFileDataID = 3159931, -- Retrieval method: skyboxId (579) -> maw  sky | 9MAW Main Sky
      normalizedName = 'korthia',
    },
    [2008] = { --------------- Chamber of the Sigil
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'chamberofthesigil',
    },
    [2016] = { --------------- Tazavesh, the Veiled Market
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'tazaveshtheveiledmarket',
    },
    [2006] = { --------------- Cavern of Contemplation
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'cavernofcontemplation',
    },
    [2007] = { --------------- Gromit Hollow
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'gromithollow',
    },
  },
  [2258] = {
    [1531] = { --------------- Crapopolis
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'crapopolis',
    },
  },
  [2263] = {
    [1532] = { --------------- Crapopolis
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'crapopolis',
    },
  },
  [2237] = {
    [1534] = { --------------- Orgrimmar
      lightParamId = nil,
      skyboxFileDataID = 901153, -- Retrieval method: fuzzy name match -> fire sky blend | Fire Sky Blend
      normalizedName = 'orgrimmar',
    },
    [1535] = { --------------- Durotar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'durotar',
    },
  },
  [2197] = {
    [1537] = { --------------- Alterac Valley
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'alteracvalley',
    },
  },
  [2266] = {
    [1538] = { --------------- Blackwing Descent
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackwingdescent',
    },
    [1539] = { --------------- Blackwing Descent
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackwingdescent',
    },
  },
  [2187] = {
    [1540] = { --------------- Halls of Origination
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'hallsoforigination',
    },
    [1541] = { --------------- Halls of Origination
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'hallsoforigination',
    },
    [1542] = { --------------- Halls of Origination
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'hallsoforigination',
    },
  },
  [2247] = {
    [1544] = { --------------- Mogu'shan Palace
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'mogushanpalace',
    },
    [1545] = { --------------- Mogu'shan Palace
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'mogushanpalace',
    },
    [1546] = { --------------- Mogu'shan Palace
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'mogushanpalace',
    },
    [1547] = { --------------- Mogu'shan Vaults
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'mogushanvaults',
    },
    [1548] = { --------------- Mogu'shan Vaults
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'mogushanvaults',
    },
    [1549] = { --------------- Mogu'shan Vaults
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'mogushanvaults',
    },
  },
  [2235] = {
    [1552] = { --------------- Caverns of Time
      lightParamId = nil,
      skyboxFileDataID = 130482, -- Retrieval method: fuzzy name match -> cavernsoftimesky | environments\stars\cavernsoftimesky.mdx
      normalizedName = 'cavernsoftime',
    },
    [1553] = { --------------- Caverns of Time
      lightParamId = nil,
      skyboxFileDataID = 130482, -- Retrieval method: fuzzy name match -> cavernsoftimesky | environments\stars\cavernsoftimesky.mdx
      normalizedName = 'cavernsoftime',
    },
    [1554] = { --------------- Serpentshrine Cavern
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'serpentshrinecavern',
    },
    [1555] = { --------------- Tempest Keep
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'tempestkeep',
    },
    [1556] = { --------------- Hyjal Summit
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'hyjalsummit',
    },
    [1557] = { --------------- Naxxramas
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'naxxramas',
    },
    [1558] = { --------------- Icecrown Citadel
      lightParamId = nil,
      skyboxFileDataID = 130551, -- Retrieval method: fuzzy name match -> icecrowncitadelsky | environments\stars\icecrowncitadelsky.mdx
      normalizedName = 'icecrowncitadel',
    },
    [1559] = { --------------- The Bastion of Twilight
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thebastionoftwilight',
    },
    [1560] = { --------------- Blackwing Lair
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackwinglair',
    },
    [1561] = { --------------- Firelands
      lightParamId = nil,
      skyboxFileDataID = 512948, -- Retrieval method: fuzzy name match -> firelandssky | environments\stars\firelandssky01.mdx
      normalizedName = 'firelands',
    },
    [1563] = { --------------- Trial of the Crusader
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'trialofthecrusader',
    },
  },
  [2275] = {
    [1570] = { --------------- Vale of Eternal Blossoms
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'valeofeternalblossoms',
    },
  },
  [2274] = {
    [1571] = { --------------- Uldum
      lightParamId = nil,
      skyboxFileDataID = 375466, -- Retrieval method: fuzzy name match -> uldumsky | environments\stars\uldum_sky01.mdx
      normalizedName = 'uldum',
    },
  },
  [2268] = {
    [1573] = { --------------- Mechagon City
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'mechagoncity',
    },
    [1574] = { --------------- Mechagon City
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'mechagoncity',
    },
  },
  [2245] = {
    [1576] = { --------------- Deepwind Gorge
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'deepwindgorge',
    },
  },
  [2211] = {
    [1577] = { --------------- Gilneas City
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'gilneascity',
    },
  },
  [2282] = {
    [1578] = { --------------- Blackrock Depths
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackrockdepths',
    },
  },
  [2217] = {
    [1580] = { --------------- Ny'alotha
      lightParamId = nil,
      skyboxFileDataID = 3089552, -- Retrieval method: fuzzy name match -> nzo nzoth raid nyalotha | 8NZO Nzoth Raid Nyalotha
      normalizedName = 'nyalotha',
    },
    [1581] = { --------------- Ny'alotha
      lightParamId = nil,
      skyboxFileDataID = 3089552, -- Retrieval method: fuzzy name match -> nzo nzoth raid nyalotha | 8NZO Nzoth Raid Nyalotha
      normalizedName = 'nyalotha',
    },
    [1582] = { --------------- Ny'alotha
      lightParamId = nil,
      skyboxFileDataID = 3089552, -- Retrieval method: fuzzy name match -> nzo nzoth raid nyalotha | 8NZO Nzoth Raid Nyalotha
      normalizedName = 'nyalotha',
    },
    [1590] = { --------------- Ny'alotha
      lightParamId = nil,
      skyboxFileDataID = 3089552, -- Retrieval method: fuzzy name match -> nzo nzoth raid nyalotha | 8NZO Nzoth Raid Nyalotha
      normalizedName = 'nyalotha',
    },
    [1591] = { --------------- Ny'alotha
      lightParamId = nil,
      skyboxFileDataID = 3089552, -- Retrieval method: fuzzy name match -> nzo nzoth raid nyalotha | 8NZO Nzoth Raid Nyalotha
      normalizedName = 'nyalotha',
    },
    [1592] = { --------------- Ny'alotha
      lightParamId = nil,
      skyboxFileDataID = 3089552, -- Retrieval method: fuzzy name match -> nzo nzoth raid nyalotha | 8NZO Nzoth Raid Nyalotha
      normalizedName = 'nyalotha',
    },
    [1593] = { --------------- Ny'alotha
      lightParamId = nil,
      skyboxFileDataID = 3089552, -- Retrieval method: fuzzy name match -> nzo nzoth raid nyalotha | 8NZO Nzoth Raid Nyalotha
      normalizedName = 'nyalotha',
    },
    [1594] = { --------------- Ny'alotha
      lightParamId = nil,
      skyboxFileDataID = 3089552, -- Retrieval method: fuzzy name match -> nzo nzoth raid nyalotha | 8NZO Nzoth Raid Nyalotha
      normalizedName = 'nyalotha',
    },
    [1595] = { --------------- Ny'alotha
      lightParamId = nil,
      skyboxFileDataID = 3089552, -- Retrieval method: fuzzy name match -> nzo nzoth raid nyalotha | 8NZO Nzoth Raid Nyalotha
      normalizedName = 'nyalotha',
    },
    [1596] = { --------------- Ny'alotha
      lightParamId = nil,
      skyboxFileDataID = 3089552, -- Retrieval method: fuzzy name match -> nzo nzoth raid nyalotha | 8NZO Nzoth Raid Nyalotha
      normalizedName = 'nyalotha',
    },
    [1597] = { --------------- Ny'alotha
      lightParamId = nil,
      skyboxFileDataID = 3089552, -- Retrieval method: fuzzy name match -> nzo nzoth raid nyalotha | 8NZO Nzoth Raid Nyalotha
      normalizedName = 'nyalotha',
    },
  },
  [1795] = {
    [1600] = { --------------- Vault of Y'Shaarj
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'vaultofyshaarj',
    },
    [989] = { ---------------- Pandaria
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'pandaria',
    },
  },
  [2297] = {
    [1602] = { --------------- Icecrown Citadel
      lightParamId = nil,
      skyboxFileDataID = 130551, -- Retrieval method: fuzzy name match -> icecrowncitadelsky | environments\stars\icecrowncitadelsky.mdx
      normalizedName = 'icecrowncitadel',
    },
  },
  [2303] = {
    [1603] = { --------------- Ardenweald
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ardenweald',
    },
  },
  [2257] = {
    [1604] = { --------------- Chamber Of Heart
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'chamberofheart',
    },
  },
  [2236] = {
    [1609] = { --------------- Darkmaul Citadel
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'darkmaulcitadel',
    },
    [1610] = { --------------- Darkmaul Citadel
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'darkmaulcitadel',
    },
    [1611] = { --------------- Dark Citadel
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'darkcitadel',
    },
  },
  [2162] = {
    [1614] = { --------------- JT_New_A
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'jtnewa',
    },
    [1615] = { --------------- TG10_Floor [Deprecated]
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'tg10floordeprecated',
    },
    [1617] = { --------------- TG12_Floor [Deprecated]
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'tg12floordeprecated',
    },
    [1616] = { --------------- TG11_Floor [Deprecated]
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'tg11floordeprecated',
    },
    [1618] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1619] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1620] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1621] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1623] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1624] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1627] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1628] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1629] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1630] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1631] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1632] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1635] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1636] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1641] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1645] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1656] = { --------------- Torghast - Map Floor 10 [Deprecated]
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor10deprecated',
    },
    [1658] = { --------------- Alpha_TG_R02
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'alphatgr',
    },
    [1659] = { --------------- Alpha_TG_R03
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'alphatgr',
    },
    [1661] = { --------------- Alpha_TG_R05
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'alphatgr',
    },
    [1705] = { --------------- Torghast - Entrance
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastentrance',
    },
    [1712] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1716] = { --------------- Torghast - Map Floor 22
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1721] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1728] = { --------------- The Runecarver
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'therunecarver',
    },
    [1736] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1749] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1751] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1752] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1753] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1754] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1756] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1757] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1758] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1759] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1760] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1761] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1762] = { --------------- Torghast, Tower of the Damned
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghasttowerofthedamned',
    },
    [1763] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1764] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1765] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1766] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1767] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1768] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1769] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1770] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1771] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1772] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1773] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1774] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1776] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1777] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1778] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1779] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1780] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1781] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1782] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1783] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1784] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1785] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1786] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1787] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1788] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1789] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1791] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1792] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1793] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1794] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1795] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1796] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1797] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1798] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1799] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1800] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1801] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1802] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1803] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1804] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1805] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1806] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1807] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1808] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1809] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1810] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1811] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1812] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1833] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1834] = { --------------- Torghast - Map Floor 24
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1835] = { --------------- Torghast - Map Floor 25
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1836] = { --------------- Torghast - Map Floor 26
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1837] = { --------------- Torghast - Map Floor 27
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1838] = { --------------- Torghast - Map Floor 41
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1839] = { --------------- Torghast - Map Floor 28
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1840] = { --------------- Torghast - Map Floor 40
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1841] = { --------------- Torghast - Map Floor 39
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1842] = { --------------- Torghast - Map Floor 29
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1843] = { --------------- Torghast - Map Floor 38
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1844] = { --------------- Torghast - Map Floor 32
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1845] = { --------------- Torghast - Map Floor 31
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1846] = { --------------- Torghast - Map Floor 33
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1847] = { --------------- Torghast - Map Floor 34
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1848] = { --------------- Torghast - Map Floor 14
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1849] = { --------------- Torghast - Map Floor 16
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1850] = { --------------- Torghast - Map Floor 18
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1851] = { --------------- Torghast - Map Floor 42
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1852] = { --------------- Torghast - Map Floor 44
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1853] = { --------------- Torghast - Map Floor 46
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1854] = { --------------- Torghast - Map Floor 48
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1855] = { --------------- Torghast - Map Floor 49
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1856] = { --------------- Torghast - Map Floor 50
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1857] = { --------------- Torghast - Map Floor 51
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1858] = { --------------- Torghast - Map Floor 52
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1859] = { --------------- Torghast - Map Floor 53
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1860] = { --------------- Torghast - Map Floor 54
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1861] = { --------------- Torghast - Map Floor 57
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1862] = { --------------- Torghast - Map Floor 59
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1863] = { --------------- Torghast - Map Floor 61
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1864] = { --------------- Torghast - Map Floor 63
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1865] = { --------------- Torghast - Map Floor 64
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1867] = { --------------- Torghast - Map Floor 66
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1868] = { --------------- Torghast - Map Floor 67
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1869] = { --------------- Torghast - Map Floor 68
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1870] = { --------------- Torghast - Map Floor 69
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1871] = { --------------- Torghast - Map Floor 70
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1872] = { --------------- Torghast - Map Floor 71
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1873] = { --------------- Torghast - Map Floor 74
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1874] = { --------------- Torghast - Map Floor 75
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1875] = { --------------- Torghast - Map Floor 76
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1876] = { --------------- Torghast - Map Floor 77
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1877] = { --------------- Torghast - Map Floor 78
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1878] = { --------------- Torghast - Map Floor 80
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1879] = { --------------- Torghast - Map Floor 81
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1880] = { --------------- Torghast - Map Floor 83
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1881] = { --------------- Torghast - Map Floor 84
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1882] = { --------------- Torghast - Map Floor 86
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1883] = { --------------- Torghast - Map Floor 87
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1884] = { --------------- Torghast - Map Floor 88
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1885] = { --------------- Torghast - Map Floor 89
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1886] = { --------------- Torghast - Map Floor 92
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1887] = { --------------- Torghast - Map Floor 93
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1888] = { --------------- Torghast - Map Floor 94
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1889] = { --------------- Torghast - Map Floor 95
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1890] = { --------------- Torghast - Map Floor 97
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1891] = { --------------- Torghast - Map Floor 98
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1892] = { --------------- Torghast - Map Floor 99
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1893] = { --------------- Torghast - Map Floor 100
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1894] = { --------------- Torghast - Map Floor 23
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1895] = { --------------- Torghast - Map Floor 35
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1896] = { --------------- Torghast - Map Floor 56
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1897] = { --------------- Torghast - Map Floor 62
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1898] = { --------------- Torghast - Map Floor 82
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1899] = { --------------- Torghast - Map Floor 101
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1900] = { --------------- Torghast - Map Floor 58
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1901] = { --------------- Torghast - Map Floor 73
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1902] = { --------------- Torghast - Map Floor 79
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1903] = { --------------- Torghast - Map Floor 85
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1904] = { --------------- Torghast - Map Floor 90
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1905] = { --------------- Torghast - Map Floor 96
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1907] = { --------------- Torghast - Map Floor 102
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1908] = { --------------- Torghast - Map Floor 60
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1909] = { --------------- Torghast - Map Floor 21
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1910] = { --------------- Torghast - Map Floor 91
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastmapfloor',
    },
    [1913] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1914] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1920] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1921] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1962] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1963] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1964] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1966] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1967] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1968] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1974] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1975] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1976] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1977] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1979] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1980] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1981] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1982] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1983] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1984] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1985] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1986] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1987] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1988] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1965] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [1969] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [2009] = { --------------- TG106_Floor_MM
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'tg106floormm',
    },
    [2010] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [2011] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [2012] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
    [2019] = { --------------- Torghast
      lightParamId = 4845,
      skyboxFileDataID = nil,
      normalizedName = 'torghast',
    },
  },
  [2299] = {
    [1642] = { --------------- Val'sharah
      lightParamId = nil,
      skyboxFileDataID = 1368570, -- Retrieval method: fuzzy name match -> valsharahskyenchanted | environments\stars\valsharah_sky01_enchanted.mdx
      normalizedName = 'valsharah',
    },
  },
  [2360] = {
    [1644] = { --------------- Ember Court
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'embercourt',
    },
  },
  [2364] = {
    [1648] = { --------------- The Maw
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'themaw',
    },
  },
  [2363] = {
    [1662] = { --------------- Queen's Conservatory
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'queensconservatory',
    },
  },
  [2287] = {
    [1663] = { --------------- Halls of Atonement
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'hallsofatonement',
    },
    [1665] = { --------------- Halls of Atonement
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'hallsofatonement',
    },
    [1664] = { --------------- Halls of Atonement
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'hallsofatonement',
    },
  },
  [2286] = {
    [1666] = { --------------- The Necrotic Wake
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thenecroticwake',
    },
    [1667] = { --------------- The Necrotic Wake
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thenecroticwake',
    },
    [1668] = { --------------- The Necrotic Wake
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thenecroticwake',
    },
  },
  [2290] = {
    [1669] = { --------------- Mists of Tirna Scithe
      lightParamId = 4716,
      skyboxFileDataID = 3065764, -- Retrieval method: skyboxId (571) -> ardsky | 9ARD_MainSky
      normalizedName = 'mistsoftirnascithe',
    },
  },
  [2289] = {
    [1674] = { --------------- Plaguefall
      lightParamId = 4787,
      skyboxFileDataID = 3152583, -- Retrieval method: skyboxId (591) -> mal plaguefall | 9MAL Plaguefall 
      normalizedName = 'plaguefall',
    },
    [1697] = { --------------- Plaguefall
      lightParamId = 4787,
      skyboxFileDataID = 3152583, -- Retrieval method: skyboxId (591) -> mal plaguefall | 9MAL Plaguefall 
      normalizedName = 'plaguefall',
    },
  },
  [2284] = {
    [1675] = { --------------- Sanguine Depths
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sanguinedepths',
    },
    [1676] = { --------------- Sanguine Depths
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sanguinedepths',
    },
  },
  [2291] = {
    [1678] = { --------------- De Other Side
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'deotherside',
    },
    [1679] = { --------------- De Other Side
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'deotherside',
    },
    [1680] = { --------------- De Other Side
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'deotherside',
    },
    [1677] = { --------------- De Other Side
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'deotherside',
    },
  },
  [2293] = {
    [1683] = { --------------- Theater of Pain
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theaterofpain',
    },
    [1684] = { --------------- Theater of Pain
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theaterofpain',
    },
    [1685] = { --------------- Theater of Pain
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theaterofpain',
    },
    [1686] = { --------------- Theater of Pain
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theaterofpain',
    },
    [1687] = { --------------- Theater of Pain
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theaterofpain',
    },
  },
  [2278] = {
    [1688] = { --------------- Revendreth
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'revendreth',
    },
  },
  [2362] = {
    [1689] = { --------------- Maldraxxus
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'maldraxxus',
    },
  },
  [2368] = {
    [1691] = { --------------- Shattered Grove
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'shatteredgrove',
    },
    [1715] = { --------------- Vestibule Of Eternity
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'vestibuleofeternity',
    },
    [1717] = { --------------- Chill's Reach
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'chillsreach',
    },
  },
  [2285] = {
    [1692] = { --------------- Spires Of Ascension
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'spiresofascension',
    },
    [1693] = { --------------- Spires Of Ascension
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'spiresofascension',
    },
    [1694] = { --------------- Spires Of Ascension
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'spiresofascension',
    },
    [1695] = { --------------- Spires Of Ascension
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'spiresofascension',
    },
  },
  [2371] = {
    [1709] = { --------------- Ardenweald
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ardenweald',
    },
  },
  [2375] = {
    [1711] = { --------------- Ascension Coliseum
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ascensioncoliseum',
    },
  },
  [2354] = {
    [1720] = { --------------- Covenant_Ard_Torghast
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'covenantardtorghast',
    },
  },
  [2277] = {
    [1724] = { --------------- Vortrexxis
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'vortrexxis',
    },
  },
  [2261] = {
    [1726] = { --------------- The North Sea
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thenorthsea',
    },
  },
  [2369] = {
    [1727] = { --------------- The North Sea
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thenorthsea',
    },
  },
  [2296] = {
    [1735] = { --------------- Castle Nathria
      lightParamId = 4881,
      skyboxFileDataID = 3164522, -- Retrieval method: skyboxId (583) -> cas zone sky | 9CAS Zone Sky
      normalizedName = 'castlenathria',
    },
    [1744] = { --------------- Castle Nathria
      lightParamId = 4881,
      skyboxFileDataID = 3164522, -- Retrieval method: skyboxId (583) -> cas zone sky | 9CAS Zone Sky
      normalizedName = 'castlenathria',
    },
    [1745] = { --------------- Castle Nathria
      lightParamId = 4881,
      skyboxFileDataID = 3164522, -- Retrieval method: skyboxId (583) -> cas zone sky | 9CAS Zone Sky
      normalizedName = 'castlenathria',
    },
    [1746] = { --------------- Castle Nathria
      lightParamId = 4881,
      skyboxFileDataID = 3164522, -- Retrieval method: skyboxId (583) -> cas zone sky | 9CAS Zone Sky
      normalizedName = 'castlenathria',
    },
    [1747] = { --------------- Castle Nathria
      lightParamId = 4881,
      skyboxFileDataID = 3164522, -- Retrieval method: skyboxId (583) -> cas zone sky | 9CAS Zone Sky
      normalizedName = 'castlenathria',
    },
    [1748] = { --------------- Castle Nathria
      lightParamId = 4881,
      skyboxFileDataID = 3164522, -- Retrieval method: skyboxId (583) -> cas zone sky | 9CAS Zone Sky
      normalizedName = 'castlenathria',
    },
    [1750] = { --------------- Castle Nathria
      lightParamId = 4881,
      skyboxFileDataID = 3164522, -- Retrieval method: skyboxId (583) -> cas zone sky | 9CAS Zone Sky
      normalizedName = 'castlenathria',
    },
  },
  [2356] = {
    [1755] = { --------------- Castle Nathria
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'castlenathria',
    },
  },
  [2453] = {
    [1911] = { --------------- Torghast - Entrance
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'torghastentrance',
    },
    [1912] = { --------------- The Runecarver's Oubliette
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'therunecarversoubliette',
    },
  },
  [2439] = {
    [1917] = { --------------- De Other Side
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'deotherside',
    },
  },
  [2076] = {
    [1958] = { --------------- Firelands
      lightParamId = nil,
      skyboxFileDataID = 512948, -- Retrieval method: fuzzy name match -> firelandssky | environments\stars\firelandssky01.mdx
      normalizedName = 'firelands',
    },
    [1959] = { --------------- Firelands
      lightParamId = nil,
      skyboxFileDataID = 512948, -- Retrieval method: fuzzy name match -> firelandssky | environments\stars\firelandssky01.mdx
      normalizedName = 'firelands',
    },
  },
  [2456] = {
    [1960] = { --------------- The Maw
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'themaw',
    },
  },
  [2374] = {
    [1970] = { --------------- Zereth Mortis
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'zerethmortis',
    },
    [2027] = { --------------- Blooming Foundry
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'bloomingfoundry',
    },
    [2028] = { --------------- Locrian Esper
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'locrianesper',
    },
    [2029] = { --------------- Gravid Repose
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'gravidrepose',
    },
    [2031] = { --------------- Crypts of the Eternal
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'cryptsoftheeternal',
    },
    [2030] = { --------------- Nexus of Actualization
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'nexusofactualization',
    },
    [2046] = { --------------- Zereth Mortis
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'zerethmortis',
    },
    [2059] = { --------------- Resonant Peaks
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'resonantpeaks',
    },
    [2066] = { --------------- Catalyst Wards
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'catalystwards',
    },
  },
  [2472] = {
    [1971] = { --------------- Skyhold
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'skyhold',
    },
  },
  [2441] = {
    [1989] = { --------------- Tazavesh, the Veiled Market
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'tazaveshtheveiledmarket',
    },
    [1990] = { --------------- Tazavesh, the Veiled Market
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'tazaveshtheveiledmarket',
    },
    [1991] = { --------------- Tazavesh, the Veiled Market
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'tazaveshtheveiledmarket',
    },
    [1992] = { --------------- Tazavesh, the Veiled Market
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'tazaveshtheveiledmarket',
    },
    [1993] = { --------------- Tazavesh, the Veiled Market
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'tazaveshtheveiledmarket',
    },
    [1995] = { --------------- Tazavesh, the Veiled Market
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'tazaveshtheveiledmarket',
    },
    [1996] = { --------------- Tazavesh, the Veiled Market
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'tazaveshtheveiledmarket',
    },
    [1997] = { --------------- Tazavesh, the Veiled Market
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'tazaveshtheveiledmarket',
    },
  },
  [2450] = {
    [1998] = { --------------- Sanctum of Domination
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sanctumofdomination',
    },
    [1999] = { --------------- Sanctum of Domination
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sanctumofdomination',
    },
    [2000] = { --------------- Sanctum of Domination
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sanctumofdomination',
    },
    [2001] = { --------------- Sanctum of Domination
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sanctumofdomination',
    },
    [2002] = { --------------- Sanctum of Domination
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sanctumofdomination',
    },
    [2003] = { --------------- Sanctum of Domination
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sanctumofdomination',
    },
    [2004] = { --------------- Sanctum of Domination
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sanctumofdomination',
    },
  },
  [2464] = {
    [2005] = { --------------- Ardenweald
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ardenweald',
    },
  },
  [2482] = {
    [2017] = { --------------- Spires of Ascension
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'spiresofascension',
    },
    [2018] = { --------------- Spires of Ascension
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'spiresofascension',
    },
  },
  [2504] = {
    [2042] = { --------------- The Crucible
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thecrucible',
    },
  },
  [2481] = {
    [2047] = { --------------- Sepulcher of the First Ones
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sepulcherofthefirstones',
    },
    [2048] = { --------------- Sepulcher of the First Ones
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sepulcherofthefirstones',
    },
    [2049] = { --------------- Sepulcher of the First Ones
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sepulcherofthefirstones',
    },
    [2050] = { --------------- Sepulcher of the First Ones
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sepulcherofthefirstones',
    },
    [2051] = { --------------- Sepulcher of the First Ones
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sepulcherofthefirstones',
    },
    [2052] = { --------------- Sepulcher of the First Ones
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sepulcherofthefirstones',
    },
    [2055] = { --------------- Sepulcher of the First Ones
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sepulcherofthefirstones',
    },
    [2061] = { --------------- Sepulcher of the First Ones
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sepulcherofthefirstones',
    },
  },
  [2532] = {
    [2070] = { --------------- Tirisfal Glades
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'tirisfalglades',
    },
  },
  [2451] = {
    [2071] = { --------------- Uldaman: Legacy of Tyr
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'uldamanlegacyoftyr',
    },
    [2072] = { --------------- Uldaman: Legacy of Tyr
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'uldamanlegacyoftyr',
    },
  },
  [2515] = {
    [2073] = { --------------- The Azure Vault
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theazurevault',
    },
    [2074] = { --------------- The Azure Vault
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theazurevault',
    },
    [2075] = { --------------- The Azure Vault
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theazurevault',
    },
    [2076] = { --------------- The Azure Vault
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theazurevault',
    },
    [2077] = { --------------- The Azure Vault
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theazurevault',
    },
  },
  [2519] = {
    [2080] = { --------------- Neltharus
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'neltharus',
    },
    [2081] = { --------------- Neltharus
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'neltharus',
    },
  },
  [2527] = {
    [2082] = { --------------- Halls Of Infusion
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'hallsofinfusion',
    },
    [2083] = { --------------- Halls Of Infusion
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'hallsofinfusion',
    },
  },
  [2556] = {
    [2084] = { --------------- The Emerald Dreamway
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theemeralddreamway',
    },
  },
  [2512] = {
    [2085] = { --------------- The Primalist Future
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theprimalistfuture',
    },
    [2088] = { --------------- Pandaren Revolution
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'pandarenrevolution',
    },
    [2089] = { --------------- The Black Empire
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theblackempire',
    },
    [2090] = { --------------- The Gnoll War
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thegnollwar',
    },
    [2091] = { --------------- War of the Shifting Sands
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'waroftheshiftingsands',
    },
    [2092] = { --------------- Azmerloth
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'azmerloth',
    },
  },
  [2516] = {
    [2093] = { --------------- The Nokhud Offensive
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thenokhudoffensive',
    },
    [2149] = { --------------- Ohn'ahran Plains
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ohnahranplains',
    },
  },
  [2521] = {
    [2094] = { --------------- Ruby Life Pools
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'rubylifepools',
    },
    [2095] = { --------------- Ruby Life Pools
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'rubylifepools',
    },
  },
  [2520] = {
    [2096] = { --------------- Brackenhide Hollow
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'brackenhidehollow',
    },
    [2106] = { --------------- Brackenhide Hollow
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'brackenhidehollow',
    },
  },
  [2526] = {
    [2097] = { --------------- Algeth'ar Academy
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'algetharacademy',
    },
    [2098] = { --------------- Algeth'ar Academy
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'algetharacademy',
    },
    [2099] = { --------------- Algeth'ar Academy
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'algetharacademy',
    },
  },
  [2570] = {
    [2110] = { --------------- The Support Creche
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thesupportcreche',
    },
    [2111] = { --------------- The Siege Creche
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thesiegecreche',
    },
    [2118] = { --------------- The Forbidden Reach
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theforbiddenreach',
    },
    [2131] = { --------------- The Forbidden Reach
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theforbiddenreach',
    },
    [2109] = { --------------- The War Creche
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thewarcreche',
    },
  },
  [2522] = {
    [2119] = { --------------- Vault of the Incarnates
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'vaultoftheincarnates',
    },
    [2120] = { --------------- Vault of the Incarnates
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'vaultoftheincarnates',
    },
    [2121] = { --------------- Vault of the Incarnates
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'vaultoftheincarnates',
    },
    [2122] = { --------------- Vault of the Incarnates
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'vaultoftheincarnates',
    },
    [2123] = { --------------- Vault of the Incarnates
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'vaultoftheincarnates',
    },
    [2124] = { --------------- Vault of the Incarnates
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'vaultoftheincarnates',
    },
    [2125] = { --------------- Vault of the Incarnates
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'vaultoftheincarnates',
    },
    [2126] = { --------------- Vault of the Incarnates
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'vaultoftheincarnates',
    },
    [2135] = { --------------- Valdrakken
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'valdrakken',
    },
  },
  [2454] = {
    [2133] = { --------------- Zaralek Cavern
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'zaralekcavern',
    },
    [2175] = { --------------- Zaralek Cavern
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'zaralekcavern',
    },
    [2184] = { --------------- Zaralek Cavern
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'zaralekcavern',
    },
  },
  [2583] = {
    [2146] = { --------------- The Eastern Glades
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theeasternglades',
    },
  },
  [2582] = {
    [2162] = { --------------- Alterac Valley
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'alteracvalley',
    },
  },
  [2597] = {
    [2165] = { --------------- The Throughway
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thethroughway',
    },
  },
  [2569] = {
    [2166] = { --------------- Aberrus, the Shadowed Crucible
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'aberrustheshadowedcrucible',
    },
    [2167] = { --------------- Aberrus, the Shadowed Crucible
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'aberrustheshadowedcrucible',
    },
    [2168] = { --------------- Aberrus, the Shadowed Crucible
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'aberrustheshadowedcrucible',
    },
    [2169] = { --------------- Aberrus, the Shadowed Crucible
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'aberrustheshadowedcrucible',
    },
    [2170] = { --------------- Aberrus, the Shadowed Crucible
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'aberrustheshadowedcrucible',
    },
  },
  [2600] = {
    [2171] = { --------------- Aberrus, the Shadowed Crucible
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'aberrustheshadowedcrucible',
    },
    [2172] = { --------------- Aberrus, the Shadowed Crucible
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'aberrustheshadowedcrucible',
    },
    [2173] = { --------------- Aberrus, the Shadowed Crucible
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'aberrustheshadowedcrucible',
    },
    [2174] = { --------------- Aberrus, the Shadowed Crucible
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'aberrustheshadowedcrucible',
    },
  },
  [2625] = {
    [2176] = { --------------- The Maelstrom
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'themaelstrom',
    },
  },
  [2590] = {
    [2183] = { --------------- The Azure Vault
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theazurevault',
    },
  },
  [2579] = {
    [2190] = { --------------- Sanctum of Chronology
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sanctumofchronology',
    },
    [2191] = { --------------- Millennia's Threshold
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'millenniasthreshold',
    },
    [2192] = { --------------- Locus of Eternity
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'locusofeternity',
    },
    [2193] = { --------------- Spoke of Endless Winter
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'spokeofendlesswinter',
    },
    [2194] = { --------------- Crossroads of Fate
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'crossroadsoffate',
    },
    [2195] = { --------------- Infinite Conflux
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'infiniteconflux',
    },
    [2196] = { --------------- Twisting Approach
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'twistingapproach',
    },
    [2197] = { --------------- Immemorial Battlefield
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'immemorialbattlefield',
    },
    [2198] = { --------------- Dawn of the Infinite
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'dawnoftheinfinite',
    },
  },
  [2548] = {
    [2200] = { --------------- Emerald Dream
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'emeralddream',
    },
    [2241] = { --------------- Emerald Dream
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'emeralddream',
    },
    [2253] = { --------------- Sor'theril Barrow Den
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sortherilbarrowden',
    },
    [2254] = { --------------- Barrows of Reverie
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'barrowsofreverie',
    },
  },
  [2593] = {
    [2201] = { --------------- Azq'roth
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'azqroth',
    },
  },
  [2595] = {
    [2202] = { --------------- Azewrath
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'azewrath',
    },
  },
  [2639] = {
    [2203] = { --------------- Azmourne
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'azmourne',
    },
  },
  [2586] = {
    [2204] = { --------------- Azmerloth
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'azmerloth',
    },
  },
  [2635] = {
    [2205] = { --------------- Ulderoth
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ulderoth',
    },
  },
  [2587] = {
    [2206] = { --------------- A.Z.E.R.O.T.H.
      lightParamId = nil,
      skyboxFileDataID = 527828, -- Retrieval method: fuzzy name match -> fallofazeroth | environments\stars\fallofazeroth01.mdx
      normalizedName = 'azeroth',
    },
  },
  [2634] = {
    [2207] = { --------------- The Warlands
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thewarlands',
    },
  },
  [1004] = {
    [436] = { ---------------- Scarlet Monastery
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'scarletmonastery',
    },
    [435] = { ---------------- Scarlet Monastery
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'scarletmonastery',
    },
  },
  [2653] = {
    [2211] = { --------------- Aberrus, the Shadowed Crucible
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'aberrustheshadowedcrucible',
    },
  },
  [2601] = {
    [2213] = { --------------- City of Threads
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'cityofthreads',
    },
    [2214] = { --------------- The Ringing Deeps
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theringingdeeps',
    },
    [2215] = { --------------- Hallowfall
      lightParamId = 6079,
      skyboxFileDataID = nil,
      normalizedName = 'hallowfall',
    },
    [2216] = { --------------- City of Threads - Lower
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'cityofthreadslower',
    },
    [2255] = { --------------- Azj-Kahet
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'azjkahet',
    },
    [2256] = { --------------- Azj-Kahet - Lower
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'azjkahetlower',
    },
    [2270] = { --------------- Azj' Kahet
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'azjkahet',
    },
    [2272] = { --------------- The Ringing Deeps
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theringingdeeps',
    },
    [2273] = { --------------- Hallowfall
      lightParamId = 6079,
      skyboxFileDataID = nil,
      normalizedName = 'hallowfall',
    },
    [2274] = { --------------- Khaz Algar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'khazalgar',
    },
    [2276] = { --------------- Khaz Algar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'khazalgar',
    },
    [947] = { ---------------- Azeroth
      lightParamId = nil,
      skyboxFileDataID = 527828, -- Retrieval method: fuzzy name match -> fallofazeroth | environments\stars\fallofazeroth01.mdx
      normalizedName = 'azeroth',
    },
    [2431] = { --------------- Minimap_RingingDeeps_Coreway
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'minimapringingdeepscoreway',
    },
  },
  [2654] = {
    [2220] = { --------------- The Nighthold
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thenighthold',
    },
    [2221] = { --------------- The Nighthold
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thenighthold',
    },
  },
  [2668] = {
    [2228] = { --------------- The Black Empire
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theblackempire',
    },
  },
  [2644] = {
    [2230] = { --------------- Halls Of Valor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'hallsofvalor',
    },
    [2231] = { --------------- Halls Of Valor
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'hallsofvalor',
    },
  },
  [2549] = {
    [2232] = { --------------- Amirdrassil
      lightParamId = 6248,
      skyboxFileDataID = 5333222, -- Retrieval method: skyboxId (649) -> emd zone  | 10EMD Zone Skybox
      normalizedName = 'amirdrassil',
    },
    [2233] = { --------------- Amirdrassil
      lightParamId = 6248,
      skyboxFileDataID = 5333222, -- Retrieval method: skyboxId (649) -> emd zone  | 10EMD Zone Skybox
      normalizedName = 'amirdrassil',
    },
    [2234] = { --------------- Amirdrassil
      lightParamId = 6248,
      skyboxFileDataID = 5333222, -- Retrieval method: skyboxId (649) -> emd zone  | 10EMD Zone Skybox
      normalizedName = 'amirdrassil',
    },
    [2235] = { --------------- The Northern Boughs
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thenorthernboughs',
    },
    [2236] = { --------------- The Eastern Boughs
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theeasternboughs',
    },
    [2238] = { --------------- Amirdrassil
      lightParamId = 6248,
      skyboxFileDataID = 5333222, -- Retrieval method: skyboxId (649) -> emd zone  | 10EMD Zone Skybox
      normalizedName = 'amirdrassil',
    },
    [2240] = { --------------- Amirdrassil
      lightParamId = 6248,
      skyboxFileDataID = 5333222, -- Retrieval method: skyboxId (649) -> emd zone  | 10EMD Zone Skybox
      normalizedName = 'amirdrassil',
    },
    [2244] = { --------------- Amirdrassil
      lightParamId = 6248,
      skyboxFileDataID = 5333222, -- Retrieval method: skyboxId (649) -> emd zone  | 10EMD Zone Skybox
      normalizedName = 'amirdrassil',
    },
    [2237] = { --------------- The Southern Boughs
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thesouthernboughs',
    },
  },
  [2552] = {
    [2248] = { --------------- Isle of Dorn
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'isleofdorn',
    },
    [2271] = { --------------- Isle of Dorn
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'isleofdorn',
    },
    [2274] = { --------------- Khaz Algar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'khazalgar',
    },
    [2276] = { --------------- Khaz Algar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'khazalgar',
    },
    [2328] = { --------------- The Proscenium
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theproscenium',
    },
    [2339] = { --------------- Dornogal
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'dornogal',
    },
    [2367] = { --------------- Vault of Memory
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'vaultofmemory',
    },
    [947] = { ---------------- Azeroth
      lightParamId = nil,
      skyboxFileDataID = 527828, -- Retrieval method: fuzzy name match -> fallofazeroth | environments\stars\fallofazeroth01.mdx
      normalizedName = 'azeroth',
    },
  },
  [2681] = {
    [2250] = { --------------- Kriegval's Rest
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'kriegvalsrest',
    },
  },
  [2683] = {
    [2251] = { --------------- The Waterworks
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thewaterworks',
    },
  },
  [2695] = {
    [2257] = { --------------- Arathi Highlands
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'arathihighlands',
    },
  },
  [2680] = {
    [2269] = { --------------- Earthcrawl Mines
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'earthcrawlmines',
    },
  },
  [2678] = {
    [2266] = { --------------- Millenia's Threshold
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'milleniasthreshold',
    },
  },
  [2686] = {
    [2277] = { --------------- Nightfall Sanctum
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'nightfallsanctum',
    },
  },
  [2657] = {
    [2291] = { --------------- Nerub-ar Palace
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'nerubarpalace',
    },
    [2292] = { --------------- Nerub-ar Palace
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'nerubarpalace',
    },
    [2293] = { --------------- Nerub-ar Palace
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'nerubarpalace',
    },
    [2294] = { --------------- Nerub-ar Palace
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'nerubarpalace',
    },
    [2295] = { --------------- Nerub-ar Palace
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'nerubarpalace',
    },
    [2296] = { --------------- Nerub-ar Palace
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'nerubarpalace',
    },
    [2298] = { --------------- Nerub-ar Palace
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'nerubarpalace',
    },
  },
  [2690] = {
    [2299] = { --------------- The Underkeep
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theunderkeep',
    },
  },
  [2687] = {
    [2300] = { --------------- The Sinkhole
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thesinkhole',
    },
    [2301] = { --------------- The Sinkhole
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thesinkhole',
    },
  },
  [2684] = {
    [2302] = { --------------- The Dread Pit
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thedreadpit',
    },
  },
  [2651] = {
    [2303] = { --------------- Darkflame Cleft
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'darkflamecleft',
    },
  },
  [2699] = {
    [2304] = { --------------- DarkFlame Cleft
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'darkflamecleft',
    },
  },
  [2731] = {
    [2305] = { --------------- Dalaran
      lightParamId = 6457,
      skyboxFileDataID = 5854980, -- Retrieval method: skyboxId (658) -> xp dalaran intro battle | 11XP Dalaran Intro Battle
      normalizedName = 'dalaran',
    },
    [2306] = { --------------- Dalaran
      lightParamId = 6457,
      skyboxFileDataID = 5854980, -- Retrieval method: skyboxId (658) -> xp dalaran intro battle | 11XP Dalaran Intro Battle
      normalizedName = 'dalaran',
    },
    [2307] = { --------------- Dalaran
      lightParamId = 6457,
      skyboxFileDataID = 5854980, -- Retrieval method: skyboxId (658) -> xp dalaran intro battle | 11XP Dalaran Intro Battle
      normalizedName = 'dalaran',
    },
  },
  [2649] = {
    [2308] = { --------------- Priory of the Sacred Flame
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'prioryofthesacredflame',
    },
    [2309] = { --------------- Priory of the Sacred Flame
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'prioryofthesacredflame',
    },
  },
  [2685] = {
    [2310] = { --------------- Skittering Breach
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'skitteringbreach',
    },
  },
  [2679] = {
    [2312] = { --------------- Mycomancer Cavern
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'mycomancercavern',
    },
  },
  [2688] = {
    [2313] = { --------------- The Spiral Weave
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thespiralweave',
    },
    [2347] = { --------------- The Spiral Weave
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thespiralweave',
    },
  },
  [2689] = {
    [2314] = { --------------- Tak-Rethan Abyss
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'takrethanabyss',
    },
    [2259] = { --------------- Tak-Rethan Abyss
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'takrethanabyss',
    },
  },
  [2648] = {
    [2315] = { --------------- The Rookery
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'therookery',
    },
    [2316] = { --------------- The Rookery
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'therookery',
    },
    [2317] = { --------------- The Rookery
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'therookery',
    },
    [2318] = { --------------- The Rookery
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'therookery',
    },
    [2319] = { --------------- The Rookery
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'therookery',
    },
    [2320] = { --------------- The Rookery
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'therookery',
    },
  },
  [2698] = {
    [2321] = { --------------- Chamber of Heart
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'chamberofheart',
    },
  },
  [2739] = {
    [2322] = { --------------- Hall of Awakening
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'hallofawakening',
    },
  },
  [2716] = {
    [2330] = { --------------- Priory of the Sacred Flame
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'prioryofthesacredflame',
    },
  },
  [2661] = {
    [2335] = { --------------- Cinderbrew Meadery
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'cinderbrewmeadery',
    },
  },
  [2652] = {
    [2341] = { --------------- The Stonevault
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thestonevault',
    },
  },
  [2669] = {
    [2343] = { --------------- City of Threads
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'cityofthreads',
    },
    [2344] = { --------------- City of Threads
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'cityofthreads',
    },
  },
  [2656] = {
    [2345] = { --------------- Deephaul Ravine
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'deephaulravine',
    },
  },
  [2706] = {
    [2346] = { --------------- Undermine
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'undermine',
    },
    [2374] = { --------------- Undermine
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'undermine',
    },
  },
  [2682] = {
    [2348] = { --------------- Zekvir's Lair
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'zekvirslair',
    },
  },
  [2736] = {
    [2351] = { --------------- Razorwind Shores
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'razorwindshores',
    },
    [2402] = { --------------- Horde Housing District
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'hordehousingdistrict',
    },
  },
  [2735] = {
    [2352] = { --------------- Founder's Point
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'founderspoint',
    },
    [2401] = { --------------- Alliance Housing District
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'alliancehousingdistrict',
    },
  },
  [2664] = {
    [2249] = { --------------- Fungal Folly
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'fungalfolly',
    },
  },
  [2776] = {
    [2354] = { --------------- Silithus
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'silithus',
    },
  },
  [2660] = {
    [2357] = { --------------- City of Echoes
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'cityofechoes',
    },
    [2358] = { --------------- City of Echoes
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'cityofechoes',
    },
  },
  [2662] = {
    [2359] = { --------------- The Dawnbreaker
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thedawnbreaker',
    },
  },
  [2792] = {
    [2362] = { --------------- Blackrock Depths
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackrockdepths',
    },
    [2363] = { --------------- Blackrock Depths
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'blackrockdepths',
    },
  },
  [2794] = {
    [2366] = { --------------- The Wandering Isle
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thewanderingisle',
    },
  },
  [2692] = {
    [2368] = { --------------- Hall of Awakening
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'hallofawakening',
    },
  },
  [2127] = {
    [2369] = { --------------- Siren Isle
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sirenisle',
    },
    [2375] = { --------------- The Forgotten Vault
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theforgottenvault',
    },
  },
  [2738] = {
    [2371] = { --------------- K'aresh
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'karesh',
    },
    [2398] = { --------------- K'aresh
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'karesh',
    },
    [2472] = { --------------- Tazavesh
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'tazavesh',
    },
    [2477] = { --------------- Voidscar Cavern
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'voidscarcavern',
    },
  },
  [2796] = {
    [2372] = { --------------- Arathi Highlands
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'arathihighlands',
    },
  },
  [2785] = {
    [2373] = { --------------- The War Creche
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thewarcreche',
    },
  },
  [2801] = {
    [2379] = { --------------- Ny'alotha, the Waking City
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'nyalothathewakingcity',
    },
    [2381] = { --------------- Ny'alotha, the Waking City
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'nyalothathewakingcity',
    },
    [2382] = { --------------- Ny'alotha, the Waking City
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'nyalothathewakingcity',
    },
    [2383] = { --------------- Ny'alotha, the Waking City
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'nyalothathewakingcity',
    },
    [2384] = { --------------- Ny'alotha, the Waking City
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'nyalothathewakingcity',
    },
  },
  [2773] = {
    [2387] = { --------------- Operation: Floodgate
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'operationfloodgate',
    },
    [2388] = { --------------- Operation: Floodgate
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'operationfloodgate',
    },
  },
  [2850] = {
    [2394] = { --------------- Labyrinth
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'labyrinth',
    },
  },
  [2815] = {
    [2396] = { --------------- Excavation Site 9
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'excavationsite',
    },
  },
  [2799] = {
    [2397] = { --------------- Slayer's Rise
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'slayersrise',
    },
  },
  [2828] = {
    [2403] = { --------------- Vision of Orgrimmar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'visionoforgrimmar',
    },
  },
  [2827] = {
    [2404] = { --------------- Vision of Stormwind
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'visionofstormwind',
    },
  },
  [2771] = {
    [2405] = { --------------- Voidstorm
      lightParamId = nil,
      skyboxFileDataID = 1518353, -- Retrieval method: fuzzy name match -> voidstorm test | Voidstorm Test
      normalizedName = 'voidstorm',
    },
    [2444] = { --------------- Slayer's Rise
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'slayersrise',
    },
    [2479] = { --------------- Voidstorm
      lightParamId = nil,
      skyboxFileDataID = 1518353, -- Retrieval method: fuzzy name match -> voidstorm test | Voidstorm Test
      normalizedName = 'voidstorm',
    },
    [2526] = { --------------- Lair of Predaxas
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'lairofpredaxas',
    },
    [2527] = { --------------- Lair of Predaxas
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'lairofpredaxas',
    },
    [2581] = { --------------- Voidburrow
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'voidburrow',
    },
    [2582] = { --------------- Voidburrow
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'voidburrow',
    },
  },
  [2769] = {
    [2406] = { --------------- Undermine
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'undermine',
    },
    [2407] = { --------------- Undermine
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'undermine',
    },
    [2408] = { --------------- Undermine
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'undermine',
    },
    [2409] = { --------------- Undermine
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'undermine',
    },
    [2411] = { --------------- Undermine
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'undermine',
    },
    [2428] = { --------------- Undermine
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'undermine',
    },
  },
  [2694] = {
    [2413] = { --------------- Harandar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'harandar',
    },
    [2480] = { --------------- Harandar
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'harandar',
    },
    [2522] = { --------------- Abundant Grotto
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'abundantgrotto',
    },
    [2523] = { --------------- Abundant Grotto
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'abundantgrotto',
    },
    [2576] = { --------------- The Den
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theden',
    },
  },
  [2818] = {
    [2418] = { --------------- Scarlet Halls
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'scarlethalls',
    },
  },
  [2826] = {
    [2420] = { --------------- Sidestreet Sluice
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sidestreetsluice',
    },
    [2421] = { --------------- Sidestreet Sluice
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sidestreetsluice',
    },
    [2422] = { --------------- Sidestreet Sluice
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sidestreetsluice',
    },
    [2423] = { --------------- Sidestreet Sluice
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sidestreetsluice',
    },
  },
  [2831] = {
    [2425] = { --------------- Demolition Dome
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'demolitiondome',
    },
    [2426] = { --------------- Demolition Dome
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'demolitiondome',
    },
  },
  [1592] = {
    [2427] = { --------------- Sporefall
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sporefall',
    },
  },
  [2858] = {
    [2432] = { --------------- Isle of Quel'Danas
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'isleofqueldanas',
    },
    [2565] = { --------------- Isle of Quel'Danas
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'isleofqueldanas',
    },
    [2566] = { --------------- Isle of Quel'Danas
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'isleofqueldanas',
    },
  },
  [2813] = {
    [2433] = { --------------- Murder Row
      lightParamId = 6547,
      skyboxFileDataID = 7148610, -- Retrieval method: skyboxId (681) -> eswwindrunnersky | 12ESW_WindrunnerSky
      normalizedName = 'murderrow',
    },
    [2434] = { --------------- Augurs' Terrace
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'augursterrace',
    },
    [2435] = { --------------- The Illicit Rain
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theillicitrain',
    },
  },
  [2857] = {
    [2438] = { --------------- Scarlet Halls
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'scarlethalls',
    },
  },
  [2907] = {
    [2443] = { --------------- Silvermoon City
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'silvermooncity',
    },
  },
  [2849] = {
    [2447] = { --------------- Dastardly Dome
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'dastardlydome',
    },
  },
  [2830] = {
    [2449] = { --------------- Eco-Dome Al'dani
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ecodomealdani',
    },
  },
  [2927] = {
    [2451] = { --------------- Arathi Highlands
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'arathihighlands',
    },
  },
  [2803] = {
    [2452] = { --------------- Archival Assault
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'archivalassault',
    },
    [2453] = { --------------- Archival Assault
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'archivalassault',
    },
    [2454] = { --------------- Archival Assault
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'archivalassault',
    },
    [2455] = { --------------- Archival Assault
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'archivalassault',
    },
    [2476] = { --------------- Archival Assault
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'archivalassault',
    },
  },
  [2810] = {
    [2460] = { --------------- Manaforge Omega
      lightParamId = 6751,
      skyboxFileDataID = 7011605, -- Retrieval method: skyboxId (679) -> xp dimensius phase | 11XP Dimensius Phase 2-3
      normalizedName = 'manaforgeomega',
    },
    [2461] = { --------------- Manaforge Omega
      lightParamId = 6751,
      skyboxFileDataID = 7011605, -- Retrieval method: skyboxId (679) -> xp dimensius phase | 11XP Dimensius Phase 2-3
      normalizedName = 'manaforgeomega',
    },
    [2462] = { --------------- Manaforge Omega
      lightParamId = 6751,
      skyboxFileDataID = 7011605, -- Retrieval method: skyboxId (679) -> xp dimensius phase | 11XP Dimensius Phase 2-3
      normalizedName = 'manaforgeomega',
    },
    [2463] = { --------------- Manaforge Omega
      lightParamId = 6751,
      skyboxFileDataID = 7011605, -- Retrieval method: skyboxId (679) -> xp dimensius phase | 11XP Dimensius Phase 2-3
      normalizedName = 'manaforgeomega',
    },
    [2464] = { --------------- Manaforge Omega
      lightParamId = 6751,
      skyboxFileDataID = 7011605, -- Retrieval method: skyboxId (679) -> xp dimensius phase | 11XP Dimensius Phase 2-3
      normalizedName = 'manaforgeomega',
    },
    [2465] = { --------------- Manaforge Omega
      lightParamId = 6751,
      skyboxFileDataID = 7011605, -- Retrieval method: skyboxId (679) -> xp dimensius phase | 11XP Dimensius Phase 2-3
      normalizedName = 'manaforgeomega',
    },
    [2466] = { --------------- Manaforge Omega
      lightParamId = 6751,
      skyboxFileDataID = 7011605, -- Retrieval method: skyboxId (679) -> xp dimensius phase | 11XP Dimensius Phase 2-3
      normalizedName = 'manaforgeomega',
    },
    [2467] = { --------------- Manaforge Omega
      lightParamId = 6751,
      skyboxFileDataID = 7011605, -- Retrieval method: skyboxId (679) -> xp dimensius phase | 11XP Dimensius Phase 2-3
      normalizedName = 'manaforgeomega',
    },
    [2468] = { --------------- Manaforge Omega
      lightParamId = 6751,
      skyboxFileDataID = 7011605, -- Retrieval method: skyboxId (679) -> xp dimensius phase | 11XP Dimensius Phase 2-3
      normalizedName = 'manaforgeomega',
    },
    [2469] = { --------------- Manaforge Omega
      lightParamId = 6751,
      skyboxFileDataID = 7011605, -- Retrieval method: skyboxId (679) -> xp dimensius phase | 11XP Dimensius Phase 2-3
      normalizedName = 'manaforgeomega',
    },
    [2470] = { --------------- Manaforge Omega
      lightParamId = 6751,
      skyboxFileDataID = 7011605, -- Retrieval method: skyboxId (679) -> xp dimensius phase | 11XP Dimensius Phase 2-3
      normalizedName = 'manaforgeomega',
    },
    [2471] = { --------------- Manaforge Omega
      lightParamId = 6751,
      skyboxFileDataID = 7011605, -- Retrieval method: skyboxId (679) -> xp dimensius phase | 11XP Dimensius Phase 2-3
      normalizedName = 'manaforgeomega',
    },
  },
  [2951] = {
    [2484] = { --------------- Voidrazor Sanctuary
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'voidrazorsanctuary',
    },
  },
  [2805] = {
    [2492] = { --------------- Windrunner Spire
      lightParamId = 6647,
      skyboxFileDataID = 1612982, -- Retrieval method: skyboxId (669) -> placeholder empty   morgan test | PLACEHOLDER Empty Skybox - Morgan Test
      normalizedName = 'windrunnerspire',
    },
    [2493] = { --------------- Windrunner Spire
      lightParamId = 6647,
      skyboxFileDataID = 1612982, -- Retrieval method: skyboxId (669) -> placeholder empty   morgan test | PLACEHOLDER Empty Skybox - Morgan Test
      normalizedName = 'windrunnerspire',
    },
    [2494] = { --------------- Windrunner Spire
      lightParamId = 6647,
      skyboxFileDataID = 1612982, -- Retrieval method: skyboxId (669) -> placeholder empty   morgan test | PLACEHOLDER Empty Skybox - Morgan Test
      normalizedName = 'windrunnerspire',
    },
    [2496] = { --------------- Windrunner Spire
      lightParamId = 6647,
      skyboxFileDataID = 1612982, -- Retrieval method: skyboxId (669) -> placeholder empty   morgan test | PLACEHOLDER Empty Skybox - Morgan Test
      normalizedName = 'windrunnerspire',
    },
    [2497] = { --------------- Windrunner Spire
      lightParamId = 6647,
      skyboxFileDataID = 1612982, -- Retrieval method: skyboxId (669) -> placeholder empty   morgan test | PLACEHOLDER Empty Skybox - Morgan Test
      normalizedName = 'windrunnerspire',
    },
    [2498] = { --------------- Windrunner Spire
      lightParamId = 6647,
      skyboxFileDataID = 1612982, -- Retrieval method: skyboxId (669) -> placeholder empty   morgan test | PLACEHOLDER Empty Skybox - Morgan Test
      normalizedName = 'windrunnerspire',
    },
    [2499] = { --------------- Windrunner Spire
      lightParamId = 6647,
      skyboxFileDataID = 1612982, -- Retrieval method: skyboxId (669) -> placeholder empty   morgan test | PLACEHOLDER Empty Skybox - Morgan Test
      normalizedName = 'windrunnerspire',
    },
  },
  [2859] = {
    [2500] = { --------------- The Blinding Vale
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'theblindingvale',
    },
  },
  [2874] = {
    [2501] = { --------------- Maisara Caverns
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'maisaracaverns',
    },
  },
  [2952] = {
    [2502] = { --------------- Shadow Enclave
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'shadowenclave',
    },
  },
  [2961] = {
    [2503] = { --------------- Twilight Crypts
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'twilightcrypts',
    },
    [2504] = { --------------- Twilight Crypts
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'twilightcrypts',
    },
  },
  [2964] = {
    [2505] = { --------------- Gulf of Memory
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'gulfofmemory',
    },
    [2575] = { --------------- Gulf of Memory
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'gulfofmemory',
    },
  },
  [2979] = {
    [2506] = { --------------- Shadowguard Point
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'shadowguardpoint',
    },
  },
  [2966] = {
    [2507] = { --------------- Torment's Rise
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'tormentsrise',
    },
  },
  [2963] = {
    [2510] = { --------------- The Grudge Pit
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thegrudgepit',
    },
  },
  [2811] = {
    [2511] = { --------------- Magisters' Terrace
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'magistersterrace',
    },
    [2515] = { --------------- Magister's Terrace
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'magistersterrace',
    },
    [2516] = { --------------- Magister's Terrace
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'magistersterrace',
    },
    [2517] = { --------------- Magister's Terrace
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'magistersterrace',
    },
    [2518] = { --------------- Magister's Terrace
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'magistersterrace',
    },
    [2519] = { --------------- Magister's Terrace
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'magistersterrace',
    },
    [2520] = { --------------- Magister's Terrace
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'magistersterrace',
    },
  },
  [2825] = {
    [2513] = { --------------- Den of Nalorakk
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'denofnalorakk',
    },
    [2514] = { --------------- Den of Nalorakk
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'denofnalorakk',
    },
    [2564] = { --------------- Den of Nalorakk
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'denofnalorakk',
    },
  },
  [3003] = {
    [2525] = { --------------- The Darkway
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thedarkway',
    },
  },
  [2965] = {
    [2528] = { --------------- Sunkiller Sanctum
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sunkillersanctum',
    },
    [2540] = { --------------- Sunkiller Sanctum
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sunkillersanctum',
    },
    [2571] = { --------------- Sunkiller Sanctum
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'sunkillersanctum',
    },
  },
  [2912] = {
    [2529] = { --------------- The Voidspire
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thevoidspire',
    },
    [2530] = { --------------- The Voidspire
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thevoidspire',
    },
  },
  [2939] = {
    [2531] = { --------------- The Dreamrift
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thedreamrift',
    },
    [2532] = { --------------- The Dreamrift
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'thedreamrift',
    },
  },
  [2913] = {
    [2533] = { --------------- March on Quel'Danas
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'marchonqueldanas',
    },
    [2534] = { --------------- March on Quel'Danas
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'marchonqueldanas',
    },
  },
  [2962] = {
    [2535] = { --------------- Atal'Aman
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'atalaman',
    },
  },
  [2195] = {
    [2541] = { --------------- Arcantina
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'arcantina',
    },
  },
  [2953] = {
    [2545] = { --------------- Parhelion Plaza
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'parhelionplaza',
    },
  },
  [2933] = {
    [2547] = { --------------- Collegiate Calamity
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'collegiatecalamity',
    },
    [2577] = { --------------- Collegiate Calamity
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'collegiatecalamity',
    },
    [2578] = { --------------- Collegiate Calamity
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'collegiatecalamity',
    },
  },
  [2915] = {
    [2556] = { --------------- Nexus Point Xenas
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'nexuspointxenas',
    },
  },
  [2923] = {
    [2572] = { --------------- Voidscar Arena
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'voidscararena',
    },
    [2573] = { --------------- Voidscar Arena
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'voidscararena',
    },
    [2574] = { --------------- Voidscar Arena
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'voidscararena',
    },
  },
  [3014] = {
    [2585] = { --------------- Zul'Aman
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'zulaman',
    },
  },
  [3074] = {
    [2594] = { --------------- Eversong Woods
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'eversongwoods',
    },
  },
  [3076] = {
    [2598] = { --------------- Ritual Site
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'ritualsite',
    },
  },
  [3047] = {
    [2599] = { --------------- Val
      lightParamId = nil,
      skyboxFileDataID = 534551, -- Retrieval method: fuzzy name match -> valleyfourwindssky | environments\stars\valleyfourwindssky01.mdx
      normalizedName = 'val',
    },
    [2617] = { --------------- Void Acropolis
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'voidacropolis',
    },
    [2618] = { --------------- Void Acropolis
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'voidacropolis',
    },
    [2619] = { --------------- Void Acropolis
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'voidacropolis',
    },
    [2620] = { --------------- Forgotten Depths
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'forgottendepths',
    },
    [2621] = { --------------- Forgotten Depths
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'forgottendepths',
    },
    [2622] = { --------------- Val
      lightParamId = nil,
      skyboxFileDataID = 534551, -- Retrieval method: fuzzy name match -> valleyfourwindssky | environments\stars\valleyfourwindssky01.mdx
      normalizedName = 'val',
    },
  },
  [3075] = {
    [2600] = { --------------- Naigtal
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'naigtal',
    },
    [2623] = { --------------- Naigtal
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'naigtal',
    },
    [2646] = { --------------- Vilaldoun
      lightParamId = nil,
      skyboxFileDataID = nil,
      normalizedName = 'vilaldoun',
    },
  },
}
