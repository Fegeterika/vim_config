" .vimrc
" Jae Song

set nocompatible              " be iMproved, required
filetype off                  " required

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
Plugin 'kien/ctrlp.vim'
Plugin 'vim-syntastic/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" syntastic configs
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=['flake8']

" remap nerdtree shortcut
map <C-n> :NERDTreeToggle<CR>

" Clipboard
set clipboard=unnamed

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

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" javascript
au BufNewFile,BufRead *.js, *.html, *.css
    \set tabstop=2
    \ softtabstop=2
    \ shiftwidth=2

" python
au BufNewFile,BufRead *.py
    \set tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix

highlight BadWhitespace ctermfg=16 ctermbg=253 guifg=#000000 guibg=#F8F8F0
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
