return require("packer").startup(
  function()
    -- Packer can manage itself as an optional plugin
    use {"wbthomason/packer.nvim", opt = true}
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    -- Color scheme
    use {"glepnir/zephyr-nvim"}
    use {"Raimondi/delimitMate", event = "InsertEnter *"}
    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
    }
    use {"b3nj5m1n/kommentary"}
    use {"mhartington/formatter.nvim"}
    use {
      "glepnir/galaxyline.nvim",
      branch = "main",
      requires = {"kyazdani42/nvim-web-devicons"}
    }
    use {"Akin909/nvim-bufferline.lua", requires = {"kyazdani42/nvim-web-devicons"}}
    use {"mhinz/vim-signify", event = {"BufReadPre *", "BufNewFile *"}}
    -- LSP and completion
    use {"neovim/nvim-lspconfig"}
    use {"hrsh7th/nvim-compe", event = "InsertEnter *"}
    use {"glepnir/indent-guides.nvim", event = "BufRead"}
    use {"glepnir/lspsaga.nvim"}
    use {"hrsh7th/vim-vsnip"}
    use {"hrsh7th/vim-vsnip-integ"}
    use {"glepnir/dashboard-nvim"}
    use {"glepnir/smartinput.nvim"}
  end
)
