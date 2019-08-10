" echo "5.autocmd.vim"

augroup GeneralAutocmdInVimRC
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//ge
  autocmd VimEnter * nested if @% != '' | :NERDTreeFind | wincmd p | endif
  autocmd InsertLeave * set nopaste
  autocmd QuickFixCmdPost *grep* cwindow
  autocmd Filetype json setl conceallevel=0
augroup END

augroup QuickRunToCargoRun
  autocmd!
  let g:quickrun_config = {}
  autocmd BufNewFile,BufRead *.rs  let g:quickrun_config.rust = {'exec' : 'cargo run'}
augroup END

augroup HighlightIdegraphicSpace
  autocmd!
  autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

augroup FiletypeGroup
  autocmd!
  au BufNewFile,BufRead *.yml.j2,*.yaml.j2 set ft=yaml " or, set ft=ansible by vim-ansible-yaml plugin
  au BufNewFile,BufRead *.conf,*.conf.j2 set ft=conf
augroup END

augroup ColorSchemeSetting
  autocmd!
  autocmd ColorScheme * hi LineNr ctermfg=239
  autocmd ColorScheme * hi Normal ctermbg=none
augroup END

augroup EmmetSetting
  autocmd!
  autocmd FileType html,css,scss,javascript EmmetInstall
augroup END
