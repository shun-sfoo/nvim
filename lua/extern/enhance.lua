-- ui
vim.cmd([[colorscheme tokyonight-storm]])

require('which-key').setup({})

require('auto-save').setup({})

require('auto-session').setup({
  log_level = 'error',
  auto_session_suppress_dirs = { '~/Workspaces' },
})

require('colorizer').setup()

require('neogit').setup({})

require('gitsigns').setup({
  signs = {
    add = { hl = 'GitGutterAdd', text = '▍' },
    change = { hl = 'GitGutterChange', text = '▍' },
    delete = { hl = 'GitGutterDelete', text = '▍' },
    topdelete = { hl = 'GitGutterDeleteChange', text = '▔' },
    changedelete = { hl = 'GitGutterChange', text = '▍' },
    untracked = { hl = 'GitGutterAdd', text = '▍' },
  },
  keymaps = {
    -- Default keymap options
    noremap = true,
    buffer = true,

    ['n ]g'] = { expr = true, "&diff ? ']g' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'" },
    ['n [g'] = { expr = true, "&diff ? '[g' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'" },

    ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',

    -- Text objects
    ['o ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>',
    ['x ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>',
  },
})

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require('telescope').setup({
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },
})

require('telescope').load_extension('fzf')

-- mini
require('mini.comment').setup()
require('mini.indentscope').setup()
require('mini.cursorword').setup()
require('mini.pairs').setup()
require('mini.pairs').setup()
require('mini.surround').setup()
require('mini.statusline').setup()

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require('nvim-tree').setup()

vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>')

require('fidget').setup({})

local lsp_icon = {
  rust_analyzer = ' ',
  lua_ls = ' ',
  clangd = ' ',
}

local function section_lspinfo(args)
  local lsp = vim.lsp.util.get_progress_messages()[1]
  if lsp then
    local name = lsp_icon[lsp.name] or ''
    local msg = lsp.message or ''
    local percentage = lsp.percentage or 0
    local title = lsp.title or ''
    if MiniStatusline.is_truncated(args.trunc_width) then return string.format(' %s%%%% ', percentage) end
    return string.format(' %s: %s %s (%s%%%%) ', name, title, msg, percentage)
  end
  return ''
end

local function section_time()
  local time = vim.fn.strftime('%H:%M')
  return string.format('  %s', time)
end
