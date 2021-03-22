local lspconfig = require "lspconfig"

lspconfig.rust_analyzer.setup(
  {
    settings = {
      ["rust-analyzer"] = {
        assist = {
          importMergeBehavior = "last",
          importPrefix = "by_self"
        },
        cargo = {
          loadOutDirsFromCheck = true
        },
        procMacro = {
          enable = true
        },
        completion = {
          autoimport = {
            enable = true
          }
        }
      }
    }
  }
)
