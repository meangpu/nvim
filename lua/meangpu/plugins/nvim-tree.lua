return {
  'nvim-tree/nvim-tree.lua',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.opt.termguicolors = true

    require('nvim-tree').setup {
      sort = {
        sorter = 'case_sensitive',
      },
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
        indent_markers = {
          enable = true,
        },
      },
      filters = {
        dotfiles = true,
        custom = { '.DS_Store' },
      },
      actions = {
        open_file = { window_picker = { enable = false } },
      },
      git = { ignore = false },
    }
  end,
}
