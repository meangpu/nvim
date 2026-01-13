return {
  'rmagatti/auto-session',
  -- this restore multi tab per project folder that I working on
  config = function()
    local auto_session = require 'auto-session'

    auto_session.setup {
      auto_restore = false,
      suppressed_dirs = { '~/', '~/Dev/', '~/Downloads', '~/Documents', '~/Desktop/' },
    }

    local keymap = vim.keymap

    keymap.set('n', '<leader>wl', '<cmd>SessionRestore<CR>', { desc = 'Restore session for cwd' }) -- restore last workspace session for current directory
    keymap.set('n', '<leader>wm', '<cmd>SessionSave<CR>', { desc = 'Save session for auto session root dir' }) -- save workspace session for current working directory
  end,
}
