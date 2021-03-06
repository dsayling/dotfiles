" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
"
"
"call plug#begin('~/.vim/plugged')
"Plug 'dhruvasagar/vim-table-mode'
" Plug 'nvie/vim_bridge'
" Plug 'nvie/vim-rst-tables'
" Plug 'easymotion/vim-easymotion'
"Plug 'xolox/vim-misc'
" Plug 'Rykka/riv.vim'
"Plug 'xolox/vim-notes'
"Plug 'mnpk/vim-jira-complete'
"Plug 'Rykka/InstantRst'
"call plug#end()
" let g:table_mode_corner_corner="+"
" let g:table_mode_header_fillchar="="
if v:progname =~? "evim"
  finish
endif

nmap <F3> o<C-R>=strftime("%Y-%m-%d %a %I:%M %p: ")<CR>
imap <F3> o<C-R>=strftime("%Y-%m-%d %a %I:%M %p: ")<CR>

" Map jj to esc; j pops up briefly, but is erased upon second j.
imap jj <esc>

nmap <F5> :e ++ff=dos
nmap <F6> :setlocal ff=unix

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

iab specifcation specification 
iab managment management

" allow backspacing over everything in insert mode
set nf=octal,hex,alpha
set backspace=indent,eol,start
set ignorecase
set smartcase
set nu
set syn=markdown
colorscheme desert 
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  " autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

autocmd BufRead,BufNewFile *.py inoremap # X<c-h>#
autocmd BufRead,BufNewFile *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead,BufNewFile *.py set tabstop=4
autocmd BufRead,BufNewFile *.py set shiftwidth=4
autocmd BufRead,BufNewFile *.py set smarttab
autocmd BufRead,BufNewFile *.py set expandtab
autocmd BufRead,BufNewFile *.py set softtabstop=4
autocmd BufRead,BufNewFile *.py set autoindent
autocmd BufRead,BufNewFile *.py highlight BadWhitespace ctermbg=red guibg=red
autocmd BufRead,BufNewFile *.py match BadWhitespace /^\t\+/
autocmd BufRead,BufNewFile *.py match BadWhitespace /^ \+\t\+/
autocmd BufRead,BufNewFile *.py match BadWhitespace /\s\+$/

 
