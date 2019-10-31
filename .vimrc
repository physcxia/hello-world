" .vimrc file
" Author: Xia Chen
"  Email: xiachen1996@foxmail.com


" Manage plugins with vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'davidhalter/jedi-vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-scripts/SWIG-syntax'
Plug 'arnoudbuzing/wolfram-vim'
" Plug 'SpaceVim/vim-swig'
" Plug 'vim-latex/vim-latex'
" Plug 'WolfgangMehner/c-support'
call plug#end()
" End of vim-plug

syntax on
set nocompatible
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

set mouse=a

let g:tex_flavor='latex'
let g:vimtex_view_general_viewer='okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]

" Set leader
" let mapleader = "`"

" Maps
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <C-s> :write<cr>

inoremap jk <esc>

cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'

au BufNewFile,BufRead *.i set filetype=swig
au BufNewFile,BufRead *.wl set syntax=wl
au BufNewFile,BufRead *.wls set syntax=wl
au BufNewFile,BufRead *.m set syntax=wl

autocmd FileType makefile setlocal noexpandtab

