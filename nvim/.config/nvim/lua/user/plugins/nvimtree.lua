local nvimtree_ok, nvimtree = pcall(require, "nvim-tree")
if not nvimtree_ok then return end

-- recommended settings from documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
  renderer = {
    icons = {
      glyphs = {
        git = {
          deleted = "-",
          ignored = "i",
          renamed = "m",
          staged = "+",
          unmerged = "",
          unstaged = "~",
          untracked = "?",
        },
      },
    },
  },
  update_focused_file = {
    enable = true,
  },
})

-- Load keymap
require("user.plugins.keymaps").setup_nvimtree_keymap()
