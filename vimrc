set nocompatible
set termguicolors
colorscheme PaperColor
set background=dark
" File:         PaperColor.vim
" URL:          https://github.com/NLKNguyen/papercolor-theme
:set number
filetype on
filetype plugin on
filetype indent on
set autoindent
set copyindent
set smartindent
syntax on
set tabstop=4
set showmode

" set background transparent
hi Normal guibg=NONE ctermbg=NONE

" cursor change between modes
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
set ttimeout
set ttimeoutlen=1
set ttyfast
