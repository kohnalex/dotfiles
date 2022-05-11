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

  local opts = {
    mode = "n", -- normal mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer for buffer local mappings
    silent = true, -- use 'silent' when creating keymaps
    noremap = true, -- use 'noremapt' when creating keymaps
    nowait = false, -- use 'nowait' when creating keymaps
  }

  local mappings = {
    ["w"] = { "<cmd>update!<CR>", "Save" },
    ["q"] = { "<cmd>q<CR>", "Quit" },

    b = {
      name = "Buffer",
      c = { "<cmd>bd!<CR>", "Close current buffer" }
    }
  }

  whichkey.setup(conf)
  whichkey.register(mappings, opts)
end

return M
