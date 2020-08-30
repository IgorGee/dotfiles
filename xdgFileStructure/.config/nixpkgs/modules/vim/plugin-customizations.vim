" Airline
let g:airline_theme='gruvbox'
let g:airline#extension#tmuxline#enabled = 0    " Apply colorscheme in tmux
let g:airline#extensions#tabline#enabled = 1    " Show tabs of files on top
let airline#extensions#tmuxline#snapshot_file = "~/.config/airline/.tmux-status.conf"

" FZF
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" Git Gutter
highlight GitGutterAdd guifg=#009900 ctermfg=Green
highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
highlight GitGutterDelete guifg=#ff2222 ctermfg=Red

" Vim Caser
" The only missing case is lowercase
nnoremap gsl gu

" ALE
let g:ale_linters = {'zsh': ['shellcheck']}
" https://github.com/dense-analysis/ale/blob/4c6f67a3d02d12a7ce2f35cc3cbe2e166ae83b72/test/command_callback/test_shellcheck_command_callback.vader#L29
let g:ale_sh_shellcheck_dialect = 'bash'
let g:ale_sh_shellcheck_exclusions = 'SC1090,SC2148'
