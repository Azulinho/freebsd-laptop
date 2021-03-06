" set leaderkey to ,
let mapleader = ","
let maplocalleader = "\\"

" VUNDLE {{{
"let s:bundle_path=$HOME."/.vim/bundle/"
"execute "set rtp+=".s:bundle_path."vundle/"
"call vundle#rc()

"Bundle 'gmarik/vundle'
" }}}



set encoding=utf-8
set scrolloff=3
filetype indent on
filetype on
set autoindent
set si
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
"set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile
set number
"nnoremap / /\v
"vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
"type ,<space> to clear highlighted searches
nnoremap <leader><space> :noh<cr>
"nnoremap <tab> %
"vnoremap <tab> %

set nowrap
"set textwidth=79
set formatoptions=qrn1
set colorcolumn=80
"autosave after losing focus
au FocusLost * :wa

"map leader,yr to yankring show
nnoremap <leader>yr :YRShow<cr>

"Rainbow Paratensis, always on
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces

"map leader,a to Agrep
nnoremap <leader>a :Ag

"reselect text that was just pasted
nnoremap <leader>v V`]

"set indentation values
"autocmd FileType ruby setlocal shiftwidth=2 tabstop=2

if has("autocmd")
  augroup ruby
    au BufReadPre,FileReadPre set kp=ri sw=2 ts=2 expandtab
  augroup END
endif

if has("autocmd")
  augroup python
    au BufReadPre,FileReadPre set kp=ri sw=4 ts=4 expandtab
    " Python-mode
    "" Activate rope
    " Keys:
    " K             Show python docs
    " <Ctrl-Space>  Rope autocomplete
    " <Ctrl-c>g     Rope goto definition
    " <Ctrl-c>d     Rope show documentation
    " <Ctrl-c>f     Rope find occurrences
    " <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
    " [[            Jump on previous class or function (normal, visual, operator modes)
    " ]]            Jump on next class or function (normal, visual, operator modes)
    " [M            Jump on previous class or method (normal, visual, operator modes)
    " ]M            Jump on next class or method (normal, visual, operator modes)

    " http://unlogic.co.uk/2013/02/08/vim-as-a-python-ide/#comment-1703589179
    let g:pymode_rope_completion = 0

    " Documentation
    let g:pymode_doc = 1
    let g:pymode_doc_key = 'K'

    "Linting
    let g:pymode_lint = 1
    let g:pymode_lint_checkers = ["pep8","pyflakes"]
    " Auto check on save
    let g:pymode_lint_write = 1

    " Support virtualenv
    let g:pymode_virtualenv = 1

    " Enable breakpoints plugin
    let g:pymode_breakpoint = 1
    let g:pymode_breakpoint_bind = '<leader>b'

    " syntax highlighting
    let g:pymode_syntax = 1
    let g:pymode_syntax_all = 1
    let g:pymode_syntax_indent_errors = g:pymode_syntax_all
    let g:pymode_syntax_space_errors = g:pymode_syntax_all

    " pep8-compatible python indent
    let g:pymode_indent = 1
    " autofold code
    let g:pymode_folding = 1

    " Override go-to.definition key shortcut to Ctrl-]
    let g:pymode_rope_goto_definition_bind = "<C-]>"

    " Override view python doc key shortcut to Ctrl-Shift-d
    let g:pymode_doc_bind = "<C-S-d>"

    " autoimport modules by default
    let g:pymode_rope_autoimport = 0


  augroup END
endif



"set t_Co=256 "lets support 256 colors

:"VisualExplorer
map ve :VE<CR>
"NerdTree
map nt :NERDTreeTabsToggle<CR>:vertical resize 40<CR>
let g:NERDTreeDirArrows=1
let g:EasyMotion_leader_key = '<Leader>'
let g:NERDTreeWinPos = "left"
let g:nerdtree_tabs_open_on_console_startup=0
let g:NERDTreeWinSize = 40
let g:nerdtree_tabs_smart_startup_focus=1
let NERDTreeQuitOnOpen = 1


"Move through window splits
"map wl :wincmd l<CR>
"map wh :wincmd h<CR>
"map wj :wincmd j<CR>
"map wk :wincmd k<CR>
"
"vim menu
map mn :emenu<SPACE>

"
"set background=dark
"set t_Co=256
"colorscheme elive
"colorscheme Monokai
"
"
"this colorscheme uses a white on black background with the tango pallete
set background=dark
set t_Co=256
"colorscheme neverland-darker
"colorscheme elive
colorscheme hybrid

"set background=light
"let g:solarized_termcolors=256
"colorscheme solarized
"set t_Co=256

"set t_Co=256

"set t_Co=16
"let g:solarized_termcolors=256
"set background=dark " dark | light "
"colorscheme solarized
"call togglebg#map("<F5>")


"colorscheme wargrey
"colorscheme donbass
"colorscheme blueshift
"colorscheme newsprint
"colorscheme buttercream
"colorscheme Tomorrow
"set background=light
"colorscheme hybrid-light


" these colorschemes use a black on white terminal settings and the tango
" pallete
"colorscheme autumn
"colorscheme azul
"
"colorscheme literal_tango


nnoremap <Leader>csd1 :set background=dark<Cr>:colorscheme default<Cr>:colorscheme elive<Cr>
nnoremap <Leader>csd2 :set background=dark<Cr>:colorscheme default<Cr>:colorscheme neverland-darker<Cr>
nnoremap <Leader>csd3 :set background=dark<Cr>:colorscheme default<Cr>:colorscheme hybrid<Cr>
nnoremap <Leader>csd4 :set background=dark<Cr>:colorscheme default<Cr>:colorscheme candycode<Cr>

nnoremap <Leader>csl1 :set background=light<Cr>:colorscheme default<Cr>:colorscheme hybrid-light<Cr>
nnoremap <Leader>csl2 :set background=light<Cr>:colorscheme default<Cr>:colorscheme calmar256-light<Cr>
nnoremap <Leader>csl3 :set background=light<Cr>:colorscheme default<Cr>:colorscheme literal_tango<Cr>
nnoremap <Leader>csl4 :set background=light<Cr>:colorscheme default<Cr>:colorscheme azul<Cr>
nnoremap <Leader>csl5 :set background=light<Cr>:colorscheme default<Cr>:colorscheme bw<Cr>


" Tabline colors
hi TabLine      ctermfg=Black  ctermbg=DarkGrey     cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=DarkGrey     cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=Blue  cterm=NONE

" MiniBufExpl Colors
hi MBENormal               guifg=#808080 guibg=fg
hi MBEChanged              guifg=#CD5907 guibg=fg
hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
hi MBEVisibleChanged       guifg=#F1266F guibg=fg
hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg

"let g:miniBufExplVSplit = 20   " column width in chars

"
set backspace=indent,eol,start  " backspace through everything in insert mode
"
""" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"enable vim neocomplete
let g:neocomplete#enable_at_startup = 1
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" A vim plugin to display the indention levels with thin vertical line
"let g:indentLine_color_term = 239
let g:indentLine_char = '|'
:set list lcs=tab:\|\

"enable modelines for syntax highlighted
set modelines=99999
set modeline

"disable backups and swapfiles
set nobackup
set noswapfile

"Set taglist to the left
let Tlist_Use_Left_Window   = 1

"Use :Edit .vim/colors/* to open all files in that directory
com! -complete=file -nargs=* Edit silent! exec "!vim --servername " . v:servername . " --remote-silent <args>"

"TSelectBuffer -> buffer list
map tsb :TSelectBuffer<cr>

"ctrlp-modified.vim
map <Leader>m :CtrlPModified<CR>
map <Leader>M :CtrlPBranch<CR>

"ctrlp-funky
let g:ctrlp_extensions = ['funky']
nnoremap <Leader>fu :CtrlPFunky<Cr>
"narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

"ctrl-tjump
nnoremap <c-]> :sp<Cr>:CtrlPtjump<cr>
vnoremap <c-]> :sp<Cr>:CtrlPtjumpVisual<cr>
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <leader>bt :CtrlPBufTag<cr>

"Ctrl-P in buffer-list mode
map <Leader>bl :CtrlPBuffer<CR>
map <Leader>cpb :CtrlPBuffer<CR>
map <Leader>cpm :CtrlPMixed<CR>
map <Leader>cpt :CtrlPTag<CR>

"slimux
map <C-c><C-c> :SlimuxREPLSendLine<CR>
vmap <C-c><C-c> :SlimuxREPLSendSelection<CR>

"slime
"let g:slime_python_ipython = 1
"let g:slime_target = "tmux"

"xml
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

"disable syntastic for rextex files
let g:syntastic_ignore_files = ['.*\.rst']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0


" disable autosave session
let g:session_autosave = 'no'


set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_older_paste

" // The switch of the Source Explorer
nmap <leader>se :SrcExplToggle<CR><CR>

" // Set the height of Source Explorer window
let g:SrcExpl_winHeight = 6

" // Set 100 ms for refreshing the Source Explorer
let g:SrcExpl_refreshTime = 100

" // Set "Enter" key to jump into the exact definition context
let g:SrcExpl_jumpKey = "<ENTER>"

" // Set "Space" key for back from the definition context
let g:SrcExpl_gobackKey = "<SPACE>"

" // In order to avoid conflicts, the Source Explorer should know what plugins
" // except itself are using buffers. And you need add their buffer names into
" // below listaccording to the command ":buffers!"
let g:SrcExpl_pluginList = [
        \ "__Tag_List__",
        \ "_NERD_tree_"
    \ ]
noremap <leader>tsb :TSelectBuffer<cr>

noremap <leader>tig :!tig %<cr>

"TagBar is set by defaul to ,tg
noremap <leader>tb :TagbarToggle<cr>:TagbarTogglePause<cr>


" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_buffers = 1
"
" " Show just the filename
 let g:airline#extensions#tabline#fnamemod = ':t'

" Set airline theme to sol
"let g:airline_theme='sol'

" Move to the next buffer
nmap <leader>l :bnext<CR><CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR><CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" close the split
nmap <leader>c :close <Cr>


nnoremap <leader>s :ScratchToggle<cr>

" Move to the buffers using numbers
noremap <leader>1 :b1<cr>
noremap <leader>2 :b2<cr>
noremap <leader>3 :b3<cr>
noremap <leader>4 :b4<cr>
noremap <leader>5 :b5<cr>
noremap <leader>6 :b6<cr>
noremap <leader>7 :b7<cr>
noremap <leader>8 :b8<cr>
noremap <leader>9 :b9<cr>
noremap <leader>l :bprevious <cr>

" fix lagging with syntax highlighting
"set synmaxcol=180
set synmaxcol=500

" fix some issuews with python mode
let g:pymode_rope_lookup_project = 0
let g:pymode_rope = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_completion = 0

" The next line maps Jedi's jump to de­f­i­n­i­tion/de­c­la­ra­tion fea­ture to
" the <leader>g short­cut:
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>



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

set tags=tags;/


let g:indentLine_color_term = 101
let g:indentLine_noConcealCursor = 1


set textwidth=0 wrapmargin=0

let g:neosnippet#snippets_directory = '~/.vim/bundle/vim-snippets/snippets,~/.vim/bundle/serverspec-snippets'


" Puppet Integration {{{
command! -nargs=+ Grep execute "noautocmd silent lvimgrep /<args>/gj ~/puppet/**/*.pp" | lopen 10
"set shellcmdflag=-ic
set kp=pi
set iskeyword=-,:,@,48-57,_,192-255
set tags=tags;~/
" }}}
"
"

"set various files to use ruby filetyp
au BufRead,BufNewFile {Gemfile,Vagrantfile,Berksfile,Rakefile} set ft=ruby
au BufRead,BufNewFile {*.yaml,*.yml} set ft=yaml


"Konfekt/FastFold
set foldmethod=syntax

let g:tex_fold_enabled=1
let g:vimsyn_folding='af'
let g:xml_syntax_folding = 1
let g:php_folding = 1
let g:perl_fold = 1
let g:python_fold = 1
let g:ruby_fold = 1


"{{{{ python
" fix some issuews with python mode
let g:pymode_rope_lookup_project = 0
let g:pymode_rope = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_completion = 0

"Plugin 'davidhalter/jedi-vim'
"let g:jedi#use_tabs_not_buffers = 0
"let g:jedi#use_splits_not_buffers = "left"
"let g:jedi#show_call_signatures = "0"
""end of python }}}}

" fixes slow issue with folds
" uses Plugin 'Konfekt/FastFold'
set foldmethod=syntax
let g:tex_fold_enabled=1
let g:vimsyn_folding='af'
let g:xml_syntax_folding = 1
let g:php_folding = 1
let g:perl_fold = 1
let g:python_fold = 1
let g:ruby_fold = 1

" disable autoresize of vim windows
let g:AUTORESIZE_AUTOCMD_DISABLE = 1

" collapse all folds by default
set foldlevel=0

" undotree
nnoremap <leader>tu :UndoTreeToggle<cr>

" tig
function! s:tig_status()
  cd `driller --scm-root %`
  !tig status
endfunction

map <leader>tig :TigStatus<CR><CR>
command! TigStatus call s:tig_status()
