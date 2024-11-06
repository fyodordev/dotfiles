
local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

lspconfig.ts_ls.setup{
  settings = {
    completions = {
      completeFunctionCalls = true
    }
  }
}

