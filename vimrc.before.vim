vim9script
# Modeline and Notes {
# vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:
#
#                    __ _ _____              _
#         ___ _ __  / _/ |___ /      __   __(_)_ __ ___
#        / __| '_ \| |_| | |_ \ _____\ \ / /| | '_ ` _ \
#        \__ \ |_) |  _| |___) |_____|\ V / | | | | | | |
#        |___/ .__/|_| |_|____/        \_/  |_|_| |_| |_|
#            |_|
#
#   This is the personal .vimrc.before file of Steve Francia.
#   While much of it is beneficial for general use, I would
#   recommend picking out the parts you want and understand.
#
#   This file is for options which must be set *before* plugins
#   are loaded and the main .vimrc config is run. Most of these
#   are for preventing mappings or commands from being created.
#
#   You can find me at http://spf13.com
# }

# spf13 options {

    # Prevent automatically changing to open file directory
    #   let g:spf13_no_autochdir = 1

    # Disable views
    #   let g:spf13_no_views = 1

    # Leader keys
    #   let g:spf13_leader='\'
    #   let g:spf13_localleader='_'

    # Disable easier moving in tabs and windows
    #   let g:spf13_no_easyWindows = 1

    # Disable wrap relative motion for start/end line motions
    #   let g:spf13_no_wrapRelMotion = 1

    # Disable fast tab navigation
    #   let g:spf13_no_fastTabs = 1

    # Clear search highlighting
    #   let g:spf13_clear_search_highlight = 1

    # Disable neosnippet expansion
    # This maps over <C-k> and does some Supertab
    # emulation with snippets
    #   let g:spf13_no_neosnippet_expand = 1

    # Disable whitespace stripping
    #   let g:spf13_keep_trailing_whitespace = 1

    # Enable powerline symbols
    #   let g:airline_powerline_fonts = 1

    # vim files directory
    #   let g:spf13_consolidated_directory = <full path to desired directory>
    #   eg: let g:spf13_consolidated_directory = $HOME . '/.vim/'

    # This makes the completion popup strictly passive.
    # Keypresses acts normally. <ESC> takes you of insert mode, words don't
    # automatically complete, pressing <CR> inserts a newline, etc. Iff the
    # menu is open, tab will cycle through it. If a snippet is selected, <C-k>
    # expands it and jumps between fields.
    #   let g:spf13_noninvasive_completion = 1

    # Don't turn conceallevel or concealcursor
    #   let g:spf13_no_conceal = 1

    # For some colorschemes, autocolor will not work (eg: 'desert', 'ir_black')
    # Indent guides will attempt to set your colors smartly. If you
    # want to control them yourself, do it here.
    #   let g:indent_guides_auto_colors = 0
    #   autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#212121 ctermbg=233
    #   autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#404040 ctermbg=234

    # Leave the default font and size in GVim
    # To set your own font, do it from ~/vimrc.local.vim
    #   let g:spf13_no_big_font = 1

    # Disable  omni complete
    #   let g:spf13_no_omni_complete = 1

    # Don't create default mappings for multicursors
    # See :help multiple-cursors-mappings
    #   let g:multi_cursor_use_default_mapping=0
    #   let g:multi_cursor_next_key='<C-n>'
    #   let g:multi_cursor_prev_key='<C-p>'
    #   let g:multi_cursor_skip_key='<C-x>'
    #   let g:multi_cursor_quit_key='<Esc>'
    # Require a special keypress to enter multiple cursors mode
    #   let g:multi_cursor_start_key='+'

    # Mappings for editing/applying spf13 config
    #   let g:spf13_edit_config_mapping='<leader>ev'
    #   let g:spf13_apply_config_mapping='<leader>sv'
    
# }

import expand("./file_utility.vim")
var LoadVimScript = file_utility.CheckAndSource

# Use fork before if available {
    LoadVimScript(g:config_path .. "/vimrc.before.fork.vim")
# }

# Use local before if available {
    LoadVimScript(g:config_path .. "/vimrc.before.local.vim")
# }
