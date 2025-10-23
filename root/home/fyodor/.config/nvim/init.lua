-- Set leader keys BEFORE loading lazy.nvim
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bootstrap lazy.nvim
require("user.lazy")

-- Setup plugins
require("lazy").setup("user.plugins")

-- Core configuration
require("user.options")
require("user.keymaps")
require("user.colorscheme")
require("user.autocommands")

-- Theme configuration
require("user.themes.loader")
require("user.themes.onedark-deep")







-- require "dap-install"
-- require("rust-tools").setup({})
-- require('tokyonight.extra').setup()

