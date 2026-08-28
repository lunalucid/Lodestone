local _, Lodestone = ...
Lodestone.DynamicSky = Lodestone.DynamicSky or {}
local DynamicSky = Lodestone.DynamicSky

DynamicSky.DEFAULT_SKY_TEXTURES_ID = Lodestone.CONFIG.DEFAULT_SKY_TEXTURES_ID
DynamicSky.DEFAULT_LIGHT_DATA_ID = Lodestone.CONFIG.DEFAULT_LIGHT_DATA_ID

local function skyConfigPreset(id, preset)
  local config = {id = id}
  local presetConfig = DynamicSky.SKY_CONFIG_PRESETS[preset]
  if presetConfig then
    for k, v in pairs(presetConfig) do
      config[k] = v
    end
  end
    return config
end

DynamicSky.SKY_CONFIG_PRESETS = {
  planetx128 = {size = {128, 128}, bandFrac = nil, vOffset = 0, texCoord = nil},
  planetx256 = {size = {128, 128}, bandFrac = nil, vOffset = 0, texCoord = nil},
  planetx512 = {size = {128, 128}, bandFrac = nil, vOffset = 0, texCoord = nil},
  lowcloudx512 = {size = {512, 512}, bandFrac = 0.256, vOffset = 0.33, texCoord = nil},
  topcloudx512 = {size = {512, 512}, bandFrac = 0.56, vOffset = -0.33, texCoord = nil, alpha = 0.8},
  bottomcloudx512 = {size = {512, 512}, bandFrac = 0.56, vOffset = 0.23, texCoord = nil, alpha = 1}
}

DynamicSky.COMMON_SKY_TEXTURES = {
  starry_night_bg = {
    id = 130627,
    size = {512, 512},
    --bandFrac = 1,
    --vOffset = 0,
    --texCoord = nil
  },
  stars_large = {
    id = 130625,
    size = {512, 512},
    blend = 'ADD'
  },
  moon = skyConfigPreset(130561, 'planetx512'), -- azeroth(?)
  orange_planet = skyConfigPreset(130607, 'planetx128'),
  pink_planet = skyConfigPreset(130608, 'planetx128'),
  purple_planet = skyConfigPreset(130610, 'planetx128'),
  red_planet = skyConfigPreset(130611, 'planetx128'),
  saturn_planet = skyConfigPreset(130612, 'planetx256')
}

