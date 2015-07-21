set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" initial plugins, required for some other stuff
Plugin 'gmarik/Vundle.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
"Plugin 'xolox/vim-misc'

Plugin 'benmills/vimux'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'garbas/vim-snipmate'
Plugin 'jiangmiao/auto-pairs'
Plugin 'johnsyweb/vim-makeshift'
"Plugin 'kien/ctrlp.vim'
"Plugin 'powerline/powerline'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-surround'
"Plugin 'xolox/vim-easytags'

" Syntax highlighting
Plugin 'beyondmarc/opengl.vim'
Plugin 'gabrielelana/vim-markdown'
"Plugin 'hdima/python-syntax'
Plugin 'tikhomirov/vim-glsl'
Plugin 'keith/tmux.vim'

" Colourschemes
Plugin 'benjaminwhite/Benokai'
Plugin 'chase/focuspoint-vim'
"Plugin 'sickill/vim-monokai'

call vundle#end()
filetype plugin indent on


