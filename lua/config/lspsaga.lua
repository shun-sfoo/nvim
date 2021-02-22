local map = require("config.utils").map
local opts = {silent = true, noremap = true, nowait = true}
map("n", "<c-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)
map("n", "<c-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)
map("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
map("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
map("n", "ga", "<cmd>Lspsaga range_code_action<CR>", opts)
map("n", "gd", "<cmd>Lspsaga preview_definition<CR>", opts)
map("n", "gD", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
map("n", "gs", "<cmd>Lspsaga signature_help<CR>", opts)
map("n", "gr", "<cmd>Lspsaga rename<CR>", opts)
map("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
map("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
