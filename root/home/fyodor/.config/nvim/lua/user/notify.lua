local notify = require("notify")

-- Configure nvim-notify
notify.setup({
  -- Animation style (fade_in_slide_out, fade, slide, static)
  stages = "fade_in_slide_out",

  -- Default timeout for notifications (in ms)
  timeout = 3000,

  -- Background opacity
  background_colour = "#000000",

  -- Icons for notification levels
  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "✎",
  },

  -- Render style (default, minimal, simple, compact)
  render = "minimal",

  -- Minimum width for notification windows
  minimum_width = 30,

  -- Maximum width for notification windows
  max_width = 50,

  -- Maximum height for notification windows
  max_height = 5,

  -- Bottom-up ordering (newer notifications at bottom)
  top_down = false,

  -- Function to determine notification level
  level = vim.log.levels.INFO,

  -- FPS for animations
  fps = 30,
})

-- Set nvim-notify as the default notification handler
vim.notify = notify
