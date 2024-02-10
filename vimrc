" #######################
" ####  keymapping  #####
" #######################
" === Normal ===
noremap <Esc><Esc> <Cmd>nohlsearch<CR><Esc>
noremap <Space>h ^
noremap <Space>l $
nnoremap <C-n> <Cmd>bnext<CR>
nnoremap <C-p> <Cmd>bprevious<CR>

" === Insert ===
inoremap jj <Esc>
inoremap <C-o> <C-o>o
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-d> <del>
inoremap <C-a> <Home>
inoremap <C-e> <End>
" No line break on Enter in completion candidate display
inoremap <expr><CR>    pumvisible() ? "\<C-y>" : "<CR>"
" Select a candidate for completion by Tab/Shift-Tab (Up/Down)
inoremap <expr><Tab>   pumvisible() ? "\<C-n>" : "<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "<S-Tab>"
inoremap <expr><Down>  pumvisible() ? "\<C-n>" : "<Down>"
inoremap <expr><Up>    pumvisible() ? "\<C-p>" : "<Up>"
if !has('nvim')
  inoremap / /<C-x><C-f>
endif

" === Terminal ===
tnoremap <C-o> <C-\><C-n>

" === For plugins ===
" - nvim-tree
nnoremap <silent><C-e> :NERDTreeToggle<CR>
" - toggleterm
if has('nvim')
  nnoremap <silent><C-t> :ToggleTerm<CR>
endif


" ####################
" ####  plugins  #####
" ####################
" === Automatic vim-plug installation ===
if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Run :PlugInstall if any plugins are missing
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" === List of plugins ===
call plug#begin('~/.vim/plugged')
Plug 'tomasr/molokai'
Plug 'sheerun/vim-polyglot'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'luochen1990/rainbow'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
if has('nvim')
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'EdenEast/nightfox.nvim'
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
  Plug 'echasnovski/mini.indentscope'
  Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'itchyny/lightline.vim'
  Plug 'mengelbrecht/lightline-bufferline'
endif
call plug#end()


" #####################
" ####  settings  #####
" #####################
" === Look ===
set number
set cursorline
set mouse=a
" Enable True Color
if has('nvim')
  set termguicolors
endif
" The maximum number of items to show in the popup menu
set pumheight=10

" === Control ===
" Allows other files to be opened while buffers are being edited
set hidden
" Scroll margin
set scrolloff=20
" Allow the cursor to move one character beyond the end of line
set virtualedit=onemore
" Allows movement across lines
set whichwrap=b,s,h,l,<,>,[,],~

" === Edit ===
" Copy to clipboard
set clipboard=unnamedplus
" Remove space at the end of line when saving
autocmd BufWritePre * :%s/\s\+$//ge
" Place the cursor at the last position of the last time when opening file
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END
" undo
if has('persistent_undo')
  if has('nvim')
    set undodir=~/.config/nvim/undo
  else
    set undodir=~/.vim/undo
  endif
  set undofile
endif
" Don't create backupfiles
set nobackup
" Don't create swapfiles
set noswapfile

" === Tab ===
" Show Tab with ▸-
set list listchars=tab:\▸\-
" Auto indent size
set autoindent
set smartindent
set cindent
set smarttab
" Indent size when shifting text
set shiftwidth=4
" The number of space as Tab
set softtabstop=4
set tabstop=4
" Make Tab half-width space
set expandtab

" === Search ===
" Ignore upper and lower case letters when searching
set ignorecase
" Normal search
set smartcase
" Highlight search
set hlsearch
" Incremental search
set incsearch

" === For plugins ===
colorscheme molokai
" - rainbow
let g:rainbow_active = 1
" - vim-polyglot
let g:cpp_member_highlight = 1
let g:cpp_simple_highlight = 1
" - vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
" - vim-gitgutter
highlight GitGutterDelete guifg=#EB0A13 ctermfg=1
highlight GitGutterAdd    guifg=#AEC90B ctermfg=2
highlight GitGutterChange guifg=#FB8505 ctermfg=3

if has('nvim')
  " - deoplete
  let g:deoplete#enable_at_startup = 1
else
  " - lightline-bufferline
  let g:lightline#bufferline#unnamed = '[No Name]'
  " - lightline.vim
  set laststatus=2
  set showtabline=2
  let g:lightline = {
    \ 'colorscheme': 'powerlineish',
    \ 'tabline': {
    \   'left': [ ['buffers'] ]
    \ },
    \ 'component_expand': {
    \   'buffers': 'lightline#bufferline#buffers'
    \ },
    \ 'component_type': {
    \   'buffers': 'tabsel'
    \ }
    \ }
endif
