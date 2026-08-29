import io
from pathlib import Path
from wand.image import Image
from wand.color import Color
import util as u

svgPath = Path('svg/')
iconPath = Path('../Lodestone/Textures/Pins')
FILE_HEADER = 'local _, Lodestone = ...\n\n'
FILE_NAME = 'PinTextureData.lua'

files = [file for file in svgPath.iterdir() if file.is_file() and file.suffix == '.svg']
inserted = []

with open(f'{u.ROOT_DATA_PATH}/{FILE_NAME}', 'w', encoding='utf-8') as out:
  print(f'Generating {FILE_NAME}...')
  u.outLine(out, 0, f'{FILE_HEADER}Lodestone.PIN_TEXTURE_DATA = {{')
  if files:
    iconPath.mkdir(parents=True, exist_ok=True)
    for file in files:
      fileName = Path(file.name).stem
      insert = fileName.replace('-mono', '')
      if insert not in inserted:
        u.outLine(out, 1, f"'{insert}',")
        inserted.append(insert)
      print(f'Converting {fileName} SVG to TGA')
      with Color('transparent') as bg_color:
        with Image(filename=str(file), format='svg', background=bg_color) as img:
          outPath = iconPath / f'{fileName}.tga'
          img.alpha_channel = 'activate'
          img.format = 'tga'
          img.save(filename=str(outPath))
  u.outLine(out, 0, '}')
