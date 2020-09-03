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

" NerdTree
nnoremap <Leader>n :NERDTreeToggle<CR>

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
