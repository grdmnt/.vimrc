let mapleader = ','
let $FZF_DEFAULT_COMMAND = 'rg --hidden --files'

set number
set cursorline
set ignorecase
set smartcase
set foldlevel=99

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%101v', 100)

filetype plugin indent on
filetype on
filetype indent on
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=2
autocmd BufWritePre *.rb :%s/\s\+$//e

set rtp+=/usr/local/opt/fzf
nmap <Leader>p :Files <CR>
nmap <Leader>f :Rg <CR>
nmap <Leader>g :Magit <CR>
nmap <Leader>l :.Rails <CR>
nmap <Leader>t :Rails <CR>
nmap <Leader>` :bo 10sp \| term <CR>
nnoremap <Leader>R :! bundle exec rubocop --auto-correct % <CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
tnoremap <Esc> <C-\><C-n>
nnoremap <s-f> za

set splitbelow
set splitright

call plug#begin(stdpath('data') . '/plugged')
Plug 'slim-template/vim-slim'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jreybert/vimagit'
Plug 'tpope/vim-rhubarb'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'sheerun/vim-polyglot'
Plug 'vim-ruby/vim-ruby'
Plug 'joshdick/onedark.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'psliwka/vim-smoothie'
Plug 'junegunn/goyo.vim'
Plug 'vim-test/vim-test'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-dispatch'
Plug 'mhinz/vim-startify'
Plug 'majutsushi/tagbar'
Plug 'matze/vim-move'
Plug 'tpope/vim-vinegar'
Plug 'vim-utils/vim-ruby-fold'
call plug#end()

let g:startify_change_to_dir=0
let g:startify_change_to_vcs_root=1
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

"syntax on
colorscheme onedark
let g:airline_theme='onedark'
let test#strategy = "dispatch"
