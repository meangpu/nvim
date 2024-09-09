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

keymap.set('n', '<C-n>', ':up<CR>:!python %<CR>', { noremap = true, silent = true })

keymap.set('n', 'j', 'gj')
keymap.set('n', 'k', 'gk')
keymap.set({ 'n', 'v' }, 'H', '0')
keymap.set({ 'n', 'v' }, 'L', 'g_')

keymap.set('i', '<C-v>', '<Esc>"+pa', { noremap = true, silent = true })
keymap.set('i', '<C-BS>', '<C-w>', { noremap = true, silent = true })

-- Move lines up and down in normal and visual mode
keymap.set('n', '<A-k>', ':m .-2<CR>==', { silent = true })
keymap.set('n', '<A-j>', ':m .+1<CR>==', { silent = true })
keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { silent = true })
keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { silent = true })

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
keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- clear highlight


-- split window
keymap.set('n', '<leader>sv', '<C-w>v', { desc = '[S]plit vertical' })
keymap.set('n', '<leader>sh', '<C-w>s', { desc = '[S]plit horizontal' })
keymap.set('n', '<leader>s=', '<C-w>=', { desc = '[S]plit equal size' })
keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = '[S]plit close current split' })
--
-- vertical resize +10 for bigger size
keymap.set('n', '<c-s-.>', '<C-w>+', { desc = 'change split size up' })
keymap.set('n', '<c-s-,>', '<C-w>-', { desc = 'change split size down' })

keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', { desc = '[T]ab open' })
keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = '[T]ab close' })
keymap.set('n', '<leader>tl', '<cmd>tabn<CR>', { desc = '[T]ab right' })
keymap.set('n', '<leader>th', '<cmd>tabp<CR>', { desc = '[T]ab left' })
keymap.set('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = '[T]ab current new' })

-- Remap for dealing with word wrap
keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

local function copy_diagnostic()
  local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line '.' - 1 })
  if #diagnostics > 0 then
    local message = diagnostics[1].message
    vim.fn.setreg('+', message)
    print 'Diagnostic message copied to clipboard!'
  else
    print 'No diagnostic message found at the current line.'
  end
end

keymap.set('n', '<leader>cd', copy_diagnostic, { noremap = true, silent = true, desc = 'Copy diagnostic message' })


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
