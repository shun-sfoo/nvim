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
      on_colors = function(colors) colors.bg_statusline = colors.none end,
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
