vim.api.nvim_command("colorscheme vscode")

local ok, automode = pcall(require, "auto-dark-mode")
if not ok then return end

automode.setup({
  update_interval = 5000,
  set_dark_mode = function()
    vim.api.nvim_set_option("background", "dark")
    vim.cmd("colorscheme vscode")
  end,
  set_light_mode = function()
    vim.api.nvim_set_option("background", "light")
    vim.cmd("colorscheme PaperColor")
  end,
})
automode.init()
