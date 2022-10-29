local treesitter_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_ok then return end

treesitter.setup({
  incremental_selection = {
    enable = false,
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
    },
  },
})
