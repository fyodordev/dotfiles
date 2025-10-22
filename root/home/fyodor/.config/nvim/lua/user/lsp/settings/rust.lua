vim.lsp.config.rust_analyzer = {
  default_config = {
    capabilities = _G.lsp_capabilities,
    settings = {
      rust = {
        unstable_features = true,
        build_on_save = false,
        all_features = true,
      },
    },
  }
}

vim.lsp.enable('rust_analyzer')
