set nocompatible
filetype off

"launch neobundle
if has('vim_starting')
    set runtimepath+=~/.bundle/neobundle.vim
    call neobundle#rc(expand('~/.bundle'))
endif

"NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'https://github.com/Shougo/neobundle.vim.git'
NeoBundle 'https://github.com/Shougo/unite.vim.git'
NeoBundle 'https://github.com/Shougo/vinarise.git'
NeoBundle 'https://github.com/motemen/git-vim'
NeoBundle 'https://github.com/thinca/vim-quickrun'

" neocomplcache
let g:neocomplcache_enable_at_startup = 1 " launch at starting_up
let g:neocomplcache_dictionary_filetype_lists = {
	\ 'default' : '',
	\ 'scala' : $HOME . '/.vim/dict/scala.dict',
	\ }
let g:PHP_default_indenting = 1

let g:quickrun_config = {
\       "cpp/g++" : {
\               "cmdopt" : "--std=c++11",
\       },
\}

filetype plugin on
filetype indent on
syn on

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

autocmd FileType asm :set tabstop=4 fileencoding=utf-8 shiftwidth=4
autocmd FileType binary :set nocursorline nonumber
autocmd FileType python :set tabstop=2 fileencoding=utf-8 " :let g:pydiction_location = '$HOME/.vim/pydiction/complete-dict' 
autocmd FileType ruby :set tabstop=2 shiftwidth=2 fileencoding=utf-8
autocmd FileType java :set fileencoding=utf-8
autocmd FileType scala :set fileencoding=utf-8
autocmd FileType idc :source $HOME/.vim/syntax/idc.vim
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
let lisp_rainbow = 1

map <C-q> :Gtags
map <C-h> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>
