"-------------------------------------------------------
" My ViM Run Commands (vimrc)
" Chandan Singh
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
" Tabstop and indent shiftwidth config.
" set default values
set tabstop=2
set shiftwidth=2
" tab space value and indent shiftwidth for some filetypes
autocmd FileType python set tabstop=4 | set shiftwidth=4
autocmd FileType php set tabstop=2 | set shiftwidth=2
autocmd FileType css set tabstop=2 | set shiftwidth=2
autocmd FileType ruby 	set tabstop=2 | set shiftwidth=2
autocmd FileType js 	set tabstop=2 | set shiftwidth=2
autocmd FileType java 	set tabstop=2 | set shiftwidth=2
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
autocmd BufNewFile *.cpp 0r ~/programming/templates/base.cpp
"-------------------------------------------------------

"-------------------------------------------------------
if has("autocmd")
  augroup module
    " Drupal *.module and *.install files.
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
    autocmd BufRead,BufNewFile *.inc set filetype=php
    autocmd BufRead,BufNewFile *.profile set filetype=php
    autocmd BufRead,BufNewFile *.view set filetype=php
    autocmd BufRead,BufNewFile *.theme set filetype=php

    " Treat *.md files as markdown.
    autocmd BufRead,BufNewFile *.md set filetype=markdown
  augroup END
endif
syntax on
"-------------------------------------------------------

"-------------------------------------------------------
" Don't highlight all search results
set nohlsearch
"-------------------------------------------------------

"-------------------------------------------------------
" Powerline config
set rtp+=/home/enigma/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
set encoding=utf-8 " Necessary to show Unicode glyphs
"-------------------------------------------------------

"-------------------------------------------------------
" Syntastic config
let g:syntastic_php_checkers = ['php']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['java'] }
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
" Higihlight background beyond 80 characters
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27
"-------------------------------------------------------

"-------------------------------------------------------
" Command tab-complete settings
set wildmenu
set wildmode=full
"-------------------------------------------------------

"-------------------------------------------------------
" Remove trailing whitespaces on pressing F5.
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
" Highlight trailing whitespaces.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
"-------------------------------------------------------

"-------------------------------------------------------
" Smart autocomplete settings.

" Don't select first match, always show popup.
set completeopt=longest,menuone
" Select option on pressing Enter.
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"-------------------------------------------------------

"-------------------------------------------------------
" PHP DocBlock key bindings
autocmd FileType php inoremap <C-d> <ESC>:call PhpDocSingle()<CR>i
autocmd FileType php nnoremap <C-d> :call PhpDocSingle()<CR>
autocmd FileType php vnoremap <C-d> :call PhpDocRange()<CR>
"-------------------------------------------------------

"-------------------------------------------------------
" Pathogen setup
execute pathogen#infect()
call pathogen#helptags() "generate helptags for everything in 'runtimepath'
"-------------------------------------------------------

"-------------------------------------------------------
" Map shortcut for saving file with sudo. Use `:w!!` to save in this case.
cmap w!! w !sudo tee >/dev/null %
"-------------------------------------------------------
