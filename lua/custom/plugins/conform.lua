local conform = require 'conform'

conform.setup {
  formatters_by_ft = {
    html = { 'prettier' },
    css = { 'prettier' },
    javascript = { 'prettier' },
    rust = { 'rustfmt' },
  },
  -- Automatically format when you write the file (:w)
  format_on_save = {
    lsp_fallback = true,
    timeout_ms = 500,
  },
}
