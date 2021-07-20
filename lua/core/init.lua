-- Map leader to space
vim.g.mapleader = " "

local utils = require("core.utils")
local cmd = vim.cmd
local indent = 2

cmd "syntax enable"
cmd "filetype plugin indent on"

-- key bindings
utils.map("n", "<C-l>", "<cmd>noh<CR>") -- Clear highlights
utils.map("i", "jk", "<Esc>") -- jk to escape
utils.map("i", "<C-f>", "<Right>")
utils.map("i", "<C-b>", "<Left>")
utils.map("n", "<leader>e", ":NvimTreeToggle<CR>")
utils.map("n", "<leader>v", ":Vista<CR>")
utils.map("n", "<leader>g", ":Glow<CR>")

-- settings
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
utils.opt("o", "completeopt", "menuone,noselect")
utils.opt("o", "termguicolors", true)
utils.opt("o", "showcmd", false)
utils.opt("o", "cmdheight", 2)
utils.opt("o", "cmdwinheight", 5)
utils.opt("o", "scrolloff", 4)
-- utils.opt("o", "autochdir", true)

local pack = require "core.pack"
pack.ensure_plugins()
pack.load_compile()

require("core.autocmd").load_autocmds()
require("core.keybinds").load_keybinds()
