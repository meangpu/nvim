return {
  'easymotion/vim-easymotion',
  config = function()
    vim.api.nvim_set_keymap('n', '<Leader>e', '<Plug>(easymotion-e)', {})
    vim.api.nvim_set_keymap('n', '<Leader>b', '<Plug>(easymotion-b)', {})
  end,
}
