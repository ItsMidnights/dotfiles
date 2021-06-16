set tabstop=2 softtabstop=2
set expandtab
set smartindent
set exrc
set nu
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set nowrap
set noswapfile
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set colorcolumn=80
set signcolumn=yes

call plug#begin('~/.vim/plugged/')
Plug 'gruvbox-community/gruvbox'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()

syntax on
highlight Normal guibg=none
colorscheme gruvbox

let mapleader=" "

" mode lhs rhs

" needs some work
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

fun! TrimWhitespace()
        let l:save = winsaveview()
        keeppatterns %s/\s\+$//e
        call winrestview(l:save)
endfun

" BufWritePre for pre-save things: *formatting etc*
augroup SCHADOUGH
        autocmd!
        autocmd BufWritePre * :call TrimWhitespace()
augroup END

