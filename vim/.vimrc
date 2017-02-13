" Read vim plugins from file
source ~/.vim/plugins.vim

filetype plugin indent on

set shell=/bin/sh

""""""""""""""""""""
" Appearance
""""""""""""""""""""

" Spelling corrections
abbr abrr abbr
abbr fuction function
abbr juint junit
abbr hierarcy hierarchy
abbr pbulic public

" C-like indentation
set autoindent
set smartindent
set cindent

" options to hide sections of the GUI. Mostly for eclim shenanigans
set guioptions-=m
set guioptions-=T
set guioptions-=r

" highlight matching search patterns, start searching before pressing enter
set hlsearch
set incsearch

" case insensitive searching, unless an upper case char was specified
set ignorecase
set smartcase

" add line numbers
set number

"always a certain number of lines above/below current cursor position
set scrolloff=1

" ignore warnings if swapfile exists
set shortmess+=A

" 4 spaces per indent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set shiftround

" visual, bash-like autocomplete
set wildmenu
set wildmode=longest,full

" wrap long lines
set wrap linebreak

" syntax highlighting
syntax enable
let base16colorspace=256
" set t_Co=256
try
	set background=dark
	colorscheme base16-monokai
catch
endtry

" set enc=utf8
set fillchars=vert:\│,fold:-

set foldmethod=syntax
set foldnestmax=1
set nofoldenable

""" Statusline
function! BufNum()
	""" Returns the number of open buffers.
	return len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
endfunction

function! BasenamePwd()
	""" Returns the basename of the current working directory
	return fnamemodify(getcwd(), ':t')
endfunction

" always show statusline
set laststatus=2

set statusline=
set statusline +=%#Visual#
set statusline +=%-2{BufNum()}

set statusline +=%#ModeMsg#
set statusline +=%n\ 
set statusline +=%t\ 
set statusline +=%m
set statusline +=%#Pmenu#
set statusline +=\ %y

set statusline +=%=
set statusline +=%#Pmenu#
set statusline +=%l,
set statusline +=%L\ 
set statusline +=%#TabLineSel#
set statusline +=%-.30{BasenamePwd()}

""""""""""""""""""""
" Functionality
""""""""""""""""""""
set spell spelllang=en_au

" automatically reloads files that have been detected as being changed
set autoread
" automatically write on :make, :next, etc
set autowrite

" backspace skips over indents, EOL, appends, etc
set backspace=2

" if no register specified, copy to system clipboard
set clipboard+=unnamedplus

" open make errors in new split/buffer if not open
set switchbuf=useopen,usetab,split

source ~/.vim/ignores.vim

set undofile
set undodir=${HOME}/.vim/undo


""""""""""""""""""""
" Keybindings & commands
""""""""""""""""""""
let mapleader=","

" Esc to turn off search highlighting
" nnoremap <Esc> :noh<CR>

" gr for previous tab
map gr gT
" gb for bottom of file
map gb G
" gs to swap two adjacent characters
" map gs xph
" 0 jumps to first non-blank character, instead of hard BOL
map 0 ^
" j and k for soft line movement
nmap j gj
nmap k gk
vmap j gj
vmap k gk

if !exists(':TmuxNavigateRight')
	" tmux navigation will provide the pane navigation, so only map these if tmux isn't in use
	nnoremap <C-H> <C-w>h
	nnoremap <C-J> <C-w>j
	nnoremap <C-K> <C-w>k
	nnoremap <C-L> <C-w>l
endif

" make with ,m ; make clean with ,cm
nnoremap <Leader>m :Make <CR>
nnoremap <Leader>cm :Make clean<CR>
" autocmd BufWritePost * Neomake

" Y works similarly to C, D, etc
nnoremap Y y$

" shortcuts to edit rc files
nnoremap <Leader>ev :e $MYVIMRC<CR>
nnoremap <Leader>ez :e ~/.zshrc<CR>
" " ,es to edit UltiSnips file
nnoremap <Leader>es :call GetSnipFile()<CR>

" W and Q work as w and q do.
" Who do? Q do
command! Q :q
command! W :w

" turn off fucking ex mode
nnoremap Q <nop>
" similar for q:
nnoremap q: <nop>
nnoremap q? <nop>
nnoremap q/ <nop>

" buffer delete does not delete window
command! Bd bp|bd #
nnoremap <Leader>d :Bd<CR>

""""""""""""""""""""
" Autocommands
""""""""""""""""""""

" reload vimrc on save
autocmd! BufWritePost ~/.vimrc,$MYVIMRC,~/.vim/plugins.vim source $MYVIMRC

" syntax highlighting for snippet files
autocmd! FileType snippet set syntax=snippets
autocmd! BufRead,BufNewFile *.snippets set filetype=snippets
" special settings for editing crontab files
autocmd! BufNewFile,BufRead crontab.* set nobackup | set nowritebackup
" tab settings for editing makefiles
autocmd! FileType make set ts=8 sts=8 sw=8 noexpandtab
" Python - autocapitalise booleans
autocmd! FileType python :iabbrev <buffer> true True| :iabbrev <buffer> false False
" Ruby - capitalise = capitalize
autocmd! FileType ruby :iabbrev <buffer> capitalise capitalize
" Markdown - syntax highlighting
autocmd! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
" zsh - highlight theme files
autocmd! BufRead,BufNewFile *.zsh-theme set filetype=zsh

" Extra Fortran settings for syntactic goodness
let fortran_free_source=1
let fortran_do_enddo=1

" Haskell
let hs_highlight_boolean = 1
let hs_highlight_types = 1
let hs_highlight_more_types = 1

" Java
let java_highlight_java_lang_ids=1

" LaTeX settings
let g:tex_flavor='latex'
let g:tex_nospell=0

" Rust
autocmd filetype rust setlocal makeprg=cargo\ build

" spellcheck for txt files
" autocmd! FileType help setlocal nospell


""""""""""""""""""""
" Plugin-specific settings
""""""""""""""""""""

" camelcasemotion
map <silent> <Leader>w <Plug>CamelCaseMotion_w
map <silent> <Leader>b <Plug>CamelCaseMotion_b
map <silent> <Leader>e <Plug>CamelCaseMotion_e
map <silent> <Leader>ge <Plug>CamelCaseMotion_ge

""" vim-commentary
autocmd! FileType c,cpp setlocal commentstring=\/\/\ %s
autocmd! FileType cmake setlocal commentstring=#\ %s
autocmd! FileType octave setlocal commentstring=%\ %s

""" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

""" DelimitMate
let delimitMate_expand_cr=1
au! FileType python let b:delimitMate_nesting_quotes = ['"']

""" vim-signify
let g:signify_vcs_list = ['svn', 'git']
" let g:signify_line_highlight = 1

""" FZF
map <silent> <Leader>f :FZF -m<CR>
map <silent> <Leader>hf :FZF -m ~<CR>

""" haskell-vim
let g:haskell_indent_disable=1

""""""""""""""""""""
" Functions
""""""""""""""""""""
fu! GetSnipFile()
	execute 'edit ~/.vim/UltiSnips/' . &ft . '.snippets'
endfunction