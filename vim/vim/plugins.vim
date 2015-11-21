call plug#begin('~/.vim/plugged')

" initial plugins, required for some other stuff
Plug 'junegunn/vim-plug'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'

" Functionality
Plug 'benekastah/neomake'
Plug 'bkad/CamelCaseMotion'
Plug 'christoomey/vim-tmux-navigator', { 'on': 'echo $TMUX' } | Plug 'benmills/vimux' | Plug 'edkolev/tmuxline.vim' 
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'

" Appearance
Plug 'bling/vim-airline' | Plug 'bling/vim-bufferline'

" Colourschemes
Plug 'chriskempson/base16-vim'
Plug 'nanotech/jellybeans.vim'

" Syntax highlighting
Plug 'gabrielelana/vim-markdown', { 'for': 'markdown' }
Plug 'jvirtanen/vim-octave', { 'for': 'octave,matlab' }
Plug 'keith/tmux.vim'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

call plug#end()
