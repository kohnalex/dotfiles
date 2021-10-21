" Suche highlighten und schon suchen während man tippt
set hlsearch
set incsearch

" Zeilennummern anzeigen
set nu

" Syntax highlighting
filetype plugin on
syntax on

" Tabs und co configs
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=0 "Verwendet bei '0' den Wert von tabstop

" Font setzen
let g:airline_powerline_fonts = 1

" Plugins Autoloader (:PlugInstall in vim aufrufen)
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

