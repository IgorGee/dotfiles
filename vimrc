set encoding=utf8

set nocompatible                                " be iMproved, required
filetype off                                    " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'
Plugin 'ervandew/supertab'
Plugin 'flazz/vim-colorschemes'
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'marijnh/tern_for_vim'                   " Provide Tern-based JavaScript editing support
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sheerun/vim-polyglot'
Plugin 'SirVer/Ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'justinj/vim-react-snippets'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'Xuyuanp/nerdtree-git-plugin'

call vundle#end()                               " required
filetype plugin indent on                       " required

let mapleader = "\<Space>"                      " set leader key to Spacebar

let g:airline_theme='murmur'
let g:airline#extension#tmuxline#enabled = 1    " Apply colorscheme in tmux
let g:airline#extensions#tabline#enabled = 1    " Show tabs of files on top

let g:syntastic_python_checkers = ['pylint']    " Set python linter to pylint
let g:syntastic_python_pylint_args = "--const-rgx='[a-z_][a-z0-9_]{2,30}$'"
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_javascript_checkers = ['eslint']

let g:delimitMate_expand_cr = 1                 " Add \n and <TAB> when entering {}
let g:delimitMate_expand_space = 1

nnoremap <Leader>u :GundoToggle<CR>

nnoremap <Leader>t :TagbarToggle<CR>

nnoremap <Leader>n :NERDTreeToggle<CR>

filetype indent on                              " load filetype-specific indent files
set t_Co=256                                    " enable 256 colors in vim
set laststatus=2                                " status bar on bottom
colorscheme jellybeans       					" set colorscheme from vim-colorschemes
set noswapfile                                  " don't create any .swp files
set lazyredraw                                  " redraw only when we need to, faster macros

set tabstop=4                                   " number of visual spaces per TAB
set shiftwidth=4                                " indentation takes up 4 spaces
set expandtab
set autoindent                                  " copy indentation of previous line
set smartindent                                 " adds levels of indentation in some situations
set smarttab                                    " <TAB> is interpreted based on shiftwidth

set relativenumber                              " show line numbers relative to current line
set number                                      " show line number of current line
set textwidth=100                               " set text width to 99 characters
call matchadd('ColorColumn', '\%101v', 100)     " only show a colorcolumn when I pass the textwidth
set fillchars+=vert:\                           " removes the | character in vertical splits
highlight VertSplit gui=reverse guifg=Green     " set vertical split border colors green

set hidden                                      " allow to switch between buffers without saving
set wildmenu                                    " visual autocomplete for command menu
set showmatch                                   " highlight matching [{()}]
set incsearch                                   " search as characters are entered
set hlsearch                                    " highlight matches
set ignorecase                                  " searches are not case sensitive
set smartcase                                   " case sensitive if pattern has uppercase
nnoremap <leader>, :nohlsearch<CR>              " turn off search highlight

set foldenable                                  " enable folding. toggle za
set foldlevelstart=10                           " open most folds by default
set foldnestmax=10                              " 10 nested folds max
set foldmethod=indent                           " fold based on indent level

" show non-printing characters
set invlist
set listchars=tab:▸\ ,trail:⋅,extends:❯,precedes:❮

function! <SID>StripTrailingWhiteSpaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhiteSpaces()
