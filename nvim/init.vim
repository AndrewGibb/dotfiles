set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

"call plug#begin()
"
"Plug 'lukas-reineke/indent-blankline.nvim'
"Plug 'neovim/nvim-lspconfig'
"
"" Treesitter
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"
"" Telescope & prereqs:
"Plug 'BurntSushi/ripgrep'
"Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim'
"
"call plug#end()

lua require('luaconfig')

" experimental custom function to fuzzy find cloudfit files
" nnoremap <leader>ec <cmd> lua require('luaconfig').edit_cfpa()<cr>
nnoremap <leader>ec :Telescope find_files cwd=~/code/cfpa-reference<cr>
