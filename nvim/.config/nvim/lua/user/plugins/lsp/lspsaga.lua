local lspsaga_ok, lspsaga = pcall(require, "lspsaga")
if not lspsaga_ok then return end

lspsaga.setup({
  move_in_saga = {
    prev = "<C-p>",
    next = "<C-n>",
  },
  finder_action_keys = {
    open = "<CR>",
  },
  definition_action_keys = {
    edit = "<CR>",
  },
  lightbulb = {
    enable = false,
  },
  symbol_in_windbar = {
    enable = false,
  },
  beacon = {
    enable = false,
  },
})
