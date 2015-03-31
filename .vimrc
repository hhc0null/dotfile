" vim: set fdm=marker commentstring=:
" neobundle {{{
set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#begin(expand('~/.vim/bundle/'))
endif

" Shougo
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vinarise.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'scrooloose/nerdtree'
" For Programmings 
NeoBundle '5t111111/alt-gtags.vim'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'motemen/git-vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'vim-scripts/Pydiction'
NeoBundle 'vim-scripts/gtags.vim'
NeoBundle 'vim-scripts/armasm.vim'
" Clojure
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'guns/vim-clojure-highlight'
NeoBundle 'tpope/vim-fireplace'
" Scheme
NeoBundle 'aharisu/vim_goshrepl'
" Markdown
NeoBundle 'kannokanno/previm'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'tyru/open-browser.vim'
call neobundle#end()
"}}}

" neocomplcache {{{
" Define startup routines
let g:acp_enableAtStartup = 0 " Disable AutoComplPop
let g:neocomplcache_enable_at_startup = 1 " launch at starting_up
let g:neocomplcache_enable_smart_case = 1 " enable smart case
let g:neocomplcache_enable_camel_case_completion = 1 " enable camel case
let g:neocomplcache_enable_underbar_completion = 1 " enable underbar completion
let g:neocomplcache_min_syntax_length = 3 " this is good at reading assembly.
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*' " defeating for competing with ku.vim

let g:neocomplcache_dictionary_filetype_lists = {
	\ 'default' : ''
	\ }

" Plugin key-mappings.
inoremap <expr><C-g>    neocomplcache#undo_completion()
inoremap <expr><C-l>    neocomplcache#complete_common_string()

" Recomended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplcache#smart_close_popup() . "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS>  neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()
" }}}

" quickrun {{{
let g:quickrun_config ={}
let g:quickrun_config._ = {'runner' : 'vimproc'}
let g:quickrun_config.cpp = {
            \ 'command' : 'g++',
            \ 'cmdopt' : '-std=c++11 -Wall'
            \ }
" }}}

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
set display=uhex
set foldmethod=marker
set matchpairs+=<:>

autocmd FileType asm :set tabstop=4 fileencoding=utf-8 shiftwidth=4
autocmd FileType binary :set nocursorline nonumber
" FileType python {{{
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType python let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'
"}}}
autocmd FileType ruby :set tabstop=2 shiftwidth=2 fileencoding=utf-8
autocmd FileType java :set fileencoding=utf-8
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" QuickFix {{{
map <C-n> :cn<CR>
map <C-p> :cp<CR>
" }}}

" alt-gtags.vim {{{
nnoremap <C-h> :AltGtags -f<CR>
nnoremap <C-j> :AltGtags<CR>
nnoremap <C-k> :AltGtags -r<CR>
nnoremap <C-l> :AltGtags -s<CR>
" }}}

" Previm {{{
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
" }}}
