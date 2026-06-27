local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  gh 'lopi-py/luau-lsp.nvim',

  -- dependencies
  -- plenary.nvim & telescope.nvim
}

require('luau-lsp').setup {
  platform = {
    type = 'roblox',
  },
  sourcemap = {
    enabled = true,
    autogenerate = true,
    rojo_project_file = 'default.project.json',
  },
  types = {
    roblox_security_level = 'PluginSecurity',
  },
}
