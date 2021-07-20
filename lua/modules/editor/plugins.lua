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

-- markdown preview
-- osx: brew install glow
-- archlinux: yay -S glow
editor["npxbr/glow.nvim"] = {}

editor["mhartington/formatter.nvim"] = {
  config = conf.format
}

editor["b3nj5m1n/kommentary"] = {}

editor["blackCauldron7/surround.nvim"] = {
  config = function()
    require "surround".setup {}
  end
}

editor["folke/which-key.nvim"] = {
  config = function()
    require("which-key").setup {}
  end
}

return editor
