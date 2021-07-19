local ui = {}
local conf = require('modules.ui.config')

ui["glepnir/zephyr-nvim"] = {
  config = [[vim.cmd('colorscheme zephyr')]]
}
ui["kyazdani42/nvim-tree.lua"] = {
  cmd = {'NvimTreeToggle', 'NvimTreeOpen'},
  requires = 'kyazdani42/nvim-web-devicons'
}

ui["glepnir/galaxyline.nvim"] = {
      branch = "main",
      config = conf.galaxyline,
}

ui['lukas-reineke/indent-blankline.nvim'] = {
  event = 'BufRead',
  branch = 'lua',
  config = conf.indent_blakline
}

ui['lewis6991/gitsigns.nvim'] = {
  event = {'BufRead','BufNewFile'},
  config = conf.gitsigns,
  requires = {'nvim-lua/plenary.nvim',opt=true}
}

return ui
