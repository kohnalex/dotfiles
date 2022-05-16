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
      border = "single", --single, double, shadow, none
      position = "bottom"
    }
  }


  -- TELESCOPE
  local keymap_f = {
    name = "Find",
    f = { "<cmd>lua require('utils.finder').find_files()<cr>", "Files" },
    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    h = { "<cmd>Telescope help_tags<cr>", "Help" },
    o = { "<cmd>Telescope oldfiles<cr>", "Old Files" },
    F = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
    c = { "<cmd>Telescope commands<cr>", "Commands" },
    r = { "<cmd>Telescope lsp_references<cr>", "References" },
    w = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", "Current Buffer" },
    g = {
      name = "Git",
      c = { "<cmd>Telescope git_commits<cr>", "Commits" },
      C = { "<cmd>Telescope git_bcommits<cr>", "Buffer Commits" },
      b = { "<cmd>Telescope git_branches<cr>", "Branches" },
      s = { "<cmd>Telescope git_status<cr>", "Status" },
      S = { "<cmd>Telescope git_stash<cr>", "Stash" },
    }
  }

  local keymap_p = {
    name = "Project",
    p = { "<cmd>lua require'telescope'.extensions.project.project{}<cr>", "List" },
    s = { "<cmd>Telescope repo list<cr>", "Search" },
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

  local keymap = {
    ["w"] = { "<cmd>update!<CR>", "Save" },
    ["q"] = { "<cmd>q<CR>", "Quit" },

    b = {
      name = "Buffer",
      c = { "<cmd>bd!<CR>", "Close current buffer" }
    },
    p = keymap_p,
    f = keymap_f,
  }

  whichkey.setup(conf)
  whichkey.register(keymap, opts)
end

return M
