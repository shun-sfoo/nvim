-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd('FileType', {
  callback = function() vim.cmd('setlocal formatoptions-=c formatoptions-=o formatoptions+=r formatoptions+=n') end,
})

-- markdown 和 纯文本中关闭单词检查
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'markdown', 'text' },
  callback = function() vim.opt_local.spell = false end,
})

--  speccif for qt git project
vim.api.nvim_create_autocmd({ 'BufEnter', 'DirChanged' }, {
  pattern = 'cpp',
  callback = function()
    -- 通过 .git 目录检测项目根路径
    local git_root = vim.fs.root(0, '.git')
    if git_root and string.find(git_root:lower(), 'qt') then
      -- 设置 Qt 项目缩进规则：4空格
      vim.bo.shiftwidth = 4
      vim.bo.tabstop = 4
      vim.bo.softtabstop = 4
      vim.bo.expandtab = true
    end
  end,
})
