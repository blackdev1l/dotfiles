call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'sickill/vim-monokai'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline' 
Plug 'tpope/vim-fugitive' | Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'

call plug#end()

syntax enable
colors monokai

:imap ii <Esc>
let mapleader = ","

" Fast saving
map <Leader>w :w<CR>
imap <Leader>w <ESC>:w<CR>
vmap <Leader>w <ESC><ESC>:w<CR>

" Tabs
set tabstop=4
set softtabstop=4
set expandtab

" show line numbers
set number

" edit vimrc and zshrc
nnoremap <leader>ev :vsp ~/.config/nvim/init.vim<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
