local config = {}

function config.autopairs()
  require("nvim-autopairs").setup()
end

function config.nvim_colorizer()
  require "colorizer".setup {
    css = {rgb_fn = true},
    scss = {rgb_fn = true},
    sass = {rgb_fn = true},
    stylus = {rgb_fn = true},
    vim = {names = true},
    tmux = {names = false},
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    html = {
      mode = "foreground"
    }
  }
end

function config.vim_cursorwod()
  vim.api.nvim_command("augroup user_plugin_cursorword")
  vim.api.nvim_command("autocmd!")
  vim.api.nvim_command("autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0")
  vim.api.nvim_command("autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif")
  vim.api.nvim_command("autocmd InsertEnter * let b:cursorword = 0")
  vim.api.nvim_command("autocmd InsertLeave * let b:cursorword = 1")
  vim.api.nvim_command("augroup END")
end

function config.format()
  require("formatter").setup(
    {
      logging = false,
      filetype = {
        javascript = {
          -- prettier
          function()
            return {
              exe = "prettier",
              args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
              stdin = true
            }
          end
        },
        rust = {
          -- Rustfmt
          function()
            return {
              exe = "rustfmt",
              args = {"--emit=stdout"},
              stdin = true
            }
          end
        },
        lua = {
          -- luafmt
          function()
            return {
              exe = "luafmt",
              args = {"--indent-count", 2, "--stdin"},
              stdin = true
            }
          end
        },
        cpp = {
          -- clang-format
          function()
            return {
              exe = "clang-format",
              args = {},
              stdin = true,
              cwd = vim.fn.expand("%:p:h") -- Run clang-format in cwd of the file.
            }
          end
        }
      }
    }
  )
end

return config
