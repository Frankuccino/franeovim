local function gh(repo) return 'https://github.com/' .. repo end
vim.pack.add {
  gh 'akinsho/bufferline.nvim',
  gh 'nvim-tree/nvim-web-devicons',
}
local ok_bufferline, bufferline = pcall(require, 'bufferline')
if ok_bufferline then
  bufferline.setup {
    options = {
      mode = 'buffers',

      -- Style
      separator_style = 'slant', -- 'slant' | 'slope' | 'thick' | 'thin'
      indicator = {
        style = 'underline', -- 'icon' | 'underline' | 'none'
      },

      -- Diagnostics integration
      diagnostics = 'nvim_lsp',
      diagnostics_indicator = function(count, level)
        local icon = level:match 'error' and ' ' or ' '
        return ' ' .. icon .. count
      end,

      -- Close icons
      show_buffer_close_icons = true,
      show_close_icon = false, -- Hide the global close icon (cleaner)

      -- Mouse support
      close_command = 'bdelete! %d',
      right_mouse_command = 'bdelete! %d',
      left_mouse_command = 'buffer %d',
      middle_mouse_command = nil,

      -- Better visibility
      show_tab_indicators = true,
      show_duplicate_prefix = true,

      -- Offsets for file explorers (adjust if you use nvim-tree or neo-tree)
      offsets = {
        {
          filetype = 'NvimTree',
          text = 'File Explorer',
          text_align = 'center',
          separator = true,
        },
        {
          filetype = 'neo-tree',
          text = 'File Explorer',
          text_align = 'center',
          separator = true,
        },
      },

      -- Numbers for quick navigation
      numbers = function(opts) return string.format('%s', opts.raise(opts.ordinal)) end,

      -- Only show buffers from current tab
      -- mode = 'tabs', -- Uncomment to show tabs instead of buffers

      -- Sorting
      sort_by = 'insert_after_current',

      -- Custom filter (hide certain buffers)
      custom_filter = function(buf_number)
        -- Don't show terminal buffers in the list
        if vim.bo[buf_number].buftype == 'terminal' then return false end
        return true
      end,
    },

    highlights = {
      fill = {
        bg = '#1e1e2e', -- Adjust to match your colorscheme
      },
    },
  }

  local map = vim.keymap.set

  -- Cycle buffers (more intuitive keybindings)
  map('n', '<S-l>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next Buffer' })
  map('n', '<S-h>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Previous Buffer' })

  -- Alternative: Tab for cycling
  map('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next Buffer' })
  map('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Previous Buffer' })

  -- Move buffers
  map('n', '<leader>b>', '<cmd>BufferLineMoveNext<CR>', { desc = 'Move Buffer Right' })
  map('n', '<leader>b<', '<cmd>BufferLineMovePrev<CR>', { desc = 'Move Buffer Left' })

  -- Close buffers
  map('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = 'Delete Buffer' })
  map('n', '<leader>bD', '<cmd>bdelete!<CR>', { desc = 'Force Delete Buffer' })
  map('n', '<leader>bc', '<cmd>BufferLinePickClose<CR>', { desc = 'Pick & Close Buffer' })

  -- Close other buffers
  map('n', '<leader>bo', '<cmd>BufferLineCloseOthers<CR>', { desc = 'Close Other Buffers' })
  map('n', '<leader>br', '<cmd>BufferLineCloseRight<CR>', { desc = 'Close Buffers to Right' })
  map('n', '<leader>bl', '<cmd>BufferLineCloseLeft<CR>', { desc = 'Close Buffers to Left' })

  -- Pick/Jump to buffer
  map('n', '<leader>bp', '<cmd>BufferLinePick<CR>', { desc = 'Pick Buffer' })

  -- Jump to buffer by number
  map('n', '<leader>1', '<cmd>BufferLineGoToBuffer 1<CR>', { desc = 'Buffer 1' })
  map('n', '<leader>2', '<cmd>BufferLineGoToBuffer 2<CR>', { desc = 'Buffer 2' })
  map('n', '<leader>3', '<cmd>BufferLineGoToBuffer 3<CR>', { desc = 'Buffer 3' })
  map('n', '<leader>4', '<cmd>BufferLineGoToBuffer 4<CR>', { desc = 'Buffer 4' })
  map('n', '<leader>5', '<cmd>BufferLineGoToBuffer 5<CR>', { desc = 'Buffer 5' })
  map('n', '<leader>6', '<cmd>BufferLineGoToBuffer 6<CR>', { desc = 'Buffer 6' })
  map('n', '<leader>7', '<cmd>BufferLineGoToBuffer 7<CR>', { desc = 'Buffer 7' })
  map('n', '<leader>8', '<cmd>BufferLineGoToBuffer 8<CR>', { desc = 'Buffer 8' })
  map('n', '<leader>9', '<cmd>BufferLineGoToBuffer 9<CR>', { desc = 'Buffer 9' })

  -- Pin buffer (keeps it at the front)
  map('n', '<leader>bP', '<cmd>BufferLineTogglePin<CR>', { desc = 'Toggle Pin' })

  -- Sort buffers
  map('n', '<leader>bs', '<cmd>BufferLineSortByDirectory<CR>', { desc = 'Sort by Directory' })
  map('n', '<leader>be', '<cmd>BufferLineSortByExtension<CR>', { desc = 'Sort by Extension' })
else
  print 'Bufferline is downloading...'
end
