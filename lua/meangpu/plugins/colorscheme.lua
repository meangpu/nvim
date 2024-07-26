return {
  -- can use `:Telescope colorscheme`.
  'folke/tokyonight.nvim',
  -- 'askfiy/visual_studio_code',

  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'tokyonight-night'
    -- vim.cmd [[colorscheme visual_studio_code]]
  end,
}
