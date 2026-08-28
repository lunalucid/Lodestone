import subprocess, sys
from pathlib import Path

PROCESSES = [
  'dynamicSky.py',
  'gameData.py',
  'locales.py'
]

csv_path = Path('csv/')

with open('csv/files.txt', 'w', encoding='utf-8') as out:
  files = [item.name for item in csv_path.iterdir() if item.is_file()]
  out.write(f'Required files to generate the organized data by running the Python scripts:\n----------------------------------------------------------------------------\n')

  for file in files:
    if '.csv' in file:
      out.write(f'{file}\n')

for i, process in enumerate(PROCESSES):
  print(f'Process [{i + 1}/{len(PROCESSES)}]')
  subprocess.run([sys.executable, process])