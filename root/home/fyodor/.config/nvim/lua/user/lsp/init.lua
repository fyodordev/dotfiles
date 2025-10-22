-- Load handlers first to set up capabilities
require("user.lsp.handlers")

-- Load mason for LSP server management
require("user.lsp.mason")

-- Load LSP server configurations
require("user.lsp.settings.lua")
require("user.lsp.settings.css")
require("user.lsp.settings.jsonls")
require("user.lsp.settings.rust")
require("user.lsp.settings.python")
require("user.lsp.settings.typescript")

-- require "user.lsp.null-ls"
-- require "user.lsp.lsp_signature"
