local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

lspconfig.cssls.setup({})
lspconfig.cssmodules_ls.setup({})
