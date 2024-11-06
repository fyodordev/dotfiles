require('neoscroll').setup({
    -- All these keys will be mapped to their corresponding default scrolling animation
    mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
                '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
    hide_cursor = true,          -- Hide cursor while scrolling
    stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
    respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = "sine",       -- Default easing function: quadratic, cubic, quartic, quintic, circular, sine
    pre_hook = nil,              -- Function to run before the scrolling animation starts
    post_hook = nil,             -- Function to run after the scrolling animation ends
    performance_mode = false,    -- Disable "Performance Mode" on all buffers.
})

local neoscroll = require('neoscroll')

--neoscroll.ctrl_y({'scroll', {'-vim.wo.scroll', 'true', '100'}})
--neoscroll.ctrl_e({'scroll', {'-vim.wo.scroll', 'true', '100'}})
neoscroll.ctrl_u({'scroll', {'-vim.wo.scroll', 'true', '160'}})
neoscroll.ctrl_d({'scroll', {'-vim.wo.scroll', 'true', '160'}})
neoscroll.ctrl_b({'scroll', {'-vim.wo.scroll', 'true', '220'}})
neoscroll.ctrl_f({'scroll', {'-vim.wo.scroll', 'true', '220'}})
--neoscroll.zt({'zt', {'-vim.wo.scroll', 'true', '100'}})
--neoscroll.zz({'zz', {'-vim.wo.scroll', 'true', '100'}})
--neoscroll.zb({'zb', {'-vim.wo.scroll', 'true', '100'}})

