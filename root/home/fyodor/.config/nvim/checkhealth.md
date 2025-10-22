==============================================================================
lazy:                                                               2 ⚠️  2 ❌

lazy.nvim ~
- {lazy.nvim} version `11.17.1`
- ✅ OK {git} `version 2.51.0`
- ✅ OK no existing packages found by other package managers
- ❌ ERROR please remove the file `/home/fyodor/.config/nvim/plugin/packer_compiled.lua`

luarocks ~
- checking `hererocks` installation
- ✅ OK no plugins require `luarocks`, so you can ignore any warnings below
- ✅ OK {python3} `Python 3.13.7`
- ❌ ERROR {/home/fyodor/.local/share/nvim/lazy-rocks/hererocks/bin/luarocks} not installed
- ⚠️ WARNING {/home/fyodor/.local/share/nvim/lazy-rocks/hererocks/bin/lua} version `5.1` not installed
- ⚠️ WARNING Lazy won't be able to install plugins that require `luarocks`.
  Here's what you can do:
   - fix your `luarocks` installation
   - disable *hererocks* with `opts.rocks.hererocks = false`
   - disable `luarocks` support completely with `opts.rocks.enabled = false`

==============================================================================
lspconfig:                                                                  ✅

- Skipped. This healthcheck is redundant with `:checkhealth vim.lsp`.

==============================================================================
mason-lspconfig:                                                            ✅

mason-lspconfig.nvim ~
- ✅ OK Neovim v0.11
- ✅ OK mason.nvim v2

==============================================================================
null-ls:                                                                    ✅

- no sources registered

==============================================================================
nvim-treesitter:                                                          1 ⚠️

Installation ~
- ⚠️ WARNING `tree-sitter` executable not found (parser generator, only needed for :TSInstallFromGrammar, not required for :TSInstall)
- ✅ OK `node` found v20.19.5 (only needed for :TSInstallFromGrammar)
- ✅ OK `git` executable found.
- ✅ OK `cc` executable found. Selected from { vim.NIL, "cc", "gcc", "clang", "cl", "zig" }
  Version: cc (GCC) 15.2.1 20250813
- ✅ OK Neovim was compiled with tree-sitter runtime ABI version 15 (required >=13). Parsers must be compatible with runtime ABI.

OS Info:
{
  machine = "x86_64",
  release = "6.16.7-zen1-1-zen",
  sysname = "Linux",
  version = "#1 ZEN SMP PREEMPT_DYNAMIC Thu, 11 Sep 2025 17:42:18 +0000"
} ~

Parser/Features         H L F I J
  - c                   ✓ ✓ ✓ ✓ ✓
  - lua                 ✓ ✓ ✓ ✓ ✓
  - markdown            ✓ . ✓ ✓ ✓
  - markdown_inline     ✓ . . . ✓
  - query               ✓ ✓ ✓ ✓ ✓
  - vim                 ✓ ✓ ✓ . ✓
  - vimdoc              ✓ . . . ✓

  Legend: H[ighlight], L[ocals], F[olds], I[ndents], In[j]ections
         +) multiple parsers found, only one will be used
         x) errors found in the query, try to run :TSUpdate {lang} ~

==============================================================================
telescope:                                                                  ✅

Checking for required plugins ~
- ✅ OK plenary installed.
- ✅ OK nvim-treesitter installed.

Checking external dependencies ~
- ✅ OK rg: found ripgrep 14.1.1
- ✅ OK fd: found fd 10.3.0

===== Installed extensions ===== ~

Telescope Extension: `projects` ~
- No healthcheck provided

==============================================================================
vim.deprecated:                                                           2 ⚠️

 ~
