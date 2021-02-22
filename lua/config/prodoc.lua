local map = require("config.utils").map
-- map('n', '<leader>f', '<cmd>Format<cr>', silent)
map("n", "gcj", "<cmd>Prodoc<CR>")
map("n", "gcc", "<cmd>ProComment<CR>")
map("x", "gcc", "<cmd>ProComment<CR>")
