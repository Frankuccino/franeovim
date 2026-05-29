-- Find and replace keymaps

-- Find and replace in current file
vim.keymap.set('n', '<leader>fr', ':%s///g<Left><Left><Left>', { desc = 'Find & Replace' })

-- Find and replace with confirmation
vim.keymap.set('n', '<leader>frc', ':%s//gc<Left><Left><Left><Left>', { desc = 'Find & Replace (confirm)' })

-- Find and replace word under cursor (MOST USEFUL!)
vim.keymap.set('n', '<leader>fw', ':%s/\\<<C-r><C-w>\\>//gI<Left><Left><Left>', { desc = 'Replace word under cursor' })

-- Find and replace in visual selection
vim.keymap.set('v', '<leader>fr', ':s//g<Left><Left>', { desc = 'Find & Replace in selection' })

-- Change cwd to current file's directory
vim.keymap.set('n', '<leader>cd', '<cmd>cd %:p:h<CR>', {
  desc = 'CD to Current File Directory',
})

-- Optional: window-local cwd instead of global
vim.keymap.set('n', '<leader>cD', '<cmd>lcd %:p:h<CR>', {
  desc = 'LCD to Current File Directory',
})

-- TAB SECTION
-- Tab/Shift-Tab for indentation in INSERT and VISUAL mode only
vim.keymap.set('i', '<Tab>', '<C-t>', { desc = 'Indent in insert mode' })
vim.keymap.set('i', '<S-Tab>', '<C-d>', { desc = 'Unindent in insert mode' })

-- Visual mode indentation (and stay in visual mode)
vim.keymap.set('v', '<Tab>', '>gv', { desc = 'Indent in visual mode' })
vim.keymap.set('v', '<S-Tab>', '<gv', { desc = 'Unindent in visual mode' })

-- Normal mode Tab stays as buffer navigation
-- (your existing <Tab> for BufferLineCycleNext still works)
--

-- Diagnostic navigation
vim.keymap.set('n', ']d', function() vim.diagnostic.jump { count = 1 } end, { desc = 'Next diagnostic' })
vim.keymap.set('n', '[d', function() vim.diagnostic.jump { count = -1 } end, { desc = 'Prev diagnostic' })

-- Quickfix navigation
vim.keymap.set('n', ']q', '<cmd>cnext<CR>', { desc = 'Next quickfix' })
vim.keymap.set('n', '[q', '<cmd>cprev<CR>', { desc = 'Prev quickfix' })

-- Save
vim.keymap.set({ 'n', 'i' }, '<C-s>', '<cmd>w<CR>', { desc = 'Save file' })

-- Copy file path
vim.keymap.set('n', '<leader>cp', '<cmd>let @+ = expand("%")<CR>', { desc = 'Copy relative path' })
vim.keymap.set('n', '<leader>cP', '<cmd>let @+ = expand("%:p")<CR>', { desc = 'Copy absolute path' })

-- Toggle between source and test file
vim.keymap.set('n', '<leader>ta', function()
  local file = vim.fn.expand '%'
  if file:match '%.test%.' or file:match '%.spec%.' then
    vim.cmd('e ' .. file:gsub('%.test%.', '.'):gsub('%.spec%.', '.'))
  else
    local ext = file:match '%.(%a+)$'
    vim.cmd('e ' .. file:gsub('%.' .. ext .. '$', '.test.' .. ext))
  end
end, { desc = 'Toggle test file' })
