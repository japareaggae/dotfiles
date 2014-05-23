"
" ~/.vimrc - Vim configuration file
"

set nocompatible

" ----- General
set history=100
set mouse=a
set autowrite
set autoread
set noswapfile
set nobackup
set magic
set ignorecase
set smartcase
set confirm

" ----- Appearance
syntax on

if $TERM == "linux" || $TERM == "screen"
	colorscheme default
else
	set t_Co=256
	colorscheme molokai
endif

set wildmenu
set wildmode=longest,full
set number
set ruler
set cursorline
set laststatus=2
set hlsearch
set incsearch

exec "set listchars=tab:\uBB\uB7,trail:\uB7,nbsp:~,extends:$,precedes:$"
set list

set statusline=%f%(\ %r%m%)%=%y\ [%l,%c]\ [%p%%]

" ----- Editing
filetype plugin indent on
set encoding=utf8
set autoindent
set smarttab
set tabstop=4
set shiftwidth=4

" ----- Keybinds
let mapleader=","
let g:mapleader=","

" -- Quick Save
nmap <Leader>w :w<CR>

" -- Toggle Highlight Search
nmap <Leader>u :set hlsearch!<CR>

" -- Copy-Paste
vmap <Leader>y "+y
vmap <Leader>p "+p

" -- Window Movement
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" -- Hard Mode
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
