" vim-plugがなかったらインストール
if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" 足りないプラグインがあれば :PlugInstall を実行
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" ===  プラグイン ===
call plug#begin('~/.vim/plugged')
Plug 'tomasr/molokai'
Plug 'tomtom/tcomment_vim'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-highlightedyank'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
call plug#end()


" === 基本設定系 ===
"文字コードをUFT-8に設定
set encoding=utf-8
set modifiable
set write
set fenc=utf-8
scriptencoding
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" ファイルを上書きする前にバックアップを作ることを無効化
set nowritebackup
" マウス操作有効化
set mouse=a


" === 表示系 ===
" カラースキーマ
colorscheme molokai
" 行番号を表示
set number
" タイトルを表示
set title
" 現在の行を強調表示
set cursorline
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells
" 対応する括弧やブレースを表示
set showmatch matchtime=1
" シンタックスハイライト
syntax on
" スクロール時の余裕
set scrolloff=20
" 最後にカーソルがあった場所に移動
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END
" menuone: 補完候補が一つしかなくてもポップアップメニューを表示
set completeopt=menuone,noinsert
" 補完表示時のEnterで改行をしない
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"
" ポップアップメニューの最大高さ
set pumheight=10


" ===  操作系 ===
" 行をまたいで移動
set whichwrap=b,s,h,l,<,>,[,],~
" - Normal mode
" ;でコマンド入力
noremap ; :
" 行頭にカーソル移動
noremap <Space>h ^
" 行末にカーソル移動
noremap <Space>l $
" 左のタブに移動
noremap <C-p> :bprevious<CR>
" 右のタブに移動
noremap <C-n> :bnext<CR>
" - Insert mode
" jjをESCとして扱う
inoremap jj <Esc>
" 行途中で次の行に新規挿入
inoremap <C-o> <C-o>o


" === 編集系 ===
" ヤンクでクリップボードにコピー
set clipboard=unnamedplus
" 常にglobal
set gdefault
" 保存時に行末の空白を削除する
autocmd BufWritePre * :%s/\s\+$//ge
" ファイルを開き直してもundoできる
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif


" === Tab系 ===
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 空白部分でtabキーやbackspaceを押したときにカーソル移動する幅
set softtabstop=4
" 自動インデントの幅
set shiftwidth=4
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" 改行時に前の行のインデントを継続する
set autoindent " :set pasteで解除可能


" === 検索系 ===
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" nerdtree
nnoremap <silent><C-e> :NERDTreeToggle<CR>


" === プラグイン ===
" - vim-airline
" テーマ
let g:airline_theme = 'molokai'
" powerline系フォントを利用
let g:airline_powerline_fonts = 1
" ステータスバーの項目を変更
let g:airline_section_a = airline#section#create(['mode', 'crypt'])
" ステータスバーでフルパスを表示
let g:airline_section_c = '%F'
" bufferタブを表示
let g:airline#extensions#tabline#enabled = 1
" bufferタブに番号を表示
let g:airline#extensions#tabline#buffer_idx_mode = 1
" ファイルパスの表示形式
let g:airline#extensions#tabline#formatter = 'unique_tail'
" ステータスバーにエラー情報を表示（ALEと一緒に使用）
let g:airline#extensions#ale#enabled = 1

" - deoplete
" 有効化
let g:deoplete#enable_at_startup = 1

" ale
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_sign_colmun_always = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_cursor = 0
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 0
let g:ale_list_window_size = 3
