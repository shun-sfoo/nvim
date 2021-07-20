local fn = vim.fn
local vim_path = vim.fn.stdpath("config")
local modules_dir = vim_path .. "/lua/modules"

local keybinds = {}

function keybinds:load_keybinds()
  local tmp = vim.split(fn.globpath(modules_dir, "*/keybinds.lua"), "\n")
  local list = {}
  for _, f in ipairs(tmp) do
    list[#list + 1] = f:sub(#modules_dir - 6, -1)
  end

  for _, map in ipairs(list) do
    local repos = require(map:sub(0, #map - 4))
  end
end

return keybinds
