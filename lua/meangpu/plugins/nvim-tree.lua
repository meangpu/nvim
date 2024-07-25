return {
  'nvim-tree/nvim-tree.lua',
  dependencies = 'nvim-tree/nvim-web-devicons',
  -- note to myself, use "a" to add file, and "g?" to see help

  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.g.nvim_tree_respect_buf_cwd = 1

    local function my_on_attach(bufnr)
      local api = require 'nvim-tree.api'

      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      api.config.mappings.default_on_attach(bufnr) -- default mappings

      vim.keymap.set('n', 'l', api.node.open.edit, opts 'Open')
      vim.keymap.set('n', '?', api.tree.toggle_help, opts 'Help')
      vim.keymap.set('n', 'L', api.tree.change_root_to_node, opts 'CD')
      vim.keymap.set('n', 'H', api.tree.change_root_to_parent, opts 'UP')
    end

    require('nvim-tree').setup {
      on_attach = my_on_attach,
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
      view = {
        width = 30,
        side = 'right',
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
