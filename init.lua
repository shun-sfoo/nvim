local api = vim.api

vim.wo.number = true
vim.o.clipboard = 'unnamedplus'
-- vim.o.tabstop = 2
api.nvim_command('set tabstop=2')

-- vim.o.display = 'lastline'

-- vim.o.termguicolors = true
require'zephyr'
