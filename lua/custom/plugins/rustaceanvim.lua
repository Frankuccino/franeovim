local function gh(repo) return 'https://github.com/' .. repo end

-- 1. Register the plugin
vim.pack.add {
  gh 'mrcjkb/rustaceanvim',
}

-- 2. Configuration for rustaceanvim
-- We set this globally before the plugin loads
-- ~/.config/nvim/lua/custom/plugins/rustaceanvim.lua

vim.g.rustaceanvim = {
  server = {
    on_attach = function(_, bufnr) vim.lsp.inlay_hint.enable(true, { bufnr = bufnr }) end,
    default_settings = {
      ['rust-analyzer'] = {
        check = { command = 'clippy' },
        inlayHints = {
          bindingModeHints = { enable = true },
          chainingHints = { enable = true },
          closingBraceHints = { enable = true },
          typeHints = { enable = true },
        },
      },
    },
  },
  dap = {
    adapter = {
      type = 'executable',
      command = vim.fn.stdpath 'data' .. '/mason/packages/codelldb/extension/adapter/codelldb',
      args = { '--port', '${port}' },
    },
  },
}

local has_rustacean, _ = pcall(require, 'rustaceanvim')
if not has_rustacean then print 'rustaceanvim is currently downloading/installing...' end
