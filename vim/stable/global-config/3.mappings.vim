" echo "3.mappings.vim"

let mapleader = "\<Space>"

nnoremap P "0p

tnoremap <ESC> <C-\><C-n>
nnoremap cn *Ncgn
nnoremap cN *NcgN
nnoremap <Leader>%s  :%s/\v
nnoremap <silent> <ESC><ESC> :nohlsearch<CR><ESC>
nnoremap <C-g> :echo expand('%:p')<Return>
nnoremap <Leader>co :copen<cr>
nnoremap <Leader>cl :cclose<cr>
nnoremap <expr> <Leader>a (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '').":Ag\<cr>"
nnoremap <expr> <Leader>x (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '').":Commands\<cr>"
nnoremap <expr> <Leader>f (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <expr> <Leader>d (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '').":GFiles?\<cr>"
nnoremap <expr> <Leader>b (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '').":Buffers\<cr>"
nnoremap <expr> <Leader>h (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '').":History:\<cr>"
nnoremap <expr> <Leader>r (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '').":Ripgrep\<cr>"
nnoremap <expr> <Leader>w (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '').":Windows\<cr>"
nnoremap <Leader>gm :Gmerge<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gca :Gcommit -a -m "
nnoremap <Leader>gps :Dispatch! git push origin<cr>
nnoremap <Leader>gpl :Dispatch! git pull origin<cr>
nnoremap <Leader>t :new \| :terminal<CR>
nnoremap <Leader>T :tabnew \| :terminal<CR>
nnoremap <Leader>vt :vne \| :terminal<CR>
nnoremap <Leader>n :ALENextWrap<CR>

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" Tab map
nmap [Tag]c :tablast <bar> tabnew<CR>
nmap [Tag]x :tabclose<CR>
nmap [Tag]n :tabnext<CR>
nmap [Tag]p :tabprevious<CR>

"" vim-anzu
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)

"" operetor-user
vmap sa <Plug>(operator-surround-append)
vmap sd <Plug>(operator-surround-delete)
vmap sr <Plug>(operator-surround-replace)
vmap y <Plug>(operator-stay-cursor-yank)

nnoremap <silent> yy :yank<CR>

" vista
nmap <C-q> :Vista!!<CR>

" not yank typed s
" nnoremap x "_x
nnoremap s "_s

" move by byte unit on insert mode
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-c> <ESC>

"" change case (snake,camel,kebab)
nnoremap <C-x>sc :<C-u>call <SID>change_case("sc")<CR>
nnoremap <C-x>sk :<C-u>call <SID>change_case("sk")<CR>
nnoremap <C-x>cs :<C-u>call <SID>change_case("cs")<CR>
nnoremap <C-x>ck :<C-u>call <SID>change_case("ck")<CR>
nnoremap <C-x>kc :<C-u>call <SID>change_case("kc")<CR>
nnoremap <C-x>ks :<C-u>call <SID>change_case("ks")<CR>
function! s:change_case(v1, ...)
  let t = a:v1
  let p = getpos(".")
  if t == "sc"
    let s = substitute(expand("<cword>"), "_\\(.\\)", "\\u\\1", "g")
    let s = substitute(s, '\(\l\)', '\u\1', '')
    execute ":normal diw"
  elseif t == "sk"
    let s = substitute(expand("<cword>"), "_", "-", "g")
    execute ":normal diw"
  elseif t == "cs"
    let s = substitute(expand("<cword>"), '\(\l\)\(\u\)', '\1_\l\2', "g")
    let s = substitute(s, '\(\u\)', '\l\1', '')
    execute ":normal diw"
  elseif t == "ck"
    let s = substitute(expand("<cword>"), "\\(\\u\\)", "-\\l\\1", "g")
    execute ":normal diw"
  elseif t == "kc"
    let s = substitute(expand("<cword>"), "-\\(.\\)", "\\u\\1", "g")
    execute ":normal diW"
  elseif t == "ks"
    let s = substitute(expand("<cword>"), "-", "_", "g")
    execute ":normal diW"
  endif
  execute ":normal i" . s
  call setpos(".", p)
  echo s
endfunction

