local function gh(repo) return 'https://github.com/' .. repo end

-- LazyGi
vim.pack.add {
  gh 'nvim-lua/plenary.nvim', -- Load the shared dependency first
  gh 'kdheepak/lazygit.nvim',
}

vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<cr>', { desc = 'LazyGit' })

-- Diffview
vim.pack.add {
  -- plenary is already loaded above, but listing it here is fine too!
  gh 'nvim-lua/plenary.nvim',
  gh 'sindrets/diffview.nvim',
}

vim.keymap.set('n', '<leader>gh', '<cmd>DiffviewFileHistory %<cr>', { desc = 'File history' })

vim.keymap.set('n', '<leader>gd', function()
  if next(require('diffview.lib').views) == nil then
    vim.cmd 'DiffviewOpen'
  else
    vim.cmd 'DiffviewClose'
  end
end, { desc = 'Toggle Diff view' })
