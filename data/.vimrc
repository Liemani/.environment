"------------------------------------------------------------
" $VIMRUNTIME/defaults.vim settings

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Avoid side effects when it was already reset.
if &compatible
  set nocompatible
endif

" Do incremental searching when it's possible to timeout.
if has('reltime')
  set incsearch
endif

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
  " Revert with ":syntax off".
  syntax on

  " I like highlighting strings inside C comments.  " Revert with ":unlet c_comment_strings".
  let c_comment_strings=1
endif
"------------------------------------------------------------
" Options

" Will set to interactive for the current session.
" set shellcmdflag=-ic

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

set ruler	" show the cursor position all the time
set showcmd	" display incomplete commands
set wildmenu	" display completion matches in a status line

set ttimeout		" time out for key codes
set ttimeoutlen=100	" wait up to 100ms after Esc for special key

" Show @@@ in the last line if it is truncated.
set display=truncate

" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=1

" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it
" confusing.
set nrformats-=octal

" Indentation
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
" set autoindent

" cindent is better tailored to C-like languages
set autoindent
set cindent " == set cin

" smartindent is more versatile for use with other programming languages
set ignorecase	" make auto completion search including uppercase even you typed only lowercase
set smartcase
set smarttab
" set smartindent " == set si
	" txt 파일에서 ^#을 indent하지 못하게 하는 오류
	" cindent도 마찬가지 오류가 있다.

" Tab
set tabstop=2    " tab size to be displayed
set shiftwidth=2
set expandtab

" set statusline
set laststatus=2

" Display line numbers on the left
set number	" == set nu
" set relativenumber	" == rnu

" syntax highlighting
color desert
" if has ("syntax")
" 	syntax on
" endif
:highlight CursorLine ctermbg=239

set listchars=eol:$,space:_,tab:\|.,trail:_
" "eol", "extends", "precedes"
highlight NonText ctermfg=235
" "nbsp", "space", "tab", "trail"
highlight SpecialKey ctermfg=235
" verbose highlight <highlight group>

set cursorline

set hlsearch

" Functional
set autowrite " Is this work??

" Split
set splitright
set splitbelow

" can move cursor to empty position when block mode
" cons : it select empty space as space character
" set virtualedit=block
"------------------------------------------------------------
" netrw variables

" reference: https://shapeshed.com/vim-netrw/

let g:netrw_banner = 0       " hide banner
let g:netrw_liststyle = 3    " tree style
" let g:netrw_browse_split = 0 " open file in the same window
" let g:netrw_winsize = 50     " open explore with n% of total size
"------------------------------------------------------------
" Key Mappings

cnoremap <C-B> <Left>
cnoremap <C-F> <Right>
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-D> <DEL>

" inoremap <C-B> <Left>
" inoremap <C-F> <Right>
" inoremap <C-A> <Home>
" inoremap <C-E> <End>
" inoremap <C-D> <DEL>

