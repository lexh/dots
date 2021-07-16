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

" edit vimrc
nnoremap <Leader>ve :e $MYVIMRC<CR>

" reload vimrc
nnoremap <Leader>vr :source $MYVIMRC<CR>

" remap this bullshit
command! W w
command! Q q
command! Wq wq
nnoremap Q q
nnoremap q <Nop>
nnoremap q: <Nop>

" toggle spell check
set spell
set nospell
nmap <C-F> :set nospell!<CR>

" highlight color + toggle
hi Search cterm=NONE ctermfg=black ctermbg=yellow
let hlstate=0
set hlsearch
nnoremap <C-N> :if (hlstate == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=1-hlstate<cr>

" system clipboard shortcuts
if system("uname") == "Linux"
  " TODO
elseif system("uname") == "Darwin"
  nmap <C-v> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
  imap <C-v> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
  nmap <C-c> :.w !pbcopy<CR><CR>
  vnoremap <silent> <C-c> :<CR>:let @a=@" \| execute "normal! vgvy" \| let res=system("pbcopy", @") \| let @"=@a<CR>
endif

