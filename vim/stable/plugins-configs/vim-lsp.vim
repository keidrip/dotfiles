let g:lsp_async_completion = 1 " async completion by lsp
let g:lsp_diagnostics_enabled = 0 " use ale to cieck errors
" let g:lsp_signs_enabled = 1         " enable signs
" let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
let g:lsp_hover_conceal = 0 " not use LspHover

if executable('rls')
  augroup LspRust
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
    autocmd FileType rust setlocal omnifunc=lsp#complete
  augroup END
endif

if executable('gopls')
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

if executable('pyls')
  augroup LspPython
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
  augroup END
endif

if executable('solargraph')
  augroup LspRuby
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'solargraph',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
        \ 'whitelist': ['ruby'],
        \ })
  augroup END
    "    \ 'initialization_options': {"diagnostics": "true"},
    "    \ 'cmd': {server_info->['solargraph','stdio']},
    " \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
endif

" if executable('yaml-language-server')
"   augroup LspYaml
"     autocmd!
"     autocmd User lsp_setup call lsp#register_server({
"         \ 'name': 'yaml-lsp',
"         \ 'cmd': ['yaml-language-server','--stdio'],
"         \ 'whitelist': ['yaml'],
"         \ })
"     autocmd FileType yaml setlocal omnifunc=lsp#complete
"   augroup END
" endif

" let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
" let g:lsp_signs_error = {'text': '✗'}
" let g:lsp_signs_warning = {'text': '‼'} " icons require GUI
" let g:lsp_signs_hint = {'text': '⬥ ok'} " icons require GUI
