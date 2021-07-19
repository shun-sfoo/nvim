local utils = require("core.utils")
local map = utils.map

-- telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
-- can't show all buffer issues
-- https://github.com/nvim-telescope/telescope.nvim/issues/368
map("n", "<leader>fb", "<cmd>Telescope buffers show_all_buffers=true<cr>")
map("n", "<leader>fh", "<cmd>Telescope oldfiles<cr>")
map("n", "<leader>ft", "<cmd>Telescope help_tags<cr>")


-- compe
vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
