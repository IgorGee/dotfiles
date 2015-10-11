set encoding=utf8

set nocompatible                                " be iMproved, required
filetype off                                    " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'airblade/vim-gitgutter'
Plugin 'ervandew/supertab'
Plugin 'Raimondi/delimitMate'
Plugin 'SirVer/Ultisnips'
Plugin 'sjl/gundo.vim'

call vundle#end()                               " required
filetype plugin indent on                       " required

let mapleader = "\<Space>"                      " set leader key to Spacebar

let g:airline_theme='murmur'
let g:airline#extension#tmuxline#enabled = 1    " Apply colorscheme in tmux
let g:airline#extensions#tabline#enabled = 1    " Show tabs of files on top

let g:syntastic_python_checkers = ['pylint']    " Set python linter to pylint

let g:delimitmate_expand_cr = 1                 " Add \n and <TAB> when entering {}

nnoremap <Leader>u :GundoToggle<CR>

filetype indent on                              " load filetype-specific indent files
set t_Co=256                                    " enable 256 colors in vim
set laststatus=2                                " status bar on bottom
colorscheme jellybeans                          " set colorscheme from vim-colorschemes
set noswapfile                                  " don't create any .swp files
set lazyredraw                                  " redraw only when we need to, faster macros

set tabstop=4                                   " number of visual spaces per TAB
set shiftwidth=4                                " indentation takes up 4 spaces
set expandtab                                   " tabs are spaces
set autoindent                                  " copy indentation of previous line
set smartindent                                 " adds levels of indentation in some situations
set smarttab                                    " <TAB> is interpreted based on shiftwidth

set relativenumber                              " show line numbers relative to current line
set number                                      " show line number of current line
set textwidth=79                                " set text width to 79 characters
set colorcolumn=+1                              " set a black column 1 space past the textwidth
set cursorline                                  " highlight current line

set hidden                                      " allow to switch between buffers without saving
set wildmenu                                    " visual autocomplete for command menu
set showmatch                                   " highlight matching [{()}]
set incsearch                                   " search as characters are entered
set hlsearch                                    " highlight matches
set ignorecase                                  " searches are not case sensitive
set smartcase                                   " if pattern contains uppercase letter, then it is case sensitive
nnoremap <leader>, :nohlsearch<CR>              " turn off search highlight

set foldenable                                  " enable folding. toggle za
set foldlevelstart=10                           " open most folds by default
set foldnestmax=10                              " 10 nested folds max
set foldmethod=indent                           " fold based on indent level

" show non-printing characters
set invlist                                     
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
