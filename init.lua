vim.api.nvim_command('set clipboard+=unnamedplus')
vim.api.nvim_set_keymap('i', 'jk', '<esc>', { nowait = true, noremap = true, silent = true })
vim.api.nvim_command('set list')
vim.api.nvim_command('set tabstop=2')
vim.api.nvim_command('set shiftwidth=2')
vim.api.nvim_command('set softtabstop=-1')
vim.api.nvim_command('set number')
vim.api.nvim_command('set signcolumn="yes"')
vim.o['termguicolors']=true
vim.o['listchars']="tab:»·,nbsp:+,trail:·,extends:→,precedes:←"
vim.o['showcmd']=false
vim.o['cmdheight']=2
vim.o['cmdwinheight']=5

-- vim.api.nvim_command('set rtp+=~/.local/share/nvim/site/pack/nvim-lspconfig/opt/nvim-lspconfig')

-- leader key
vim.g.mapleader = " "
vim.fn.nvim_set_keymap('n',' ','',{noremap = true})
vim.fn.nvim_set_keymap('x',' ','',{noremap = true})

require"lsp"
require"plugin-settings"
require"event".load_autocmds()
require"zephyr"

-- personal function
vim.fn.nvim_set_keymap('n', 's','col(".")==1?"$":"0"',{expr = true})
vim.fn.nvim_set_keymap('v', 's','col(".")==1?"$h":"0"',{expr = true})
