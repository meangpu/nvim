return {
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  'folke/tokyonight.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    vim.cmd.colorscheme 'tokyonight-night'
    vim.cmd.hi 'Comment gui=none'
    config = function()
      local bg_dark = '#011628'
      local bg_highlight = '#011628'
      local bg_search = '#011628'
      local bg_visual = '#011628'
      local fg_dark = '#011628'
      local fg_gutter = '#011628'
      local border = '#011628'
    end
  end,
}
