local M = {}

local mason_ok, mason = pcall(require, "mason")
if not mason_ok then return end

local mason_lsp_ok, mason_lsp = pcall(require, "mason-lspconfig")
if not mason_lsp_ok then return end

local mason_nls_ok, mason_nls = pcall(require, "mason-null-ls")
if not mason_nls_ok then return end

function M.setup_mason()
  mason.setup()
end

-- Null-ls
function M.setup_mason_nls()
  mason_nls.setup({
    ensure_installed = {
      "flake8",
      -- "prettierd",
      -- "prettier",
      "stylua",
      "eslint_d",
    },
  })
end

-- LSP
function M.setup_mason_lsp()
  mason_lsp.setup({
    ensure_installed = {
      "tsserver",
      "sumneko_lua",
      "pyright",
    },
  })
end

return M
