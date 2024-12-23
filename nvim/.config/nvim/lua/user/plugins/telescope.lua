local telescope_ok, telescope = pcall(require, "telescope")
if not telescope_ok then return end

local actions_ok, actions = pcall(require, "telescope.actions")
if not actions_ok then return end

telescope.setup({
  defaults = {
    layout_strategy = "vertical",
    layout_config = {
      height = 0.95,
      width = 0.95,
    },
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      },
      n = {
        ["t"] = require("trouble.sources.telescope").open_with_trouble,
      },
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown(),
    },
  },
})

telescope.load_extension("fzf")
telescope.load_extension("ui-select")

require("user.plugins.keymaps").setup_telescope_keymap()
