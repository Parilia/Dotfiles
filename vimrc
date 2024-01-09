let g:mapleader = " "
set nocompatible
set termguicolors
set shell=zsh
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
set noshowmode
:set shortmess+=F
hi Normal guibg=NONE ctermbg=NONE

" Cursor changing
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
set ttimeout
set ttimeoutlen=1
set ttyfast

" Autocompletion 
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap < <><left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O



" netrw
let g:netrw_banner = 0
let g:netrw_winsize = 20
let g:netrw_liststyle = 3
nnoremap <silent> <leader>e :Lexplore<CR>

function! NetrwMapping()
endfunction

augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
	nmap <buffer> a %:w<CR>:buffer #<CR>	
	noremap <buffer> <C-l> <C-w>l
endfunction

" Closes netrw when opening a new buffer
autocmd FileType netrw autocmd BufLeave <buffer> if &filetype == 'netrw' | :bd | endif


" Close if final buffer is netrw or the quickfix
augroup finalcountdown
 au!
 autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q|endif
 nmap - :Lexplore<cr>
augroup END

" Tab Between Buffers
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" Status Line
set laststatus=2
let g:currentmode={
       \ 'n'  : 'NORMAL ',
       \ 'v'  : 'VISUAL ',
       \ 'V'  : 'V·Line ',
       \ "\<C-V>" : 'V·Block ',
       \ 'i'  : 'INSERT ',
       \ 'R'  : 'R ',
       \ 'Rv' : 'V·Replace ',
       \ 'c'  : 'Command ',
       \}
set statusline=
set statusline+=\ %{toupper(g:currentmode[mode()])}
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
"set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%9*\ col:%03c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\Buf:%n\ \                   "Modified? Readonly? Buf number

function! HighlightSearch()
  if &hls
    return 'H'
  else
    return ''
  endif
endfunction

hi User1 guifg=#E6E6E6  
hi User2 guifg=#E6E6E6  
hi User3 guifg=#E6E6E6  
hi User4 guifg=#E6E6E6  
hi User5 guifg=#E6E6E6  guibg=#1B1E21
hi User7 guifg=#ffffff  guibg=#1f2226 gui=bold
hi User8 guifg=#ffffff  
hi User9 guifg=#ffffff  
hi User0 guifg=#ffffff  guibg=#094afe

au InsertEnter * hi StatusLine guifg=#48C6D4 guibg=#1B1E21
au InsertLeave * hi StatusLine guifg=#5F8787 guibg=#1B1E21


" Word Processor mode, invoke with :WP
func! WordProcessor()
  " movement changes
  map j gj
  map k gk
  " formatting text
  setlocal formatoptions=1
  setlocal noexpandtab
  setlocal wrap
  setlocal linebreak
  " spelling and thesaurus
  setlocal spell spelllang=en_gb
endfu
com! WP call WordProcessor()



