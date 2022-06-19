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
" Plug 'davidhalter/jedi-vim'

" Julia
Plug 'JuliaEditorSupport/julia-vim'
" Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
" Plug 'roxma/nvim-completion-manager'  " optional

" Tools
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'dense-analysis/ale'
" Plug 'scrooloose/syntastic'
Plug 'ycm-core/YouCompleteMe'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'preservim/nerdcommenter'
Plug 'textlint/textlint'
Plug 'ntpeters/vim-better-whitespace'

" Other Languages
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-scripts/SWIG-syntax'
Plug 'arnoudbuzing/wolfram-vim'
Plug 'pangloss/vim-javascript'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mattn/emmet-vim'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug 'lervag/vimtex'
Plug 'glench/vim-jinja2-syntax'
Plug 'cespare/vim-toml'
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
set colorcolumn=+1

set mouse=a

set cursorline

" set foldenable
" set foldmethod=syntax

" for YouCompleteMe
let g:ycm_key_list_select_completion = ['<C-n>']
let g:ycm_key_list_previous_completion = ['<C-p>']
" let g:ycm_register_as_syntastic_checker = 1
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
" ['same-buffer', 'horizontal-split', 'vertical-split', 'new-tab']
let g:ycm_goto_buffer_command = 'same-buffer'

" for Plug 'davidhalter/jedi-vim'
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#popup_on_dot = 1

" for Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_texcount_custom_arg = '-ch-only -nosum -nosub'
let g:tex_conceal='abdmg'
autocmd FileType tex setlocal complete-=i conceallevel=1 spell spelllang=en_us,cjk formatoptions-=t
au BufNewFile,BufRead *{.sh,.txt} setlocal formatoptions-=t
hi Conceal ctermbg=none
hi SpellBad cterm=underline,bold ctermfg=red

" for Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]
let g:UltiSnipsUsePythonVersion=3

" for Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map='<c-p>'

" for Plug 'vim-scripts/SWIG-syntax'
au BufNewFile,BufRead *.i set filetype=swig

" for Plug 'arnoudbuzing/wolfram-vim'
au BufNewFile,BufRead *.wl set syntax=wl
au BufNewFile,BufRead *.wls set syntax=wl
au BufNewFile,BufRead *.m set syntax=wl

" for Plug 'altercation/vim-colors-solarized'
" let g:solarized_termcolors=256

" for Plug 'yggdroot/indentline'
" let g:indentLine_setColors = 0
let g:indentLine_color_term = 239
let g:indentLine_fileType = ['c', 'cpp', 'python']

" for Plug 'scrooloose/syntastic'
" set statusline+=%#arningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list=1
" let g:syntastic_auto_loc_list=1
" let g:syntastic_loc_list_height=4
" let g:syntastic_check_on_open=1
" let g:syntastic_check_on_wq=0
" let g:syntastic_python_checkers = ['pyflakes', 'flake8', 'pylint']
" let g:syntastic_rst_checkers = ['rstcheck']
" let g:syntastic_tex_checkers = ['chktex']

" for Plug 'dense-analysis/ale'
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:airline#extensions#ale#enabled = 1
let g:ale_fixers = {'python': ['autopep8']}
let g:ale_linters = {'python': ['flake8', 'pylint'], 'tex': ['chktex'], 'cpp': ['g++', 'cppcheck'], 'julia': ['']}
let g:ale_cpp_cc_executable = 'g++'
let g:ale_cpp_cc_options = '-std=c++17 -Wall -fopenmp -I/usr/include/mpich-x86_64'
let g:ale_textlint_use_global = 1
" let g:ale_textlint_options = '--rule textlint-rule-ginger'


highlight ALEWarning ctermfg=DarkMagenta
highlight ALEError ctermfg=Red
augroup ALEProgress
    autocmd!
    autocmd User ALELintPre  hi Statusline ctermfg=darkgrey
    autocmd User ALELintPost hi Statusline ctermfg=NONE
augroup END

" for Plug 'vim-airline/vim-airline-themes'
let g:airline_solarized_bg='dark'
let g:airline_theme='solarized'

" for Plug 'mattn/emmet-vim'
let g:user_emmet_install_global=0
autocmd FileType html,css EmmetInstall

" Julia
" for Plug 'JuliaEditorSupport/julia-vim'
let g:julia_spellcheck_docstrings=1
let g:julia_indent_align_brackets=0
let g:julia_indent_align_funcargs=0

" Set leader
" let mapleader = "`"

" Maps
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <C-s> :write<cr>

" nmap <Enter> o<esc>
" nmap <S-Enter> O<esc>

inoremap jk <esc>

cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'

autocmd FileType makefile setlocal noexpandtab
autocmd FileType html,css,javascript,json,yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType rst setlocal tabstop=3 softtabstop=3 shiftwidth=3 spell spelllang=en_us
autocmd FileType markdown setlocal spell spelllang=en_us
autocmd FileType cpp setlocal commentstring=//\ %s complete-=i

autocmd FileType tex setlocal noimdisable
autocmd FileType julia setlocal textwidth=92 spell spelllang=en_us,cjk
