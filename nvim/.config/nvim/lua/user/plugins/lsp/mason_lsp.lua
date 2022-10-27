local mason_lsp_ok, mason_lsp = pcall(require, 'mason-lspconfig')
if not mason_lsp_ok then return end

local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_ok then return end

local cmp_nvim_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_ok then return end

mason_lsp.setup({
    ensure_installed = {
    'tsserver',
    'sumneko_lua',
    'pyright',
    }
})

local on_attach = function(client, bufnr)
		require("user.plugins.keymaps").setup_lsp_keymap(client, bufnr);
    -- TODO: Setup on attach
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

local lsp_flags = {
    debounce_text_changes = 150 -- default
}

lspconfig['pyright'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags
}

lspconfig['tsserver'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags
}


lspconfig['sumneko_lua'].setup {
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
}
