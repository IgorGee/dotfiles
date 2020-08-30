set clipboard^=unnamedplus "Share clipboard registries. Could also do "*y and "*p

" Speed
set nocompatible
set synmaxcol=300
set ttyfast
set updatetime=100

filetype indent on                              " load filetype-specific indent files
set t_Co=256                                    " enable 256 colors in vim
set laststatus=2                                " status bar on bottom
colorscheme gruvbox                             " set colorscheme from vim-colorschemes
set noswapfile                                  " don't create any .swp files
set lazyredraw                                  " redraw only when we need to, faster macros

set tabstop=2                                   " number of visual spaces per TAB
set shiftwidth=2                                " indentation takes up 2 spaces
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
highlight Normal ctermbg=none guibg=none        " Allows you to have a transparent background to your terminal
highlight CursorLineNr ctermbg=none guibg=none  " Add transparency to the current line number background
highlight clear SignColumn                      " Adds transparency to the gutters column too
set termguicolors                               " True colors
set signcolumn=yes:2                            " always show signcolumns. 1 for gitgutter, 1 for ale linting

set hidden                                      " allow to switch between buffers without saving
set wildmenu                                    " visual autocomplete for command menu
set showmatch                                   " highlight matching [{()}]
set incsearch                                   " search as characters are entered
set hlsearch                                    " highlight matches
set ignorecase                                  " searches are not case sensitive
set smartcase                                   " case sensitive if pattern has uppercase

set foldenable                                  " enable folding. toggle za
set foldlevelstart=10                           " open most folds by default
set foldnestmax=10                              " 10 nested folds max
set foldmethod=indent                           " fold based on indent level

" show non-printing characters
set invlist
set listchars=tab:▸\ ,trail:⋅,extends:❯,precedes:❮

set autochdir
