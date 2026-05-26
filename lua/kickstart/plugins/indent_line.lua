-- Add indentation guides even on blank lines

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help ibl`
vim.pack.add { 'https://github.com/lukas-reineke/indent-blankline.nvim' }
local hooks = require 'ibl.hooks'

-- Only color for scope (when cursor is in block)
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, 'IblScope', { fg = '#665c54' }) -- Subtle gruvbox gray
end)

require('ibl').setup {
  enabled = true,

  -- Disable all regular indent guides
  indent = {
    char = ' ', -- Space = invisible
  },

  -- Only show scope (current block with cursor)
  scope = {
    enabled = true,
    char = '│',
    show_start = false,
    show_end = false,
    highlight = 'IblScope',
  },

  exclude = {
    filetypes = {
      'help',
      'neo-tree',
      'TelescopePrompt',
      'TelescopeResults',
      'dashboard',
      '',
    },
    buftypes = {
      'terminal',
      'nofile',
    },
  },
}
