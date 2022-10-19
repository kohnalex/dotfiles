local packer_ok, packer = pcall(require, 'packer')
if not packer_ok then return end

packer.startup(function(use)
    -- Very Important
    use 'wbthomason/packer.nvim' -- Packer manages itself
    use 'nvim-treesitter/nvim-treesitter' -- Better highlight

    -- Misc
    use "nvim-lua/plenary.nvim" -- Plugin helper
    use "kyazdani42/nvim-web-devicons" -- Nvim Icons
    use 'catppuccin/nvim' -- Colortheme
    use 'kyazdani42/nvim-tree.lua' -- Nvim Tree

    -- LSP
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'
    use 'jose-elias-alvarez/null-ls.nvim' -- TODO: Setup

    -- Code completion
    use 'saadparwaiz1/cmp_luasnip' -- Snippet Engine. Required by cmp to run
    use 'hrsh7th/nvim-cmp' -- Main plugin
    use 'hrsh7th/cmp-buffer' -- Buffer Completions
    use 'hrsh7th/cmp-path' -- Path Completions
    use 'hrsh7th/cmp-cmdline' -- Cmdline Completions
    use 'hrsh7th/cmp-nvim-lsp' -- LSP Completions
    use 'rafamadriz/friendly-snippets' -- A collection of fine snippets
end)
