source ~/.vimrc

call plug#begin('~/.vim/plugged')
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
call plug#end()

au BufEnter github.com_*.txt set filetype=markdown
nnoremap <Esc><Esc><Esc> :call firenvim#focus_page()<CR>
:set guifont=Menlo:h14
