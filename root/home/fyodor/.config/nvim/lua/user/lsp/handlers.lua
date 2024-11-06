-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

local telescope = require('telescope.builtin')


-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }

    --vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gd', telescope.lsp_definitions, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gi', telescope.lsp_implementations, opts)
    vim.keymap.set('n', '<C-S>', vim.lsp.buf.signature_help, opts)
    --vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gr', telescope.lsp_references, opts)
    vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)


    -- TODO Clashing with whichkey bindings
    -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)
    -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    -- vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)



    -- vim.keymap.set('n', 'gl', function()
    --     -- If we find a floating window, close it.
    --     local found_float = false
    --     for _, win in ipairs(vim.api.nvim_list_wins()) do
    --         if vim.api.nvim_win_get_config(win).relative ~= '' then
    --             vim.api.nvim_win_close(win, true)
    --             found_float = true
    --         end
    --     end

    --     if found_float then
    --         return
    --     end

    --     vim.diagnostic.open_float(nil, { focus = false, scope = 'cursor' })
    -- end, { desc = 'Toggle Diagnostics' })

    -- Format buffer
    -- vim.keymap.set('n', '<space>f', function()
    --   vim.lsp.buf.format { async = true }
    -- end, opts)
  end,
})




















-- local M = {}
-- 
-- -- TODO: backfill this to template
-- M.setup = function()
--   local signs = {
--     { name = "DiagnosticSignError", text = "" },
--     { name = "DiagnosticSignWarn", text = "" },
--     { name = "DiagnosticSignHint", text = "" },
--     { name = "DiagnosticSignInfo", text = "" },
--   }
-- 
--   for _, sign in ipairs(signs) do
--     vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
--   end
-- 
--   local config = {
--     -- disable virtual text
--     virtual_text = true,
--     -- show signs
--     signs = {
--       active = signs,
--     },
--     update_in_insert = true,
--     underline = true,
--     severity_sort = true,
--     float = {
--       focusable = false,
--       style = "minimal",
--       border = "single",
--       source = "always",
--       header = "",
--       prefix = "",
--     },
--   }
-- 
--   vim.diagnostic.config(config)
-- 
--   vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
--     border = "single",
--   })
-- 
--   vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
--     border = "single",
--   })
-- end
-- 
-- local function lsp_highlight_document(client)
--   -- Set autocommands conditional on server_capabilities
--   if client.server_capabilities.document_highlight then
--     vim.api.nvim_exec(
--       [[
--       augroup lsp_document_highlight
--         autocmd! * <buffer>
--         autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
--         autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
--       augroup END
--     ]],
--       false
--     )
--   end
-- end
-- 
-- local function lsp_keymaps(bufnr)
--   local opts = { noremap = true, silent = true }
--   vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
--   vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
--   vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
--   vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
--   vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
--   -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
--   -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
--   vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
--   -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
--   -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
--   vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "single" })<CR>', opts)
--   vim.api.nvim_buf_set_keymap(
--     bufnr,
--     "n",
--     "gl",
--     '<cmd>lua vim.diagnostic.open_float(0, {{ border = "single", pad }, scope="line"})<CR>',
--     opts
--   )
--   vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "single" })<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
--   vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format()' ]]
-- end
-- 
-- M.on_attach = function(client, bufnr)
--   -- The purpose of the on_attach callback is to run a lua callback after the
--   -- language server successfully attaches to a given buffer. This lets you
--   -- conditionally map keybindings, enable autocompletion, set buffer options,
--   -- etc. based on whether or not the language server is active in your buffer.
--   -- Users typically use this to map keybindings to the client as seen in the
--   -- example keybindings in the readme.
-- 
--   -- Disable the respective LSP for document formatting
--   --   to use null-ls instead.
--   if client.name == "tsserver" then
--     client.server_capabilities.document_formatting = false
--   end
--   if client.name == "sumneko_lua" then
--     client.server_capabilities.document_formatting = false
--   end
--   lsp_keymaps(bufnr)
--   lsp_highlight_document(client)
-- end
-- 
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- 
-- local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
-- if not status_ok then
--   return
-- end
-- 
-- M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
-- 
-- return M
