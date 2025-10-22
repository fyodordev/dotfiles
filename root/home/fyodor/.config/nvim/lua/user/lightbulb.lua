-- Modern nvim-lightbulb configuration
require("nvim-lightbulb").setup({
  -- LSP client names to ignore
  ignore = {},
  sign = {
    enabled = true,
    -- Priority of the gutter sign
    priority = 10,
  },
  float = {
    enabled = false,
    text = "💡",
    win_opts = {},
  },
  virtual_text = {
    enabled = false,
    text = "💡",
    hl_mode = "replace",
  },
  status_text = {
    enabled = false,
    text = "💡",
    text_unavailable = "",
  },
})

-- Use modern autocmd API
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("nvim-lightbulb", { clear = true }),
  callback = function()
    require("nvim-lightbulb").update_lightbulb()
  end,
})
