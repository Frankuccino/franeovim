local function gh(repo) return 'https://github.com/' .. repo end

-- Navigation (Isolating Flash)
vim.pack.add {
  gh 'folke/flash.nvim',
}

-- Safe Flash Setup
local ok_flash, flash = pcall(require, 'flash')
if ok_flash then
  flash.setup()

  -- Normal, Visual, and Operator-pending modes for jumping
  vim.keymap.set({ 'n', 'x', 'o' }, 's', function() flash.jump() end, { desc = 'Flash' })

  -- Treesitter selection jumping
  vim.keymap.set({ 'n', 'x', 'o' }, 'S', function() flash.treesitter() end, { desc = 'Flash Treesitter' })
else
  -- If it's not downloaded yet, this print will tell you on boot
  print 'Flash is currently downloading in the background...'
end
