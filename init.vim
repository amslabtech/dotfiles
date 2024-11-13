source ~/.vim/basic-settings.vim

" Automatic vim-plug installation
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Run :PlugInstall if any plugins are missing
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Plugin
call plug#begin('~/.local/share/nvim/plugged')
source ~/.vim/plugins.vim
call plug#end()
source ~/.vim/plugin-settings.vim

lua << END
-- lualine
require'lualine'.setup {
  options = {
    theme = 'carbonfox',
    path = 2
  }
}
-- bufferline
require'bufferline'.setup {
  options = {
    max_name_length = 30,
    hover = {
      enabled = true,
      delay = 0,
      reveal = {'close'}
    },
  }
}
-- mini.indentscope
require'mini.indentscope'.setup { symbol = '▏' }
-- toggleterm
require'toggleterm'.setup {  }
if vim.fn.has('nvim-0.9') == 1 then
  -- gitsigns
  require'gitsigns'.setup {  }
end
END
