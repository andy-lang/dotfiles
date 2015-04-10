" pathogen plugin
"if !has('nvim')
execute pathogen#infect()
"endif
filetype plugin on

set t_RV= ttymouse=xterm2	 "stops that annoying glitch when pressing j on startup

set number			 "add line numbers

"syntax on			 "switch on syntax highlighting

set hlsearch			 "highlight matching search patterns
set incsearch			 "start searching before pressing enter

set scrolloff=5			 "always a certain number of lines above/below current cursor position
set switchbuf=useopen,usetab,newtab

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

" set completeopt=longest,menuone " popup for complete options

set wildmode=longest,full
set wildmenu " visual autocomplete

set autoread			 "automatically reloads files that have been detected as being changed
set autowriteall		 "automatically write on edit, etc
"autocmd TabLeave * :write	 "write on tableave

set suffixes=.o,.bin,.class,.out "suffixes that will be given lower priority in autocomplete
"set iskeyword-=_		 "set underscores to not be part of a word
"set showtabline=2		 "always show tab line

" Sublime Text-style syntax highlighting
syntax enable
"if (!has('nvim'))
    set t_Co=256
    colorscheme Benokai
    set guifont=Monospace:h12
"endif

" settings for extra c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

"""""""""""""""""""""""""""""""""
"""""""""" KEYBINDINGS """"""""""
"""""""""""""""""""""""""""""""""

" gr for previous tab
:map gr :tabprevious<CR>
" gb for bottom of file
:map gb :G<CR>


" <Esc> to remove highlights of most recent search
:nnoremap <esc> :noh<return><esc>

" brace matching if you type {*Enter*
:inoremap {<CR> {<CR>}<Esc>ko
