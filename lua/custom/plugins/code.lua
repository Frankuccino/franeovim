local function gh(repo) return 'https://github.com/' .. repo end

-- UFO (better folding)
vim.pack.add {
  gh 'kevinhwang91/promise-async', -- Load the dependency first!
  gh 'kevinhwang91/nvim-ufo', -- Then load the main plugin
}

vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

require('ufo').setup {
  provider_selector = function() return { 'treesitter', 'indent' } end,
}

vim.pack.add { gh 'smjonas/inc-rename.nvim' }

-- Wrap in a safe call so it won't crash while downloading on first boot
local ok, increname = pcall(require, 'inc-rename')
if ok then
  increname.setup()

  vim.keymap.set('n', '<leader>rn', function() return ':IncRename ' .. vim.fn.expand '<cword>' end, { expr = true, desc = 'Incremental rename' })
end

-- ==========================================
-- Autocomplete & Auto-closing Tags Setup
-- ==========================================
vim.pack.add {
  gh 'hrsh7th/nvim-cmp', -- The main completion UI engine
  gh 'hrsh7th/cmp-nvim-lsp', -- Source: Feeds your 0.11 native LSP data to the UI
  gh 'hrsh7th/cmp-buffer', -- Source: Grabs text from the current file
  gh 'hrsh7th/cmp-path', -- Source: Real-time file paths explorer
  gh 'windwp/nvim-ts-autotag', -- NEW: Automatically closes HTML/JS/TS tags instantly
}

-- Fire up the auto-closing tags engine
local autotag_ok, autotag = pcall(require, 'nvim-ts-autotag')
if autotag_ok then autotag.setup() end

-- Your existing safe execution block for cmp:
local cmp_ok, cmp = pcall(require, 'cmp')
if cmp_ok then
  cmp.setup {
    mapping = cmp.mapping.preset.insert {
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm { select = true },
      ['<Tab>'] = cmp.mapping.select_next_item(),
      ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    },
    sources = cmp.config.sources {
      { name = 'nvim_lsp' }, -- Now cleanly wired up through your lsp.lua capabilities!
      { name = 'buffer' },
      { name = 'path' },
    },
  }
end
