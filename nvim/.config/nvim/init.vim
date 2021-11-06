" Plugins Autoloader (:PlugInstall in vim aufrufen)
call plug#begin(stdpath('data') . '/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'

call plug#end()

" Suche highlighten und schon suchen während man tippt
set hlsearch
set incsearch

" Zeilennummern anzeigen
set nu
set relativenumber

" Syntax highlighting
filetype plugin on
syntax on

" set bg=light
colorscheme gruvbox 

" Tabs und co configs
set backspace=indent,eol,start
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Misc
set noerrorbells
set scrolloff=8 " Scroll-Offset
set signcolumn=yes

" Font setzen
let g:airline_powerline_fonts = 1

""" TO TRY
" set hidden
" set colorcolumn=80
