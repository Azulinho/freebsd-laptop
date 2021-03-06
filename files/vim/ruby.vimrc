" _. Ruby {{{
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'ecomba/vim-ruby-refactoring'

autocmd FileType ruby,eruby,yaml set tw=80 ai sw=2 sts=2 et
autocmd FileType ruby,eruby,yaml setlocal foldmethod=manual
autocmd User Rails set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

"set various files to use ruby filetyp
au BufRead,BufNewFile {Gemfile,Vagrantfile,Berksfile,Rakefile} set ft=ruby

if has("autocmd")
  augroup ruby
    au BufReadPre,FileReadPre set kp=ri sw=2 ts=2 expandtab
  augroup END
endif
" }}}
"
"
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

