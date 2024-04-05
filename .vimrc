let g:mapleader = " "	 			" Set <space> as leader key
set nocompatible	 	 			" Disables compatibility with vi - you want this	
set termguicolors    				" Allows terminal to display 24-bit colours
set shell=zsh						" Sets shell to use while using term command

" <---colour scheme--->
" File:         gruvbox-material.vim, autoload/gruvbox_material.vim
" URL:          https://github.com/sainnhe/gruvbox-material
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_foreground = 'mix'
let g:gruvbox_material_better_performance = 1
colorscheme gruvbox-material
set background=dark

hi Normal guibg=NONE ctermbg=NONE	" Sets Vim to be transparent

:set number							" Enables line numbers
:set relativenumber					" Enables relative line numbers by default
:set scrolloff=8					" Minimal number of screen lines to keep above and below the cursor 
filetype on							" Detects file type
filetype plugin on					" Enable loading the plugin files for specific file types
filetype indent on					" Enable loading the indent file for specific file types
set autoindent						" Copy indent from current line when starting a new line
set copyindent						" Makes new line copy whatever characters were used for indenting on the existing line
set smartindent						" Do smart autoindenting when starting a new line
syntax on							" Syntax Highlighting
set tabstop=4						" Number of spaces that a <Tab> in the file counts for
set noshowmode						" If in Insert, Replace or Visual mode put a message on the last line
:set shortmess+=F					" Helps to avoid all the hit-enter prompts + don't give the file info when editing a file

"<---Cursor changing--->
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
set ttimeout
set ttimeoutlen=1
set ttyfast

"<---Autocompletion---> 
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap < <><left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Soft wordwrap
nmap <silent> <leader>lb :set linebreak!<cr> 

" Spell checker
set spell
set spelllang=en_gb

" Toggle spell checker
nmap <silent> <leader>s :set spell!<cr>

" Set spelling errors to be shown with an undercurl
let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m"
hi SpellBad   guisp=red    gui=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE term=underline cterm=undercurl ctermul=red
hi SpellCap   guisp=yellow    gui=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE term=underline cterm=undercurl ctermul=yellow

" VimWiki
" Set vimwiki to only be active on wiki files
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'default', 'ext': 'wiki'}]
let g:vimwiki_global_ext = 0


"<---netrw--->
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

"<---Status Line--->
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
" set statusline+=%5*\ %{&spelllang}\                       "Spellanguage
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
