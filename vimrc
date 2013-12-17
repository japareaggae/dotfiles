"
" ~/.vimrc - Vim configuration file
"

" --- General
set nocompatible

set history=500

set mouse=a

set autowrite
set autoread

set noswapfile
set nobackup

set magic

set ignorecase
set smartcase

" --- Appearance
syntax on
if $COLORTERM == 'yes'
	set t_Co=256
	colorscheme molokai
endif

set wildmenu
set ruler
set cursorline

set showmatch

set hlsearch
set incsearch

exec "set listchars=tab:\uBB\uB7,trail:\uB7,nbsp:~"
set list

" --- Editing
filetype plugin indent on
set encoding=utf8
set autoindent
set smarttab
set tabstop=4
set shiftwidth=4

" --- Keybinds
let mapleader=","
let g:mapleader=","
" -- Quick Save
map <leader>w :w<cr>

" -- Window Movement
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
