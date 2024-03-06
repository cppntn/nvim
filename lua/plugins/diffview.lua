return {
  "sindrets/diffview.nvim",
  lazy = false,
  config = function()
    vim.keymap.set('n', '<leader>gd', ':DiffviewOpen <CR>', { silent = true })
    vim.keymap.set('n', '<leader>gdc', ':DiffviewClose <CR>', { silent = true })
  end
}
