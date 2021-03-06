call plug#begin('~/.vim/plugged')

" initial plugins, required for some other stuff
Plug 'junegunn/vim-plug'
Plug 'kana/vim-textobj-user'

" Functionality
Plug 'bkad/CamelCaseMotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" Colourschemes
Plug 'chriskempson/base16-vim'

" Syntax-specific
Plug 'bps/vim-textobj-python', { 'for': 'python' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'gabrielelana/vim-markdown', { 'for': 'markdown' }
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'jvirtanen/vim-octave', { 'for': ['matlab', 'octave'] }
Plug 'keith/tmux.vim', { 'for': ['tmux', 'conf'] }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'rbonvall/vim-textobj-latex', { 'for': 'tex' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

call plug#end()
