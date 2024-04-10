local color_cmd_dark = "colorscheme github_dark"
local color_cmd_light = "colorscheme github_dark"
-- local color_cmd_dark = "colorscheme catppuccin-mocha"
-- local color_cmd_light = "colorscheme catppuccin-frappe"

vim.api.nvim_command(color_cmd_dark)

local ok, automode = pcall(require, "auto-dark-mode")
if not ok then return end

automode.setup({
  update_interval = 5000,
  set_dark_mode = function()
    vim.api.nvim_set_option("background", "dark")
    vim.cmd(color_cmd_dark)
  end,
  set_light_mode = function()
    vim.api.nvim_set_option("background", "light")
    -- vim.cmd("colorscheme PaperColor")
    vim.cmd(color_cmd_light)
  end,
})
automode.init()
