local api = vim.api
local M = {}

function M.create_window() 
	api.nvim_command('enew')
	local win = vim.api.nvim_get_current_win()
	local buf = vim.api.nvim_get_current_buf()
	vim.api.nvim_buf_set_name(buf, 'Dash')
	vim.bo[0].buftype = 'nofile'
	vim.bo[0].swapfile = false
	vim.bo[0].bufhidden = 'wipe'
	vim.bo[0].filetype = 'dash'

	vim.wo[0].wrap = false
	vim.wo[0].cursorline = true
	history()
	set_mappings()
end

function history()
	local icons = {
		vim = " ",
		markdown = " ",
		lua = ' ',
		txt = ' ',
	}

	vim.bo[0].modifiable = true
	local his = vim.tbl_filter(function(val) return 0 ~= vim.fn.filereadable end, vim.v.oldfiles)

	local count = 1
	local list = {}

	for _ , v in pairs(his) do
		if count > 9 then
			break
		end
		local path = vim.fn.fnamemodify(v, ':~')
		local ext = vim.fn.fnamemodify(path, ':e')
		if  ext == 'txt' and type(string.find(path, 'nvim/runtime/doc')) ~= 'boolean' then  -- exclude help doc
			goto continue
		end
		local icon = icons[ext] or ' '
		local item = '[' .. count .. '] '.. icon .. path
		table.insert(list, center(item))
		count = count + 1
	::continue::
	end

	api.nvim_buf_set_lines(0, 0, -1, false, list)
	vim.bo[0].modifiable = false
end

function set_mappings()
				local mappings = {
								['<cr>'] = 'open_file()',
				}

				for k, v in pairs(mappings) do
								api.nvim_buf_set_keymap(0, 'n', k, ':lua require"dash".' .. v .. '<cr>', {
												nowait = true, noremap = true, silent = true
								})
				end
end

function M.open_file()
				local str = string.match(api.nvim_get_current_line(), "~%g+")
				api.nvim_command('edit ' .. str)
end

function close_window()
				api.nvim_win_close(0, true)
end

function center(str)
	local width = api.nvim_win_get_width(0)
  local shift = math.floor(width / 3)
  return string.rep(' ', shift) .. str
end

return M