- ⚠️ WARNING vim.tbl_add_reverse_lookup is deprecated. Feature will be removed in Nvim 0.12
  - ADVICE:
    - stack traceback:
        /home/fyodor/.local/share/nvim/lazy/null-ls.nvim/lua/null-ls/methods.lua:17
        [C]:-1
        /home/fyodor/.local/share/nvim/lazy/null-ls.nvim/lua/null-ls/diagnostics.lua:4
        [C]:-1
        /home/fyodor/.local/share/nvim/lazy/null-ls.nvim/lua/null-ls/sources.lua:1
        [C]:-1
        /home/fyodor/.local/share/nvim/lazy/null-ls.nvim/lua/null-ls/health.lua:52
        equire("null-ls.health").check():1
        [C]:-1
        /usr/share/nvim/runtime/lua/vim/health.lua:442
        nvim>:1
    - stack traceback:
        /home/fyodor/.local/share/nvim/lazy/null-ls.nvim/lua/null-ls/methods.lua:29
        [C]:-1
        /home/fyodor/.local/share/nvim/lazy/null-ls.nvim/lua/null-ls/diagnostics.lua:4
        [C]:-1
        /home/fyodor/.local/share/nvim/lazy/null-ls.nvim/lua/null-ls/sources.lua:1
        [C]:-1
        /home/fyodor/.local/share/nvim/lazy/null-ls.nvim/lua/null-ls/health.lua:52
        equire("null-ls.health").check():1
        [C]:-1
        /usr/share/nvim/runtime/lua/vim/health.lua:442
        nvim>:1

 ~
- ⚠️ WARNING vim.tbl_flatten is deprecated. Feature will be removed in Nvim 0.13
  - ADVICE:
    - use vim.iter(…):flatten():totable() instead.
    - stack traceback:
        /home/fyodor/.local/share/nvim/lazy/null-ls.nvim/lua/null-ls/utils/init.lua:255
        /home/fyodor/.local/share/nvim/lazy/null-ls.nvim/lua/null-ls/config.lua:19
        [C]:-1
        /home/fyodor/.local/share/nvim/lazy/null-ls.nvim/lua/null-ls/diagnostics.lua:3
        [C]:-1
        /home/fyodor/.local/share/nvim/lazy/null-ls.nvim/lua/null-ls/sources.lua:1
        [C]:-1
        /home/fyodor/.local/share/nvim/lazy/null-ls.nvim/lua/null-ls/health.lua:52
        equire("null-ls.health").check():1
        [C]:-1
        /usr/share/nvim/runtime/lua/vim/health.lua:442
        nvim>:1

==============================================================================
vim.health:                                                                 ✅

Configuration ~
- ✅ OK no issues found

Runtime ~
- ✅ OK $VIMRUNTIME: /usr/share/nvim/runtime

Performance ~
- ✅ OK Build type: RelWithDebInfo

Remote Plugins ~
- ✅ OK Up to date

terminal ~
- key_backspace (kbs) terminfo entry: `key_backspace=\177`
- key_dc (kdch1) terminfo entry: `key_dc=\E[3~`
- $COLORTERM="truecolor"

External Tools ~
- ✅ OK ripgrep 14.1.1 (/usr/bin/rg)

==============================================================================
vim.lsp:                                                                    ✅

- LSP log level : WARN
- Log path: /home/fyodor/.local/state/nvim/lsp.log
- Log size: 3214 KB

vim.lsp: Active Clients ~
- No active clients

vim.lsp: Enabled Configurations ~
- cssls:
  - cmd: { "vscode-css-language-server", "--stdio" }
  - filetypes: css, scss, less
  - init_options: {
      provideFormatter = true
    }
  - root_markers: { "package.json", ".git" }
  - settings: {
      css = {
        validate = true
      },
      less = {
        validate = true
      },
      scss = {
        validate = true
      }
    }

- cssmodules_ls:
  - cmd: { "cssmodules-language-server" }
  - filetypes: javascript, javascriptreact, typescript, typescriptreact
  - root_markers: { "package.json" }

- jsonls:
  - cmd: { "vscode-json-language-server", "--stdio" }
  - filetypes: json, jsonc
  - init_options: {
      provideFormatter = true
    }
  - root_markers: { ".git" }

- lua_ls:
  - cmd: { "lua-language-server" }
  - filetypes: lua
  - root_markers: { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" }

- pyright:
  - cmd: { "pyright-langserver", "--stdio" }
  - filetypes: python
  - on_attach: <function @/home/fyodor/.local/share/nvim/lazy/nvim-lspconfig/lsp/pyright.lua:45>
  - root_markers: { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", "pyrightconfig.json", ".git" }
  - settings: {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "openFilesOnly",
          useLibraryCodeForTypes = true
        }
      }
    }

