local function gh(repo) return 'https://github.com/' .. repo end

-- Install the plugins
vim.pack.add { gh 'L3MON4D3/LuaSnip' }
vim.pack.add { gh 'rafamadriz/friendly-snippets' }
vim.pack.add { gh 'saadparwaiz1/cmp_luasnip' } -- Bridge between cmp and luasnip

local luasnip = require 'luasnip'
local cmp = require 'cmp'

-- Load all snippets from friendly-snippets
require('luasnip.loaders.from_vscode').lazy_load()

-- Update your cmp setup to include snippets
cmp.setup {
  snippet = {
    expand = function(args) luasnip.lsp_expand(args.body) end,
  },

  mapping = cmp.mapping.preset.insert {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm { select = true },

    -- Tab to complete or jump in snippet
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),

    -- Shift+Tab to go back
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },

  sources = cmp.config.sources {
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- Add snippets to completion menu
    { name = 'buffer' },
    { name = 'path' },
  },
}
