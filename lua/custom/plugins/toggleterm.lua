local function gh(repo) return 'https://github.com/' .. repo end
vim.pack.add { gh 'akinsho/toggleterm.nvim' }
local ok, toggleterm = pcall(require, 'toggleterm')
if ok then
  toggleterm.setup {
    -- ⚠️  open_mapping removed — we handle it manually below
    --     so we can guard against NeoTree focus stealing layout

    size = function(term)
      if term.direction == 'horizontal' then
        return 15
      elseif term.direction == 'vertical' then
        if term.id == 1 then
          return math.floor(vim.o.columns * 0.4)
        else
          return nil
        end
      end
    end,

    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
    persist_mode = true,
    direction = 'float',

    float_opts = {
      border = 'curved',
      width = math.floor(vim.o.columns * 0.9),
      height = math.floor(vim.o.lines * 0.85),
      winblend = 0,
    },

    auto_scroll = true,
    close_on_exit = true,
    shell = vim.o.shell,

    -- highlights = {
    --   Normal = { link = 'Normal' },
    --   NormalFloat = { link = 'NormalFloat' },
    --   FloatBorder = { link = 'FloatBorder' },
    -- },
  }

  -- ─── NeoTree-safe Ctrl+\ toggle ──────────────────────────────────────────
  --
  --  Problem: firing ToggleTerm while focused on NeoTree causes Neovim to
  --  open/anchor the terminal *inside* NeoTree's window, which corrupts the
  --  layout (vertical/horizontal splits resize weirdly, NeoTree pane breaks).
  --
  --  Fix: intercept Ctrl+\ in normal mode, check whether the current buffer
  --  is a neo-tree buffer, and if so jump to the last real editor window
  --  before delegating to ToggleTerm.  Terminal/insert modes pass through
  --  unchanged (they can never be focused on NeoTree anyway).
  --
  local function safe_toggle()
    if vim.bo.filetype == 'neo-tree' then
      -- Try the previously-focused window first; fall back to the first
      -- non-NeoTree, non-floating window in the layout.
      vim.cmd 'wincmd p'
      if vim.bo.filetype == 'neo-tree' then
        -- wincmd p landed back on NeoTree (only window open?) – scan instead
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          local buf = vim.api.nvim_win_get_buf(win)
          -- Updated deprecated nvim_buf_get_option
          local ft = vim.api.nvim_get_option_value('filetype', { buf = buf })
          local cfg = vim.api.nvim_win_get_config(win)
          if ft ~= 'neo-tree' and cfg.relative == '' then
            vim.api.nvim_set_current_win(win)
            break
          end
        end
      end
    end
    vim.cmd 'ToggleTerm'
  end

  vim.keymap.set('n', [[<C-\>]], safe_toggle, { desc = 'Terminal (safe)' })
  vim.keymap.set('t', [[<C-\>]], [[<C-\><C-n><cmd>ToggleTerm<cr>]], { desc = 'Terminal toggle' })
  -- ─────────────────────────────────────────────────────────────────────────

  -- Layout shortcuts
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

  vim.keymap.set('n', '<leader>ts', function()
    local next_id = get_next_term_id()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes([[<C-\><C-n>]], true, true, true), 'n', false)
    local current_term_id = vim.b.toggle_number
    local current_direction = 'vertical'
    local size = 40
    if current_term_id then
      for _, term in ipairs(require('toggleterm.terminal').get_all()) do
        if term.id == current_term_id then
          current_direction = term.direction
          size = (current_direction == 'horizontal') and 15 or 40
          break
        end
      end
    end
    vim.cmd(next_id .. 'ToggleTerm direction=' .. current_direction .. ' size=' .. size)
  end, { desc = '[T]oggle [S]plit New Terminal' })

  vim.keymap.set('n', '<leader>tw', function()
    local current_id = vim.b.toggle_number
    if current_id then
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes([[<C-\><C-n>]], true, true, true), 'n', false)
      vim.cmd(string.format('%dToggleTerm', current_id))
      for _, term in ipairs(require('toggleterm.terminal').get_all()) do
        if term.id == current_id then term:shutdown() end
      end
    end
  end, { desc = 'Kill Current Terminal Split' })

  vim.keymap.set('t', '<Esc><Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], { desc = 'Navigate left' })
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], { desc = 'Navigate down' })
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], { desc = 'Navigate up' })
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], { desc = 'Navigate right' })

  local Terminal = require('toggleterm.terminal').Terminal

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

  local python = Terminal:new { cmd = 'python3', direction = 'float', hidden = true }
  vim.keymap.set('n', '<leader>tp', function() python:toggle() end, { desc = 'Python REPL' })

  local node = Terminal:new { cmd = 'node', direction = 'float', hidden = true }
  vim.keymap.set('n', '<leader>tn', function() node:toggle() end, { desc = 'Node REPL' })

  local htop = Terminal:new { cmd = 'btop', direction = 'float', hidden = true }
  vim.keymap.set('n', '<leader>tm', function() htop:toggle() end, { desc = 'System Monitor' })
end
