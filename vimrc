"
" ~/.vimrc - Vim configuration file
"

set nocompatible

" ----- Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree.git'

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

" TODO: hardcoding these will break if we're dealing with a TTY
set t_Co=256
colorscheme molokai

set wildmenu
set wildmode=longest,full

set ruler
set cursorline

set laststatus=2

set hlsearch
set incsearch

exec "set listchars=tab:\uBB\uB7,trail:\uB7,nbsp:~,extends:$,precedes:$"
set list

" --- Editing
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
map <leader>w :w<cr>

" -- Window Movement
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" ----- Airline
let g:airline_left_sep=''
let g:airline_right_sep=''

