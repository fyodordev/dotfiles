require "user.lsp.mason"

-- local status_ok, lspconfig = pcall(require, "lspconfig")
-- if not status_ok then
--   return
-- end


-- require("user.lsp.handlers").on_attach

-- lspconfig.lua_ls.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
-- })

-- local jsonls_opts = require("user.lsp.settings.jsonls")
-- lspconfig.jsonls.setup(jsonls_opts)
-- local rust_opts = require("user.lsp.settings.rust")
-- lspconfig.rust_analyzer.setup(rust_opts)
-- local python_opts = 
-- lspconfig.pyright.setup(require("user.lsp.settings.python"))

require("user.lsp.settings.lua")
require("user.lsp.settings.css")
require("user.lsp.settings.jsonls")
require("user.lsp.settings.rust")
require("user.lsp.settings.python")
require("user.lsp.settings.typescript")


require("user.lsp.handlers")

-- require "user.lsp.null-ls"
-- require "user.lsp.lsp_signature"
