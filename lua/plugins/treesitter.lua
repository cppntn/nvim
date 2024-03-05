return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "vim",
        "vimdoc",
        "dockerfile",
        "terraform",
        "query",
        "lua",
        "c",
        "markdown",
        "python",
        "yaml"
      },
      indent = {
        enable = true
      },
      highlight = {
        enable = true
      }
    })
  end
}
