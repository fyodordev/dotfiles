local status_ok, osc52 = pcall(require, "osc52")
if not status_ok then
  return
end

osc52.setup({
  max_length = 0, -- Maximum length of selection (0 for no limit)
  silent = false, -- Disable message on successful copy
  trim = false, -- Trim surrounding whitespaces before copy
  tmux_passthrough = true, -- Use tmux passthrough if running inside tmux
})

-- Integrate OSC52 with Neovim's clipboard provider
-- This makes yanking automatically copy to the system clipboard via OSC52
local function copy(lines, _)
  osc52.copy(table.concat(lines, "\n"))
end

local function paste()
  return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
end

vim.g.clipboard = {
  name = "osc52",
  copy = {
    ["+"] = copy,
    ["*"] = copy,
  },
  paste = {
    ["+"] = paste,
    ["*"] = paste,
  },
}

-- Set clipboard to use the + register (which now uses OSC52)
vim.opt.clipboard = "unnamedplus"
