vim9script

import expand(g:config_path .. "/file_utility.vim")
import expand(g:config_path .. "/function.vim")
import expand(g:config_path .. "/operating_systems.function.vim") as OS

# Modeline and Notes {
# vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
#
# This is an adaption of spf13-vim and to use vimscript9 syntax where possible
#                    __ _ _____              _
#         ___ _ __  / _/ |___ /      __   __(_)_ __ ___
#        / __| '_ \| |_| | |_ \ _____\ \ / /| | '_ ` _ \
#        \__ \ |_) |  _| |___) |_____|\ V / | | | | | | |
#        |___/ .__/|_| |_|____/        \_/  |_|_| |_| |_|
#            |_|
#
#   This is the personal .vimrc file of Steve Francia.
#   While much of it is beneficial for general use, I would
#   recommend picking out the parts you want and understand.
#
#   You can find me at http://spf13.com
#
#   Copyright 2014 Steve Francia
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
# }

# Environment {
    # Load functions to detect operating systems

    # Basics {
        if OS.Is_LINUX()
            set shell=/bin/sh
        endif
    # }

    # Windows Compatible {
        # On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        # across (heterogeneous) systems easier.
        if OS.Is_WINDOWS()
          set runtimepath=$HOME/.vim,$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after,

          # Be nice and check for multi_byte even if the config requires
          # multi_byte support most of the time
          if has("multi_byte")
            # Windows cmd.exe still uses cp850. If Windows ever moved to
            # Powershell as the primary terminal, this would be utf-8
            set termencoding=utf-8
            # Set Vim use utf-8 internally, because many scripts require this
            setglobal fileencoding=utf-8
            # Windows has traditionally used cp1252, so it's probably wise to
            # fallback into cp1252 instead of eg. iso-8859-15.
            # Newer Windows files might contain utf-8 or utf-16 LE so we might
            # want to try them first.
            set fileencodings=utf-8,ucs-bom,utf-16le,cp1252,iso-8859-15,gb18030,gbk2312,cp936
            set encoding=utf-8
          endif
        endif
    # }

    # Arrow Key Fix {
        # https://github.com/spf13/spf13-vim/issues/780
        if &term[ : 4] == "xterm" || &term[ : 5] == 'screen' || &term[ : 3] == 'rxvt'
            inoremap <silent> <C-[>OC <RIGHT>
        endif
    # }

# }

# Use before config if available {
    file_utility.CheckAndSource(g:config_path .. "/.vimrc.before")
# }

# Use bundles config {
     file_utility.CheckAndSource(g:config_path .. "/.vimrc.bundles")
# }

# load config {
     file_utility.CheckAndSource(g:config_path .. "/.vimrc.general.config.vim")
     file_utility.CheckAndSource(g:config_path .. "/.vimrc.ui.config.vim")
     file_utility.CheckAndSource(g:config_path .. "/.vimrc.statusline.config.vim")
     file_utility.CheckAndSource(g:config_path .. "/.vimrc.formatting.config.vim")
     file_utility.CheckAndSource(g:config_path .. "/.vimrc.keymapping.config.vim")
     file_utility.CheckAndSource(g:config_path .. "/.vimrc.gui.config.vim")
     file_utility.CheckAndSource(g:config_path .. "/.vimrc.plugins.config.vim")
# }

# Use fork vimrc if available {
    file_utility.CheckAndSource(g:config_path .. "/.vimrc.fork")
# }

# Use local vimrc if available {
    file_utility.CheckAndSource(g:config_path .. "/.vimrc.local")
# }

# Use local gvimrc if available and gui is running {
    if has('gui_running')
        file_utility.CheckAndSource(g:config_path .. "/.gvimrc.local")
    endif
# }

filetype plugin indent on
