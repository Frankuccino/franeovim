-- local function gh(repo) return 'https://github.com/' .. repo end
-- File Explorer (Completely explicit list)
vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/nvim-neo-tree/neo-tree.nvim',
}

-- Safe wrapper to prevent crashing during the background git clone
local ok, neotree = pcall(require, 'neo-tree')
if ok then
  neotree.setup {
    close_if_last_window = true,
    window = {
      width = 30,
    },
  }

  vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<cr>', { desc = 'Toggle Neo-tree' })
end
