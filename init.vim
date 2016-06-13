call plug#begin('~/.config/nvim/plugged')

Plug 'fatih/molokai'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Townk/vim-autoclose'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'ekalinin/Dockerfile.vim', {'for' : 'Dockerfile'}
Plug 'vim-ruby/vim-ruby'
Plug 'mattn/emmet-vim'
Plug 'robertmeta/nofrils'

call plug#end()

"=======================================
"===============SETTINGS================

set backspace=indent,eol,start "Makes backspace key more powerful
set t_Co=256
"set background=dark
set autoread
set autoindent
set incsearch "Shows the match while typing
set hlsearch "Highlight found searches
set number "Show line numbers
set nocursorcolumn
set nocursorline
set noshowmode

"colorscheme nofrils-dark
colorscheme molokai
syntax on

nmap <S-Enter> O<esc>
nmap <CR> o<esc>

set completeopt-=preview

"========================================
"================deoplete================
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH. '/bin/gocode'
 
"=======================================
"=================vim-go================
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1
let g:go_goterm_enabled = 1

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_map_mode = { 'mode': 'active', 'passive_filetypes': ['go'] }

"=======================================
"===============NERDTree================
"autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>

"let g:NERDTreeIndicatorMapCustom = {
"  \ "Modified"  : "✹",
"   \ "Staged"    : "✚",
"   \ "Untracked" : "✭",
"   \ "Renamed"   : "➜",
"   \ "Unmerged"  : "═",
"   \ "Deleted"   : "✖",
"   \ "Dirty"     : "✗",
"   \ "Clean"     : "✔︎",
"   \ "Unknown"   : "?"
"   \ }

"=======================================
"===============Airline=================
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
let g:airline_mode_map = {}

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_theme= 'murmur'

"Remove transparency when entering vim
autocmd VimEnter * silent! execute "!osascript -e 'tell application \"System Events\"  to key code 32 using command down'" | redraw!
autocmd VimLeave * silent! execute "!osascript -e 'tell application \"System Events\"  to key code 32 using command down'" | redraw!
