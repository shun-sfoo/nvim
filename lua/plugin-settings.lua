-- prodoc
vim.api.nvim_command('packadd! prodoc.nvim')
vim.api.nvim_set_keymap('n', 'gcc', ":<C-u>ProComment<CR>", { nowait = true, noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'gcc', ":ProComment<CR>", { nowait = true, noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gcj', ":<C-u>ProDoc<CR>", { nowait = true, noremap = true, silent = true })

-- telescope
vim.api.nvim_command('packadd! plenary.nvim')
vim.api.nvim_command('packadd! popup.nvim')
vim.api.nvim_command('packadd! telescope.nvim')

vim.api.nvim_set_keymap('n', '<leader>ff', ":<C-u>lua require('telescope.builtin').find_files()<CR>", { nowait = true, noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', ":<C-u>lua require('telescope.builtin').live_grep()<CR>", { nowait = true, noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', ":<C-u>lua require('telescope.builtin').buffers()<CR>", { nowait = true, noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', ":<C-u>lua require('telescope.builtin').help_tags()<CR>", { nowait = true, noremap = true, silent = true })

-- nvim-treesitter
vim.api.nvim_command('packadd! nvim-treesitter')
-- vim.api.nvim_command('set foldmethod=expr')
-- vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')
require'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true,
	},
	indent = {
		enable = true
	},
	textobjects = {
		select = {
			enable = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
	},
	ensure_installed = 'all'
}

-- nvim-compe
vim.api.nvim_command('packadd! nvim-compe')
require'compe'.setup {
	enabled = true;
	autocomplete = true;
	debug = false;
	min_length = 1;
	preselect = 'enable';
	throttle_time = 80;
	source_timeout = 200;
	incomplete_delay = 400;
	max_abbr_width = 100;
	max_kind_width = 100;
	max_menu_width = 100;
	documentation = true;

	source = {
		path = true;
		buffer = true;
		calc = true;
		vsnip = true;
		nvim_lsp = true;
		nvim_lua = true;
		spell = true;
		tags = true;
		snippets_nvim = true;
		treesitter = true;
	};
}
vim.o["completeopt"]="menuone,noselect"

-- next
