local M = {}

function M.setup(_)
  -- The argument to setup is the path to the python installation which_key
  -- contains the debugpy module.
  -- TODO: Possibly need to change this.
  -- TODO: Possibly replace with vim-ultest.
  require("dap-python").setup("python", {})
end

return M
