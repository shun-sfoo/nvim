-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set('i', 'jk', '<Esc>', nil)
vim.keymap.set('n', '<leader>rr', function() require('util.task').action() end, nil)
vim.keymap.set('n', '<leader>th', function() require('util.haici').search() end, nil)
