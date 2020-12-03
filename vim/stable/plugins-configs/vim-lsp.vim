" vim-lsp
let g:lsp_async_completion = 1
let g:lsp_hover_conceal = 0
let g:lsp_signature_help_enabled = 0

" floating window with lsp
let g:lsp_preview_float = 0
let g:lsp_documentation_float = 0

" lint
let g:lsp_diagnostics_enabled = 0
let g:lsp_signs_enabled = 0
let g:lsp_diagnostics_echo_cursor = 0

augroup VimLspSetting
  autocmd!
  autocmd FileType go,rust,python,ruby,c,cpp nmap gd <Plug>(lsp-definition)
  autocmd FileType go,rust,python,ruby,c,cpp autocmd BufWritePre <buffer> silent! LspDocumentFormatSync
augroup END
