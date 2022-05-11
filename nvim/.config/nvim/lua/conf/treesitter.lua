-- require treesitter safely
local ok, configs = pcall(require, 'nvim-treesitter.configs')
if not ok then
    print 'not ok'
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
-- vim.opt.foldlevel = 99
