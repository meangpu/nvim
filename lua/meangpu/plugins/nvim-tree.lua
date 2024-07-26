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

    -- Function to change the root folder to the current file's directory
    local function change_nvim_tree_root_to_current_file()
      local current_file_path = vim.fn.expand '%:p:h'

      -- Check if nvim-tree is open by inspecting buffers
      local tree_buf_open = false
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.bo[buf].filetype == 'NvimTree' then
          tree_buf_open = true
          break
        end
      end

      -- Open nvim-tree if it is not open
      if not tree_buf_open then
        vim.cmd 'NvimTreeToggle'
      end

      -- Change directory and refresh
      local tree = require 'nvim-tree'
      tree.change_dir(current_file_path)
      vim.cmd 'NvimTreeRefresh'
    end

    local keymap = vim.keymap
    keymap.set('n', '<C-S-e>', '<cmd>cd %:p:h<CR><cmd>NvimTreeFindFile<CR>', { desc = 'Open explorer with current file' })
    keymap.set('n', '<leader>fr', change_nvim_tree_root_to_current_file, { desc = "Change nvim-tree root to current file's directory" })
  end,
}
