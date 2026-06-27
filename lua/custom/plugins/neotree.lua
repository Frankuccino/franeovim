-- File Explorer (Completely explicit list)
vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/nvim-neo-tree/neo-tree.nvim',
  'https://github.com/antosha417/nvim-lsp-file-operations',
}
require('lsp-file-operations').setup {
  timeout_ms = 1000,
}
-- Suppress deprecated lsp-file-operations warning
vim.lsp.get_active_clients = vim.lsp.get_clients

-- Safe wrapper to prevent crashing during the background git clone
local ok, neotree = pcall(require, 'neo-tree')
if ok then
  neotree.setup {
    sync_root_with_cwd = true,
    respect_buf_cwd = true,

    window = {
      position = 'float',
      popup = {
        border = 'rounded',

        position = {
          col = 0,
          row = '100%',
        },
        size = {
          width = math.floor(vim.o.columns * 0.35),
          height = math.min(30, vim.o.lines - 6),
        },
      },
    },

    filesystem = {
      bind_to_cwd = true,
      follow_current_file = {
        enabled = true,
      },
      use_libuv_file_watcher = true,
    },
  }

  vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<cr>', { desc = 'Toggle Neo-tree' })
end