- rust_analyzer:
  - before_init: <function @/home/fyodor/.local/share/nvim/lazy/nvim-lspconfig/lsp/rust_analyzer.lua:110>
  - capabilities: {
      experimental = {
        serverStatusNotification = true
      }
    }
  - cmd: { "rust-analyzer" }
  - filetypes: rust
  - on_attach: <function @/home/fyodor/.local/share/nvim/lazy/nvim-lspconfig/lsp/rust_analyzer.lua:116>
  - root_dir: <function @/home/fyodor/.local/share/nvim/lazy/nvim-lspconfig/lsp/rust_analyzer.lua:59>

- ts_ls:
  - cmd: { "typescript-language-server", "--stdio" }
  - commands: {
      ["editor.action.showReferences"] = <function 1>
    }
  - filetypes: javascript, javascriptreact, javascript.jsx, typescript, typescriptreact, typescript.tsx
  - handlers: {
      ["_typescript.rename"] = <function 1>
    }
  - init_options: {
      hostInfo = "neovim"
    }
  - on_attach: <function @/home/fyodor/.local/share/nvim/lazy/nvim-lspconfig/lsp/ts_ls.lua:111>
  - root_dir: <function @/home/fyodor/.local/share/nvim/lazy/nvim-lspconfig/lsp/ts_ls.lua:56>


vim.lsp: File Watcher ~
- file watching "(workspace/didChangeWatchedFiles)" disabled on all clients

vim.lsp: Position Encodings ~
- No active clients

==============================================================================
vim.provider:                                                             6 ⚠️

Clipboard (optional) ~
- ✅ OK Clipboard tool found: wl-copy

Node.js provider (optional) ~
- Node.js: v20.19.5

- ⚠️ WARNING Missing "neovim" npm (or yarn, pnpm) package.
  - ADVICE:
    - Run in shell: npm install -g neovim
    - Run in shell (if you use yarn): yarn global add neovim
    - Run in shell (if you use pnpm): pnpm install -g neovim
    - You may disable this provider (and warning) by adding `let g:loaded_node_provider = 0` to your init.vim

Perl provider (optional) ~
- ⚠️ WARNING "Neovim::Ext" cpan module is not installed
  - ADVICE:
    - See :help |provider-perl| for more information.
    - You can disable this provider (and warning) by adding `let g:loaded_perl_provider = 0` to your init.vim
- ⚠️ WARNING No usable perl executable found

Python 3 provider (optional) ~
- ⚠️ WARNING No Python executable found that can `import neovim`. Using the first available executable for diagnostics.
- ⚠️ WARNING Could not load Python :
  /usr/bin/python3 does not have the "neovim" module.
  /usr/bin/python3.13 does not have the "neovim" module.
  python3.12 not found in search path or not executable.
  python3.11 not found in search path or not executable.
  python3.10 not found in search path or not executable.
  python3.9 not found in search path or not executable.
  /usr/bin/python does not have the "neovim" module.
  - ADVICE:
    - See :help |provider-python| for more information.
    - You can disable this provider (and warning) by adding `let g:loaded_python3_provider = 0` to your init.vim
- Executable: Not found

Python virtualenv ~
- ✅ OK no $VIRTUAL_ENV

Ruby provider (optional) ~
- Ruby: ruby 3.4.5 (2025-07-16 revision 20cda200d3) +PRISM [x86_64-linux]
- ⚠️ WARNING `neovim-ruby-host` not found.
  - ADVICE:
    - Run `gem install neovim` to ensure the neovim RubyGem is installed.
    - Run `gem environment` to ensure the gem bin directory is in $PATH.
    - If you are using rvm/rbenv/chruby, try "rehashing".
    - See :help |g:ruby_host_prog| for non-standard gem installations.
    - You can disable this provider (and warning) by adding `let g:loaded_ruby_provider = 0` to your init.vim

==============================================================================
vim.treesitter:                                                             ✅

Treesitter features ~
- Treesitter ABI support: min 13, max 15
- WASM parser support: false

