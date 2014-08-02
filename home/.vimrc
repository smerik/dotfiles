" .vimrc
"

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Use NeoBundle for managing & loading plugins
" ----------------------------------------------------------------------------
call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'       " Let NeoBundle manage NeoBundle
NeoBundle 'kien/ctrlp.vim'                  " Full path fuzzy file, buffer, mru, tag, ... finder
NeoBundle 'Raimondi/delimitMate'            " Provides auto-balancing and some expansions for parens, quotes, etc
NeoBundle 'editorconfig/editorconfig-vim'   " EditorConfig plugin
NeoBundle 'scrooloose/nerdcommenter'        " plugin for intensely orgasmic commenting
NeoBundle 'smerik/railscasts-vim'           " railscasts color theme that works in 256color terminals as well as gui
NeoBundle 'scrooloose/syntastic'            " Syntax checking hacks
NeoBundle 'tpope/vim-fugitive'              " A Git wrapper so awesome, it should be illegal

" Plugins not on GitHub
" ---------------------
NeoBundle 'https://fedorapeople.org/cgit/wwoods/public_git/vim-scripts.git'

call neobundle#end()

filetype on                    " Enable filetype detection
filetype plugin on             " Autoload the plugin file (if there is one for the detected filetype)
filetype indent on             " Autoload the indent file (if there is one for the detected filetype)

" Basic options
" ----------------------------------------------------------------------------
set encoding=utf-8             " Set character code used inside Vim
set nocompatible               " Disable Vi compatibility
set nomodeline                 " Disable modelines for security measures
set ttyfast                    " Indicate fast terminal connection

" Formatting
set autoindent                 " Copy indent from current line when starting a new line
set smartindent                " Do smart autoindenting when starting a new line
set shiftwidth=2               " Number of spaces to use for each step of (auto)indent
set softtabstop=2              " Number of spaces that a <tab> counts for while performing editing operations
set tabstop=2                  " Number of spaces that a <tab> in the file counts for
set expandtab                  " In Insert mode: Use the appropriate number of spaces to insert a <tab>
set smarttab                   " A <tab> in front of a line inserts blanks according to 'shiftwidth'. A <bs> will delete a 'shiftwidth' worth of space at the start of the line.

" Searching
set ignorecase                 " Ignore case in search patterns.
set smartcase                  " Override the 'ignorecase' option if the search pattern contains upper case characters.
set incsearch                  " While typing a search command, show where the pattern, as it was typed so far, matches.
set showmatch                  " When a bracket is inserted, briefly jump to the matching one. The jump is only done if the match can be seen on the screen.
set hlsearch                   " When there is a previous search pattern, highlight all its matches.
set gdefault                   " Use the ':substitute' flag 'g' by default

" Key mappings
" ----------------------------------------------------------------------------
let mapleader=','              " Map leader key

" Stop the search highlighting
map <silent> \ :silent nohlsearch<cr>

" Move between windows
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

" Toggle spell checking
nmap <silent> <leader>ts :set spell!<cr>

" UI
" ----------------------------------------------------------------------------

" Colors
syntax on                      " Enable syntax highlighting
colorscheme railscasts         " Load color scheme

" See difference between spaces, tabs and trailing blanks
set list                       " Enable list mode
set listchars=eol:¬            " Character to show at the end of each line
set listchars+=tab:▸\          " Characters to be used to show a <tab>
set listchars+=trail:·         " Character to show for trailing spaces

" Beautify status line
" Inspired by statusline.vim: http://www.vim.org/scripts/script.php?script_id=3734
" Define status bar colors
hi default User1 ctermfg=15 ctermbg=22
hi default User2 ctermfg=15 ctermbg=52
hi default User3 ctermfg=0 ctermbg=3
hi default User4 ctermfg=15 ctermbg=28
" Always show status line
set laststatus=2
" Define empty status line
set statusline=
" Full path to file in buffer
set statusline+=%1*%-52F
" File format
set statusline+=\ %2*\ %{&ff}"
" File encoding
set statusline+=\ %3*\ %{&fenc!=''?&fenc:&enc}
" File type
set statusline+=\ %1*\ %Y
" Line number / column number - virtual column number
set statusline+=\ %4*\ %04l/%03c-%03v
" Hexadecimal value of character under cursor
set statusline+=\ %2*\ 0x%04.4B
" Current date & time
set statusline+=\ %1*\ %-16{strftime(\"%Y-%m-%d\ %H:%M\")}
" Modified flag
set statusline+=\ %4*\ %-3m
