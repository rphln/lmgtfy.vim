" lmgtfy.vim
" Search stuff on the web.
"
" Maintainer: Raphael Nepomuceno
" Version: 1.0.0
" Last Change: Aug 29, 2020
" Repository: https://github.com/rphln/lmgtfy.vim
"
" Copyright (c) 2020 Raphael Nepomuceno. All rights reserved.
" Licensed under the MIT License. See LICENSE in the project root for license
" information.

if exists("g:loaded_lmgtfy")
  finish
endif

let g:loaded_lmgtfy = v:true

let g:lmgtfy#duckduckgo = get(g:, "lmgtfy#duckduckgo", "https://duckduckgo.com/?q=%s")
let g:lmgtfy#github = get(g:, "lmgtfy#github", "https://github.com/search?q=%s")
let g:lmgtfy#google = get(g:, "lmgtfy#google", "https://www.google.com/search?gl=us&hl=en&q=%s")
let g:lmgtfy#grep = get(g:, "lmgtfy#grep", "https://grep.app/search?q=%s")

noremap <expr> <Plug>(lmgtfy-duckduckgo) lmgtfy#key(g:lmgtfy#duckduckgo)
noremap <expr> <Plug>(lmgtfy-github) lmgtfy#key(g:lmgtfy#github)
noremap <expr> <Plug>(lmgtfy-google) lmgtfy#key(g:lmgtfy#google)
noremap <expr> <Plug>(lmgtfy-grep) lmgtfy#key(g:lmgtfy#grep)

command -nargs=1 LMDuck call lmgtfy#search(g:lmgtfy#duckduckgo, "<args>")
command -nargs=1 LMGitHub call lmgtfy#search(g:lmgtfy#github, "<args>")
command -nargs=1 LMGoogle call lmgtfy#search(g:lmgtfy#google, "<args>")
command -nargs=1 LMGrep call lmgtfy#search(g:lmgtfy#grep, "<args>")

" vim: set sw=2 ts=2 et:
