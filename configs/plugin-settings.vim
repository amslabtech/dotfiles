" #######################
" ####  keymapping  #####
" #######################
" - nerdtree
nnoremap <silent><C-e> :NERDTreeToggle<CR>
" - toggleterm
if has('nvim')
  nnoremap <silent><C-t> :ToggleTerm<CR>
  " === coc ===
  " No line break on Enter in completion candidate display
  inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : '<CR>'
  " Select a candidate for completion by Tab/Shift-Tab
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction
  inoremap <silent><expr> <TAB>  coc#pum#visible() ? coc#pum#next(1): <SID>check_back_space() ? '<Tab>'  : coc#refresh()
  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : '<S-Tab>'
  " Others
  nnoremap <silent>H : <C-u>call CocAction('doHover') <CR>
  nnoremap <silent>df  <Plug>(coc-definition)
  nnoremap <silent>rf  <Plug>(coc-references)
  nnoremap <silent>rn  <Plug>(coc-rename)
  nnoremap <silent>fmt <Plug>(coc-format)
  nnoremap <silent>mne <Plug>(coc-diagnostic-next-error)
  nnoremap <silent>mpe <Plug>(coc-diagnostic-prev-error)
endif


" #####################
" ####  settings  #####
" #####################
colorscheme molokai
" - rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'separately': {
\       'cmake': 0,
\   }
\}
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
  " - coc.nvim
  let g:coc_global_extensions = [
      \'coc-lists',
      \'coc-snippets',
      \'coc-jedi',
      \]
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
