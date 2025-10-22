-- nvim-lint - Modern linter plugin
-- Replaces null-ls.nvim for diagnostics/linting functionality

local lint = require("lint")

-- Configure linters by filetype
lint.linters_by_ft = {
  -- python = { "flake8" }, -- Uncomment if you want to use flake8
  -- Add other linters as needed
}

-- Create autocommand to run linters
vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
  group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
  callback = function()
    -- Try lint without raising an error
    local status_ok, _ = pcall(lint.try_lint)
    if not status_ok then
      -- Silently fail if no linters configured for this filetype
      return
    end
  end,
})
