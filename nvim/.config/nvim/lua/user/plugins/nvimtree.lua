local nvimtree_ok, nvimtree = pcall(require, "nvim-tree")
if not nvimtree_ok then return end

-- recommended settings from documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup()

require("user.plugins.keymaps").setup_nvimtree_keymap()
