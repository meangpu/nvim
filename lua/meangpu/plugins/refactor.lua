return {
  -- from [dotfiles/.config/nvim/lua/plugins/refactoring.lua at master · JazzyGrim/dotfiles](https://github.com/JazzyGrim/dotfiles/blob/master/.config/nvim/lua/plugins/refactoring.lua)
  --[Effective NeoVim Setup for Full-Stack Web Development in 2024 - YouTube](https://www.youtube.com/watch?v=V070Zmvx9AM)
  -- Incremental rename
  {
    'smjonas/inc-rename.nvim',
    cmd = 'IncRename',
    keys = {
      {
        '<C-d>',
        function()
          return ':IncRename ' .. vim.fn.expand '<cword>'
        end,
        desc = 'Incremental rename',
        mode = 'n',
        noremap = true,
        expr = true,
      },
    },
    config = true,
  },

  -- Refactoring tool
  {
    'ThePrimeagen/refactoring.nvim',
    keys = {
      {
        '<C-r>',
        function()
          require('refactoring').select_refactor {
            show_success_message = true,
          }
        end,
        mode = 'v',
        noremap = true,
        silent = true,
        expr = false,
      },
    },
    opts = {},
  },
}
