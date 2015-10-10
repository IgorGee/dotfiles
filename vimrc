set encoding=utf8

set nocompatible              " be iMproved, required
filetype off                  " required

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

call vundle#end()            " required
filetype plugin indent on    " required

let g:airline_theme='murmur'
let g:airline#extension#tmuxline#enabled = 1
let g:airline#extensions#tabline#enabled = 1

let g:syntastic_python_checkers = ['pylint']

set laststatus=2            " status bar on bottom
set noswapfile              " don't create any .swp files

set tabstop=4               " number of visual spaces per TAB
set shiftwidth=4            " indentation takes up 4 spaces
set expandtab               " tabs are spaces
set autoindent              " copy indentation of previous line
set smartindent             " adds levels of indentation in some situations
set smarttab                " <TAB> is interpreted based on shiftwidth

set relativenumber          " show line numbers relative to current line
set number                  " show line number of current line
set textwidth=79            " set text width to 79 characters
set colorcolumn=+1          " set a black column 1 space past the textwidth

set invlist                 " show non-printing characters
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮

set t_Co=256

colorscheme jellybeans

let mapleader = "\<Space>"
nnoremap <Leader>o :CtrlP<CR>   " open new file
nnoremap <Leader>w :w<CR>       " write file

" Copy & paste to system clipboard with <Space>p and <Space>y
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

nmap <Leader><Leader> V     " Enter visual line mode
