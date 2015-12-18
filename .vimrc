set nocompatible               " be iMproved
filetype off                   " required!

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
Plugin 'majutsushi/tagbar'
Plugin 'altercation/vim-colors-solarized'
"
" " Github repos of the user 'vim-scripts'
" " => can omit the username part
" Plugin 'L9'
" Plugin 'FuzzyFinder'
"
Plugin 'JuliaLang/julia-vim'
"
" " non github repos
" Plugin 'git://git.wincent.com/command-t.git'
" " ...

call vundle#end()
filetype plugin indent on     " required!
set tabstop=4
set shiftwidth=4
set expandtab

" Turn on solarized:
" set t_Co=256
syntax enable
"let g:solarized_termtrans=1
set background=dark
colorscheme solarized

" Make F8 toggle tagbar
nmap <F8> :TagbarToggle<CR>


