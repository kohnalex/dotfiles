local term_ok, term = pcall(require, "toggleterm")
if not term_ok then return end

term.setup({})

-- Load keymap
require("user.plugins.keymaps").setup_term_keymap()
