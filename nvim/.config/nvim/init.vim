lua require 'init'

" Color scheme & style
let g:dracula_colorterm = 0
set bg=dark
colorscheme dracula
let g:airline_powerline_fonts=1

" Tabs und co configs
set backspace=indent,eol,start

" Misc
filetype plugin indent on

set noerrorbells
set scrolloff=999
set signcolumn=yes
set hidden
set nobackup
set nowritebackup
set exrc

set hlsearch
set incsearch

set nu
set relativenumber

" Neovim
set laststatus=3

" Neovide
set guifont=MesloLGS\ NF
if exists('g:neovide')
  colorscheme papercolor
  set bg=light
else
  colorscheme dracula
endif

