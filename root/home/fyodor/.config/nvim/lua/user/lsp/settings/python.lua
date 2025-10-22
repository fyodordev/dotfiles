vim.lsp.config.pyright = {
  default_config = {
    capabilities = _G.lsp_capabilities,
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = true
        }
      }
    },
  }
}

vim.lsp.enable('pyright')

