require("noice").setup({
  cmdline = {
    enabled = true,
    view = "cmdline_popup", -- Use a popup for the command line instead of the bottom line
    format = {
      cmdline = { icon = " " },
      search_down = { icon = " " },
      search_up = { icon = " " },
      filter = { icon = " " },
      lua = { icon = " " },
      help = { icon = " " },
    },
  },
  messages = {
    enabled = true,
    view = "notify", -- Use notify for messages
    view_error = "notify",
    view_warn = "notify",
    view_history = "messages",
    view_search = "virtualtext",
  },
  popupmenu = {
    enabled = true,
    backend = "nui", -- Use nui backend for popup menu
  },
  views = {
    notify = {
      view = "mini",
    },
    cmdline_popup = {
      position = {
        row = "50%",
        col = "50%",
      },
      size = {
        width = 60,
        height = "auto",
      },
      border = {
        style = "rounded",
        padding = { 0, 1 },
      },
    },
  },
  lsp = {
    progress = {
      enabled = true,
      view = "mini",
    },
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
    hover = {
      enabled = true,
    },
    signature = {
      enabled = true,
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = false, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = true, -- add a border to hover docs and signature help
  },
})
