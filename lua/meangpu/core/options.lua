vim.cmd 'let g:netrw_liststyle = 3'
vim.o.termguicolors = true
vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

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
opt.wildignore:append { '*/node_modules/*' }

-- ui option
opt.guifont = 'JetBrains Mono:h14'
-- opt.guifont = 'IBM Plex Sans Thai:h14'
opt.textwidth = 100
opt.cursorline = true
opt.number = true -- show default line number

opt.signcolumn = 'yes'
opt.background = 'dark'
