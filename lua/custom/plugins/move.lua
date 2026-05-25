local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'echasnovski/mini.move' }

local ok_move, move = pcall(require, 'mini.move')
if ok_move then
  move.setup {
    mappings = {
      left = '<M-h>',
      right = '<M-l>',
      down = '<M-j>',
      up = '<M-k>',

      line_left = '<M-h>',
      line_right = '<M-l>',
      line_down = '<M-j>',
      line_up = '<M-k>',
    },
    options = {
      reindent_linewise = true,
    },
  }
else
  print 'mini.move is currently downloading...'
end
