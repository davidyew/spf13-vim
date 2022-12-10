vim9script
# Modeline and Notes {
# vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
#
#                    __ _ _____              _
#         ___ _ __  / _/ |___ /      __   __(_)_ __ ___
#        / __| '_ \| |_| | |_ \ _____\ \ / /| | '_ ` _ \
#        \__ \ |_) |  _| |___) |_____|\ V / | | | | | | |
#        |___/ .__/|_| |_|____/        \_/  |_|_| |_| |_|
#            |_|
#
#   This is the personal vimrc.bundles file of Steve Francia.
#   While much of it is beneficial for general use, I would
#   recommend picking out the parts you want and understand.
#
#   This file imports the various plugins of spf13. If you
#   wish to alter which groups are imported, see vimrc.before.
#   If you wish to add or remove individual bundles, create
#   ~/vimrc.bundles.local and `Bundle` or `UnBundle` as needed
#   from there.
#
#   You can find me at http://spf13.com
# }

import expand('./file_utility.vim')
var LoadVimScript = file_utility.CheckAndSource

# Initialize Vim-Plug
execute 'source ' .. g:vim_path .. '/autoload/vim-plug/plug.vim' 

call plug#begin(g:vim_path .. '/bundle')
# Bundles {

    # Deps {
        Plug 'MarcWeber/vim-addon-mw-utils'
        Plug 'tomtom/tlib_vim'
        if executable('ag') || executable('rg')
            Plug 'mileszs/ack.vim'
            if executable('ag')
                g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
            elseif executable('rg')
                g:ackprg = 'rg --vimgrep --no-heading'
            endif
        elseif executable('ack-grep')
                g:ackprg = 'ack-grep -H --nocolor --nogroup --column'
            Plug 'mileszs/ack.vim'
        elseif executable('ack')
            Plug 'mileszs/ack.vim'
        endif
    # }

    # In your vimrc.before.local file
    # list only the plugin groups you will use
    if !exists('g:spf13_bundle_groups')
        g:spf13_bundle_groups = ['general', 'writing', 'deoplete', 'programming', 'php', 'ruby', 'python', 'javascript', 'html', 'misc', 'rust', 'markdown']
    endif

    # To override all the included bundles, add the following to your
    # vimrc.bundles.local file:
    #   var g:override_spf13_bundles = 1
    if !exists('g:override_spf13_bundles')

    # General {
        if count(g:spf13_bundle_groups, 'general')
            # Plug 'scrooloose/nerdtree'
            Plug 'spf13/vim-colors'
            Plug 'tpope/vim-surround'
            Plug 'tpope/vim-repeat'
            Plug 'rhysd/conflict-marker.vim'
            Plug 'jiangmiao/auto-pairs'
            Plug 'ctrlpvim/ctrlp.vim'
            Plug 'tacahiroy/ctrlp-funky'
            Plug 'terryma/vim-multiple-cursors'
            Plug 'vim-scripts/sessionman.vim'
            Plug 'vim-scripts/matchit.zip'
            Plug 'itchyny/lightline.vim'
            Plug 'bling/vim-bufferline'
            Plug 'easymotion/vim-easymotion'
            # Plug 'jistr/vim-nerdtree-tabs'
            Plug 'flazz/vim-colorschemes'
            Plug 'mbbill/undotree'
            Plug 'nathanaelkane/vim-indent-guides'
            if !exists('g:spf13_no_views')
                Plug 'vim-scripts/restore_view.vim'
            endif
            Plug 'mhinz/vim-signify'
            Plug 'tpope/vim-abolish'
            Plug 'osyo-manga/vim-over'
            Plug 'kana/vim-textobj-user'
            Plug 'kana/vim-textobj-indent'
            Plug 'gcmt/wildfire.vim'
        endif
    # }

    # Writing {
        if count(g:spf13_bundle_groups, 'writing')
            Plug 'reedes/vim-litecorrect'
            Plug 'reedes/vim-textobj-sentence'
            Plug 'reedes/vim-textobj-quote'
            Plug 'reedes/vim-wordy'
            Plug 'tpope/vim-markdown'
            Plug 'greyblake/vim-preview'
        endif
    # }

    # General Programming {
        if count(g:spf13_bundle_groups, 'programming')
            # Pick one of the checksyntax, jslint, or syntastic
            Plug 'tpope/vim-fugitive'
            Plug 'mattn/webapi-vim'
            Plug 'mattn/gist-vim'
            Plug 'scrooloose/nerdcommenter'
            Plug 'tpope/vim-commentary'
            Plug 'godlygeek/tabular'
            Plug 'luochen1990/rainbow'
            if executable('ctags')
                Plug 'preservim/tagbar'
            endif
        endif
    # }

    # Snippets & AutoComplete {
        if count(g:spf13_bundle_groups, 'snipmate')
             Plug 'garbas/vim-snipmate'
             Plug 'honza/vim-snippets'
            # Source support_function.vim to support vim-snippets.
            if filereadable(expand(g:bundle_path .. '/vim-snippets/snippets/support_functions.vim'))
                source g:bundle_path .. '/vim-snippets/snippets/support_functions.vim'
            endif
        elseif count(g:spf13_bundle_groups, 'youcompleteme')
            # Plug 'SirVer/ultisnips'
            # Plug 'honza/vim-snippets'
        elseif count(g:spf13_bundle_groups, 'neocomplcache')
            # Plug 'Shougo/neocomplcache'
            # Plug 'Shougo/neosnippet'
            # Plug 'Shougo/neosnippet-snippets'
            # Plug 'honza/vim-snippets'
        elseif count(g:spf13_bundle_groups, 'deoplete') && has('python3') == 1
            # See https://github.com/Shougo/deoplete.nvim
            # Plug 'Shougo/deoplete.nvim'
            # Plug 'roxma/nvim-yarp'
            # Plug 'roxma/vim-hug-neovim-rpc'
            # Plug 'Shougo/neosnippet'
            # Plug 'Shougo/neosnippet-snippets'
            # Plug 'honza/vim-snippets'
        endif
    # }

    # PHP {
        if count(g:spf13_bundle_groups, 'php')
            # Plug 'spf13/PIV'
            # Plug 'arnaud-lb/vim-php-namespace'
            # Plug 'beyondwords/vim-twig'
        endif
    # }

    # Python {
        if count(g:spf13_bundle_groups, 'python')
            # Pick either python-mode or pyflakes & pydoc
            # Plug 'klen/python-mode'
            # Plug 'yssource/python.vim'
            # Plug 'vim-scripts/python_match.vim'
            # Plug 'vim-scripts/pythoncomplete'
        endif
    # }

    # Javascript {
        if count(g:spf13_bundle_groups, 'javascript')
            # Plug 'elzr/vim-json'
            # Plug 'groenewege/vim-less'
            # Plug 'pangloss/vim-javascript'
            # Plug 'briancollins/vim-jst'
            # Plug 'kchmck/vim-coffee-script'
        endif
    # }

    # Scala {
        if count(g:spf13_bundle_groups, 'scala')
            # Plug 'derekwyatt/vim-scala'
            # Plug 'derekwyatt/vim-sbt'
            # Plug 'xptemplate'
        endif
    # }

    # Haskell {
        if count(g:spf13_bundle_groups, 'haskell')
            # Plug 'travitch/hasksyn'
            # Plug 'dag/vim2hs'
            # Plug 'Twinside/vim-haskellConceal'
            # Plug 'Twinside/vim-haskellFold'
            # Plug 'lukerandall/haskellmode-vim'
            # Plug 'eagletmt/neco-ghc'
            # Plug 'eagletmt/ghcmod-vim'
            # Plug 'Shougo/vimproc.vim'
            # Plug 'adinapoli/cumino'
            # Plug 'bitc/vim-hdevtools'
        endif
    # }

    # HTML {
        if count(g:spf13_bundle_groups, 'html')
            # Plug 'vim-scripts/HTML-AutoCloseTag'
            # Plug 'hail2u/vim-css3-syntax'
            # Plug 'gorodinskiy/vim-coloresque'
            # Plug 'tpope/vim-haml'
            # Plug 'mattn/emmet-vim'
        endif
    # }

    # Ruby {
        if count(g:spf13_bundle_groups, 'ruby')
            # Plug 'tpope/vim-rails'
            # Plug 'tpope/vim-cucumber'
            # Plug 'rodjek/vim-puppet'
        endif
    # }

    # Go Lang {
        if count(g:spf13_bundle_groups, 'go')
            # Plug 'Blackrush/vim-gocode'
            # Plug 'fatih/vim-go'
        endif
    # }

    # Elixir {
        if count(g:spf13_bundle_groups, 'elixir')
            # Plug 'elixir-lang/vim-elixir'
            # Plug 'carlosgaldino/elixir-snippets'
            # Plug 'mattreduce/vim-mix'
        endif
    # }

    # Rust {
        if count(g:spf13_bundle_groups, 'rust')
            # Plug 'rust-lang/rust.vim'
        endif
    # }

    # Misc {
        if count(g:spf13_bundle_groups, 'misc')
            # Plug 'cespare/vim-toml'
            # Plug 'saltstack/salt-vim'
        endif
    # }

    endif

# }

# Use fork bundles config if available {
    LoadVimScript(g:config_path .. '/vimrc.bundles.fork.vim')
# }

# Use local bundles config if available {
    LoadVimScript(g:config_path .. '/vimrc.bundles.local.vim')
# }

call plug#end()
