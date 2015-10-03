" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'zeis/vim-kolor'
Plugin 'bling/vim-airline'
Plugin 'kchmck/vim-coffee-script'
Plugin 'junegunn/vim-easy-align'
Plugin 'groenewege/vim-less'
Plugin 'plasticboy/vim-markdown'
Plugin 'sjl/gundo.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ricardovaleriano/vim-github-theme'
Plugin 'scrooloose/syntastic'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/SearchComplete'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'docunext/closetag.vim'
Plugin 'matthewtodd/vim-twilight'
Plugin 'lukerandall/haskellmode-vim'
Plugin 'Shutnik/jshint2.vim'
Plugin 'mintplant/vim-literate-coffeescript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'gkz/vim-ls'
Plugin 'vim-scripts/SyntaxComplete'
Plugin 'digitaltoad/vim-jade'
Plugin 'marijnh/tern_for_vim'
Plugin 'lambdatoast/elm.vim'
Plugin 'raichoo/purescript-vim'

call vundle#end()  
filetype plugin indent on
filetype plugin on
set omnifunc=syntaxcomplete#Complete

let g:syntastic_javascript_checkers = ['jshint']
let g:ycm_path_to_python_interpreter = '/usr/bin/python2'

set backspace=2
set backspace=indent,eol,start

"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'
"let g:UltiSnipsExpandTrigger="<c-tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item 
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"Gundo
map <leader>g :GundoToggle<CR>

"Powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
let g:Powerline_symbols = 'fancy'


" For latex
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'

" Easy align
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)


"Ctags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
set tags=./tags;/

:nmap \o :set paste!<CR>
:nmap j gj
:nmap k gk
:cnoremap <C-a>  <Home>
:cnoremap <C-b>  <Left>
:cnoremap <C-f>  <Right>
:cnoremap <C-d>  <Delete>
:cnoremap <M-b>  <S-Left>
:cnoremap <M-f>  <S-Right>
:cnoremap <M-d>  <S-right><Delete>
:cnoremap <Esc>b <S-Left>
:cnoremap <Esc>f <S-Right>
:cnoremap <Esc>d <S-right><Delete>
:cnoremap <C-g>  <C-c>
:nmap \t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>

set nocompatible

"Encoding
set enc=utf-8



set number
syntax on
set bg=light
"colorscheme kolor
"colorscheme solarized
colorscheme summerfruit256
"colorscheme twilight
"colorscheme molokai
"colorscheme hybrid
"colorscheme wombat256i
"colorscheme proton
"hi Normal          ctermfg=252 ctermbg=none

set wildmode=longest,list,full
set wildmenu

set shiftwidth=2
set tabstop=2
set expandtab
set showcmd                   " Show (partial) command in status line.
set showmatch                 " Show matching brackets.
set ignorecase                " Do case insensitive matching
set smartcase                 " Do smart case matching
set incsearch                 " Incremental search
set hlsearch                  " highlight the search
set hidden                    " Hide buffers when they are abandoned

set ruler                     " show the line number on the bar
set nocompatible              " vim, not vi
set autoindent                " auto/smart indent
set undolevels=1000           " 1000 undos
set updatecount=100           " switch every 100 chars
set complete=.,w,b,u,U,t,i,d  " do lots of scanning on tab completion
set ttyfast                   " we have a fast terminal
set noerrorbells              " No error bells please
set shell=bash
set fileformats=unix
set ff=unix

set t_Co=256
"colorscheme gardener
"
"C
au BufRead *.c set tabstop=4
au BufRead *.c set shiftwidth=4
au BufRead *.h set tabstop=4
au BufRead *.h set shiftwidth=4

"C++
au BufNewFile,BufRead *.hpp setlocal tabstop=4 shiftwidth=4 spell spelllang=en_gb
au BufNewFile,BufRead *.cpp setlocal tabstop=4 shiftwidth=4 spell spelllang=en_gb

"JS
au BufNewFile,BufRead *.js,*.coffee,*.litcoffee,*.jscss setlocal tabstop=4 expandtab softtabstop=2 shiftwidth=2 shiftround 
au bufNewFile,BufRead *.jscss set syntax=javascript
au BufNewFile,BufRead *.json setlocal tabstop=2 shiftwidth=2 expandtab tw=72 spelllang=en_gb
au BufNewFile,BufRead *.scss,*.less,*.jade setlocal tabstop=2 shiftwidth=2 expandtab tw=72 spelllang=en_gb

"HTML
au BufNewFile,BufRead *.html setlocal tabstop=2 shiftwidth=2 expandtab


