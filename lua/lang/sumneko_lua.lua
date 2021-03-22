local lspconfig = require "lspconfig"
local home = os.getenv("HOME")

-- neovim lua
lspconfig.sumneko_lua.setup {
  cmd = {
    home .. "/build/lua-language-server/bin/macOS/lua-language-server",
    "-E",
    home .. "/build/lua-language-server/main.lua"
  },
  settings = {
    Lua = {
      diagnostics = {
        enable = true,
        globals = {"vim"}
      },
      runtime = {version = "LuaJIT"},
      workspace = {
        library = vim.list_extend({[vim.fn.expand("$VIMRUNTIME/lua")] = true}, {})
      }
    }
  }
}
