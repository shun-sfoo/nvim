local api = vim.api
local jit = jit
local global = {}
local home = os.getenv("HOME")
local path_sep = global.is_windows and '\\' or '/'

function global:load_variables()
  self.is_mac = jit.os == 'OSX'
  self.is_linux = jit.os == 'Linux'
  self.is_windows = jit.os == 'Windows'
  self.vim_path = home..path_sep..'.config'..path_sep..'nvim'
  self.cache_dir = home..path_sep..'.cache'..path_sep..'vim'..path_sep
  self.modules_dir = self.vim_path..path_sep..'modules'
  self.path_sep = path_sep
  self.home = home
end

function global.exists(file)
  local ok, err, code = os.rename(file, file)
  if not ok then
    if code == 13 then
      -- Permission denied, but it exists
      return true
    end
  end
  return ok, err
end

function global.isdir(path)
  return global.exists(path..'/')
end

function global.readAll(file)
  local f = assert(io.open(file, "rb"))
  local content = f:read("*all")
  f:close()
  return content
end

function global.has_key(tbl, idx)
  for index, _ in pairs(tbl) do
    if index == idx then
      return true
    end
  end
  return false
end

function global.has_value(tbl, val)
  for _, value in pairs(tbl) do
    if value == val then
      return true
    end
  end
  return false
end


function global.dump(o)
  if type(o) == 'table' then
    local s = '{ '
    for k, v in pairs(o) do
      if type(k) ~= 'number' then k = '"' .. k .. '"' end
      s = s .. '[' .. k .. '] = ' .. global.dump(v) .. ','
    end
    return s .. '} '
  else
    return tostring(o)
  end
end

function global.bind_option(options)
  for k, v in pairs(options) do
    if v == true or v == false then
      api.nvim_command('set ' .. k)
    else
      api.nvim_command('set ' .. k .. '=' .. v )
    end
  end
end

global:load_variables()

return global
