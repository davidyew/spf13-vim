vim9script
set nocompatible        # Must be first line

const g:config_path = '~/.spf13-vim'
const g:vim_path = g:config_path .. '/.vim'
const g:bundle_path = g:config_path .. '/.vim/bundle'
execute "source " .. g:config_path .. "/bootstrap.vim" 
