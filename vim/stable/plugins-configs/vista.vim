" function! NearestMethodOrFunction() abort
"   return get(b:, 'vista_nearest_method_or_function', '')
" endfunction
"
" set statusline+=%{NearestMethodOrFunction()}

autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

let g:vista_default_executive = 'ctags'

let g:vista_executive_for = {
  \ 'rust': 'vim_lsp',
  \ 'python': 'vim_lsp',
  \ 'go': 'vim_lsp',
  \ }

let g:vista_sidebar_width = 48

" let g:vista_fzf_preview = ['right:50%']

" let g:vista#renderer#enable_icon = 1

" let g:vista#renderer#icons = {
" \   'function': '\uf794',
" \   'variable': '\uf71b',
" \  }
