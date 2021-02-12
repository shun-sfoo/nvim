-- /Users/penny/.local/share/nvim/site/pack/nvim-lspconfig/opt/nvim-lspconfig
-- https://github.com/neovim/nvim-lspconfig.git
-- https://github.com/nvim-treesitter/nvim-treesitter.git

local plugins = {'neovim/nvim-lspconfig', 'nvim-treesitter/nvim-treesitter'}
local packDir = '~/.local/share/nvim/site/pack/'
local opt = 'opt'
local github = 'https://github.com/'


function dirExists (file)
	local ok, err, code = os.rename(file, file)
	if not ok then
		-- Permission denied, but it exists
		if code == 13 then
			return true
		end
	end
	return ok, err
end

function isDir (filename)
	local stat = vim.loop.fs_stat(filename)
	return stat and stat.type == 'directory' or false
end


