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

require("telescope").load_extension "file_browser"

