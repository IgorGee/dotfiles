" Vanilla Bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = "\<Space>"

" insert semicolon at the end of the line and return
inoremap <Leader>; <C-[>m`A;<C-[>``a

" quick esc during insert mode
imap kj <Esc>

" Press * to search for the word under the selection and replace all
" If first argument is blank (%s//bar/g) vim will assume the highlighted text
nnoremap <Leader>r :%s///g<Left><Left>
" Same as above but with confirmations
nnoremap <Leader>rc :%s///gc<Left><Left><Left>

function! <SID>StripTrailingWhiteSpaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhiteSpaces()

autocmd BufWritePost bspwmrc silent exec '!bspc wm -r'

" Plugin Binding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Magit
nnoremap <Leader>m :MagitOnly<CR>

" Vim Cutlass (c, cc, C, s, S, d, dd, D, x, X) will no longer attach to clipboard
" x and X will function as the cut key
nnoremap x d
xnoremap x d
nnoremap xx dd
nnoremap X D

" Tagbar
nnoremap <Leader>t :TagbarToggle<CR>

" FZF
nnoremap <silent> <C-p> :call fzf#vim#gitfiles('', fzf#vim#with_preview('right'))<CR>

" is-vim with vim-asterisk integrations
map *  <Plug>(asterisk-z*)<Plug>(is-nohl-1)
map g* <Plug>(asterisk-gz*)<Plug>(is-nohl-1)
map #  <Plug>(asterisk-z#)<Plug>(is-nohl-1)
map g# <Plug>(asterisk-gz#)<Plug>(is-nohl-1)

" coc-explorer
nmap <space>e :CocCommand explorer<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

" coc-snippets
let g:UltiSnipsExpandTrigger = "<nop>"
let g:coc_snippet_next = '<tab>'
inoremap <expr> <C-k> pumvisible() ? "\<c-p>"   : "\<C-k>"
inoremap <expr> <C-j> pumvisible() ? "\<c-n>" : "\<C-j>"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Fern
augroup my-fern-hijack
  autocmd!
  autocmd BufEnter * ++nested call s:hijack_directory()
augroup END

function! s:hijack_directory() abort
  let path = expand('%:p')
  if !isdirectory(path)
    return
  endif
  bwipeout %
  execute printf('Fern %s', fnameescape(path))
endfunction

noremap <silent> <Leader>f :Fern . -drawer -reveal=% -toggle -width=35<CR><C-w>=

function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> <CR> <Plug>(fern-action-mark:toggle)j
  nmap <buffer> h <Plug>(fern-action-collapse)
  nmap <buffer> l <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> n <Plug>(fern-action-new-path)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> m <Plug>(fern-action-move)
  nmap <buffer> M <Plug>(fern-action-rename)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> b <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer><nowait> < <Plug>(fern-action-leave)
  nmap <buffer><nowait> > <Plug>(fern-action-enter)
  nmap <buffer><nowait> ^ <Plug>(fern-action-project-top:reveal)
endfunction

augroup FernGroup
  autocmd!
  autocmd FileType fern call FernInit()
augroup END
