-- Custom Neovim Commands

-- List all installed plugins
vim.api.nvim_create_user_command('PluginsList', function()
  local config_path = vim.fn.stdpath 'config'
  local output_file = config_path .. '/INSTALLED_PLUGINS.md'

  -- Generate the list
  local cmd = string.format("grep -rh \"gh '\" %s --include='*.lua' | sed \"s/.*gh '\\(.*\\)'.*/- \\1/\" | sort -u > %s", config_path, output_file)

  vim.fn.system(cmd)

  -- Open the file
  vim.cmd('edit ' .. output_file)
  vim.notify('Plugin list generated!', vim.log.levels.INFO)
end, { desc = 'Generate list of installed plugins' })

-- Add more custom commands here as needed
