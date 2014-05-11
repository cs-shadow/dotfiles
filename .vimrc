"-------------------------------------------------------
" My ViM Run Commands (vimrc)
" Chandan Singh
" Sat 29 Mar 2014 04:34:02 PM IST
" Inspired by vimrc of Sankalp Khare
"-------------------------------------------------------

set nocompatible 		" don't use vi compatibility; I want all the new features in Vim
set nu 				" enable numbering
set autoindent 			" when opening a new line and no filetype-specific indenting is enabled, keep the same indent as the line you're currently on.
set cindent 			" automatic indentation for C code
set smartindent 		" some more indenting smartness
set incsearch 			" search next match as you type; incremental (emacs-style) search
set laststatus=2 		" status line always displayed
set ignorecase 			" case insensitive searching
set smartcase 			" with 'ignorecase'on, if pattern contains an uppercase letter, search case sensitive, otherwise not.
set scrolloff=2 		" have at least two lines of context visible around the cursor
set confirm			" instead of failing commands because of changes in file, ask whether to save
set wildmode=longest,list 	" changed filename completion behaviour (complete till lc-substring, then list)
set showcmd             	" Show current vim command in status bar
set nowrap

"-------------------------------------------------------
" expand tabs to spaces
set expandtab
"-------------------------------------------------------

"-------------------------------------------------------
" tab space value and indent shiftwidth for some filetypes
autocmd FileType python set tabstop=4 | set shiftwidth=4
autocmd FileType php set tabstop=2 | set shiftwidth=2
autocmd FileType css set tabstop=2 | set shiftwidth=2
autocmd FileType ruby 	set tabstop=4 | set shiftwidth=4
autocmd FileType js 	set tabstop=2 | set shiftwidth=2
autocmd FileType html 	set tabstop=2 | set shiftwidth=2
autocmd FileType xhtml 	set tabstop=2 | set shiftwidth=2
autocmd FileType c 	set tabstop=4 | set shiftwidth=4
autocmd FileType cpp 	set tabstop=4 | set shiftwidth=4
"-------------------------------------------------------

"-------------------------------------------------------
" Some things to do, only if vim version is 600 or greater
if version >= 600 
syntax enable		" enable syntax highlighting, but keep current colour settings
filetype on 
filetype plugin indent on
else
syntax on		" enable syntax highlighting, overriding current colour settings with defaults
endif
"-------------------------------------------------------

"-------------------------------------------------------
" allows typing :tabv myfile.txt to open the specified 
" file in a new read-only tab 
cabbrev tabv tab sview +setlocal\ nomodifiable
"-------------------------------------------------------

"-------------------------------------------------------
" press F5 to insert the current timestamp
:nnoremap <F5> "=strftime("%c")<CR>P
:inoremap <F5> <C-R>=strftime("%c")<CR>
"-------------------------------------------------------

"-------------------------------------------------------
" press Ctrl-Left or Ctrl-Right to go to the previous or next tabs
" press Alt-Left or Alt-Right to move the current tab to the left or right
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
"-------------------------------------------------------

" Recognize .rkt files as scheme source
if version >= 600 
au BufNewFile,BufRead *.rkt set filetype=scheme
endif

"-------------------------------------------------------
" Yash's pro-coder additions
set makeprg=g++\ %\ -Wall
map <F3> :w <CR> :make<CR> <CR>
map <F2> :cn<CR>
"-------------------------------------------------------

"-------------------------------------------------------
" Open template cpp file while opening new file
autocmd BufNewFile *.cpp r ~/programming/tempelates/base.cpp
"-------------------------------------------------------

"-------------------------------------------------------
" Drupal hacks
if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
    autocmd BufRead,BufNewFile *.inc set filetype=php
    autocmd BufRead,BufNewFile *.profile set filetype=php
    autocmd BufRead,BufNewFile *.view set filetype=php
  augroup END
endif
syntax on
"-------------------------------------------------------

"-------------------------------------------------------
" Search hacks
set nohlsearch
"-------------------------------------------------------

"-------------------------------------------------------
" Powerline hacks
set rtp+=/usr/lib/python2.7/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
set encoding=utf-8 " Necessary to show Unicode glyphs
"-------------------------------------------------------

"-------------------------------------------------------
" Pathogen setup
execute pathogen#infect()
call pathogen#helptags() "generate helptags for everything in 'runtimepath'
"-------------------------------------------------------

"-------------------------------------------------------
" Ctrp config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"-------------------------------------------------------

"-------------------------------------------------------
" Syntastic config
let g:syntastic_php_checkers = ['php'] 
"-------------------------------------------------------

"-------------------------------------------------------
" Folds config
set foldmethod=indent
set foldnestmax=10
"-------------------------------------------------------

command NE NERDTree " Shortcut for NERDTree

colorscheme wombat256mod " Set colorscheme

let html_use_css=1

"-------------------------------------------------------
" Don't clutter dirs with tmp & swp
set backupdir=/home/enigma/.tmp
set directory=/home/enigma/.tmp
"-------------------------------------------------------

"-------------------------------------------------------
" Highlight text beyond 80 characters
" match ErrorMsg '\%>80v.\+'
"-------------------------------------------------------

"-------------------------------------------------------
" Command tab-complete settings
set wildmenu
set wildmode=full
"-------------------------------------------------------
