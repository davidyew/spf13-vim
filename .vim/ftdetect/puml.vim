vim9script
#augroup puml
#    autocmd!
    au BufNewFile,BufRead *.{puml,iuml} set filetype=puml
    autocmd BufWritePre *.{puml,iuml} call g:StripTrailingWhitespace()
    # au BufWritePost *.puml silent! :term ++hidden ++norestore c:/Apps/plantuml.bat %:p

    # Pre-requisite
    # Please add PLANTUML into environment variable, e.g:
    # PLANTUML=C:\App\plantuml.jar,
    # where exists $PLANTUML
    if empty($PLANTUML)
        throw 'Missing environment variable:PLANTUML for PLANTUML folder path'
    elseif stridx($PLANTUML, ".jar") == -1
        throw 'environment variable:PLANTUML is missing plantuml java jar file'
    endif

    g:plantuml_jar_filepath = $PLANTUML
    if empty(glob(g:plantuml_jar_filepath))
        throw g:plantuml_jar_filepath .. ' is not found!'
    endif

    if has('win64') || has('win32')
        # command to run plantuml.jar on file
        # graph engine can be changed
        # https://plantuml.com/smetana02
        # -Playout=smetana
        # https://plantuml.com/elk
        # -Playout=elk
        #
        g:run_plantuml_cmd = 'START /B java -DPLANTUML_SECURITY_PROFILE=UNSECURE -jar ' .. g:plantuml_jar_filepath .. ' %'
        # g:run_plantuml_cmd = 'START /B java -DPLANTUML_SECURITY_PROFILE=UNSECURE -jar ' .. g:plantuml_jar_filepath .. ' -Playout=smetana %'
        # Run silently C:\app\puml.bat on full path of current buffer that is a *.puml file
        # START /B run batch program in background
        # without creating a hidden buffer window
        # PNG Output
        # autocmd BufWrite *.puml :silent execute '!' .. g:run_plantuml_cmd .. ' -Tpng'
        # SVG Output
        # autocmd BufWrite *.puml :silent execute '!' .. g:run_plantuml_cmd .. ' -Tsvg'
        autocmd BufWritePost *.puml :silent execute '!' .. g:run_plantuml_cmd .. ' -Tsvg'
    else
        autocmd BufWritePost *.puml :silent execute '!java -jar ' .. g:plantuml_jar_filepath ..' % -Tsvg &'
    endif
# augroup END
