" .vimrc file
" Author: Xia Chen , ThinkPositive0x0
"  Email: xiachen1996@foxmail.com , ThinkPositive0x0@outlook.com


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
" Plug 'lervag/vimtex'
" Plug 'vim-latex/vim-latex'
" Plug 'WolfgangMehner/c-support'
call plug#end()
" End of vim-plug

syntax on
set nocompatible
set encoding=utf-8
set fenc=utf-8      "编码
set nu
set ruler

set tabstop=4
set shiftwidth=4
set autoindent
set smarttab
set smartindent
set expandtab
set showmatch  "显示匹配的括号

set showcmd
set hlsearch   "搜索高亮
set showmode

set mouse=a

let g:tex_flavor='latex'

" Set leader
" let mapleader = "`"

" Maps
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <C-s> :write<cr>

inoremap jk <esc>

cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'


autocmd FileType makefile setlocal noexpandtab

au BufNewFile,BufRead *.py "
\ set tabstop=4   "tab宽度
\ set softtabstop=4 
\ set shiftwidth=4  
\ set textwidth=79  "行最大宽度
\ set expandtab       "tab替换为空格键
\ set autoindent      "自动缩进
\ set fileformat=unix   "保存文件格式

map <F5> :call RunPython()<CR>
func! RunPython()
    exec "W"
    if &filetype == 'python'
        exec "!time python3 %"
    endif
endfunc
