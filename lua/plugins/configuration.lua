return {
  {
    'folke/tokyonight.nvim',
    lazy = true,
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
    { 'Pocco81/auto-save.nvim', event = 'BufEnter', opts = {} },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = {
        'scheme',
      },
    },
  },
  {
    'elkowar/yuck.vim',
    ft = 'yuck',
    init = function()
      vim.g.yuck_align_multiline_strings = 1
      vim.g.yuck_align_subforms = 1
      vim.g.yuck_align_keywords = 0
      -- vim.g.yuck_lisp_indentation = 1
    end,
  },
}
