call plug#begin('~/.vim/plugged')

Plug 'fatih/molokai'
Plug 'fatih/vim-go'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'scrooloose/nerdtree'

call plug#end()

"=======================================
"===============SETTINGS================

set backspace=indent,eol,start "Makes backspace key more powerful
set t_Co=256
set autoread
set autoindent
set incsearch "Shows the match while typing
set hlsearch "Highlight found searches
set number "Show line numbers
set nocursorcolumn
set nocursorline

colorscheme molokai
syntax on
let g:neocomplete#enable_at_startup = 1
