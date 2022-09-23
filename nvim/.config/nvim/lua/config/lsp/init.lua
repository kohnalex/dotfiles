local M = {}

local servers = {
  pyright = {},
  sumneko_lua = {},
  eslint = {},
  jdtls = {},
  volar = {},
  ccls = {},
  -- tailwindcss = {},
  -- tsserver = {},
}

local function on_attach(client, bufnr)
  -- Enable completion triggered by <C-X><C-O>
  -- See `:help omnifunc` and `:help ins-completion` for more information.
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Use LSP as the handler for formatexpr.
  -- See `:help formatexpr` for more information.
  vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

  -- Configure key mappings
  require("config.lsp.keymaps").setup(client, bufnr)

end

local opts = {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
}

local lsp_config = require("lspconfig")
local tsOpts = {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  root_dir = lsp_config.util.root_pattern('package.json');
}

function M.setup()
  require("config.lsp.installer").setup(servers, opts)
  require("config.lsp.installer").setup({ tsserver = {} }, tsOpts)
  require("config.lsp.null-ls").setup(opts)
end

return M
