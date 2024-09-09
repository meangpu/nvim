-- Highlight when yanking (copying) text :help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local opt = vim.opt

vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

opt.clipboard = 'unnamedplus'
opt.hlsearch = true
opt.scrolloff = 20

--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


local keymap = vim.keymap

keymap.set({ 'n', 'v' }, 'H', '0')
keymap.set({ 'n', 'v' }, 'L', 'g_')

-- keymap.set('i', '<C-v>', '<Esc>"+pa', { noremap = true, silent = true })
-- keymap.set('i', '<C-BS>', '<C-w>', { noremap = true, silent = true })

keymap.set('n', 'QQ', '<cmd>q!<CR>', { noremap = false })
keymap.set('n', 'WW', '<cmd>up<CR>', { noremap = false })

keymap.set({ 'n', 'v' }, '<A-S-J>', '<C-d>')
keymap.set({ 'n', 'v' }, '<A-S-K>', '<C-u>')

keymap.set('', '<A-h>', '<C-o>')
keymap.set('', '<A-l>', '<C-i>')

keymap.set('n', '<leader>y', 'mzggyG`z')
keymap.set('n', '<leader>Q', 'ggdG')
keymap.set('n', '<leader>v', 'ggVG')
keymap.set('n', '<leader>p', 'ggVGp')


keymap.set('c', '<C-V>', '<C-R>+', { noremap = true }) -- paste in command mode



-- Remap for dealing with word wrap
keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


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
