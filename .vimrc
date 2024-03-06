let mapleader = ','
let $FZF_DEFAULT_COMMAND = "rg --hidden --files -g '!.git/'"

set lazyredraw
set number
set cursorline
set ignorecase
set smartcase
set foldlevel=99
set nocompatible
set colorcolumn=101,121
set foldmethod=indent
set relativenumber

highlight ColorColumn ctermbg=0 guibg=lightgrey

filetype plugin indent on
filetype on
filetype indent on

augroup vimrc_autocmd
  autocmd!
  autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
  autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2
  autocmd FileType typescript setlocal expandtab shiftwidth=2 tabstop=2
  autocmd FileType javascriptreact setlocal expandtab shiftwidth=2 tabstop=2
  autocmd FileType typescriptreact setlocal expandtab shiftwidth=2 tabstop=2
  autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2
  autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=2
  autocmd FileType python setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufWritePre *.rb :%s/\s\+$//e
  autocmd BufWritePre *.slim :%s/\s\+$//e
augroup END

set rtp+=/usr/local/opt/fzf
nmap <Leader>p :Files <CR>
nmap <Leader>c :Goyo <CR>
nmap <Leader>h :History <CR>
nmap <Leader>f :Rg <CR>
nmap <Leader>g :Magit <CR>
nmap <Leader>l :TestLast <CR>
nmap <Leader>t :TestFile <CR>
nmap <Leader>n :TestNearest <CR>
nmap <Leader>R :ALEFix <CR>
nmap <Leader>` :bo 10sp \| term <CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
tnoremap <Esc> <C-\><C-n>
nnoremap <s-f> za
nnoremap <Leader>b :<C-u>call gitblame#echo()<CR>

vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>Ngn

nnoremap <S-j> <Esc>:m .+1<CR>
nnoremap <S-k> <Esc>:m .-2<CR>
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
nmap <silent> gd <Plug>(coc-definition)
nnoremap <silent> <Leader>K :call <SID>show_documentation()<CR>
nmap <leader>rn <Plug>(coc-rename)

imap <D-]> <Plug>(copilot-next)
imap <D-[> <Plug>(copilot-previous)
imap <D-.> <Plug>(copilot-accept-line)


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

set splitbelow
set splitright

let g:ale_disable_lsp = 1

call plug#begin(stdpath('data') . '/plugged')
Plug 'slim-template/vim-slim'
Plug 'Yggdroot/indentLine'
Plug 'zivyangll/git-blame.vim'
Plug 'ray-x/starry.nvim'
"Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'github/copilot.vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jreybert/vimagit'
Plug 'tpope/vim-rhubarb'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'junegunn/goyo.vim'
Plug 'sheerun/vim-polyglot'
Plug 'vim-ruby/vim-ruby'
Plug 'joshdick/onedark.vim'
Plug 'psliwka/vim-smoothie'
Plug 'vim-test/vim-test'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-dispatch'
Plug 'mhinz/vim-startify'
Plug 'matze/vim-move'
Plug 'tpope/vim-vinegar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vimwiki/vimwiki'
Plug 'SirVer/ultisnips'
Plug 'CopilotC-Nvim/CopilotChat.nvim'
call plug#end()


"let g:copilotchat_options = {
"      \ 'show_help': 'yes',
"      \ 'debug': v:false,
"      \ 'disable_extra_info': 'no',
"      \ 'proxy': '',
"      \ }
"
"let g:copilot_chat_disable_separators = "no"
"let g:copilot_chat_proxy = ""
"lua _COPILOT_CHAT_GLOBAL_CONFIG = _COPILOT_CHAT_GLOBAL_CONFIG or {}
"let g:copilot_chat_user_prompts = {
"      \ 'Explain': 'Explain how it works.',
"      \ 'Tests': 'Briefly explain how selected code works then generate unit tests.',
"      \ }
"let g:copilot_chat_show_help = 'yes'
"let g:copilot_chat_language = 'English'
"let g:copilot_chat_clear_chat_on_new_prompt = 'yes'
"let copilot_chat_disable_separators = 'no'
"let copilot_chat_hide_system_prompt = 'yes'

nnoremap <leader>cce <cmd>CopilotChatExplain<cr>
nnoremap <leader>cct <cmd>CopilotChatTests<cr>
xnoremap <leader>ccv :CopilotChatVisual<cr>
xnoremap <leader>ccx :CopilotChatInPlace<cr>

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
"colorscheme onedark
let g:airline_theme='onedark'
let test#strategy = "dispatch"
let test#ruby#use_binstubs = 0
let g:dispatch_compilers = {
      \ 'bundle exec': '',
      \ 'clear;': '',
      \ 'zeus': ''}

function! ToggleTestingStrategy()
  if g:test#strategy == "dispatch"
    let g:test#strategy = "neovim"
  else
    let g:test#strategy = "dispatch"
  endif
  echo g:test#strategy
endfunction

nnoremap <Leader>T :call ToggleTestingStrategy() <CR>
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_fixers = {
	\   '*': ['remove_trailing_lines', 'trim_whitespace'],
	\   'javascript': ['eslint'],
	\   'ruby': ['rubocop'],
        \   'erb': ['erb']
	\}
let g:wordmotion_prefix = '\'
let g:UltiSnipsExpandTrigger="<S-`>"
let g:UltiSnipsEditSplit="vertical"

let starry_style="moonlight" 
let starry_deep_black=v:true

let g:goyo_width=130
colorscheme moonlight


lua << EOF
  local copilot_chat = require("CopilotChat")

  -- REQUIRED
  copilot_chat:setup({})
EOF
