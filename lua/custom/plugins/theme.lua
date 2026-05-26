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
