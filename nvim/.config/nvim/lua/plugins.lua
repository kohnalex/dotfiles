return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'morhetz/gruvbox'
    use 'cohama/lexima.vim'
    use 'mhinz/vim-signify'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-commentary'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate"
    }
    -- use 'neovim/nvim-lspconfig'
end)
