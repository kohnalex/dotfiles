-- Key Mappings
local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

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

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)

-- Move selected line / block of text in visual mode
keymap("x", "K", ":move '<-2<CR>gv-gv", default_opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", default_opts)


-- TODO: Maybe later...

-- Switch buffer
-- Description: We use <Shift-h> and <Shift-j> to navigate between the previous and next buffer
-- keymap("n", "<S-h>", ":bprevious<CR>", default_opts)
-- keymap("n", "<S-l>", ":bnext<CR>", default_opts)

-- Resizing panes
-- Description: Use arrow keys to resize the split window. Currently conflicting with mouse scrolling.
keymap("n", "<S-Right>", ":vertical resize +2<CR>", default_opts)
keymap("n", "<S-Left>", ":vertical resize -2<CR>", default_opts)
keymap("n", "<S-Up>", ":resize -2<CR>", default_opts)
keymap("n", "<S-Down>", ":resize +2<CR>", default_opts)
