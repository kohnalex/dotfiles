-- Keymaps that are used by plugins go here 
-- ->

local M = {}

local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- Nvimtree
function M.setup_nvimtree_keymap()
	keymap("n", "<C-n>", ":NvimTreeToggle<CR>", default_opts)
end

return M
