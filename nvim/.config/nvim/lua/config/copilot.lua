local M = { }

function M.setup()
  -- omit any mapping errors
  vim.g.copilot_assume_mapped = true
  vim.g.copilot_enabled = false

  -- vim.g.copilot_no_tab_map = true
  -- vim.api.nvim_set_keymap("i", "<C-@>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
end

return M
