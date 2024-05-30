return {
  {
    'folke/tokyonight.nvim',
    opts = {
      style = 'storm',
      transparent = true,
      styles = {
        sidebars = 'transparent',
        floats = 'transparent',
      },
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
}
