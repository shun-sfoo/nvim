require('lspsaga').setup({})

local signs = {
  Error = ' ',
  Warn = ' ',
  Info = ' ',
  Hint = ' ',
}

local lspconfig = require('lspconfig')

for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  signs = true,
  update_in_insert = true,
  severity_sort = true,
  virtual_text = {
    prefix = '🔥',
    source = true,
  },
})

local _attach = function(_, _)
  local keymap = vim.keymap.set
  keymap('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>')
  keymap({ 'n', 'v' }, '<leader>ca', '<cmd>Lspsaga code_action<CR>')
  keymap('n', 'gr', '<cmd>Lspsaga rename<CR>')
  keymap('n', 'gd', '<cmd>Lspsaga goto_definition<CR>')
  keymap('n', 'gt', '<cmd>Lspsaga peek_type_definition<CR>')
  keymap('n', '<leader>sl', '<cmd>Lspsaga show_line_diagnostics<CR>')
  keymap('n', '<leader>sc', '<cmd>Lspsaga show_cursor_diagnostics<CR>')
  keymap('n', '<leader>sb', '<cmd>Lspsaga show_buf_diagnostics<CR>')
  keymap('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>')
  keymap('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<CR>')
  keymap(
    'n',
    '[E',
    function() require('lspsaga.diagnostic'):goto_prev({ severity = vim.diagnostic.severity.ERROR }) end
  )
  keymap(
    'n',
    ']E',
    function() require('lspsaga.diagnostic'):goto_next({ severity = vim.diagnostic.severity.ERROR }) end
  )
  keymap('n', '<leader>o', '<cmd>Lspsaga outline<CR>')
  keymap('n', 'K', '<cmd>Lspsaga hover_doc<CR>')
  keymap('n', '<Leader>ci', '<cmd>Lspsaga incoming_calls<CR>')
  keymap('n', '<Leader>co', '<cmd>Lspsaga outgoing_calls<CR>')
  keymap({ 'n', 't' }, '<A-d>', '<cmd>Lspsaga term_toggle<CR>')
end

local servers = {
  'clangd',
}

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    on_attach = _attach,
  })
end
