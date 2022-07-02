vim9script

# Function to check file is valid and load in Vim
export def CheckAndSource(vim_file: string)
    if filereadable(expand(vim_file))
        execute "source " .. vim_file
    endif
enddef
