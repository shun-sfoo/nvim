local M = {}
local vim = vim
local api = vim.api
local curl = require('plenary.curl')
local Helper = {}
local buf
local win

-- 1. 去除网页标签，<em/> <br>
-- 2.TODO 关键字高亮显示
Helper.enhance_item = function(handle_str)
  -- 将所有<br> 替换成 /n 便于提取条目
  local str = string.gsub(handle_str, '<br>', '\n')
  -- 所有条目构建成一张表
  local t = {}
  for v in string.gmatch(str, '[^\n]+') do
    -- 处理 <i/>
    -- string.format([[\V\<%s\>]]
    v = string.gsub(v, [[<i>(%d)</i>]], '%1')
    v = string.gsub(v, [[<em><em>(%w+)</em></em>]], '%1')
    table.insert(t, v)
  end
  return t
end

M.search = function()
  local word = vim.fn.expand('<cword>'):lower()

  local url = [[http://apii.dict.cn/mini.php]]
  local query = {}

  query['q'] = word

  local response = curl.get(url, {
    accept = '*/*',
    query = query,
  })

  local response_body = response.body
  local pronounce_reg = [[<span class='p'> %[(.-)%]</span>]]
  local explain_reg = [[<div id="e">(.-)</div>]]
  local sentence_reg = [[<div id="s">(.-)</div>]]

  local pronounce, explain, sentence =
    string.match(response_body, pronounce_reg .. '.-' .. explain_reg .. '.-' .. sentence_reg)

  if pronounce == nil or explain == nil or sentence == nil then
    print(string.format('找不到单词 %s 的释义', word))
    return
  end

  local result = {
    pronounce = pronounce,
    explain = explain,
    sentence = sentence,
  }

  M.create_float_win(result)
end

M.create_float_win = function(res)
  local pronounce = res.pronounce
  local explain = res.explain
  local sentence = res.sentence
  local result = {}

  table.insert(result, pronounce)

  local explain_tbl = Helper.enhance_item(explain)

  for _, v in ipairs(explain_tbl) do
    table.insert(result, v)
  end

  local sentence_tbl = Helper.enhance_item(sentence)

  for _, v in ipairs(sentence_tbl) do
    table.insert(result, v)
  end

  local float_height = 0
  local float_width = 0

  -- 根据最大释义确定长度
  for _, s in ipairs(result) do
    float_height = float_height + 1
    local max_len = string.len(s)
    if float_width < max_len then float_width = max_len end
  end

  -- api.nvim_create_buf(listed: boolean, scratch: boolean)
  buf = api.nvim_create_buf(false, true) -- create new emtpy buffer
  api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

  -- set some options
  local opts = {
    style = 'minimal',
    -- relative = "editor",
    relative = 'cursor',
    width = float_width,
    height = float_height,
    -- 指定为cursor，row 和 col 是cursor pos 的相对位置
    row = 1,
    col = 0,
    border = 'rounded', -- single double rounded solid shadow
    -- noautocmd = false
  }

  -- api.nvim_buf_set_lines(buffer: number, start: number, end_: number, strict_indexing: boolean, replacement: string[])
  api.nvim_buf_set_lines(buf, 0, -1, false, result)

  -- api.nvim_open_win(buffer: number, enter: boolean, config: table<string, any>)
  win = api.nvim_open_win(buf, false, opts)

  -- 移动光标关闭查词窗口
  -- 多次尝试下的解决方案：
  -- 将自动事件 CursorMoved 绑定到当前 buffer 下执行一次，
  -- 当前 buffer并非新创建的buffer
  vim.cmd([[au CursorMoved <buffer> ++once lua require'core.haici'.close_win()]])
end

function M.close_win()
  -- api.nvim_win_close(window: number, force: boolean)
  api.nvim_win_close(win, true)
end

return M
