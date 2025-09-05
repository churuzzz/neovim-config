require('plugins')
require('settings')
-- require('lsp-configs')

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
  ]])
