return {
  'nvim-tree/nvim-tree.lua',
  dependencies = 'nvim-tree/nvim-web-devicons',
  -- note to myself, use "a" to add file, and "g?" to see help

  config = function()
    -- config from https://github.com/nvim-tree/nvim-tree.lua/issues/860

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
      view = {
        adaptive_size = true,
        width = 30,
        side = 'right',
      },
      actions = {
        open_file = {
          quit_on_open = true, -- closes the tree when you open a file
        },
      },
      renderer = {
        indent_markers = {
          enable = true, -- shows indent markers when folders are open
        },
        highlight_git = true, -- will enable file highlight for git attributes (can be used without the icons)
        highlight_opened_files = 'all', -- will enable folder and file icon highlight for opened files/directories
        root_folder_modifier = ':~', -- See :help filename-modifiers for more options
        add_trailing = true, -- append a trailing slash to folder names
        group_empty = true, -- compact folders that only contain a single folder into one node in the file tree
      },
      update_focused_file = {
        enable = true,
        -- update_cwd = true,
      },
      create_in_closed_folder = false, -- When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when false, and inside the folder when true
      git = {
        enable = true,
        ignore = false,
      },
      diagnostics = {
        enable = true,
      },
    }

    local keymap = vim.keymap
    -- keymap.set('n', '<leader>ft', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
    keymap.set('n', '<C-S-e>', '<cmd>NvimTreeFindFile<CR>', { desc = 'Open explorer with current file' })
    -- keymap.set('n', '<leader>fc', '<cmd>NvimTreeCollapse<CR>', { desc = 'Toggle file explorer' })
    -- keymap.set('n', '<leader>fr', '<cmd>NvimTreeRefresh<CR>', { desc = 'Toggle file explorer' })
  end,
}
