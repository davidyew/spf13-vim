vim9script
# Identify platform {
silent! def! g:OSX(): bool
    return has('macunix')
enddef
silent! def! g:LINUX(): bool
    return has('unix') && !has('macunix') && !has('win32unix')
enddef
silent! def! g:WINDOWS(): bool
    return  (has('win32') || has('win64'))
enddef
# }
