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
    on_attach = function(_, bufnr)
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      -- Rust-specific keymaps (buffer-local, only active in .rs files)
      local map = function(keys, func, desc) vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc }) end

      map('<leader>rr', '<cmd>RustLsp runnables<CR>', 'Rust Runnables')
      map('<leader>rt', '<cmd>RustLsp testables<CR>', 'Rust Testables')
      map('<leader>re', '<cmd>RustLsp expandMacro<CR>', 'Rust Expand Macro')
      map('<leader>rc', '<cmd>RustLsp openCargo<CR>', 'Rust Open Cargo.toml')
      map('<leader>rd', '<cmd>RustLsp debuggables<CR>', 'Rust Debuggables')
      map('K', '<cmd>RustLsp hover actions<CR>', 'Rust Hover Actions')
    end,

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
