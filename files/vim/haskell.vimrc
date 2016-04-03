
" _. Haskell {{{
Bundle 'Twinside/vim-syntax-haskell-cabal'
Bundle 'lukerandall/haskellmode-vim'

au BufEnter *.hs compiler ghc

let g:ghc = "/usr/local/bin/ghc"
let g:haddock_browser = "open"
" }}}
