vim9script

# https://liuchengxu.github.io/vista.vim
Plug 'liuchengxu/vista.vim'
# https://liuchengxu.github.io/vim-clap
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
Plug 'vimwiki/vimwiki'
Plug 'Konfekt/FastFold'
# 2021-12-05 Skim is not ready for Windows
# Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
# Plug 'lotabout/skim.vim'
# Plug 'plasticboy/vim-markdown'
# two-pane text outliner pre-requisite: Python 3
# unstable: cannot navigate on wiki page after using voom Plug 'vim-voom/VOoM'
# jira-vim pre-requisite: Python 3
# Plug 'paulkass/jira-vim'
# Autocomplete, Language Server Protocol
Plug 'neoclide/coc.nvim', {'branch': 'release'}
# Color Scheme
Plug 'morhetz/gruvbox'
# Open API
Plug 'hsanson/vim-openapi'
# CSV
# Plug 'chrisbra/csv.vim'

# include vim plugins if there is ctags.exe
if executable('ctags')
    Plug 'tc50cal/vim-taglist'
endif

# https://github.com/dhruvasagar/vim-table-mode
Plug 'dhruvasagar/vim-table-mode'

# ChatGPT
# Plug 'CoderCookE/vim-chatgpt'
# Plug '0xStabby/chatgpt-vim'

# Cucumber
Plug 'yaegassy/coc-cucumber'

# Vim Git Gutter
Plug 'airblade/vim-gitgutter'

# Terraform
Plug 'hashivim/vim-terraform'

# AI Coding Assistant
# Github Copilot
Plug 'github/copilot.vim'
#Plug 'zbirenbaum/copilot.lua'
#Plug 'nvim-lua/plenary.nvim'
#Plug 'CopilotC-Nvim/CopilotChat.nvim', { 'branch': 'canary' }

Plug 'solyarisoftware/prompter.vim'

# Pinescript
Plug 'jbmorgado/vim-pine-script'
