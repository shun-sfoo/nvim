local icons = require('config/icons')
local found_cmake, cmake = pcall(require, 'cmake-tools')
if not found_cmake then cmake = {
  is_cmake_project = function() return false end,
} end

local c = {
  {
    function()
      local kit = cmake.get_kit()
      return '[' .. (kit or 'No Kit') .. ']'
    end,
    icon = icons.ui.Pencil,
    cond = function() return cmake.is_cmake_project() and cmake.get_kit() end,
    on_click = function(n, mouse)
      if n == 1 then
        if mouse == 'l' then
          vim.cmd('CMakeSelectKit')
        elseif mouse == 'r' then
          vim.cmd('edit CMakeKits.json')
        end
      end
    end,
  },
  {
    function()
      if cmake.has_cmake_preset() then
        local b_preset = cmake.get_build_preset()
        return '[' .. (b_preset or 'No Preset') .. ']'
      else
        local b_type = cmake.get_build_type()
        return '[' .. (b_type or 'No Type') .. ']'
      end
    end,
    icon = icons.ui.List,
    cond = cmake.is_cmake_project,
    on_click = function(n, mouse)
      if n == 1 then
        if mouse == 'l' then
          vim.cmd('CMakeGenerate')
        elseif mouse == 'r' then
          if cmake.has_cmake_preset() then
            vim.cmd('CMakeSelectBuildPreset')
          else
            vim.cmd('CMakeSelectBuildType')
          end
        end
      end
    end,
  },
  {
    function()
      local b_target = cmake.get_build_target()
      return '[' .. (b_target or 'No Build Target') .. ']'
    end,
    icon = icons.ui.Gear,
    cond = cmake.is_cmake_project,
    on_click = function(n, mouse)
      if n == 1 then
        if mouse == 'l' then
          vim.cmd('CMakeBuild')
        elseif mouse == 'r' then
          vim.cmd('CMakeSelectBuildTarget')
        end
      end
    end,
  },
  {
    function() return icons.ui.Debug end,
    cond = cmake.is_cmake_project,
    on_click = function(n, mouse)
      if n == 1 then
        if mouse == 'l' then vim.cmd('CMakeDebug') end
      end
    end,
  },
  {
    function()
      local l_target = cmake.get_launch_target()
      return '[' .. (l_target or 'No Launch Target') .. ']'
    end,
    icon = icons.ui.Run,
    cond = cmake.is_cmake_project,
    on_click = function(n, mouse)
      if n == 1 then
        if mouse == 'l' then
          vim.cmd('CMakeRun')
        elseif mouse == 'r' then
          vim.cmd('CMakeSelectLaunchTarget')
        end
      end
    end,
  },
}

return {
  {
    'nvim-lualine/lualine.nvim',
    opts = function(_, opts)
      if cmake.is_cmake_project then
        for i, _ in ipairs(c) do
          table.insert(opts.sections.lualine_c, c[i])
        end
      end
    end,
  },
}
