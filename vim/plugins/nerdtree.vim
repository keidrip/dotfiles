
let g:NERDTreeShowHidden=1
let NERDTreeIgnore = ['node_modules$','\.git$', "\.DS_Store$"]
let g:NERDTreeChDirMode = 2
let g:NERDTreeWinSize = 45
let g:nerdtree_tabs_open_on_console_startup = 1
" highlight in NERDTree
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction
function! SyncNERDTree()
 if strlen(expand('%')) > 0 && &modifiable && IsNERDTreeOpen() && !&diff && !empty(&ft) && &ft != "quickrun" && &ft != "qfreplace"
   NERDTreeFind
   wincmd p
 endif
endfunction
