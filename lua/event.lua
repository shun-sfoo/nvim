local vim = vim
local autocmd = {}

function autocmd.nvim_create_augroups(definitions)
	for group_name, definition in pairs(definitions) do
		vim.api.nvim_command('augroup '..group_name)
		vim.api.nvim_command('autocmd!')
		for _, def in ipairs(definition) do
			local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
			vim.api.nvim_command(command)
		end
		vim.api.nvim_command('augroup END')
	end
end

function autocmd.load_autocmds()
	local definitions = {

		ft = {
			{ "FileType", "go", "setlocal omnifunc=v:lua.vim.lsp.omnifunc" },
			{ "BufWritePre", "*.go", "lua goimports(1000)" },
		},

		wins = {
			{ "BufReadPost", "*", [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]] },
		},

	}

	autocmd.nvim_create_augroups(definitions)
end

return autocmd
