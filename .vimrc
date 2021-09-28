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
Plugin 'kien/ctrlp.vim'
Plugin 'epmatsw/ag.vim'
Plugin 'neoclide/coc.nvim'          " host language servers
" Go
Plugin 'fatih/vim-go'
" Javascript & Typescript
Plugin 'pangloss/vim-javascript'    " JavaScript support
Plugin 'leafgarland/typescript-vim' " TypeScript syntax
Plugin 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plugin 'jparise/vim-graphql'        " GraphQL syntax

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Set leader key
let mapleader=" "

" CoC
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" CTRLP
nnoremap <leader>fs :CtrlP<SPACE>

" AG
if executable('ag')
    " Use ag over grep "
    set grepprg=ag\ --nogroup\ --nocolor\ --column

    " Use ag in CtrlP for listing files "
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif
nnoremap <leader>ts :Ag<SPACE>
nnoremap <leader>ss :Ag<SPACE><CR>

" Fold
nnoremap <leader>m za
set foldmethod=indent " fold based on indent level

" NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '__pycache__']

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

" make backspacework
set backspace=indent,eol,start

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

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Go
" go fmt on save
au BufWritePost *.go !gofmt -w %

" yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" javascript and typescript
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType typescript setlocal ts=2 sts=2 sw=2

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

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