-- [SkyboxFileDataID] = [<time slot>]
DynamicSky.SKY_TEXTURES = {
  [0] = { -- Default
    [0] = {
      overlay = {id = 1720443, size = {1024, 256}, vOffset = 0, alpha = 0.1}
    },
    [1] = {
      overlay = {id = 1720444, size = {1024, 256}, vOffset = 0, alpha = 0.1}
    },
    [2] = {
      overlay = {id = 1720445, size = {1024, 256}, vOffset = 0, alpha = 0.1}
    }
  },
  [130636] = { -- Stratholme
    [0] = {
      bg = {id = 130637}
    }
  },
  [130482] = { -- Caverns of Time
    [0] = {
      bg = {id = 130489},
      art = {{id = 130625, size = {512, 512}}, skyConfigPreset(130612, 'planetx256')}
    }
  },
  [130497] = { -- Dire Maul
    [0] = {
      bg = {id = 130443, size = {256, 256}, bandFrac = 1, vOffset = -0.3, texCoord = {0, 0.5, 0, 0.5}},
      overlay = skyConfigPreset(130439, 'bottomcloudx512')
    }
  },
  [130525] = { -- Hellfire Peninsula
    [0] = {
      bg = {id = 219310, size = {512, 512}, bandFrac = 0.256, vOffset = 0.2, texCoord = nil},
      overlay = {id = 130528, size = {512, 256}, bandFrac = 1, vOffset = nil, texCoord = {0, 1, 0.2, 0.8}, alpha = 0.8},
      art = skyConfigPreset(130518, 'planetx256')
    }
  },
  [130575] = { -- Nagrand
    [0] = {
      bg = {id = 130570, size = {512, 256}, bandFrac = 0.56, vOffset = 0, texCoord = nil},
      overlay = {id = 130563, size = {512, 512}, bandFrac = 0.256, vOffset = -0.2, texCoord = nil},
      art = {id = 130563, size = {128, 128}, bandFrac = 0.56, vOffset = nil, texCoord = {0, 0.4, 0.5, 0.85}},
    },
    [1] = {
      bg = {id = 130579, size = {512, 256}, bandFrac = 0.56, vOffset = 0, texCoord = nil},
      overlay = {id = 130566, size = {512, 512}, bandFrac = 0.256, vOffset = -0.2, texCoord = nil},
      art = {id = 130567, size = {128, 128}, bandFrac = 0.56, vOffset = nil, texCoord = {0, 0.4, 0.5, 0.85}},
    },
    [2] = {
      bg = {id = 130574, size = {512, 256}, bandFrac = 0.56, vOffset = 0, texCoord = nil},
      overlay = {id = 130565, size = {512, 512}, bandFrac = 0.256, vOffset = -0.2, texCoord = nil},
      art = {id = 130565, size = {128, 128}, bandFrac = 0.56, vOffset = nil, texCoord = {0, 0.4, 0.5, 0.85}},
    }
  },
  [130476] = { -- Blade's Edge
    [0] = {
      bg = {id = 219310, size = {512, 512}, bandFrac = 0.256, vOffset = -0.15, texCoord = nil}, --skyConfigPreset(130457, 'lowcloudx512'),
      overlay = {id = 130479, size = {256, 128}, bandFrac = 1, vOffset = nil, texCoord = {0, 1, 0.2, 0.8}, alpha = 1}, --skyConfigPreset(130458, 'bottomcloudx512'),
      art = {id = 130457, size = {512, 512}, bandFrac = 0.56, vOffset = 0.15, texCoord = nil}, --skyConfigPreset(130470, 'planetx256'),
    }
  },
  [130465] = { -- Blade's Edge Forest
    [0] = {
      bg = {id = 130464, size = {256, 128}},
      overlay = {id = 130479, size = {256, 128}, bandFrac = 1, vOffset = nil, texCoord = {0, 1, 0.2, 0.8}, alpha = 1},
      art = {id = 130461, size = {512, 512}, bandFrac = 0.56, vOffset = 0.15, texCoord = nil},
    }
  },
  [130469] = { -- Blade's Edge Night Elf
    [0] = {
      bg = {id = 130468, size = {256, 128}},
      overlay = {id = 130479, size = {256, 128}, bandFrac = 1, vOffset = nil, texCoord = {0, 1, 0.2, 0.8}, alpha = 1},
      art = {id = 130467, size = {512, 512}, bandFrac = 0.56, vOffset = 0.15, texCoord = nil},
    }
  },
  [130593] = { -- Netherstorm
    [0] = {
      bg = {id = 219310, size = {512, 512}, bandFrac = 0.256, vOffset = -0.15, texCoord = nil},
      overlay = {id = 1259577, size = {256, 128}, bandFrac = 1, vOffset = nil, texCoord = {0, 1, 0.2, 0.8}, alpha = 1},
      art = {id = 193160, size = {512, 256}, bandFrac = 0.56, vOffset = -0.25, texCoord = nil},
    }
  },
  [130481] = { -- Bone Wastes
    [0] = {
      bg = {id = 130443, size = {256, 256}, bandFrac = 1, vOffset = -0.3, texCoord = {0, 0.5, 0, 0.5}},
      overlay = skyConfigPreset(130439, 'bottomcloudx512')
    }
  },
  [130623] = { -- Shadowmoon Valley (Outland)
    [0] = {
      bg = {id = 130618, size = {512, 512}, bandFrac = 0.256, vOffset = -0.3, texCoord = nil},
      overlay = {id = 130618, size = {512, 512}, bandFrac = 0.5, vOffset = 0.3, texCoord = nil, alpha = 0.5}, ---rotate = math.rad(-90)},
      art = {id = 130621, size = {512, 512}, bandFrac = 0.256, vOffset = 0.15, texCoord = nil, alpha = 0.8},
    }
  },
  [130502] = { -- Dragonblight (scarlet)
    [0] = {
      art = {id = 130499, size = {512, 512}, bandFrac = 0.56, vOffset = 0.15, texCoord = nil},
    }
  },
  [1888477] = { -- Stormwind
  },
  [130552] = { -- Icecrown
    [0] = {
      bg = {id = 130549, size = {512, 512}, bandFrac = 0.56, vOffset = 0, texCoord = {0.5, 1, 0, 1}},
      overlay = {id = 130547, size = {512, 512}, bandFrac = 0.56, vOffset = 0, texCoord = nil},
    },
    [2] = {
      bg = {id = 130549, size = {512, 512}, bandFrac = 0.56, vOffset = 0, texCoord = {0.5, 1, 0, 1}},
      overlay = {id = 130545, size = {512, 512}, bandFrac = 0.56, vOffset = 0, texCoord = nil},
    }
  },
  [1613006] = { -- Hyjal
    [0] = {
      bg = {id = 317346, size = {512, 256}, bandFrac = nil, vOffset = 0, texCoord = nil},
      overlay = {id = 317343, size = {512, 512}, bandFrac = nil, vOffset = 0.3, texCoord = nil},
      art = {id = 317345, size = {512, 256}, vOffset = -0.45}
    }
  },
  [534551] = { -- Valley Four Wind Sky
    [0] = {
      bg = {id = 130618, size = {512, 512}, bandFrac = 0.256, vOffset = -0.3, texCoord = nil},
      overlay = {id = 130618, size = {512, 512}, bandFrac = 0.5, vOffset = 0.3, texCoord = nil, alpha = 0.5}, ---rotate = math.rad(-90)},
      art = {id = 130621, size = {512, 512}, bandFrac = 0.256, vOffset = 0.15, texCoord = nil, alpha = 0.8},
    }
  },
  [1607565] = { -- Vale of Eternal Blossoms
    [0] = {
      bg = {id = 587598, size = {512, 512}},
      overlay = {id = 587595, size = {512, 512}, alpha = 1, vOffset = -0.4},
      art = {id = 587594, size = {640, 256}, alpha = 0.3, blend = 'ADD'}
    },
    [1] = {
     bg = {id = 587918, size = {512, 512}},
     overlay = {id = 587916, size = {512, 512}, alpha = 1, vOffset = -0.4},
     art = {id = 587915, size = {640, 256}, alpha = 0.5, blend = 'ADD'}
    },
    [2] = {
      bg = {id = 587702, size = {512, 512}},
      overlay = {id = 587700, size = {512, 512}, alpha = 1, vOffset = -0.4},
      art = {id = 587699, size = {640, 256}, alpha = 0.5, blend = 'ADD'}
    }
  },
  [235302] = { -- Dalaran (Northrend)
  [0] = {
    bg = {id = 235300, size = {512, 256}, vOffset = -0.4},
    overlay = {id = 235295, size = {512, 512}, alpha = 1},
    art = {id = 130628, size = {512, 512}, blend = 'ADD'}
  },
  [1] = {
    bg = {id = 130579, size = {512, 256}, vOffset = -0.4},
    overlay = {id = 130576, size = {512, 512}, alpha = 1},
    art = {id = 130628, size = {512, 512}, blend = 'ADD'}
  },
  [2] = {
    bg = {id = 130574, size = {512, 256}, vOffset = -0.4},
    overlay = {id = 130572, size = {512, 512}, alpha = 1},
    art = {id = 130628, size = {512, 512}, blend = 'ADD'}
  },
  },
  [130485] = { -- Coldarra (unchecked)
    [0] = {
      bg = skyConfigPreset(130486, 'lowcloudx512'),
      overlay = skyConfigPreset(130484, 'bottomcloudx512'),
      art = skyConfigPreset(130483, 'planetx256'),
    }
  },
  [454481] = { -- Skywall
    [0] = {
      bg = {id = 455569, size = {512, 256}, bandFrac = 0.256, vOffset = -0.15, texCoord = nil},
      overlay = {id = 455571, size = {1024, 512}, bandFrac = 0.256, vOffset = -0.2, texCoord = nil},
      art = {id = 455135, size = {1024, 512}, bandFrac = 0.256, vOffset = -0.1, texCoord = nil},
    },
    [1] = {
      bg = {id = 442724, size = {512, 256}, bandFrac = 0.256, vOffset = -0.15, texCoord = nil},
      overlay = {id = 442725, size = {1024, 512}, bandFrac = 0.256, vOffset = -0.2, texCoord = nil},
      art = {id = 442723, size = {1024, 512}, bandFrac = 0.256, vOffset = -0.1, texCoord = nil},
    },
    [2] = {
      bg = {id = 455568, size = {1024, 512}, bandFrac = 0.256, vOffset = -0.15, texCoord = nil},
      overlay = {id = 455570, size = {1024, 512}, bandFrac = 0.256, vOffset = -0.2, texCoord = nil},
      art = {id = 455134, size = {1024, 512}, bandFrac = 0.256, vOffset = -0.1, texCoord = nil},
    }
  },
  [1138059] = { -- Suramar
  [0] = {
    --bg = {id = 1323499, size = {512, 1024}, bandFrac = 0.56, vOffset = -0.1, texCoord = nil},
    overlay = {id = 1303480, size = {512, 1024}, bandFrac = 0.56, vOffset = -0.1, texCoord = nil},
    art = {{id = 1323499, size = {512, 1024}, bandFrac = 0.56, vOffset = -0.1, texCoord = nil}, {id = 1323502, size = {512, 512}, bandFrac = 0.256, vOffset = -0.1, textCoord = nil}}
  },
  [1] = {
    --bg = {id = 1323500, size = {512, 1024}, bandFrac = 0.56, vOffset = -0.1, texCoord = nil},
    overlay = {id = 1303480, size = {512, 1024}, bandFrac = 0.56, vOffset = -0.1, texCoord = nil},
    art = {{id = 1323500, size = {512, 1024}, bandFrac = 0.56, vOffset = -0.1, texCoord = nil}, {id = 1323503, size = {512, 512}, bandFrac = 0.56, vOffset = -0.1, texCoord = nil}},
  },
  [2] = {
    --bg = {id = 1323501, size = {512, 1024}, bandFrac = 0.56, vOffset = -0.1, texCoord = nil},
    overlay = {id = 1303480, size = {512, 1024}, bandFrac = 0.56, vOffset = -0.1, texCoord = nil},
    art = {DynamicSky.COMMON_SKY_TEXTURES.stars_large, {id = 1323501, size = {512, 1024}, bandFrac = 0.56, vOffset = -0.1, texCoord = nil}, {id = 1323504, size = {512, 512}, bandFrac = 0.56, vOffset = -0.1, texCoord = nil}},
  }
  },
  [1243606] = { -- Broken Shore
    [0] = {
      bg = {id = 1243631, size = {1024, 512}, bandFrac = 0.56, vOffset = 0.1, texCoord = nil},
      overlay = {id = 1253888, size = {1024, 512}, bandFrac = 0.256, vOffset = 0.1, texCoord = nil},
      art = {id = 1250696, size = {512, 256}, bandFrac = 0.256, vOffset = -0.1, texCoord = nil},
    }
  },
  [7299767] = { -- Eversong Woods (Midnight)
    [0] = {
      overlay = {id = 7239057, size = {1024, 512}, vOffset = nil, texCoord = nil},
      art = {id = 6856027, size = {2048, 1024}, vOffset = -0.4, textCoord = nil}
    },
    [1] = {
      overlay = {id = 7239058, size = {1024, 512}, vOffset = nil, texCoord = nil},
      art = {id = 7232422, size = {2048, 1024}, vOffset = -0.4, textCoord = nil}
    },
    [2] = {
      --overlay = {id = 7239060, size = {1024, 512}, vOffset = nil, texCoord = nil},
      art = {DynamicSky.COMMON_SKY_TEXTURES.stars_large, {id = 7232424, size = {2048, 1024}, vOffset = -0.4, textCoord = nil}}
    }
  },
  [798530] = { -- Shadowmoon Valley (Draenor)
    [0] = {
      bg = {id = 1006691, size = {128, 128}},
      overlay = {id = 1006688, size = {1024, 512}, bandFrac = 0.56, vOffset = -0.2},
      art = {{id = 896927, size = {1024, 1024}}, {id = 996319, size = {512, 512}, vOffset = 0.22, blend = 'ADD'}}
    },
    [2] = {
      bg = {id = 798525, size = {128, 128}},
      overlay = {id = 896691, size = {1024, 512}, bandFrac = 0.56, vOffset = -0.2},
      art = {{id = 896927, size = {1024, 1024}}, {id = 996319, size = {512, 512}, vOffset = 0.22, blend = 'ADD'}}
    }
  },
  [1467489] = { -- Legion
    [0] = {
      art = {{id = 130602, size = {512, 512}}, skyConfigPreset(1467504, 'planetx512')}
    }
  },
  [3208911] = { -- Oribos
    [0] = {
      bg = {id = 3583636, size = {512, 512}, vOffset = 0.35},
      overlay = {id = 3578583, size = {2048, 256}},
      art = {id = 3594124, size = {512, 512}, blend = 'ADD'}
    }
  }
}

DynamicSky.OVERRIDES = {
  ['Home Interior'] = {bg = {id = 7367528, size = {2992, 2684}, texCoord = {0.1, 0.8, 0.3, 0.6}}},
  ['Founder\'s Point'] = {bg = {id = 7377860, size = {2992, 2684}, texCoord = {0.1, 0.8, 0.3, 0.6}}},
  ['Razorwind Shores'] = {bg = {id = 7490877, size = {2992, 2684}, texCoord = {0.1, 0.8, 0.3, 0.6}}},
  ['Silvermoon\'s Falconwing Square'] = {bg = {id = 7734005, size = {2992, 1684}, texCoord = {0.1, 0.8, 0.3, 0.6}}},
  ['Isle of Quel\'Danas'] = {bg = {id = 7578182, size = {2992, 1684}, texCoord = {0.1, 0.8, 0.3, 0.6}}},
  ['Arcantina'] = {bg = { id = 7266212, size = { 2992, 1684 }, texCoord = { 0.1, 0.8, 0.3, 0.6 }}},
  ['Shattrath City'] = {bg = {id = 131658, size = {256, 256}}},
}