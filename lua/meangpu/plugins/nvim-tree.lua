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
    }

    local keymap = vim.keymap
    keymap.set('n', '<leader>ft', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
    keymap.set('n', '<leader>ff', '<cmd>NvimTreeFindFileToggle<CR>', { desc = 'Open explorer with current file' })
    keymap.set('n', '<leader>fc', '<cmd>NvimTreeCollapse<CR>', { desc = 'Toggle file explorer' })
    keymap.set('n', '<leader>fr', '<cmd>NvimTreeRefresh<CR>', { desc = 'Toggle file explorer' })
  end,
}
