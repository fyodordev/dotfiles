return function()
  require("cyberdream").setup({
      -- Recommended - see "Configuring" below for more config options
      transparent = false,
      italic_comments = true,
      hide_fillchars = true,
      borderless_telescope = false,
      terminal_colors = true,
  })
  vim.cmd[[colorscheme default]]
  vim.cmd[[colorscheme default]]
  vim.cmd[[colorscheme cyberdream]]
  vim.cmd[[colorscheme cyberdream]]
end