" nnoremap <F1> :Stdheader<CR>  " Automatically mapped by '~/.vim/plugin/stdheader.vim'
" nnoremap <F1> :Stdheader<CR>gg<S-V>}zf
" nnoremap <F1><F1> gg<S-V>}zf
" highlight word on the cursor without scroll
nnoremap <F1> "tyiwbb/\C\<<C-R>t\><CR>
" make vimsession at project root
" nnoremap <F3> :mksession! $repo_local_path/.vimsession<CR>
" make vimsession at private dir
nnoremap <F2> :mksession! $private/.vimsession/$repo_local_name<CR>
" make vimsession with desired name
nnoremap <F2><F2> :mksession! $private/.vimsession/
" load vimrc
nnoremap <F3> :source $environment/data/.vimrc<CR>
" quit
nnoremap <F4> :q<CR>
" quit all buffers without write
nnoremap <F4><F4> <C-W>:qa!<CR>
" reload current window
nnoremap <F5> :e<CR>
" load files to args with desired extension
nnoremap <F6> :args **/*.
" grep last searched item in all the child files and update quickfix list
nnoremap <F7> :cgetexpr systemlist("grep -rn --binary-files=without-match --exclude=tags '<C-R>/'")<CR>
" grep last search in all the argument list
" nnoremap <F7> :vimgrep // ##<CR>
" grep the word on the cursor in the current file
nnoremap <F7><F7> *:vimgrep <C-R><C-W> %<CR>:echo len(getqflist())<CR>
"" replace all "/ to "0
nnoremap <F8> :argdo %s/<C-R>//<C-R>0/ceg<CR>
nnoremap <F8><F8> :argdo %s/<C-R>//<C-R>0/g<CR>
" nnoremap <F6> yiwbb/\<<C-R>"\><CR>
" nnoremap <F6><F6> 0f(byiwbb/\<<C-R>"\><CR>
"" target files to arg list
" nnoremap <F9> :set list!<CR>
"" store grep to @"
nnoremap <F9> :let @t=""<CR> :g/<C-R>//y T<CR>
vnoremap <F9><F9> <ESC>:let @t=""<CR> :'<,'>g/<C-R>//y T<CR>
"" search "/ all arg list
" nnoremap <F10> :set nomodifiable<CR>:set nowrite<CR>
" nnoremap <F10><F10> :set modifiable<CR>:set write<CR>
" nnoremap <F6> ye:vimgrep <C-R>" ##<CR>:copen<CR>
" nnoremap <F6> :args `find . -iname \*.\[hc\] -o -iname \*.\[hc\]pp`<CR>
" nnoremap <F7> /<C-R><C-W><CR>N:vimgrep <C-R><C-W> ##<CR>:copen<CR>

" disable shift-k
nnoremap <S-K> <Nop>
vnoremap <S-K> <Nop>

" disable U
nnoremap U <Nop>

nnoremap <C-H> <C-W><C-H><C-W>\|
nnoremap <C-J> <C-W><C-J><C-W>_
nnoremap <C-K> <C-W><C-K><C-W>_
nnoremap <C-L> <C-W><C-L><C-W>\|

let mapleader=' '
" Without last space in the string ending with ^M, ^J is followed to register
" let @d=':r !date "+\%F \%a" '
" nnoremap <leader>d j0i<C-R>=system('date "+%F %a"')<CR><ESC>k$
" nnoremap <leader>d o<C-R>=substitute(system('date "+%F %a"'), '\n\+$', '', '')<CR><ESC>
nnoremap <leader>g :put =substitute(system('date \"+%F %a\"'), '\n\+$', '', '')<CR>
" add todo comment
" nnoremap <leader>t o// TODO implement<ESC>
nnoremap <leader>t :put ='// TODO implement'<CR>
" copy file path to clipboard
"   realpath of current file
nnoremap <leader>yfp :let @+=fnameescape(expand("%:p"))<CR>
"   realpath of parent
nnoremap <leader>ydp :let @+=fnameescape(expand("%:p:h"))<CR>
"   directory name
nnoremap <leader>ydn :let @+=fnameescape(expand("%:p:h:t"))<CR>
"   file name
nnoremap <leader>yfn :let @+=fnameescape(expand("%:t"))<CR>
" copy motion to clipboard
noremap <leader>y "*y
" copy line to clipboard
nnoremap <leader>yy "*yy
" delete and copy motion to clipboard
noremap <leader>d "*d
" delete and copy line to clipboard
nnoremap <leader>dd "*dd
" fold from cursor to match pair and jump to next function open in c
nnoremap <leader>zf /{<CR>zf%j
" netrw
nnoremap <leader>e :Explore<CR>
" jump to .h file of same name
nnoremap <leader>ee :e %:r.h<CR>
" jump to .cpp file of same name
nnoremap <leader>eee :e %:r.cpp<CR>

" Tab move
" nnoremap GT gT
" nnoremap GG G

" Make possible two button input the same time
" inoremap fj <esc>
" inoremap jf <esc>
"
" nnoremap <C-L> :nohl<CR><C-L>

vnoremap / :norm i//<CR>
vnoremap # :norm i# <CR>
vnoremap ? :norm xx<CR>
vnoremap * :norm i/*A */
"------------------------------------------------------------
" Macros
" jump to top and to next window
" let @g='ggw'
" fold from cursor to match pair and jump to next function open in c
" let @q='][va{zf}'
" let @q=':let @t=''/''/(v%f{%zf/tj'
" let @q=':let @t=''/''/{zf%/tj'
" fold 42header
" let @w=':13,$foldo!'
" copy selection to clipboard
" let @e='"*y'
" copy line to clipboard
" let @r=':let @+=getline(".") '
" copy file path to clipboard
"   realpath of current file
" let @p=':let @+=fnameescape(expand("%:p")) '
"   realpath of parent
" let @h=':let @+=fnameescape(expand("%:p:h")) '
"   file name
" let @n=':let @+=fnameescape(expand("%:t")) '

"command
:command! Removecomments %s/\/\/.*/
:command! Removeemptyspacelines %s/^\s\+$/
:command! Removefollowingnewlines normal GV[]2jD
