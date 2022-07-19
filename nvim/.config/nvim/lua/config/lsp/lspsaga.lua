local M = {}

function M.setup_keymap()
  local whichkey_ok, whichkey = pcall(require, "whichkey")
  if not whichkey_ok then return end

  -- TODO: setup keymap
end

function M.setup()
  local saga_ok, saga = pcall(require, "lspsaga")
  if not saga_ok then return end

  -- TODO: personalized setup
  saga.init_lsp_saga({
    code_action_lightbulb = {
      enable = false,
    },
  })
end

return M
