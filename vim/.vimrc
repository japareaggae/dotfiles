"
" ~/.vimrc - Vim configuration file
"

set nocompatible

" ----- General
set history=100
set autowrite
set autoread
set noswapfile
set nobackup
set ignorecase
set smartcase
set confirm
set grepprg=grep\ -nH\ $*
set showcmd
set display=truncate
set ttimeout
set ttimeoutlen=100

" ----- Appearance
set background=dark
function! s:is_mosh()
	let output = system("is_mosh -v")
	if v:shell_error
		return 0
	endif
	return !empty(l:output)
endfunction

if (has("termguicolors") && $TERM !~ "^linux.*" && !s:is_mosh())
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
	colorscheme jellybeans
endif
syntax on

set wildmenu
set wildmode=longest,full
set number
set cursorline
set laststatus=2
set hlsearch
set incsearch

exec "set listchars=tab:\uBB\uB7,trail:\uB7,nbsp:~,extends:$,precedes:$"
set list

set statusline=%f%(\ %r%m%)%=%y\ [%l,%c]\ [%p%%]

if has('gui_running')
	set background=dark
	set guioptions-=tT
	set guiheadroom=0
	colorscheme jellybeans
endif

" ----- Editing
filetype plugin indent on
set encoding=utf-8
set autoindent
set smarttab
set tabstop=4
set shiftwidth=4
set backspace=indent,eol,start

" ----- netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0

" ----- Filetypes
" -- Markdown
augroup filetype_markdown
	autocmd!
	autocmd BufNewFile,BufRead *.md set filetype=markdown
	autocmd FileType markdown set colorcolumn=72
augroup END

augroup filetype_gitcommit
	autocmd!
	autocmd FileType gitcommit set colorcolumn=72
augroup END

augroup filetype_python
	autocmd!
	autocmd FileType python set colorcolumn=80
augroup END

augroup filetype_latex
	autocmd!
	autocmd FileType tex set colorcolumn=80
augroup END
let g:tex_flavor='latex'

" ----- Commands
command Mdconv :! cmark % > /tmp/mdout.html

" ----- Keybinds
" -- Quick Save
nmap ,w :w<CR>

" -- Toggle Highlight Search
nmap ,u :set hlsearch!<CR>

" -- Copy-Paste
vmap ,y "+y
vmap ,p "+p

" -- Window Movement
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" -- Tab/Buffer Movement
nmap ,( :tabp<CR>
nmap ,) :tabn<CR>
nmap ,[ :bprevious<CR>
nmap ,] :bnext<CR>

" -- Hard Mode
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
