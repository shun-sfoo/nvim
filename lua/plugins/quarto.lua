return {
  'quarto-dev/quarto-nvim',
  {
    'hrsh7th/nvim-cmp',
    dependencies = { 'jmbuhr/otter.nvim' },
    opts = function(_, opts) table.insert(opts.sources, { name = 'otter' }) end,
  },
}
