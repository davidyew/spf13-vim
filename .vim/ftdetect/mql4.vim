autocmd BufNewFile,BufReadPost *.mq[h45] setlocal filetype=mql4 fileformat=unix
autocmd BufWritePre *.mq[h45] :call g:StripTrailingWhitespace() | call g:StripDOSLineFeed()
