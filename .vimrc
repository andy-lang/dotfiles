" pathogen plugin
execute pathogen#infect()
filetype plugin on

set t_RV= ttymouse=xterm2	 "stops that annoying glitch that deletes 2 lines when pressing j on startup
set number			 "add line numbers

set hlsearch			 "highlight matching search patterns
set incsearch			 "start searching before pressing enter
nnoremap <Esc> :noh<return><esc>

set scrolloff=1			 "always a certain number of lines above/below current cursor position
set switchbuf=useopen,usetab,newtab "if make shows an error, be sure to open the errors in new tabs (rather than replacing the current one)

" case insensitive searching, unless an upper case char was specified 
set ignorecase
set smartcase

set shell=bash			 "set shell to bash
set backspace=2			 "backspace skips over indents, EOL, appends, etc
set wrap			 "wrap long lines
set expandtab		         "tabs to spaces

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
set autowrite			 "automatically write on :make, :next, etc

set suffixes=.o,.bin,.class,.out "suffixes that will be given lower priority in autocomplete

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
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['glsl'] = 'c,glsl' " c snippets for OpenGL Shading Language

" gr for previous tab
map gr :tabprevious<CR>
" gb for bottom of file
map gb G
" gc to swap two adjacent characters
map gc xph
" 0 jumps to first non-blank character
map 0 ^
" j and k for soft line movement
nmap j gj
nmap k gk

" always open new Vim files as tabs, except if vimdiff is used
autocmd VimEnter * if !&diff | tab all | tabfirst | endif

" always save session on exit
fu! SaveSess()
    "execute 'call mkdir(%:p:h/.vim)'
    execute 'mksession! %:p:h/Session.vim'
endfunction

" always restore session on entry
fu! RestoreSess()
if filereadable('Session.vim') && !&diff
    execute 'so %:p:h/Session.vim'
    if bufexists(1)
        for l in range(1, bufnr('$'))
            if bufwinnr(l) == -1
                exec 'sbuffer ' . l
            endif
        endfor
    endif
endif
endfunction

"autocmd VimLeave * call SaveSess()
autocmd VimEnter * call RestoreSess()
" brace matching if you type {*Enter*
inoremap {<CR> {<CR>}<Esc>ko

" command to compare current buffer with saved version
function DiffWithSaved() 
    :w !diff % -
endfunction
com! DiffSaved call DiffWithSaved()

"""""""""""""""""""""""""""""""""""""
"""""""""" syntax specific """"""""""
"""""""""""""""""""""""""""""""""""""
" txt files
autocmd BufRead,BufWrite *.txt set spell spelllang=en_au
