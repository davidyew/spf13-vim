" For vimwiki file extension
augroup wiki
    au BufNewFile,BufRead *.wiki setlocal filetype=vimwiki fileformat=unix fileencoding=utf-8 belloff=all
augroup END
