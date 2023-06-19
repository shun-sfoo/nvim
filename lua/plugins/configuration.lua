return {
  {
    'neovim/nvim-lspconfig',
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- clangd will be automatically installed with mason and loaded with lspconfig
        clangd = {},
        cmake = {},
        rust_analyzer = {},
        bashls = {},
        hls = {
          mason = false,
        },
      },
      autoformat = false,
    },
  },
  {
    'williamboman/mason.nvim',
    opts = {
      ensure_installed = {
        'stylua',
        'clang-format',
        'shellcheck',
        'shfmt',
      },
    },
  },
  {
    'folke/tokyonight.nvim',
    lazy = true,
    opts = { style = 'storm' },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = {
        'bash',
        'html',
        'javascript',
        'json',
        'lua',
        'markdown',
        'markdown_inline',
        'python',
        'query',
        'regex',
        'tsx',
        'typescript',
        'vim',
        'yaml',
        'c',
        'cpp',
        'cmake',
        'dart',
        'diff',
        'gitignore',
        'make',
        'rust',
        'toml',
        'vimdoc',
        'haskell',
      },
    },
  },
  {
    { 'Pocco81/auto-save.nvim', opts = {} },
  },
}
