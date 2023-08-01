  require'hop'.setup { keys = 'asdfzxcvqwer12345tgb' }

local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('n', 'e', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, {remap=true})

vim.keymap.set('n', 'e', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, {remap=true})
vim.keymap.set('n', 'f', '<CMD>HopAnywhere<CR>')

