local telescope_ok, telescope = pcall(require, "telescope")
if not telescope_ok then return end

local actions_ok, actions = pcall(require, "telescope.actions")
if not actions_ok then return end

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      },
    },
  },
})

telescope.load_extension("fzf")

require("user.plugins.keymaps").setup_telescope_keymaps()
