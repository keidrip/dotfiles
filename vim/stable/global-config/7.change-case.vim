
"" change case (snake,camel,kebab)
function! s:change_case(v1, ...)
  let t = a:v1
  let p = getpos(".")
  if t == "sc"
    let s = substitute(expand("<cword>"), "_\\(.\\)", "\\u\\1", "g")
    execute ":normal diw"
  elseif t == "sk"
    let s = substitute(expand("<cword>"), "_", "-", "g")
    execute ":normal diw"
  elseif t == "cs"
    let s = substitute(expand("<cword>"), "\\(\\u\\)", "_\\l\\1", "g")
    execute ":normal diw"
  elseif t == "ck"
    let s = substitute(expand("<cword>"), "\\(\\u\\)", "-\\l\\1", "g")
    execute ":normal diw"
  elseif t == "kc"
    let s = substitute(expand("<cWORD>"), "-\\(.\\)", "\\u\\1", "g")
    execute ":normal diW"
  elseif t == "ks"
    let s = substitute(expand("<cWORD>"), "-", "_", "g")
    execute ":normal diW"
  endif
  execute ":normal i" . s
  call setpos(".", p)
endfunction
