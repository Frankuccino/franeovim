-- Which-Key
vim.pack.add {
  'https://github.com/folke/which-key.nvim',
}

local ok, which_key = pcall(require, 'which-key')

if ok then
  which_key.setup {
    preset = 'helix',

    delay = 200,

    win = {
      border = 'rounded',

      padding = { 1, 2 },

      wo = {
        winblend = 10,
      },
    },

    layout = {
      width = {
        min = 20,
        max = 40,
      },

      spacing = 4,
    },

    icons = {
      breadcrumb = '»',
      separator = '➜',
      group = '+',
    },
  }
  -- Gruvbox-inspired Which-Key colors
  vim.api.nvim_set_hl(0, 'WhichKey', {
    fg = '#fabd2f', -- bright yellow
    bold = true,
  })

  vim.api.nvim_set_hl(0, 'WhichKeyGroup', {
    fg = '#fe8019', -- orange
  })

  vim.api.nvim_set_hl(0, 'WhichKeyDesc', {
    fg = '#ebdbb2', -- light foreground
  })

  vim.api.nvim_set_hl(0, 'WhichKeySeparator', {
    fg = '#928374', -- gray
  })

  vim.api.nvim_set_hl(0, 'WhichKeyBorder', {
    fg = '#d79921', -- darker gold
  })

  vim.api.nvim_set_hl(0, 'WhichKeyNormal', {
    bg = '#1d2021', -- deep gruvbox dark
  })

  vim.api.nvim_set_hl(0, 'NormalFloat', {
    bg = '#1d2021',
  })

  vim.api.nvim_set_hl(0, 'FloatBorder', {
    fg = '#d79921',
    bg = '#1d2021',
  })
end
