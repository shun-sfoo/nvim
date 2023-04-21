local vim = vim

vim.keymap.set('i', 'jk', '<Esc>', {})
vim.keymap.set('i', '<C-f>', '<Right>', {})
vim.keymap.set('i', '<C-b>', '<Left>', {})
vim.keymap.set('i', '<C-a>', '<Home>', {})
vim.keymap.set('i', '<C-e>', '<End>', {})
vim.keymap.set('n', '<Leader>tf', function() require('internal.fmt'):action() end, { desc = 'formatter' })
vim.keymap.set('n', '<Leader>tw', function() require('internal.haici').search() end, { desc = 'formatter' })
vim.keymap.set(
  'n',
  '<Leader>ty',
  function() require('internal.translator').querySentence('textobject') end,
  { desc = 'formatter' }
)
vim.keymap.set(
  'v',
  '<Leader>ty',
  function() require('internal.translator').querySentence('visual') end,
  { desc = 'formatter' }
)

vim.keymap.set('n', '<Leader>tr', function() require('internal.cmake').handler() end, { desc = 'runnable' })
