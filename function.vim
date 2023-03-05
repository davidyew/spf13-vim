vim9script

# Reusable Functions

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
    # your vimrc.before.local.vim file:
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

# Strip DOS LF {
def! g:StripDOSLineFeed()
    # Preparation: save last search, and cursor position.
    var _s = @/
    var l = line(".")
    var c = col(".")
    # do the business:
    :%s///e
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


# Check if there is a fork
# TODO: Can remove?
def! g:IsSpf13Fork(): bool
    var is_fork = 0
    var fork_files = [g:config_path .. '/vimrc.fork.vim', g:config_path .. '/vimrc.before.fork.vim', g:config_path .. '/vimrc.bundles.fork.vim']
    for fork_file in fork_files
        if filereadable(fork_file)
            is_fork = 1
            break
        endif
    endfor
    return is_fork
enddef


def! g:ExpandFilenameAndExecute(command: string, file: string)
    execute command .. " " .. file
enddef


# For edit of Spf13 Config files
def! g:EditSpf13Config()
    call g:ExpandFilenameAndExecute('tabedit', g:config_path .. '/_vimrc')
    call g:ExpandFilenameAndExecute('vsplit', g:config_path .. '/vimrc.before.vim')
    call g:ExpandFilenameAndExecute('vsplit', g:config_path .. '/vimrc.bundles.vim')

    execute bufwinnr('.vimrc') .. 'wincmd w'
    call g:ExpandFilenameAndExecute('split', g:config_path .. '/vimrc.local.vim')
    wincmd l
    call g:ExpandFilenameAndExecute('split', g:config_path .. '/vimrc.before.local.vim')
    wincmd l
    call g:ExpandFilenameAndExecute('split', g:config_path .. '/vimrc.bundles.local.vim')

    if g:IsSpf13Fork()
        execute bufwinnr('.vimrc') .. 'wincmd w'
        call g:ExpandFilenameAndExecute('split', g:config_path .. '/vimrc.fork.vim')
        wincmd l
        call g:ExpandFilenameAndExecute('split', g:config_path .. '/vimrc.before.fork.vim')
        wincmd l
        call g:ExpandFilenameAndExecute('split', g:config_path .. '/vimrc.bundles.fork.vim')
    endif

    execute bufwinnr('vimrc.local.vim') .. 'wincmd w'
enddef

# Disable mappings for edit and load spf13 config
# execute "noremap # . s:spf13_edit_config_mapping # :call <SID>EditSpf13Config()<CR>"
# execute "noremap # . s:spf13_apply_config_mapping . # :source ~/_vimrc<CR>"
