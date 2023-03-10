local M = {}

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Nvimtree
function M.setup_nvimtree_keymap()
  keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
end

-- Code Actions
function M.setup_codeaction_keymap()
  keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts) -- see available code actions
end

-- LSP
function M.setup_lsp_keymap(client, _)
  -- set keybinds
  keymap("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
  keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
  -- keymap("n", "gD", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
  keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts) -- goto definition
  keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
  keymap("n", "<leader>lr", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
  keymap("n", "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
  keymap("n", "<C-p>", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
  keymap("n", "<C-n>", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
  keymap("n", "K", "<cmd>Lspsaga hover_doc ++quiet<CR>", opts) -- show documentation for what is under cursor
  keymap("n", "<leader>o", "<cmd>SymbolsOutline<CR>", opts) -- see outline on right hand side
  keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", opts) -- format code
  keymap("n", "<leader>lS", "<cmd>LspRestart<CR>", opts) -- format code
  keymap("n", "<leader>lI", "<cmd>LspInfo<CR>", opts) -- Client Information

  if client.name == "tsserver" then
    keymap("n", "<leader>rf", ":TypescriptRenameFile<CR>", opts) -- File renaming
  end
end

-- GitSigns
function M.setup_gitsigns_keymap()
  keymap("n", "<leader><C-n>", ":Gitsigns next_hunk<CR>", opts)
  keymap("n", "<leader><C-p>", ":Gitsigns prev_hunk<CR>", opts)
end

-- Telescope
function M.setup_telescope_keymap()
  -- TODO: open in trouble.nvim
  keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
  keymap("n", "<leader>fs", ":Telescope live_grep<CR>", opts)
  keymap("n", "<leader>fc", ":Telescope grep_string<CR>", opts)
  keymap("n", "<leader>fB", ":Telescope buffers<CR>", opts)
  keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
  keymap("n", "<leader>fg", ":Telescope git_status<CR>", opts)
  keymap("n", "<leader>fb", ":Telescope current_buffer_fuzzy_find<CR>", opts)
  keymap("n", "<leader>fr", ":Telescope lsp_references<CR>", opts)
end

-- Trouble
function M.setup_trouble_keymap()
  keymap("n", "<leader>tr", ":Trouble lsp_references<CR>", opts)
end

-- Floaterm
function M.setup_floaterm_keymap()
  keymap("n", "<leader>tt", ":FloatermToggle<CR>", opts)
  keymap("n", "<leader>tc", ":FloatermNew<CR>", opts)
  keymap("n", "<leader>tx", ":FloatermKill<CR>", opts)
  keymap("n", "<leader>tn", ":FloatermNext<CR>", opts)
  keymap("n", "<leader>tp", ":FloatermPrev<CR>", opts)
end

return M
