
" better backup, swap and undos storage
"
set undofile " persistent undos, undo after you re-open the file
set undodir=~/.vim/tmp/undo     " undo files
set undolevels=3000
set undoreload=10000

set backup " make backup files
set backupdir=~/.vim/tmp/backup " backups

set swapfile
set directory=~/.vim/tmp/swap   " swap files

set viminfo+=n~/.vim/tmp/viminfo

" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

" enable autosave session
let g:session_autosave = 'yes'
