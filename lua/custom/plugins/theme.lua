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

vim.g.gruvbox_material_transparent_background = 1

-- 3. Set the colorscheme live
vim.cmd 'colorscheme gruvbox-material'
vim.opt.cursorline = true
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = '#504945', bg = 'none' })
vim.api.nvim_set_hl(0, 'NeoTreeFloatBorder', { fg = '#d79921', bg = '#1d2021' })

vim.api.nvim_set_hl(0, 'BufferLineSeparator', { fg = '#1d2021', bg = 'none' })
vim.api.nvim_set_hl(0, 'BufferLineSeparatorVisible', { fg = '#1d2021', bg = 'none' })
vim.api.nvim_set_hl(0, 'BufferLineSeparatorSelected', { fg = '#1d2021', bg = 'none' })

vim.api.nvim_set_hl(0, 'cursorline', { bg = '#402c3b' })
vim.api.nvim_set_hl(0, 'telescopeselection', { bg = '#402c3b', fg = '#fbf1c7' })
vim.api.nvim_set_hl(0, 'telescopeselectioncaret', { fg = '#eb5ba3', bg = '#2d252b' })
