" echo "3.mappings.vim"

let mapleader = "\<Space>"

nnoremap P "0p

tnoremap <ESC> <C-\><C-n>
nnoremap cn *Ncgn
nnoremap cN *NcgN
nnoremap <Leader>%s  :%s/\v
nnoremap <ESC><ESC> :nohlsearch<CR><ESC>
nnoremap <C-g> :echo expand('%:p')<Return>
nnoremap <Leader>co :copen<cr>
nnoremap <Leader>cl :cclose<cr>
nnoremap <expr> <Leader>a (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Ag\<cr>"
nnoremap <expr> <Leader>x (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Commands\<cr>"
nnoremap <expr> <Leader>f (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <expr> <Leader>d (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":GFiles?\<cr>"
nnoremap <expr> <Leader>b (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Buffers\<cr>"
nnoremap <expr> <Leader>h (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":History:\<cr>"
nnoremap <expr> <Leader>r (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Ripgrep\<cr>"
nnoremap <expr> <Leader>w (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Windows\<cr>"
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
nnoremap <Leader>got :GoToggleBreakpoint<CR>
nnoremap <Leader>god :GoDebug<CR>
nmap <C-]> :tab <CR>:exec("tjump ".expand("<cword>"))<CR>
nmap <leader><C-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <C-x>sc :<C-u>call <SID>change_case("sc")<CR>
nnoremap <C-x>sk :<C-u>call <SID>change_case("sk")<CR>
nnoremap <C-x>cs :<C-u>call <SID>change_case("cs")<CR>
nnoremap <C-x>ck :<C-u>call <SID>change_case("ck")<CR>
nnoremap <C-x>kc :<C-u>call <SID>change_case("kc")<CR>
nnoremap <C-x>ks :<C-u>call <SID>change_case("ks")<CR>

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

"" nerdtree
nnoremap <C-e> :NERDTreeToggle<cr>

"" operetor-user
nmap sa <Plug>(operator-surround-append)
nmap sd <Plug>(operator-surround-delete)
nmap sr <Plug>(operator-surround-replace)
nmap y <Plug>(operator-stay-cursor-yank)
