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
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/syntastic'
Plug 'yggdroot/indentline'
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
set colorcolumn=80

set mouse=a

" for Plug 'davidhalter/jedi-vim'
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#popup_on_dot = 0

" for Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_general_viewer='evince'
" let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
" let g:vimtex_view_general_options_latexmk = '--unique'
autocmd FileType tex setlocal complete-=i

" for Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]
let g:UltiSnipsUsePythonVersion=3

" for Plug 'vim-scripts/SWIG-syntax'
au BufNewFile,BufRead *.i set filetype=swig

" for Plug 'arnoudbuzing/wolfram-vim'
au BufNewFile,BufRead *.wl set syntax=wl
au BufNewFile,BufRead *.wls set syntax=wl
au BufNewFile,BufRead *.m set syntax=wl

" for Plug 'altercation/vim-colors-solarized'
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

" for Plug 'yggdroot/indentline'
" let g:indentLine_setColors = 0
let g:indentLine_color_term = 239

" for Plug 'scrooloose/syntastic'
set statusline+=%#arningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_python_checkers = ['python', 'pylint']

" Set leader
" let mapleader = "`"

" Maps
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <C-s> :write<cr>

inoremap jk <esc>

cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'


autocmd FileType makefile setlocal noexpandtab
autocmd FileType json setlocal tabstop=2
autocmd FileType json setlocal shiftwidth=2
