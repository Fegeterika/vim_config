" .vimrc

set nocompatible              " be iMproved, required
filetype off                  " required

" remap nerdtree shortcut
map <C-n> :NERDTreeToggle<CR>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

Plugin 'itchyny/lightline.vim'
Plugin 'git://github.com/airblade/vim-gitgutter.git'
Plugin 'scrooloose/nerdtree'
Plugin 'fatih/vim-go'
"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" If installed using Homebrew
set rtp+=/usr/local/opt/fzf

" If installed using git
set rtp+=~/.fzf

" enable syntax
syntax enable

set laststatus=2
set noshowmode

" colors
set background=dark
colorscheme solarized

" spaces & tabs
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4

" window
set splitright

" UI
set number
set showcmd
set cursorline
filetype indent on
set wildmenu
set lazyredraw
set showmatch

" searching
set incsearch
set hlsearch
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" folding
set foldenable
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level

" go fmt on save
au BufWritePost *.go !gofmt -w %
