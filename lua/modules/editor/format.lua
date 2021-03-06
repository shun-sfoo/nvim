local function rustfmt()
  return {
    exe = "rustfmt",
    args = {"--emit=stdout"},
    stdin = true
  }
end

local function lua_format()
  return {
    exe = "luafmt",
    args = {"--indent-count", 2, "--stdin"},
    stdin = true
  }
end

local function go_format()
  return {
    exe = "gofmt",
    args = {vim.api.nvim_buf_get_name(0)},
    stdin = true
  }
end

local function prettier()
  return {
    exe = "prettier",
    args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
    stdin = true
  }
end

return require("formatter").setup(
  {
    logging = false,
    filetype = {
      rust = {rustfmt},
      lua = {lua_format},
      markdown = {prettier},
      vimwiki = {prettier},
      go = {go_format}
    }
  }
)
