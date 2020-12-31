" Plugins
call plug#begin()

Plug 'neoclide/coc.nvim'
Plug 'joshdick/onedark.vim'
Plug 'preservim/nerdtree'
Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'davidhalter/jedi'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty'

call plug#end()

" Keyboard fix for backspace if error arises
set backspace=start,indent,eol

" Enable line numbers
set number

" Set colorscheme to One Dark
colo onedark

" Set tabsize to 4
set tabstop=4
set expandtab
set shiftwidth=4

" Lightline config stuff that github page recommended
set laststatus=2

if !has('gui-running')
	set t_Co=256
endif

" Disable internal status like INSERT, VISUAL, etc.
set noshowmode

" Set lightline theme to OneDark to match
let g:lightline = { 'colorscheme': 'onedark' }

" Set NERDTree toggle to <F4> key
nnoremap <F4> :NERDTreeToggle<CR>

" Goto python definition
nmap <silent> gd <Plug>(coc-definition)

" Show docs
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim', 'help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHove')
    endif
endfunction

" Smart rename
nmap <leader>rn <Plug>(coc-rename)

" Tab trigger
inoremap <silent><expr> <TAB> 
        \ pumvisible() ? "\<C-n>" : 
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
