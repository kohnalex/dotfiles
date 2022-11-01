local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then return end

local cmp_nvim_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_ok then return end

local typescript_ok, typescript = pcall(require, "typescript")
if not typescript_ok then return end

local on_attach = function(client, bufnr)
  require("user.plugins.keymaps").setup_lsp_keymap(client, bufnr)
end

local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig["pyright"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["clangd"].setup({
  cmd = {
    "/Users/alex/Documents/Code/aerofoils/llvm-project/build/bin/clangd",
    "--background-index",
    "--query-driver=/Users/alex/.espressif/tools/xtensa-esp32-elf/esp-2021r1-8.4.0/**/bin/xtensa-esp32-elf-*",
  },
  root_dir = lspconfig.util.root_pattern("build/compile_commands.json", ".git"),
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["sumneko_lua"].setup({
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
  },
})
