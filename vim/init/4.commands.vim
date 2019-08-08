" echo "4.commands.vim"

"" custom commands
command! -nargs=* -complete=file Rg :tabnew | :silent grep --sort-files <args>
command! -nargs=* -complete=file RgfastUnsort :tabnew | :silent grep <args>
command! -bang -nargs=* Ripgrep
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview({'options': '--exact --reverse --delimiter : --nth 3..'}, 'right:50%:hidden', '?'),
  \   <bang>0)
command! Rv source $MYVIMRC
command! Ev tabnew | edit $MYVIMRC
command! Edv edit $HOME/dotfiles/.vimrc
cabbr w!! w !sudo tee > /dev/null %
