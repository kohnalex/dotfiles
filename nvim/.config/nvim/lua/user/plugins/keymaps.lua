local M = {}

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Default, no plugin specific keymaps
function M.setup_default_keymap()
  keymap("n", "<leader>bc", ":%bd|e#<CR>", opts) -- Close all buffers except current
end

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
  keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
  keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
  keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts) -- goto definition
  keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
  keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts) -- smart rename
  keymap("n", "<leader>ld", "<cmd>lua vim.diagnostic.open_float()<CR>", opts) -- show  diagnostics for line
  keymap("n", "<C-p>", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts) -- jump to previous diagnostic in buffer
  keymap("n", "<C-n>", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts) -- jump to next diagnostic in buffer
  keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts) -- show documentation for what is under cursor
  keymap("n", "<leader>o", "<cmd>SymbolsOutline<CR>", opts) -- see outline on right hand side
  keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", opts) -- format code
  keymap("n", "<leader>lS", "<cmd>LspRestart<CR>", opts) -- format code
  keymap("n", "<leader>lI", "<cmd>LspInfo<CR>", opts) -- Client Information

  if client.name == "ts_ls" then
    keymap("n", "<leader>rf", ":TypescriptRenameFile<CR>", opts) -- File renaming
  end
end

-- GitSigns
function M.setup_gitsigns_keymap()
  keymap("n", "<leader><C-n>", ":Gitsigns next_hunk<CR>", opts)
  keymap("n", "<leader><C-p>", ":Gitsigns prev_hunk<CR>", opts)
end

-- Toggleterm
function M.setup_term_keymap()
  keymap("n", "<leader><C-j>", ":ToggleTerm<CR>", opts)
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
  keymap("n", "<leader>fp", ":Telescope resume<CR>", opts)
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
