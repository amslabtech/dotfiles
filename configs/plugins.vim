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
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'lewis6991/gitsigns.nvim'
else
  Plug 'itchyny/lightline.vim'
  Plug 'mengelbrecht/lightline-bufferline'
endif
