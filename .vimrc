set nocompatible

" Load Plugins {
    filetype off

    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " Let Vundle manage itself
    Plugin 'gmarik/Vundle.vim'

    " Plugins
    Plugin 'scrooloose/syntastic'                " code check on save
    Plugin 'scrooloose/nerdtree'                 " file navigation
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'ctrlpvim/ctrlp.vim'
    Plugin 'tpope/vim-fugitive'                  " git integration
    Plugin 'mbbill/undotree'
    Plugin 'easymotion/vim-easymotion'           " easy content navigation
    Plugin 'vim-airline/vim-airline'             " status line
    Plugin 'vim-airline/vim-airline-themes'      " themes for status line
    " Plugin 'powerline/fonts'                     " fonts for airline
    Plugin 'bling/vim-bufferline'                " buffer tab list
    Plugin 'elzr/vim-json'
    Plugin 'pangloss/vim-javascript'
    Plugin 'hail2u/vim-css3-syntax'
    Plugin 'klen/python-mode'
    Plugin 'yssource/python.vim'
    Plugin 'gorodinskiy/vim-coloresque'
    Plugin 'nathanaelkane/vim-indent-guides'     " highlights indent levels
    Plugin 'fatih/vim-go'
    Plugin 'posva/vim-vue'
    Plugin 'rust-lang/rust.vim'

    Plugin 'flazz/vim-colorschemes'
    Plugin 'luochen1990/rainbow'                 " rainbow matching parenthesis

    call vundle#end()
" }

" Formatting {
    set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 space
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

    " for web files use tab width of 2
    autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType css setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType scss setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType vue setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
" }

" Mappings {
    let mapleader=','                " set leader
" }

" General {
    set background=dark         " Assume a dark background
    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " Syntax highlighting

    set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=1000                    " Store a ton of history (default is 20)

    set spell                           " Spell checking on
    autocmd VimEnter,Colorscheme * :hi SpellBad  guibg=red   ctermbg=52  " change the spelling error color highlight to allow the word to be legible

    set hidden                          " Allow buffer switching without saving

    " http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
    " Restore cursor to file position in previous editing session
    " {
        function! ResCur()
            if line("'\"") <= line("$")
                silent! normal! g`"
                return 1
            endif
        endfunction

        augroup resCur
            autocmd!
            autocmd BufWinEnter * call ResCur()
        augroup END
    " }

    " This creates an undo file '.un~' for each file in a hidden directory
    " which allows undo across sessions
    set undofile                " persistent undo is nice
    set undodir=$HOME/.vim/undo
    set undolevels=1000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload

    " Initialization of undo directory
    function! InitializeDirectory()
        let directory = $HOME . '/.vim/undo'
        if exists("*mkdir")
            if !isdirectory(directory)
                call mkdir(directory)
            endif
        endif
    endfunction
    call InitializeDirectory()
" }

" UI Settings {

    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    set statusline+=%{fugitive#statusline()} " Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

    set number                      " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set tabpagemax=15               " Only show 15 tabs
    set showmode                    " Display the current mode
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present

    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

    set colorcolumn=80              " mark the 80th column

    set t_Co=256                        " enable 256 color support
    colorscheme railscasts

    " it's nice to be able to select buffers and resize splits with a mouse at
    " times
    "set mouse=a
" }


" vim-airline  {
    let g:airline#extensions#tabline#enabled = 1      " show buffers along top

    " Use the default set of separators with a few customizations
    let g:airline_left_sep = '▶'            " Slightly fancier than '>'
    let g:airline_right_sep = '◀'           " Slightly fancier than '<'
" }

" python-mode {
    let g:pymode_lint_checkers = ['pyflakes']      " run pyflakes
    let g:pymode_trim_whitespaces = 0
    let g:pymode_options = 0
    let g:pymode_rope = 0
" }

" indent_guides {
    let g:indent_guides_start_level = 2              " indent depth label
    let g:indent_guides_guide_size = 1               " guide width in chars
    let g:indent_guides_enable_on_vim_startup = 1    " show on start
    let g:indent_guides_auto_colors = 0              " don't use scheme preset colors
    " set the alternating indent guide color
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=236
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=238
" }

" NerdTree {
    " make nerdtree easier to open
    map <leader>e :NERDTreeFind<CR>
    let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
    let NERDTreeQuitOnOpen=1                        " close NERDTree buffer why file opened
    let NERDTreeShowHidden=1                        " show hidden files on startup
" }

" vim-json {
    " this keeps vim-json from adding hiding and adding quote characters on
    " lines as you edit
    let g:vim_json_syntax_conceal = 0
" }

" rainbow parenthesis enabling {
    let g:rainbow_active = 1
" }
