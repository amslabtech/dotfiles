set runtimepath+=~/.vim,~/.vim/after
source ~/.vimrc

lua << END
-- lualine
require'lualine'.setup { options = { theme = 'carbonfox' } }
-- bufferline
require'bufferline'.setup {  }
-- mini.indentscope
require'mini.indentscope'.setup { symbol = '▏' }
-- toggleterm
require'toggleterm'.setup {  }
END
