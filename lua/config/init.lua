require("config.telescope")
require("config.compe")
require("config.signify")
require("config.format")
require("config.evilline")

-- colorscheme
local cmd = vim.cmd
cmd "colorscheme zephyr"

-- lspsaga
local saga = require "lspsaga"
saga.init_lsp_saga()
