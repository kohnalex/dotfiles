local configs = require('nvim-treesitter.configs')

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
