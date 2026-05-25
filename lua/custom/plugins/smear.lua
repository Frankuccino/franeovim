-- local function gh(repo) return 'https://github.com/' .. repo end

-- Fix: Changed 'sphalerite' to the correct user 'sphamba'
vim.pack.add {
  'https://github.com/sphamba/smear-cursor.nvim',
}
vim.cmd 'packadd smear-cursor.nvim'
-- Safe setup block
local ok_smear, smear = pcall(require, 'smear_cursor')
if ok_smear then
  smear.setup {
    -- Bouncy & Flashy (Color Preserved)
    stiffness = 0.5,
    trailing_stiffness = 0.4,
    stiffness_insert_mode = 0.5,
    trailing_stiffness_insert_mode = 0.5,

    -- High-Bounciness (Increased Overshoot)
    damping = 0.35,
    damping_insert_mode = 0.35,

    -- High-Reactivity Polling
    time_interval = 4,
    distance_stop_animating = 0.1,

    -- Original color with sharper decay for "flash" effect
    cursor_color = '#ffd3ea',
    trailing_exponent = 2, -- Lowered to keep the trail more visible/intense
  }
end
require('smear_cursor').enabled = true
