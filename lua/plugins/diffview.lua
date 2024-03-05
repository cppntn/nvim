return {
  "sindrets/diffview.nvim",
  lazy = false,
  config = function()
    vim.keymap.set('n', '<leader>gd', function()
      if next(require("diffview.lib").views) == nil then
        vim.cmd("DiffviewOpen")
      else
        vim.cmd("DiffviewClose")
      end
    end, { silent = true })
  end
}
