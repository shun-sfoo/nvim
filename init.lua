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
-- require"plugin-settings"
-- require"event".load_autocmds()

-- personal function
vim.fn.nvim_set_keymap('n', 's','col(".")==1?"$":"0"',{expr = true})
vim.fn.nvim_set_keymap('v', 's','col(".")==1?"$h":"0"',{expr = true})

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	-- Packer can manage itself as an optional plugin
	use {'wbthomason/packer.nvim', opt = true}

	-- Post-install/update hook with neovim command
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use { 'glepnir/zephyr-nvim', config = vim.cmd [[colorscheme zephyr]] }

	use { 'neovim/nvim-lspconfig', event = 'BufRead *' }

	use { 'glepnir/lspsaga.nvim', cmd = 'Lspsaga' }
	use { 'hrsh7th/nvim-compe', event = 'InsertEnter *' }

	use { 'Raimondi/delimitMate', event = 'InsertEnter *' }
	use { 'nvim-telescope/telescope.nvim', 
	cmd = 'Telescope',
	requires = {
		{'nvim-lua/popup.nvim', opt = true},
		{'nvim-lua/plenary.nvim',opt = true},
		{'nvim-telescope/telescope-fzy-native.nvim',opt = true},
	}}

end)
