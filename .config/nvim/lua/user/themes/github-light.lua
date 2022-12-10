return function()
  require("github-theme").setup({
    theme_style = "light",
    -- other config
  })
  vim.cmd[[colorscheme default]]
  vim.cmd[[colorscheme default]]
  vim.cmd[[colorscheme github_light]]
  vim.cmd[[colorscheme github_light]]
end
