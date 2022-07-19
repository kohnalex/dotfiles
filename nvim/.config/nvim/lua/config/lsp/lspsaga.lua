local M = {}

function M.setup()
  local saga_ok, saga = pcall(require, "lspsaga")
  if not saga_ok then return end

  -- TODO: personalized setup
  saga.init_lsp_saga()
end

return M
