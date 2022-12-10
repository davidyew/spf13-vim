vim9script

import expand(g:config_path .. '/file_utility.vim')
var LoadVimScript = file_utility.CheckAndSource
# Default Bundles {

    # Use before config if available {
        LoadVimScript(g:config_path .. '/vimrc.before.vim')
    # }

    # Use bundles config {
        LoadVimScript(g:config_path .. '/vimrc.bundles.vim')
    # }
# }
