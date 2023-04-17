local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then return end

local cmp_nvim_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_ok then return end

local typescript_ok, typescript = pcall(require, "typescript")
if not typescript_ok then return end

local on_attach = function(client, bufnr)
  local keymaps = require("user.plugins.keymaps")
  keymaps.setup_lsp_keymap(client, bufnr)

  -- Highlight LSP Symbols
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
    vim.api.nvim_clear_autocmds({ buffer = bufnr, group = "lsp_document_highlight" })
    vim.api.nvim_create_autocmd("CursorHold", {
      -- vim.api.nvim_create_autocmd("CursorMoved", {
      callback = vim.lsp.buf.document_highlight,
      buffer = bufnr,
      group = "lsp_document_highlight",
      desc = "Document Highlight",
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      callback = vim.lsp.buf.clear_references,
      buffer = bufnr,
      group = "lsp_document_highlight",
      desc = "Clear All the References",
    })
  end
  keymaps.setup_codeaction_keymap()
end

local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig["pyright"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern("venv"),
})

lspconfig["gopls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    gopls = {
      buildFlags = { "-tags=wireinject" },
    },
  },
})

lspconfig["rust_analyzer"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["kotlin_language_server"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- Make clangd to work with esp idf
-- @see https://github.com/espressif/esp-idf/issues/6721
lspconfig["clangd"].setup({
  -- cmd = {
  --   "/Users/alex/Documents/Code/aerofoils/llvm-bin/clangd",
  --   "--background-index",
  --   "--query-driver=/Users/alex/.espressif/tools/xtensa-esp32-elf/esp-2021r1-8.4.0/**/bin/xtensa-esp32-elf-*",
  -- },
  -- root_dir = lspconfig.util.root_pattern("build/compile_commands.json", ".git"),
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})

-- TS looks a bit different because of the used ts plugin
typescript.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
    root_dir = lspconfig.util.root_pattern("package.json", ".git"),
  },
})
