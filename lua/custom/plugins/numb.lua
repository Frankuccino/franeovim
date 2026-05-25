local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'nacro90/numb.nvim' }

local ok, numb = pcall(require, 'numb')
if ok then numb.setup {
  show_numbers = true,
  show_cursorline = true,
  hide_relativenumbers = true,
  number_only = true,
  centered_peeking = true,
} end
