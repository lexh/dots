set nocompatible
syntax on
set backspace=indent,eol,start
set splitbelow
set splitright
set mouse=a
noremap <ScrollWheelUp> 12<C-Y>
noremap <ScrollWheelDown> 12<C-E>
" https://github.com/neovim/neovim/issues/2725
if !has('nvim')
    set ttymouse=sgr
endif
set encoding=utf-8
let mapleader = "\<Space>"
set nu
set colorcolumn=120
set lazyredraw
set ttyfast
set nowrap
set cursorline

" highlight trailing whitespace
let &listchars="tab:\ \ ,trail:\x2e"
set list

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

filetype plugin indent on
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set fileformat=unix

" auto reload $MYVIMRC
augroup myvimrc
    au!
    au BufWritePost $MYVIMRC so $MYVIMRC
    au BufWritePost ~/git/dots/vimrc so $MYVIMRC
augroup END

" remap this bullshit
command! W w
command! Q q
command! Wq wq

" toggle spell check
set spell
set nospell
nmap <C-f> :set nospell!<CR>

" system clipboard shortcuts
if system("uname") == "Linux"
  " TODO
elseif system("uname") == "Darwin"
  nmap <C-v> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
  imap <C-v> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
  nmap <C-c> :.w !pbcopy<CR><CR>
  vnoremap <silent> <C-c> :<CR>:let @a=@" \| execute "normal! vgvy" \| let res=system("pbcopy", @") \| let @"=@a<CR>
endif

