local keymap = vim.keymap

local thai_mappings = {
  ['ๅ'] = '1',
  ['ภ'] = '4',
  ['ถ'] = '5',
  ['ุ'] = '6',
  ['ึ'] = '7',
  ['ค'] = '8',
  ['ต'] = '9',
  ['จ'] = '0',
  ['ข'] = '-',
  ['ช'] = '=',
  ['\\%'] = '~',
  ['๑'] = '@',
  ['๒'] = '#',
  ['๓'] = '$',
  ['๔'] = '%',
  ['ู'] = '^',
  ['฿'] = '&',
  ['๕'] = '*',
  ['๖'] = '(',
  ['๗'] = ')',
  ['๘'] = '_',
  ['๙'] = '+',
  ['ๆ'] = 'q',
  ['ไ'] = 'w',
  ['ำ'] = 'e',
  ['พ'] = 'r',
  ['ะ'] = 't',
  ['ั'] = 'y',
  ['ี'] = 'u',
  ['ร'] = 'i',
  ['น'] = 'o',
  ['ย'] = 'p',
  ['บ'] = '[',
  ['ล'] = ']',
  ['ฟ'] = 'a',
  ['ห'] = 's',
  ['ก'] = 'd',
  ['ด'] = 'f',
  ['เ'] = 'g',
  ['้'] = 'h',
  ['่'] = 'j',
  ['า'] = 'k',
  ['ส'] = 'l',
  ['ว'] = ';',
  ['ง'] = "'",
  ['ผ'] = 'z',
  ['ป'] = 'x',
  ['แ'] = 'c',
  ['อ'] = 'v',
  ['ิ'] = 'b',
  ['ื'] = 'n',
  ['ท'] = 'm',
  ['ม'] = ',',
  ['ใ'] = '.',
  ['ฝ'] = '/',
  ['๐'] = 'Q',
  ['ฎ'] = 'E',
  ['ฑ'] = 'R',
  ['ธ'] = 'T',
  ['ํ'] = 'Y',
  ['๊'] = 'U',
  ['ณ'] = 'I',
  ['ฯ'] = 'O',
  ['ญ'] = 'P',
  ['ฐ'] = '{',
  ['ฤ'] = 'A',
  ['ฆ'] = 'S',
  ['ฏ'] = 'D',
  ['โ'] = 'F',
  ['ฌ'] = 'G',
  ['็'] = 'H',
  ['๋'] = 'J',
  ['ษ'] = 'K',
  ['ศ'] = 'L',
  ['ซ'] = ';',
  ['ฉ'] = 'C',
  ['ฮ'] = 'V',
  ['ฺ'] = 'B',
  ['์'] = 'N',
  ['ฒ'] = '<',
  ['ฬ'] = '>',
  ['ฦ'] = '?',
}

for thai, eng in pairs(thai_mappings) do
  keymap.set('', thai, eng)
end

keymap.set('', 'เเ', 'gg')
keymap.set('', 'ผผ', 'zz')
keymap.set('', 'ผะ', 'zt')
keymap.set('', 'ผิ', 'zb')

keymap.set('', '<A-S-๋>', '<C-d>')
keymap.set('', '<A-S-ษ>', '<C-u>')
