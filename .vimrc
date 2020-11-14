call plug#begin()

Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'dense-analysis/ale'
Plug 'davidhalter/jedi'
Plug 'jeetsukumaran/vim-pythonsense'
" Plug 'maralla/completor.vim'
Plug 'luochen1990/rainbow'
Plug 'itchyny/lightline.vim'
" Plug 'kyouryuukunn/completor-necovim'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }

call plug#end()

set backspace=start,indent,eol
set number
colo onedark

set tabstop=4
set expandtab
set shiftwidth=4

"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

set laststatus=2

if !has('gui_running')
    set t_Co=256
endif

set noshowmode

let g:lightline = { 'colorscheme': 'onedark' }
