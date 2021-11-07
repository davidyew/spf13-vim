vim9script
# Vim UI {
    if filereadable(expand("~/.vim/bundle/gruvbox/autoload/gruvbox.vim"))
        set background=dark
        g:gruvbox_contrast_dark = 'hard'
        autocmd vimenter * ++nested colorscheme gruvbox
    endif

    if !exists('g:override_spf13_bundles') && filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
        g:solarized_termcolors = 256
        g:solarized_termtrans = 1
        g:solarized_contrast = "normal"
        g:solarized_visibility = "normal"
        color solarized             # Load a colorscheme
    endif

    set tabpagemax=15               # Only show 15 tabs
    set showmode                    # Display the current mode

    set cursorline                  # Highlight current line

    highlight clear SignColumn      # SignColumn should match background
    highlight clear LineNr          # Current line number row will have same background color in relative mode
    highlight clear CursorLineNr    # Remove highlight color from current line number

    if has('cmdline_info')
        set ruler                   # Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) # A ruler on steroids
        set showcmd                 # Show partial commands in status line and
                                    # Selected characters/lines in visual mode
    endif

    if has('statusline')
        set laststatus=2

        # Broken down into easily includeable segments
        set statusline=%<%f\                     # Filename
        set statusline+=%w%h%m%r                 # Options
        if !exists('g:override_spf13_bundles')
            set statusline+=%{fugitive#statusline()} # Git Hotness
        endif
        set statusline+=\ [%{&ff}/%Y]            # Filetype
        set statusline+=\ [%{getcwd()}]          # Current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  # Right aligned file nav info
    endif

    set backspace=indent,eol,start  # Backspace for dummies
    set linespace=0                 # No extra spaces between rows
    set number                      # Line numbers on
    set showmatch                   # Show matching brackets/parenthesis
    set incsearch                   # Find as you type search
    set hlsearch                    # Highlight search terms
    set winminheight=0              # Windows can be 0 line high
    set ignorecase                  # Case insensitive search
    set smartcase                   # Case sensitive when uc present
    set wildmenu                    # Show list instead of just completing
    set wildmode=list:longest,full  # Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   # Backspace and cursor keys wrap too
    set scrolljump=5                # Lines to scroll when cursor leaves screen
    set scrolloff=3                 # Minimum lines to keep above and below cursor
    set foldenable                  # Auto fold code
    set list
    # TODO: fix listchars
    # set listchars=tab:›\ ,trail:•,extends:#,nbsp:. # Highlight problematic whitespace
    set listchars=tab:>-,trail:.,extends:#,nbsp:.

# }
