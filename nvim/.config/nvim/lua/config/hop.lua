local M = {}

local function setup_keymap()
  -- place this in one of your configuration file(s)
  vim.api.nvim_set_keymap('', 'f',
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>"
    , {})
  vim.api.nvim_set_keymap('', 'F',
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>"
    , {})
  vim.api.nvim_set_keymap('', 't',
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>"
    , {})
  vim.api.nvim_set_keymap('', 'T',
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>"
    , {})
  vim.api.nvim_set_keymap('', 's',
    "<cmd>HopWord<cr>"
    , {})
end

function M.setup()
  local hop_ok, hop = pcall(require, 'hop')
  if not hop_ok then return end

  hop.setup {
    key = 'etovxqpdygfblzhckisuran'
  }

  setup_keymap()
end

return M
