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

-- 针对 qt项目设置独立缩进规则
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'cpp',
  callback = function()
    -- 检测 Git 项目根目录是否包含 "qt"
    local git_root = vim.fs.root(0, '.git')
    local is_qt_project = git_root and string.find(git_root:lower(), 'qt')

    -- 根据条件设置缩进
    if is_qt_project then
      -- Qt 项目使用 4 空格缩进
      vim.bo.shiftwidth = 4
      vim.bo.tabstop = 4
      vim.bo.softtabstop = 4
      vim.bo.expandtab = true
      vim.bo.cindent = true -- 启用 C 风格缩进[7](@ref)
      vim.bo.smartindent = true -- 智能缩进[3](@ref)
    end
  end,
})
