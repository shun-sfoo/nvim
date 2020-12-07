local vim = vim
local rhs_options = {}
local mapping =  setmetatable({}, { __index = { vim = {}, plugin = {} } })

function _G.check_back_space()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

function rhs_options:new()
  local instance = {
    cmd = '',
    options = {
      noremap = false,
      silent = false,
      expr = false,
    }
  }
  setmetatable(instance, self) self.__index = self
  return instance
end

function rhs_options:map_cmd(cmd_string)
  self.cmd = cmd_string
  return self
end

function rhs_options:map_cr(cmd_string)
  self.cmd =  (":%s<CR>"):format(cmd_string)
  return self
end

function rhs_options:map_cu(cmd_string)
  self.cmd = (":<C-u>%s<CR>"):format(cmd_string)
  return self
end

function rhs_options:with_silent()
  self.options.silent = true
  return self
end

function rhs_options:with_noremap()
  self.options.noremap = true
  return self
end

function rhs_options:with_expr()
  self.options.expr = true
  return self
end

local function map_cr(cmd_string)
  local ro = rhs_options:new()
  return ro:map_cr(cmd_string)
end

local function map_cu(cmd_string)
  local ro = rhs_options:new()
  return ro:map_cu(cmd_string)
end

local function map_cmd(cmd_string)
  local ro = rhs_options:new()
  return ro:map_cmd(cmd_string)
end

function mapping.nvim_load_mapping(mappings)
  for key, value in pairs(mappings) do
    local mode, keymap = key:match("([^|]*)|?(.*)")
    if type(value) == 'table' then
      local rhs = value.cmd
      local options = value.options
      vim.fn.nvim_set_keymap(mode, keymap, rhs, options)
    end
  end
end


