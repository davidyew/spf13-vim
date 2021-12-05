vim9script
# Plugins {

    # GoLang {
        if count(g:spf13_bundle_groups, 'go')
            g:go_highlight_functions = 1
            g:go_highlight_methods = 1
            g:go_highlight_structs = 1
            g:go_highlight_operators = 1
            g:go_highlight_build_constraints = 1
            g:go_fmt_command = "goimports"
            g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
            g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
            au FileType go nmap <Leader>s <Plug>(go-implements)
            au FileType go nmap <Leader>i <Plug>(go-info)
            au FileType go nmap <Leader>e <Plug>(go-rename)
            au FileType go nmap <leader>r <Plug>(go-run)
            au FileType go nmap <leader>b <Plug>(go-build)
            au FileType go nmap <leader>t <Plug>(go-test)
            au FileType go nmap <Leader>gd <Plug>(go-doc)
            au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
            au FileType go nmap <leader>co <Plug>(go-coverage)
        endif
        # }


    # TextObj Sentence {
        if count(g:spf13_bundle_groups, 'writing')
            if exists('*textobj')
                augroup textobj_sentence
                  autocmd!
                  autocmd FileType markdown call textobj#sentence#init()
                  autocmd FileType textile call textobj#sentence#init()
                  autocmd FileType text call textobj#sentence#init()
                augroup END
            endif
        endif
    # }

    # TextObj Quote {
        if count(g:spf13_bundle_groups, 'writing')
            if exists('*textobj')
                augroup textobj_quote
                    azutocmd!
                    autocmd FileType markdown call textobj#quote#init()
                    autocmd FileType textile call textobj#quote#init()
                    autocmd FileType text call textobj#quote#init({'educate': 0})
                augroup END
            endif
        endif
    # }

    # PIV {
        if isdirectory(expand("~/.vim/bundle/PIV"))
            g:DisableAutoPHPFolding = 0
            g:PIVAutoClose = 0
        endif
    # }

    # Misc {
        if isdirectory(expand("~/.vim/bundle/matchit.zip"))
            b:match_ignorecase = 1
        endif
    # }

    # Ctags {
        set tags=./tags;/,~/.vimtags

        # Make tags placed in .git/tags file available in all levels of a repository
        var gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
        if gitroot != ''
            &tags = &tags .. ',' .. gitroot .. '/.git/tags'
        endif
    # }

    # AutoCloseTag {
        # Make it so AutoCloseTag works for xml and xhtml files as well
        au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
        nmap <Leader>ac <Plug>ToggleAutoCloseMappings
    # }

    # SnipMate {
        # Setting the author var
        # If forking, please overwrite in your .vimrc.local file
        g:snips_author = 'Steve Francia <steve.francia@gmail.com>'
    # }

    # NerdTree {
        if isdirectory(expand("~/.vim/bundle/nerdtree"))
            map <C-e> <plug>NERDTreeTabsToggle<CR>
            map <leader>e :NERDTreeFind<CR>
            nmap <leader>nt :NERDTreeFind<CR>

            var NERDTreeShowBookmarks = 1
            var NERDTreeIgnore = ['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
            var NERDTreeChDirMode = 0
            var NERDTreeQuitOnOpen = 1
            var NERDTreeMouseMode = 2
            var NERDTreeShowHidden = 1
            var NERDTreeKeepTreeInNewTab = 1
            g:nerdtree_tabs_open_on_gui_startup = 0
            g:nerdtree_tabs_synchronize_view = 0
            g:NERDShutUp = 1
        endif
    # }

    # Tabularize {
        if isdirectory(expand("~/.vim/bundle/tabular"))
            nmap <Leader>a& :Tabularize /&<CR>
            vmap <Leader>a& :Tabularize /&<CR>
            nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
            vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
            nmap <Leader>a=> :Tabularize /=><CR>
            vmap <Leader>a=> :Tabularize /=><CR>
            nmap <Leader>a: :Tabularize /:<CR>
            vmap <Leader>a: :Tabularize /:<CR>
            nmap <Leader>a:: :Tabularize /:\zs<CR>
            vmap <Leader>a:: :Tabularize /:\zs<CR>
            nmap <Leader>a, :Tabularize /,<CR>
            vmap <Leader>a, :Tabularize /,<CR>
            nmap <Leader>a,, :Tabularize /,\zs<CR>
            vmap <Leader>a,, :Tabularize /,\zs<CR>
            nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
            vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
        endif
    # }

    # Session List {
        set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
        if isdirectory(expand("~/.vim/bundle/sessionman.vim/"))
            nmap <leader>sl :SessionList<CR>
            nmap <leader>ss :SessionSave<CR>
            nmap <leader>sc :SessionClose<CR>
        endif
    # }

    # JSON {
        nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
        g:vim_json_syntax_conceal = 0
    # }

    # PyMode {
        # Disable if python support not present
        if !has('python') && !has('python3')
            g:pymode = 0
        endif

        if isdirectory(expand("~/.vim/bundle/python-mode"))
            g:pymode_lint_checkers = ['pyflakes']
            g:pymode_trim_whitespaces = 0
            g:pymode_options = 0
            g:pymode_rope = 0
        endif
    # }

    # ctrlp {
        if isdirectory(expand("~/.vim/bundle/ctrlp.vim/"))
            g:ctrlp_working_path_mode = 'ra'
            nnoremap <silent> <D-t> :CtrlP<CR>
            nnoremap <silent> <D-r> :CtrlPMRU<CR>
            g:ctrlp_custom_ignore = {
                 'dir':  '\.git$\|\.hg$\|\.svn$',
                 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }
            var s:ctrlp_fallback = ''
            if executable('fd')
                g:ctrlp_user_command = 'fd -c never "" "%s"'
                g:ctrlp_use_caching = 0
            elseif executable('rg')
                s:ctrlp_fallback = 'rg %s --nocolor -l -g ""'
            elseif executable('ag')
                s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
            elseif executable('ack-grep')
                s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
            elseif executable('ack')
                s:ctrlp_fallback = 'ack %s --nocolor -f'
            # On Windows use "dir" as fallback command.
            elseif WINDOWS()
                s:ctrlp_fallback = 'dir %s /-n /b /s /a-d'
            else
                s:ctrlp_fallback = 'find %s -type f'
            endif
            if exists("g:ctrlp_user_command")
                unlet g:ctrlp_user_command
            endif
            g:ctrlp_user_command = {
                'types': {
                    1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
                    2: ['.hg', 'hg --cwd %s locate -I .'],
                },
                'fallback': s:ctrlp_fallback
            }

            if isdirectory(expand("~/.vim/bundle/ctrlp-funky/"))
                # CtrlP extensions
                g:ctrlp_extensions = ['funky']

                #funky
                nnoremap <Leader>fu :CtrlPFunky<Cr>
            endif
        endif
    #}

    # TagBar {
        if isdirectory(expand("~/.vim/bundle/tagbar/"))
            nnoremap <silent> <leader>tt :TagbarToggle<CR>
            g:tagbar_ctags_bin = 'ctags.exe'
        endif
    #}

    # Rainbow {
        if isdirectory(expand("~/.vim/bundle/rainbow/"))
            g:rainbow_active = 1 # 0 if you want to enable it later via :RainbowToggle
        endif
    #}

    # Fugitive {
        if isdirectory(expand("~/.vim/bundle/vim-fugitive/"))
            nnoremap <silent> <leader>gs :Gstatus<CR>
            nnoremap <silent> <leader>gd :Gdiff<CR>
            nnoremap <silent> <leader>gc :Gcommit<CR>
            nnoremap <silent> <leader>gb :Gblame<CR>
            nnoremap <silent> <leader>gl :Glog<CR>
            nnoremap <silent> <leader>gp :Git push<CR>
            nnoremap <silent> <leader>gr :Gread<CR>
            nnoremap <silent> <leader>gw :Gwrite<CR>
            nnoremap <silent> <leader>ge :Gedit<CR>
            # Mnemonic _i_nteractive
            nnoremap <silent> <leader>gi :Git add -p %<CR>
            nnoremap <silent> <leader>gg :SignifyToggle<CR>
        endif
    #}

    # YouCompleteMe {
        if count(g:spf13_bundle_groups, 'youcompleteme')
            g:acp_enableAtStartup = 0

            # enable completion from tags
            g:ycm_collect_identifiers_from_tags_files = 1

            # remap Ultisnips for compatibility for YCM
            g:UltiSnipsExpandTrigger = '<C-j>'
            g:UltiSnipsJumpForwardTrigger = '<C-j>'
            g:UltiSnipsJumpBackwardTrigger = '<C-k>'

            # Enable omni completion.
            autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
            autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
            autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
            autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
            autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
            autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
            autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

            # Haskell post write lint and check with ghcmod
            # $ `cabal install ghcmod` if missing and ensure
            # ~/.cabal/bin is in your $PATH.
            if !executable("ghcmod")
                autocmd BufWritePost *.hs GhcModCheckAndLintAsync
            endif

            # For snippet_complete marker.
            if !exists("g:spf13_no_conceal")
                if has('conceal')
                    set conceallevel=2 concealcursor=i
                endif
            endif

            # Disable the neosnippet preview candidate window
            # When enabled, there can be too much visual noise
            # especially when splits are used.
            set completeopt-=preview
        endif
    # }

    # Snippets {
        if count(g:spf13_bundle_groups, 'neocomplcache') ||
                    \ count(g:spf13_bundle_groups, 'neocomplete')

            # Use honza's snippets.
            g:neosnippet#snippets_directory = '~/.vim/bundle/vim-snippets/snippets'

            # Enable neosnippet snipmate compatibility mode
            g:neosnippet#enable_snipmate_compatibility = 1

            # For snippet_complete marker.
            if !exists("g:spf13_no_conceal")
                if has('conceal')
                    set conceallevel=2 concealcursor=i
                endif
            endif

            # Enable neosnippets when using go
            g:go_snippet_engine = "neosnippet"

            # Disable the neosnippet preview candidate window
            # When enabled, there can be too much visual noise
            # especially when splits are used.
            set completeopt-=preview
        endif
    # }

    # FIXME: Isn't this for Syntastic to handle?
    # Haskell post write lint and check with ghcmod
    # $ `cabal install ghcmod` if missing and ensure
    # ~/.cabal/bin is in your $PATH.
    if !executable("ghcmod")
        autocmd BufWritePost *.hs GhcModCheckAndLintAsync
    endif

    # UndoTree {
        if isdirectory(expand("~/.vim/bundle/undotree/"))
            nnoremap <Leader>u :UndotreeToggle<CR>
            # If undotree is opened, it is likely one wants to interact with it.
            g:undotree_SetFocusWhenToggle = 1
        endif
    # }

    # indent_guides {
        if isdirectory(expand("~/.vim/bundle/vim-indent-guides/"))
            g:indent_guides_start_level = 2
            g:indent_guides_guide_size = 1
            g:indent_guides_enable_on_vim_startup = 1
        endif
    # }

    # Wildfire {
    g:wildfire_objects = {
                "*": ["i'", 'i"', "i)", "i]", "i}", "ip"],
                "html,xml": ["at"],
                }
    # }

    # Coc.nvim {
        if isdirectory(expand("~/.vim/bundle/coc.nvim/"))
            def s:check_back_space(): bool
              var col = col('.') - 1
              return !col || getline('.')[col - 1]  =~# '\s'
            enddef

            # Use <c-space> to trigger completion.
            if has('nvim')
              inoremap <silent><expr> <c-space> coc#refresh()
            else
              inoremap <silent><expr> <c-@> coc#refresh()
            endif

            # Make <CR> auto-select the first completion item and notify coc.nvim to
            # format on enter, <cr> could be remapped by other vim plugin
            inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                          \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

            # Use `[g` and `]g` to navigate diagnostics
            # Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
            nmap <silent> [g <Plug>(coc-diagnostic-prev)
            nmap <silent> ]g <Plug>(coc-diagnostic-next)

            # GoTo code navigation.
            nmap <silent> gd <Plug>(coc-definition)
            nmap <silent> gy <Plug>(coc-type-definition)
            nmap <silent> gi <Plug>(coc-implementation)
            nmap <silent> gr <Plug>(coc-references)

            # Use K to show documentation in preview window.
            nnoremap <silent> K :call <SID>show_documentation()<CR>

            def s:show_documentation()
              if (index(['vim','help'], &filetype) >= 0)
                execute 'h '.expand('<cword>')
              elseif (coc#rpc#ready())
                call CocActionAsync('doHover')
              else
                execute '!' . &keywordprg . # # . expand('<cword>')
              endif
             enddef

            # Highlight the symbol and its references when holding the cursor.
            autocmd CursorHold * silent call CocActionAsync('highlight')

            # Symbol renaming.
            nmap <leader>rn <Plug>(coc-rename)

            # Formatting selected code.
            xmap <leader>f  <Plug>(coc-format-selected)
            nmap <leader>f  <Plug>(coc-format-selected)

            augroup coc_file_type
              autocmd!
              # Setup formatexpr specified filetype(s).
              autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
              # Update signature help on jump placeholder.
              autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
            augroup end

            # Applying codeAction to the selected region.
            # Example: `<leader>aap` for current paragraph
            xmap <leader>a  <Plug>(coc-codeaction-selected)
            nmap <leader>a  <Plug>(coc-codeaction-selected)

            # Remap keys for applying codeAction to the current buffer.
            nmap <leader>ac  <Plug>(coc-codeaction)
            # Apply AutoFix to problem on the current line.
            nmap <leader>qf  <Plug>(coc-fix-current)

            # Map function and class text objects
            # NOTE: Requires 'textDocument.documentSymbol' support from the language server.
            xmap if <Plug>(coc-funcobj-i)
            omap if <Plug>(coc-funcobj-i)
            xmap af <Plug>(coc-funcobj-a)
            omap af <Plug>(coc-funcobj-a)
            xmap ic <Plug>(coc-classobj-i)
            omap ic <Plug>(coc-classobj-i)
            xmap ac <Plug>(coc-classobj-a)
            omap ac <Plug>(coc-classobj-a)

            # Remap <C-f> and <C-b> for scroll float windows/popups.
            if has('nvim-0.4.0') || has('patch-8.2.0750')
              nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
              nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
              inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr># : "\<Right>"
              inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr># : "\<Left>"
              vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
              vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
            endif

            # Use CTRL-S for selections ranges.
            # Requires 'textDocument/selectionRange' support of language server.
            nmap <silent> <C-s> <Plug>(coc-range-select)
            xmap <silent> <C-s> <Plug>(coc-range-select)

            # Add `:Format` command to format current buffer.
            command! -nargs=0 Format :call CocAction('format')

            # Add `:Fold` command to fold current buffer.
            command! -nargs=? Fold :call     CocAction('fold', <f-args>)

            # Add `:OR` command for organize imports of the current buffer.
            command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

            # Add (Neo)Vim's native statusline support.
            # NOTE: Please see `:h coc-status` for integrations with external plugins that
            # provide custom statusline: lightline.vim, vim-airline.
            set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

            # Mappings for CoCList
            # Show all diagnostics.
            nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
            # Manage extensions.
            nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
            # Show commands.
            nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
            # Find symbol of current document.
            nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
            # Search workspace symbols.
            nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
            # Do default action for next item.
            nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
            # Do default action for previous item.
            nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
            # Resume latest coc list.
            nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
            # use right arrow to trigger completion
            # TODO: FIX inoremap <silent><expr> <Right> : pumvisible() ? <C-n> : s:check_back_space() ? <Right> : coc#refresh()
            inoremap <expr><S-Right> pumvisible() ? "\<C-p>" : "\<C-h>"
        endif
    # }

    # Vimwiki {
        if isdirectory(expand("~/.vim/bundle/vimwiki"))
          # g:vimwiki_list = [{'path': '~/vimwiki/', 'auto_tags': 1, 'path_html': '~/vimwiki_html'}]
          # g:vimwiki_folding = 'syntax'
          g:tagbar_type_vimwiki = {
            'ctagstype': 'vimwiki',
            'kinds': ['h:header'],
            'sro': '&&&',
            'kind2scope': {'h': 'header'},
            'sort': 0,
            'ctagsbin': '~/.vim/lib/vwtags.py',
            'ctagsargs': 'default'
          }
        endif
    # }

    # ack.vim {
        if isdirectory(expand("~/.vim/bundle/ack.vim"))
            if executable("rg")
                g:ackprg = 'rg --vimgrep --type-not sql --smart-case'
            endif
            # Auto close the Quickfix list after pressing '<enter>' on a list item
            g:ack_autoclose = 1

            # Any empty ack search will search for the work the cursor is on
            g:ack_use_cword_for_empty_search = 1

            # Don't jump to first match
            cnoreabbrev Ack Ack!
        endif
    # }

    # Load netrw as file explorer
    # more info help netrw
    # https://shapeshed.com/vim-netrw/
    # netrw {
        g:netrw_banner = 0
        g:netrw_liststyle = 3
        g:netrw_browse_split = 4
        g:netrw_altv = 1
        g:netrw_winsize = 20
        g:NetrwIsOpen = 0
        def g:ToggleNetrw()
            if g:NetrwIsOpen
                var i = bufnr("$")
                while (i >= 1)
                    if (getbufvar(i, "&filetype") == "netrw")
                        silent exe "bwipeout " .. i 
                    endif
                    i -= 1
                endwhile
                g:NetrwIsOpen = 0
            else
                g:NetrwIsOpen = 1
                silent Lexplore
            endif
        enddef
        noremap <silent> <C-e> :call g:ToggleNetrw()<CR>
    # }

    # skim {
        command! -bang -nargs=* Rg call fzf#vim#rg_interactive(<q-args>, fzf#vim#with_preview('right:50%:hidden', 'alt-h'))
    # }
# }
