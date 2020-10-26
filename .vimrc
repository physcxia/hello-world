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
" Themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'yggdroot/indentline'
Plug 'preservim/nerdtree'

" Python
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'davidhalter/jedi-vim'
" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" Tools
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/syntastic'
" Plug 'preservim/nerdcommenter'

" Other Languages
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'lervag/vimtex'
Plug 'vim-scripts/SWIG-syntax'
Plug 'arnoudbuzing/wolfram-vim'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'pangloss/vim-javascript'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mattn/emmet-vim'
" Plug 'vim-latex/vim-latex'
" Plug 'WolfgangMehner/c-support'
call plug#end()
" End of vim-plug

syntax on
syntax enable

" theme
set background=dark
colorscheme solarized

set nocompatible
set encoding=utf-8
set nu
set ruler

set textwidth=79
set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=4
set shiftround
set autoindent
set smarttab
set smartindent

set showcmd
set hlsearch
set showmode
set colorcolumn=80

set mouse=a

" for Plug 'davidhalter/jedi-vim'
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#popup_on_dot = 1

" for Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_general_viewer='zathura'
let g:vimtex_quickfix_mode=0
" let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
" let g:vimtex_view_general_options_latexmk = '--unique'
let g:tex_conceal='abdmg'
autocmd FileType tex setlocal complete-=i conceallevel=2

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
let g:solarized_termcolors=256

" for Plug 'yggdroot/indentline'
" let g:indentLine_setColors = 0
let g:indentLine_color_term = 239
let g:indentLine_fileType = ['c', 'cpp', 'python']

" for Plug 'scrooloose/syntastic'
set statusline+=%#arningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_python_checkers = ['pyflakes', 'flake8', 'pylint']
let g:syntastic_rst_checkers = ['rstcheck']

" for Plug 'vim-airline/vim-airline-themes'
let g:airline_solarized_bg='dark'
let g:airline_theme='solarized'

" for Plug 'mattn/emmet-vim'
let g:user_emmet_install_global=0
autocmd FileType html,css EmmetInstall

" Set leader
" let mapleader = "`"

" Maps
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <C-s> :write<cr>

nmap <Enter> o<esc>
nmap <S-Enter> O<esc>

inoremap jk <esc>

cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'


autocmd FileType makefile setlocal noexpandtab
autocmd FileType html,css,javascript,json,yaml setlocal tabstop=2
autocmd FileType html,css,javascript,json,yaml setlocal shiftwidth=2
autocmd FileType html,css,javascript,json,yaml setlocal softtabstop=2
autocmd FileType rst setlocal tabstop=3 softtabstop=3 shiftwidth=3
autocmd FileType cpp setlocal commentstring=//\ %s
