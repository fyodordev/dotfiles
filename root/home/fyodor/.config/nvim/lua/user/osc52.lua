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
-- Store the last register type to preserve line-wise yanks
local last_regtype = "v"

local function copy(lines, regtype)
  -- Store the register type for paste operations
  last_regtype = regtype or "v"

  -- For line-wise yanks, include trailing newline
  local content
  if regtype == "V" or regtype == "l" then
    content = table.concat(lines, "\n") .. "\n"
  else
    content = table.concat(lines, "\n")
  end

  osc52.copy(content)
end

local function paste()
  -- Check if running over SSH
  local is_ssh = os.getenv("SSH_CONNECTION") ~= nil or os.getenv("SSH_TTY") ~= nil

  if not is_ssh then
    -- Running locally, try to use wl-paste for Wayland clipboard
    local clipboard_content = vim.fn.system("wl-paste --no-newline 2>/dev/null")

    if vim.v.shell_error == 0 and clipboard_content and clipboard_content ~= "" then
      -- Successfully read from clipboard, use stored register type
      local lines = vim.fn.split(clipboard_content, "\n")
      -- If it was a line-wise yank and the content ends with newline, remove empty last line
      if (last_regtype == "V" or last_regtype == "l") and clipboard_content:sub(-1) == "\n" then
        -- Keep the lines as-is since line-wise yank should include the newline
      end
      return { lines, last_regtype }
    end
  end

  -- Fallback: use internal register (for SSH or if wl-paste failed)
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
