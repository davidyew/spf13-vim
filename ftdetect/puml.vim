augroup puml
    autocmd!
    au BufNewFile,BufRead *.puml set filetype=puml
    au BufWritePost *.puml silent! :term ++hidden ++norestore c:/Apps/plantuml.bat %:p
augroup END
