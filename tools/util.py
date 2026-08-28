import re
from rapidfuzz import process, fuzz
from typing import Any, Dict, Optional, Tuple, TextIO

ROOT_DATA_PATH = '../Lodestone/Data/Generated'

def indent(level: int):
    return '  ' * level

def outLine(out: TextIO, indentLevel: int, string: str, comment: str = '', commentStart: int = 30):
    if comment == '':
        return out.write(f'{indent(indentLevel)}{string}\n')
    else:
        dash = '-'
        prefix = f'{indent(indentLevel)}{string}'
        prefixLen = len(prefix)
        dashCount = commentStart - prefixLen - 1
        if dashCount < 2:
            dashCount = 2
        finalOut = f'{indent(indentLevel)}{string} {dash * dashCount} {comment}\n'
        return out.write(finalOut)

def format_time(t: int):
    totalMin: int = int(t / 2)
    hours, minutes = divmod(totalMin, 60)

    ampm = 'AM' if hours < 12 else 'PM'

    hour12 = hours % 12
    if hour12 == 0:
        hour12 = 12

    return f'{hour12:2d}:{minutes:02d} {ampm}'.strip()

def to_hex(v: int):
    v = int(v) & 0xFFFFFF
    return f'#{(v >> 16) & 0xFF:02X}{(v >> 8) & 0xFF:02X}{v & 0xFF:02X}'

def strip_trailing_digits(name: str) -> str:
    return re.sub(r'\d+$', '', name)

def normalizeName(name: str) -> str:
    name = name.lower()
    name = re.sub(r' zone light$', '', name)
    name = strip_trailing_digits(name)
    name = name.replace('main', '').replace('zone', '')
    return re.sub(r'[^a-z0-9]', '', name)

def fuzzy_match(text: str, choices: Dict[str, str], threshold: int = 85) -> Optional[str]:
    match: Optional[Tuple[str, float, Any]] = process.extractOne(text, choices.keys(), scorer=fuzz.WRatio)
    if match and match[1] >= threshold:
        return choices[match[0]] if len(match[0]) > 3 else None
    return None