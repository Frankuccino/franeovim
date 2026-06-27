-- This is the file where you add and enable LSPs from Mason.
-- 1. Initialize the configurations for your engines
vim.lsp.config('html', {})
vim.lsp.config('cssls', {})
vim.lsp.config('vtsls', {})
vim.lsp.config('emmet_ls', {
  filetypes = { 'html', 'css', 'javascriptreact', 'typescriptreact' },
})
-- 2. Physically enable them to run on their respective file types
vim.lsp.enable 'html'
vim.lsp.enable 'cssls'
vim.lsp.enable 'vtsls'
vim.lsp.enable 'emmet_ls'
