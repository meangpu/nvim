return {
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
      stages = 'fade', -- Animation stages: "fade", "slide", "fade_in_slide_out", etc.
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
      render = 'default', -- Render style: "default", "minimal"
      minimum_width = 50, -- Minimum width of the notification window
      fps = 30, -- Frames per second for animations
      top_down = true, -- Notification position: top-down or bottom-up
      renderer = 'compact',
    }

    vim.notify = require 'notify'
  end,
}
