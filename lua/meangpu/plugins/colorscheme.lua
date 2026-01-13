return {
  'nyoom-engineering/oxocarbon.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.opt.background = 'dark' -- or "light"
    vim.cmd.colorscheme 'oxocarbon'
  end,
}

--[[
  -- this is the first original theme, I later change to use the nyoom-engineering
  'folke/tokyonight.nvim',
  priority = 1000,
  config = function()
    -- ถ้าเราอยากกลับไปใช้ original ให้เราเปิิดบรรทัดใต้นี้
    -- vim.cmd.colorscheme 'tokyonight-night'
  end,
}
]]
