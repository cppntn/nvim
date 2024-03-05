return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        python = { "black" },
        terraform = { "terraform_fmt" },
        json = { "jq" }, -- Configuring jq for JSON formatting
      },
      format_on_save = {
        -- I recommend these options. See :help conform.format for details.
        lsp_fallback = true,
        timeout_ms = 500,
      },
    })
  end
}
