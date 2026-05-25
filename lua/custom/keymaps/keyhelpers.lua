-- Find and replace keymaps

-- Find and replace in current file
vim.keymap.set('n', '<leader>fr', ':%s///g<Left><Left><Left>', { desc = 'Find & Replace' })

-- Find and replace with confirmation
vim.keymap.set('n', '<leader>frc', ':%s//gc<Left><Left><Left><Left>', { desc = 'Find & Replace (confirm)' })

-- Find and replace word under cursor (MOST USEFUL!)
vim.keymap.set('n', '<leader>fw', ':%s/\\<<C-r><C-w>\\>//gI<Left><Left><Left>', { desc = 'Replace word under cursor' })

-- Find and replace in visual selection
vim.keymap.set('v', '<leader>fr', ':s//g<Left><Left>', { desc = 'Find & Replace in selection' })

-- RENAME SECTION

-- To Rename Variables
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'LSP Rename' })

-- Change cwd to current file's directory
vim.keymap.set('n', '<leader>cd', '<cmd>cd %:p:h<CR>', {
  desc = 'CD to Current File Directory',
})

-- Optional: window-local cwd instead of global
vim.keymap.set('n', '<leader>cD', '<cmd>lcd %:p:h<CR>', {
  desc = 'LCD to Current File Directory',
})
