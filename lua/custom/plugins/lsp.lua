-- 1. Initialize the configurations for your engines
vim.lsp.config('html', {})
vim.lsp.config('cssls', {})
vim.lsp.config('vtsls', {})

-- 2. Physically enable them to run on their respective file types
vim.lsp.enable 'html'
vim.lsp.enable 'cssls'
vim.lsp.enable 'vtsls'
