vim9script
# General {

    set background=dark         # Assume a dark background

    # Allow to trigger background
    def! g:ToggleBG()
        var s:tbg = &background
        # Inversion
        if s:tbg == "dark"
            set background=light
        else
            set background=dark
        endif
    enddef
    noremap <leader>bg :call ToggleBG()<CR>

    # if !has('gui')
        # set term=$TERM          # Make arrow and other keys work
    # endif
    filetype plugin on          # Automatically load plugins
    filetype plugin indent on   # Automatically detect indent files for file types.
    syntax on                   # Syntax highlighting
    set mouse=a                 # Automatically enable mouse usage
    set mousehide               # Hide the mouse cursor while typing
    scriptencoding utf-8

    if has('clipboard')
        if has('unnamedplus')  # When possible use + register for copy-paste
            set clipboard=unnamed,unnamedplus
        else         # On mac and Windows, use * register for copy-paste
            set clipboard=unnamed
        endif
    endif

    # Most prefer to automatically switch to the current file directory when
    # a new buffer is opened; to prevent this behavior, add the following to
    # your .vimrc.before.local file:
    #   g:spf13_no_autochdir = 1
    if !exists('g:spf13_no_autochdir')
        autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
        # Always switch to the current file directory
    endif

    set autowrite                       # Automatically write a file when leaving a modified buffer
    set shortmess+=filmnrxoOtT          # Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash # Better Unix / Windows compatibility
    set virtualedit=onemore             # Allow for cursor beyond last character
    set history=1000                    # Store a ton of history (default is 20)
    set spell                           # Spell checking on
    set hidden                          # Allow buffer switching without saving
    set iskeyword-=.                    # '.' is an end of word designator
    set iskeyword-=#                    # '#' is an end of word designator
    set iskeyword-=-                    # '-' is an end of word designator

    # Instead of reverting the cursor to the last position in the buffer, we
    # set it to the first line when editing a git commit message
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG setpos('.', [0, 1, 1, 0])

    # http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
    # Restore cursor to file position in previous editing session
    # To disable this, add the following to your .vimrc.before.local file:
    #   g:spf13_no_restore_cursor = 1
    if !exists('g:spf13_no_restore_cursor')
        def! g:ResCur(): number
            if line("'\"") <= line("$")
                silent! normal! g`"
                return 1
            endif
	    return 0
        enddef

        augroup resCur
            autocmd!
	    autocmd BufWinEnter * g:ResCur()         
    	augroup END
    endif

    # Setting up the directories {
        set backup                  # Backups are nice ...
        if has('persistent_undo')
            set undofile                # So is persistent undo ...
            set undolevels=1000         # Maximum number of changes that can be undone
            set undoreload=10000        # Maximum number lines to save for undo on a buffer reload
        endif

        # To disable views add the following to your .vimrc.before.local file:
        #   g:spf13_no_views = 1
        if !exists('g:spf13_no_views')
            # Add exclusions to mkview and loadview
            # eg: *.*, svn-commit.tmp
            g:skipview_files = [
                \ '\[example pattern\]'
                \ ]
        endif
    # }

# }
