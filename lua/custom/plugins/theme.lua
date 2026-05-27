-- ~/.config/nvim/lua/custom/plugins/theme.lua

-- 1. Download the Gruvbox Material repository natively
vim.pack.add {
  'https://github.com/sainnhe/gruvbox-material',
}

-- 2. Configure the earthy brown tones before loading the theme
-- Options for contrast: 'hard' (dark chocolate), 'medium' (cozy brown), 'soft' (warm sand)
vim.g.gruvbox_material_background = 'hard'

-- Enables palette adjustments for better text readability
vim.g.gruvbox_material_better_performance = 1

-- 3. Set the colorscheme live
vim.cmd 'colorscheme gruvbox-material'
vim.opt.cursorline = true
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = 'none', bg = 'none' })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#593e53' })
vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = '#593e53', fg = '#fbf1c7' })
vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', { fg = '#eb5ba3', bg = '#2d252b' })
