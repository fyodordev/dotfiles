-- LSP installer helps installing LSP server through a unified interface
-- It works by then providing lspconfig with an extended PATH environment
-- variable where the servers are located that are installed by it.
local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
  -- at this point server can be used like lspconfig.<server>
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

  if server.name == "jsonls" then
	 	local jsonls_opts = require("user.lsp.settings.jsonls")
	 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	 end

  if server.name == "sumneko_lua" then
	 	local sumneko_opts = require("user.lsp.settings.sumneko_lua")
	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	 end

  if server.name == "rust_analyzer" then
	 	local rls_opts = require("user.lsp.settings.rust")
	 	opts = vim.tbl_deep_extend("force", rls_opts, opts)
    -- Initialize debugger config from here as well.
    require("user.dap.rust").setup(server, opts)
		return
	end

	 if server.name == "pyright" then
	 	local py_opts = require("user.lsp.settings.python")
	 	opts = vim.tbl_deep_extend("force", py_opts, opts)
    require("user.dap.python").setup()
	 end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)

end)

