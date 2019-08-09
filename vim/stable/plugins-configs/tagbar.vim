 "" tagbar
let g:tagbar_width = 60
nmap <C-a>      :TagbarToggle<CR>
vmap <C-a> <Esc>:TagbarToggle<CR>
omap <C-a>      :TagbarToggle<CR>
imap <C-a> <Esc>:TagbarToggle<CR>
cmap <C-a> <C-u>:TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_type_yaml = {
    \ 'ctagstype' : 'Yaml',
    \ 'kinds'     : [
        \ 'h:headers:0:1',
    \ ],
    \ 'sort'    : 0,
\ }
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'Markdown',
    \ 'kinds'     : [
        \ 'c:chapsters:0:1',
        \ 's:sections',
        \ 'S:subsections',
        \ 't:subsubsections',
        \ 'T:level 4 subsections:0:1',
        \ 'u:level 5 subsections:0:1',
        \ 'r:regex:1:0',
    \ ],
    \ 'sort'    : 0,
\ }

