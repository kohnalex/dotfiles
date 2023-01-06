local gitsigns_ok, gitsigns = pcall(require, "gitsigns")
if not gitsigns_ok then return end

gitsigns.setup({
  on_attach = function()
    local keymaps = require("user.plugins.keymaps")
    keymaps.setup_gitsigns_keymap()
  end,
})
