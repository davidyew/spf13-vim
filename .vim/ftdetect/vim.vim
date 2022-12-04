" For vim file extension or vimscript
augroup vimscript
    au BufNewFile,BufRead *.vim setlocal filetype=vim fileformat=unix fileencoding=utf-8 belloff=all
augroup END
