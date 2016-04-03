
"NerdTree
Bundle 'scrooloose/nerdtree'

nmap <C-i> :NERDTreeToggle<CR>

" Disable the scrollbars (NERDTree)
set guioptions-=r
set guioptions-=L
" Keep NERDTree window fixed between multiple toggles
set winfixwidth
" }}}

" think this next one is gone
"map nt :NERDTreeTabsToggle<CR>:vertical resize 40<CR>
map nt :NERDTreeToggle<CR>:vertical resize 40<CR>
let g:NERDTreeDirArrows=1
let g:EasyMotion_leader_key = '<Leader>'
let g:NERDTreeWinPos = "left"
let g:nerdtree_tabs_open_on_console_startup=0
let g:NERDTreeWinSize = 40
let g:nerdtree_tabs_smart_startup_focus=1
let NERDTreeQuitOnOpen = 1

" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
