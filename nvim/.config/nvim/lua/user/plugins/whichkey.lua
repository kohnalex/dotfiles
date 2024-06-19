local whichkey_ok, whichkey = pcall(require, "which-key")
if not whichkey_ok then return end

local conf = {
  icons = {
    separator = ">",
    group = "·",
  },
}

whichkey.setup(conf)
require("user.plugins.keymaps").setup_default_keymap()
