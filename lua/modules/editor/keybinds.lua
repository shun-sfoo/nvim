local utils = require("core.utils")
local map = utils.map

-- vim-etf
local eft_opts = {noremap = false}
map("n", ";", "<Plug>(eft-repeat)", eft_opts)
map("x", ";", "<Plug>(eft-repeat)", eft_opts)

map("n", "f", "<Plug>(eft-f)", eft_opts)
map("x", "f", "<Plug>(eft-f)", eft_opts)
map("o", "f", "<Plug>(eft-f)", eft_opts)

map("n", "F", "<Plug>(eft-F)", eft_opts)
map("x", "F", "<Plug>(eft-F)", eft_opts)
map("o", "F", "<Plug>(eft-F)", eft_opts)

map("n", "t", "<Plug>(eft-t)", eft_opts)
map("x", "t", "<Plug>(eft-t)", eft_opts)
map("o", "t", "<Plug>(eft-t)", eft_opts)

map("n", "T", "<Plug>(eft-T)", eft_opts)
map("x", "T", "<Plug>(eft-T)", eft_opts)
map("o", "T", "<Plug>(eft-T)", eft_opts)
