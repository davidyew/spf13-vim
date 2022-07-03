vim9script
# Identify platform {
export def Is_OSX(): bool
    return has('macunix')
enddef
export def Is_LINUX(): bool
    return has('unix') && !has('macunix') && !has('win32unix')
enddef
export def Is_WINDOWS(): bool
    return  (has('win32') || has('win64'))
enddef
# }
