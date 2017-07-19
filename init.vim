
set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')

" manager
Plug 'junegunn/vim-plug'
" themes
Plug 'morhetz/gruvbox'
" languages
Plug 'othree/html5.vim'
Plug 'rust-lang/rust.vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'raichoo/purescript-vim'
Plug 'lambdatoast/elm.vim'
" autocompletion
Plug 'Shougo/deoplete.nvim'
Plug 'neomake/neomake'
Plug 'carlitux/deoplete-ternjs', { 'for': 'javascript' }
Plug 'mhartington/nvim-typescript', { 'for': 'typescript' }
Plug 'sebastianmarkow/deoplete-rust', { 'for': 'rust' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'zchee/deoplete-clang', { 'for': 'cpp' }
" ui
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mhinz/vim-signify'
Plug 'vim-airline/vim-airline'


call plug#end()

" deoplete
let g:deoplete#enable_at_startup = 1

" nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

filetype plugin indent on

" line numbers
set number 

" autoread changes from outside
set autoread
" show matching bracer
set showmatch

syntax on

" no annoying buckup
set nobackup
set nowb
set noswapfile
" mapleader
let mapleader = ","

" tabs
set expandtab
set shiftwidth=2
set tabstop=2

"fucking json
au FileType json setl sw=2 sts=2 et

set backspace=indent,eol,start

" theme
set background=dark
colorscheme gruvbox 
command Dark set background=dark
command Light set background=light

" create parent directories when saving to nonexistent file
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

