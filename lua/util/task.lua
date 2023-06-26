local Layout = require('nui.layout')
local Popup = require('nui.popup')
local Menu = require('nui.menu')

local M = {}
local H = {}
local latest_buf_id = nil

H.delete_buf = function(bufnr)
  if bufnr ~= nil and vim.api.nvim_buf_is_valid(bufnr) then vim.api.nvim_buf_delete(bufnr, { force = true }) end
end

H.split = function(vertical, bufnr)
  local cmd = vertical and 'vsplit' or 'split'

  vim.cmd(cmd)
  local win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_buf(win, bufnr)
end

H.resize = function(vertical, amount)
  local cmd = vertical and 'vertical resize ' or 'resize'
  cmd = cmd .. amount

  vim.cmd(cmd)
end

H.execute = function(command)
  H.delete_buf(latest_buf_id)

  -- create the new buffer
  latest_buf_id = vim.api.nvim_create_buf(false, true)

  H.split(false, latest_buf_id)

  H.resize(false, '-5')

  vim.api.nvim_buf_set_keymap(latest_buf_id, 'n', '<Esc>', ':q<CR>', { noremap = true })

  vim.fn.termopen(command)

  local function onDetach(_, _) latest_buf_id = nil end
  vim.api.nvim_buf_attach(latest_buf_id, false, { on_detach = onDetach })
end

M.config = {
  tasks = {
    Menu.item('configure', { desc = 'set -DCMAKE_EXPORT_COMPILE_COMMANDS=1 and build folder' }),
    Menu.item('build', { desc = 'cmake --build build' }),
    Menu.item('run', { desc = 'run target' }),
  },
}

M.action = function()
  local preview = Popup({
    enter = true,
    border = 'rounded',
  })

  local actions = Menu({
    position = 0,
    size = nil,
    border = 'rounded',
  }, {
    lines = M.config.tasks,
    keymap = {
      focus_next = { 'j', '<Down>', '<Tab>' },
      focus_prev = { 'k', '<Up>', '<S-Tab>' },
      close = { '<Esc>', '<C-c>' },
      submit = { '<CR>', '<Space>' },
    },

    on_change = function(item) vim.api.nvim_buf_set_lines(preview.bufnr, 0, -1, false, { item.desc }) end,

    on_submit = function(item)
      if item.text == 'configure' then
        H.execute(
          'cmake -GNinja -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -B build && cp build/compile_commands.json compile_commands.json'
        )
      elseif item.text == 'build' then
        H.execute('cmake --build build')
      end
    end,
  })

  local layout = Layout(
    {
      position = '50%',
      size = {
        width = 80,
        height = '60%',
      },
    },
    Layout.Box({
      Layout.Box(preview, { size = '60%' }),
      Layout.Box(actions, { size = '40%' }),
    }, { dir = 'col' })
  )

  layout:mount()
end

return M
