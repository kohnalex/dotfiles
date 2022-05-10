return require('packer').startup(function()
    -- packer manages itseld
    use 'wbthomason/packer.nvim' 

    -- status line
    use 'vim-airline/vim-airline' 
    use 'vim-airline/vim-airline-themes'

    -- colorschemes
    use 'morhetz/gruvbox'

    -- auto closing brackets, spaces, etc.
    use 'cohama/lexima.vim'

    -- git status annotation in buffer
    use 'mhinz/vim-signify'

    -- op git pplugin
    use 'tpope/vim-fugitive'

    -- auto commenting with 'gcc'
    use 'tpope/vim-commentary'

    -- better highlighting and parsing
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate"
    }
    -- use 'neovim/nvim-lspconfig'
end)
