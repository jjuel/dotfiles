call plug#begin('~/.config/nvim/plugged')
" General
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'Townk/vim-autoclose'
Plug 'morhetz/gruvbox'

" Go
Plug 'fatih/vim-go'
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make' }

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" Python
Plug 'deoplete-plugins/deoplete-jedi'
call plug#end()

set number relativenumber
set backspace=indent,eol,start
set t_Co=256
set autoread
set autoindent
set incsearch
set hlsearch
set nocursorcolumn
set nocursorline
set noshowmode
set completeopt-=preview
set tabstop=4
set shiftwidth=4
set noswapfile
set splitbelow
set splitright

syntax on
colorscheme gruvbox
" hi Normal guibg=NONE ctermbg=NONE

" Keybindings
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH. '/bin/gocode'

" Javascript
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2

" Go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goreturns"
let g:go_fmt_autosave = 1

" Python
let g:python3_host_prog = "/usr/bin/python"

" Ale
let g:ale_linters = {
	\'go': ['gometalinter', 'gofmt'],
	\'javascript': ['eslint'],
	\'python': ['flake8']
\}
let g:ale_fixers = {
	\'javascript': ['prettier']
\}
let g:ale_fix_on_save = 1
