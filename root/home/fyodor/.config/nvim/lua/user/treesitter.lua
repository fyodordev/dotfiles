local configs = require("nvim-treesitter.configs")

configs.setup({
  ensure_installed = {
    "lua", "vim", "vimdoc", "query",
    "javascript", "typescript", "tsx",
    "python", "rust", "go",
    "html", "css", "json", "yaml", "toml",
    "markdown", "markdown_inline",
    "bash", "regex"
  },
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = {}, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = {}, -- list of language that will be disabled
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true, disable = { "yaml" } },
  -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring/issues/82
  -- context_commentstring = {
  --   enable = true,
  --   enable_autocmd = false,
  -- },
})
