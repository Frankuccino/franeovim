local function gh(repo) return 'https://github.com/' .. repo end

-- Fix: Changed 'sphalerite' to the correct user 'sphamba'
vim.pack.add {
  'https://github.com/sphamba/smear-cursor.nvim',
}
vim.cmd 'packadd smear-cursor.nvim'
-- Safe setup block
local ok_smear, smear = pcall(require, 'smear_cursor')
if ok_smear then
  smear.setup {
    cursor_color = 'none',
    damping = 0.65,

    stiffness = 0.7,
    trailing_stiffness = 0.4,
    trailing_exponent = 4,

    smear_between_buffers = true,
    smear_between_neighbor_lines = true,

    hide_target_hack = true,
    particles_enabled = false,
    max_slope_horizontal = 50,
  }
end
require('smear_cursor').enabled = true
