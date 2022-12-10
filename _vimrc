vim9script
set nocompatible        # Must be first line

# For 1 user installation
# const g:config_path = '~/.spf13-vim'

# For multiple user installation 
const g:config_path = 'C:/src/vim/spf13-vim'

execute 'source ' .. g:config_path .. '/bootstrap.vim'
