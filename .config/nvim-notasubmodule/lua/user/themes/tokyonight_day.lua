return function()
  vim.g.tokyonight_style = "day"
  vim.g.tokyonight_italic_functions = true
  vim.g.tokyonight_hide_inactive_statusline = true
  vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer", "nvim-tree" }
  vim.g.tokyonight_dark_float = false

  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

  -- Load the colorscheme
  vim.cmd[[colorscheme default]]
  vim.cmd[[colorscheme tokyonight-day]]
end
