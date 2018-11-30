set nocompatible
syntax on
set backspace=indent,eol,start
set splitbelow
set splitright
set mouse=a
noremap <ScrollWheelUp> 12<C-Y>
noremap <ScrollWheelDown> 12<C-E>
set ttymouse=sgr
set encoding=utf-8
let mapleader = "\<Space>"
set nu
set colorcolumn=120
set lazyredraw
set ttyfast
set nowrap

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" PEP8
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=119 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" auto reload $MYVIMRC
augroup myvimrc
	au!
	au BufWritePost $MYVIMRC so $MYVIMRC
augroup END

" remap this bullshit
if !exists(":W")
    command W w
endif

if !exists(":Q")
    command Q q
endif

" splits to the bottom and to the right
set splitbelow
set splitright
