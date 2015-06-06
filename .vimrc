" pathogen plugin
call pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on

let mapleader=","

set number			 "add line numbers
set ruler                        "ruler: line number, column no, etc.

set hlsearch			 "highlight matching search patterns
set incsearch			 "start searching before pressing enter
nnoremap <Esc> :noh<return><Esc>

set scrolloff=1			 "always a certain number of lines above/below current cursor position
set switchbuf=useopen,usetab,split "if make shows an error, be sure to open the errors in new split/buffer rather than replacing the current one

" case insensitive searching, unless an upper case char was specified
set ignorecase
set smartcase

set shell=bash			 "set shell to bash
set backspace=2			 "backspace skips over indents, EOL, appends, etc
set wrap linebreak		 "wrap long lines
"set linebreak=on
"set expandtab		         "tabs to spaces

" 4 spaces per indent 
set tabstop=4
set softtabstop=4
set shiftwidth=4

" C-like indentation
set autoindent
set smartindent
set cindent

set wildmenu			 "visual autocomplete
set wildmode=longest,full	 "bash-like autocomplete

set autoread			 "automatically reloads files that have been detected as being changed
set autowrite			 "automatically write on :make, :next, etc

set wildignore=.o,.bin,.class,.out "suffixes to be ignored in autocomplete

" syntax highlighting, suspiciously Sublime Text-like
syntax enable
set t_Co=256
set guifont=Monospace:h12

try
    colorscheme Benokai
catch
endtry

" settings for extra c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

" settings for cross-scope snippets
"try
"	let g:snipMate = {}
"	let g:snipMate.scope_aliases = {}
"	let g:snipMate.scope_aliases['glsl'] = 'c,glsl' " c snippets for OpenGL Shading Language
"endtry

" brace creation
imap {<CR> {<CR>}<Esc>O
" gr for previous tab
map gr gT
" gb for bottom of file
map gb G
" gs to swap two adjacent characters
map gs xph
" 0 jumps to first non-blank character, instead of 'hard' BOL
map 0 ^
" j and k for soft line movement
nmap j gj
nmap k gk

" easier split navigation
nnoremap <C-H> <C-w>h
nnoremap <C-J> <C-w>j
nnoremap <C-K> <C-w>k
nnoremap <C-L> <C-w>l

" do it for terminal too
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" ignore accidental uppercase for W and Q
command! Q q
command! W w
" buffer delete does not delete window
command! Bd bp|bd #
nnoremap <Leader>d :Bd<CR>

" always open new Vim files as tabs, except if vimdiff is used
"autocmd VimEnter * if !&diff | tab all | tabfirst | endif

" function to save session
fu! SaveSess()
    execute 'mksession! %:p:h/Session.vim'
endfunction

" restore session on entry, but only if no other command line arguments & not in diff mode
fu! RestoreSess()
    if filereadable(getcwd() . '/Session.vim') && !&diff && argc() == 0
        execute 'so %:p:h/Session.vim'
    endif
endfunction

"autocmd VimLeave * call SaveSess()
autocmd VimEnter * call RestoreSess()

" reload vimrc on save
autocmd! BufWritePost ~/.vimrc source % 
autocmd! BufWritePost ~/.nvimrc source % 

set shortmess+=A									" ignore warnings if swapfile exists

""" syntax specific
autocmd VimEnter *.txt set spell spelllang=en_au    " spellcheck for txt files
autocmd VimEnter *.snippet set syntax=snippets      " snipmate syntax highlighting


""""" statusline, vim-airline, bufferline """""

" always show statusline
set laststatus=2

let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#bufferline#overwrite_variables = 0
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1	" show buffer number
let g:airline#extensions#whitespace#enabled = 0		" don't show whitespace

"let g:airline_section_c = '%n %t%m'
let g:airline_section_y = '%L'						" show total line count
let g:airline_section_z = '%l,%v'					" show current line

let g:bufferline_echo = 0
autocmd VimEnter *
\ let &statusline='%{bufferline#refresh_status()}'
  \ .bufferline#get_status_string()

"let g:bufferline_active_highlight = 'Statusline'
