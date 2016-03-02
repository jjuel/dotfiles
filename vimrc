call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go'
Plug 'Shougo/neocomplete.vim'

call plug#end()

let g:neocomplete#enable_at_startup = 1

colorscheme molokai
syntax on
set t_Co=256
