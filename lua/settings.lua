local utils = require("utils")
local cmd = vim.cmd
local indent = 2

cmd "syntax enable"
cmd "filetype plugin indent on"

-- Highlight on yank
cmd "autocmd TextYankPost * lua vim.highlight.on_yank {on_visual = true}"

utils.opt("b", "tabstop", indent)
utils.opt("b", "shiftwidth", indent)
utils.opt("b", "softtabstop", -1)
utils.opt("b", "expandtab", true)
utils.opt("w", "list", true)
utils.opt("w", "signcolumn", "yes")
utils.opt("w", "number", true)
utils.opt("w", "relativenumber", true)
utils.opt("w", "listchars", "tab:»·,nbsp:+,trail:·,extends:→,precedes:←")
utils.opt("o", "clipboard", "unnamed,unnamedplus")
utils.opt("o", "termguicolors", true)
utils.opt("o", "showcmd", false)
utils.opt("o", "cmdheight", 2)
utils.opt("o", "cmdwinheight", 5)
utils.opt("o", "scrolloff", 4)
