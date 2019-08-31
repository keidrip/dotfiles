let g:NERDTreeShowHidden=1
let NERDTreeIgnore = ['node_modules$','\.git$', "\.DS_Store$"]
let g:NERDTreeChDirMode = 2
let g:NERDTreeWinSize = 45
let g:nerdtree_tabs_open_on_console_startup = 1

" function! IsNerdTreeEnabled()
"     return exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
" endfunction
" function! SyncNERDTree()
"  if strlen(expand('%')) > 0 && &modifiable && IsNERDTreeOpen() && !&diff && !empty(&ft) && &ft != "quickrun" && &ft != "qfreplace"
"    NERDTreeFind
"    wincmd p
"  endif
" endfunction

augroup NERDTreeSetting
  autocmd!
  " autocmd BufEnter * call SyncNERDTree()
  " autocmd VimEnter * nested if @% != '' | :NERDTreeFind | wincmd p | endif
augroup END

nnoremap <silent> <C-E> :call <SID>SyncNERDTree()<CR>

function! s:SyncNERDTree()
  let isOpen = exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
  if isOpen == 1
    NERDTreeToggle
  else
    NERDTreeFind
  endif
endfunction
