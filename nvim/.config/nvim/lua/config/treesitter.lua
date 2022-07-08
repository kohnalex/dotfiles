local M = {}

function M.setup()
  local ok, configs = pcall(require, "nvim-treesitter.configs")
  if not ok then
    print "treesitter is not ok"
    return
  end

  configs.setup {
    ensure_installed = {
      "typescript",
      "javascript",
      "vue",
      "java",
      "python",
      "yaml",
      "lua",
      "fish",
      "bash",
      "tsx",
      "css",
      "scss",
      "html",
      "dockerfile",
      "c",
      "cpp",
      "prisma",
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
      disable = {
        "yaml",
      }
    }
  }

  vim.opt.foldmethod = "expr"
  vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
  vim.opt.foldlevel = 99
end

return M
