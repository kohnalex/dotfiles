" Imports "{{{
" ---------------------------------------------------------------------
source ~/.config/nvim/plug.vim
source ~/.config/nvim/maps.vim
"}}}
"

" Settings "{{{
" ---------------------------------------------------------------------

" Suche highlighten und schon suchen während man tippt
set hlsearch
set incsearch

" Zeilennummern anzeigen
set nu
set relativenumber

" Syntax highlighting
filetype plugin indent on
syntax on

" Color scheme & style
set bg=dark
colorscheme gruvbox
let g:airline_powerline_fonts=1

" Tabs und co configs
set backspace=indent,eol,start
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Misc
set noerrorbells
set scrolloff=999
set signcolumn=yes
set hidden
set nobackup
set nowritebackup
set exrc

"}}}