Treesitter parsers ~
- ✅ OK Parser: c                         ABI: 15, path: /usr/share/nvim/runtime/parser/c.so
- ✅ OK Parser: lua                       ABI: 15, path: /usr/share/nvim/runtime/parser/lua.so
- ✅ OK Parser: markdown                  ABI: 15, path: /usr/share/nvim/runtime/parser/markdown.so
- ✅ OK Parser: markdown_inline           ABI: 15, path: /usr/share/nvim/runtime/parser/markdown_inline.so
- ✅ OK Parser: query                     ABI: 15, path: /usr/share/nvim/runtime/parser/query.so
- ✅ OK Parser: vim                       ABI: 15, path: /usr/share/nvim/runtime/parser/vim.so
- ✅ OK Parser: vimdoc                    ABI: 15, path: /usr/share/nvim/runtime/parser/vimdoc.so

==============================================================================
which-key:                                                                6 ⚠️

- ✅ OK Most of these checks are for informational purposes only.
  WARNINGS should be treated as a warning, and don't necessarily indicate a problem with your config.
  Please |DON'T| report these warnings as an issue.

Checking your config ~
- ⚠️ WARNING There are issues with your config:
  - `opts.hidden`: option is deprecated.
  - `opts.popup_mappings`: option is deprecated. see `opts.keys`
  - `opts.window`: option is deprecated. see `opts.win`
  - `opts.ignore_missing`: option is deprecated. see `opts.filter`
  - `opts.key_labels`: option is deprecated. see `opts.replace`
  - `opts.triggers_blacklist`: option is deprecated. see `opts.triggers`
  - `opts.triggers`: triggers must be a table
  Please refer to the docs for more info.
- ⚠️ WARNING |mini.icons| is not installed
- ✅ OK |nvim-web-devicons| is installed

