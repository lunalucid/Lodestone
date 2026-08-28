import csv
import re
from collections import defaultdict
from typing import Any, Dict, Optional
import util as u

UIMAP_ZONELIGHT_ALIASES: Dict[str, str | list[str]] = {
    'orgrimmar': 'durotarorg',
    'dustwallowmarsh': 'duskwallow',
    'silvermooncity': ['lightsilvermoon', 'silvermoonstage1defaultlight'],
    'eversongwoods': 'esw'
}

FILE_HEADER = '''local _, Lodestone = ...
Lodestone.DynamicSky = Lodestone.DynamicSky or {}
local DynamicSky = Lodestone.DynamicSky

'''

def resolve_light_id(zoneLightData: Dict[str, Dict[str, str]], mapId: str, name: str) -> Optional[str]:
    zone_map = zoneLightData.get(mapId, {})
    
    if name in zone_map:
        return zone_map[name]
    
    for key in zone_map:
        if name in key or key in name:
            return zone_map[key]
    
    match = u.fuzzy_match(name, zone_map)
    if match:
        return match
    
    return None

lightDataCols = {
    'direct': 'DirectColor',
    'ambient': 'AmbientColor',
    'top': 'SkyTopColor',
    'midTop': 'SkyMiddleColor',
    'mid': 'SkyBand1Color',
    'low': 'SkyBand2Color',
    'bottom': 'SkySmogColor',
}

paramZones: Dict[int, list[str]] = defaultdict(list)

# -----------------------------------------------------------------------------------------
with (
    open('csv/UiMapAssignment.csv', encoding='utf-8-sig', newline='') as f1,
    open('csv/UiMap.csv', encoding='utf-8-sig', newline='') as f2,
    open('csv/ZoneLight.csv', encoding='utf-8-sig', newline='') as f3,
    open('csv/Light.csv', encoding='utf-8-sig', newline='') as f4,
    open('csv/LightParams.csv', encoding='utf-8-sig', newline='') as f5,
    open('csv/LightSkybox.csv', encoding='utf-8-sig', newline='') as f6
):   

    uiMapAssignment = csv.DictReader(f1, delimiter=';')
    uiMap = csv.DictReader(f2, delimiter=';')
    zoneLight = csv.DictReader(f3, delimiter=';')
    light = csv.DictReader(f4, delimiter=';')
    lightParams = csv.DictReader(f5, delimiter=';')
    lightSkybox = csv.DictReader(f6, delimiter=';')

    COMMENT = '''--[[
  Consolidated data from UiMap, UiMapAssignment, ZoneLight, Light, Light Params, LightSkybox data tables
]]

'''

    with open(f"{u.ROOT_DATA_PATH}/MapData.lua", 'w', encoding='utf-8') as out:
        print('Generating MapData.lua...')
        u.outLine(out, 0, f'{FILE_HEADER}{COMMENT}DynamicSky.MAP_DATA = {{')

        lightData: Dict[str, str] = {}
        for row in light:
            lightData[row['ID']] = row['LightParamsID'].strip('[]').split(',')[0].strip()

        lightParamsData: Dict[str, str] = {}
        for row in lightParams:
            lightParamsData[row['ID']] = row['LightSkyboxID']

        lightSkyboxData: Dict[str, str] = {}
        lightSkyboxData2: Dict[str, str] = {}
        skyboxNames: Dict[str, Dict[str, str]] = {}
        items: list[str] = []
        for row in lightSkybox:
            lightSkyboxData[row['ID']] = row['SkyboxFileDataID']

            n = row['Name'].lower()
            nre = re.sub(r'[^a-zA-Z\s]+', '', n).strip()
            name = nre.replace('mdx', '').replace('environmentsstars', '').replace('skybox', '').replace('passive', '').replace('doodads', '').replace('main', '')

            skyboxNames[row['SkyboxFileDataID']] = {'fileName': row['Name'], 'simplifiedName': name}

            if name not in items and not name.startswith('xp'):
                items.append(name)
                lightSkyboxData2[name] = row['SkyboxFileDataID']

        zoneLightData: Dict[str, Dict[str, str]] = {}
        for row in zoneLight:
            data = {u.normalizeName(row['Name']): row['LightID']}
            zoneLightData.setdefault(row['MapID'], {}).update(data)

        uiMapData: Dict[str, Any] = {}
        for row in uiMap:
            uiMapData[row['ID']] = {
                'raw': row['Name_lang'],
                'normalized': u.normalizeName(row['Name_lang']),
            }

        uiMapAssignmentData: Dict[str, Dict[str, Dict[str, Any]]] = defaultdict(dict)
        for row in uiMapAssignment:
            mapId = row['MapID']
            uiMapId = row['UiMapID']
            uiMapInfo = uiMapData[uiMapId]
            name = uiMapInfo['normalized']
            alias = UIMAP_ZONELIGHT_ALIASES.get(name, '')
            alias_candidates = alias if isinstance(alias, list) else [alias] if alias else []

            lightId = None
            matchedAlias = ''
            for candidate in alias_candidates:
                lightId = resolve_light_id(zoneLightData, mapId, candidate)
                if lightId is not None:
                    matchedAlias = candidate
                    break

            if not alias_candidates:
                lightId = resolve_light_id(zoneLightData, mapId, name)
            lightParamId = lightData.get(lightId, '') if lightId is not None and lightId != '' else ''
            skyboxId = lightParamsData.get(lightParamId, '') if lightParamId != '' else ''
            lightSkyboxFileID = lightSkyboxData.get(skyboxId, '') if skyboxId != '' else u.fuzzy_match(name, lightSkyboxData2) if u.fuzzy_match(name, lightSkyboxData2) else '' 

            # I don't know why Windrunner Spire connects "placeholder/empty/morgan test" but it does
            skyboxMatchMethod = ''
            if lightSkyboxFileID:
                if lightSkyboxData.get(skyboxId, ''):
                    skyboxMatchMethod = 'skyboxId'
                else:
                    skyboxMatchMethod = 'fuzzy name match'

            skyboxRef = skyboxNames.get(lightSkyboxFileID) if lightSkyboxFileID else None
            skyboxFileName = skyboxRef['fileName'] if skyboxRef else None
            skyboxSimplifiedName = skyboxRef['simplifiedName'] if skyboxRef else None

            uiMapAssignmentData[mapId][uiMapId] = {'name': uiMapInfo['raw'], 'lightParamId': lightParamId, 'lightSkyboxFileID': lightSkyboxFileID, 'normalizedName': uiMapInfo['normalized'], 'alias': matchedAlias, 'skyboxFileName': skyboxFileName, 'skyboxSimplifiedName': skyboxSimplifiedName, 'skyboxMatchMethod': skyboxMatchMethod, 'skyboxId': skyboxId}

        for mapId, uiMapId in uiMapAssignmentData.items():
            u.outLine(out, 1, f'[{mapId}] = {{')
            for uiMapId, data in uiMapAssignmentData[mapId].items():
                if data['lightParamId'] != '' and data['name'] not in paramZones[int(data['lightParamId'])]:
                    paramZones[int(data['lightParamId'])].append(data['name'])
                u.outLine(out, 2, f'[{uiMapId}] = {{', f'{data['name']}')
                u.outLine(out, 3, f'lightParamId = {'nil' if data['lightParamId'] == '' else int(data['lightParamId'])},')
                u.outLine(out, 3, f'skyboxFileDataID = {'nil' if data['lightSkyboxFileID'] == '' else int(data['lightSkyboxFileID'])},', f'Retrieval method: {data['skyboxMatchMethod']}{f' ({data['skyboxId']})' if data['skyboxId'] else ''} -> {data['skyboxSimplifiedName']} | {data['skyboxFileName']}' if data['skyboxSimplifiedName'] and data['skyboxFileName'] else '', 0)
                u.outLine(out, 3, f'normalizedName = \'{'nil' if data['normalizedName'] == '' else data['normalizedName']}\',')
                if data['alias']:
                    u.outLine(out, 3, f'alias = \'{data['alias']}\',')
                u.outLine(out, 2, '},')
            u.outLine(out, 1, '},')
        u.outLine(out, 0, '}')

