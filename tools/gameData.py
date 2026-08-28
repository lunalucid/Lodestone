import csv
from typing import Dict
import util as u

FILE_HEADER = 'local _, Lodestone = ...\n'

# -----------------------------------------------------------------------------------------
with (
    open('csv/Profession.csv', encoding='utf-8-sig', newline='') as f1,
):

    profession = csv.DictReader(f1, delimiter=';')

    COMMENT = '''
--[[
  Consolidated data from Profession,
]]\n\n'''

    with open(f"{u.ROOT_DATA_PATH}/GameData.lua", 'w', encoding='utf-8') as out:
        print('Generating GameData.lua...')
        u.outLine(out, 0, f'{FILE_HEADER}{COMMENT}Lodestone.GAME_DATA = {{')

        gameData: Dict[str, Dict[str, str]|list[str]] = {}

        professionData: list[str] = []
        for row in profession:
            professionData.append(row['SkillLineID'])

        gameData['Profession'] = professionData

        
        for category, data in gameData.items():
            u.outLine(out, 1, f'[\'{category}\'] = {{')
            if isinstance(data, list):
                for item in data:
                    u.outLine(out, 2, f'{item},')
            #elif isinstance(data, dict):
            u.outLine(out, 1, '},')
        u.outLine(out, 0, '}')

print('Successfully generated GameData.lua')