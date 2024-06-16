return {
  {
    'folke/tokyonight.nvim',
    opts = {
      style = 'storm',
    },
  },
  {
    {
      'Pocco81/auto-save.nvim',
      event = 'BufEnter',
      opts = {
        execution_message = {
          message = '',
        },
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        lua_ls = {
          mason = false,
        },
        clangd = {
          mason = false,
        },
      },
    },
  },
}
