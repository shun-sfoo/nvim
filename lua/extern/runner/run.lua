local Input = require('nui.input')
-- local event = require("nui.utils.autocmd").event
-- local Layout = require('nui.layout')

local input = Input({
  position = "50%",
  size = {
    width = 20,
  },
  border = {
    style = 'double',
  },
}, {
  prompt = '> ',
  on_close = function() print('1') end,
  on_submit = function(value) print('2') end,
})

input:mount()
