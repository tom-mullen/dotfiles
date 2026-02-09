" -------------------- CONFIG
" --------------------

" colorscheme
set runtimepath+=~/dotfiles/vim/pack/themes/start/dracula_pro
set termguicolors
syntax enable
let g:dracula_colorterm = 0
colorscheme dracula_pro

" map semi-colon to colon
nnoremap ; :
filetype on " Enable filetype detection
filetype indent on " Enable filetype-specific indenting
filetype plugin on " Enable filetype-specific plugins
set autoindent
set backspace=indent,eol,start " backspace for dummys
set backupdir=/tmp/
set complete+=kspell
set directory=/tmp " don't clutter my dirs up with swp and tmp files
set et|retab
set encoding=utf-8
set expandtab
set gdefault " assume the /g flag on :s substitutions to replace all matches
set incsearch
set laststatus=2  " always show status line.
set list " use :set list! to toggle visible whitespace on/off
set listchars=nbsp:¬,tab:>-,trail:•,extends:➮
set modeline " bash-like filenames completion
set nobackup
set nowritebackup
set noerrorbells " disable vim error noise
set noshowmode "hide default vim mode
set noswapfile " diable swap file
set nocompatible
set number
set numberwidth=5
set history=50
set relativenumber
set ruler
set shiftwidth=2
set showcmd " display incomplete commands
set smartcase " searching
set smarttab
set tabstop=2
set wildignore+=tmp/** " ignore stuff that can't be opened
set wildmode=longest,full
set wildmenu
:setlocal spell spelllang=en_gb

" --------------------
" GIT
" --------------------
autocmd Filetype gitcommit setlocal spell textwidth=72 " format commit

" --------------------
" MAPPINGS
" --------------------
let mapleader = ","

" navigate displayed lines rather than physical lines
noremap j gj
noremap k gk

" Map Ctrl + p to open Telescope frecency (smart file finder)
nnoremap <c-p> :Telescope frecency workspace=CWD theme=ivy<cr>
"remove highlight on hitting enter
cnoremap <silent> <cr> <cr>:nohl<cr>
nnoremap <silent> <C-l> :nohl<CR><C-l>

map <Leader>bb :!bundle install<cr>
map <Leader>ec :Vcontroller<cr>
map <Leader>em :Vmodel<cr>
map <Leader>ev :Vview<cr>
map <Leader>ef :NvimTreeFindFile<cr>
map <Leader>ew :NvimTreeToggle<cr>
map <Leader>f :Telescope live_grep<cr>
map <Leader>fc :Telescope grep_string<cr>
map <Leader>nn :nonumber<cr>
map <Leader>q :copen<cr>
map <Leader>p :set paste<cr><esc>"*]p:set nopaste<cr>
xnoremap p P " prevent paste from yanking text
map <Leader>ra :%s/
map <Leader>sc :sp db/schema.rb<cr>
map <Leader>sl :sort<cr>
map <Leader>v :vsp<cr>

" toggle line and relative numbers
function! ToggleLineNumbers()
  exec ':set nu!'
  exec ':set relativenumber!'
endfunction
map <Leader>nn :call ToggleLineNumbers()<cr>

" --------------------
" TEST RUNNING (vim-test)
" --------------------
nmap <silent> <Leader>t :TestNearest<CR> " Run test nearest to cursor
nmap <silent> <Leader>T :TestFile<CR> " Run tests in current file
nmap <silent> <Leader>tl :TestLast<CR> " Run last test
nmap <silent> <Leader>tf :TestVisit<CR> " Visit the last run test file

" --------------------
" VIM-LOCALORIE
" --------------------
nmap <Leader>i :call localorie#translate()<CR> " Show all translations for i18n key under cursor
nmap <Leader>dt :echo localorie#expand_key()<CR> " Show full key path in locale file
let g:localorie = {
      \ 'quickfix':  1,
      \ 'switch':    1
      \ }

