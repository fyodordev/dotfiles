require('neoscroll').setup({
    -- All these keys will be mapped to their corresponding default scrolling animation
    mappings = {}, -- Disable default mappings, we'll set custom ones below
    hide_cursor = true,          -- Hide cursor while scrolling
    stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
    respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = "sine",    -- Default easing function: quadratic, cubic, quartic, quintic, circular, sine
    pre_hook = nil,              -- Function to run before the scrolling animation starts
    post_hook = nil,             -- Function to run after the scrolling animation ends
    performance_mode = false,    -- Disable "Performance Mode" on all buffers.
})

-- Custom keymaps with faster scroll speeds
local neoscroll = require('neoscroll')
local keymap = {
    ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 160 }) end,
    ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 160 }) end,
    ["<C-b>"] = function() neoscroll.ctrl_b({ duration = 220 }) end,
    ["<C-f>"] = function() neoscroll.ctrl_f({ duration = 220 }) end,
    ["<C-y>"] = function() neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 }) end,
    ["<C-e>"] = function() neoscroll.scroll(0.1, { move_cursor = false, duration = 100 }) end,
    ["zt"]    = function() neoscroll.zt({ half_win_duration = 100 }) end,
    ["zz"]    = function() neoscroll.zz({ half_win_duration = 100 }) end,
    ["zb"]    = function() neoscroll.zb({ half_win_duration = 100 }) end,
}

local modes = { 'n', 'v', 'x' }
for key, func in pairs(keymap) do
    vim.keymap.set(modes, key, func)
end

