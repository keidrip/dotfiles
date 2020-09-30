let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_fmt_fail_silently = 1
let g:go_fmt_autosave = 0

let g:go_debug_windows = {
        \ 'stack': 'rightbelow 120vnew',
        \ 'out':   'leftabove 20new',
        \ 'vars':  'leftabove 40new',
  \ }

let g:go_fmt_command = "goimports"

augroup VimGoDebugSetting
  autocmd!
  autocmd FileType go nnoremap <Leader><Leader>b :GoDebugBreakpoint<CR>
  autocmd FileType go nnoremap <Leader><Leader>g :GoDebugStart<CR>
  autocmd FileType go nnoremap <Leader><Leader>o :GoDebugStop<CR>
  autocmd FileType go nnoremap <Leader><Leader>r :GoDebugRestart<CR>
  autocmd FileType go nnoremap <Leader><Leader>c :GoDebugContinue<CR>
  autocmd FileType go nnoremap <Leader><Leader>s :GoDebugStep<CR>
  autocmd FileType go nnoremap <Leader><Leader>n :GoDebugNext<CR>
  autocmd FileType go nnoremap <Leader><Leader>p :GoDebugPrint
augroup END
