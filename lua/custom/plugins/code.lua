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
-- ==========================================
-- 🔌 Keep ONLY the auto-closing tags engine
vim.pack.add { gh 'windwp/nvim-ts-autotag' }

local autotag_ok, autotag = pcall(require, 'nvim-ts-autotag')
if autotag_ok then autotag.setup() end
