local which_key = require("which-key")

local telescope = require('telescope.builtin')

-- Which-Key v3 setup configuration
local setup = {
  preset = "modern",
  -- Plugins
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = false, -- adds help for operators like d, y, ...
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- Icons
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
    mappings = true,
  },
  -- Window appearance
  win = {
    border = "double", -- none, single, double, shadow, rounded
    padding = { 2, 2 }, -- extra window padding [top/bottom, right/left]
    title = true,
    title_pos = "center",
  },
  -- Layout
  layout = {
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
  },
  -- Keys for scrolling
  keys = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  show_help = true,
}

which_key.setup(setup)

-- Which-Key v3 mappings using add() method
which_key.add({
  -- Single key mappings
  { "<leader>a", "<cmd>Alpha<cr>", desc = "Alpha" },
  { "<leader>b", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc = "Buffers" },
  { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },
  { "<leader>w", "<cmd>w!<CR>", desc = "Save" },
  { "<leader>W", "<cmd>wa<CR>", desc = "Save all" },
  { "<leader>q", "<cmd>q!<CR>", desc = "Quit" },
  { "<leader>Q", "<cmd>wa<CR><cmd>qa<CR>", desc = "Quit and save all" },
  { "<leader>c", "<cmd>Bdelete!<CR>", desc = "Close Buffer" },
  { "<leader>n", "<cmd>:TodoTelescope<cr>", desc = "Notes/Tags" },
  { "<leader>f", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc = "Find files" },
  { "<leader>v", "<cmd>vsplit<cr>", desc = "Vertical Split" },
  { "<leader>h", "<cmd>split<cr>", desc = "Horizontal Split" },
  { "<leader>F", "<cmd>Telescope live_grep theme=ivy<cr>", desc = "Find Text" },
  { "<leader>P", "<cmd>lua require('telescope').extensions.projects.projects()<cr>", desc = "Projects" },
  { "<leader>N", "<cmd>!bash -c 'nohup $($TERM nvim . &>/dev/null) & disown'<CR><CR>", desc = "New window" },
  { "<leader>T", "<cmd>!bash -c 'nohup $($TERM &>/dev/null) & disown'<CR><CR>", desc = "External Terminal" },

  -- Lazy.nvim group (replacing Packer)
  { "<leader>p", group = "Lazy" },
  { "<leader>pc", "<cmd>Lazy clean<cr>", desc = "Clean" },
  { "<leader>pi", "<cmd>Lazy install<cr>", desc = "Install" },
  { "<leader>ps", "<cmd>Lazy sync<cr>", desc = "Sync" },
  { "<leader>pS", "<cmd>Lazy<cr>", desc = "Status" },
  { "<leader>pu", "<cmd>Lazy update<cr>", desc = "Update" },
  { "<leader>pl", "<cmd>Lazy log<cr>", desc = "Log" },
  { "<leader>pp", "<cmd>Lazy profile<cr>", desc = "Profile" },

  -- Theme group
  { "<leader>z", group = "Change Theme" },
  { "<leader>zd", "<cmd>lua require('user.themes.tokyonight_day')()<CR>", desc = "TokyoNight Day" },
  { "<leader>zs", "<cmd>lua require('user.themes.tokyonight_storm')()<cr>", desc = "TokyoNight Storm" },
  { "<leader>zn", "<cmd>lua require('user.themes.tokyonight_night')()<cr>", desc = "TokyoNight Night" },

  -- Git group
  { "<leader>g", group = "Git" },
  { "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", desc = "Lazygit" },
  { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk" },
  { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk" },
  { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame" },
  { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },
  { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },
  { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
  { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" },
  { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },
  { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file" },
  { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
  { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },
  { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff" },

  -- LSP group
  { "<leader>l", group = "LSP" },
  { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
  { "<leader>ld", telescope.lsp_document_symbols, desc = "Document Symbols" },
  { "<leader>lw", telescope.lsp_workspace_symbols, desc = "Workspace Symbols" },
  { "<leader>lt", telescope.lsp_type_definitions, desc = "Type Definitions" },
  { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Format" },
  { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
  { "<leader>lI", "<cmd>LspInstallInfo<cr>", desc = "Installer Info" },
  { "<leader>lj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", desc = "Next Diagnostic" },
  { "<leader>lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic" },
  { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
  { "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", desc = "Quickfix" },
  { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
  { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
  { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
  { "<leader>le", telescope.diagnostics, desc = "Show diagnostics items" },

  -- Search group
  { "<leader>s", group = "Search" },
  { "<leader>sb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
  { "<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
  { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
  { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
  { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
  { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
  { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
  { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },

  -- Terminal group
  { "<leader>t", group = "Terminal" },
  { "<leader>tn", "<cmd>lua _NODE_TOGGLE()<cr>", desc = "Node" },
  { "<leader>tu", "<cmd>lua _NCDU_TOGGLE()<cr>", desc = "NCDU" },
  { "<leader>tt", "<cmd>lua _HTOP_TOGGLE()<cr>", desc = "Htop" },
  { "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>", desc = "Python" },
  { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float" },
  { "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal" },
  { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Vertical" },
})
