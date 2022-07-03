vim9script
#augroup puml
#    autocmd!
    au BufNewFile,BufRead *.puml setlocal filetype=puml
    # au BufWritePost *.puml silent! :term ++hidden ++norestore c:/Apps/plantuml.bat %:p

    # Pre-requisite
    # Please add PLANTUML into environment variable, e.g: PLANTUML=C:\App,
    # where exists $PLANTUML\plantuml.jar

    if has("win64") || has("win32")
        # Run silently C:\app\puml.bat on full path of current buffer that is a *.puml file
        # START /B run batch program in background
        # without creating a hiddent buffer window
        # PNG Output
         autocmd BufWrite *.puml :silent execute '!START /B java -jar ' .. $PLANTUML .. '\\plantuml.jar % -Tpng'
        # SVG Output
        autocmd BufWrite *.puml :silent execute '!START /B java -jar ' .. $PLANTUML .. '\\plantuml.jar % -Tsvg'
    else
        autocmd BufWrite *.puml :silent execute '!java -jar ' .. $PLANTUML .. '\\plantuml.jar % -Tsvg &'
    endif
# augroup END
