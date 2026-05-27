local conform = require 'conform'

conform.setup {
  formatters_by_ft = {
    lua = { 'stlua' },
    html = { 'prettier' },
    css = { 'prettier' },
    rust = { 'rustfmt' },
    json = { 'prettier' },
    jsonc = { 'prettier' },

    -- ⚛️ React & JavaScript Filetypes
    javascript = { 'prettier' },
    typescript = { 'prettier' },
    javascriptreact = { 'prettier' }, -- ✨ Handles .jsx files
    typescriptreact = { 'prettier' }, -- ✨ Handles .tsx files
  },

  -- Automatically format when you write the file (:w)
  format_on_save = {
    lsp_fallback = true,
    timeout_ms = 500,
  },
}
