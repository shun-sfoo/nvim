local config = {}

function config.nvim_treesitter()
  vim.api.nvim_command("set foldmethod=expr")
  vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")
  require "nvim-treesitter.configs".setup {
    ensure_installed = "maintained",
    highlight = {
      enable = true
    },
    textobjects = {
      select = {
        enable = true,
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner"
        }
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer"
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer"
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer"
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer"
        }
      },
      swap = {
        enable = true,
        swap_next = {["<leader>xp"] = "@parameter.inner"},
        swap_previous = {["<leader>xP"] = "@parameter.inner"}
      },
      lsp_interop = {
        enable = true,
        border = "none",
        peek_definition_code = {
          ["<leader>pf"] = "@function.outer",
          ["<leader>pc"] = "@class.outer"
        }
      }
    }
  }
end

function config.rust_tools()
  vim.cmd [[packadd nvim-lspconfig]]

  local opts = {
    tools = {
      -- rust-tools options
      -- automatically set inlay hints (type hints)
      -- There is an issue due to which the hints are not applied on the first
      -- opened file. For now, write to the file to trigger a reapplication of
      -- the hints or just run :RustSetInlayHints.
      -- default: true
      autoSetHints = true,
      -- whether to show hover actions inside the hover window
      -- this overrides the default hover handler so something like lspsaga.nvim's hover would be overriden by this
      -- default: true
      hover_with_actions = true,
      -- These apply to the default RustRunnables command
      runnables = {
        -- whether to use telescope for selection menu or not
        -- default: true
        use_telescope = true

        -- rest of the opts are forwarded to telescope
      },
      -- These apply to the default RustSetInlayHints command
      inlay_hints = {
        -- wheter to show parameter hints with the inlay hints or not
        -- default: true
        show_parameter_hints = true,
        -- prefix for parameter hints
        -- default: "<-"
        parameter_hints_prefix = "<- ",
        -- prefix for all the other hints (type, chaining)
        -- default: "=>"
        other_hints_prefix = "=> ",
        -- whether to align to the lenght of the longest line in the file
        max_len_align = false,
        -- padding from the left if max_len_align is true
        max_len_align_padding = 1,
        -- whether to align to the extreme right or not
        right_align = false,
        -- padding from the right if right_align is true
        right_align_padding = 7
      },
      hover_actions = {
        -- the border that is used for the hover window
        -- see vim.api.nvim_open_win()
        border = {
          {"???", "FloatBorder"},
          {"???", "FloatBorder"},
          {"???", "FloatBorder"},
          {"???", "FloatBorder"},
          {"???", "FloatBorder"},
          {"???", "FloatBorder"},
          {"???", "FloatBorder"},
          {"???", "FloatBorder"}
        },
        -- whether the hover action window gets automatically focused
        -- default: false
        auto_focus = false
      }
    },
    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {} -- rust-analyer options
  }

  require("rust-tools").setup(opts)
end

return config
