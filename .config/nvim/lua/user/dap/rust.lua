local M = {}


local codelldb_path_base = "/home/fyodor/.vscode-oss/extensions/vadimcn.vscode-lldb-1.7.0/"
local codelldb_path = codelldb_path_base .. "adapter/codelldb"
local liblldb_path = codelldb_path_base .. "lldb/lib/liblldb.so"

local function codelldb_adapter(callback_on_adapter)
  -- Implementation source:
  -- https://github.com/mfussenegger/nvim-dap/wiki/C-C---Rust-(via--codelldb)
  -- This asks the system for a free port
  local tcp = vim.loop.new_tcp()
  tcp:bind('127.0.0.1', 0)
  local port = tcp:getsockname().port
  tcp:shutdown()
  tcp:close()

  -- Start codelldb with the port
  local stdout = vim.loop.new_pipe(false)
  local stderr = vim.loop.new_pipe(false)
  -- commented out lines as implemented in rust-tools
  local opts = {
    stdio = {nil, stdout, stderr},
    args = {
      -- "--liblldb", liblldb_path,
      "--port", tostring(port)
    },
    -- detached = true,
  }
  local handle
  local pid_or_err
  handle, pid_or_err = vim.loop.spawn(codelldb_path, opts, function(code)
    stdout:close()
    stderr:close()
    handle:close()
    if code ~= 0 then
      print("codelldb exited with code", code)
    end
  end)

  -- Show error message if failed to start codelldb.
  if not handle then
    vim.notify("Error running codelldb: " .. tostring(pid_or_err), vim.log.levels.ERROR)
    stdout:close()
    stderr:close()
    return
  end

  vim.notify('codelldb started. pid=' .. pid_or_err)

  stderr:read_start(function(err, chunk)
    assert(not err, err)
    if chunk then
      vim.schedule(function()
        require("dap.repl").append(chunk)
      end)
    end
  end)


  -- Wait for codelldb to get ready and start listening before telling nvim-dap to connect
  -- If you get connect errors, try to increase 500 to a higher value, or check the stderr (Open the REPL)
  vim.defer_fn(
    function()
      callback_on_adapter({
        type = 'server',
        host = '127.0.0.1',
        port = port
      })
    end,
    500
  )

  -- rust-tools implementation:
  -- local init = false
  -- stdout:read_start(function(err, chunk)
  --   assert(not err, err)
  --   if chunk then
  --     if not init then
  --       init = true
  --       vim.schedule(function()
  --         callback_on_adapter({
  --           type = 'server',
  --           host = '127.0.0.1',
  --           port = port
  --         })
  --       end)
  --     else
  --       vim.schedule(function()
  --         require("dap.repl").append(chunk)
  --       end)
  --     end
  --   end
  -- end)
end


-- Arguments:
--  server: server object as provided to callback in lsp_installer.on_server_ready
--  opts: lsp server options provided by user.
function M.setup(server, opts)
    -- if server.name == "rust_analyzer" then
		 require("rust-tools").setup({
		 	dap = {
		 		adapter = codelldb_adapter,
		 	},
		 	--server = { cmd = server._default_options.cmd },
      server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
		 })
     -- Attach to buffers that are open when rust-tools is initialized.
     server:attach_buffers()
end

return M
