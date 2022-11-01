local mason_ok, mason = pcall(require, "mason")
if not mason_ok then return end

local mason_lsp_ok, mason_lsp = pcall(require, "mason-lspconfig")
if not mason_lsp_ok then return end

local mason_nls_ok, mason_nls = pcall(require, "mason-null-ls")
if not mason_nls_ok then return end

mason.setup()

mason_nls.setup({
  ensure_installed = {
    "prettier",
    "flake8",
    "prettierd",
    "stylua",
    "eslint_d",
  },
})

mason_lsp.setup({
  ensure_installed = {
    "tsserver",
    "sumneko_lua",
    "pyright",
  },
})
