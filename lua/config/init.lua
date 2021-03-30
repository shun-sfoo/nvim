require("config.telescope")
require("config.compe")
require("config.gitsigns")
require("config.format")
require("config.evilline")
require("config.smartinput")

-- colorscheme
local cmd = vim.cmd
cmd "colorscheme zephyr"

-- lspsaga
local saga = require "lspsaga"
saga.init_lsp_saga()

local home = os.getenv("HOME")
vim.g.dashboard_footer_icon = "🦀 "
vim.g.dashboard_preview_command = "cat"
vim.g.dashboard_preview_pipeline = "lolcat"
vim.g.dashboard_preview_file = home .. "/.config/nvim/static/neovim.cat"
vim.g.dashboard_preview_file_height = 12
vim.g.dashboard_preview_file_width = 80
vim.g.dashboard_default_executive = "telescope"
