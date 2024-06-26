local treesitter_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_ok then return end

treesitter.setup({
  incremental_selection = {
    enable = false,
  },
  ensure_installed = {
    "latex",
    "markdown",
    "markdown_inline",
    "jsdoc",
    "rust",
    "typescript",
    "javascript",
    "vue",
    "java",
    "kotlin",
    "python",
    "yaml",
    "lua",
    "fish",
    "bash",
    "tsx",
    "css",
    "scss",
    "html",
    -- Broken...
    -- "dart",
    "dockerfile",
    "c",
    "cpp",
    "prisma",
    "go",
    "hcl",
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
