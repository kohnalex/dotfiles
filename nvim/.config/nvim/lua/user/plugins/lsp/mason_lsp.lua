local mason_lsp_ok, mason_lsp = pcall(require, 'mason-lspconfig')
if not mason_lsp_ok then return end

local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_ok then return end

local servers = {
    'tsserver',
    'sumneko_lua',
}

mason_lsp.setup({
    ensure_installed = servers
})

local on_attach = function(client, bufnr)
    -- TODO: Setup on attach
end

local lsp_flags = {
    debounce_text_changes = 150 -- default
}

lspconfig['tsserver'].setup {
    on_attach = on_attach,
    flags = lsp_flags
}


lspconfig['sumneko_lua'].setup {
    on_attach = on_attach,
    flags = lsp_flags
}
