" For vimwiki file extension
augroup wiki
    au BufNewFile,BufRead *.wiki setlocal filetype=wiki fileformat=unix fileencoding=utf-8 belloff=all
augroup END
