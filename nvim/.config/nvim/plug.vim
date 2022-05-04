if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'cohama/lexima.vim'
Plug 'morhetz/gruvbox'

if has("nvim")
    " x86 vs arm64e issues with treesitter
    " Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}      
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

call plug#end()
