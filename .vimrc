" Plugin Installation
call plug#begin()

Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jiangmiao/auto-pairs'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'dense-analysis/ale'
Plug 'davidhalter/jedi'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'maralla/completor.vim'
Plug 'luochen1990/rainbow'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
" --- Just another autocomplete engine like completor.vim ---
" Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }

call plug#end()

" Keyboard fix for backspace
set backspace=start,indent,eol

" Enable line numbers
set number

" Set colorscheme to One Dark
colo onedark

" Set default tabspace to 4
set tabstop=4
set expandtab
set shiftwidth=4

" Keymapping for completor.vim
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

" Lightline configuration stuff that the github page said would help
set laststatus=2

if !has('gui_running')
    set t_Co=256
endif

" Disables internal status like INSERT, VISUAL, etc
set noshowmode

" Set lightline theme to One Dark to match
let g:lightline = { 'colorscheme': 'onedark' }

" Allow NERDTree toggling with <F4> key
nnoremap <F4> :NERDTreeToggle<CR>
