local conf = require "modules.editor.config"

local editor = {}

editor["windwp/nvim-autopairs"] = {
  config = conf.autopairs
}

editor["norcalli/nvim-colorizer.lua"] = {
  ft = {"html", "css", "sass", "vim", "typescript", "typescriptreact"},
  config = conf.nvim_colorizer
}

editor["itchyny/vim-cursorword"] = {
  event = {"BufReadPre", "BufNewFile"},
  config = conf.vim_cursorwod
}

editor["hrsh7th/vim-eft"] = {}

editor["npxbr/glow.nvim"] = {}

editor["mhartington/formatter.nvim"] = {
  config = conf.format
}
return editor
