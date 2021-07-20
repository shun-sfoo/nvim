local conf = require "modules.completion.config"

local completion = {}

completion["neovim/nvim-lspconfig"] = {
  event = "BufReadPre",
  config = conf.nvim_lsp
}

completion["hrsh7th/nvim-compe"] = {
  event = "InsertEnter",
  config = conf.nvim_compe
}

completion["nvim-telescope/telescope.nvim"] = {
  cmd = "Telescope",
  config = conf.telescope,
  requires = {
    {"nvim-lua/popup.nvim", opt = true},
    {"nvim-lua/plenary.nvim", opt = true},
    {"nvim-telescope/telescope-fzy-native.nvim", opt = true}
  }
}

completion["L3MON4D3/LuaSnip"] = {
  config = function()
    require("luasnip/loaders/from_vscode").load(
      {paths = {"~/.local/share/nvim/site/pack/packer/start/friendly-snippets"}}
    )
  end
}

completion["rafamadriz/friendly-snippets"] = {}

return completion
