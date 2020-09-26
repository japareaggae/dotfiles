" init.vim - neovim configuration

""" Searching
set ignorecase
set smartcase

""" Displaying
exec "set listchars=tab:\uBB\uB7,trail:\uB7,nbsp:~,extends:$,precedes:$"
set list
set number

""" Syntax highlighting
if $TERM !~ "^linux.*"
	set termguicolors
	colorscheme base16-tomorrow-night
endif

""" Windows
set statusline=%f%(\ %r%m%)%=%y\ [%l,%c]\ [%p%%]

""" Terminal
set title

""" Messages
set showcmd
set confirm

""" Editing
set tabstop=4
set shiftwidth=4
"set smartindent

""" Reading and writing
set autowrite
set autoread

""" Command line editing
set wildmode=longest,full

""" Keybinds
nmap ,( :tabprevious<CR>
nmap ,) :tabnext<CR>
nmap ,[ ;bprevious<CR>
nmap ,] :bnext<CR>
