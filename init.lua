local packages = {
  -- dependency by rust-tools,telescope
  'nvim-lua/plenary.nvim',

  'folke/which-key.nvim',
  'folke/tokyonight.nvim',
  'nvim-tree/nvim-web-devicons',
  'Pocco81/auto-save.nvim',
  'rmagatti/auto-session',
  'lewis6991/gitsigns.nvim',
  'nvim-telescope/telescope.nvim',
  'nvim-telescope/telescope-file-browser.nvim',
  'norcalli/nvim-colorizer.lua',
  'TimUntersberger/neogit',
  'rafcamlet/nvim-luapad',

  -- { 'nvim-treesitter/nvim-treesitter', run = function() vim.cmd('TSUpdate') end },
  'nvim-treesitter/nvim-treesitter',

  'neovim/nvim-lspconfig',
  'simrat39/rust-tools.nvim',
  'glepnir/lspsaga.nvim',
  'folke/neodev.nvim',

  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-cmdline',
  { 'L3MON4D3/LuaSnip', run = 'make install_jsregexp LUAJIT_OSX_PATH=/usr/local/opt/luajit' },
  'saadparwaiz1/cmp_luasnip',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-nvim-lsp-signature-help',
}

require('paq')(packages)

local path = vim.fn.stdpath('data') .. '/site/pack/paqs'
local is_installed = vim.fn.empty(vim.fn.glob(path)) == 0

if is_installed then
  require('internal')
  require('extern')
else
  require('paq').install()
  local tbl = {}
  for _, value in ipairs(packages) do
    local name
    if type(value) == 'table' then
      name = value[1]:match('([%w-_.]+)$')
    else
      name = value:match('([%w-_.]+)$')
    end
    table.insert(tbl, name)
  end
  table.sort(tbl, function(a, b) return a < b end)

  local timer = vim.loop.new_timer()
  timer:start(
    0,
    500,
    vim.schedule_wrap(function()
      if table.concat(tbl) == table.concat(require('paq').getList()) then
        require('internal')
        require('extern')
        timer:close()
      end
    end)
  )
end
