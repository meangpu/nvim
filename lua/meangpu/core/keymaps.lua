--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

local keymap = vim.keymap

keymap.set('n', 'j', 'gj')
keymap.set('n', 'k', 'gk')
keymap.set({ 'n', 'v' }, 'H', '0')
keymap.set({ 'n', 'v' }, 'L', '$')
keymap.set('', '<c-w>แ', '<c-w>c')

keymap.set('', '<A-S-J>', '<C-d>')
keymap.set('', '<A-S-K>', '<C-u>')
keymap.set('', '<A-S-๋>', '<C-d>')
keymap.set('', '<A-S-ษ>', '<C-u>')

keymap.set('', '<A-h>', '<C-o>')
keymap.set('', '<A-l>', '<C-i>')

keymap.set('n', '<leader>y', 'mzggyG`z')
keymap.set('n', '<leader>q', 'ggdG')
keymap.set('n', '<leader>v', 'ggVG')
keymap.set('n', '<leader>p', 'ggVGp')

keymap.set('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>')

-- duplicate down
keymap.set({ 'n', 'v' }, '<A-S-U>', function()
  if vim.fn.mode() == 'n' then
    return ':t.<CR>'
  else
    return ":'>t'><CR>gv"
  end
end, { expr = true, noremap = true, silent = true })

keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- clear highlight

-- Diagnostic keymaps
keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- split window
keymap.set('n', '<leader>sv', '<C-w>v', { desc = '[S]plit vertical' })
keymap.set('n', '<leader>sh', '<C-w>s', { desc = '[S]plit horizontal' })
keymap.set('n', '<leader>s=', '<C-w>=', { desc = '[S]plit equal size' })
keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = '[S]plit close current split' })

keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', { desc = '[T]ab open' })
keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = '[T]ab close' })
keymap.set('n', '<leader>tl', '<cmd>tabn<CR>', { desc = '[T]ab right' })
keymap.set('n', '<leader>th', '<cmd>tabp<CR>', { desc = '[T]ab left' })
keymap.set('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = '[T]ab current new' })

keymap.set('n', '<leader>S', '<cmd>w<CR><cmd>source %<CR>', { desc = 'Save and [S]ource current file' })

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
