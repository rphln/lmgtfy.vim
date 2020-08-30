" lmgtfy.vim
"
" Copyright (c) 2020 Raphael Nepomuceno. All rights reserved.
" Licensed under the MIT License. See LICENSE in the project root for license
" information.

function! lmgtfy#key(engine) abort
  let g:lmgtfy#engine = a:engine

  set operatorfunc=lmgtfy#opfunc
  return 'g@'
endfunction

function! lmgtfy#opfunc(type, ...) abort
  let l:reg = @"

  try
    if empty(get(g:, "lmgtfy#engine", ""))
      echoerr "Failed to search: `g:lmgtfy#engine` must be set."
    end

    if a:type ==# 'line'
      normal! `[V`]""y
    elseif a:type ==# 'char'
      normal! `[v`]""y
    else
      echoerr "Failed to search: blockwise selection is unsupported."
    end

    call lmgtfy#search(g:lmgtfy#engine, @")
  finally
    let @" = l:reg
  endtry
endfunction

function! lmgtfy#search(engine, text) abort
  call netrw#BrowseX(printf(a:engine, s:url_escape(a:text)), v:false)
endfunction

function! s:url_escape(string) abort
  return substitute(a:string, '\W', '\=printf("%%%02X", char2nr(submatch(0)))', 'g')
endfunction
