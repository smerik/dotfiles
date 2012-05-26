" .vimrc
"

" Use Pathogen for loading plugins
call pathogen#infect()

filetype on                    " Enable filetype detection
filetype plugin on             " Autoload the plugin file (if there is one for the detected filetype)
filetype indent on             " Autoload the indent file (if there is one for the detected filetype)

" Basic options
" ----------------------------------------------------------------------------
set encoding=utf-8             " Set character code used inside Vim
set nocompatible               " Disable Vi compatibility
set nomodeline                 " Disable modelines for security measures

" Colors
syntax on                      " Enable syntax highlighting

" Formatting
set autoindent                 " Copy indent from current line when starting a new line
set smartindent                " Do smart autoindenting when starting a new line
set shiftwidth=2               " Number of spaces to use for each step of (auto)indent
set softtabstop=2              " Number of spaces that a <Tab> counts for while performing editing operations
set tabstop=2                  " Number of spaces that a <Tab> in the file counts for
set expandtab                  " In Insert mode: Use the appropriate number of spaces to insert a <Tab>
set smarttab                   " A <Tab> in front of a line inserts blanks according to 'shiftwidth'. A <BS> will delete a 'shiftwidth' worth of space at the start of the line.

" Searching
set ignorecase                 " Ignore case in search patterns.
set smartcase                  " Override the 'ignorecase' option if the search pattern contains upper case characters.
set incsearch                  " While typing a search command, show where the pattern, as it was typed so far, matches.
set showmatch                  " When a bracket is inserted, briefly jump to the matching one. The jump is only done if the match can be seen on the screen.
set hlsearch                   " When there is a previous search pattern, highlight all its matches.
set gdefault                   " Use the ':substitute' flag 'g' by default

" Mappings
" ----------------------------------------------------------------------------
let mapleader = ','            " Map leader key

" Stop the search highlighting
map <silent> \ :silent nohlsearch<cr>
