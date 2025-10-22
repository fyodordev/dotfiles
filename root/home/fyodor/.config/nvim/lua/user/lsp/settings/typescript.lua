vim.lsp.config.ts_ls = {
  default_config = {
    capabilities = _G.lsp_capabilities,
    settings = {
      completions = {
        completeFunctionCalls = true
      }
    }
  }
}

vim.lsp.enable('ts_ls')

