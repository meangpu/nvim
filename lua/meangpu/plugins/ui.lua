return {
  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
  },
  {
    'nvimdev/dashboard-nvim',
    enabled = false,
  },
  {
    'nvim-lualine/lualine.nvim',
    enabled = false,
  },
  -- messages, cmdline and the popupmenu
  {
    'folke/noice.nvim',
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = 'notify',
          find = 'No information available',
        },
        opts = { skip = true },
      })
      local focused = true
      vim.api.nvim_create_autocmd('FocusGained', {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd('FocusLost', {
        callback = function()
          focused = false
        end,
      })
      table.insert(opts.routes, 1, {
        filter = {
          cond = function()
            return not focused
          end,
        },
        view = 'notify_send',
        opts = { stop = false },
      })

      opts.commands = {
        all = {
          -- options for the message history that you get with `:Noice`
          view = 'split',
          opts = { enter = true, format = 'details' },
          filter = {},
        },
      }

      opts.presets.lsp_doc_border = true
    end,
  },
  -- LazyGit integration with Telescope
  {
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
  },

  -- beautify notification

  'rcarriga/nvim-notify',
  config = function()
    require('notify').setup {
      background_colour = '#000000',
      enabled = true, -- Change to true to enable notifications
      level = 'info', -- Notification level: "trace", "debug", "info", "warn", "error", "off"
      timeout = 3000, -- Timeout for the notification in milliseconds
      max_width = 300, -- Maximum width of the notification window
      max_height = 200, -- Maximum height of the notification window
      stages = 'static', -- Animation stages: "fade", "slide", "fade_in_slide_out", etc.
      icons = {
        ERROR = '',
        WARN = '',
        INFO = '',
        DEBUG = '',
        TRACE = '✎',
      },
      time_formats = {
        '%H:%M:%S', -- Time format for the notification timestamp
      },
      on_open = function() end, -- Function to run when the notification window is opened
      on_close = function() end, -- Function to run when the notification window is closed
      render = 'wrapped-compact', -- Render style: "default", "minimal"
      minimum_width = 50, -- Minimum width of the notification window
      fps = 30, -- Frames per second for animations
      top_down = false, -- Notification position: top-down or bottom-up
    }

    vim.notify = require 'notify'
  end,
}
