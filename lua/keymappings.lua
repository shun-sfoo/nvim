local utils = require("utils")

utils.map("n", "<C-l>", "<cmd>noh<CR>") -- Clear highlights
utils.map("i", "jk", "<Esc>") -- jk to escape
utils.map("i", "<C-f>", "<Right>") -- jk to escape
utils.map("i", "<C-b>", "<Left>") -- jk to escape
utils.map("n", "<leader>e", ":NvimTreeToggle<CR>") -- jk to escape
utils.map("n", "<leader>v", ":Vista<CR>")
utils.map("n", "<leader>g", ":Glow<CR>")
