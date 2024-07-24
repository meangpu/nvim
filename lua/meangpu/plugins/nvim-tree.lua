return {
  'nvim-tree/nvim-tree.lua',
  dependencies = 'nvim-tree/nvim-web-devicons',
  -- note to myself, use "a" to add file, and "g?" to see help

  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require('nvim-tree').setup {
      view = {
        width = 30,
        side = 'right',
        mappings = {
          custom_only = false, -- Ensure this is set to false
          list = {
            { key = 'l', action = 'edit' },
            { key = 'h', action = 'close_node' },
            { key = 'v', action = 'vsplit' },
          },
        },
      },
      sort = {
        sorter = 'case_sensitive',
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
    -- keymap.set('n', '<leader>ft', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
    keymap.set('n', '<C-S-e>', '<cmd>NvimTreeFindFile<CR>', { desc = 'Open explorer with current file' })
    -- keymap.set('n', '<leader>fc', '<cmd>NvimTreeCollapse<CR>', { desc = 'Toggle file explorer' })
    -- keymap.set('n', '<leader>fr', '<cmd>NvimTreeRefresh<CR>', { desc = 'Toggle file explorer' })
  end,
}
