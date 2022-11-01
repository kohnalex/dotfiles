-- From https://github.com/jayp0521/mason-null-ls.nvim:
-- It's important that you set up the plugins in the following order:
-- 1. mason.nvim
-- 2. null-ls
-- 3. mason-null-ls.nvim

-- From https://github.com/williamboman/mason-lspconfig.nvim
-- It's important that you set up the plugins in the following order:
-- 1. mason.nvim
-- 2. mason-lspconfig.nvim
-- 3. Setup servers via lspconfig

require("user.plugins.lsp.lspsaga")
require("user.plugins.lsp.mason").setup_mason()
require("user.plugins.lsp.nls")
require("user.plugins.lsp.mason").setup_mason_nls()
require("user.plugins.lsp.mason").setup_mason_lsp()
require("user.plugins.lsp.lspconfig")
