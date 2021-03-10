vim.cmd [[packadd lspsaga.nvim]]

local saga = require "lspsaga"
saga.init_lsp_saga()

local map = require("config.utils").map
local opts = {silent = true, noremap = true, nowait = true}

map("n", "<c-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
map("n", "<c-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
map("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
map("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
map("n", "K", "<cmd>Lspsaga hover_doc<CR>")
map("n", "ga", "<cmd>Lspsaga range_code_action<CR>")
map("n", "gd", "<cmd>Lspsaga preview_definition<CR>")
map("n", "gD", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "gs", "<cmd>Lspsaga signature_help<CR>")
map("n", "gr", "<cmd>Lspsaga rename<CR>")
map("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
map("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
