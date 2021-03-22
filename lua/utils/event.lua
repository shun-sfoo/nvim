local vim = vim
local autocmd = {}

function autocmd.nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.api.nvim_command("augroup " .. group_name)
    vim.api.nvim_command("autocmd!")
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten {"autocmd", def}, " ")
      vim.api.nvim_command(command)
    end
    vim.api.nvim_command("augroup END")
  end
end

function autocmd.load_autocmds()
  local definitions = {
    ft = {
      {"BufWritePost", "*.rs,*.lua,*.md", "FormatWrite"}
    },
    wins = {
      -- recover buffer line last leave
      {"BufReadPost", "*", [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]},
      -- Highlight on yank
      {"TextYankPost", "*", "lua vim.highlight.on_yank {on_visual = true}"}
    }
  }

  autocmd.nvim_create_augroups(definitions)
end
return autocmd
