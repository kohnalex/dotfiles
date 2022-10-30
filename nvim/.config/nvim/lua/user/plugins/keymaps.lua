-- Keymaps that are used by plugins go here

local M = {}

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Nvimtree
function M.setup_nvimtree_keymap()
  keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
end

-- LSP
function M.setup_lsp_keymap(client, _)
  -- set keybinds
  keymap("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
  keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
  keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
  keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
  -- keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
  keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts) -- see available code actions
  keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
  keymap("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
  -- keymap("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
  keymap("n", "<C-p>", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
  keymap("n", "<C-n>", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
  keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
  keymap("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side

  if client.name == "tsserver" then
    keymap("n", "<leader>rf", ":TypescriptRenameFile<CR>", opts) -- File renaming
  end
end

-- Telescope
function M.setup_telescope_keymaps()
  keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
  keymap("n", "<leader>fs", ":Telescope live_grep<CR>", opts)
  keymap("n", "<leader>fc", ":Telescope grep_string<CR>", opts)
  keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
  keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
end

-- Hop
function M.setup_hop_keymaps()
  keymap(
    "",
    "f",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
    opts
  )
  keymap(
    "",
    "F",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
    opts
  )
  keymap(
    "",
    "t",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>",
    opts
  )
  keymap(
    "",
    "T",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>",
    opts
  )
  keymap("", "s", "<cmd>HopWord<cr>", opts)
end

return M
