-- 程序流程设计
-- 1.获取查询语句：
-- 执行yis 复制 text-object,从clipboard中拿到值，
-- 去掉查询语句中多余的 空格,- = 等符号
-- 2.异步调用外部查询程序cdict
-- 3.刷新或者创建浮动窗口，将结果填入。

local M = {}
local uv = vim.loop
local api = vim.api

-- 开启的buf id
local buf
-- 开启的win id
local win
-- 要查询的句子
local query_str
-- 查询结果
local results = {}

-- 定义的规则 当 pattern 重复出现 count 次, 用 repl 来取代整个的重复
local rules = {
  eq = { pattern = '=+', count = 2, repl = '' },
  minus = { pattern = '-+', count = 1, repl = '' }, -- + 表示重复一次或多次
  blank = { pattern = '%s+', count = 1, repl = ' ' }, -- %s 转义表示空白字符
}

-- 去除查询句子中的多余字符
local function handle_query(query)
  --  gsub 第二个参数可以传入function去掉多余的字符
  for _, rule in pairs(rules) do
    query = query:gsub(rule.pattern, function(q)
      if #q > rule.count then return rule.repl end
    end)
  end

  return query
end

-- 将visual模式下的字符组合成字符串
local function combine_sentence(start_line, end_line, start_col, end_col)
  local lines = vim.fn.getline(start_line, end_line)
  lines[1] = lines[1]:sub(start_col, #lines[1])
  lines[#lines] = lines[#lines]:sub(1, end_col)
  local result = ''
  for _, v in ipairs(lines) do
    result = result .. v .. ' '
  end
  return result
end

-- 获取text-object(sentence)
local function get_sentence_textobject()
  vim.fn.execute('normal! yis')
  local reg_tbl = vim.fn.getreginfo('"')
  local result = ''
  for _, v in ipairs(reg_tbl.regcontents) do
    result = result .. v
  end
  result = handle_query(result)
  return result
end

-- 获取 visual selection 的位置值,根据这些值得到查询字符串
local function get_visual_selection_sentence()
  local v_start = vim.fn.getpos("'<")
  local line_start = v_start[2]
  local colum_start = v_start[3]
  local v_end = vim.fn.getpos("'>")
  local line_end = v_end[2]
  local column_end = v_end[3]

  local result = combine_sentence(line_start, line_end, colum_start, column_end)
  result = handle_query(result)
  return result
end

local function show()
  -- create buf
  buf = api.nvim_create_buf(false, true)
  -- buffer 隐藏后就清除
  api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

  local width = api.nvim_win_get_width(0)
  local height = api.nvim_win_get_height(0)

  local win_width = math.ceil(width * 0.9)
  local win_height = math.ceil(height * 0.2)
  local col = math.ceil(width / 2 - win_width / 2)
  local row = height - win_height - 2

  local opts = {
    style = 'minimal',
    relative = 'win',
    width = win_width,
    height = win_height,
    row = row,
    col = col,
    border = 'rounded',
  }

  api.nvim_buf_set_lines(buf, 0, -1, false, results)
  win = api.nvim_open_win(buf, false, opts)

  vim.cmd([[au CursorMoved <buffer> ++once lua require"core.translator".close_win() ]])

  -- clear result
  for i, _ in ipairs(results) do
    results[i] = nil
  end
end

function M.close_win() api.nvim_win_close(win, true) end

function M.querySentence(mode)
  if mode == 'visual' then
    query_str = get_visual_selection_sentence()
  elseif mode == 'textobject' then
    query_str = get_sentence_textobject()
  end

  if query_str == '' then return end

  -- Reference: https://github.com/luvit/luv/blob/master/docs.md
  -- Set the current working directory for the sub-process.
  table.insert(results, query_str)
  local args = { query_str }
  local stdout = uv.new_pipe(false)
  local handle
  handle = uv.spawn(
    'translator',
    { args = args, stdio = { nil, stdout, nil } },
    vim.schedule_wrap(function()
      stdout:read_stop()
      stdout:close()
      handle:close()
      show()
    end)
  )

  -- uv.read_start(stream, callback)
  -- stream: userdata for sub-type of uv_stream_t
  -- callback: callable
  -- err: nil or string
  -- data: string or nil

  uv.read_start(stdout, function(_, data)
    if data then
      local res = data:gsub('\n', '')
      table.insert(results, res)
    end
  end)
end

return M
