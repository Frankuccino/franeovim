local function gh(repo) return 'https://github.com/' .. repo end
vim.pack.add { gh 'akinsho/toggleterm.nvim' }
local ok, toggleterm = pcall(require, 'toggleterm')
if ok then
  toggleterm.setup {
    -- Multiple terminal instances with different keybindings
    open_mapping = [[<C-\>]], -- Ctrl+\ is easier to reach than Ctrl+t

    -- Terminal behavior
    size = function(term)
      if term.direction == 'horizontal' then
        return 15
      elseif term.direction == 'vertical' then
        -- Only force the 40% boundary rule on your main primary panel (Terminal 1)
        if term.id == 1 then
          return math.floor(vim.o.columns * 0.4)
        else
          -- For Terminal 2, 3, etc., let them automatically divide up
          -- the space already allocated inside that 40% vertical sidebar container
          return nil
        end
      end
    end,

    -- Start in insert mode
    start_in_insert = true,
    insert_mappings = true, -- Apply open_mapping in insert mode
    terminal_mappings = true, -- Apply open_mapping in terminal mode

    -- Persist terminal size
    persist_size = true,
    persist_mode = true, -- Remember insert/normal mode

    -- Direction options
    direction = 'float', -- 'vertical' | 'horizontal' | 'tab' | 'float'

    -- Cleaner floating window
    float_opts = {
      border = 'curved', -- 'single' | 'double' | 'shadow' | 'curved'
      width = math.floor(vim.o.columns * 0.9),
      height = math.floor(vim.o.lines * 0.85),
      winblend = 0,
    },

    -- Auto-scroll to bottom on output
    auto_scroll = true,

    -- Close terminal when process exits
    close_on_exit = true,

    -- Shell configuration
    shell = vim.o.shell,

    -- Better terminal colors
    highlights = {
      Normal = { link = 'Normal' },
      NormalFloat = { link = 'NormalFloat' },
      FloatBorder = { link = 'FloatBorder' },
    },
  }

  -- Keybindings for different terminal layouts
  -- Replace the terminal layout keybindings with these:
  vim.keymap.set('n', '<leader>tF', '<cmd>ToggleTerm direction=float<cr>', { desc = 'Terminal Float' })
  vim.keymap.set('n', '<leader>tH', '<cmd>ToggleTerm direction=horizontal<cr>', { desc = 'Terminal Horizontal' })
  vim.keymap.set('n', '<leader>tV', '<cmd>ToggleTerm direction=vertical<cr>', { desc = 'Terminal Vertical' })

  local function get_next_term_id()
    local terminal_list = require('toggleterm.terminal').get_all()
    local max_id = 0
    for _, term in ipairs(terminal_list) do
      if term.id > max_id then max_id = term.id end
    end
    return max_id + 1
  end

  -- 1. ➕ MULTI-SPLIT (<leader>ts): Spawns a brand-new sequential terminal split
  vim.keymap.set('n', '<leader>ts', function()
    local next_id = get_next_term_id()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes([[<C-\><C-n>]], true, true, true), 'n', false)

    -- Get current terminal's direction
    local current_term_id = vim.b.toggle_number
    local current_direction = 'vertical' -- default
    local size = 40

    if current_term_id then
      local term_list = require('toggleterm.terminal').get_all()
      for _, term in ipairs(term_list) do
        if term.id == current_term_id then
          current_direction = term.direction
          -- Use consistent size based on direction
          size = (current_direction == 'horizontal') and 15 or 40
          break
        end
      end
    end

    -- Spawn new terminal in SAME direction with SAME size
    vim.cmd(next_id .. 'ToggleTerm direction=' .. current_direction .. ' size=' .. size)
  end, { desc = '[T]oggle [S]plit New Terminal' })

  -- 2. ❌ CLOSE SPLIT (<leader>tw): Kills the specific active terminal split (Like Cmd+W)
  vim.keymap.set('n', '<leader>tw', function()
    -- Grab the ID of the terminal you are currently typed into
    local current_id = vim.b.toggle_number
    if current_id then
      -- Drop out of insert mode and forcefully shut down this specific ID instance
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes([[<C-\><C-n>]], true, true, true), 'n', false)
      vim.cmd(string.format('%dToggleTerm', current_id)) -- Hides/closes it

      -- Optional: Completely purges the terminal buffer from memory so it's a fresh kill
      local term_list = require('toggleterm.terminal').get_all()
      for _, term in ipairs(term_list) do
        if term.id == current_id then term:shutdown() end
      end
    end
  end, { desc = 'Kill Current Terminal Split' })
  -- Easy escape from terminal mode
  vim.keymap.set('t', '<Esc><Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], { desc = 'Navigate left' })
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], { desc = 'Navigate down' })
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], { desc = 'Navigate up' })
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], { desc = 'Navigate right' })

  -- Specialized terminals (lazy-loaded)
  local Terminal = require('toggleterm.terminal').Terminal

  -- Lazygit integration
  local lazygit = Terminal:new {
    cmd = 'lazygit',
    direction = 'float',
    hidden = true,
    on_open = function(term)
      vim.cmd 'startinsert!'
      vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
    end,
  }
  vim.keymap.set('n', '<leader>gg', function() lazygit:toggle() end, { desc = 'LazyGit' })

  -- Python REPL
  local python = Terminal:new {
    cmd = 'python3',
    direction = 'float',
    hidden = true,
  }
  vim.keymap.set('n', '<leader>tp', function() python:toggle() end, { desc = 'Python REPL' })

  -- Node REPL
  local node = Terminal:new {
    cmd = 'node',
    direction = 'float',
    hidden = true,
  }
  vim.keymap.set('n', '<leader>tn', function() node:toggle() end, { desc = 'Node REPL' })

  -- btop/htop system monitor
  local htop = Terminal:new {
    cmd = 'btop',
    direction = 'float',
    hidden = true,
  }
  vim.keymap.set('n', '<leader>tm', function() htop:toggle() end, { desc = 'System Monitor' })
end
