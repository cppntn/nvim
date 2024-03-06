return {
  "sindrets/diffview.nvim",
  lazy = false,
  config = function()
    -- Key mapping to open Diffview
    vim.keymap.set('n', '<leader>gd', ':DiffviewOpen <CR>', { silent = true })
    vim.keymap.set('n', '<leader>gdc', ':DiffviewClose <CR>', { silent = true })
  end
}
