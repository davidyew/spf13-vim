vim9script
# Identify platform {
export def Is_OSX(): bool
    var mu = has('macunix')
    return mu
enddef
export def Is_LINUX(): bool
    var wu32 = has('win32unix')
    var mu = has('macunix')
    var unix = has('unix')
    return unix && !mu && !wu32
enddef
export def Is_WINDOWS(): bool
    var w32 = has('win32')
    var w64 = has('win64')
    return w32 || w64
enddef
# }
