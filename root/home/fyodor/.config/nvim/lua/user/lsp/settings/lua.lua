vim.lsp.config.lua_ls = {
  default_config = {
    capabilities = _G.lsp_capabilities,
  }
}

vim.lsp.enable('lua_ls')

--  {
-- 	settings = {
-- 
-- 		Lua = {
-- 			diagnostics = {
-- 				globals = { "vim" },
-- 			},
-- 			workspace = {
-- 				library = {
-- 					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
-- 					[vim.fn.stdpath("config") .. "/lua"] = true,
-- 				},
-- 			},
-- 		},
-- 	},
-- }