function mapping:load_vim_define()
  self.vim = {
    --Vim map
    ["n|<C-x>k"]     = map_cr('Bdelete'):with_noremap():with_silent(),
    ["n|<C-s>"]      = map_cu('write'):with_noremap(),
    ["n|Y"]          = map_cmd('y$'),
    ["n|]w"]         = map_cu('WhitespaceNext'):with_noremap(),
    ["n|[w"]         = map_cu('WhitespacePrev'):with_noremap(),
    ["n|]b"]         = map_cu('bp'):with_noremap(),
    ["n|[b"]         = map_cu('bn'):with_noremap(),
    ["n|<Space>cw"]  = map_cu([[silent! keeppatterns %substitute/\s\+$//e]]):with_noremap():with_silent(),
    ["n|<C-h>"]      = map_cmd('<C-w>h'):with_noremap(),
    ["n|<C-l>"]      = map_cmd('<C-w>l'):with_noremap(),
    ["n|<C-j>"]      = map_cmd('<C-w>j'):with_noremap(),
    ["n|<C-k>"]      = map_cmd('<C-w>k'):with_noremap(),
    ["n|<C-w>["]     = map_cr('vertical resize -5'),
    ["n|<C-w>]"]     = map_cr('vertical resize +5'),
    ["n|<Leader>ss"] = map_cu('SessionSave'):with_noremap(),
    ["n|<Leader>sl"] = map_cu('SessionLoad'):with_noremap(),
    -- Insert
    ["i|jk"]         = map_cmd("<esc>"):with_noremap(),
    ["i|<C-w>"]      = map_cmd('<C-[>diwa'):with_noremap(),
    ["i|<C-h>"]      = map_cmd('<BS>'):with_noremap(),
    ["i|<C-d>"]      = map_cmd('<Del>'):with_noremap(),
    ["i|<C-k>"]      = map_cmd('<ESC>d$a'):with_noremap(),
    ["i|<C-u>"]      = map_cmd('<C-G>u<C-U>'):with_noremap(),
    ["i|<C-b>"]      = map_cmd('<Left>'):with_noremap(),
    ["i|<C-f>"]      = map_cmd('<Right>'):with_noremap(),
    ["i|<C-a>"]      = map_cmd('<ESC>^i'):with_noremap(),
    ["i|<C-o>"]      = map_cmd('<Esc>o'):with_noremap(),
    ["i|<C-s>"]      = map_cmd('<Esc>:w<CR>'),
    ["i|<C-q>"]      = map_cmd('<Esc>:wq<CR>'),
    ["i|<C-e>"]      = map_cmd([[pumvisible() ? "\<C-e>" : "\<End>"]]):with_noremap():with_expr(),
    -- command line
    ["c|<C-b>"]      = map_cmd('<Left>'):with_noremap(),
    ["c|<C-f>"]      = map_cmd('<Right>'):with_noremap(),
    ["c|<C-a>"]      = map_cmd('<Home>'):with_noremap(),
    ["c|<C-e>"]      = map_cmd('<End>'):with_noremap(),
    ["c|<C-d>"]      = map_cmd('<Del>'):with_noremap(),
    ["c|<C-h>"]      = map_cmd('<BS>'):with_noremap(),
    ["c|<C-t>"]      = map_cmd([[<C-R>=expand("%:p:h") . "/" <CR>]]):with_noremap(),
  }
end

function mapping:load_plugin_define()
  self.plugin = {
    -- coc
    ["n|]e"]             = map_cmd('<Plug>(coc-diagnostic-prev)'):with_silent(),
    ["n|[e"]             = map_cmd('<Plug>(coc-diagnostic-next)'):with_silent(),
    ["n|K"]              = map_cr("call CocActionAsync('doHover')"):with_noremap():with_silent(),
    ["n|gd"]             = map_cmd("<Plug>(coc-definition)"):with_silent(),
    ["n|<Leader>rn"]     = map_cmd("<Plug>(coc-rename)"):with_silent(),
    ["n|<Leader>rf"]     = map_cmd("<Plug>(coc-refactor)"):with_silent(),
    ["n|<Leader>rw"]     = map_cr("CocCommand document.renameCurrentWord"):with_silent(), -- multiple change word
    ["n|<C-c>"]          = map_cmd("<Plug>(coc-cursors-position)"):with_silent(),
    ["n|<C-d>"]          = map_cmd("<Plug>(coc-cursors-word)"):with_silent(), -- add or minus current word range to cursors 
    ["x|<C-d>"]          = map_cmd("<Plug>(coc-cursors-word)"):with_silent(), 
    ["n|<Leader>fz"]     = map_cmd(":<C-u>CocSearch -w<Space>"):with_noremap():with_silent(), -- search all curors
    -- coc-clap
    ["n|<Leader>ce"]     = map_cr('Clap coc_diagnostics'):with_noremap():with_silent(),
    ["n|<Leader>;"]      = map_cr('Clap coc_extensions'):with_noremap():with_silent(),
    ["n|<Leader>,"]      = map_cr('Clap coc_commands'):with_noremap():with_silent(),
    ["n|<Leader>cs"]     = map_cr('Clap coc_symbols'):with_noremap():with_silent(),
    ["n|<Leader>cS"]     = map_cr('Clap coc_services'):with_noremap():with_silent(),
    ["n|<Leader>ct"]     = map_cr('Clap coc_outline'):with_noremap():with_silent(),
    -- Plugin Clap
    ["n|<Leader>tc"]     = map_cu('Clap colors'):with_noremap():with_silent(),
    ["n|<Leader>bb"]     = map_cu('Clap buffers'):with_noremap():with_silent(),
    ["n|<Leader>fa"]     = map_cu('Clap grep'):with_noremap():with_silent(),
    ["n|<Leader>fb"]     = map_cu('Clap marks'):with_noremap():with_silent(),
    ["n|<C-x><C-f>"]     = map_cu('Clap filer'):with_noremap():with_silent(),
    ["n|<Leader>ff"]     = map_cu('Clap files ++finder=rg --ignore --hidden --files'):with_noremap():with_silent(),
    ["n|<Leader>fg"]     = map_cu('Clap gfiles'):with_noremap():with_silent(),
    ["n|<Leader>fw"]     = map_cu('Clap grep ++query=<Cword>'):with_noremap():with_silent(),
    ["n|<Leader>fh"]     = map_cu('Clap history'):with_noremap():with_silent(),
    ["n|<Leader>fW"]     = map_cu('Clap windows'):with_noremap():with_silent(),
    ["n|<Leader>fl"]     = map_cu('Clap loclist'):with_noremap():with_silent(),
    ["n|<Leader>fu"]     = map_cu('Clap git_diff_files'):with_noremap():with_silent(),
    ["n|<Leader>fv"]     = map_cu('Clap grep ++query=@visual'):with_noremap():with_silent(),
    -- Plugin acceleratedjk
    ["n|j"]              = map_cmd('<Plug>(accelerated_jk_gj)'),
    ["n|k"]              = map_cmd('<Plug>(accelerated_jk_gk)'),
    -- Plugin Vista
    ["n|<Leader>i"]      = map_cu('Vista!!'):with_noremap():with_silent(),
-- Plugin vim-operator-replace
    ["x|p"]              = map_cmd("<Plug>(operator-replace)"),
    -- Plugin vim-operator-surround
    ["n|sa"]             = map_cmd("<Plug>(operator-surround-append)"):with_silent(),  -- saiw saab saib
    ["n|sd"]             = map_cmd("<Plug>(operator-surround-delete)"):with_silent(),  
    ["n|sr"]             = map_cmd("<Plug>(operator-surround-replace)"):with_silent(), -- srab srap srip
    -- coc-explorer
    ["n|<Leader>e"]      = map_cr("CocCommand explorer"):with_silent(),
    -- coc-translation
    ["n|<Leader>tt"]     = map_cr("CocCommand translator.popup"):with_silent(),
    -- bufferline
    ["n|gb"]             = map_cr("BufferLinePick"):with_silent(),
  }
end

mapping:load_vim_define()
mapping:load_plugin_define()
mapping.nvim_load_mapping(mapping.vim)
mapping.nvim_load_mapping(mapping.plugin)
