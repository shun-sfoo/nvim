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
  {
    'm4xshen/hardtime.nvim',
    lazy = false,
    dependencies = { 'MunifTanjim/nui.nvim' },
    opts = {},
  },
}
