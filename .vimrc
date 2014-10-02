set nocompatible
filetype off

"launch neobundle
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#begin(expand('~/.vim/bundle/'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle '5t111111/alt-gtags.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vinarise.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'motemen/git-vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'vim-scripts/slimv.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Townk/vim-autoclose'
call neobundle#end()

" neocomplcache
let g:neocomplcache_enable_at_startup = 1 " launch at starting_up
let g:neocomplcache_dictionary_filetype_lists = {
	\ 'default' : ''
	\ }
"let g:PHP_default_indenting = 1

let g:quickrun_config ={}
let g:quickrun_config._ = {'runner' : 'vimproc'}
let g:quickrun_config.cpp = {
            \ 'command' : 'g++',
            \ 'cmdopt' : '-std=c++11 -Wall'
            \ }

filetype indent plugin on
syntax on

set expandtab
set autoindent
set nostartofline
set backspace=indent,eol,start
set title
set shiftwidth=4
set autowrite
set enc=utf-8
set fencs=iso-2022-jp,iso-2022-jp-3,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8,utf-16
set termencoding=utf-8
set number
set cursorline
set hlsearch
set wildmode=list:full

autocmd FileType asm :set tabstop=4 fileencoding=utf-8 shiftwidth=4
autocmd FileType binary :set nocursorline nonumber
autocmd FileType python :set tabstop=2 fileencoding=utf-8
autocmd FileType ruby :set tabstop=2 shiftwidth=2 fileencoding=utf-8
autocmd FileType java :set fileencoding=utf-8
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" QuickFix
map <C-n> :cn<CR>
map <C-p> :cp<CR>
" alt-gtags.vim
nnoremap <C-h> :AltGtags -f<CR>
nnoremap <C-j> :AltGtags<CR>
nnoremap <C-k> :AltGtags -r<CR>
nnoremap <C-l> :AltGtags -s<CR>
