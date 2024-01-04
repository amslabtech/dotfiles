" #######################
" ####  keymapping  #####
" #######################
" === Normal ===
noremap <Esc><Esc> <Cmd>nohlsearch<CR><Esc>
noremap <Space>h ^
noremap <Space>l $

" === Insert ===
inoremap jj <Esc>
inoremap <C-o> <C-o>o
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-d> <del>

" === For plugins ===
" - barbar
nnoremap <silent><C-n> <Cmd>BufferNext<CR>
nnoremap <silent><C-p> <Cmd>BufferPrevious<CR>
" - nvim-tree
nnoremap <silent><C-e> <Cmd>NvimTreeToggle<CR>
" - toggleterm
nnoremap <silent><C-t> <Cmd>ToggleTerm<CR>
" - deoplete
" No line break on Enter in completion candidate display
inoremap <expr><CR>    pumvisible() ? "\<C-y>" : "<CR>"
" Select a candidate for completion by Tab/Shift-Tab (Up/Down)
inoremap <expr><Tab>   pumvisible() ? "\<C-n>" : "<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "<S-Tab>"
inoremap <expr><Down>  pumvisible() ? "\<C-n>" : "<Down>"
inoremap <expr><Up>    pumvisible() ? "\<C-p>" : "<Up>"


" ####################
" ####  plugins  #####
" ####################
" === Automatic vim-plug installation ===
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Run :PlugInstall if any plugins are missing
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" === List of plugins ===
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tomasr/molokai'
Plug 'EdenEast/nightfox.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-commentary'
Plug 'kylechui/nvim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'
Plug 'Yggdroot/indentLine'
Plug 'echasnovski/mini.indentscope'
Plug 'sheerun/vim-polyglot'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()


" #####################
" ####  settings  #####
" #####################
" === Look ===
set number
set cursorline
" Enable True Color
set termguicolors
" The maximum number of items to show in the pop-up menu
set pumheight=10
" Pop-up menu even if only one completion candidate is available
set completeopt=menuone,noinsert

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
  set undodir=~/.config/nvim/undo
  set undofile
endif
" Don't create backupfiles
set nobackup
" Don't create swapfiles
set noswapfile

" === Tab ===
" Show Tab with ▸-
set list listchars=tab:\▸\-
" Make Tab half-width space
set expandtab
" The number of space as Tab
set tabstop=4
set softtabstop=4
" Indent size when shifting text
set shiftwidth=4
" Auto indent size
set autoindent
set smartindent
set cindent

" === Search ===
" Ignore upper and lower case letters when searching
set ignorecase
" Normal search
set smartcase

" === For plugins ===
colorscheme molokai
" - rainbow
let g:rainbow_active = 1
" - vim-polyglot
let g:cpp_member_highlight = 1
let g:cpp_simple_highlight = 1
" - vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
" - deoplete
let g:deoplete#enable_at_startup = 1
" - gitgutter
highlight GitGutterDelete guifg=#EB0A13 ctermfg=1
highlight GitGutterAdd    guifg=#AEC90B ctermfg=2
highlight GitGutterChange guifg=#FB8505 ctermfg=3
lua << END
-- lualine
require'lualine'.setup { options = { theme = 'carbonfox' } }
--  nvim-tree
require'nvim-tree'.setup {  }
-- nvim-surround
require'nvim-surround'.setup {  }
-- mini.indentscope
require'mini.indentscope'.setup { symbol = '▏' }
-- toggleterm
require'toggleterm'.setup {  }
END
