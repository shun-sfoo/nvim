local map = require("config.utils").map

if not packer_plugins["plenary.nvim"].loaded then
  vim.cmd [[packadd plenary.nvim]]
  vim.cmd [[packadd popup.nvim]]
  vim.cmd [[packadd telescope-fzy-native.nvim]]
end
local opts = {silent = true, noremap = true, nowait = true}
-- Keymap

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", nil)
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
