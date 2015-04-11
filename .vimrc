" pathogen plugin
execute pathogen#infect()
filetype plugin on

set t_RV= ttymouse=xterm2	 "stops that annoying glitch that deletes 2 lines when pressing j on startup
set number			 "add line numbers
"set showtabline=2		 "always show tab line

set hlsearch			 "highlight matching search patterns
set incsearch			 "start searching before pressing enter

set scrolloff=5			 "always a certain number of lines above/below current cursor position
set switchbuf=useopen,usetab,newtab "if make shows an error, be sure to open the errors in new tabs (rather than replacing the current one)

" case insensitive searching, unless an upper case char was specified 
set ignorecase
set smartcase

set shell=bash			 "set shell to bash
set backspace=2			 "backspace skips over indents, EOL, appends, etc
set wrap			 "wrap long lines
" set expandtab		         "tabs to spaces

" 4 physical spaces per indent 
set tabstop=8
set softtabstop=4
set shiftwidth=4

" C-like indentation
set autoindent
set smartindent
set cindent

set wildmenu			 "visual autocomplete
set wildmode=longest,full	 "bash-like autocomplete

set autoread			 "automatically reloads files that have been detected as being changed
set autowriteall		 "automatically write on edit, :q, :make, etc
"autocmd TabLeave * :write	 "write on tableave
"autocmd BufWritePost ~/.vimrc,~/.nvimrc :tabdo :so $MYVIMRC	 "write on saving vimrc

set wildignore=*.o,*.bin,*.class,*.out "ignore these suffixes completely when expanding
"set suffixes=.o,.bin,.class,.out "suffixes that will be given lower priority in autocomplete

" Sublime Text-style syntax highlighting
syntax enable
set t_Co=256
colorscheme Benokai
set guifont=Monospace:h12

" settings for extra c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

" gr for previous tab
map gr :tabprevious<CR>
" gb for bottom of file
map gb :G<CR>

noremap <Silent> j gj
noremap <Silent> k gk

" <Esc> to remove highlights of most recent search
nnoremap <esc> :noh<return><esc>

" brace matching if you type {*Enter*
inoremap {<CR> {<CR>}<Esc>ko
