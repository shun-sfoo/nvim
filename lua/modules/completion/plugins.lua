local conf = require "modules.completion.config"

local completion = {}

completion['neovim/nvim-lspconfig'] = {
  event = 'BufReadPre',
  config = conf.nvim_lsp,
}

completion["hrsh7th/nvim-compe"] = {
  event = "InsertEnter",
  config = conf.nvim_compe,
}

completion['nvim-telescope/telescope.nvim'] = {
  cmd = 'Telescope',
  config = conf.telescope,
  requires = {
    {'nvim-lua/popup.nvim', opt = true},
    {'nvim-lua/plenary.nvim',opt = true},
    {'nvim-telescope/telescope-fzy-native.nvim',opt = true},
  }
}

return completion
