nnoremap <expr> <Leader>a (expand('%') =~ '^fern://' ? "\<c-w>\<c-w>" : '').":Ag\<cr>"
nnoremap <expr> <Leader>x (expand('%') =~ '^fern://' ? "\<c-w>\<c-w>" : '').":Commands\<cr>"
nnoremap <expr> <Leader>f (expand('%') =~ '^fern://' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <expr> <Leader>d (expand('%') =~ '^fern://' ? "\<c-w>\<c-w>" : '').":GFiles?\<cr>"
nnoremap <expr> <Leader>b (expand('%') =~ '^fern://' ? "\<c-w>\<c-w>" : '').":Buffers\<cr>"
nnoremap <expr> <Leader>h (expand('%') =~ '^fern://' ? "\<c-w>\<c-w>" : '').":History:\<cr>"
nnoremap <expr> <Leader>r (expand('%') =~ '^fern://' ? "\<c-w>\<c-w>" : '').":Ripgrep\<cr>"
nnoremap <expr> <Leader>w (expand('%') =~ '^fern://' ? "\<c-w>\<c-w>" : '').":Windows\<cr>"

let g:fzf_layout = { 'down': '~40%' }

" command! -bang -nargs=? -complete=dir Files
"   \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Ripgrep
  \ call fzf#vim#grep(
  \   'rg --hidden --glob "!{node_modules/*,vendor/*,.git/*}" --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': '--exact --reverse --delimiter : --nth 3..'}, 'right:50%'), <bang>0)