print('Successfully generated MapData.lua')

# -----------------------------------------------------------------------------------------

with open('csv/LightData.csv', encoding='utf-8-sig', newline='') as f:
    reader = csv.DictReader(f, delimiter=';')
    with open(f"{u.ROOT_DATA_PATH}/LightData.lua", 'w', encoding='utf-8') as out:
        print('Generating LightData.lua...')
        u.outLine(out, 0, f'{FILE_HEADER}-- [LightParamID] (from MapData.lua) -> (match time) [Time] -> gradient colors\n\nDynamicSky.LIGHT_DATA = {{')

        grouped_data: Dict[str, Dict[str, Dict[str, Any]]] = defaultdict(dict)

        for row in reader:
            rid = row['LightParamID']
            time_val = row['Time']

            time_entry = {}
            for k, src in lightDataCols.items():
                time_entry[k] = u.to_hex(int(row[src]))
            
            grouped_data[rid][time_val] = time_entry
        
        for rid, times in grouped_data.items():
            comment = ''

            # Omitting unused param IDs actually takes LightData.lua from 185,643 lines to 6,455 lol
            if paramZones[int(rid)]:
                comment = ', '.join(paramZones[int(rid)])
                u.outLine(out, 1, f'[{rid}] = {{', comment)
                for time_val, data in times.items():
                    u.outLine(out, 2, f'[{time_val}] = {{', u.format_time(int(time_val)))
                    for k, v in data.items():
                        u.outLine(out, 3, f'{k} = \'{v}\',')
                    u.outLine(out, 2, '},')
                u.outLine(out, 1, '},')
        u.outLine(out, 0, '}')

print('Successfully generated LightData.lua')