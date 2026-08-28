import importlib
import os
from lupa import LuaRuntime
import util as u

Translator = getattr(importlib.import_module("translate"), "Translator")

LOCALES = ['deDE', 'frFR', 'esES', 'ptBR', 'ruRU', 'zhCN', 'zhTW', 'koKR']
LOCALIZATION_ROOT = '../Lodestone/Localization'
NAMESPACE = 'Lodestone.Localization'
HEADER = f'''
local _, Lodestone = ...
{NAMESPACE} = {NAMESPACE} or {{}}
'''

lua = LuaRuntime(unpack_returned_tuples=True)
addon = lua.table()

with open(f'{LOCALIZATION_ROOT}/enUS.lua', encoding='utf-8') as en_us_file:
    lua.execute(en_us_file.read(), 'Lodestone', addon)

enUSData = addon['Localization']['enUS']

for locale in LOCALES:
    localeData = None

    path = LOCALIZATION_ROOT + '/' + locale + '.lua'

    if os.path.exists(path):
        with open(path, 'r', encoding='utf-8') as f:
            content = f.read()
        lua.execute(content, 'Lodestone', addon)
        localeData = addon['Localization'][locale]
    else:
        localeData = None

    with open(path, 'w', encoding='utf-8') as f:
        print(f'Generating {locale}.lua...')

        u.outLine(f, 0, HEADER)
        u.outLine(f, 0, f'{NAMESPACE}.{locale} = {{')

        if localeData is None:
            localeData = lua.table()
            addon['Localization'][locale] = localeData

        for key, value in enUSData.items():
            if key in localeData.keys() and localeData[key] != '':
                u.outLine(f, 1, f'{key} = [[{localeData[key]}]],')
            else:
                print(f'{locale} | New Entry: {key}')
                print(f'{locale} | Translating "{value}"')
                lang_code = 'zh-TW' if locale == 'zhTW' else locale[0:2]
                translator = Translator(from_lang='en', to_lang=lang_code)
                translation: str = translator.translate(value)
                print(f'{locale} | Translation: {translation}')
                u.outLine(f, 1, f'{key} = [[{translation}]],', '(new Python translation)', 0)

        u.outLine(f, 0, '}')

    print(f'Successfully generated {locale}.lua')
        