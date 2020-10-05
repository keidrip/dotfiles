nnoremap <expr> <Leader>a (expand('%') =~ '^fern://' ? "\<c-w>\<c-w>" : '').":Ag\<cr>"
nnoremap <expr> <Leader>x (expand('%') =~ '^fern://' ? "\<c-w>\<c-w>" : '').":Commands\<cr>"
nnoremap <expr> <Leader>f (expand('%') =~ '^fern://' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <expr> <Leader>d (expand('%') =~ '^fern://' ? "\<c-w>\<c-w>" : '').":GFiles?\<cr>"
nnoremap <expr> <Leader>b (expand('%') =~ '^fern://' ? "\<c-w>\<c-w>" : '').":Buffers\<cr>"
nnoremap <expr> <Leader>h (expand('%') =~ '^fern://' ? "\<c-w>\<c-w>" : '').":History:\<cr>"
nnoremap <expr> <Leader>r (expand('%') =~ '^fern://' ? "\<c-w>\<c-w>" : '').":Ripgrep\<cr>"
nnoremap <expr> <Leader>w (expand('%') =~ '^fern://' ? "\<c-w>\<c-w>" : '').":Windows\<cr>"

let g:fzf_layout = { 'down': '~40%' }
