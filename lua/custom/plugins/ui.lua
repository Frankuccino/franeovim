local function gh(repo) return 'https://github.com/' .. repo end

-- Trouble
vim.pack.add {
  gh 'nvim-tree/nvim-web-devicons', -- Load dependency first
  gh 'folke/trouble.nvim',
}

require('trouble').setup()

vim.keymap.set('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', { desc = 'Diagnostics (Trouble)' })
vim.keymap.set('n', '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', { desc = 'Buffer Diagnostics' })
vim.keymap.set('n', '<leader>xi', '<cmd>Trouble lsp_incoming_calls toggle<cr>', { desc = 'Incoming Calls' })
vim.keymap.set('n', '<leader>xo', '<cmd>Trouble lsp_outgoing_calls toggle<cr>', { desc = 'Outgoing Calls' })

-- Autopairs
vim.pack.add { gh 'windwp/nvim-autopairs' }

require('nvim-autopairs').setup()
