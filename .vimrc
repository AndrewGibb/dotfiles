let mapleader = " "
nnoremap <leader>a :echo  "<lt>leader> works! It is set to \<leader> " <cr>
set nocompatible               " be iMproved
filetype off                   " required!
filetype plugin indent on     " required!
" nvim_test syntax enable
set mouse=n

let terminal_program = $TERM_PROGRAM

" Tabs
set tabstop=2
set shiftwidth=2
set expandtab

" New lines have the same indentation as previous:
set autoindent

" Relative line numbers
set relativenumber number

" word wrapping, without inserting newlines
set wrap
set linebreak
set nolist  " list disables linebreak
set textwidth=0
set wrapmargin=0

" Make backspace behave in a sane way:
set backspace=indent,eol,start

let g:polyglot_disabled = ['python', 'python-compiler', 'python-indent']


" Built-in plugin to extent % so that it matches other stuff.
" Doesn't work in python, according to docs.
" runtime macros/matchit.vim

syntax off
"set the runfimepath to be able to find fzf
" set rtp+=/usr/local/opt/fzf
call plug#begin()
" My Plugins here:
"
" original repos on github
"----  Appearance ----
if has('nvim')
" https://git.chanpinqingbaoju.com/ishan9299/nvim-solarized-lua
    Plug 'ishan9299/nvim-solarized-lua'
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
elseif has('vim')
    Plug 'altercation/vim-colors-solarized'
endif

Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
"
" ----  Dev convenience ----
"
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
if has('nvim')
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'neovim/nvim-lspconfig'

    " Treesitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'

    " Completion
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
"
		Plug 'L3MON4D3/LuaSnip'
    " Telescope & prereqs:
    Plug 'BurntSushi/ripgrep'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
"else
""    :echom 'using vim'
"    Plug 'nathanaelkane/vim-indent-guides'
end
Plug 'preservim/vimux'
Plug 'tpope/vim-obsession'

" ----  Language support -----
Plug 'sheerun/vim-polyglot'
Plug 'otherjoel/vim-pollen'
Plug 'JuliaEditorSupport/julia-vim'
"Plug 'Vimjas/vim-python-pep8-indent'
Plug 'hashivim/vim-terraform'
Plug 'IN3D/vim-raml'


call plug#end()

" from https://jeffkreeftmeijer.com/vim-number/
" Show relative numbers in the active pane, and absolute numbers in others
:set number

:augroup numbertoggle
: autocmd!
: autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu | endif
: autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
:augroup END

" from https://vi.stackexchange.com/questions/12140/how-to-disable-moving-the-cursor-with-the-mouse
" Prevent the cursor from moving to the clicked position, when using
" left-mouse to focus on a Vim window.
" Note that this ONLY prevents the cursor from moving on the click that
" alters focus state. 
" Subsequent clicks will move the cursor.
augroup NO_CURSOR_MOVE_ON_FOCUS
  au!
  au FocusLost * let g:oldmouse=&mouse | set mouse=
  au FocusGained * if exists('g:oldmouse') | let &mouse=g:oldmouse | unlet g:oldmouse | endif
augroup END

" Trying to fix colours:
"$TERM_PROGRAM
"if has("nvim") && terminal_program == "iTerm.app"
"    :echom 'nvim & iterm yay'
"    " has true colour support and is nvim
"    set termguicolors
"    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"    colorscheme base16-materia
"elseif terminal_program == "iTerm.app"
"    " has tru colour support, but in vim
"    set termguicolors
"    colorscheme NeoSolarized
"else
"    set termguicolors
"    colorscheme solarized
"endif

if has("nvim")
"    :echom 'nvim & iterm yay'
    " has true colour support and is nvim
    set termguicolors
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    colorscheme solarized
elseif terminal_program == "iTerm.app"
    " has tru colour support, but in vim
    set termguicolors
    colorscheme NeoSolarized
endif


" Turn on solarized:
" set t_Co=16
"let g:solarized_termtrans=1
" nvim_test set background=dark
" nvim_test colorscheme solarized

" File associations
au BufNewFile,BufRead *.qaml setf raml
au BufNewFile,BufRead Jenkinsfile setf groovy

" Remove trailing whitespace on certain filetypes
" (Don't make universal. at least vimrc needs trailing whitespace:
autocmd BufWritePre *.qaml,*.raml %s/\s\+$//e

" netrw configuration
let g:netrw_liststyle=3

" airline configuration:
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0

" signify configuration:
set updatetime=100

" Custom commands:
" open list of buffers ready to just hit a number to move:
nnoremap gb :ls<CR>:b<Space>
" In normal mode, - opens the enclosing directory. In NetRW, it does the same:
nnoremap <silent> - :Explore<CR>
" Generate a new vertical split with vv 
nnoremap <silent> vv <C-w>v
" Generate a new horizontal split with ss 
nnoremap <silent> ss <C-w>s

" Move between splits (windows) with ctrl-dir, to match with .tmux.conf
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" Custom vimux commands:
" Prompt for a command to run
map <Leader>up :VimuxPromptCommand<CR>
" Prompt for a make command to run
map <Leader>um :VimuxPromptCommand("make ")<CR>
" Run last command executed by VimuxRunCommand
map <Leader>ul :VimuxRunLastCommand<CR>
" Inspect runner pane
map <Leader>ui :VimuxInspectRunner<CR>
" Zoom the tmux runner pane
map <leader>uz :VimuxZoomRunner<CR>
" Close vim tmux runner opened by VimuxRunCommand
map <Leader>uq :VimuxCloseRunner<CR>

"Custom CoC Commands
"go to definition:
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> K :call <SID>show_documentation()<CR>
" function! s:show_documentation()
"     if (index(['vim','help'], &filetype) >=0)
"         execute 'h .expand('<cword>')
"     else
"         call CocAction('doHover')
"     endif
" endfunction
" Make F8 toggle tagbar
" nmap <F8> :TagbarToggle<CR>

" Configure CtrlP:
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'

" Enable Indent-guides by default
" for nvim let g:indent_guides_enable_on_vim_startup = 1

" Test parsing flake8 errors into quickfix list:
set errorformat+=%f:%l:%c\ %m

" Tags for CFPA stuff
" :set tags=~/code/cfpa-reference/cfpatags

" Autocompletion??
"set omnifunc=syntaxcomplete#Complete

" Show file encoding in the status bar
if has("statusline")
    set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
endif

set laststatus=2
