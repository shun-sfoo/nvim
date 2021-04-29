return require("packer").startup(
  function()
    -- Packer can manage itself as an optional plugin
    use {"wbthomason/packer.nvim", opt = true}
    -- ui
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use {"glepnir/zephyr-nvim"}
    use {
      "glepnir/galaxyline.nvim",
      branch = "main",
      requires = {"kyazdani42/nvim-web-devicons"}
    }
    use {"glepnir/dashboard-nvim"}
    use {"glepnir/indent-guides.nvim", event = "BufRead"}
    -- enhance
    use {
      "lewis6991/gitsigns.nvim",
      requires = {
        "nvim-lua/plenary.nvim"
      }
    }
    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
    }
    use {"hrsh7th/vim-eft"}
    use {"Raimondi/delimitMate", event = "InsertEnter *"}
    use {"mhartington/formatter.nvim"}
    use {"b3nj5m1n/kommentary"}
    use {"glepnir/smartinput.nvim"}
    use {"kyazdani42/nvim-tree.lua"}
    use {"machakann/vim-sandwich"}
    -- LSP and completion
    use {"neovim/nvim-lspconfig"}
    use {"hrsh7th/nvim-compe", event = "InsertEnter *"}
    use {"glepnir/lspsaga.nvim"}
    use {"nvim-lua/lsp_extensions.nvim"}
    use {"hrsh7th/vim-vsnip"}
    use {"hrsh7th/vim-vsnip-integ"}
    use {"liuchengxu/vista.vim"}
    -- markdown preview
    -- osx: brew install glow
    -- archlinux: yay -S glow
    use {"npxbr/glow.nvim"}
    -- highlight color
    use {"norcalli/nvim-colorizer.lua"}
    use {"vimwiki/vimwiki"}
  end
)
