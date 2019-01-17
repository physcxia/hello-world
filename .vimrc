" .vimrc file
" Author: Xia Chen
"  Email: xiachen1996@foxmail.com

" Manage plugins with vim-plug
call plug#begin('~/.vim/plugged')
Plug 'davidhalter/jedi-vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-latex/vim-latex'
Plug 'WolfgangMehner/c-support'
call plug#end()
" End of vim-plug

syntax on
set encoding=utf-8
set nu
set ruler

set tabstop=4
set shiftwidth=4
set autoindent
set smarttab
set smartindent
set expandtab

set showcmd
set hlsearch
set showmode

" Set leader ;
let mapleader = ";"

" Maps
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <c-s> :write<cr>

inoremap jk <esc>
inoremap <esc> <nop>

autocmd FileType makefile setlocal noexpandtab
autocmd BufNewFile * :write
