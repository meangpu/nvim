vim.cmd 'let g:netrw_liststyle = 3'

-- use ':source %' to refresh change
local opt = vim.opt

opt.clipboard = 'unnamedplus'
opt.mouse = 'a'
opt.showmode = false -- don't show normal insert visual because it already have in editor
opt.breakindent = true
opt.undofile = true
opt.wrap = true
opt.autoindent = true
opt.ignorecase = true
opt.smartcase = true
opt.signcolumn = 'yes'
opt.updatetime = 250
opt.timeoutlen = 300 -- Displays which-key popup sooner
opt.splitright = true
opt.splitbelow = true
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
opt.inccommand = 'split'
opt.hlsearch = true
opt.scrolloff = 20 -- Minimal number of screen lines to keep above and below the cursor.

opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

-- ui option
opt.guifont = 'Fira Code:h15'
opt.textwidth = 100
opt.cursorline = true
opt.number = true -- show default line number

opt.signcolumn = 'yes'
opt.background = 'dark'
