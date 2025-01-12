vim9script

import expand(g:config_path .. "/operating_systems.function.vim") as OS

# Key (re)Mappings {

    # The default leader is '\', but many people prefer ',' as it's in a standard
    # location. To override this behavior and set it back to '\' (or any other
    # character) add the following to your .vimrc.before.local file:
    #   g:spf13_leader='\'
    if !exists('g:spf13_leader')
        g:mapleader = ','
    else
        g:mapleader = g:spf13_leader
    endif
    if !exists('g:spf13_localleader')
        g:maplocalleader = '_'
    else
        g:maplocalleader = g:spf13_localleader
    endif

    # The default mappings for editing and applying the spf13 configuration
    # are <leader>ev and <leader>sv respectively. Change them to your preference
    # by adding the following to your .vimrc.before.local file:
    #   g:spf13_edit_config_mapping ='<leader>ec'
    #   g:spf13_apply_config_mapping = <leader>sc'
    if !exists('g:spf13_edit_config_mapping')
        g:spf13_edit_config_mapping = '<leader>ev'
    else
        g:spf13_edit_config_mapping = g:spf13_edit_config_mapping
    endif
    if !exists('g:spf13_apply_config_mapping')
        g:spf13_apply_config_mapping = '<leader>sv'
    else
        g:spf13_apply_config_mapping = g:spf13_apply_config_mapping
    endif

    # Easier moving in tabs and windows
    # The lines conflict with the default digraph mapping of <C-K>
    # If you prefer that functionality, add the following to your
    # .vimrc.before.local file:
    #   g:spf13_no_easyWindows = 1
    if !exists('g:spf13_no_easyWindows')
        map <C-J> <C-W>j<C-W>_
        map <C-K> <C-W>k<C-W>_
        map <C-L> <C-W>l<C-W>_
        map <C-H> <C-W>h<C-W>_
    endif

    # Wrapped lines goes down/up to next row, rather than next line in file.
    noremap j gj
    noremap k gk

    # End/Start of line motion keys act relative to row/wrap width in the
    # presence of `:set wrap`, and relative to line for `:set nowrap`.
    # Default vim behaviour is to act relative to text line in both cases
    # If you prefer the default behaviour, add the following to your
    # .vimrc.before.local file:
    #   g:spf13_no_wrapRelMotion = 1
    # TODO:
    # if !exists('g:spf13_no_wrapRelMotion')
    #     # Same for 0, home, end, etc
    #     def! g:WrapRelativeMotion(key: string, ...number: list<number>)
    #         var vis_sel = ""
    #         if a:0
    #             var vis_sel = "gv"
    #         endif
    #         if &wrap
    #             execute "normal!" vis_sel . "g" . a:key
    #         else
    #             execute "normal!" vis_sel . a:key
    #         endif
    #     enddef

    #     # Map g* keys in Normal, Operator-pending, and Visual+select
    #     noremap $ :call WrapRelativeMotion("$")<CR>
    #     noremap <End> :call WrapRelativeMotion("$")<CR>
    #     noremap 0 :call WrapRelativeMotion("0")<CR>
    #     noremap <Home> :call WrapRelativeMotion("0")<CR>
    #     noremap ^ :call WrapRelativeMotion("^")<CR>
    #     # Overwrite the operator pending $/<End> mappings from above
    #     # to force inclusive motion with :execute normal!
    #     onoremap $ v:call WrapRelativeMotion("$")<CR>
    #     onoremap <End> v:call WrapRelativeMotion("$")<CR>
    #     # Overwrite the Visual+select mode mappings from above
    #     # to ensure the correct vis_sel flag is passed to function
    #     vnoremap $ :<C-U>call WrapRelativeMotion("$", 1)<CR>
    #     vnoremap <End> :<C-U>call WrapRelativeMotion("$", 1)<CR>
    #     vnoremap 0 :<C-U>call WrapRelativeMotion("0", 1)<CR>
    #     vnoremap <Home> :<C-U>call WrapRelativeMotion("0", 1)<CR>
    #     vnoremap ^ :<C-U>call WrapRelativeMotion("^", 1)<CR>
    # endif

    # The following two lines conflict with moving to top and
    # bottom of the screen
    # If you prefer that functionality, add the following to your
    # .vimrc.before.local file:
    #   g:spf13_no_fastTabs = 1
    if !exists('g:spf13_no_fastTabs')
        map <S-H> gT
        map <S-L> gt
    endif

    # Stupid shift key fixes
    if !exists('g:spf13_no_keyfixes')
        if has("user_commands")
            command! -bang -nargs=* -complete=file E e<bang> <args>
            command! -bang -nargs=* -complete=file W w<bang> <args>
            command! -bang -nargs=* -complete=file Wq wq<bang> <args>
            command! -bang -nargs=* -complete=file WQ wq<bang> <args>
            command! -bang Wa wa<bang>
            command! -bang WA wa<bang>
            command! -bang Q q<bang>
            command! -bang QA qa<bang>
            command! -bang Qa qa<bang>
        endif

        cmap Tabe tabe
    endif

    # Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$

    # Code folding options
    nmap <leader>f0 :set foldlevel=0<CR>
    nmap <leader>f1 :set foldlevel=1<CR>
    nmap <leader>f2 :set foldlevel=2<CR>
    nmap <leader>f3 :set foldlevel=3<CR>
    nmap <leader>f4 :set foldlevel=4<CR>
    nmap <leader>f5 :set foldlevel=5<CR>
    nmap <leader>f6 :set foldlevel=6<CR>
    nmap <leader>f7 :set foldlevel=7<CR>
    nmap <leader>f8 :set foldlevel=8<CR>
    nmap <leader>f9 :set foldlevel=9<CR>

    # Most prefer to toggle search highlighting rather than clear the current
    # search results. To clear search highlighting rather than toggle it on
    # and off, add the following to your .vimrc.before.local file:
    #   g:spf13_clear_search_highlight = 1
    if exists('g:spf13_clear_search_highlight')
        nmap <silent> <leader>/ :nohlsearch<CR>
    else
        nmap <silent> <leader>/ :set invhlsearch<CR>
    endif


    # Find merge conflict markers
    map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

    # Shortcuts
    # Change Working Directory to that of the current file
    cmap cwd lcd %:p:h
    cmap cd. lcd %:p:h

    # Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    # Allow using the repeat operator with a visual selection (!)
    # http://stackoverflow.com/a/8064607/127816
    vnoremap . :normal .<CR>

    # For when you forget to sudo.. Really Write the file.
    if OS.Is_LINUX()
        cmap w!! w !sudo tee % >/dev/null
    endif

    # Some helpers to edit mode
    # http://vimcasts.org/e/14
    cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
    map <leader>ew :e %%
    map <leader>es :sp %%
    map <leader>ev :vsp %%
    map <leader>et :tabe %%

    # Adjust viewports to the same size
    map <Leader>= <C-w>=

    # Map <Leader>ff to display all lines with keyword under cursor
    # and ask which one to jump to
    nmap <Leader>ff [I:var nr = input("Which one: ")<Bar>exe "normal # . nr ."[\t"<CR>

    # Easier horizontal scrolling
    map zl zL
    map zh zH

    # Easier formatting
    nnoremap <silent> <leader>q gwip

    # FIXME: Revert this f70be548
    # fullscreen mode for GVIM and Terminal, need 'wmctrl' in you PATH
    map <silent> <F11> system("wmctrl -ir # . v:windowid . # -b toggle,fullscreen")<CR>

    # Vimwiki start {
    nmap <Leader>wa :call VimwikiFindAllIncompleteTasks()<CR>
    nmap <Leader>wx :call VimwikiFindIncompleteTasks()<CR>
    # Vimwiki end }

# }
