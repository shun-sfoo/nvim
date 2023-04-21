local definitions = {
  {
    event = 'TextYankPost',
    pattern = '*',
    -- cb_str = 'lua vim.highlight.on_yank { higroup = "SagaBeacon", timeout=180, on_visual = true}',
    cb_str = 'lua vim.highlight.on_yank {on_visual = true}',
    desc = 'Highlight on yank',
  },
  {
    -- Don't auto-wrap comments and don't insert comment leader after hitting 'o'
    -- But insert comment leader after hitting <CR> and respect 'numbered' lists
    event = 'FileType',
    pattern = '*',
    cb_str = [[setlocal formatoptions-=c formatoptions-=o formatoptions+=r formatoptions+=n]],
  },
}

for _, rule in ipairs(definitions) do
  -- Creating an autocommand in 0.7
  vim.api.nvim_create_autocmd(rule.event, {
    pattern = rule.pattern,
    callback = function() vim.api.nvim_command(rule.cb_str) end,
    desc = rule.desc,
  })
end

-- use auto-sessions instead of
-- {
--   event = 'BufReadPost',
--   pattern = '*',
--   cb_str = [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]],
--   desc = 'Reposition last line',
-- },
