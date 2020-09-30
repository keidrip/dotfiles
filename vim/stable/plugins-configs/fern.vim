 function! s:init_fern() abort
  nmap <buffer> l <Plug>(fern-action-open:edit)

  nmap <buffer><expr>
      \ <Plug>(fern-my-expand-or-collapse)
      \ fern#smart#leaf(
      \   "\<Plug>(fern-action-collapse)",
      \   "\<Plug>(fern-action-expand)",
      \   "\<Plug>(fern-action-collapse)",
      \ )

  nmap <buffer><nowait> o <Plug>(fern-my-expand-or-collapse)

  nmap <buffer> go <Plug>(fern-action-open:edit)<C-w>p
  nmap <buffer> t <Plug>(fern-action-open:tabedit)
  nmap <buffer> T <Plug>(fern-action-open:tabedit)gT
  nmap <buffer> i <Plug>(fern-action-open:split)
  nmap <buffer> gi <Plug>(fern-action-open:split)<C-w>p
  nmap <buffer> s <Plug>(fern-action-open:vsplit)
  nmap <buffer> gs <Plug>(fern-action-open:vsplit)<C-w>p

  nmap <buffer> ma <Plug>(fern-action-new-path)
  nmap <buffer> md <Plug>(fern-action-trash)
  nmap <buffer> mm <Plug>(fern-action-move)
  nmap <buffer> mc <Plug>(fern-action-copy)

  nmap <buffer> y <Plug>(fern-action-yank:label)
  nmap <buffer> Y <Plug>(fern-action-yank:path)

  nmap <buffer> P gg
  nmap <buffer> e <Nop>
  nmap <buffer> E <Nop>

  nmap <buffer> C <Plug>(fern-action-enter)
  nmap <buffer> u <Plug>(fern-action-leave)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> R gg<Plug>(fern-action-reload)<C-o>
  nmap <buffer> cd <Plug>(fern-action-cd)
  nmap <buffer> CD gg<Plug>(fern-action-cd)<C-o>

  nmap <buffer> I <Plug>(fern-action-hide-toggle)

  nmap <buffer> q :<C-u>quit<CR>
endfunction

augroup FernSetting
  autocmd!
  autocmd FileType fern call s:init_fern()
  autocmd VimEnter * ++nested Fern . -keep -drawer -stay -toggle -width=50
augroup END

map <silent> <C-E> :Fern . -keep -drawer -stay -toggle -width=50<CR>
nnoremap <silent> <C-W>f :Fern . -reveal=% -keep -drawer -stay -width=50<CR>:wincmd p<CR>

let g:fern#opener = "vsplit"
