syntax on
set cursorline
set number
set noerrorbells
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set scrolloff=10
set nu
set relativenumber
set nowrap
set autoindent
set smartindent
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set hlsearch
set showmatch
set colorcolumn=80
set background=dark
set tags=tags;/
highlight ColorColumn ctermbg=0 guibg=lightgrey

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'crusoexia/vim-monokai'
call plug#end()

"" autocmd vimenter * ++nested colorscheme gruvbox
"" let g:gruvbox_contrast_dark = 'medium'

autocmd BufWritePre *.py :%s/\s\+$//e
let mapleader = ' '

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>fa :Ag<CR>
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>

""python specific config

vnoremap <leader>f !black -q -l 30 --fast -<CR>
