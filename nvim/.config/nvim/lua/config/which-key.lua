local M = {}

-- require which-key safely
local ok, whichkey = pcall(require, "which-key")
if not ok then
  print "which-key not ok"
  return
end

function M.setup()
  local conf = {
    window = {
      border = "none", --single, double, shadow, none
      position = "bottom"
    },
    icons = {
      separator = ">",
      group = "·",
    }
  }


  -- TELESCOPE
  local keymap_f = {
    name = "Find",
    f = { "<cmd>lua require('utils.finder').find_files()<cr>", "Files" },
    B = { "<cmd>Telescope buffers<cr>", "Buffers" },
    b = { "<cmd>Telescope file_browser<cr>", "Buffers" },
    h = { "<cmd>Telescope help_tags<cr>", "Help" },
    o = { "<cmd>Telescope oldfiles<cr>", "Old Files" },
    F = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
    c = { "<cmd>Telescope commands<cr>", "Commands" },
    r = { "<cmd>Telescope lsp_references<cr>", "References" },
    n = { "<cmd>Telescope resume<cr>", "Resume" },
    w = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", "Current Buffer" },
  }

  local keymap_g = {
    name = "Git",
    c = { "<cmd>Telescope git_commits<cr>", "Commits" },
    C = { "<cmd>Telescope git_bcommits<cr>", "Buffer Commits" },
    b = { "<cmd>Telescope git_branches<cr>", "Branches" },
    s = { "<cmd>Telescope git_status<cr>", "Status" },
    S = { "<cmd>Telescope git_stash<cr>", "Stash" },
  }

  -- local keymap_p = {
  --   name = "Project",
  --   p = { "<cmd>lua require'telescope'.extensions.project.project{}<cr>", "List" },
  --   s = { "<cmd>Telescope repo list<cr>", "Search" },
  -- }

  -- PANES
  local keymap_space = {
    name = "Buffer",
    h = { "<cmd>wincmd h<cr>", "Switch left" },
    j = { "<cmd>wincmd j<cr>", "Switch down" },
    k = { "<cmd>wincmd k<cr>", "Switch up" },
    l = { "<cmd>wincmd l<cr>", "Switch right" },
    c = { "<cmd>bd!<CR>", "Close" }
  }

  -- DEFAULT
  local opts = {
    mode = "n", -- normal mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer for buffer local mappings
    silent = true, -- use 'silent' when creating keymaps
    noremap = true, -- use 'noremapt' when creating keymaps
    nowait = false, -- use 'nowait' when creating keymaps
  }

  local opts_no_prefix = {
    mode = "n", -- normal mode
    buffer = nil, -- Global mappings. Specify a buffer for buffer local mappings
    silent = true, -- use 'silent' when creating keymaps
    noremap = true, -- use 'noremapt' when creating keymaps
    nowait = false, -- use 'nowait' when creating keymaps
  }

  local keymap_no_prefix = {
    ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
  }

  local keymap = {
    e = { "<cmd> NvimTreeFocus <CR>", "focus nvimtree" },
    -- p = keymap_p,
    f = keymap_f,
    g = keymap_g,
    ["<space>"] = keymap_space,
  }

  whichkey.setup(conf)
  whichkey.register(keymap, opts)
  whichkey.register(keymap_no_prefix, opts_no_prefix)
end

return M
