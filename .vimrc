set nocompatible               " be iMproved
 filetype off                  " required!

 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()

 Plugin 'VundleVim/Vundle.vim'
 Plugin 'scrooloose/nerdtree'
 Plugin 'scrooloose/nerdcommenter'
 Plugin 'scrooloose/syntastic'
 Plugin 'jiangmiao/auto-pairs'
 Plugin 'godlygeek/csapprox'
 Plugin 'tpope/vim-fugitive'
 Plugin 'gregsexton/gitv'
 Plugin 'airblade/vim-gitgutter'
 Plugin 'mhinz/vim-startify'
 Plugin 'Shougo/neocomplete.vim'
 Plugin 'Shougo/neosnippet'
 Plugin 'Shougo/neosnippet-snippets'
 Plugin 'junegunn/goyo.vim'
 Plugin 'fatih/vim-go'
 Plugin 'kien/ctrlp.vim'
 Plugin 'majutsushi/tagbar'
 Plugin 'tomasr/molokai'
 call vundle#end()

colors molokai

filetype plugin indent on

if has('gui_running')
  set guifont=Terminus
endif

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" Switch syntax highlighting on
syntax enable

" Set to auto read when a file is changed from the outside
set autoread

" fast esc
:imap ii <Esc>

let mapleader = ","

" open a new file
 nnoremap <silent> gn :new<Bar>only<CR>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" easyy to edit reload .vimrc
nmap <leader>V :source $MYVIMRC<cr>
nmap <leader>v :vsp $MYVIMRC<cr>

" switching between buffers, it's flying
nnoremap gb :ls<CR>:b<space>

" Fast saving
map <Leader>w :w<CR>
imap <Leader>w <ESC>:w<CR>
vmap <Leader>w <ESC><ESC>:w<CR>


" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" No annoying sound on errors
set noerrorbells
set novisualbell
set tm=500

set smarttab
set lazyredraw
set number  " show line numbers
" Be smart when using tabs ;)
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set nosmartindent
set wrap
set ruler
set scrolloff=3
set ignorecase
set smartcase
set hlsearch
set incsearch
set cursorline   " highlight current line
set showcmd
set showmatch
set matchtime=1
set autowrite

vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


" Powerline settings
set t_Co=256
let g:Powerline_symbols = 'fancy'
set laststatus=2
set noshowmode

"------------------------------------------------------------------------------
" NERDTree
"------------------------------------------------------------------------------

" General properties
let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.o$', '\.pyc$', '\.php\~$']
let NERDTreeWinSize = 35

" Make sure that when NT root is changed, Vim's pwd is also updated
let NERDTreeChDirMode = 2
let NERDTreeShowLineNumbers = 1
let NERDTreeAutoCenter = 1

imap <F2> <ESC> :NERDTreeToggle<CR>
nmap <F2> :NERDTreeToggle<CR>

"""""""" NEOCOMPLETE + NEOSNIPPET """"""""

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif


""""""""""""""""""""""""""""""""""""""""""""""""""

" Go-Vim
au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap <leader>gc <Plug>(go-coverage)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>ge <Plug>(go-rename)
au FileType go nmap <Leader>gdd <Plug>(go-def-split)

" CtrlP settings
 let g:ctrlp_match_window = 'bottom,order:ttb'
 let g:ctrlp_switch_buffer = 0
 let g:ctrlp_working_path_mode = 0
 let g:ctrlp_map = '<c-p>'

"------------------------------------------------------------------------------
" Fugitive
"------------------------------------------------------------------------------
map ]] ]c
map [[ [c
map <leader>gdi :Gdiff<cr>
map <leader>gst :Gstatus<cr>
map <leader>dup :diffupdate<cr>

nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {  
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }


"------------------------------------------------------------------------------
" Syntastic
"------------------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
