" echo "6.colors.vim"

"" terminal colors
if !has('gui_running')
      \ && exists('&termguicolors')
      \ && $COLORTERM ==# 'truecolor'
  if !has('nvim')
    let &t_8f = "\e[38;2;%lu;%lu;%lum"
    let &t_8b = "\e[48;2;%lu;%lu;%lum"
  endif
  set termguicolors
endif
let g:terminal_color_0  = "#1b2b34" "black
let g:terminal_color_1  = "#ed5f67" "red
let g:terminal_color_2  = "#9ac895" "green
let g:terminal_color_3  = "#fbc963" "yellow
let g:terminal_color_4  = "#669acd" "blue
let g:terminal_color_5  = "#c695c6" "magenta
let g:terminal_color_6  = "#5fb4b4" "cyan
let g:terminal_color_7  = "#c1c6cf" "white
let g:terminal_color_8  = "#65737e" "bright black
let g:terminal_color_9  = "#fa9257" "bright red
let g:terminal_color_10 = "#343d46" "bright green
let g:terminal_color_11 = "#4f5b66" "bright yellow
let g:terminal_color_12 = "#a8aebb" "bright blue
let g:terminal_color_13 = "#ced4df" "bright magenta
let g:terminal_color_14 = "#ac7967" "bright cyan
let g:terminal_color_15 = "#d9dfea" "bright white
let g:terminal_color_background="#1b2b34" "background
let g:terminal_color_foreground="#c1c6cf" "foreground
