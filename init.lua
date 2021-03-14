vim.api.nvim_command("set clipboard+=unnamedplus")
vim.api.nvim_set_keymap("i", "jk", "<esc>", {nowait = true, noremap = true, silent = true})
vim.api.nvim_command("set list")
vim.api.nvim_command("set tabstop=2")
vim.api.nvim_command("set shiftwidth=2")
vim.api.nvim_command("set softtabstop=-1")
vim.api.nvim_command("set number")
vim.api.nvim_command('set signcolumn="yes"')
vim.api.nvim_command("set et|retab")
vim.o["termguicolors"] = true
vim.o["listchars"] = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←"
vim.o["showcmd"] = false
vim.o["cmdheight"] = 2
vim.o["cmdwinheight"] = 5
vim.o["expandtab"] = true

-- vim.api.nvim_command('set rtp+=~/.local/share/nvim/site/pack/nvim-lspconfig/opt/nvim-lspconfig')
-- leader key
vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", " ", "", {noremap = true})
vim.api.nvim_set_keymap("x", " ", "", {noremap = true})

-- personal function
vim.api.nvim_set_keymap("n", "s", 'col(".")==1?"$":"0"', {expr = true})
vim.api.nvim_set_keymap("v", "s", 'col(".")==1?"$h":"0"', {expr = true})

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  execute "packadd packer.nvim"
end
vim.cmd [[packadd packer.nvim]]

require "lsp"
require "event".load_autocmds()

return require("packer").startup(
  function()
    -- Packer can manage itself as an optional plugin
    use {"wbthomason/packer.nvim", opt = true}

    -- Post-install/update hook with neovim command
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use {"neovim/nvim-lspconfig", event = "BufRead *"}
    use {"glepnir/lspsaga.nvim", config = [[require('config.lspsaga')]]}
    use {"hrsh7th/nvim-compe", opt = true, event = "InsertEnter *", config = [[require('config.compe')]]}
    use {"hrsh7th/vim-vsnip", event = "InsertCharPre", config = [[require('config.vsnip')]]}
    use {"Raimondi/delimitMate", event = "InsertEnter *"}
    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}},
      config = [[require('config.telescope')]]
    }
    use {"mhartington/formatter.nvim", config = [[require('config.format')]]}
    use {"b3nj5m1n/kommentary"}
    use {"glepnir/indent-guides.nvim", event = "BufRead"}
    use {
      "glepnir/galaxyline.nvim",
      branch = "main",
      config = [[require('config.evilline')]],
      requires = {"kyazdani42/nvim-web-devicons"}
    }
    use {"Akin909/nvim-bufferline.lua", requires = {"kyazdani42/nvim-web-devicons"}}
    use {"glepnir/zephyr-nvim", config = vim.cmd [[colorscheme zephyr]]}
    use {"mhinz/vim-signify", event = {"BufReadPre *", "BufNewFile *"}, config = [[require('config.signify')]]}
  end
)
