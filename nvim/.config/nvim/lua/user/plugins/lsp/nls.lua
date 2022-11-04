local nls_ok, nls = pcall(require, "null-ls")
if not nls_ok then return end

local formatting = nls.builtins.formatting
local diagnostics = nls.builtins.diagnostics
local code_actions = nls.builtins.code_actions

local sources = {
  -- formatting.prettierd,
  -- formatting.prettier,
  formatting.stylua,
  formatting.black.with({ extra_args = { "--fast" } }),
  diagnostics.flake8,
  diagnostics.eslint_d,
  code_actions.gitsigns,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(current_client, bufnr)
  if current_client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({
          filter = function(client)
            --  only use null-ls for formatting instead of lsp server
            return client.name == "null-ls"
          end,
          bufnr = bufnr,
        })
      end,
    })
  end

  if current_client.supports_method("textDocument/codeAction") then
    require("user.plugins.keymaps").setup_codeaction_keymap()
  end
end

nls.setup({
  sources = sources,
  on_attach = on_attach,
  debounce = 150,
})
