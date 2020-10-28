let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

let g:ale_linters = {
  \ 'ruby' : ['rubocop','ruby'],
  \ 'yaml' : [''],
  \ 'go'   : ['go vet'],
  \ 'rust' : ['rust-analyzer'],
  \ 'c'    : ['clangd'],
  \ 'cpp'  : ['clangd'],
\}

" let g:ale_go_golangci_lint_options = '--fast --enable-all -D errcheck'
" let g:ale_go_golangci_lint_options = '--enable-all'

nnoremap <Leader>n :ALENextWrap<CR>

nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)
