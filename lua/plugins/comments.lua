return {
  "numToStr/Comment.nvim",
  keys = {
    { "gcc", mode = "n",          desc = "Comment toggle current line" },
    { "gc",  mode = { "n", "o" }, desc = "Comment toggle linewise" },
    { "gc",  mode = "x",          desc = "Comment toggle linewise (visual)" },
    { "gbc", mode = "n",          desc = "Comment toggle current block" },
    { "gb",  mode = { "n", "o" }, desc = "Comment toggle blockwise" },
    { "gb",  mode = "x",          desc = "Comment toggle blockwise (visual)" },
  },
  init = function()
    vim.keymap.set('n', '<leader>/', require("Comment.api").toggle.linewise.current, { desc = "Toggle comment" })
    vim.keymap.set('v', '<leader>/', ":<C-u>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      { desc = "Toggle comment" })
  end,
  config = function()
    require("Comment").setup()
  end,
}
