-- Protected call so we don't error out on first use
ok, packer = pcall(require, 'packer')
if not ok then
    print 'loading packer failed'
    return 
end

-- Have packer use a floating window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    }
}

-- Plugin registration
return require('packer').startup(function()
    -- Packer manages itseld
    use 'wbthomason/packer.nvim' 

    -- Status line
    use 'vim-airline/vim-airline' 
    use 'vim-airline/vim-airline-themes'

    -- Colorschemes
    use 'morhetz/gruvbox'

    -- Auto closing brackets, spaces, etc.
    use 'cohama/lexima.vim'

    -- Git status annotation in buffer
    use 'mhinz/vim-signify'

    -- Tpopes git pplugin
    use 'tpope/vim-fugitive'

    -- Auto commenting with 'gcc'
    use 'tpope/vim-commentary'

    -- Better highlighting and parsing
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate"
    }

    -- Code completion
    use 'hrsh7th/nvim-cmp' -- The completion plugin
    use 'hrsh7th/cmp-buffer' -- Buffer completions
    use 'hrsh7th/cmp-path' -- Path completions
    use 'hrsh7th/cmp-cmdline' -- Cmdline completions
    use 'saadparwaiz1/cmp_luasnip' -- Snippet completions

    use 'L3MON4D3/LuaSnip' -- Snippet Engine. Required by cmp to run.
    use 'rafamadriz/friendly-snippets' -- A collection of fine snippets.

    -- use 'neovim/nvim-lspconfig'
end)
