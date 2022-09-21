local M = {}

function M.setup()
  local ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
  if not ok then return end

  treesitter_configs.setup {
    incremental_selection = {
      enable = false
    },
    ensure_installed = {
      "jsdoc",
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
end

return M
