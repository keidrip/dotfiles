
"" lsp w/ gopls
if executable('gopls')
  " let g:lsp_async_completion = 1
  let g:lsp_diagnostics_enabled = 0 " use ale to cieck errors
  augroup LspGo
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'go-lang',
        \ 'cmd': {server_info->['gopls']},
        \ 'whitelist': ['go'],
        \ })
    autocmd FileType go setlocal omnifunc=lsp#complete
  augroup END
endif
