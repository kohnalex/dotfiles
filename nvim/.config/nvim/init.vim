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

" Syntax highlighting
filetype plugin on
syntax on

colorscheme gruvbox

" Tabs und co configs
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=0 "Verwendet bei '0' den Wert von tabstop

" Font setzen
let g:airline_powerline_fonts = 1


