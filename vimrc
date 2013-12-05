"
" ~/.vimrc - Vim configuration file
" Now slightly more readable!
"

" ----- General Settings
set nocompatible
set mouse=a
set autowrite

" -- dangerous options, only enable if you are a TRAINED PROFESSIONAL
set noswapfile
set nobackup

" ----- Vundle Packages
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" -- list desired bundles here
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'

filetype plugin indent on

" ----- Appearance
syntax on
set ruler
set splitright
set splitbelow

" Highlight the 81st column
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" Show whitespace
exec "set listchars=tab:\uBB\uB7,trail:\uB7,nbsp:~"
set list

" Enable 256 colors - Linux only
if $COLORTERM == 'yes'
	set t_Co=256
	colorscheme molokai
endif

" -- Status Line - TODO
"set statusline=%f

" ----- Editing
set encoding=utf-8
set autoindent
filetype plugin indent on
set tabstop=4

" ----- Keybinds
" -- Cut/Copy/Paste (visual mode)
vmap <C-x> d
vmap <C-c> y
vmap <C-v> p
