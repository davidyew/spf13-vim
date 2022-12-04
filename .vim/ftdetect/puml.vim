vim9script
#augroup puml
#    autocmd!
    au BufNewFile,BufRead *.puml setlocal filetype=puml
    # au BufWritePost *.puml silent! :term ++hidden ++norestore c:/Apps/plantuml.bat %:p

    # Pre-requisite
    # Please add PLANTUML into environment variable, e.g: PLANTUML=C:\App,
    # where exists $PLANTUML\plantuml.jar
    if empty($PLANTUML)
        throw 'Missing environment variable:PLANTUML'
    endif

    g:plantuml_jar_filepath = $PLANTUML .. '\\plantuml.jar'
    if empty(glob(g:plantuml_jar_filepath))
        throw g:plantuml_jar_filepath .. ' is not found!'
    endif

    if has('win64') || has('win32')
        # command to run plantuml.jar on file
        g:run_plantuml_cmd = 'START /B java -jar ' .. g:plantuml_jar_filepath .. ' %'
        # Run silently C:\app\puml.bat on full path of current buffer that is a *.puml file
        # START /B run batch program in background
        # without creating a hidden buffer window
        # PNG Output
        # autocmd BufWrite *.puml :silent execute '!' .. g:run_plantuml_cmd .. ' -Tpng'
        # SVG Output
        autocmd BufWrite *.puml :silent execute '!' .. g:run_plantuml_cmd .. ' -Tsvg'
    else
        autocmd BufWrite *.puml :silent execute '!java -jar ' .. plantuml_jar_filepath ..' % -Tsvg &'
    endif
# augroup END
