-- LazyGit integration with Telescope
return {
  'kdheepak/lazygit.nvim',
  keys = {
    {
      '<C-g>',
      ':LazyGit<Return>',
      silent = true,
      noremap = true,
    },
  },
  -- optional for floating window border decoration
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
}
