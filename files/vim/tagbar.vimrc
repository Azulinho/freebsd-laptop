
Bundle 'majutsushi/tagbar'
nmap <leader>t :TagbarToggle<CR>

let g:tagbar_type_scala = {
    \ 'ctagstype' : 'Scala',
    \ 'kinds'     : [
        \ 'p:packages:1',
        \ 'V:values',
        \ 'v:variables',
        \ 'T:types',
        \ 't:traits',
        \ 'o:objects',
        \ 'a:aclasses',
        \ 'c:classes',
        \ 'r:cclasses',
        \ 'm:methods'
    \ ]
\ }


"TagBar is set by defaul to ,tg
noremap <leader>tb :TagbarToggle<cr>:TagbarTogglePause<cr>

" autofocus on tagbar open
let g:tagbar_autofocus = 1
