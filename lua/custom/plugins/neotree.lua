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
  require('neo-tree').setup {
    sync_root_with_cwd = true,
    respect_buf_cwd = true,

    window = {
      position = 'float',
      popup = {
        border = 'rounded',
        win_options = { winblend = 10 },
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
    highlights = {
      NeoTreeWinSeparator = { fg = 'none', bg = 'none' },
    },

    filesystem = {
      bind_to_cwd = true,
      follow_current_file = {
        enabled = true,
      },
    },
  }

  -- Neo-tree Gruvbox Floating Theme

  vim.api.nvim_set_hl(0, 'NeoTreeNormal', {
    bg = '#1d2021',
  })

  vim.api.nvim_set_hl(0, 'NeoTreeNormalNC', {
    bg = '#1d2021',
  })

  vim.api.nvim_set_hl(0, 'NeoTreeFloatBorder', {
    fg = '#d79921',
    bg = '#1d2021',
  })

  vim.api.nvim_set_hl(0, 'NeoTreeTitleBar', {
    fg = '#1d2021',
    bg = '#fabd2f',
    bold = true,
  })

  vim.api.nvim_set_hl(0, 'NeoTreeDirectoryName', {
    fg = '#83a598',
    bold = true,
  })

  vim.api.nvim_set_hl(0, 'NeoTreeDirectoryIcon', {
    fg = '#8ec07c',
  })

  vim.api.nvim_set_hl(0, 'NeoTreeFileName', {
    fg = '#ebdbb2',
  })

  vim.api.nvim_set_hl(0, 'NeoTreeIndentMarker', {
    fg = '#504945',
  })

  vim.api.nvim_set_hl(0, 'NeoTreeGitModified', {
    fg = '#fabd2f',
  })

  vim.api.nvim_set_hl(0, 'NeoTreeGitAdded', {
    fg = '#b8bb26',
  })

  vim.api.nvim_set_hl(0, 'NeoTreeGitDeleted', {
    fg = '#fb4934',
  })

  vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<cr>', { desc = 'Toggle Neo-tree' })
end
