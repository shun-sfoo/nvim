local Popup = require('nui.popup')
local Layout = require('nui.layout')
local Menu = require('nui.menu')

local M = {}

local latest_buf_id = nil

function M.delete_buf(bufnr)
  if bufnr ~= nil and vim.api.nvim_buf_is_valid(bufnr) then vim.api.nvim_buf_delete(bufnr, { force = true }) end
end

local build_map = {
  CMake = 'cmake -GNinja -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -B build && cp  build/compile_commands.json compile_commands.json',
  gcc11 = 'g++ -std=c++11 %s -o %s.out && g++ -std=c++11 -O3 -S %s -o %s-debug.s && ./%s.out && echo done',
  gcc17 = 'g++ -std=c++17 %s -o %s.out && g++ -std=c++17 -O3 -S %s -o %s-debug.s && ./%s.out && echo done',
}

local lines = {}

for k, _ in pairs(build_map) do
  table.insert(lines, Menu.item(k))
end

local preview = Popup({
  enter = true,
  border = 'single',
})

local actions = Menu({
  position = 0,
  size = nil,
  border = 'single',
}, {
  lines = lines,
  keymap = {
    focus_next = { 'j', '<Down>', '<Tab>' },
    focus_prev = { 'k', '<Up>', '<S-Tab>' },
    close = { '<Esc>', '<C-c>' },
    submit = { '<CR>', '<Space>' },
  },
  on_change = function(item) vim.api.nvim_buf_set_lines(preview.bufnr, 0, -1, false, { build_map[item.text] }) end,
  on_submit = function(item) M.execute_command(build_map[item.text]) end,
})

function M.split(vertical, bufnr)
  local cmd = vertical and 'vsplit' or 'split'

  vim.cmd(cmd)
  local win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_buf(win, bufnr)
end

function M.resize(vertical, amount)
  local cmd = vertical and 'vertical resize ' or 'resize'
  cmd = cmd .. amount

  vim.cmd(cmd)
end

function get_executes()
  local uv = vim.loop
  local folders = vim.lsp.buf.list_workspace_folders()
  if #folders == 1 then
    local root_dir = folders[1]
    local cfg = root_dir .. '/CMakeLists.txt'

    local fd = assert(uv.fs_open(cfg, 'r', 438))
    local stat = assert(uv.fs_fstat(fd))
    local data = assert(uv.fs_read(fd, stat.size, 0))
    assert(uv.fs_close(fd))
    local t = {}
    ---@diagnostic disable-next-line: param-type-mismatch
    for w in string.gmatch(data, [[add_executable%((%w+)]]) do
      print(w)
      table.insert(t, w)
    end
    print(#t)
    vim.print(t)
    vim.b.extern_runner = t
  end
end

function M.execute_command(command, type)
  -- local full_command = utils.chain_commands({
  --   utils.make_command_from_args('cd', { cwd }),
  --   utils.make_command_from_args(command, args),
  -- })
  -- check if a buffer with the latest id is already open, if it is then
  -- delete it and continue
  M.delete_buf(latest_buf_id)

  get_executes()
  -- create the new buffer
  latest_buf_id = vim.api.nvim_create_buf(false, true)

  -- split the window to create a new buffer and set it to our window
  M.split(false, latest_buf_id)

  -- make the new buffer smaller
  M.resize(false, '-5')

  -- close the buffer when escape is pressed :)
  vim.api.nvim_buf_set_keymap(latest_buf_id, 'n', '<Esc>', ':q<CR>', { noremap = true })

  -- run the command
  vim.fn.termopen(command)

  -- when the buffer is closed, set the latest buf id to nil else there are
  -- some edge cases with the id being sit but a buffer not being open
  local function onDetach(_, _) latest_buf_id = nil end
  vim.api.nvim_buf_attach(latest_buf_id, false, { on_detach = onDetach })
end

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
