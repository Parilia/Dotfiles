let g:mapleader = " "
set nocompatible
set termguicolors
colorscheme PaperColor
set background=dark
" File:         PaperColor.vim
" URL:          https://github.com/NLKNguyen/papercolor-theme
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
set showmode
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
" Tab Between Buffers
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" Status Line
set laststatus=2

set statusline=
"set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
"set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%9*\ col:%03c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.

function! HighlightSearch()
  if &hls
    return 'H'
  else
    return ''
  endif
endfunction

hi User1 guifg=#E6E6E6  guibg=#1f2226
hi User2 guifg=#E6E6E6  guibg=#1B1E21
hi User3 guifg=#E6E6E6  guibg=#1B1E21
hi User4 guifg=#E6E6E6  guibg=#1B1E21
hi User5 guifg=#E6E6E6  guibg=#1B1E21
hi User7 guifg=#ffffff  guibg=#1f2226 gui=bold
hi User8 guifg=#ffffff  
hi User9 guifg=#ffffff  guibg=#810085
hi User0 guifg=#ffffff  guibg=#094afe

