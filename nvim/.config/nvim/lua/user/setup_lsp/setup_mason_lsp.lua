local mason_lsp_ok, mason_lsp = pcall(require, 'mason-lspconfig')
if not mason_lsp_ok then return end

local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_ok then return end

local servers = {
    'tsserver'
}

mason_lsp.setup({
    ensure_installed = servers
})

local on_atatch = function(client, bufnr)
    -- TODO: Setup on attach
end

local lsp_flags = {
    debounce_text_changes = 150 -- default
}

lspconfig['tsserver'].setup {
    on_attach = on_atatch,
    flags = lsp_flags
}
