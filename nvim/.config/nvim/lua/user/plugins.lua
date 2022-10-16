local packer_ok, packer = pcall(require, 'packer')
if not packer_ok then return end

packer.startup(function(use)
    use 'wbthomason/packer.nvim' -- Packer manages itself
    use 'nvim-treesitter/nvim-treesitter' -- Better highlight
    use 'catppuccin/nvim' -- Colortheme

    -- Code completion
    use 'saadparwaiz1/cmp_luasnip' -- Snippet Engine. Required by cmp to run
    use 'hrsh7th/nvim-cmp' -- Main plugin
    use 'hrsh7th/cmp-buffer' -- Buffer Completions
    use 'hrsh7th/cmp-path' -- Path Completions
    use 'hrsh7th/cmp-cmdline' -- Cmdline Completions
    use 'hrsh7th/cmp-nvim-lsp' -- LSP Completions
    use 'rafamadriz/friendly-snippets' -- A collection of fine snippets
end)
