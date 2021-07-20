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

-- nvim-compe
local compe_opts = {noremap = true, expr = true, silent = true}
-- map("i", "<CR>", [[compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))]], compe_opts)
-- map("i", "<C-Space>", [[compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))]], compe_opts)
map("i", "<C-f>", [[compe#scroll({ 'delta': +4 })]], compe_opts)
map("i", "<C-d>", [[compe#scroll({ 'delta': -4 })]], compe_opts)
map("i", "<C-e>", [[compe#close('<C-e>')]], compe_opts)

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col(".") - 1
  if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
    return true
  else
    return false
  end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn["compe#complete"]()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

map("i", "<Tab>", "v:lua.tab_complete()", compe_opts)
map("s", "<Tab>", "v:lua.tab_complete()", compe_opts)
map("i", "<S-Tab>", "v:lua.s_tab_complete()", compe_opts)
map("s", "<S-Tab>", "v:lua.s_tab_complete()", compe_opts)
map("i", "<CR>", "compe#confirm({ 'keys': '<CR>', 'select': v:true })", compe_opts)
