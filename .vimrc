set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" " required! 
Plugin 'gmarik/Vundle.vim'
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
syntax on
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
set t_Co=256
set background=dark
"colorscheme solarized

" Make F8 toggle tagbar
nmap <F8> :TagbarToggle<CR>


