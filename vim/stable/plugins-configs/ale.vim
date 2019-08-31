" ale
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_fixers = {
  \ 'ruby': ['rubocop'],
  \ 'rust': ['rustfmt'],
\}
"	\ 'go'  : ['goimports'],

let g:ale_fix_on_save = 1
let g:ale_linters = {
  \ 'ruby' : ['rubocop','ruby'],
  \ 'yaml' : [''],
	\ 'go'   : ['golangci-lint'],
  \ 'rust' : ['rls'],
\}

let g:ale_go_golangci_lint_options = '--fast --enable-all -D errcheck'
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 0
" let g:ale_open_list = 0
" let g:ale_keep_list_window_open = 0
