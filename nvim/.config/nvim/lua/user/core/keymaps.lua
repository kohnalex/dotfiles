-- Key Mappings
local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- Remap leader and local leader to <Space>
keymap("", "<Space>", "<Nop>", default_opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better escape using jk in insert and terminal mode
keymap("t", "jk", "<C-\\><C-n>", default_opts)
keymap("i", "jk", "<esc>", default_opts)

-- Visual line wraps
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_opts)
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_opts)

-- Better indent
keymap("v", "<", "<gv", default_opts)
keymap("v", ">", ">gv", default_opts)

-- Paste over currently selected text without yanking it
keymap("v", "p", '"_dP', default_opts)
keymap("n", "x", '"_x', default_opts)

-- Use +/- to increment/decrement itegers
keymap("n", "+", "<C-a>", default_opts)
keymap("n", "-", "<C-x>", default_opts)

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)

-- Move selected line / block of text in visual mode
keymap("x", "K", ":move '<-2<CR>gv-gv", default_opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", default_opts)

-- Select entire file
keymap("n", "<C-a>", "ggVG", default_opts)

-- Panes
keymap("n", "<leader>sv", "<C-w>v", default_opts) -- Vertical split
keymap("n", "<leader>sh", "<C-w>s", default_opts) -- Horizontal split
keymap("n", "<leader>se", "<C-w>=", default_opts) -- Equalize pane sizes
keymap("n", "<leader>sx", ":close<CR>", default_opts) -- Close pane

-- Tabs
keymap("n", "<leader>to", ":tabnew<CR>", default_opts) -- Open new tab
keymap("n", "<leader>tx", ":tabclose<CR>", default_opts) -- Close tab
keymap("n", "<leader>tn", ":tabn<CR>", default_opts) -- Next tab
keymap("n", "<leader>tp", ":tabp<CR>", default_opts) -- Prev tab

-- Use <Shift-h> and <Shift-l> to navigate between the previous and next buffer. Delete maybe...
keymap("n", "<S-h>", ":bprevious<CR>", default_opts)
keymap("n", "<S-l>", ":bnext<CR>", default_opts)

-- Resizing panes
-- Description: Use arrow keys to resize the split window. Currently conflicting with mouse scrolling.
keymap("n", "<S-Right>", ":vertical resize +2<CR>", default_opts)
keymap("n", "<S-Left>", ":vertical resize -2<CR>", default_opts)
keymap("n", "<S-Up>", ":resize -2<CR>", default_opts)
keymap("n", "<S-Down>", ":resize +2<CR>", default_opts)
