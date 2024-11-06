-- Source: https://felix-kling.de/blog/2021/linux-toggle-dark-mode.html
-- With own modifications.

-- The file that nvim will watch for the string to determine the current theme.
local themeFile = vim.fn.expand('~/.theme/active-writeables/neovim_theme')


-- This function is executed when the above file changes.
local function reload()
  -- Open file.
  local f = io.open(themeFile, "rb")
  if not f then
    print(themeFile .. ' not found.')
    return
  end

  -- Read first line.
  local firstLine = f:read()

  if not firstLine then
    print(themeFile .. ' has no content.')
    return
  end

  -- Remove whitespace
  local theme = firstLine:gsub("%s+", "")

  if (theme == 'standard') then
    vim.cmd[[colorscheme default]]
    require('user.themes.tokyonight_storm')()
    return
  end
  if (theme == 'dark') then
    vim.cmd[[colorscheme default]]
    require('user.themes.tokyonight_night')()
    return
  end
  if (theme == 'light') then
    vim.cmd[[colorscheme default]]
    require('user.themes.github-light')()
    return
  end

  if (theme == 'green') then
    vim.cmd[[colorscheme default]]
    vim.cmd[[colorscheme terafox]]
    -- require('user.themes.github-light')()
    return
  end

  if (theme == 'highcontrast') then
    vim.cmd[[colorscheme default]]
    require('noctishc').setup()
    -- require('user.themes.cyberdream')()
    return
  end


  print('No configuration for theme ' .. theme)
end


-- Setup file watcher
local w = vim.loop.new_fs_event()
local on_change
local function watch_file(fname)
	w:start(fname, {}, vim.schedule_wrap(on_change))
end

on_change = function()
	reload()
	-- Debounce: stop/start.
	w:stop()
	watch_file(themeFile)
end

-- reload vim config when background changes
watch_file(themeFile)
reload()

-- Apply further appearance changes
require('user.themes.hidetilde')

