""" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'michalbachowski/vim-wombat256mod'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'Townk/vim-autoclose'

call vundle#end()
filetype plugin indent on

""" Powerline
set laststatus=2
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

""" Basic options
colorscheme wombat256mod
set autoindent
set backspace=indent,eol,start
set confirm
set foldmethod=indent
set nu
set wildmenu
set wildmode=longest,list
syntax on

""" Search
set incsearch
set ignorecase
set nohlsearch
set smartcase

""" Tabs
set expandtab
autocmd FileType make setlocal noexpandtab

""" Indents
set shiftwidth=4
set tabstop=4
autocmd FileType yaml   set tabstop=2 | set shiftwidth=2

""" Autocomplete
" Don't select first match, always show popup.
set completeopt=longest,menuone
" Select option on pressing Enter.
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>" "

""" Restore cursor to position in last editing session
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

""" Whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
