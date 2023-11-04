let g:mapleader = " "
set nocompatible
set termguicolors
colorscheme PaperColor
set background=dark
" File:         PaperColor.vim
" URL:          https://github.com/NLKNguyen/papercolor-theme
let g:airline_theme='deus'
:set number
:set relativenumber
:set scrolloff=8 
filetype on
filetype plugin on
filetype indent on
set autoindent
set copyindent
set smartindent
syntax on
set tabstop=4
set noshowmode
:set shortmess+=F
hi Normal guibg=NONE ctermbg=NONE

" cursor changing
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
set ttimeout
set ttimeoutlen=1
set ttyfast

" netrw
let g:netrw_banner = 0
let g:netrw_winsize = 20
let g:netrw_liststyle = 3
nnoremap <leader>e :Lexplore<CR>

function! NetrwMapping()
endfunction

augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
	nmap <buffer> a %:w<CR>:buffer #<CR>	

endfunction

