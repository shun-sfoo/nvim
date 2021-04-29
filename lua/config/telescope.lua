local utils = require("utils")
local map = utils.map

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
-- can't show all buffer issues
-- https://github.com/nvim-telescope/telescope.nvim/issues/368
map("n", "<leader>fb", "<cmd>Telescope buffers show_all_buffers=true<cr>")
map("n", "<leader>fh", "<cmd>Telescope oldfiles<cr>")
map("n", "<leader>ft", "<cmd>Telescope help_tags<cr>")
