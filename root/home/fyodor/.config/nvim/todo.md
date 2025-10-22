1. Replace packer with lazy.nvim **DONE**

2. Remove impatient.nvim **DONE**

3. Replace null-ls.nvim with nvim-lint + conform.nvim

4. Fix deprecated icon references **DONE**

Using kyazdani42/nvim-web-devicons and kyazdani42/nvim-tree.lua - these moved to:
- nvim-tree/nvim-web-devicons
- nvim-tree/nvim-tree.lua

5. Fix inconsistent plugin loading in init.lua

Mix of styles:
require "user.options"  -- no parens
require("user.dap").setup()  -- with parens and method
require("user.themes.loader")  -- with parens

Recommendation: Use consistent style - prefer require("module") with parentheses.


6. Fix Dead code and commented sections

Many commented blocks throughout:
- lua/user/lsp/init.lua:3-21, 33-34
- lua/user/lsp/mason.lua:166-201
- init.lua:31-32, 42-44
- lua/user/options.lua:19, 36-37, 48

Recommendation: Clean up or document why they're kept.


7. Implement Better file organization for LSP settings

Each LSP server has its own file, but they're all just required without using return values. Consider:
-- Instead of separate files being required
local servers = {
lua_ls = require("user.lsp.settings.lua"),
rust_analyzer = require("user.lsp.settings.rust"),
-- etc
}

8. Fix Autocommands use old vim.cmd syntax

lua/user/options.lua:51
vim.cmd [[ autocmd BufWinEnter * silent! :%foldopen! ]]

Modern approach:
vim.api.nvim_create_autocmd("BufWinEnter", {
callback = function()
  vim.cmd("normal! zR")
end,
})


9. Old keymap API

lua/user/keymaps.lua uses vim.api.nvim_set_keymap throughout.

Modern approach: Use vim.keymap.set which:
- Shorter and cleaner
- Better defaults (noremap by default)
- Supports Lua functions directly
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Navigate left" })


10. Fix cmp mapping syntax is outdated

lua/user/cmp.lua:54-96 uses old mapping format.

Modern syntax:
mapping = cmp.mapping.preset.insert({
['<C-k>'] = cmp.mapping.select_prev_item(),
-- etc
})

11. symbols-outline.nvim → outline.nvim **DONE**

  The plugin was renamed and modernized. Update reference in lua/user/plugins.lua:108



12. Treesitter configuration

  lua/user/treesitter.lua:6-24 missing ensure_installed list. Add commonly used parsers:
  ensure_installed = { "lua", "vim", "vimdoc", "javascript", "typescript", "python", "rust" },

  Also, nvim-ts-context-commentstring integration is commented out but should use Comment.nvim's native
  integration.


13. which-key v3 breaking changes **DONE**

  Your config uses v2 syntax. which-key v3 (current) has different API:
  - setup() options changed
  - register() deprecated in favor of add()

  lua/user/whichkey.lua:1-206


14. Replace nvim-cmp with blink.cmp


15. Lazy load plugins where it makes sense **DONE**

16. Fix termguicolors commented out

  lua/user/options.lua:19 - This should be enabled for modern terminals:
  termguicolors = true,

17. Reenable noice.nvim and fix its config


19. Remove the Protected calls everywhere **DONE**

  While defensive, the pattern:
  local status_ok, module = pcall(require, "module")
  if not status_ok then return end

  is verbose. With lazy.nvim, failed requires are handled gracefully. Consider simplifying where
  appropriate.


20. Empty configuration blocks

  lua/user/treesitter.lua:9 has ignore_install = { "" } - should be {} or removed
