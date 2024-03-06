return {
  "neovim/nvim-lspconfig",
  config = function()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lspconfig = require("lspconfig")
    lspconfig.lua_ls.setup({
      capabilities = capabilities
    })
    lspconfig.pyright.setup({
      capabilities = capabilities,
      filetypes = { "python" },
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            diagnosticMode = "openFilesOnly",
            useLibraryCodeForTypes = true
          }
        }
      }
    })

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  end
}