"Haskell
let g:haddock_browser="/usr/bin/chromium"
au BufNewFile,BufRead *.hs setlocal tabstop=4 expandtab softtabstop=2 shiftwidth=2 shiftround 
au BufNewFile,BufRead *.elm setlocal tabstop=4 expandtab softtabstop=2 shiftwidth=2 shiftround 

"Python:
au BufRead *.py set tabstop=4 shiftwidth=4 expandtab

"HTML:
au BufRead *.html set tabstop=4
au BufRead *.html set shiftwidth=4

"Makefile:
au FileType make set noexpandtab shiftwidth=8 softtabstop=0

filetype plugin indent on                   " Enable filetype detection

" spelling
if v:version >= 700
  " Enable spell check for text files
  autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en_gb tw=72
  autocmd BufNewFile,BufRead sup.compose* setlocal spell spelllang=en_gb
  autocmd BufNewFile,BufRead alot.* setlocal spell spelllang=en_gb tw=72
  autocmd BufNewFile,BufRead *.mkd setlocal spell spelllang=en_gb
  autocmd BufNewFile,BufRead *.md setlocal spell spelllang=en_gb tw=72
  autocmd BufNewFile,BufRead *.tex setlocal spell spelllang=en_gb
  autocmd BufNewFile,BufRead /tmp/evo* setlocal spell spelllang=en_gb tw=72
  " Set a line width for text files
  "autocmd BufNewFile,BufRead *.txt set tw=72
  "autocmd BufNewFile,BufRead *.mkd set tw=72
endif

map <F4> :setlocal spelllang=en_gb<CR>
map <F5> :setlocal spelllang=pl<CR>


" toggle paste mode
nmap <LocalLeader>pp :set paste!<cr>

"Make cursor behave as expected at wrapped lines
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

set mouse=a                   " Enable mouse

set noerrorbells
set visualbell
set t_vb=

" Show me show me show me!
set   ruler
set   title
set   showmode
set   showcmd
set   showmatch    " matching bracket
set   laststatus=2 " show the status line always
" but not all the messages
set   shortmess=atTI
set   ttyscroll=0

" Email/News
" ==========
"
" Clear Empty Lines
map ,cel :%s/^\s\+$//e
map ,cqoq :%s/^>\s\+/> /e
" remove all > On blah... stuff left behind in quoted text - huggie
nmap ,cqmh :g/^\([>*] \)\+On.*wrote:$/d<CR>
" Kill empty quoted lines
nmap ,ceql :g/^\(> \)\{2,}\s*$/d<CR>
nmap ,cqel :%s/^> \s*$//<CR>
"    ,Sl = "squeeze lines"
"    Turn all blocks of empty lines (within current visual)
"    into *one* empty line:
map ,dl :g/^$/,/./-j

" Condense multiple Re:'s
map ,re 1G/^Subject:<CR>:s/\(Re: \)\+/Re: /e<CR>

" Sven's wondeful change subject macro
map ,cs 1G/^Subject: <CR>yypIX-Old-<ESC>-W
  
vmap ,qp    :s/^/> /<CR>

" Mail and News autocommands
" ==========================
  
au BufRead /tmp/mutt* set tw=72
autocmd BufNewFile,BufRead /tmp/mutt* setlocal spell spelllang=pl

au BufRead *TODO set tw=72
autocmd BufNewFile,BufRead *TODO setlocal spell spelllang=pl

au BufRead CMakeLists.txt set tw=0
autocmd BufNewFile,BufRead CMakeLists.txt setlocal nospell

" Remove quoted On blah stuff
" au BufRead ~/.article*,~/tmp/mutt* :normal ,cqmh
" Remove empty quoted lines
"au BufRead /tmp/mutt* :normal ,ceql
" Remove the empty lines after an unquoted On blah stuff
"au BufRead /tmp/mutt* :normal ,db
" Clear empty lines and turn into space to write in
"au BufRead /tmp/mutt* :normal ,cqel
" Remove blocks of empty lines
"au BufRead /tmp/mutt* :normal ,dl
" Remove many Re:'s from the Subject line
"au BufRead /tmp/mutt* :normal ,re


" jshint validation
nnoremap <silent><F2> :JSHint<CR>
inoremap <silent><F2> <C-O>:JSHint<CR>
vnoremap <silent><F2> :JSHint<CR>

" show next jshint error
nnoremap <silent><F3> :lnext<CR>
inoremap <silent><F3> <C-O>:lnext<CR>
vnoremap <silent><F3> :lnext<CR>

set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

set nobackup
set nowritebackup
