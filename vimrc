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

set laststatus=2
set noswapfile

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set smarttab

set relativenumber
set number
set textwidth=79
set colorcolumn=+1

set invlist
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

" Enter visual line mode
nmap <Leader><Leader> V
