local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end


lspconfig.rust_analyzer.setup({
  settings = {
    rust = {
      unstable_features = true,
      build_on_save = false,
      all_features = true,
    },
  },
})
