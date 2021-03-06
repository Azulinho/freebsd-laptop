
set autoread
set backspace=indent,eol,start
set binary
set cinoptions=:0,(s,u0,U1,g0,t0
set completeopt=menuone,preview
set encoding=utf-8
set hidden
set history=1000
set incsearch
set laststatus=2

" set all verticals panes to be at least 80 chars wide
set winwidth=80
" and this should allows us to have 4 panes side by side
set winminwidth=77

" set all splits to at least

" Don't redraw while executing macros
set nolazyredraw

" Disable the macvim toolbar
set guioptions-=T

set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:␣
set showbreak=↪

set notimeout
set ttimeout
set ttimeoutlen=10

set modelines=0
set noeol
if exists('+relativenumber')
  set relativenumber
endif
set numberwidth=3
set winwidth=83
set ruler

if executable('/bin/bash')
  set shell=/bin/bash
endif

set showcmd

set exrc
set secure

set matchtime=2

set completeopt=longest,menuone,preview

" White characters {{{
set autoindent
set tabstop=4
set softtabstop=4
set textwidth=80
set shiftwidth=4
set expandtab
set wrap
set formatoptions=qrn1
if exists('+colorcolumn')
  set colorcolumn=+1
endif
" }}}

set visualbell

set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc,tmp,*.scssc
set wildmenu

set dictionary=/usr/share/dict/words
" }}}

set encoding=utf-8

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3
filetype indent on
filetype on
set autoindent
set si
set showmode
set showcmd
set hidden
set wildmenu
" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
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
set nowrap

"set textwidth=79
set formatoptions=qrn1
set colorcolumn=80
"autosave after losing focus
au FocusLost * :wa

set backspace=indent,eol,start  " backspace through everything in insert mode
"enable modelines for syntax highlighted
set modelines=99999
set modeline
set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" fix lagging with syntax highlighting
"set synmaxcol=180
set synmaxcol=500
set textwidth=0 wrapmargin=0

" disable autoresize of vim windows
let g:AUTORESIZE_AUTOCMD_DISABLE = 1

" collapse all folds by default
set foldlevel=0


filetype plugin indent on

syntax on

" enter insert mode
let &t_SI = "\<Esc>]12;red\x7"

" exit insert mode
let &t_EI = "\<Esc>]12;orange\x7"

