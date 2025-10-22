vim.lsp.config.cssls = {
  default_config = {
    capabilities = _G.lsp_capabilities,
  }
}

vim.lsp.config.cssmodules_ls = {
  default_config = {
    capabilities = _G.lsp_capabilities,
  }
}

vim.lsp.enable('cssls')
vim.lsp.enable('cssmodules_ls')
