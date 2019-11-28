let g:NERDTreeShowHidden=1
let NERDTreeIgnore = ['node_modules$','\.git$', "\.DS_Store$"]
let g:NERDTreeChDirMode = 2
let g:NERDTreeWinSize = 45
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_autofind = 0

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
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

function! s:Nerdtreefind_if() abort
     NERDTreeFind
endfunction

nnoremap <silent> <C-E> :NERDTreeTabsToggle<CR>
nnoremap <silent> <C-W>f :call <SID>Nerdtreefind_if()<CR>
" nnoremap <silent> <C-E> :call <SID>SyncNERDTree()<CR>
"
" function! s:SyncNERDTree()
"   let isOpen = exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
"   if isOpen == 1
"     NERDTreeTabsToggle
"   else
"     NERDTreeFind
"   endif
" endfunction