Checking for issues with your mappings ~
- ⚠️ WARNING You're using an old version of the which-key spec.
  Your mappings will work, but it's recommended to update them to the new version.
  Please check the docs and suggested spec below for more info.
  Mappings: >
  {
    F = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
    N = { "<cmd>!bash -c 'nohup $($TERM nvim . &>/dev/null) & disown'<CR><CR>", "New window" },
    P = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
    Q = { "<cmd>wa<CR><cmd>qa<CR>", "Quit and save all" },
    T = { "<cmd>!bash -c 'nohup $($TERM &>/dev/null) & disown'<CR><CR>", "External Terminal" },
    W = { "<cmd>wa<CR>", "Save all" },
    a = { "<cmd>Alpha<cr>", "Alpha" },
    b = { "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", "Buffers" },
    c = { "<cmd>Bdelete!<CR>", "Close Buffer" },
    e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
    f = { "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", "Find files" },
    g = {
      R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
      b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
      d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
      g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
      j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
      k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
      l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
      name = "Git",
      o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
      p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
      r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
      s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
      u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" }
    },
    h = { "<cmd>split<cr>", "Horizontal Split" },
    l = {
      I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
      S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
      a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
      d = { <function 1>, "Document Symbols" },
      e = { <function 2>, "Show diagnostics items." },
      f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
      i = { "<cmd>LspInfo<cr>", "Info" },
      j = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic" },
      k = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
      l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
      name = "LSP",
      q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
      r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
      s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
      t = { <function 3>, "Type Definitions" },
      w = { <function 4>, "Workspace Symbols" }
    },
    mode = "n",
    n = { "<cmd>:TodoTelescope<cr>", "Notes/Tags" },
    noremap = true,
    nowait = true,
    p = {
      S = { "<cmd>PackerStatus<cr>", "Status" },
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      name = "Packer",
      s = { "<cmd>PackerSync<cr>", "Sync" },
      u = { "<cmd>PackerUpdate<cr>", "Update" }
    },
    prefix = "<leader>",
    q = { "<cmd>q!<CR>", "Quit" },
    s = {
      C = { "<cmd>Telescope commands<cr>", "Commands" },
      M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
      R = { "<cmd>Telescope registers<cr>", "Registers" },
      b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
      h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
      k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
      name = "Search",
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" }
    },
    silent = true,
    t = {
      f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
      h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
      n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
      name = "Terminal",
      p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
      t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
      u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
      v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" }
    },
    v = { "<cmd>vsplit<cr>", "Vertical Split" },
    w = { "<cmd>w!<CR>", "Save" },
    z = {
      d = { "<cmd>lua require('user.themes.tokyonight_day')()<CR>", "TokyoNight Day" },
      n = { "<cmd>lua require('user.themes.tokyonight_night')()<cr>", "TokyoNight Night" },
      name = "Change Theme",
      s = { "<cmd>lua require('user.themes.tokyonight_storm')()<cr>", "TokyoNight Storm" }
    }
  }

  -- Suggested Spec:
  {
    { "<leader>F", "<cmd>Telescope live_grep theme=ivy<cr>", desc = "Find Text", nowait = true, remap = false },
    { "<leader>N", "<cmd>!bash -c 'nohup $($TERM nvim . &>/dev/null) & disown'<CR><CR>", desc = "New window", nowait = true, remap = false },
    { "<leader>P", "<cmd>lua require('telescope').extensions.projects.projects()<cr>", desc = "Projects", nowait = true, remap = false },
    { "<leader>Q", "<cmd>wa<CR><cmd>qa<CR>", desc = "Quit and save all", nowait = true, remap = false },
    { "<leader>T", "<cmd>!bash -c 'nohup $($TERM &>/dev/null) & disown'<CR><CR>", desc = "External Terminal", nowait = true, remap = false },
    { "<leader>W", "<cmd>wa<CR>", desc = "Save all", nowait = true, remap = false },
    { "<leader>a", "<cmd>Alpha<cr>", desc = "Alpha", nowait = true, remap = false },
    { "<leader>b", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc = "Buffers", nowait = true, remap = false },
    { "<leader>c", "<cmd>Bdelete!<CR>", desc = "Close Buffer", nowait = true, remap = false },
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer", nowait = true, remap = false },
    { "<leader>f", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc = "Find files", nowait = true, remap = false },
    { "<leader>g", group = "Git", nowait = true, remap = false },
    { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer", nowait = true, remap = false },
    { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch", nowait = true, remap = false },
    { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit", nowait = true, remap = false },
    { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff", nowait = true, remap = false },
    { "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", desc = "Lazygit", nowait = true, remap = false },
    { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk", nowait = true, remap = false },
    { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk", nowait = true, remap = false },
    { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame", nowait = true, remap = false },
    { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file", nowait = true, remap = false },
    { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk", nowait = true, remap = false },
    { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk", nowait = true, remap = false },
    { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk", nowait = true, remap = false },
    { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk", nowait = true, remap = false },
    { "<leader>h", "<cmd>split<cr>", desc = "Horizontal Split", nowait = true, remap = false },
    { "<leader>l", group = "LSP", nowait = true, remap = false },
    { "<leader>lI", "<cmd>LspInstallInfo<cr>", desc = "Installer Info", nowait = true, remap = false },
    { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols", nowait = true, remap = false },
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", nowait = true, remap = false },
    { "<leader>ld", <function 1>, desc = "Document Symbols", nowait = true, remap = false },
    { "<leader>le", <function 1>, desc = "Show diagnostics items.", nowait = true, remap = false },
    { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Format", nowait = true, remap = false },
    { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info", nowait = true, remap = false },
    { "<leader>lj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", desc = "Next Diagnostic", nowait = true, remap = false },
    { "<leader>lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic", nowait = true, remap = false },
    { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action", nowait = true, remap = false },
    { "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", desc = "Quickfix", nowait = true, remap = false },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename", nowait = true, remap = false },
    { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols", nowait = true, remap = false },
    { "<leader>lt", <function 1>, desc = "Type Definitions", nowait = true, remap = false },
    { "<leader>lw", <function 1>, desc = "Workspace Symbols", nowait = true, remap = false },
    { "<leader>n", "<cmd>:TodoTelescope<cr>", desc = "Notes/Tags", nowait = true, remap = false },
    { "<leader>p", group = "Packer", nowait = true, remap = false },
    { "<leader>pS", "<cmd>PackerStatus<cr>", desc = "Status", nowait = true, remap = false },
    { "<leader>pc", "<cmd>PackerCompile<cr>", desc = "Compile", nowait = true, remap = false },
    { "<leader>pi", "<cmd>PackerInstall<cr>", desc = "Install", nowait = true, remap = false },
    { "<leader>ps", "<cmd>PackerSync<cr>", desc = "Sync", nowait = true, remap = false },
    { "<leader>pu", "<cmd>PackerUpdate<cr>", desc = "Update", nowait = true, remap = false },
    { "<leader>q", "<cmd>q!<CR>", desc = "Quit", nowait = true, remap = false },
    { "<leader>s", group = "Search", nowait = true, remap = false },
    { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands", nowait = true, remap = false },
    { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages", nowait = true, remap = false },
    { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers", nowait = true, remap = false },
    { "<leader>sb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch", nowait = true, remap = false },
    { "<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme", nowait = true, remap = false },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help", nowait = true, remap = false },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps", nowait = true, remap = false },
    { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File", nowait = true, remap = false },
    { "<leader>t", group = "Terminal", nowait = true, remap = false },
    { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float", nowait = true, remap = false },
    { "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal", nowait = true, remap = false },
    { "<leader>tn", "<cmd>lua _NODE_TOGGLE()<cr>", desc = "Node", nowait = true, remap = false },
    { "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>", desc = "Python", nowait = true, remap = false },
    { "<leader>tt", "<cmd>lua _HTOP_TOGGLE()<cr>", desc = "Htop", nowait = true, remap = false },
    { "<leader>tu", "<cmd>lua _NCDU_TOGGLE()<cr>", desc = "NCDU", nowait = true, remap = false },
    { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Vertical", nowait = true, remap = false },
    { "<leader>v", "<cmd>vsplit<cr>", desc = "Vertical Split", nowait = true, remap = false },
    { "<leader>w", "<cmd>w!<CR>", desc = "Save", nowait = true, remap = false },
    { "<leader>z", group = "Change Theme", nowait = true, remap = false },
    { "<leader>zd", "<cmd>lua require('user.themes.tokyonight_day')()<CR>", desc = "TokyoNight Day", nowait = true, remap = false },
    { "<leader>zn", "<cmd>lua require('user.themes.tokyonight_night')()<cr>", desc = "TokyoNight Night", nowait = true, remap = false },
    { "<leader>zs", "<cmd>lua require('user.themes.tokyonight_storm')()<cr>", desc = "TokyoNight Storm", nowait = true, remap = false },
  }

checking for overlapping keymaps ~
- ⚠️ WARNING In mode `n`, <\l> overlaps with <\lt>, <\lr>, <\lw>, <\la>, <\le>, <\ld>, <\lf>, <\lS>, <\lI>, <\lk>, <\lq>, <\lj>, <\ls>, <\ll>, <\li>:
  - <\l>: LSP
  - <\lt>: Type Definitions
  - <\lr>: Rename
  - <\lw>: Workspace Symbols
  - <\la>: Code Action
  - <\le>: Show diagnostics items.
  - <\ld>: Document Symbols
  - <\lf>: Format
  - <\lS>: Workspace Symbols
  - <\lI>: Installer Info
  - <\lk>: Prev Diagnostic
  - <\lq>: Quickfix
  - <\lj>: Next Diagnostic
  - <\ls>: Document Symbols
  - <\ll>: CodeLens Action
  - <\li>: Info
- ⚠️ WARNING In mode `n`, <\t> overlaps with <\tu>, <\tn>, <\tt>, <\tv>, <\tp>, <\tf>, <\th>:
  - <\t>: Terminal
  - <\tu>: NCDU
  - <\tn>: Node
  - <\tt>: Htop
  - <\tv>: Vertical
  - <\tp>: Python
  - <\tf>: Float
  - <\th>: Horizontal
- ⚠️ WARNING In mode `n`, <gc> overlaps with <gcc>:
  - <gcc>: Toggle comment line
- ✅ OK Overlapping keymaps are only reported for informational purposes.
  This doesn't necessarily mean there is a problem with your config.

Checking for duplicate mappings ~
- ✅ OK No duplicate mappings found

