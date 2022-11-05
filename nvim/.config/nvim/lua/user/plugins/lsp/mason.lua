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
      -- Diagnostics
      "flake8",
      "eslint_d",
      -- "prettierd",
      -- "prettier",

      -- Foramtters
      "stylua",
      "black",
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
      "gopls",
    },
  })
end

return M
