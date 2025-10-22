-- Plugin specifications for lazy.nvim
return {
  -- Required dependencies for other plugins
  { "nvim-neotest/nvim-nio" },

  -- Core utilities
  { "nvim-lua/popup.nvim" }, -- An implementation of the Popup API from vim in Neovim
  { "nvim-lua/plenary.nvim" }, -- Useful lua functions used by lots of plugins

  -- Editor enhancements
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("user.autopairs")
    end,
  },
  {
    "numToStr/Comment.nvim",
    keys = { "gc", "gb" },
    config = function()
      require("user.comment")
    end,
  },

  -- UI components
  { "nvim-tree/nvim-web-devicons" },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = function()
      require("user.nvim-tree")
    end,
  },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    config = function()
      require("user.bufferline")
    end,
  },
  { "moll/vim-bbye", cmd = { "Bdelete", "Bwipeout" } },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("user.lualine")
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    cmd = { "ToggleTerm", "TermExec" },
    config = function()
      require("user.toggleterm")
    end,
  },
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    config = function()
      require("user.project")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("user.indentline")
    end,
  },
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      require("user.alpha")
    end,
  },
  { "antoinemadec/FixCursorHold.nvim" }, -- This is needed to fix lsp doc highlight
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("user.whichkey")
    end,
  },

  -- Colorschemes
  { "navarasu/onedark.nvim", lazy = true },
  { "folke/tokyonight.nvim", lazy = true },
  { "rebelot/kanagawa.nvim", lazy = true },
  { "EdenEast/nightfox.nvim", lazy = true },
  { "projekt0n/github-nvim-theme", lazy = true },
  { "marko-cerovac/material.nvim", lazy = true },
  { "yashguptaz/calvera-dark.nvim", lazy = true },
  { "tiagovla/tokyodark.nvim", lazy = true },
  { "Everblush/nvim", lazy = true },
  { "shaunsingh/moonlight.nvim", lazy = true },
  { "yonlu/omni.vim", lazy = true },
  { "nxvu699134/vn-night.nvim", lazy = true },
  { "scottmckendry/cyberdream.nvim", lazy = true },
  { "iagorrr/noctishc.nvim", lazy = true },

  -- General appearance related plugins
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    config = function()
      require("user.neoscroll")
    end,
  },

  -- Completion plugins
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer", -- buffer completions
      "hrsh7th/cmp-path", -- path completions
      "hrsh7th/cmp-cmdline", -- cmdline completions
      "saadparwaiz1/cmp_luasnip", -- snippet completions
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip", -- snippet engine
      "rafamadriz/friendly-snippets", -- a bunch of snippets to use
    },
    config = function()
      require("user.cmp")
    end,
  },

  -- LSP
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate" },
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("user.lsp")
    end,
  },
  { "williamboman/mason-lspconfig.nvim", lazy = true },
  { "neovim/nvim-lspconfig", lazy = true },
  { "tamago324/nlsp-settings.nvim" }, -- language server settings defined in json
  { "jose-elias-alvarez/null-ls.nvim" }, -- for formatters and linters
  {
    "ray-x/lsp_signature.nvim",
    event = "LspAttach",
  },
  {
    "hedyhli/outline.nvim",
    cmd = { "Outline", "OutlineOpen" },
    config = function()
      require("user.outline")
    end,
  },
  {
    "kosayoda/nvim-lightbulb",
    event = "LspAttach",
    config = function()
      require("user.lightbulb")
    end,
  },
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-tree.lua",
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },

  -- Database
  { "tpope/vim-dadbod", cmd = "DBUI" },
  {
    "kristijanhusak/vim-dadbod-ui",
    cmd = "DBUI",
    dependencies = "tpope/vim-dadbod",
  },
  {
    "kristijanhusak/vim-dadbod-completion",
    ft = { "sql", "mysql", "plsql" },
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      require("user.telescope")
    end,
  },

  -- Noice
  {
    "folke/noice.nvim",
    enabled = false, -- Currently disabled, see todo item #17
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
      require("user.treesitter")
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = { "BufReadPost", "BufNewFile" },
  },

  -- Utilities
  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
  },
  { "renerocksai/calendar-vim", cmd = "Calendar" },
  {
    "renerocksai/telekasten.nvim",
    ft = "markdown",
  },

  -- Git
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("user.gitsigns")
    end,
  },
  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    config = function()
      require("user.neogit")
    end,
  },

  -- Todos
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("user.todo-comments")
    end,
  },

  -- Debugging and better language integrations
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
      "nvim-telescope/telescope-dap.nvim",
      { "Pocco81/dap-buddy.nvim", branch = "dev" },
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    keys = {
      { "<F5>", desc = "DAP Continue" },
      { "<F10>", desc = "DAP Step Over" },
      { "<F11>", desc = "DAP Step Into" },
      { "<F12>", desc = "DAP Step Out" },
    },
    config = function()
      require("user.dap").setup()
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
  },

  -- Editor config
  {
    "gpanders/editorconfig.nvim",
    event = { "BufReadPost", "BufNewFile" },
  },

  -- Task/Code runner
  {
    "stevearc/overseer.nvim",
    cmd = { "OverseerRun", "OverseerToggle", "OverseerInfo" },
    config = function()
      require("user.overseer")
    end,
  },

  -- AI
  {
    "David-Kunz/gen.nvim",
    cmd = "Gen",
  },
}
