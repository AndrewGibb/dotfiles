" let mapleader = ","
nnoremap <leader>a :echo  "<lt>leader> works! It is set to \<leader> " <cr>
set nocompatible               " be iMproved
filetype off                   " required!
filetype plugin indent on     " required!
syntax enable

runtime macros/matchit.vim
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" " required! 
Plugin 'VundleVim/Vundle.vim'
"
" " My Plugins here:
" "
" " original repos on github
" Plugin 'majutsushi/tagbar'
Plugin 'altercation/vim-colors-solarized'
Plugin 'craigemery/vim-autotag'
Plugin 'JuliaEditorSupport/julia-vim'
Plugin 'tpope/vim-surround'
Plugin 'vimoutliner/vimoutliner'
Plugin 'vimwiki/vimwiki', { 'branch': 'dev' }
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'jesseleite/vim-agriculture'
Plugin 'IN3D/vim-raml'
" Plugin 'ctrlpvim/ctrlp.vim'
"
" " Github repos of the user 'vim-scripts'
" " => can omit the username part
" Plugin 'L9'
" Plugin 'FuzzyFinder'
"
"
" " non github repos
" Plugin 'git://git.wincent.com/command-t.git'
" " ...

call vundle#end()

" File associations
au BufNewFile,BufRead *.qaml setf raml
au BufNewFile,BufRead Jenkinsfile setf groovy

" Remove trailing whitespace on certain filetypes
" (Don't make universal. at least vimrc needs trailing whitespace:
autocmd BufWritePre *.py,*.qaml,*.raml %s/\s\+$//e

" netrw configuration
let g:netrw_liststyle=3

" Custom commands:
" open list of buffers ready to just hit a number to move:
nnoremap gb :ls<CR>:b<Space>

" Tabs
set tabstop=2
set shiftwidth=2
set expandtab

" New lines have the same indentation as previous:
set autoindent

" Relative line numbers
set relativenumber

" word wrapping, without inserting newlines
set wrap
set linebreak
set nolist  " list disables linebreak
set textwidth=0
set wrapmargin=0

" Turn on solarized:
set t_Co=16
"let g:solarized_termtrans=1
set background=dark
colorscheme solarized

" Make F8 toggle tagbar
nmap <F8> :TagbarToggle<CR>

" Make backspace behave in a sane way:
set backspace=indent,eol,start

" Configure CtrlP:
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Test parsing flake8 errors into quickfix list:
set errorformat+=%f:%l:%c\ %m

" Tags for CFPA stuff
:set tags=~/code/cfpa-reference/cfpatags

" Autocompletion??
set omnifunc=syntaxcomplete#Complete
