-- Custom Neovim Commands

-- List all installed plugins
-- The command to generate the plugins is :PluginsList
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
-- The command to generate the keymaps is :KeymapsAudit
vim.api.nvim_create_user_command('KeymapsAudit', function()
  local config_path = vim.fn.stdpath 'config'
  local output_file = config_path .. '/keymaps-audit.txt'

  local cmd = string.format([[grep -rn "vim.keymap.set\|map(" %s --include="*.lua" | grep -v ".git" | grep -v "^\s*--" > %s]], config_path, output_file)
  vim.fn.system(cmd)
  vim.cmd('edit ' .. output_file)
  vim.notify('Keymaps audit generated!', vim.log.levels.INFO)
end, { desc = 'Generate keymaps audit file' })
