vim9script
# Functions {

    # Initialize directories {
    def! g:InitializeDirectories()
        var parent = $HOME
        var prefix = 'vim'
        var dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }

        if has('persistent_undo')
            dir_list['undo'] = 'undodir'
        endif

        var common_dir = ''

        # To specify a different directory in which to place the vimbackup,
        # vimviews, vimundo, and vimswap files/directories, add the following to
        # your .vimrc.before.local file:
        #   g:spf13_consolidated_directory = <full path to desired directory>
        #   eg: g:spf13_consolidated_directory = $HOME . '/.vim/'
        if exists('g:spf13_consolidated_directory')
            common_dir = g:spf13_consolidated_directory .. prefix
        else
            common_dir = parent .. '/.' .. prefix
        endif

        for [dirname, settingname] in items(dir_list)
            var directory = common_dir .. dirname .. '/'
            if exists("*mkdir")
                if !isdirectory(directory)
                    mkdir(directory)
                endif
            endif
            if !isdirectory(directory)
                echo "Warning: Unable to create backup directory: " .. directory
                echo "Try: mkdir -p " .. directory
            else
                directory = substitute(directory, " ", "\\\\ ", "g")
                execute 'set ' .. settingname .. '=' .. directory
            endif
        endfor
    enddef
    g:InitializeDirectories()
    # }

    # Initialize NERDTree as needed {
    def! g:NERDTreeInitAsNeeded()
        redir => bufoutput
        buffers!
        redir END
        var idx = stridx(bufoutput, "NERD_tree")
        if idx > -1
            NERDTreeMirror
            NERDTreeFind
            wincmd l
        endif
    enddef
    # }

    # Strip whitespace {
    def! g:StripTrailingWhitespace()
        # Preparation: save last search, and cursor position.
        var _s = @/
        var l = line(".")
        var c = col(".")
        # do the business:
        :%s/\s\+$//e
        # clean up: restore previous search history, and cursor position
        @/ = _s
        cursor(l, c)
    enddef
    # }

    # Shell command {
    def! g:RunShellCommand(cmdline: string)
        botright new

        setlocal buftype=nofile
        setlocal bufhidden=delete
        setlocal nobuflisted
        setlocal noswapfile
        setlocal nowrap
        setlocal filetype=shell
        setlocal syntax=shell

        setline(1, a:cmdline)
        setline(2, substitute(a:cmdline, '.', '=', 'g'))
        execute 'silent $read !' . escape(a:cmdline, '%#')
        setlocal nomodifiable
        1
    enddef

    command! -complete=file -nargs=+ Shell s:RunShellCommand(<q-args>)
    # e.g. Grep current file for <search_term>: Shell grep -Hn <search_term> %
    # }

    def! g:IsSpf13Fork()
        var s:is_fork = 0
        var s:fork_files = ["~/.vimrc.fork", "~/.vimrc.before.fork", "~/.vimrc.bundles.fork"]
        for fork_file in s:fork_files
            if filereadable(expand(fork_file, ":p"))
                var s:is_fork = 1
                break
            endif
        endfor
        return s:is_fork
    enddef

    def! g:ExpandFilenameAndExecute(command: string, file: string)
        execute a:command .. " " .. expand(a:file, ":p")
    enddef

    def! g:EditSpf13Config()
        <SID>ExpandFilenameAndExecute("tabedit", "~/.vimrc")
        <SID>ExpandFilenameAndExecute("vsplit", "~/.vimrc.before")
        <SID>ExpandFilenameAndExecute("vsplit", "~/.vimrc.bundles")

        execute bufwinnr(".vimrc") . "wincmd w"
        <SID>ExpandFilenameAndExecute("split", "~/.vimrc.local")
        wincmd l
        <SID>ExpandFilenameAndExecute("split", "~/.vimrc.before.local")
        wincmd l
        <SID>ExpandFilenameAndExecute("split", "~/.vimrc.bundles.local")

        if <SID>IsSpf13Fork()
            execute bufwinnr(".vimrc") . "wincmd w"
            <SID>ExpandFilenameAndExecute("split", "~/.vimrc.fork")
            wincmd l
            <SID>ExpandFilenameAndExecute("split", "~/.vimrc.before.fork")
            wincmd l
            <SID>ExpandFilenameAndExecute("split", "~/.vimrc.bundles.fork")
        endif

        execute bufwinnr(".vimrc.local") . "wincmd w"
    enddef

    # Disable
    # execute "noremap # . s:spf13_edit_config_mapping # :call <SID>EditSpf13Config()<CR>"
    # execute "noremap # . s:spf13_apply_config_mapping . # :source ~/.vimrc<CR>"
# }
